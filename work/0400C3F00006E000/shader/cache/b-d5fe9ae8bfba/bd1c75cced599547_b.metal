#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct dm_border_t { uint mask; float4 k[32]; };
static inline __attribute__((always_inline)) float4 dm_bmix(float4 r, float4 w, float4 k) { return r + (w - r) * k; }
static inline __attribute__((always_inline)) float dm_bmix(float r, float w, float4 k) { return r + (w - r) * k.x; }
template<typename V, typename T, typename... A> static inline __attribute__((always_inline)) V dm_bs(V r, constant dm_border_t* b, uint i, T t, sampler w, A... a)
{
    if (b->mask >> i & 1u) r = dm_bmix(r, t.sample(w, a...), b->k[i]);
    return r;
}

struct _10
{
    uint _m0;
    uint _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _16* vp_c8 [[id(0)]];
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c9 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture3d<float> vp_t_tcb_32 [[id(6)]];
    sampler vp_t_tcb_32Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_30 [[id(8)]];
    sampler vp_t_tcb_30Smplr [[id(9)]];
    texture2d<float> vp_t_tcb_1C [[id(10)]];
    sampler vp_t_tcb_1CSmplr [[id(11)]];
    sampler vp_t_tcb_32Smplr_w [[id(12)]];
    sampler vp_t_tcb_30Smplr_w [[id(13)]];
    sampler vp_t_tcb_1CSmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_58 [[user(locn0)]];
    float4 m_62 [[user(locn1)]];
    float4 m_64 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_60 [[user(locn4)]];
    float4 m_66 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_51 [[attribute(4)]];
    float4 m_53 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1429 = false;
    bool _669 = false;
    bool _263 = false;
    bool _161 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _80 = in.m_44.w;
    float _82 = trunc(_80);
    int _85 = int(_82);
    bool _89 = _85 >= 1;
    float _91 = 0.0;
    if (!_89)
    {
        _91 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _93 = _91;
    float _95 = _93;
    if (!_89)
    {
        out.m_47.x = 0.0;
    }
    int _97 = 0;
    if (!_89)
    {
        float _99 = _93 * 5.0;
        _97 = as_type<int>(_99);
    }
    int _101 = _97;
    int _103 = _101;
    if (!_89)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2143 = as_type<float>(_101);
        out.gl_Position.z = _2143;
    }
    if (!_89)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _105 = in.m_49.w;
    bool _107 = _105 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _109 = isnan(_105);
    bool _111 = _107 || _109;
    bool _113 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _115 = _111 || _113;
    float _117 = -_105;
    float _119 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_115)
    {
        float _121 = float(_85);
        _95 = _121;
    }
    float _123 = _95;
    bool _125 = _119 >= _123;
    bool _127 = !_115;
    bool _129 = _125 || _127;
    float _131 = _123;
    if (_129)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _131;
    if (_129)
    {
        out.m_47.x = 0.0;
    }
    if (_129)
    {
        float _135 = _133 * 5.0;
        _103 = as_type<int>(_135);
    }
    int _137 = _103;
    if (_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2212 = as_type<float>(_137);
        out.gl_Position.z = _2212;
    }
    if (_129)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _139 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _141 = !_139;
    float _159;
    if (!_141)
    {
        float _143 = in.m_51.x;
        float _145 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _147 = _143 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _149 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _151 = _149 * _145;
        float _153 = floor(_151);
        float _155 = -_153;
        float _157 = _151 + _155;
        _159 = _157;
        _161 = true;
    }
    else
    {
        float _163 = float(_85);
        float _165 = 1.0 / _163;
        float _167 = _119 * _165;
        _159 = _167;
    }
    _161 = false;
    float _169 = _159;
    float _171 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _173 = _169 + _171;
    bool _175 = _169 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _177 = isnan(_169);
    bool _179 = _175 || _177;
    bool _181 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _183 = _179 || _181;
    float _185 = float(_183);
    float _187 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _189 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _187;
    float _191 = -_185;
    float _193 = _191 + 1.0;
    bool _195 = _169 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _197 = isnan(_169);
    bool _199 = _195 || _197;
    bool _201 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _203 = _199 || _201;
    float _205 = float(_203);
    float _207 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _209 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _207;
    bool _211 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _213 = 1.0 / _189;
    float _215 = _205 * _193;
    float _217 = -_205;
    float _219 = _217 + 1.0;
    float _221 = _173 * _213;
    float _223 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _225 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _223;
    float _227 = fma(_209, _221, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _229 = fma(_225, _221, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _231 = _227 * _215;
    float _233 = _229 * _215;
    float _235 = fma(_219, (*spvDescriptorSet0.vp_c9)._m0[143].x, _231);
    float _237 = fma(_219, (*spvDescriptorSet0.vp_c9)._m0[143].y, _233);
    float _239 = fma(_185, (*spvDescriptorSet0.vp_c9)._m0[144].x, _235);
    float _241 = fma(_185, (*spvDescriptorSet0.vp_c9)._m0[144].y, _237);
    bool _243 = !_211;
    float _261;
    if (!_243)
    {
        float _245 = in.m_51.x;
        float _247 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _249 = _245 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _251 = fma(_249, (*spvDescriptorSet0.vp_c9)._m0[11].x, _119);
        float _253 = _251 * _247;
        float _255 = floor(_253);
        float _257 = -_255;
        float _259 = _253 + _257;
        _261 = _259;
        _263 = true;
    }
    else
    {
        float _265 = float(_85);
        float _267 = 1.0 / _265;
        float _269 = _119 * _267;
        _261 = _269;
    }
    _263 = false;
    float _271 = _261;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _275 = _271 + _273;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _279 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _277;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _283 = _281 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _287 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _285;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _291 = _289 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _293 = 1.0 / _279;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _297 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _295;
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _301 = _299 + (*spvDescriptorSet0.vp_c9)._m0[113].w;
    float _303 = 1.0 / _283;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _307 = _271 + _305;
    bool _309 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _311 = isnan(_271);
    bool _313 = _309 || _311;
    bool _315 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _317 = _313 || _315;
    float _319 = float(_317);
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _323 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _321;
    bool _325 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _327 = isnan(_271);
    bool _329 = _325 || _327;
    bool _331 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _333 = _329 || _331;
    float _335 = float(_333);
    float _337 = 1.0 / _287;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _341 = _271 + _339;
    float _343 = _307 * _293;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _347 = _271 + _345;
    bool _349 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _351 = isnan(_271);
    bool _353 = _349 || _351;
    bool _355 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _357 = _353 || _355;
    float _359 = float(_357);
    float _361 = 1.0 / _291;
    float _363 = _341 * _303;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _367 = _271 + _365;
    float _369 = fma(_323, _343, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _373 = _371 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    bool _375 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _377 = 1.0 / _297;
    float _379 = _347 * _337;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _383 = _271 + _381;
    float _385 = 1.0 / _301;
    float _387 = _367 * _361;
    bool _389 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[113].w;
    bool _391 = isnan(_271);
    bool _393 = _389 || _391;
    bool _395 = isnan((*spvDescriptorSet0.vp_c9)._m0[113].w);
    bool _397 = _393 || _395;
    float _399 = float(_397);
    float _401 = -_359;
    float _403 = _401 + 1.0;
    float _405 = -_399;
    float _407 = _405 + 1.0;
    float _409 = _275 * _377;
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _413 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _411;
    float _415 = _359 * _407;
    float _417 = fma(_413, _343, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _419 = _319 * _403;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _423 = _421 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _425 = _383 * _385;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _429 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _427;
    bool _431 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _433 = isnan(_271);
    bool _435 = _431 || _433;
    bool _437 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _439 = _435 || _437;
    float _441 = float(_439);
    float _443 = fma(_423, _363, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _445 = fma(_429, _343, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    bool _447 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _449 = isnan(_271);
    bool _451 = _447 || _449;
    bool _453 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _455 = _451 || _453;
    float _457 = float(_455);
    float _459 = -_319;
    float _461 = _459 + 1.0;
    bool _463 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _465 = isnan(_271);
    bool _467 = _463 || _465;
    bool _469 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _471 = _467 || _469;
    float _473 = float(_471);
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _477 = _475 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _479 = -_457;
    float _481 = _479 + 1.0;
    float _483 = _457 * _461;
    float _485 = -_473;
    float _487 = _485 + 1.0;
    float _489 = fma(_373, _363, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _491 = _335 * _481;
    float _493 = -_335;
    float _495 = _493 + 1.0;
    float _497 = _441 * _487;
    float _499 = fma(_477, _363, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _503 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _501;
    float _505 = _473 * _495;
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _509 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _507;
    float _511 = _417 * _497;
    float _513 = _445 * _497;
    float _515 = _369 * _497;
    float _517 = -_441;
    float _519 = _517 + 1.0;
    float _521 = fma(_509, _379, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _525 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _523;
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _529 = _527 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _531 = fma(_519, (*spvDescriptorSet0.vp_c9)._m0[107].x, _511);
    float _533 = fma(_519, (*spvDescriptorSet0.vp_c9)._m0[107].y, _513);
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _537 = _535 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _541 = _539 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _543 = fma(_525, _379, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _545 = fma(_519, (*spvDescriptorSet0.vp_c9)._m0[107].z, _515);
    float _547 = fma(_489, _505, _531);
    float _549 = fma(_499, _505, _533);
    float _551 = fma(_529, _387, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _553 = fma(_537, _387, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _555 = fma(_541, _387, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _557 = in.m_53.x;
    float _559 = in.m_53.y;
    float _561 = fma(_503, _379, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _563 = fma(_443, _505, _545);
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _567 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _565;
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _571 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _569;
    float _573 = fma(_521, _491, _547);
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _577 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _575;
    float _579 = fma(_561, _491, _549);
    float _581 = fma(_543, _491, _563);
    float _583 = fma(_567, _409, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _585 = fma(_571, _409, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _587 = fma(_577, _409, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _589 = fma(_551, _483, _573);
    float _591 = fma(_553, _483, _579);
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[112].x;
    float _595 = _593 + (*spvDescriptorSet0.vp_c9)._m0[113].x;
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[112].y;
    float _599 = _597 + (*spvDescriptorSet0.vp_c9)._m0[113].y;
    float _601 = -(*spvDescriptorSet0.vp_c9)._m0[112].z;
    float _603 = _601 + (*spvDescriptorSet0.vp_c9)._m0[113].z;
    float _605 = fma(_555, _483, _581);
    float _607 = fma(_595, _425, (*spvDescriptorSet0.vp_c9)._m0[112].x);
    float _609 = fma(_599, _425, (*spvDescriptorSet0.vp_c9)._m0[112].y);
    float _611 = fma(_603, _425, (*spvDescriptorSet0.vp_c9)._m0[112].z);
    float _613 = fma(_583, _419, _589);
    float _615 = fma(_585, _419, _591);
    float _617 = fma(_587, _419, _605);
    float _619 = _241 * _559;
    float _621 = fma(_607, _415, _613);
    float _623 = fma(_609, _415, _615);
    float _625 = fma(_611, _415, _617);
    float _627 = _239 * _557;
    float _629 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[113].x, _621);
    float _631 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[113].y, _623);
    float _633 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[113].z, _625);
    float _635 = _629 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _637 = _631 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _639 = _633 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _641 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _643 = _635 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _645 = _637 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _647 = _639 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _649 = !_375;
    float _667;
    if (!_649)
    {
        float _651 = in.m_51.x;
        float _653 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _655 = _651 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _657 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[11].z, _119);
        float _659 = _657 * _653;
        float _661 = floor(_659);
        float _663 = -_661;
        float _665 = _659 + _663;
        _667 = _665;
        _669 = true;
    }
    else
    {
        float _671 = float(_85);
        float _673 = 1.0 / _671;
        float _675 = _119 * _673;
        _667 = _675;
    }
    _669 = false;
    float _677 = _667;
    float _679 = in.m_51.x;
    float _681 = in.m_51.y;
    float _683 = _627 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _685 = as_type<float>(int(gl_VertexIndex));
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _689 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _687;
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _693 = _691 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _695 = in.m_44.x;
    float _697 = in.m_44.y;
    float _699 = in.m_44.z;
    float _701 = 1.0 / _689;
    float _703 = 1.0 / _693;
    bool _705 = _679 > 0.5;
    bool _707 = _681 > 0.5;
    int _709 = as_type<int>(_685) & 1;
    bool _711 = _709 != 0;
    int _713 = as_type<int>(_685) & 2;
    bool _715 = _713 != 0;
    float _717 = _697 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _719 = _697 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _721 = _697 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _723 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _725 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _723;
    float _727 = fma(_695, (*spvDescriptorSet0.vp_c10)._m0[4].x, _717);
    float _729 = fma(_695, (*spvDescriptorSet0.vp_c10)._m0[5].x, _719);
    float _731 = fma(_695, (*spvDescriptorSet0.vp_c10)._m0[6].x, _721);
    float _733 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _735 = _733 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _737 = 1.0 / _725;
    float _739 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    int _741 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _743 = _741 != 0;
    float _745 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _747 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _749 = _747 != 0;
    float _751 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _739);
    float _753 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    float _755 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _745);
    float _757 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _759 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _757;
    float _761 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _763 = _761 + (*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _765 = (*spvDescriptorSet0.vp_c8)._m0[1].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _767 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _753);
    float _769 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _771 = _677 + _769;
    float _773 = 1.0 / _735;
    float _775 = fma((*spvDescriptorSet0.vp_c8)._m0[1].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _765);
    float _777 = _771 * _703;
    float _779 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _781 = _677 + _779;
    float _783 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _785 = _677 + _783;
    float _787 = fma(_699, (*spvDescriptorSet0.vp_c10)._m0[5].z, _729);
    float _789 = 1.0 / _759;
    float _791 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _793 = _677 + _791;
    float _795 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _767);
    float _797 = fma(_699, (*spvDescriptorSet0.vp_c10)._m0[4].z, _727);
    float _799 = _785 * _737;
    float _801 = _793 * _701;
    float _803 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _751);
    float _805 = sqrt(_795);
    float _807 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _809 = _677 + _807;
    float _811 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _813 = _677 + _811;
    float _815 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _755);
    float _817 = _797 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _819 = _813 * _773;
    float _821 = sqrt(_803);
    float _823 = _781 * _789;
    float _825 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _827 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _825;
    float _829 = 1.0 / _763;
    float _831 = fma(_699, (*spvDescriptorSet0.vp_c10)._m0[6].z, _731);
    float _833 = _787 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _835 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _837 = _835 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _839 = _831 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _841 = -(*spvDescriptorSet0.vp_c9)._m0[128].z;
    float _843 = _841 + (*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _845 = fma(_821, _821, _815);
    float _847 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _849 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _847;
    float _851 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _853 = _851 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _855 = fma(_837, _777, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _857 = fma(_805, _805, _845);
    float _859 = _833 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _861 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _863 = _861 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _865 = fma(_849, _801, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _867 = _809 * _829;
    float _869 = sqrt(_857);
    float _871 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[1].x, _859);
    float _873 = fma(_863, _777, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _875 = fma(_853, _777, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _877 = fma((*spvDescriptorSet0.vp_c8)._m0[1].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _775);
    float _879 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _881 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _879;
    float _883 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _885 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _883;
    float _887 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[1].z, _871);
    float _889 = fma(_881, _801, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _891 = fma(_885, _801, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _893 = -_877;
    float _895 = _887 + _893;
    float _897 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _899 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _897;
    float _901 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _903 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _901;
    float _905 = -_839;
    float _907 = _905 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _909 = _869 * 1.730000019073486328125;
    float _911 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _913 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _911;
    float _915 = fma(_869, 0.8650000095367431640625, _895);
    float _917 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _919 = _917 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _921 = 1.0 / _909;
    float _923 = fma(_913, _799, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _925 = -_833;
    float _927 = _925 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _929 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _931 = _929 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _933 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _935 = _933 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _937 = -_817;
    float _939 = _937 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _941 = _927 * _927;
    float _943 = fma(_899, _799, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _945 = fma(_903, _799, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _947 = fma(_931, _819, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _949 = fma(_939, _939, _941);
    float _951 = _619 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _953 = fma(_919, _819, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _955 = fma(_935, _819, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _957 = fma(_907, _907, _949);
    bool _959 = !_715;
    float _961 = _959 ? (-0.5) : 0.5;
    float _963 = _915 * _921;
    float _965 = precise::clamp(_963, 0.0, 1.0);
    float _967 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _969 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _967;
    float _971 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _973 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _971;
    float _975 = rsqrt(_957);
    bool _977 = !_711;
    float _979 = _977 ? (-0.5) : 0.5;
    float _981 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _961);
    float _983 = _965 * _965;
    float _985 = fma(_969, _823, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    bool _987 = _677 >= (*spvDescriptorSet0.vp_c9)._m0[129].w;
    bool _989 = isnan(_677);
    bool _991 = _987 || _989;
    bool _993 = isnan((*spvDescriptorSet0.vp_c9)._m0[129].w);
    bool _995 = _991 || _993;
    float _997 = float(_995);
    float _999 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _979);
    float _1001 = _983 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _1003 = fma(_843, _867, (*spvDescriptorSet0.vp_c9)._m0[128].z);
    float _1005 = fma(_973, _823, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _1007 = fma(_827, _823, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _1009 = _951 * _981;
    float _1011 = _683 * _999;
    float _1013 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    bool _1015 = _677 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _1017 = isnan(_677);
    bool _1019 = _1015 || _1017;
    bool _1021 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _1023 = _1019 || _1021;
    float _1025 = float(_1023);
    float _1027 = _1009 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1029 = _1009 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1031 = -_1001;
    float _1033 = _975 * _1031;
    float _1035 = -_997;
    float _1037 = _1035 + 1.0;
    float _1039 = fma(_1011, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1027);
    float _1041 = fma(_1011, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1029);
    bool _1043 = _677 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1045 = isnan(_677);
    bool _1047 = _1043 || _1045;
    bool _1049 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1051 = _1047 || _1049;
    float _1053 = float(_1051);
    float _1055 = _1025 * _1037;
    float _1057 = fma(_1013, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1039);
    float _1059 = fma(_1013, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1041);
    float _1061 = -_1025;
    float _1063 = _1061 + 1.0;
    bool _1065 = _677 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1067 = isnan(_677);
    bool _1069 = _1065 || _1067;
    bool _1071 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1073 = _1069 || _1071;
    float _1075 = float(_1073);
    float _1077 = _1057 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1079 = _1059 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1081 = -_1053;
    float _1083 = _1081 + 1.0;
    float _1085 = _1053 * _1063;
    float _1087 = _817 + _1077;
    float _1089 = _839 + _1079;
    bool _1091 = _677 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1093 = isnan(_677);
    bool _1095 = _1091 || _1093;
    bool _1097 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1099 = _1095 || _1097;
    float _1101 = float(_1099);
    float _1103 = _1075 * _1083;
    float _1105 = fma(_939, _1033, _1087);
    float _1107 = fma(_907, _1033, _1089);
    float _1109 = -_1075;
    float _1111 = _1109 + 1.0;
    float _1113 = -(*spvDescriptorSet0.vp_c9)._m0[128].y;
    float _1115 = _1113 + (*spvDescriptorSet0.vp_c9)._m0[129].y;
    float _1117 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1119 = _1105 + _1117;
    float _1121 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1123 = _1107 + _1121;
    float _1125 = _1101 * _1111;
    float _1127 = -_1101;
    float _1129 = _1127 + 1.0;
    float _1131 = -(*spvDescriptorSet0.vp_c9)._m0[128].x;
    float _1133 = _1131 + (*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _1135 = _1119 * _1119;
    float _1137 = _1123 * _1123;
    bool _1139 = _677 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1141 = isnan(_677);
    bool _1143 = _1139 || _1141;
    bool _1145 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1147 = _1143 || _1145;
    float _1149 = float(_1147);
    float _1151 = fma(_1133, _867, (*spvDescriptorSet0.vp_c9)._m0[128].x);
    bool _1153 = _677 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1155 = isnan(_677);
    bool _1157 = _1153 || _1155;
    bool _1159 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1161 = _1157 || _1159;
    float _1163 = float(_1161);
    float _1165 = _1135 + _1137;
    float _1167 = fma(_1115, _867, (*spvDescriptorSet0.vp_c9)._m0[128].y);
    float _1169 = _1149 * _1129;
    float _1171 = -_1149;
    float _1173 = _1171 + 1.0;
    float _1175 = sqrt(_1165);
    float _1177 = _1009 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1179 = -_979;
    int _1181 = _705 ? as_type<int>(_1179) : as_type<int>(_979);
    float _1183 = _1163 * _1173;
    float _1185 = -_1163;
    float _1187 = _1185 + 1.0;
    float _1189 = fma(_1011, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1177);
    float _1191 = -_961;
    int _1193 = _707 ? as_type<int>(_1191) : as_type<int>(_961);
    float _1195 = _865 * _1183;
    float _1197 = _891 * _1183;
    float _1199 = _889 * _1183;
    float _1201 = fma(_1013, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1189);
    float _1203 = fma(_1187, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1195);
    float _1205 = fma(_1187, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1197);
    float _1207 = fma(_1187, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1199);
    float _1209 = _1201 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1211 = fma(_873, _1169, _1203);
    bool _1213 = _1175 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1215 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1217 = fma(_855, _1169, _1207);
    float _1219 = fma(_943, _1125, _1211);
    float _1221 = _833 + _1209;
    float _1223 = fma(_875, _1169, _1205);
    float _1225 = fma(_923, _1125, _1217);
    float _1227 = fma(_953, _1103, _1219);
    float _1229 = fma(_927, _1033, _1221);
    float _1231 = fma(_945, _1125, _1223);
    bool _1233 = !_743;
    float _1235 = _1233 ? _979 : as_type<float>(_1181);
    float _1237 = fma(_947, _1103, _1225);
    bool _1239 = !_749;
    float _1241 = _1239 ? _961 : as_type<float>(_1193);
    float _1243 = fma(_955, _1103, _1231);
    float _1245 = fma(_985, _1085, _1227);
    float _1247 = _1209;
    float _1249 = _1135;
    float _1251 = _1137;
    float _1253 = _1105;
    float _1255 = _1107;
    float _1257 = _1165;
    float _1259 = _1231;
    if (!_1213)
    {
        _1247 = _1229;
    }
    float _1261 = _1247;
    bool _1263 = !_1213;
    float _1265 = _1261;
    if (!_1263)
    {
        float _1267 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1269 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1271 = _1175 + _1269;
        float _1273 = _1229 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1275 = rsqrt(_1165);
        float _1277 = _1271 * _1267;
        float _1279 = _1277 * 0.15915493667125701904296875;
        float _1281 = _1279 * 6.283185482025146484375;
        float _1283 = sin(_1281);
        float _1285 = _1279 * 6.283185482025146484375;
        float _1287 = cos(_1285);
        float _1289 = fma(_1283, _1273, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1291 = _1275 * _1289;
        float _1293 = _1287 + (-1.0);
        float _1295 = fma(_1119, _1291, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1297 = fma(_1123, _1291, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1299 = _1293 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1301 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1303 = _1295 + _1301;
        float _1305 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1307 = _1297 + _1305;
        float _1309 = fma(_1229, _1287, _1299);
        float _1311 = _1303 * _1303;
        float _1313 = _1307 * _1307;
        _1265 = _1309;
        _1249 = _1311;
        _1251 = _1313;
        _1253 = _1295;
        _1255 = _1297;
        _1257 = _1275;
    }
    float _1315 = _1265;
    float _1317 = _1249;
    float _1319 = _1251;
    float _1321 = _1253;
    float _1323 = _1255;
    float _1325 = _1257;
    float _1327 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1329 = _1315 + _1327;
    float _1331 = fma(_1005, _1085, _1237);
    float _1333 = fma(_1007, _1085, _1243);
    float _1335 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1337 = fma(_1329, _1329, _1317);
    float _1339 = fma(_1151, _1055, _1245);
    float _1341 = fma(_1167, _1055, _1331);
    float _1343 = fma(_1003, _1055, _1333);
    float _1345 = _1337 + _1319;
    float _1347 = _1235 + 0.5;
    float _1349 = -_1241;
    float _1351 = _1349 + 0.5;
    float _1353 = fma(_997, (*spvDescriptorSet0.vp_c9)._m0[129].x, _1339);
    float _1355 = fma(_997, (*spvDescriptorSet0.vp_c9)._m0[129].y, _1341);
    float _1357 = fma(_997, (*spvDescriptorSet0.vp_c9)._m0[129].z, _1343);
    float _1359 = sqrt(_1345);
    float _1361 = _1347 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1363 = _1351 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1365 = _1353 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1367 = _1355 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1369 = _1357 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1371 = _1361 * _1215;
    float _1373 = _1363 * _1335;
    float _1375 = _1365 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1377 = _1367 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1379 = _1369 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_58.x = _643;
    out.m_58.y = _645;
    out.m_58.z = _647;
    out.m_58.w = _641;
    out.m_60.x = _1371;
    out.m_60.y = _1373;
    bool _1381 = _1359 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1383 = isnan(_1359);
    bool _1385 = _1381 || _1383;
    bool _1387 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1389 = _1385 || _1387;
    out.m_62.x = _1375;
    out.m_62.y = _1377;
    out.m_62.z = _1379;
    float _1391 = _1367;
    float _1393 = _1325;
    if (!_1389)
    {
        _1391 = 1.0;
    }
    float _1395 = _1391;
    bool _1397 = !_1389;
    float _1399 = _1395;
    if (!_1397)
    {
        bool _1401 = _1359 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1403 = isnan(_1359);
        bool _1405 = _1401 || _1403;
        bool _1407 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1409 = _1405 || _1407;
        if (!_1409)
        {
            float _1411 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1413 = _1359 + _1411;
            float _1415 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1417 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1415;
            float _1419 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1421 = _1419 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1423 = 1.0 / _1417;
            float _1425 = _1413 * _1423;
            float _1427 = fma(_1425, _1421, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1399 = _1427;
            _1429 = true;
        }
        else
        {
            bool _1431 = _1359 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1433 = isnan(_1359);
            bool _1435 = _1431 || _1433;
            bool _1437 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1439 = _1435 || _1437;
            if (!_1439)
            {
                float _1441 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1443 = _1359 + _1441;
                float _1445 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1447 = _1445 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1449 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1451 = _1449 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1453 = 1.0 / _1447;
                float _1455 = _1443 * _1453;
                float _1457 = fma(_1455, _1451, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1399 = _1457;
                _1429 = true;
            }
            else
            {
                _1399 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1429 = false;
    float _1459 = _1399;
    float _1461 = _833 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1463 = _833 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1465 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1467 = _1321 + _1465;
    float _1469 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1471 = _1315 + _1469;
    float _1473 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1461);
    float _1475 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1463);
    float _1477 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1479 = _1323 + _1477;
    float _1481 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1473);
    float _1483 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1475);
    bool _1485 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1487 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1489 = _1485 || _1487;
    bool _1491 = isnan(0.5);
    bool _1493 = _1489 || _1491;
    float _1495 = fma(_1467, _1459, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1497 = _1481 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1499 = _1483 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1501 = fma(_1471, _1459, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1503 = 1.0 / _1497;
    float _1505 = _1499 + _1497;
    bool _1507 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1509 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1511 = _1507 || _1509;
    bool _1513 = isnan(0.5);
    bool _1515 = _1511 || _1513;
    float _1517 = fma(_1479, _1459, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1519 = _1505 * 0.5;
    float _1521 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1523 = _1497;
    float _1525 = _1459;
    float _1527 = _1519;
    if (_1493)
    {
        _1521 = _1501;
    }
    float _1529 = _1521;
    float _1531 = _1519 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _1533 = _1529;
    if (_1493)
    {
        _1523 = _1517;
    }
    float _1535 = _1523;
    float _1537 = _1535;
    if (_1515)
    {
        _1525 = 1.0;
    }
    float _1539 = _1525;
    float _1541 = -(*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _1543 = fma(_1531, _1503, _1541);
    float _1545 = _1519 + _1543;
    float _1547 = _1539;
    float _1549 = _1503;
    if (_1493)
    {
        _1527 = _1495;
    }
    float _1551 = _1527;
    float _1553 = _1551;
    if (!_1493)
    {
        float _1555 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1557 = _833 + _1555;
        float _1559 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1561 = _817 + _1559;
        float _1563 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1565 = _1557 * _1557;
        float _1567 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1569 = _839 + _1567;
        float _1571 = fma(_1561, _1561, _1565);
        float _1573 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1575 = fma(_1569, _1569, _1571);
        float _1577 = sqrt(_1575);
        float _1579 = _1563 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1581 = -_839;
        float _1583 = _1581 + _1517;
        float _1585 = precise::min(_1577, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1587 = _1585 * _1573;
        float _1589 = -_817;
        float _1591 = _1589 + _1495;
        float _1593 = -_833;
        float _1595 = _1593 + _1501;
        float _1597 = _1579 * _1587;
        float _1599 = fma(_1591, _1597, _817);
        float _1601 = fma(_1595, _1597, _833);
        float _1603 = fma(_1583, _1597, _839);
        _1533 = _1601;
        _1553 = _1599;
        _1537 = _1603;
        _1393 = _1597;
    }
    float _1605 = _1533;
    float _1607 = _1553;
    float _1609 = _1537;
    float _1611 = _1393;
    float _1613 = _1545 * _1503;
    float _1615 = _1611;
    if (!_1515)
    {
        float _1617 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1619 = _1617 * 0.15915493667125701904296875;
        float _1621 = _1619 * 6.283185482025146484375;
        float _1623 = cos(_1621);
        float _1625 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1627 = _1625 * 0.15915493667125701904296875;
        float _1629 = _1619 * 6.283185482025146484375;
        float _1631 = sin(_1629);
        float _1633 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1635 = fma(_1613, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1633);
        float _1637 = 1.0 / _1623;
        float _1639 = _1627 * 6.283185482025146484375;
        float _1641 = cos(_1639);
        float _1643 = _1631 * _1637;
        float _1645 = 1.0 / _1635;
        float _1647 = _1641 * _1643;
        float _1649 = _1627 * 6.283185482025146484375;
        float _1651 = sin(_1649);
        float _1653 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1655 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1653;
        float _1657 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1659 = _1645 * _1657;
        float _1661 = 1.0 / _1647;
        float _1663 = 1.0 / _1655;
        float _1665 = _1651 * _1661;
        float _1667 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1669 = fma(_1665, _1659, _1667);
        float _1671 = _1669 * _1663;
        float _1673 = precise::clamp(_1671, 0.0, 1.0);
        _1615 = _1627;
        _1547 = _1673;
    }
    float _1675 = _1615;
    float _1677 = _1547;
    float _1679 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1681 = _1605 + _1679;
    float _1683 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1685 = _1607 + _1683;
    float _1687 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1689 = _1609 + _1687;
    float _1691 = _1681 * _1681;
    float _1693 = fma(_1685, _1685, _1691);
    float _1695 = fma(_1689, _1689, _1693);
    float _1697 = rsqrt(_1695);
    float _1699 = _1697 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1701 = _1685 * _1699;
    float _1703 = _1689 * _1699;
    float _1705 = _1701 * _1701;
    float _1707 = _1703 * _1703;
    float _1709 = _1705 + _1707;
    float _1711 = sqrt(_1709);
    bool _1713 = _1711 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1715 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1717 = _1711 + _1715;
    float _1719 = _1689;
    float _1721 = _1675;
    float _1723 = _1717;
    float _1725 = _1701;
    if (_1713)
    {
        float _1727 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1719 = _1727;
    }
    float _1729 = _1719;
    if (_1713)
    {
        float _1731 = rsqrt(_1709);
        _1721 = _1731;
    }
    float _1733 = _1721;
    float _1735 = _1733;
    if (_1713)
    {
        float _1737 = _1717 * _1729;
        _1723 = _1737;
    }
    float _1739 = _1723;
    if (_1713)
    {
        float _1741 = _1739 * 0.15915493667125701904296875;
        _1549 = _1741;
    }
    float _1743 = _1549;
    float _1745 = _1697;
    if (_1713)
    {
        float _1747 = _1743 * 6.283185482025146484375;
        float _1749 = sin(_1747);
        _1745 = _1749;
    }
    float _1751 = _1745;
    float _1753 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1755 = precise::max(0.0, _1753);
    float _1757 = _1691;
    float _1759 = _1755;
    float _1761 = _1753;
    if (_1713)
    {
        float _1763 = _1743 * 6.283185482025146484375;
        float _1765 = cos(_1763);
        _1757 = _1765;
    }
    float _1767 = _1757;
    float _1769 = -_1699;
    float _1771 = -_1755;
    float _1773 = fma(_1681, _1769, _1771);
    if (_1713)
    {
        float _1775 = _1773 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1759 = _1775;
    }
    float _1777 = _1759;
    float _1779 = sqrt(_1695);
    float _1781 = _1777;
    float _1783 = _1751;
    if (_1713)
    {
        float _1785 = fma(_1751, _1777, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1781 = _1785;
    }
    float _1787 = _1781;
    float _1789 = _1787;
    if (!_1713)
    {
        _1783 = _1703;
    }
    float _1791 = _1783;
    float _1793 = _1791;
    if (_1713)
    {
        float _1795 = _1767 + (-1.0);
        _1761 = _1795;
    }
    float _1797 = _1761;
    float _1799 = _1797;
    if (_1713)
    {
        float _1801 = _1733 * _1787;
        _1259 = _1801;
    }
    float _1803 = _1259;
    if (!_1713)
    {
        _1735 = _1773;
    }
    float _1805 = _1735;
    float _1807 = _1605 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1809 = _1805;
    if (_1713)
    {
        float _1811 = _1797 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1799 = _1811;
    }
    float _1813 = _1799;
    float _1815 = _1813;
    if (_1713)
    {
        float _1817 = _1701 * _1803;
        _1725 = _1817;
    }
    float _1819 = _1725;
    if (!_1713)
    {
        _1789 = _1705;
    }
    float _1821 = _1789;
    float _1823 = _1821;
    if (_1713)
    {
        float _1825 = _1703 * _1803;
        _1793 = _1825;
    }
    float _1827 = _1793;
    if (_1713)
    {
        float _1829 = fma(_1773, _1767, _1813);
        _1809 = _1829;
    }
    float _1831 = _1809;
    if (_1713)
    {
        float _1833 = _1819 * _1819;
        _1823 = _1833;
    }
    float _1835 = _1823;
    if (!_1713)
    {
        _1815 = _1707;
    }
    float _1837 = _1815;
    float _1839 = _1837;
    if (_1713)
    {
        float _1841 = _1827 * _1827;
        _1839 = _1841;
    }
    float _1843 = _1839;
    float _1845 = fma(_1831, _1831, _1835);
    float _1847 = _1845 + _1843;
    float _1849 = _1605 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1851 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1853 = fma(_1779, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1851);
    float _1855 = precise::clamp(_1853, 0.0, 1.0);
    float _1857 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1859 = rsqrt(_1847);
    float _1861 = fma(_1607, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1849);
    float _1863 = _1605 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1865 = -_1855;
    float _1867 = _1865 + 1.0;
    float _1869 = _1605 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1871 = fma(_1609, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1861);
    float _1873 = fma(_1607, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1863);
    float _1875 = fma(_1607, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1869);
    float _1877 = abs(_1867);
    float _1879 = log2(_1877);
    float _1881 = fma(_1609, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1873);
    float _1883 = fma(_1607, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1807);
    float _1885 = fma(_1609, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1875);
    float _1887 = _1871 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1889 = _1881 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1891 = fma(_1609, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1883);
    float _1893 = _1859 * _1819;
    float _1895 = _1885 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1897 = _1889 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1899 = _1859 * _1831;
    float _1901 = _1893 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1903 = _1887 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1905 = fma(_1895, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1897);
    float _1907 = _1859 * _1827;
    float _1909 = -_1901;
    float _1911 = fma(_1899, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1909);
    float _1913 = -_1903;
    float _1915 = fma(_1913, _1857, 1.0);
    float _1917 = _1891 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1919 = fma(_1887, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1905);
    float _1921 = -_1907;
    float _1923 = fma(_1921, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1911);
    float _1925 = _1879 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1927 = _1889 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1929 = fma(_1917, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1919);
    float _1931 = fma(_1923, -0.5, 0.5);
    float _1933 = exp2(_1925);
    float _1935 = _1889 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1937 = fma(_1895, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1927);
    float _1939 = fma(_1923, 0.5, 0.5);
    float _1941 = fma(_1895, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1935);
    float _1943 = fma(_1887, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1937);
    float _1945 = fma(_1939, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1947 = log2(_1915);
    float _1949 = fma(_1887, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1941);
    float _1951 = _1899 + 1.0;
    float _1953 = fma(_1917, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1943);
    float _1955 = fma(_1939, _1945, -0.212114393711090087890625);
    float _1957 = fma(_1917, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1949);
    float _1959 = 1.0 / _1929;
    float _1961 = -_1899;
    float _1963 = fma(_1933, _1951, _1961);
    float _1965 = fma(_1939, _1955, 1.570728778839111328125);
    float _1967 = fma(_1963, 0.5, 0.5);
    float _1969 = sqrt(_1931);
    float _1971 = _1947 * 0.693147182464599609375;
    float _1973 = _1953 * _1959;
    float _1975 = _1957 * _1959;
    float _1977 = _1971 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1979 = fma(_1973, 0.5, 0.5);
    float _1981 = fma(_1975, -0.5, 0.5);
    float _1983 = _1969 * 0.636619746685028076171875;
    float3 _5297 = float3(_1979, _1981, _1977);
    float _1985 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5297, float3(0.0), isnan(_5297)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5297, float3(0.0), isnan(_5297)), level(0.0)).x;
    float3 _5308 = float3(_1979, _1981, _1977);
    float4 _1988 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5308, float3(0.0), isnan(_5308)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5308, float3(0.0), isnan(_5308)), level(0.0)).xyzw;
    float _1990 = _1988.x;
    float _1992 = _1988.y;
    float _1994 = _1988.z;
    float _1996 = _1988.w;
    float _1998 = -_1965;
    float _2000 = fma(_1983, _1998, 1.0);
    float2 _5330 = float2(_2000, _1967);
    float3 _2004 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5330, float2(0.0), isnan(_5330)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5330, float2(0.0), isnan(_5330)), level(0.0)).xyz;
    float _2006 = _2004.x;
    float _2008 = _2004.y;
    float _2010 = _2004.z;
    float _2012 = _1887 + (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _2014 = _1889 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2016 = _1677 > 0.0;
    bool _2018 = isnan(_1677);
    bool _2020 = _2016 || _2018;
    bool _2022 = isnan(0.0);
    bool _2024 = _2020 || _2022;
    float _2026 = fma(_2012, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1905);
    float _2028 = _1879 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2030 = fma(_1895, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2014);
    float _2032 = _1929 * 0.5;
    float _2034 = fma(_1917, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2026);
    float _2036 = fma(_2012, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2030);
    float _2038 = exp2(_2028);
    float _2040 = _1677 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2042 = fma(_1917, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2036);
    float _2044 = _2040 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2046 = 1.0 / _2034;
    out.m_47.x = _2044;
    float _2048 = _2042 * _2046;
    float _2050 = _1953 + _1929;
    float _2052 = fma(_1957, -0.5, _2032);
    float _2054 = _1929 * _2048;
    float _2056 = _2050 * 0.5;
    float _2058 = -_2038;
    float _2060 = _2058 + 1.0;
    float _2062 = _1929 + _2054;
    out.gl_Position.x = _1953;
    out.gl_Position.y = _1957;
    out.gl_Position.z = _2054;
    out.gl_Position.w = _1929;
    float _2064 = _2060 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2066 = _2062 * 0.5;
    out.m_64.x = _2056;
    out.m_64.y = _2052;
    out.m_64.z = _2066;
    out.m_64.w = _1929;
    float _2068 = _2064 * _1985;
    float _2070 = -_2064;
    float _2072 = _2070 + 1.0;
    float _2074 = _1996 * _2068;
    float _2076 = _1996 * _2072;
    float _2078 = _2010 * _2068;
    float _2080 = fma(_2006, _2074, _1990);
    float _2082 = fma(_2008, _2074, _1992);
    float _2084 = fma(_1996, _2078, _1994);
    out.m_66.x = _2080;
    out.m_66.y = _2082;
    out.m_66.z = _2084;
    out.m_66.w = _2076;
    if (_2024)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _2086 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2086;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1429 = false;
    bool _669 = false;
    bool _263 = false;
    bool _161 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _80 = in.m_44.w;
    float _82 = trunc(_80);
    int _85 = int(_82);
    bool _89 = _85 >= 1;
    float _91 = 0.0;
    if (!_89)
    {
        _91 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _93 = _91;
    float _95 = _93;
    if (!_89)
    {
        out.m_47.x = 0.0;
    }
    int _97 = 0;
    if (!_89)
    {
        float _99 = _93 * 5.0;
        _97 = as_type<int>(_99);
    }
    int _101 = _97;
    int _103 = _101;
    if (!_89)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2143 = as_type<float>(_101);
        out.gl_Position.z = _2143;
    }
    if (!_89)
    {
        return out;
    }
    float _105 = in.m_49.w;
    bool _107 = _105 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _109 = isnan(_105);
    bool _111 = _107 || _109;
    bool _113 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _115 = _111 || _113;
    float _117 = -_105;
    float _119 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_115)
    {
        float _121 = float(_85);
        _95 = _121;
    }
    float _123 = _95;
    bool _125 = _119 >= _123;
    bool _127 = !_115;
    bool _129 = _125 || _127;
    float _131 = _123;
    if (_129)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _131;
    if (_129)
    {
        out.m_47.x = 0.0;
    }
    if (_129)
    {
        float _135 = _133 * 5.0;
        _103 = as_type<int>(_135);
    }
    int _137 = _103;
    if (_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2212 = as_type<float>(_137);
        out.gl_Position.z = _2212;
    }
    if (_129)
    {
        return out;
    }
    bool _139 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _141 = !_139;
    float _159;
    if (!_141)
    {
        float _143 = in.m_51.x;
        float _145 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _147 = _143 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _149 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _151 = _149 * _145;
        float _153 = floor(_151);
        float _155 = -_153;
        float _157 = _151 + _155;
        _159 = _157;
        _161 = true;
    }
    else
    {
        float _163 = float(_85);
        float _165 = 1.0 / _163;
        float _167 = _119 * _165;
        _159 = _167;
    }
    _161 = false;
    float _169 = _159;
    float _171 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _173 = _169 + _171;
    bool _175 = _169 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _177 = isnan(_169);
    bool _179 = _175 || _177;
    bool _181 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _183 = _179 || _181;
    float _185 = float(_183);
    float _187 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _189 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _187;
    float _191 = -_185;
    float _193 = _191 + 1.0;
    bool _195 = _169 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _197 = isnan(_169);
    bool _199 = _195 || _197;
    bool _201 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _203 = _199 || _201;
    float _205 = float(_203);
    float _207 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _209 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _207;
    bool _211 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _213 = 1.0 / _189;
    float _215 = _205 * _193;
    float _217 = -_205;
    float _219 = _217 + 1.0;
    float _221 = _173 * _213;
    float _223 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _225 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _223;
    float _227 = fma(_209, _221, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _229 = fma(_225, _221, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _231 = _227 * _215;
    float _233 = _229 * _215;
    float _235 = fma(_219, (*spvDescriptorSet0.vp_c9)._m0[143].x, _231);
    float _237 = fma(_219, (*spvDescriptorSet0.vp_c9)._m0[143].y, _233);
    float _239 = fma(_185, (*spvDescriptorSet0.vp_c9)._m0[144].x, _235);
    float _241 = fma(_185, (*spvDescriptorSet0.vp_c9)._m0[144].y, _237);
    bool _243 = !_211;
    float _261;
    if (!_243)
    {
        float _245 = in.m_51.x;
        float _247 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _249 = _245 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _251 = fma(_249, (*spvDescriptorSet0.vp_c9)._m0[11].x, _119);
        float _253 = _251 * _247;
        float _255 = floor(_253);
        float _257 = -_255;
        float _259 = _253 + _257;
        _261 = _259;
        _263 = true;
    }
    else
    {
        float _265 = float(_85);
        float _267 = 1.0 / _265;
        float _269 = _119 * _267;
        _261 = _269;
    }
    _263 = false;
    float _271 = _261;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _275 = _271 + _273;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _279 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _277;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _283 = _281 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _287 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _285;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _291 = _289 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _293 = 1.0 / _279;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _297 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _295;
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _301 = _299 + (*spvDescriptorSet0.vp_c9)._m0[113].w;
    float _303 = 1.0 / _283;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _307 = _271 + _305;
    bool _309 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _311 = isnan(_271);
    bool _313 = _309 || _311;
    bool _315 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _317 = _313 || _315;
    float _319 = float(_317);
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _323 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _321;
    bool _325 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _327 = isnan(_271);
    bool _329 = _325 || _327;
    bool _331 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _333 = _329 || _331;
    float _335 = float(_333);
    float _337 = 1.0 / _287;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _341 = _271 + _339;
    float _343 = _307 * _293;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _347 = _271 + _345;
    bool _349 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _351 = isnan(_271);
    bool _353 = _349 || _351;
    bool _355 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _357 = _353 || _355;
    float _359 = float(_357);
    float _361 = 1.0 / _291;
    float _363 = _341 * _303;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _367 = _271 + _365;
    float _369 = fma(_323, _343, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _373 = _371 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    bool _375 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _377 = 1.0 / _297;
    float _379 = _347 * _337;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _383 = _271 + _381;
    float _385 = 1.0 / _301;
    float _387 = _367 * _361;
    bool _389 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[113].w;
    bool _391 = isnan(_271);
    bool _393 = _389 || _391;
    bool _395 = isnan((*spvDescriptorSet0.vp_c9)._m0[113].w);
    bool _397 = _393 || _395;
    float _399 = float(_397);
    float _401 = -_359;
    float _403 = _401 + 1.0;
    float _405 = -_399;
    float _407 = _405 + 1.0;
    float _409 = _275 * _377;
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _413 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _411;
    float _415 = _359 * _407;
    float _417 = fma(_413, _343, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _419 = _319 * _403;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _423 = _421 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _425 = _383 * _385;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _429 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _427;
    bool _431 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _433 = isnan(_271);
    bool _435 = _431 || _433;
    bool _437 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _439 = _435 || _437;
    float _441 = float(_439);
    float _443 = fma(_423, _363, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _445 = fma(_429, _343, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    bool _447 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _449 = isnan(_271);
    bool _451 = _447 || _449;
    bool _453 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _455 = _451 || _453;
    float _457 = float(_455);
    float _459 = -_319;
    float _461 = _459 + 1.0;
    bool _463 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _465 = isnan(_271);
    bool _467 = _463 || _465;
    bool _469 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _471 = _467 || _469;
    float _473 = float(_471);
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _477 = _475 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _479 = -_457;
    float _481 = _479 + 1.0;
    float _483 = _457 * _461;
    float _485 = -_473;
    float _487 = _485 + 1.0;
    float _489 = fma(_373, _363, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _491 = _335 * _481;
    float _493 = -_335;
    float _495 = _493 + 1.0;
    float _497 = _441 * _487;
    float _499 = fma(_477, _363, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _503 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _501;
    float _505 = _473 * _495;
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _509 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _507;
    float _511 = _417 * _497;
    float _513 = _445 * _497;
    float _515 = _369 * _497;
    float _517 = -_441;
    float _519 = _517 + 1.0;
    float _521 = fma(_509, _379, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _525 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _523;
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _529 = _527 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _531 = fma(_519, (*spvDescriptorSet0.vp_c9)._m0[107].x, _511);
    float _533 = fma(_519, (*spvDescriptorSet0.vp_c9)._m0[107].y, _513);
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _537 = _535 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _541 = _539 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _543 = fma(_525, _379, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _545 = fma(_519, (*spvDescriptorSet0.vp_c9)._m0[107].z, _515);
    float _547 = fma(_489, _505, _531);
    float _549 = fma(_499, _505, _533);
    float _551 = fma(_529, _387, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _553 = fma(_537, _387, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _555 = fma(_541, _387, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _557 = in.m_53.x;
    float _559 = in.m_53.y;
    float _561 = fma(_503, _379, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _563 = fma(_443, _505, _545);
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _567 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _565;
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _571 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _569;
    float _573 = fma(_521, _491, _547);
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _577 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _575;
    float _579 = fma(_561, _491, _549);
    float _581 = fma(_543, _491, _563);
    float _583 = fma(_567, _409, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _585 = fma(_571, _409, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _587 = fma(_577, _409, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _589 = fma(_551, _483, _573);
    float _591 = fma(_553, _483, _579);
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[112].x;
    float _595 = _593 + (*spvDescriptorSet0.vp_c9)._m0[113].x;
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[112].y;
    float _599 = _597 + (*spvDescriptorSet0.vp_c9)._m0[113].y;
    float _601 = -(*spvDescriptorSet0.vp_c9)._m0[112].z;
    float _603 = _601 + (*spvDescriptorSet0.vp_c9)._m0[113].z;
    float _605 = fma(_555, _483, _581);
    float _607 = fma(_595, _425, (*spvDescriptorSet0.vp_c9)._m0[112].x);
    float _609 = fma(_599, _425, (*spvDescriptorSet0.vp_c9)._m0[112].y);
    float _611 = fma(_603, _425, (*spvDescriptorSet0.vp_c9)._m0[112].z);
    float _613 = fma(_583, _419, _589);
    float _615 = fma(_585, _419, _591);
    float _617 = fma(_587, _419, _605);
    float _619 = _241 * _559;
    float _621 = fma(_607, _415, _613);
    float _623 = fma(_609, _415, _615);
    float _625 = fma(_611, _415, _617);
    float _627 = _239 * _557;
    float _629 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[113].x, _621);
    float _631 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[113].y, _623);
    float _633 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[113].z, _625);
    float _635 = _629 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _637 = _631 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _639 = _633 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _641 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _643 = _635 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _645 = _637 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _647 = _639 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _649 = !_375;
    float _667;
    if (!_649)
    {
        float _651 = in.m_51.x;
        float _653 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _655 = _651 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _657 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[11].z, _119);
        float _659 = _657 * _653;
        float _661 = floor(_659);
        float _663 = -_661;
        float _665 = _659 + _663;
        _667 = _665;
        _669 = true;
    }
    else
    {
        float _671 = float(_85);
        float _673 = 1.0 / _671;
        float _675 = _119 * _673;
        _667 = _675;
    }
    _669 = false;
    float _677 = _667;
    float _679 = in.m_51.x;
    float _681 = in.m_51.y;
    float _683 = _627 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _685 = as_type<float>(int(gl_VertexIndex));
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _689 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _687;
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _693 = _691 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _695 = in.m_44.x;
    float _697 = in.m_44.y;
    float _699 = in.m_44.z;
    float _701 = 1.0 / _689;
    float _703 = 1.0 / _693;
    bool _705 = _679 > 0.5;
    bool _707 = _681 > 0.5;
    int _709 = as_type<int>(_685) & 1;
    bool _711 = _709 != 0;
    int _713 = as_type<int>(_685) & 2;
    bool _715 = _713 != 0;
    float _717 = _697 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _719 = _697 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _721 = _697 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _723 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _725 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _723;
    float _727 = fma(_695, (*spvDescriptorSet0.vp_c10)._m0[4].x, _717);
    float _729 = fma(_695, (*spvDescriptorSet0.vp_c10)._m0[5].x, _719);
    float _731 = fma(_695, (*spvDescriptorSet0.vp_c10)._m0[6].x, _721);
    float _733 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _735 = _733 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _737 = 1.0 / _725;
    float _739 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    int _741 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _743 = _741 != 0;
    float _745 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _747 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _749 = _747 != 0;
    float _751 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _739);
    float _753 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    float _755 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _745);
    float _757 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _759 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _757;
    float _761 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _763 = _761 + (*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _765 = (*spvDescriptorSet0.vp_c8)._m0[1].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _767 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _753);
    float _769 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _771 = _677 + _769;
    float _773 = 1.0 / _735;
    float _775 = fma((*spvDescriptorSet0.vp_c8)._m0[1].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _765);
    float _777 = _771 * _703;
    float _779 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _781 = _677 + _779;
    float _783 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _785 = _677 + _783;
    float _787 = fma(_699, (*spvDescriptorSet0.vp_c10)._m0[5].z, _729);
    float _789 = 1.0 / _759;
    float _791 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _793 = _677 + _791;
    float _795 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _767);
    float _797 = fma(_699, (*spvDescriptorSet0.vp_c10)._m0[4].z, _727);
    float _799 = _785 * _737;
    float _801 = _793 * _701;
    float _803 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _751);
    float _805 = sqrt(_795);
    float _807 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _809 = _677 + _807;
    float _811 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _813 = _677 + _811;
    float _815 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _755);
    float _817 = _797 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _819 = _813 * _773;
    float _821 = sqrt(_803);
    float _823 = _781 * _789;
    float _825 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _827 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _825;
    float _829 = 1.0 / _763;
    float _831 = fma(_699, (*spvDescriptorSet0.vp_c10)._m0[6].z, _731);
    float _833 = _787 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _835 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _837 = _835 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _839 = _831 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _841 = -(*spvDescriptorSet0.vp_c9)._m0[128].z;
    float _843 = _841 + (*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _845 = fma(_821, _821, _815);
    float _847 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _849 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _847;
    float _851 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _853 = _851 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _855 = fma(_837, _777, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _857 = fma(_805, _805, _845);
    float _859 = _833 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _861 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _863 = _861 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _865 = fma(_849, _801, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _867 = _809 * _829;
    float _869 = sqrt(_857);
    float _871 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[1].x, _859);
    float _873 = fma(_863, _777, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _875 = fma(_853, _777, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _877 = fma((*spvDescriptorSet0.vp_c8)._m0[1].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _775);
    float _879 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _881 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _879;
    float _883 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _885 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _883;
    float _887 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[1].z, _871);
    float _889 = fma(_881, _801, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _891 = fma(_885, _801, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _893 = -_877;
    float _895 = _887 + _893;
    float _897 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _899 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _897;
    float _901 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _903 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _901;
    float _905 = -_839;
    float _907 = _905 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _909 = _869 * 1.730000019073486328125;
    float _911 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _913 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _911;
    float _915 = fma(_869, 0.8650000095367431640625, _895);
    float _917 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _919 = _917 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _921 = 1.0 / _909;
    float _923 = fma(_913, _799, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _925 = -_833;
    float _927 = _925 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _929 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _931 = _929 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _933 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _935 = _933 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _937 = -_817;
    float _939 = _937 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _941 = _927 * _927;
    float _943 = fma(_899, _799, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _945 = fma(_903, _799, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _947 = fma(_931, _819, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _949 = fma(_939, _939, _941);
    float _951 = _619 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _953 = fma(_919, _819, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _955 = fma(_935, _819, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _957 = fma(_907, _907, _949);
    bool _959 = !_715;
    float _961 = _959 ? (-0.5) : 0.5;
    float _963 = _915 * _921;
    float _965 = precise::clamp(_963, 0.0, 1.0);
    float _967 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _969 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _967;
    float _971 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _973 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _971;
    float _975 = rsqrt(_957);
    bool _977 = !_711;
    float _979 = _977 ? (-0.5) : 0.5;
    float _981 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _961);
    float _983 = _965 * _965;
    float _985 = fma(_969, _823, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    bool _987 = _677 >= (*spvDescriptorSet0.vp_c9)._m0[129].w;
    bool _989 = isnan(_677);
    bool _991 = _987 || _989;
    bool _993 = isnan((*spvDescriptorSet0.vp_c9)._m0[129].w);
    bool _995 = _991 || _993;
    float _997 = float(_995);
    float _999 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _979);
    float _1001 = _983 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _1003 = fma(_843, _867, (*spvDescriptorSet0.vp_c9)._m0[128].z);
    float _1005 = fma(_973, _823, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _1007 = fma(_827, _823, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _1009 = _951 * _981;
    float _1011 = _683 * _999;
    float _1013 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    bool _1015 = _677 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _1017 = isnan(_677);
    bool _1019 = _1015 || _1017;
    bool _1021 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _1023 = _1019 || _1021;
    float _1025 = float(_1023);
    float _1027 = _1009 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1029 = _1009 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1031 = -_1001;
    float _1033 = _975 * _1031;
    float _1035 = -_997;
    float _1037 = _1035 + 1.0;
    float _1039 = fma(_1011, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1027);
    float _1041 = fma(_1011, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1029);
    bool _1043 = _677 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1045 = isnan(_677);
    bool _1047 = _1043 || _1045;
    bool _1049 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1051 = _1047 || _1049;
    float _1053 = float(_1051);
    float _1055 = _1025 * _1037;
    float _1057 = fma(_1013, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1039);
    float _1059 = fma(_1013, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1041);
    float _1061 = -_1025;
    float _1063 = _1061 + 1.0;
    bool _1065 = _677 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1067 = isnan(_677);
    bool _1069 = _1065 || _1067;
    bool _1071 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1073 = _1069 || _1071;
    float _1075 = float(_1073);
    float _1077 = _1057 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1079 = _1059 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1081 = -_1053;
    float _1083 = _1081 + 1.0;
    float _1085 = _1053 * _1063;
    float _1087 = _817 + _1077;
    float _1089 = _839 + _1079;
    bool _1091 = _677 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1093 = isnan(_677);
    bool _1095 = _1091 || _1093;
    bool _1097 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1099 = _1095 || _1097;
    float _1101 = float(_1099);
    float _1103 = _1075 * _1083;
    float _1105 = fma(_939, _1033, _1087);
    float _1107 = fma(_907, _1033, _1089);
    float _1109 = -_1075;
    float _1111 = _1109 + 1.0;
    float _1113 = -(*spvDescriptorSet0.vp_c9)._m0[128].y;
    float _1115 = _1113 + (*spvDescriptorSet0.vp_c9)._m0[129].y;
    float _1117 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1119 = _1105 + _1117;
    float _1121 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1123 = _1107 + _1121;
    float _1125 = _1101 * _1111;
    float _1127 = -_1101;
    float _1129 = _1127 + 1.0;
    float _1131 = -(*spvDescriptorSet0.vp_c9)._m0[128].x;
    float _1133 = _1131 + (*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _1135 = _1119 * _1119;
    float _1137 = _1123 * _1123;
    bool _1139 = _677 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1141 = isnan(_677);
    bool _1143 = _1139 || _1141;
    bool _1145 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1147 = _1143 || _1145;
    float _1149 = float(_1147);
    float _1151 = fma(_1133, _867, (*spvDescriptorSet0.vp_c9)._m0[128].x);
    bool _1153 = _677 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1155 = isnan(_677);
    bool _1157 = _1153 || _1155;
    bool _1159 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1161 = _1157 || _1159;
    float _1163 = float(_1161);
    float _1165 = _1135 + _1137;
    float _1167 = fma(_1115, _867, (*spvDescriptorSet0.vp_c9)._m0[128].y);
    float _1169 = _1149 * _1129;
    float _1171 = -_1149;
    float _1173 = _1171 + 1.0;
    float _1175 = sqrt(_1165);
    float _1177 = _1009 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1179 = -_979;
    int _1181 = _705 ? as_type<int>(_1179) : as_type<int>(_979);
    float _1183 = _1163 * _1173;
    float _1185 = -_1163;
    float _1187 = _1185 + 1.0;
    float _1189 = fma(_1011, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1177);
    float _1191 = -_961;
    int _1193 = _707 ? as_type<int>(_1191) : as_type<int>(_961);
    float _1195 = _865 * _1183;
    float _1197 = _891 * _1183;
    float _1199 = _889 * _1183;
    float _1201 = fma(_1013, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1189);
    float _1203 = fma(_1187, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1195);
    float _1205 = fma(_1187, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1197);
    float _1207 = fma(_1187, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1199);
    float _1209 = _1201 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1211 = fma(_873, _1169, _1203);
    bool _1213 = _1175 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1215 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1217 = fma(_855, _1169, _1207);
    float _1219 = fma(_943, _1125, _1211);
    float _1221 = _833 + _1209;
    float _1223 = fma(_875, _1169, _1205);
    float _1225 = fma(_923, _1125, _1217);
    float _1227 = fma(_953, _1103, _1219);
    float _1229 = fma(_927, _1033, _1221);
    float _1231 = fma(_945, _1125, _1223);
    bool _1233 = !_743;
    float _1235 = _1233 ? _979 : as_type<float>(_1181);
    float _1237 = fma(_947, _1103, _1225);
    bool _1239 = !_749;
    float _1241 = _1239 ? _961 : as_type<float>(_1193);
    float _1243 = fma(_955, _1103, _1231);
    float _1245 = fma(_985, _1085, _1227);
    float _1247 = _1209;
    float _1249 = _1135;
    float _1251 = _1137;
    float _1253 = _1105;
    float _1255 = _1107;
    float _1257 = _1165;
    float _1259 = _1231;
    if (!_1213)
    {
        _1247 = _1229;
    }
    float _1261 = _1247;
    bool _1263 = !_1213;
    float _1265 = _1261;
    if (!_1263)
    {
        float _1267 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1269 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1271 = _1175 + _1269;
        float _1273 = _1229 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1275 = rsqrt(_1165);
        float _1277 = _1271 * _1267;
        float _1279 = _1277 * 0.15915493667125701904296875;
        float _1281 = _1279 * 6.283185482025146484375;
        float _1283 = sin(_1281);
        float _1285 = _1279 * 6.283185482025146484375;
        float _1287 = cos(_1285);
        float _1289 = fma(_1283, _1273, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1291 = _1275 * _1289;
        float _1293 = _1287 + (-1.0);
        float _1295 = fma(_1119, _1291, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1297 = fma(_1123, _1291, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1299 = _1293 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1301 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1303 = _1295 + _1301;
        float _1305 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1307 = _1297 + _1305;
        float _1309 = fma(_1229, _1287, _1299);
        float _1311 = _1303 * _1303;
        float _1313 = _1307 * _1307;
        _1265 = _1309;
        _1249 = _1311;
        _1251 = _1313;
        _1253 = _1295;
        _1255 = _1297;
        _1257 = _1275;
    }
    float _1315 = _1265;
    float _1317 = _1249;
    float _1319 = _1251;
    float _1321 = _1253;
    float _1323 = _1255;
    float _1325 = _1257;
    float _1327 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1329 = _1315 + _1327;
    float _1331 = fma(_1005, _1085, _1237);
    float _1333 = fma(_1007, _1085, _1243);
    float _1335 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1337 = fma(_1329, _1329, _1317);
    float _1339 = fma(_1151, _1055, _1245);
    float _1341 = fma(_1167, _1055, _1331);
    float _1343 = fma(_1003, _1055, _1333);
    float _1345 = _1337 + _1319;
    float _1347 = _1235 + 0.5;
    float _1349 = -_1241;
    float _1351 = _1349 + 0.5;
    float _1353 = fma(_997, (*spvDescriptorSet0.vp_c9)._m0[129].x, _1339);
    float _1355 = fma(_997, (*spvDescriptorSet0.vp_c9)._m0[129].y, _1341);
    float _1357 = fma(_997, (*spvDescriptorSet0.vp_c9)._m0[129].z, _1343);
    float _1359 = sqrt(_1345);
    float _1361 = _1347 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1363 = _1351 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1365 = _1353 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1367 = _1355 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1369 = _1357 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1371 = _1361 * _1215;
    float _1373 = _1363 * _1335;
    float _1375 = _1365 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1377 = _1367 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1379 = _1369 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_58.x = _643;
    out.m_58.y = _645;
    out.m_58.z = _647;
    out.m_58.w = _641;
    out.m_60.x = _1371;
    out.m_60.y = _1373;
    bool _1381 = _1359 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1383 = isnan(_1359);
    bool _1385 = _1381 || _1383;
    bool _1387 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1389 = _1385 || _1387;
    out.m_62.x = _1375;
    out.m_62.y = _1377;
    out.m_62.z = _1379;
    float _1391 = _1367;
    float _1393 = _1325;
    if (!_1389)
    {
        _1391 = 1.0;
    }
    float _1395 = _1391;
    bool _1397 = !_1389;
    float _1399 = _1395;
    if (!_1397)
    {
        bool _1401 = _1359 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1403 = isnan(_1359);
        bool _1405 = _1401 || _1403;
        bool _1407 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1409 = _1405 || _1407;
        if (!_1409)
        {
            float _1411 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1413 = _1359 + _1411;
            float _1415 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1417 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1415;
            float _1419 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1421 = _1419 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1423 = 1.0 / _1417;
            float _1425 = _1413 * _1423;
            float _1427 = fma(_1425, _1421, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1399 = _1427;
            _1429 = true;
        }
        else
        {
            bool _1431 = _1359 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1433 = isnan(_1359);
            bool _1435 = _1431 || _1433;
            bool _1437 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1439 = _1435 || _1437;
            if (!_1439)
            {
                float _1441 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1443 = _1359 + _1441;
                float _1445 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1447 = _1445 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1449 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1451 = _1449 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1453 = 1.0 / _1447;
                float _1455 = _1443 * _1453;
                float _1457 = fma(_1455, _1451, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1399 = _1457;
                _1429 = true;
            }
            else
            {
                _1399 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1429 = false;
    float _1459 = _1399;
    float _1461 = _833 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1463 = _833 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1465 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1467 = _1321 + _1465;
    float _1469 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1471 = _1315 + _1469;
    float _1473 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1461);
    float _1475 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1463);
    float _1477 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1479 = _1323 + _1477;
    float _1481 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1473);
    float _1483 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1475);
    bool _1485 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1487 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1489 = _1485 || _1487;
    bool _1491 = isnan(0.5);
    bool _1493 = _1489 || _1491;
    float _1495 = fma(_1467, _1459, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1497 = _1481 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1499 = _1483 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1501 = fma(_1471, _1459, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1503 = 1.0 / _1497;
    float _1505 = _1499 + _1497;
    bool _1507 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1509 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1511 = _1507 || _1509;
    bool _1513 = isnan(0.5);
    bool _1515 = _1511 || _1513;
    float _1517 = fma(_1479, _1459, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1519 = _1505 * 0.5;
    float _1521 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1523 = _1497;
    float _1525 = _1459;
    float _1527 = _1519;
    if (_1493)
    {
        _1521 = _1501;
    }
    float _1529 = _1521;
    float _1531 = _1519 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _1533 = _1529;
    if (_1493)
    {
        _1523 = _1517;
    }
    float _1535 = _1523;
    float _1537 = _1535;
    if (_1515)
    {
        _1525 = 1.0;
    }
    float _1539 = _1525;
    float _1541 = -(*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _1543 = fma(_1531, _1503, _1541);
    float _1545 = _1519 + _1543;
    float _1547 = _1539;
    float _1549 = _1503;
    if (_1493)
    {
        _1527 = _1495;
    }
    float _1551 = _1527;
    float _1553 = _1551;
    if (!_1493)
    {
        float _1555 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1557 = _833 + _1555;
        float _1559 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1561 = _817 + _1559;
        float _1563 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1565 = _1557 * _1557;
        float _1567 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1569 = _839 + _1567;
        float _1571 = fma(_1561, _1561, _1565);
        float _1573 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1575 = fma(_1569, _1569, _1571);
        float _1577 = sqrt(_1575);
        float _1579 = _1563 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1581 = -_839;
        float _1583 = _1581 + _1517;
        float _1585 = precise::min(_1577, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1587 = _1585 * _1573;
        float _1589 = -_817;
        float _1591 = _1589 + _1495;
        float _1593 = -_833;
        float _1595 = _1593 + _1501;
        float _1597 = _1579 * _1587;
        float _1599 = fma(_1591, _1597, _817);
        float _1601 = fma(_1595, _1597, _833);
        float _1603 = fma(_1583, _1597, _839);
        _1533 = _1601;
        _1553 = _1599;
        _1537 = _1603;
        _1393 = _1597;
    }
    float _1605 = _1533;
    float _1607 = _1553;
    float _1609 = _1537;
    float _1611 = _1393;
    float _1613 = _1545 * _1503;
    float _1615 = _1611;
    if (!_1515)
    {
        float _1617 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1619 = _1617 * 0.15915493667125701904296875;
        float _1621 = _1619 * 6.283185482025146484375;
        float _1623 = cos(_1621);
        float _1625 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1627 = _1625 * 0.15915493667125701904296875;
        float _1629 = _1619 * 6.283185482025146484375;
        float _1631 = sin(_1629);
        float _1633 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1635 = fma(_1613, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1633);
        float _1637 = 1.0 / _1623;
        float _1639 = _1627 * 6.283185482025146484375;
        float _1641 = cos(_1639);
        float _1643 = _1631 * _1637;
        float _1645 = 1.0 / _1635;
        float _1647 = _1641 * _1643;
        float _1649 = _1627 * 6.283185482025146484375;
        float _1651 = sin(_1649);
        float _1653 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1655 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1653;
        float _1657 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1659 = _1645 * _1657;
        float _1661 = 1.0 / _1647;
        float _1663 = 1.0 / _1655;
        float _1665 = _1651 * _1661;
        float _1667 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1669 = fma(_1665, _1659, _1667);
        float _1671 = _1669 * _1663;
        float _1673 = precise::clamp(_1671, 0.0, 1.0);
        _1615 = _1627;
        _1547 = _1673;
    }
    float _1675 = _1615;
    float _1677 = _1547;
    float _1679 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1681 = _1605 + _1679;
    float _1683 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1685 = _1607 + _1683;
    float _1687 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1689 = _1609 + _1687;
    float _1691 = _1681 * _1681;
    float _1693 = fma(_1685, _1685, _1691);
    float _1695 = fma(_1689, _1689, _1693);
    float _1697 = rsqrt(_1695);
    float _1699 = _1697 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1701 = _1685 * _1699;
    float _1703 = _1689 * _1699;
    float _1705 = _1701 * _1701;
    float _1707 = _1703 * _1703;
    float _1709 = _1705 + _1707;
    float _1711 = sqrt(_1709);
    bool _1713 = _1711 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1715 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1717 = _1711 + _1715;
    float _1719 = _1689;
    float _1721 = _1675;
    float _1723 = _1717;
    float _1725 = _1701;
    if (_1713)
    {
        float _1727 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1719 = _1727;
    }
    float _1729 = _1719;
    if (_1713)
    {
        float _1731 = rsqrt(_1709);
        _1721 = _1731;
    }
    float _1733 = _1721;
    float _1735 = _1733;
    if (_1713)
    {
        float _1737 = _1717 * _1729;
        _1723 = _1737;
    }
    float _1739 = _1723;
    if (_1713)
    {
        float _1741 = _1739 * 0.15915493667125701904296875;
        _1549 = _1741;
    }
    float _1743 = _1549;
    float _1745 = _1697;
    if (_1713)
    {
        float _1747 = _1743 * 6.283185482025146484375;
        float _1749 = sin(_1747);
        _1745 = _1749;
    }
    float _1751 = _1745;
    float _1753 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1755 = precise::max(0.0, _1753);
    float _1757 = _1691;
    float _1759 = _1755;
    float _1761 = _1753;
    if (_1713)
    {
        float _1763 = _1743 * 6.283185482025146484375;
        float _1765 = cos(_1763);
        _1757 = _1765;
    }
    float _1767 = _1757;
    float _1769 = -_1699;
    float _1771 = -_1755;
    float _1773 = fma(_1681, _1769, _1771);
    if (_1713)
    {
        float _1775 = _1773 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1759 = _1775;
    }
    float _1777 = _1759;
    float _1779 = sqrt(_1695);
    float _1781 = _1777;
    float _1783 = _1751;
    if (_1713)
    {
        float _1785 = fma(_1751, _1777, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1781 = _1785;
    }
    float _1787 = _1781;
    float _1789 = _1787;
    if (!_1713)
    {
        _1783 = _1703;
    }
    float _1791 = _1783;
    float _1793 = _1791;
    if (_1713)
    {
        float _1795 = _1767 + (-1.0);
        _1761 = _1795;
    }
    float _1797 = _1761;
    float _1799 = _1797;
    if (_1713)
    {
        float _1801 = _1733 * _1787;
        _1259 = _1801;
    }
    float _1803 = _1259;
    if (!_1713)
    {
        _1735 = _1773;
    }
    float _1805 = _1735;
    float _1807 = _1605 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1809 = _1805;
    if (_1713)
    {
        float _1811 = _1797 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1799 = _1811;
    }
    float _1813 = _1799;
    float _1815 = _1813;
    if (_1713)
    {
        float _1817 = _1701 * _1803;
        _1725 = _1817;
    }
    float _1819 = _1725;
    if (!_1713)
    {
        _1789 = _1705;
    }
    float _1821 = _1789;
    float _1823 = _1821;
    if (_1713)
    {
        float _1825 = _1703 * _1803;
        _1793 = _1825;
    }
    float _1827 = _1793;
    if (_1713)
    {
        float _1829 = fma(_1773, _1767, _1813);
        _1809 = _1829;
    }
    float _1831 = _1809;
    if (_1713)
    {
        float _1833 = _1819 * _1819;
        _1823 = _1833;
    }
    float _1835 = _1823;
    if (!_1713)
    {
        _1815 = _1707;
    }
    float _1837 = _1815;
    float _1839 = _1837;
    if (_1713)
    {
        float _1841 = _1827 * _1827;
        _1839 = _1841;
    }
    float _1843 = _1839;
    float _1845 = fma(_1831, _1831, _1835);
    float _1847 = _1845 + _1843;
    float _1849 = _1605 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1851 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1853 = fma(_1779, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1851);
    float _1855 = precise::clamp(_1853, 0.0, 1.0);
    float _1857 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1859 = rsqrt(_1847);
    float _1861 = fma(_1607, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1849);
    float _1863 = _1605 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1865 = -_1855;
    float _1867 = _1865 + 1.0;
    float _1869 = _1605 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1871 = fma(_1609, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1861);
    float _1873 = fma(_1607, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1863);
    float _1875 = fma(_1607, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1869);
    float _1877 = abs(_1867);
    float _1879 = log2(_1877);
    float _1881 = fma(_1609, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1873);
    float _1883 = fma(_1607, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1807);
    float _1885 = fma(_1609, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1875);
    float _1887 = _1871 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1889 = _1881 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1891 = fma(_1609, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1883);
    float _1893 = _1859 * _1819;
    float _1895 = _1885 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1897 = _1889 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1899 = _1859 * _1831;
    float _1901 = _1893 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1903 = _1887 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1905 = fma(_1895, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1897);
    float _1907 = _1859 * _1827;
    float _1909 = -_1901;
    float _1911 = fma(_1899, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1909);
    float _1913 = -_1903;
    float _1915 = fma(_1913, _1857, 1.0);
    float _1917 = _1891 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1919 = fma(_1887, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1905);
    float _1921 = -_1907;
    float _1923 = fma(_1921, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1911);
    float _1925 = _1879 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1927 = _1889 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1929 = fma(_1917, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1919);
    float _1931 = fma(_1923, -0.5, 0.5);
    float _1933 = exp2(_1925);
    float _1935 = _1889 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1937 = fma(_1895, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1927);
    float _1939 = fma(_1923, 0.5, 0.5);
    float _1941 = fma(_1895, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1935);
    float _1943 = fma(_1887, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1937);
    float _1945 = fma(_1939, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1947 = log2(_1915);
    float _1949 = fma(_1887, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1941);
    float _1951 = _1899 + 1.0;
    float _1953 = fma(_1917, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1943);
    float _1955 = fma(_1939, _1945, -0.212114393711090087890625);
    float _1957 = fma(_1917, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1949);
    float _1959 = 1.0 / _1929;
    float _1961 = -_1899;
    float _1963 = fma(_1933, _1951, _1961);
    float _1965 = fma(_1939, _1955, 1.570728778839111328125);
    float _1967 = fma(_1963, 0.5, 0.5);
    float _1969 = sqrt(_1931);
    float _1971 = _1947 * 0.693147182464599609375;
    float _1973 = _1953 * _1959;
    float _1975 = _1957 * _1959;
    float _1977 = _1971 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1979 = fma(_1973, 0.5, 0.5);
    float _1981 = fma(_1975, -0.5, 0.5);
    float _1983 = _1969 * 0.636619746685028076171875;
    float3 _5297 = float3(_1979, _1981, _1977);
    float _1985 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5297, float3(0.0), isnan(_5297)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5297, float3(0.0), isnan(_5297)), level(0.0)).x;
    float3 _5308 = float3(_1979, _1981, _1977);
    float4 _1988 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5308, float3(0.0), isnan(_5308)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5308, float3(0.0), isnan(_5308)), level(0.0)).xyzw;
    float _1990 = _1988.x;
    float _1992 = _1988.y;
    float _1994 = _1988.z;
    float _1996 = _1988.w;
    float _1998 = -_1965;
    float _2000 = fma(_1983, _1998, 1.0);
    float2 _5330 = float2(_2000, _1967);
    float3 _2004 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5330, float2(0.0), isnan(_5330)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5330, float2(0.0), isnan(_5330)), level(0.0)).xyz;
    float _2006 = _2004.x;
    float _2008 = _2004.y;
    float _2010 = _2004.z;
    float _2012 = _1887 + (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _2014 = _1889 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2016 = _1677 > 0.0;
    bool _2018 = isnan(_1677);
    bool _2020 = _2016 || _2018;
    bool _2022 = isnan(0.0);
    bool _2024 = _2020 || _2022;
    float _2026 = fma(_2012, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1905);
    float _2028 = _1879 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2030 = fma(_1895, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2014);
    float _2032 = _1929 * 0.5;
    float _2034 = fma(_1917, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2026);
    float _2036 = fma(_2012, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2030);
    float _2038 = exp2(_2028);
    float _2040 = _1677 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2042 = fma(_1917, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2036);
    float _2044 = _2040 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2046 = 1.0 / _2034;
    out.m_47.x = _2044;
    float _2048 = _2042 * _2046;
    float _2050 = _1953 + _1929;
    float _2052 = fma(_1957, -0.5, _2032);
    float _2054 = _1929 * _2048;
    float _2056 = _2050 * 0.5;
    float _2058 = -_2038;
    float _2060 = _2058 + 1.0;
    float _2062 = _1929 + _2054;
    out.gl_Position.x = _1953;
    out.gl_Position.y = _1957;
    out.gl_Position.z = _2054;
    out.gl_Position.w = _1929;
    float _2064 = _2060 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2066 = _2062 * 0.5;
    out.m_64.x = _2056;
    out.m_64.y = _2052;
    out.m_64.z = _2066;
    out.m_64.w = _1929;
    float _2068 = _2064 * _1985;
    float _2070 = -_2064;
    float _2072 = _2070 + 1.0;
    float _2074 = _1996 * _2068;
    float _2076 = _1996 * _2072;
    float _2078 = _2010 * _2068;
    float _2080 = fma(_2006, _2074, _1990);
    float _2082 = fma(_2008, _2074, _1992);
    float _2084 = fma(_1996, _2078, _1994);
    out.m_66.x = _2080;
    out.m_66.y = _2082;
    out.m_66.z = _2084;
    out.m_66.w = _2076;
    if (_2024)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _2086 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2086;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint dm_vid = gl_VertexIndex;
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1429 = false;
    bool _669 = false;
    bool _263 = false;
    bool _161 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _80 = in.m_44.w;
    float _82 = trunc(_80);
    int _85 = int(_82);
    bool _89 = _85 >= 1;
    float _91 = 0.0;
    if (!_89)
    {
        _91 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _93 = _91;
    float _95 = _93;
    if (!_89)
    {
        out.m_47.x = 0.0;
    }
    int _97 = 0;
    if (!_89)
    {
        float _99 = _93 * 5.0;
        _97 = as_type<int>(_99);
    }
    int _101 = _97;
    int _103 = _101;
    if (!_89)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2143 = as_type<float>(_101);
        out.gl_Position.z = _2143;
    }
    if (!_89)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _105 = in.m_49.w;
    bool _107 = _105 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _109 = isnan(_105);
    bool _111 = _107 || _109;
    bool _113 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _115 = _111 || _113;
    float _117 = -_105;
    float _119 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_115)
    {
        float _121 = float(_85);
        _95 = _121;
    }
    float _123 = _95;
    bool _125 = _119 >= _123;
    bool _127 = !_115;
    bool _129 = _125 || _127;
    float _131 = _123;
    if (_129)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _131;
    if (_129)
    {
        out.m_47.x = 0.0;
    }
    if (_129)
    {
        float _135 = _133 * 5.0;
        _103 = as_type<int>(_135);
    }
    int _137 = _103;
    if (_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2212 = as_type<float>(_137);
        out.gl_Position.z = _2212;
    }
    if (_129)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _139 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _141 = !_139;
    float _159;
    if (!_141)
    {
        float _143 = in.m_51.x;
        float _145 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _147 = _143 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _149 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _151 = _149 * _145;
        float _153 = floor(_151);
        float _155 = -_153;
        float _157 = _151 + _155;
        _159 = _157;
        _161 = true;
    }
    else
    {
        float _163 = float(_85);
        float _165 = 1.0 / _163;
        float _167 = _119 * _165;
        _159 = _167;
    }
    _161 = false;
    float _169 = _159;
    float _171 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _173 = _169 + _171;
    bool _175 = _169 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _177 = isnan(_169);
    bool _179 = _175 || _177;
    bool _181 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _183 = _179 || _181;
    float _185 = float(_183);
    float _187 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _189 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _187;
    float _191 = -_185;
    float _193 = _191 + 1.0;
    bool _195 = _169 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _197 = isnan(_169);
    bool _199 = _195 || _197;
    bool _201 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _203 = _199 || _201;
    float _205 = float(_203);
    float _207 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _209 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _207;
    bool _211 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _213 = 1.0 / _189;
    float _215 = _205 * _193;
    float _217 = -_205;
    float _219 = _217 + 1.0;
    float _221 = _173 * _213;
    float _223 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _225 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _223;
    float _227 = fma(_209, _221, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _229 = fma(_225, _221, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _231 = _227 * _215;
    float _233 = _229 * _215;
    float _235 = fma(_219, (*spvDescriptorSet0.vp_c9)._m0[143].x, _231);
    float _237 = fma(_219, (*spvDescriptorSet0.vp_c9)._m0[143].y, _233);
    float _239 = fma(_185, (*spvDescriptorSet0.vp_c9)._m0[144].x, _235);
    float _241 = fma(_185, (*spvDescriptorSet0.vp_c9)._m0[144].y, _237);
    bool _243 = !_211;
    float _261;
    if (!_243)
    {
        float _245 = in.m_51.x;
        float _247 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _249 = _245 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _251 = fma(_249, (*spvDescriptorSet0.vp_c9)._m0[11].x, _119);
        float _253 = _251 * _247;
        float _255 = floor(_253);
        float _257 = -_255;
        float _259 = _253 + _257;
        _261 = _259;
        _263 = true;
    }
    else
    {
        float _265 = float(_85);
        float _267 = 1.0 / _265;
        float _269 = _119 * _267;
        _261 = _269;
    }
    _263 = false;
    float _271 = _261;
    float _273 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _275 = _271 + _273;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _279 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _277;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _283 = _281 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _287 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _285;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _291 = _289 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _293 = 1.0 / _279;
    float _295 = -(*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _297 = (*spvDescriptorSet0.vp_c9)._m0[112].w + _295;
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _301 = _299 + (*spvDescriptorSet0.vp_c9)._m0[113].w;
    float _303 = 1.0 / _283;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _307 = _271 + _305;
    bool _309 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _311 = isnan(_271);
    bool _313 = _309 || _311;
    bool _315 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _317 = _313 || _315;
    float _319 = float(_317);
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _323 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _321;
    bool _325 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _327 = isnan(_271);
    bool _329 = _325 || _327;
    bool _331 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _333 = _329 || _331;
    float _335 = float(_333);
    float _337 = 1.0 / _287;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _341 = _271 + _339;
    float _343 = _307 * _293;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _347 = _271 + _345;
    bool _349 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[112].w;
    bool _351 = isnan(_271);
    bool _353 = _349 || _351;
    bool _355 = isnan((*spvDescriptorSet0.vp_c9)._m0[112].w);
    bool _357 = _353 || _355;
    float _359 = float(_357);
    float _361 = 1.0 / _291;
    float _363 = _341 * _303;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _367 = _271 + _365;
    float _369 = fma(_323, _343, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _373 = _371 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    bool _375 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _377 = 1.0 / _297;
    float _379 = _347 * _337;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[112].w;
    float _383 = _271 + _381;
    float _385 = 1.0 / _301;
    float _387 = _367 * _361;
    bool _389 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[113].w;
    bool _391 = isnan(_271);
    bool _393 = _389 || _391;
    bool _395 = isnan((*spvDescriptorSet0.vp_c9)._m0[113].w);
    bool _397 = _393 || _395;
    float _399 = float(_397);
    float _401 = -_359;
    float _403 = _401 + 1.0;
    float _405 = -_399;
    float _407 = _405 + 1.0;
    float _409 = _275 * _377;
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _413 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _411;
    float _415 = _359 * _407;
    float _417 = fma(_413, _343, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _419 = _319 * _403;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _423 = _421 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _425 = _383 * _385;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _429 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _427;
    bool _431 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _433 = isnan(_271);
    bool _435 = _431 || _433;
    bool _437 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _439 = _435 || _437;
    float _441 = float(_439);
    float _443 = fma(_423, _363, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _445 = fma(_429, _343, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    bool _447 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _449 = isnan(_271);
    bool _451 = _447 || _449;
    bool _453 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _455 = _451 || _453;
    float _457 = float(_455);
    float _459 = -_319;
    float _461 = _459 + 1.0;
    bool _463 = _271 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _465 = isnan(_271);
    bool _467 = _463 || _465;
    bool _469 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _471 = _467 || _469;
    float _473 = float(_471);
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _477 = _475 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _479 = -_457;
    float _481 = _479 + 1.0;
    float _483 = _457 * _461;
    float _485 = -_473;
    float _487 = _485 + 1.0;
    float _489 = fma(_373, _363, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _491 = _335 * _481;
    float _493 = -_335;
    float _495 = _493 + 1.0;
    float _497 = _441 * _487;
    float _499 = fma(_477, _363, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _503 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _501;
    float _505 = _473 * _495;
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _509 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _507;
    float _511 = _417 * _497;
    float _513 = _445 * _497;
    float _515 = _369 * _497;
    float _517 = -_441;
    float _519 = _517 + 1.0;
    float _521 = fma(_509, _379, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _525 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _523;
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _529 = _527 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _531 = fma(_519, (*spvDescriptorSet0.vp_c9)._m0[107].x, _511);
    float _533 = fma(_519, (*spvDescriptorSet0.vp_c9)._m0[107].y, _513);
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _537 = _535 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _541 = _539 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _543 = fma(_525, _379, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _545 = fma(_519, (*spvDescriptorSet0.vp_c9)._m0[107].z, _515);
    float _547 = fma(_489, _505, _531);
    float _549 = fma(_499, _505, _533);
    float _551 = fma(_529, _387, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _553 = fma(_537, _387, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _555 = fma(_541, _387, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _557 = in.m_53.x;
    float _559 = in.m_53.y;
    float _561 = fma(_503, _379, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _563 = fma(_443, _505, _545);
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _567 = (*spvDescriptorSet0.vp_c9)._m0[112].x + _565;
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _571 = (*spvDescriptorSet0.vp_c9)._m0[112].y + _569;
    float _573 = fma(_521, _491, _547);
    float _575 = -(*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _577 = (*spvDescriptorSet0.vp_c9)._m0[112].z + _575;
    float _579 = fma(_561, _491, _549);
    float _581 = fma(_543, _491, _563);
    float _583 = fma(_567, _409, (*spvDescriptorSet0.vp_c9)._m0[111].x);
    float _585 = fma(_571, _409, (*spvDescriptorSet0.vp_c9)._m0[111].y);
    float _587 = fma(_577, _409, (*spvDescriptorSet0.vp_c9)._m0[111].z);
    float _589 = fma(_551, _483, _573);
    float _591 = fma(_553, _483, _579);
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[112].x;
    float _595 = _593 + (*spvDescriptorSet0.vp_c9)._m0[113].x;
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[112].y;
    float _599 = _597 + (*spvDescriptorSet0.vp_c9)._m0[113].y;
    float _601 = -(*spvDescriptorSet0.vp_c9)._m0[112].z;
    float _603 = _601 + (*spvDescriptorSet0.vp_c9)._m0[113].z;
    float _605 = fma(_555, _483, _581);
    float _607 = fma(_595, _425, (*spvDescriptorSet0.vp_c9)._m0[112].x);
    float _609 = fma(_599, _425, (*spvDescriptorSet0.vp_c9)._m0[112].y);
    float _611 = fma(_603, _425, (*spvDescriptorSet0.vp_c9)._m0[112].z);
    float _613 = fma(_583, _419, _589);
    float _615 = fma(_585, _419, _591);
    float _617 = fma(_587, _419, _605);
    float _619 = _241 * _559;
    float _621 = fma(_607, _415, _613);
    float _623 = fma(_609, _415, _615);
    float _625 = fma(_611, _415, _617);
    float _627 = _239 * _557;
    float _629 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[113].x, _621);
    float _631 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[113].y, _623);
    float _633 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[113].z, _625);
    float _635 = _629 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _637 = _631 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _639 = _633 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _641 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _643 = _635 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _645 = _637 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _647 = _639 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _649 = !_375;
    float _667;
    if (!_649)
    {
        float _651 = in.m_51.x;
        float _653 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _655 = _651 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _657 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[11].z, _119);
        float _659 = _657 * _653;
        float _661 = floor(_659);
        float _663 = -_661;
        float _665 = _659 + _663;
        _667 = _665;
        _669 = true;
    }
    else
    {
        float _671 = float(_85);
        float _673 = 1.0 / _671;
        float _675 = _119 * _673;
        _667 = _675;
    }
    _669 = false;
    float _677 = _667;
    float _679 = in.m_51.x;
    float _681 = in.m_51.y;
    float _683 = _627 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _685 = as_type<float>(int(gl_VertexIndex));
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _689 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _687;
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _693 = _691 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _695 = in.m_44.x;
    float _697 = in.m_44.y;
    float _699 = in.m_44.z;
    float _701 = 1.0 / _689;
    float _703 = 1.0 / _693;
    bool _705 = _679 > 0.5;
    bool _707 = _681 > 0.5;
    int _709 = as_type<int>(_685) & 1;
    bool _711 = _709 != 0;
    int _713 = as_type<int>(_685) & 2;
    bool _715 = _713 != 0;
    float _717 = _697 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _719 = _697 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _721 = _697 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _723 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _725 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _723;
    float _727 = fma(_695, (*spvDescriptorSet0.vp_c10)._m0[4].x, _717);
    float _729 = fma(_695, (*spvDescriptorSet0.vp_c10)._m0[5].x, _719);
    float _731 = fma(_695, (*spvDescriptorSet0.vp_c10)._m0[6].x, _721);
    float _733 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _735 = _733 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _737 = 1.0 / _725;
    float _739 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    int _741 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _743 = _741 != 0;
    float _745 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _747 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _749 = _747 != 0;
    float _751 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _739);
    float _753 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    float _755 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _745);
    float _757 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _759 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _757;
    float _761 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _763 = _761 + (*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _765 = (*spvDescriptorSet0.vp_c8)._m0[1].y * (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _767 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _753);
    float _769 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _771 = _677 + _769;
    float _773 = 1.0 / _735;
    float _775 = fma((*spvDescriptorSet0.vp_c8)._m0[1].x, (*spvDescriptorSet0.vp_c10)._m0[8].w, _765);
    float _777 = _771 * _703;
    float _779 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _781 = _677 + _779;
    float _783 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _785 = _677 + _783;
    float _787 = fma(_699, (*spvDescriptorSet0.vp_c10)._m0[5].z, _729);
    float _789 = 1.0 / _759;
    float _791 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _793 = _677 + _791;
    float _795 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _767);
    float _797 = fma(_699, (*spvDescriptorSet0.vp_c10)._m0[4].z, _727);
    float _799 = _785 * _737;
    float _801 = _793 * _701;
    float _803 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _751);
    float _805 = sqrt(_795);
    float _807 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _809 = _677 + _807;
    float _811 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _813 = _677 + _811;
    float _815 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _755);
    float _817 = _797 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _819 = _813 * _773;
    float _821 = sqrt(_803);
    float _823 = _781 * _789;
    float _825 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _827 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _825;
    float _829 = 1.0 / _763;
    float _831 = fma(_699, (*spvDescriptorSet0.vp_c10)._m0[6].z, _731);
    float _833 = _787 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _835 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _837 = _835 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _839 = _831 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _841 = -(*spvDescriptorSet0.vp_c9)._m0[128].z;
    float _843 = _841 + (*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _845 = fma(_821, _821, _815);
    float _847 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _849 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _847;
    float _851 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _853 = _851 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _855 = fma(_837, _777, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _857 = fma(_805, _805, _845);
    float _859 = _833 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _861 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _863 = _861 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _865 = fma(_849, _801, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _867 = _809 * _829;
    float _869 = sqrt(_857);
    float _871 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[1].x, _859);
    float _873 = fma(_863, _777, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _875 = fma(_853, _777, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _877 = fma((*spvDescriptorSet0.vp_c8)._m0[1].z, (*spvDescriptorSet0.vp_c10)._m0[10].w, _775);
    float _879 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _881 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _879;
    float _883 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _885 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _883;
    float _887 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[1].z, _871);
    float _889 = fma(_881, _801, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _891 = fma(_885, _801, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _893 = -_877;
    float _895 = _887 + _893;
    float _897 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _899 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _897;
    float _901 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _903 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _901;
    float _905 = -_839;
    float _907 = _905 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _909 = _869 * 1.730000019073486328125;
    float _911 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _913 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _911;
    float _915 = fma(_869, 0.8650000095367431640625, _895);
    float _917 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _919 = _917 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _921 = 1.0 / _909;
    float _923 = fma(_913, _799, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _925 = -_833;
    float _927 = _925 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _929 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _931 = _929 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _933 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _935 = _933 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _937 = -_817;
    float _939 = _937 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _941 = _927 * _927;
    float _943 = fma(_899, _799, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _945 = fma(_903, _799, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _947 = fma(_931, _819, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _949 = fma(_939, _939, _941);
    float _951 = _619 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _953 = fma(_919, _819, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _955 = fma(_935, _819, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _957 = fma(_907, _907, _949);
    bool _959 = !_715;
    float _961 = _959 ? (-0.5) : 0.5;
    float _963 = _915 * _921;
    float _965 = precise::clamp(_963, 0.0, 1.0);
    float _967 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _969 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _967;
    float _971 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _973 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _971;
    float _975 = rsqrt(_957);
    bool _977 = !_711;
    float _979 = _977 ? (-0.5) : 0.5;
    float _981 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _961);
    float _983 = _965 * _965;
    float _985 = fma(_969, _823, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    bool _987 = _677 >= (*spvDescriptorSet0.vp_c9)._m0[129].w;
    bool _989 = isnan(_677);
    bool _991 = _987 || _989;
    bool _993 = isnan((*spvDescriptorSet0.vp_c9)._m0[129].w);
    bool _995 = _991 || _993;
    float _997 = float(_995);
    float _999 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _979);
    float _1001 = _983 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _1003 = fma(_843, _867, (*spvDescriptorSet0.vp_c9)._m0[128].z);
    float _1005 = fma(_973, _823, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _1007 = fma(_827, _823, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _1009 = _951 * _981;
    float _1011 = _683 * _999;
    float _1013 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    bool _1015 = _677 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _1017 = isnan(_677);
    bool _1019 = _1015 || _1017;
    bool _1021 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _1023 = _1019 || _1021;
    float _1025 = float(_1023);
    float _1027 = _1009 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1029 = _1009 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1031 = -_1001;
    float _1033 = _975 * _1031;
    float _1035 = -_997;
    float _1037 = _1035 + 1.0;
    float _1039 = fma(_1011, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1027);
    float _1041 = fma(_1011, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1029);
    bool _1043 = _677 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1045 = isnan(_677);
    bool _1047 = _1043 || _1045;
    bool _1049 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1051 = _1047 || _1049;
    float _1053 = float(_1051);
    float _1055 = _1025 * _1037;
    float _1057 = fma(_1013, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1039);
    float _1059 = fma(_1013, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1041);
    float _1061 = -_1025;
    float _1063 = _1061 + 1.0;
    bool _1065 = _677 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1067 = isnan(_677);
    bool _1069 = _1065 || _1067;
    bool _1071 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1073 = _1069 || _1071;
    float _1075 = float(_1073);
    float _1077 = _1057 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1079 = _1059 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1081 = -_1053;
    float _1083 = _1081 + 1.0;
    float _1085 = _1053 * _1063;
    float _1087 = _817 + _1077;
    float _1089 = _839 + _1079;
    bool _1091 = _677 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1093 = isnan(_677);
    bool _1095 = _1091 || _1093;
    bool _1097 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1099 = _1095 || _1097;
    float _1101 = float(_1099);
    float _1103 = _1075 * _1083;
    float _1105 = fma(_939, _1033, _1087);
    float _1107 = fma(_907, _1033, _1089);
    float _1109 = -_1075;
    float _1111 = _1109 + 1.0;
    float _1113 = -(*spvDescriptorSet0.vp_c9)._m0[128].y;
    float _1115 = _1113 + (*spvDescriptorSet0.vp_c9)._m0[129].y;
    float _1117 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1119 = _1105 + _1117;
    float _1121 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1123 = _1107 + _1121;
    float _1125 = _1101 * _1111;
    float _1127 = -_1101;
    float _1129 = _1127 + 1.0;
    float _1131 = -(*spvDescriptorSet0.vp_c9)._m0[128].x;
    float _1133 = _1131 + (*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _1135 = _1119 * _1119;
    float _1137 = _1123 * _1123;
    bool _1139 = _677 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1141 = isnan(_677);
    bool _1143 = _1139 || _1141;
    bool _1145 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1147 = _1143 || _1145;
    float _1149 = float(_1147);
    float _1151 = fma(_1133, _867, (*spvDescriptorSet0.vp_c9)._m0[128].x);
    bool _1153 = _677 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1155 = isnan(_677);
    bool _1157 = _1153 || _1155;
    bool _1159 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1161 = _1157 || _1159;
    float _1163 = float(_1161);
    float _1165 = _1135 + _1137;
    float _1167 = fma(_1115, _867, (*spvDescriptorSet0.vp_c9)._m0[128].y);
    float _1169 = _1149 * _1129;
    float _1171 = -_1149;
    float _1173 = _1171 + 1.0;
    float _1175 = sqrt(_1165);
    float _1177 = _1009 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1179 = -_979;
    int _1181 = _705 ? as_type<int>(_1179) : as_type<int>(_979);
    float _1183 = _1163 * _1173;
    float _1185 = -_1163;
    float _1187 = _1185 + 1.0;
    float _1189 = fma(_1011, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1177);
    float _1191 = -_961;
    int _1193 = _707 ? as_type<int>(_1191) : as_type<int>(_961);
    float _1195 = _865 * _1183;
    float _1197 = _891 * _1183;
    float _1199 = _889 * _1183;
    float _1201 = fma(_1013, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1189);
    float _1203 = fma(_1187, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1195);
    float _1205 = fma(_1187, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1197);
    float _1207 = fma(_1187, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1199);
    float _1209 = _1201 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1211 = fma(_873, _1169, _1203);
    bool _1213 = _1175 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1215 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1217 = fma(_855, _1169, _1207);
    float _1219 = fma(_943, _1125, _1211);
    float _1221 = _833 + _1209;
    float _1223 = fma(_875, _1169, _1205);
    float _1225 = fma(_923, _1125, _1217);
    float _1227 = fma(_953, _1103, _1219);
    float _1229 = fma(_927, _1033, _1221);
    float _1231 = fma(_945, _1125, _1223);
    bool _1233 = !_743;
    float _1235 = _1233 ? _979 : as_type<float>(_1181);
    float _1237 = fma(_947, _1103, _1225);
    bool _1239 = !_749;
    float _1241 = _1239 ? _961 : as_type<float>(_1193);
    float _1243 = fma(_955, _1103, _1231);
    float _1245 = fma(_985, _1085, _1227);
    float _1247 = _1209;
    float _1249 = _1135;
    float _1251 = _1137;
    float _1253 = _1105;
    float _1255 = _1107;
    float _1257 = _1165;
    float _1259 = _1231;
    if (!_1213)
    {
        _1247 = _1229;
    }
    float _1261 = _1247;
    bool _1263 = !_1213;
    float _1265 = _1261;
    if (!_1263)
    {
        float _1267 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1269 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1271 = _1175 + _1269;
        float _1273 = _1229 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1275 = rsqrt(_1165);
        float _1277 = _1271 * _1267;
        float _1279 = _1277 * 0.15915493667125701904296875;
        float _1281 = _1279 * 6.283185482025146484375;
        float _1283 = sin(_1281);
        float _1285 = _1279 * 6.283185482025146484375;
        float _1287 = cos(_1285);
        float _1289 = fma(_1283, _1273, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1291 = _1275 * _1289;
        float _1293 = _1287 + (-1.0);
        float _1295 = fma(_1119, _1291, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1297 = fma(_1123, _1291, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1299 = _1293 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1301 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1303 = _1295 + _1301;
        float _1305 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1307 = _1297 + _1305;
        float _1309 = fma(_1229, _1287, _1299);
        float _1311 = _1303 * _1303;
        float _1313 = _1307 * _1307;
        _1265 = _1309;
        _1249 = _1311;
        _1251 = _1313;
        _1253 = _1295;
        _1255 = _1297;
        _1257 = _1275;
    }
    float _1315 = _1265;
    float _1317 = _1249;
    float _1319 = _1251;
    float _1321 = _1253;
    float _1323 = _1255;
    float _1325 = _1257;
    float _1327 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1329 = _1315 + _1327;
    float _1331 = fma(_1005, _1085, _1237);
    float _1333 = fma(_1007, _1085, _1243);
    float _1335 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1337 = fma(_1329, _1329, _1317);
    float _1339 = fma(_1151, _1055, _1245);
    float _1341 = fma(_1167, _1055, _1331);
    float _1343 = fma(_1003, _1055, _1333);
    float _1345 = _1337 + _1319;
    float _1347 = _1235 + 0.5;
    float _1349 = -_1241;
    float _1351 = _1349 + 0.5;
    float _1353 = fma(_997, (*spvDescriptorSet0.vp_c9)._m0[129].x, _1339);
    float _1355 = fma(_997, (*spvDescriptorSet0.vp_c9)._m0[129].y, _1341);
    float _1357 = fma(_997, (*spvDescriptorSet0.vp_c9)._m0[129].z, _1343);
    float _1359 = sqrt(_1345);
    float _1361 = _1347 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1363 = _1351 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1365 = _1353 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1367 = _1355 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1369 = _1357 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1371 = _1361 * _1215;
    float _1373 = _1363 * _1335;
    float _1375 = _1365 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1377 = _1367 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1379 = _1369 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_58.x = _643;
    out.m_58.y = _645;
    out.m_58.z = _647;
    out.m_58.w = _641;
    out.m_60.x = _1371;
    out.m_60.y = _1373;
    bool _1381 = _1359 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1383 = isnan(_1359);
    bool _1385 = _1381 || _1383;
    bool _1387 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1389 = _1385 || _1387;
    out.m_62.x = _1375;
    out.m_62.y = _1377;
    out.m_62.z = _1379;
    float _1391 = _1367;
    float _1393 = _1325;
    if (!_1389)
    {
        _1391 = 1.0;
    }
    float _1395 = _1391;
    bool _1397 = !_1389;
    float _1399 = _1395;
    if (!_1397)
    {
        bool _1401 = _1359 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1403 = isnan(_1359);
        bool _1405 = _1401 || _1403;
        bool _1407 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1409 = _1405 || _1407;
        if (!_1409)
        {
            float _1411 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1413 = _1359 + _1411;
            float _1415 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1417 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1415;
            float _1419 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1421 = _1419 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1423 = 1.0 / _1417;
            float _1425 = _1413 * _1423;
            float _1427 = fma(_1425, _1421, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1399 = _1427;
            _1429 = true;
        }
        else
        {
            bool _1431 = _1359 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1433 = isnan(_1359);
            bool _1435 = _1431 || _1433;
            bool _1437 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1439 = _1435 || _1437;
            if (!_1439)
            {
                float _1441 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1443 = _1359 + _1441;
                float _1445 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1447 = _1445 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1449 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1451 = _1449 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1453 = 1.0 / _1447;
                float _1455 = _1443 * _1453;
                float _1457 = fma(_1455, _1451, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1399 = _1457;
                _1429 = true;
            }
            else
            {
                _1399 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1429 = false;
    float _1459 = _1399;
    float _1461 = _833 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1463 = _833 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1465 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1467 = _1321 + _1465;
    float _1469 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1471 = _1315 + _1469;
    float _1473 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1461);
    float _1475 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1463);
    float _1477 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1479 = _1323 + _1477;
    float _1481 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1473);
    float _1483 = fma(_839, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1475);
    bool _1485 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1487 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1489 = _1485 || _1487;
    bool _1491 = isnan(0.5);
    bool _1493 = _1489 || _1491;
    float _1495 = fma(_1467, _1459, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1497 = _1481 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1499 = _1483 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1501 = fma(_1471, _1459, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1503 = 1.0 / _1497;
    float _1505 = _1499 + _1497;
    bool _1507 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1509 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1511 = _1507 || _1509;
    bool _1513 = isnan(0.5);
    bool _1515 = _1511 || _1513;
    float _1517 = fma(_1479, _1459, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1519 = _1505 * 0.5;
    float _1521 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1523 = _1497;
    float _1525 = _1459;
    float _1527 = _1519;
    if (_1493)
    {
        _1521 = _1501;
    }
    float _1529 = _1521;
    float _1531 = _1519 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _1533 = _1529;
    if (_1493)
    {
        _1523 = _1517;
    }
    float _1535 = _1523;
    float _1537 = _1535;
    if (_1515)
    {
        _1525 = 1.0;
    }
    float _1539 = _1525;
    float _1541 = -(*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _1543 = fma(_1531, _1503, _1541);
    float _1545 = _1519 + _1543;
    float _1547 = _1539;
    float _1549 = _1503;
    if (_1493)
    {
        _1527 = _1495;
    }
    float _1551 = _1527;
    float _1553 = _1551;
    if (!_1493)
    {
        float _1555 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1557 = _833 + _1555;
        float _1559 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1561 = _817 + _1559;
        float _1563 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1565 = _1557 * _1557;
        float _1567 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1569 = _839 + _1567;
        float _1571 = fma(_1561, _1561, _1565);
        float _1573 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1575 = fma(_1569, _1569, _1571);
        float _1577 = sqrt(_1575);
        float _1579 = _1563 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1581 = -_839;
        float _1583 = _1581 + _1517;
        float _1585 = precise::min(_1577, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1587 = _1585 * _1573;
        float _1589 = -_817;
        float _1591 = _1589 + _1495;
        float _1593 = -_833;
        float _1595 = _1593 + _1501;
        float _1597 = _1579 * _1587;
        float _1599 = fma(_1591, _1597, _817);
        float _1601 = fma(_1595, _1597, _833);
        float _1603 = fma(_1583, _1597, _839);
        _1533 = _1601;
        _1553 = _1599;
        _1537 = _1603;
        _1393 = _1597;
    }
    float _1605 = _1533;
    float _1607 = _1553;
    float _1609 = _1537;
    float _1611 = _1393;
    float _1613 = _1545 * _1503;
    float _1615 = _1611;
    if (!_1515)
    {
        float _1617 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1619 = _1617 * 0.15915493667125701904296875;
        float _1621 = _1619 * 6.283185482025146484375;
        float _1623 = cos(_1621);
        float _1625 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1627 = _1625 * 0.15915493667125701904296875;
        float _1629 = _1619 * 6.283185482025146484375;
        float _1631 = sin(_1629);
        float _1633 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1635 = fma(_1613, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1633);
        float _1637 = 1.0 / _1623;
        float _1639 = _1627 * 6.283185482025146484375;
        float _1641 = cos(_1639);
        float _1643 = _1631 * _1637;
        float _1645 = 1.0 / _1635;
        float _1647 = _1641 * _1643;
        float _1649 = _1627 * 6.283185482025146484375;
        float _1651 = sin(_1649);
        float _1653 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1655 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1653;
        float _1657 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1659 = _1645 * _1657;
        float _1661 = 1.0 / _1647;
        float _1663 = 1.0 / _1655;
        float _1665 = _1651 * _1661;
        float _1667 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1669 = fma(_1665, _1659, _1667);
        float _1671 = _1669 * _1663;
        float _1673 = precise::clamp(_1671, 0.0, 1.0);
        _1615 = _1627;
        _1547 = _1673;
    }
    float _1675 = _1615;
    float _1677 = _1547;
    float _1679 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1681 = _1605 + _1679;
    float _1683 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1685 = _1607 + _1683;
    float _1687 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1689 = _1609 + _1687;
    float _1691 = _1681 * _1681;
    float _1693 = fma(_1685, _1685, _1691);
    float _1695 = fma(_1689, _1689, _1693);
    float _1697 = rsqrt(_1695);
    float _1699 = _1697 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1701 = _1685 * _1699;
    float _1703 = _1689 * _1699;
    float _1705 = _1701 * _1701;
    float _1707 = _1703 * _1703;
    float _1709 = _1705 + _1707;
    float _1711 = sqrt(_1709);
    bool _1713 = _1711 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1715 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1717 = _1711 + _1715;
    float _1719 = _1689;
    float _1721 = _1675;
    float _1723 = _1717;
    float _1725 = _1701;
    if (_1713)
    {
        float _1727 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1719 = _1727;
    }
    float _1729 = _1719;
    if (_1713)
    {
        float _1731 = rsqrt(_1709);
        _1721 = _1731;
    }
    float _1733 = _1721;
    float _1735 = _1733;
    if (_1713)
    {
        float _1737 = _1717 * _1729;
        _1723 = _1737;
    }
    float _1739 = _1723;
    if (_1713)
    {
        float _1741 = _1739 * 0.15915493667125701904296875;
        _1549 = _1741;
    }
    float _1743 = _1549;
    float _1745 = _1697;
    if (_1713)
    {
        float _1747 = _1743 * 6.283185482025146484375;
        float _1749 = sin(_1747);
        _1745 = _1749;
    }
    float _1751 = _1745;
    float _1753 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1755 = precise::max(0.0, _1753);
    float _1757 = _1691;
    float _1759 = _1755;
    float _1761 = _1753;
    if (_1713)
    {
        float _1763 = _1743 * 6.283185482025146484375;
        float _1765 = cos(_1763);
        _1757 = _1765;
    }
    float _1767 = _1757;
    float _1769 = -_1699;
    float _1771 = -_1755;
    float _1773 = fma(_1681, _1769, _1771);
    if (_1713)
    {
        float _1775 = _1773 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1759 = _1775;
    }
    float _1777 = _1759;
    float _1779 = sqrt(_1695);
    float _1781 = _1777;
    float _1783 = _1751;
    if (_1713)
    {
        float _1785 = fma(_1751, _1777, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1781 = _1785;
    }
    float _1787 = _1781;
    float _1789 = _1787;
    if (!_1713)
    {
        _1783 = _1703;
    }
    float _1791 = _1783;
    float _1793 = _1791;
    if (_1713)
    {
        float _1795 = _1767 + (-1.0);
        _1761 = _1795;
    }
    float _1797 = _1761;
    float _1799 = _1797;
    if (_1713)
    {
        float _1801 = _1733 * _1787;
        _1259 = _1801;
    }
    float _1803 = _1259;
    if (!_1713)
    {
        _1735 = _1773;
    }
    float _1805 = _1735;
    float _1807 = _1605 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1809 = _1805;
    if (_1713)
    {
        float _1811 = _1797 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1799 = _1811;
    }
    float _1813 = _1799;
    float _1815 = _1813;
    if (_1713)
    {
        float _1817 = _1701 * _1803;
        _1725 = _1817;
    }
    float _1819 = _1725;
    if (!_1713)
    {
        _1789 = _1705;
    }
    float _1821 = _1789;
    float _1823 = _1821;
    if (_1713)
    {
        float _1825 = _1703 * _1803;
        _1793 = _1825;
    }
    float _1827 = _1793;
    if (_1713)
    {
        float _1829 = fma(_1773, _1767, _1813);
        _1809 = _1829;
    }
    float _1831 = _1809;
    if (_1713)
    {
        float _1833 = _1819 * _1819;
        _1823 = _1833;
    }
    float _1835 = _1823;
    if (!_1713)
    {
        _1815 = _1707;
    }
    float _1837 = _1815;
    float _1839 = _1837;
    if (_1713)
    {
        float _1841 = _1827 * _1827;
        _1839 = _1841;
    }
    float _1843 = _1839;
    float _1845 = fma(_1831, _1831, _1835);
    float _1847 = _1845 + _1843;
    float _1849 = _1605 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1851 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1853 = fma(_1779, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1851);
    float _1855 = precise::clamp(_1853, 0.0, 1.0);
    float _1857 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1859 = rsqrt(_1847);
    float _1861 = fma(_1607, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1849);
    float _1863 = _1605 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1865 = -_1855;
    float _1867 = _1865 + 1.0;
    float _1869 = _1605 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1871 = fma(_1609, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1861);
    float _1873 = fma(_1607, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1863);
    float _1875 = fma(_1607, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1869);
    float _1877 = abs(_1867);
    float _1879 = log2(_1877);
    float _1881 = fma(_1609, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1873);
    float _1883 = fma(_1607, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1807);
    float _1885 = fma(_1609, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1875);
    float _1887 = _1871 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1889 = _1881 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1891 = fma(_1609, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1883);
    float _1893 = _1859 * _1819;
    float _1895 = _1885 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1897 = _1889 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1899 = _1859 * _1831;
    float _1901 = _1893 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1903 = _1887 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1905 = fma(_1895, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1897);
    float _1907 = _1859 * _1827;
    float _1909 = -_1901;
    float _1911 = fma(_1899, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1909);
    float _1913 = -_1903;
    float _1915 = fma(_1913, _1857, 1.0);
    float _1917 = _1891 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1919 = fma(_1887, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1905);
    float _1921 = -_1907;
    float _1923 = fma(_1921, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1911);
    float _1925 = _1879 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1927 = _1889 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1929 = fma(_1917, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1919);
    float _1931 = fma(_1923, -0.5, 0.5);
    float _1933 = exp2(_1925);
    float _1935 = _1889 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1937 = fma(_1895, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1927);
    float _1939 = fma(_1923, 0.5, 0.5);
    float _1941 = fma(_1895, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1935);
    float _1943 = fma(_1887, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1937);
    float _1945 = fma(_1939, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1947 = log2(_1915);
    float _1949 = fma(_1887, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1941);
    float _1951 = _1899 + 1.0;
    float _1953 = fma(_1917, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1943);
    float _1955 = fma(_1939, _1945, -0.212114393711090087890625);
    float _1957 = fma(_1917, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1949);
    float _1959 = 1.0 / _1929;
    float _1961 = -_1899;
    float _1963 = fma(_1933, _1951, _1961);
    float _1965 = fma(_1939, _1955, 1.570728778839111328125);
    float _1967 = fma(_1963, 0.5, 0.5);
    float _1969 = sqrt(_1931);
    float _1971 = _1947 * 0.693147182464599609375;
    float _1973 = _1953 * _1959;
    float _1975 = _1957 * _1959;
    float _1977 = _1971 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1979 = fma(_1973, 0.5, 0.5);
    float _1981 = fma(_1975, -0.5, 0.5);
    float _1983 = _1969 * 0.636619746685028076171875;
    float3 _5297 = float3(_1979, _1981, _1977);
    float _1985 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5297, float3(0.0), isnan(_5297)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5297, float3(0.0), isnan(_5297)), level(0.0)).x;
    float3 _5308 = float3(_1979, _1981, _1977);
    float4 _1988 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5308, float3(0.0), isnan(_5308)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5308, float3(0.0), isnan(_5308)), level(0.0)).xyzw;
    float _1990 = _1988.x;
    float _1992 = _1988.y;
    float _1994 = _1988.z;
    float _1996 = _1988.w;
    float _1998 = -_1965;
    float _2000 = fma(_1983, _1998, 1.0);
    float2 _5330 = float2(_2000, _1967);
    float3 _2004 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5330, float2(0.0), isnan(_5330)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5330, float2(0.0), isnan(_5330)), level(0.0)).xyz;
    float _2006 = _2004.x;
    float _2008 = _2004.y;
    float _2010 = _2004.z;
    float _2012 = _1887 + (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _2014 = _1889 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2016 = _1677 > 0.0;
    bool _2018 = isnan(_1677);
    bool _2020 = _2016 || _2018;
    bool _2022 = isnan(0.0);
    bool _2024 = _2020 || _2022;
    float _2026 = fma(_2012, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1905);
    float _2028 = _1879 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2030 = fma(_1895, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2014);
    float _2032 = _1929 * 0.5;
    float _2034 = fma(_1917, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2026);
    float _2036 = fma(_2012, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2030);
    float _2038 = exp2(_2028);
    float _2040 = _1677 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2042 = fma(_1917, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2036);
    float _2044 = _2040 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2046 = 1.0 / _2034;
    out.m_47.x = _2044;
    float _2048 = _2042 * _2046;
    float _2050 = _1953 + _1929;
    float _2052 = fma(_1957, -0.5, _2032);
    float _2054 = _1929 * _2048;
    float _2056 = _2050 * 0.5;
    float _2058 = -_2038;
    float _2060 = _2058 + 1.0;
    float _2062 = _1929 + _2054;
    out.gl_Position.x = _1953;
    out.gl_Position.y = _1957;
    out.gl_Position.z = _2054;
    out.gl_Position.w = _1929;
    float _2064 = _2060 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2066 = _2062 * 0.5;
    out.m_64.x = _2056;
    out.m_64.y = _2052;
    out.m_64.z = _2066;
    out.m_64.w = _1929;
    float _2068 = _2064 * _1985;
    float _2070 = -_2064;
    float _2072 = _2070 + 1.0;
    float _2074 = _1996 * _2068;
    float _2076 = _1996 * _2072;
    float _2078 = _2010 * _2068;
    float _2080 = fma(_2006, _2074, _1990);
    float _2082 = fma(_2008, _2074, _1992);
    float _2084 = fma(_1996, _2078, _1994);
    out.m_66.x = _2080;
    out.m_66.y = _2082;
    out.m_66.z = _2084;
    out.m_66.w = _2076;
    if (_2024)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _2086 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2086;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

