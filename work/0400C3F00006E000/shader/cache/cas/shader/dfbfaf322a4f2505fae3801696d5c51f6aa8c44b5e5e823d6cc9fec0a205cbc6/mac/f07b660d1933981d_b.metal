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
    float4 m_57 [[user(locn0)]];
    float4 m_64 [[user(locn1)]];
    float4 m_68 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_62 [[user(locn4)]];
    float4 m_70 [[user(locn5)]];
    float4 m_66 [[user(locn6)]];
    float4 m_72 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_51 [[attribute(2)]];
    float4 m_44 [[attribute(3)]];
    float4 m_49 [[attribute(4)]];
    float4 m_53 [[attribute(5)]];
    float4 m_55 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1609 = false;
    bool _851 = false;
    bool _671 = false;
    bool _387 = false;
    bool _193 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _86 = in.m_44.w;
    float _88 = trunc(_86);
    int _91 = int(_88);
    bool _95 = _91 >= 1;
    float _97 = 0.0;
    if (!_95)
    {
        _97 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _99 = _97;
    float _101 = _99;
    if (!_95)
    {
        out.m_47.x = 0.0;
    }
    int _103 = 0;
    if (!_95)
    {
        float _105 = _99 * 5.0;
        _103 = as_type<int>(_105);
    }
    int _107 = _103;
    if (!_95)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2496 = as_type<float>(_107);
        out.gl_Position.z = _2496;
    }
    if (!_95)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _109 = in.m_49.w;
    bool _111 = _109 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _113 = isnan(_109);
    bool _115 = _111 || _113;
    bool _117 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _119 = _115 || _117;
    float _121 = -_109;
    float _123 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _125 = 0.0;
    if (_119)
    {
        float _127 = float(_91);
        _125 = _127;
    }
    float _129 = _125;
    bool _131 = _123 >= _129;
    bool _133 = !_119;
    bool _135 = _131 || _133;
    if (_135)
    {
        _101 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _137 = _101;
    if (_135)
    {
        out.m_47.x = 0.0;
    }
    int _139 = 0;
    if (_135)
    {
        float _141 = _137 * 5.0;
        _139 = as_type<int>(_141);
    }
    int _143 = _139;
    if (_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2564 = as_type<float>(_143);
        out.gl_Position.z = _2564;
    }
    if (_135)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _145 = in.m_51.x;
    float _147 = in.m_51.y;
    float _149 = in.m_51.z;
    bool _151 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _153 = _147 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _155 = _147 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _157 = _147 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _159 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[4].x, _153);
    float _161 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[5].x, _155);
    float _163 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[6].x, _157);
    float _165 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[4].z, _159);
    float _167 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[5].z, _161);
    float _169 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[6].z, _163);
    bool _171 = !_151;
    float _173 = _167;
    float _191;
    if (!_171)
    {
        float _175 = in.m_53.x;
        float _177 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _179 = _175 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _181 = fma(_179, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _183 = _181 * _177;
        float _185 = floor(_183);
        float _187 = -_185;
        float _189 = _183 + _187;
        _191 = _189;
        _193 = true;
    }
    else
    {
        float _195 = float(_91);
        float _197 = 1.0 / _195;
        float _199 = _123 * _197;
        _191 = _199;
    }
    _193 = false;
    float _201 = _191;
    float _203 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _205 = _201 + _203;
    float _207 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _209 = _201 + _207;
    bool _211 = _201 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _213 = isnan(_201);
    bool _215 = _211 || _213;
    bool _217 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _219 = _215 || _217;
    float _221 = float(_219);
    float _223 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _225 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _223;
    float _227 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _229 = _227 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _233 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _231;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _237 = _201 + _235;
    bool _239 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _241 = 1.0 / _229;
    float _243 = 1.0 / _225;
    float _245 = 1.0 / _233;
    float _247 = _237 * _241;
    bool _249 = _201 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _251 = isnan(_201);
    bool _253 = _249 || _251;
    bool _255 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _257 = _253 || _255;
    float _259 = float(_257);
    float _261 = _205 * _243;
    bool _263 = _201 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _265 = isnan(_201);
    bool _267 = _263 || _265;
    bool _269 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _271 = _267 || _269;
    float _273 = float(_271);
    float _275 = -_221;
    float _277 = _275 + 1.0;
    bool _279 = _201 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _281 = isnan(_201);
    bool _283 = _279 || _281;
    bool _285 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _287 = _283 || _285;
    float _289 = float(_287);
    float _291 = _273 * _277;
    float _293 = _209 * _245;
    float _295 = -_273;
    float _297 = _295 + 1.0;
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _301 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _299;
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _305 = _303 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _307 = _289 * _297;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _311 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _309;
    float _313 = -_289;
    float _315 = _313 + 1.0;
    float _317 = fma(_301, _261, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _321 = _319 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _323 = fma(_311, _261, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _325 = _259 * _315;
    float _327 = -_259;
    float _329 = _327 + 1.0;
    float _331 = _323 * _325;
    float _333 = _317 * _325;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _337 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _335;
    float _339 = fma(_321, _247, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _341 = fma(_305, _247, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _345 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _343;
    float _347 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[143].x, _331);
    float _349 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[143].y, _333);
    float _351 = fma(_337, _293, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _353 = fma(_345, _293, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _355 = fma(_339, _307, _347);
    float _357 = fma(_341, _307, _349);
    float _359 = fma(_351, _291, _355);
    float _361 = fma(_353, _291, _357);
    float _363 = fma(_221, (*spvDescriptorSet0.vp_c9)._m0[146].x, _359);
    float _365 = fma(_221, (*spvDescriptorSet0.vp_c9)._m0[146].y, _361);
    bool _367 = !_239;
    float _385;
    if (!_367)
    {
        float _369 = in.m_53.x;
        float _371 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _373 = _369 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _375 = fma(_373, (*spvDescriptorSet0.vp_c9)._m0[11].x, _123);
        float _377 = _375 * _371;
        float _379 = floor(_377);
        float _381 = -_379;
        float _383 = _377 + _381;
        _385 = _383;
        _387 = true;
    }
    else
    {
        float _389 = float(_91);
        float _391 = 1.0 / _389;
        float _393 = _123 * _391;
        _385 = _393;
    }
    _387 = false;
    float _395 = _385;
    float _397 = in.m_55.x;
    float _399 = in.m_55.y;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _403 = _395 + _401;
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _407 = _395 + _405;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _411 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _409;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _415 = _413 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _419 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _417;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _423 = _421 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _425 = 1.0 / _411;
    bool _427 = _395 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _429 = isnan(_395);
    bool _431 = _427 || _429;
    bool _433 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _435 = _431 || _433;
    float _437 = float(_435);
    float _439 = 1.0 / _415;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _443 = _395 + _441;
    bool _445 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _447 = _365 * _399;
    float _449 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _451 = _395 + _449;
    float _453 = 1.0 / _419;
    float _455 = _363 * _397;
    float _457 = _451 * _425;
    bool _459 = _395 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _461 = isnan(_395);
    bool _463 = _459 || _461;
    bool _465 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _467 = _463 || _465;
    float _469 = float(_467);
    bool _471 = _395 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _473 = isnan(_395);
    bool _475 = _471 || _473;
    bool _477 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _479 = _475 || _477;
    float _481 = float(_479);
    float _483 = 1.0 / _423;
    float _485 = _443 * _439;
    float _487 = -_469;
    float _489 = _487 + 1.0;
    float _491 = _481 * _489;
    float _493 = -_481;
    float _495 = _493 + 1.0;
    float _497 = _403 * _453;
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _501 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _499;
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _505 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _503;
    bool _507 = _395 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _509 = isnan(_395);
    bool _511 = _507 || _509;
    bool _513 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _515 = _511 || _513;
    float _517 = float(_515);
    float _519 = fma(_501, _457, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _521 = fma(_505, _457, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _523 = _407 * _483;
    bool _525 = _395 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _527 = isnan(_395);
    bool _529 = _525 || _527;
    bool _531 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _533 = _529 || _531;
    float _535 = float(_533);
    float _537 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _539 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _537;
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _543 = _541 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _545 = fma(_539, _457, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _547 = -_535;
    float _549 = _547 + 1.0;
    float _551 = _535 * _495;
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _555 = _553 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _559 = _557 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _561 = _437 * _549;
    float _563 = -_437;
    float _565 = _563 + 1.0;
    float _567 = fma(_543, _485, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _569 = fma(_555, _485, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _571 = fma(_559, _485, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _573 = _517 * _565;
    float _575 = -_517;
    float _577 = _575 + 1.0;
    float _579 = _519 * _573;
    float _581 = _521 * _573;
    float _583 = _545 * _573;
    float _585 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _587 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _585;
    float _589 = fma(_577, (*spvDescriptorSet0.vp_c9)._m0[107].x, _579);
    float _591 = fma(_577, (*spvDescriptorSet0.vp_c9)._m0[107].y, _581);
    float _593 = fma(_577, (*spvDescriptorSet0.vp_c9)._m0[107].z, _583);
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _597 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _595;
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _601 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _599;
    float _603 = fma(_587, _497, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _605 = fma(_567, _561, _589);
    float _607 = fma(_571, _561, _593);
    float _609 = fma(_569, _561, _591);
    float _611 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _613 = _611 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _617 = _615 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _619 = fma(_597, _497, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _621 = fma(_601, _497, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _625 = _623 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _627 = fma(_603, _551, _605);
    float _629 = fma(_613, _523, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _631 = fma(_617, _523, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _633 = fma(_625, _523, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _635 = fma(_619, _551, _609);
    float _637 = fma(_621, _551, _607);
    float _639 = fma(_629, _491, _627);
    float _641 = fma(_631, _491, _635);
    float _643 = fma(_633, _491, _637);
    float _645 = fma(_469, (*spvDescriptorSet0.vp_c9)._m0[111].x, _639);
    float _647 = fma(_469, (*spvDescriptorSet0.vp_c9)._m0[111].y, _641);
    float _649 = fma(_469, (*spvDescriptorSet0.vp_c9)._m0[111].z, _643);
    bool _651 = !_445;
    float _669;
    if (!_651)
    {
        float _653 = in.m_53.x;
        float _655 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _657 = _653 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _659 = fma(_657, (*spvDescriptorSet0.vp_c9)._m0[11].y, _123);
        float _661 = _659 * _655;
        float _663 = floor(_661);
        float _665 = -_663;
        float _667 = _661 + _665;
        _669 = _667;
        _671 = true;
    }
    else
    {
        float _673 = float(_91);
        float _675 = 1.0 / _673;
        float _677 = _123 * _675;
        _669 = _677;
    }
    _671 = false;
    float _679 = _669;
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _683 = _679 + _681;
    float _685 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _687 = _685 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _689 = _679 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _691 = isnan(_679);
    bool _693 = _689 || _691;
    bool _695 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _697 = _693 || _695;
    float _699 = float(_697);
    float _701 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _703 = _701 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _707 = _705 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _709 = _679 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _711 = isnan(_679);
    bool _713 = _709 || _711;
    bool _715 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _717 = _713 || _715;
    float _719 = float(_717);
    float _721 = 1.0 / _687;
    float _723 = -_699;
    float _725 = _723 + 1.0;
    float _727 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _729 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _727;
    bool _731 = _679 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _733 = isnan(_679);
    bool _735 = _731 || _733;
    bool _737 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _739 = _735 || _737;
    float _741 = float(_739);
    float _743 = _719 * _725;
    float _745 = -_719;
    float _747 = _745 + 1.0;
    bool _749 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _751 = 1.0 / _703;
    float _753 = _741 * _747;
    float _755 = -_741;
    float _757 = _755 + 1.0;
    float _759 = 1.0 / _707;
    float _761 = _729 * _721;
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _765 = _763 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _767 = fma(_761, _683, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _769 = _765 * _751;
    bool _771 = _679 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _773 = isnan(_679);
    bool _775 = _771 || _773;
    bool _777 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _779 = _775 || _777;
    float _781 = float(_779);
    float _783 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _785 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _783;
    float _787 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _789 = _679 + _787;
    float _791 = _767 * _753;
    float _793 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _795 = _679 + _793;
    float _797 = -_781;
    float _799 = _797 + 1.0;
    float _801 = fma(_769, _789, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _803 = _785 * _759;
    float _805 = fma(_757, (*spvDescriptorSet0.vp_c9)._m0[115].x, _791);
    float _807 = _699 * _799;
    float _809 = _645 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _811 = fma(_803, _795, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _813 = fma(_801, _743, _805);
    float _815 = _649 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _817 = _809 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _819 = fma(_811, _807, _813);
    float _821 = _647 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _823 = _815 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _825 = fma(_781, (*spvDescriptorSet0.vp_c9)._m0[118].x, _819);
    float _827 = _821 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _829 = _825 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_57.x = _817;
    out.m_57.y = _827;
    out.m_57.z = _823;
    out.m_57.w = _829;
    bool _831 = !_749;
    float _849;
    if (!_831)
    {
        float _833 = in.m_53.x;
        float _835 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _837 = _833 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _839 = fma(_837, (*spvDescriptorSet0.vp_c9)._m0[11].z, _123);
        float _841 = _839 * _835;
        float _843 = floor(_841);
        float _845 = -_843;
        float _847 = _841 + _845;
        _849 = _847;
        _851 = true;
    }
    else
    {
        float _853 = float(_91);
        float _855 = 1.0 / _853;
        float _857 = _123 * _855;
        _849 = _857;
    }
    _851 = false;
    float _859 = _849;
    float _861 = as_type<float>(int(gl_VertexIndex));
    float _863 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _865 = _859 + _863;
    float _867 = in.m_44.x;
    float _869 = in.m_44.y;
    float _871 = in.m_44.z;
    float _873 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _875 = _859 + _873;
    float _877 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _879 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _877;
    float _881 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _883 = _881 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _885 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _887 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _889 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _891 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _889;
    float _893 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _895 = _893 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _897 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _899 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _897;
    float _901 = 1.0 / _883;
    int _903 = as_type<int>(_861) & 1;
    bool _905 = _903 != 0;
    int _907 = as_type<int>(_861) & 2;
    bool _909 = _907 != 0;
    int _911 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _913 = _911 != 0;
    float _915 = 1.0 / _879;
    int _917 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _919 = _917 != 0;
    float _921 = _869 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _923 = in.m_53.x;
    float _925 = in.m_53.y;
    float _927 = _869 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _929 = _869 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _931 = fma(_867, (*spvDescriptorSet0.vp_c10)._m0[5].x, _921);
    float _933 = fma(_867, (*spvDescriptorSet0.vp_c10)._m0[4].x, _927);
    float _935 = fma(_867, (*spvDescriptorSet0.vp_c10)._m0[6].x, _929);
    float _937 = fma(_871, (*spvDescriptorSet0.vp_c10)._m0[5].z, _931);
    float _939 = fma(_871, (*spvDescriptorSet0.vp_c10)._m0[4].z, _933);
    float _941 = fma(_871, (*spvDescriptorSet0.vp_c10)._m0[6].z, _935);
    float _943 = _937 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _945 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _947 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _949 = _939 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _951 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _953 = _943 + _951;
    float _955 = _941 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _957 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _959 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _957;
    float _961 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _963 = _949 + _961;
    float _965 = _953 * _953;
    float _967 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _969 = _955 + _967;
    float _971 = 1.0 / _959;
    float _973 = _865 * _901;
    float _975 = fma(_963, _963, _965);
    float _977 = _923 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _979 = _925 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _981 = _923 > 0.5;
    float _983 = fma(_923, (*spvDescriptorSet0.vp_c9)._m0[78].z, _887);
    float _985 = -_947;
    float _987 = fma(_977, 2.0, _985);
    float _989 = fma(_969, _969, _975);
    float _991 = fma(_979, -2.0, _945);
    float _993 = _167 * _167;
    float _995 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _997 = _995 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _999 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1001 = _859 + _999;
    float _1003 = rsqrt(_989);
    float _1005 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1007 = fma(_165, _165, _993);
    float _1009 = _1001 * _915;
    float _1011 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1013 = _859 + _1011;
    float _1015 = fma(_925, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1005);
    float _1017 = fma(_169, _169, _1007);
    float _1019 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].z, _983);
    float _1021 = 1.0 / _997;
    bool _1023 = _925 > 0.5;
    float _1025 = _1013 * _971;
    float _1027 = -_123;
    float _1029 = fma(_1027, (*spvDescriptorSet0.vp_c9)._m0[76].x, _987);
    float _1031 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[76].y, _991);
    float _1033 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1015);
    float _1035 = fma(_891, _1009, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1037 = rsqrt(_1017);
    float _1039 = _953 * _1003;
    float _1041 = _963 * _1003;
    float _1043 = _969 * _1003;
    float _1045 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1047 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1045;
    float _1049 = -_1039;
    float _1051 = fma(_1049, (*spvDescriptorSet0.vp_c9)._m0[18].w, _953);
    float _1053 = -_1041;
    float _1055 = fma(_1053, (*spvDescriptorSet0.vp_c9)._m0[18].w, _963);
    float _1057 = -_1043;
    float _1059 = fma(_1057, (*spvDescriptorSet0.vp_c9)._m0[18].w, _969);
    float _1061 = _875 * _1021;
    float _1063 = _1051 * _1051;
    float _1065 = fma(_1047, _1009, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1067 = fma(_899, _1009, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1069 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1071 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1069;
    float _1073 = fma(_1055, _1055, _1063);
    float _1075 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1077 = _1075 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1079 = fma(_895, _973, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1081 = _169 * _1037;
    float _1083 = _165 * _1037;
    float _1085 = _167 * _1037;
    float _1087 = fma(_1059, _1059, _1073);
    float _1089 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1091 = _1081 * _1089;
    float _1093 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1095 = _1083 * _1093;
    float _1097 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1099 = _1085 * _1097;
    float _1101 = sqrt(_1087);
    float _1103 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1105 = -_1091;
    float _1107 = fma(_1083, _1103, _1105);
    float _1109 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1111 = -_1095;
    float _1113 = fma(_1085, _1109, _1111);
    float _1115 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1117 = -_1099;
    float _1119 = fma(_1081, _1115, _1117);
    float _1121 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1123 = _1121 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1125 = _1107 * _1107;
    float _1127 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1129 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1127;
    float _1131 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1133 = _1131 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1135 = fma(_1123, _973, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1137 = fma(_1119, _1119, _1125);
    float _1139 = _885 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1141 = _859 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1143 = isnan(_859);
    bool _1145 = _1141 || _1143;
    bool _1147 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1149 = _1145 || _1147;
    float _1151 = float(_1149);
    float _1153 = fma(_1113, _1113, _1137);
    float _1155 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1157 = _1155 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1159 = fma(_1129, _1025, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1161 = _1003 * _1101;
    float _1163 = rsqrt(_1153);
    float _1165 = fma(_1157, _973, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1167 = fma(_1133, _1061, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1169 = _447 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1171 = -_1151;
    float _1173 = _1171 + 1.0;
    bool _1175 = _859 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1177 = isnan(_859);
    bool _1179 = _1175 || _1177;
    bool _1181 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1183 = _1179 || _1181;
    float _1185 = float(_1183);
    float _1187 = _1169 * _1161;
    bool _1189 = _859 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1191 = isnan(_859);
    bool _1193 = _1189 || _1191;
    bool _1195 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1197 = _1193 || _1195;
    float _1199 = float(_1197);
    float _1201 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1203 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1201;
    float _1205 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1207 = _1205 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1209 = -_1185;
    float _1211 = _1209 + 1.0;
    bool _1213 = _859 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1215 = isnan(_859);
    bool _1217 = _1213 || _1215;
    bool _1219 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1221 = _1217 || _1219;
    float _1223 = float(_1221);
    float _1225 = fma(_1203, _1025, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1227 = fma(_1207, _1061, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1229 = fma(_1077, _1061, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1231 = fma(_1071, _1025, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    bool _1233 = !_905;
    float _1235 = _1233 ? (-0.5) : 0.5;
    float _1237 = _455 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _1239 = !_909;
    float _1241 = _1239 ? (-0.5) : 0.5;
    float _1243 = _1119 * _1163;
    float _1245 = _1107 * _1163;
    float _1247 = _1113 * _1163;
    bool _1249 = _859 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1251 = isnan(_859);
    bool _1253 = _1249 || _1251;
    bool _1255 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1257 = _1253 || _1255;
    float _1259 = float(_1257);
    float _1261 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1235);
    float _1263 = _1237 * _1161;
    float _1265 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1241);
    float _1267 = _1085 * _1247;
    float _1269 = _1259 * _1173;
    float _1271 = _1263 * _1261;
    float _1273 = -_1259;
    float _1275 = _1273 + 1.0;
    float _1277 = _1187 * _1265;
    float _1279 = _1161 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1281 = _1279 * 0.5;
    float _1283 = _1199 * _1211;
    float _1285 = _1185 * _1275;
    float _1287 = _1277 * _1083;
    float _1289 = _1083 * _1245;
    float _1291 = _1277 * _1081;
    float _1293 = -_1267;
    float _1295 = fma(_1081, _1245, _1293);
    float _1297 = fma(_1271, _1243, _1287);
    float _1299 = -_1289;
    float _1301 = fma(_1085, _1243, _1299);
    float _1303 = fma(_1271, _1247, _1291);
    float _1305 = -_1199;
    float _1307 = _1305 + 1.0;
    float _1309 = fma(_1281, _1295, _1297);
    float _1311 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1313 = fma(_1281, _1301, _1303);
    float _1315 = -_1235;
    int _1317 = _981 ? as_type<int>(_1315) : as_type<int>(_1235);
    float _1319 = _1223 * _1307;
    float _1321 = _949 + _1309;
    float _1323 = _955 + _1313;
    bool _1325 = !_913;
    float _1327 = _1325 ? _1235 : as_type<float>(_1317);
    float _1329 = _1035 * _1319;
    float _1331 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1333 = _1321 + _1331;
    float _1335 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1337 = _1323 + _1335;
    float _1339 = _1065 * _1319;
    float _1341 = _1327 + 0.5;
    float _1343 = _1333 * _1333;
    float _1345 = _1337 * _1337;
    float _1347 = _1067 * _1319;
    float _1349 = -_1223;
    float _1351 = _1349 + 1.0;
    float _1353 = fma(_1139, _1341, _1029);
    float _1355 = _1343 + _1345;
    float _1357 = -_1241;
    int _1359 = _1023 ? as_type<int>(_1357) : as_type<int>(_1241);
    float _1361 = fma(_1351, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1329);
    float _1363 = fma(_1351, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1339);
    float _1365 = sqrt(_1355);
    bool _1367 = !_919;
    float _1369 = _1367 ? _1241 : as_type<float>(_1359);
    float _1371 = fma(_1079, _1283, _1361);
    float _1373 = fma(_1135, _1283, _1363);
    float _1375 = _1311 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1377 = _1277 * _1085;
    float _1379 = _1369 + (-0.5);
    float _1381 = fma(_1225, _1285, _1373);
    float _1383 = fma(_1351, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1347);
    float _1385 = fma(_1271, _1245, _1377);
    float _1387 = -_1375;
    float _1389 = -_1031;
    float _1391 = fma(_1387, _1379, _1389);
    float _1393 = _1081 * _1243;
    float _1395 = fma(_1227, _1269, _1381);
    float _1397 = fma(_1165, _1283, _1383);
    float _1399 = fma(_1159, _1285, _1371);
    float _1401 = -_1393;
    float _1403 = fma(_1083, _1247, _1401);
    bool _1405 = _1365 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1407 = fma(_1231, _1285, _1397);
    float _1409 = fma(_1167, _1269, _1399);
    float _1411 = fma(_1281, _1403, _1385);
    float _1413 = _1241 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1415 = fma(_1229, _1269, _1407);
    float _1417 = fma(_1151, (*spvDescriptorSet0.vp_c9)._m0[127].x, _1409);
    float _1419 = _943 + _1411;
    float _1421 = fma(_1151, (*spvDescriptorSet0.vp_c9)._m0[127].y, _1395);
    float _1423 = fma(_1151, (*spvDescriptorSet0.vp_c9)._m0[127].z, _1415);
    float _1425 = _1235 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1427 = _1083 * _1413;
    float _1429 = _1085 * _1413;
    float _1431 = _1167;
    float _1433 = _1343;
    float _1435 = _1345;
    float _1437 = _1321;
    float _1439 = _1323;
    float _1441 = _1417;
    float _1443 = _1017;
    float _1445 = _955;
    float _1447 = _943;
    if (!_1405)
    {
        _1431 = _1419;
    }
    float _1449 = _1431;
    bool _1451 = !_1405;
    float _1453 = _1449;
    if (!_1451)
    {
        float _1455 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1457 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1459 = _1365 + _1457;
        float _1461 = _1419 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1463 = rsqrt(_1355);
        float _1465 = _1459 * _1455;
        float _1467 = _1465 * 0.15915493667125701904296875;
        float _1469 = _1467 * 6.283185482025146484375;
        float _1471 = sin(_1469);
        float _1473 = _1467 * 6.283185482025146484375;
        float _1475 = cos(_1473);
        float _1477 = fma(_1471, _1461, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1479 = _1463 * _1477;
        float _1481 = fma(_1333, _1479, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1483 = _1475 + (-1.0);
        float _1485 = fma(_1337, _1479, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1487 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1489 = _1481 + _1487;
        float _1491 = _1483 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1493 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1495 = _1485 + _1493;
        float _1497 = _1489 * _1489;
        float _1499 = fma(_1419, _1475, _1491);
        float _1501 = _1495 * _1495;
        _1453 = _1499;
        _1433 = _1497;
        _1435 = _1501;
        _1437 = _1481;
        _1439 = _1485;
    }
    float _1503 = _1453;
    float _1505 = _1433;
    float _1507 = _1435;
    float _1509 = _1437;
    float _1511 = _1439;
    float _1513 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1515 = _1503 + _1513;
    float _1517 = fma(_1243, _1425, _1427);
    float _1519 = _1081 * _1413;
    float _1521 = -_1019;
    float _1523 = _1521 + 1.0;
    float _1525 = fma(_1515, _1515, _1505);
    float _1527 = -_1033;
    float _1529 = _1527 + 1.0;
    float _1531 = fma(_1247, _1425, _1519);
    float _1533 = -_1523;
    float _1535 = fma(_1327, _1533, _1353);
    float _1537 = _1525 + _1507;
    float _1539 = fma(_1245, _1425, _1429);
    float _1541 = _1417 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1543 = _1421 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1545 = _1423 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1547 = fma(_1369, _1529, _1391);
    float _1549 = sqrt(_1537);
    float _1551 = _1295 + _1517;
    float _1553 = _1403 + _1539;
    float _1555 = _1541 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1557 = _1543 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1559 = _1545 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1561 = _1301 + _1531;
    out.m_62.x = _1535;
    out.m_62.y = _1547;
    out.m_64.x = _1555;
    out.m_64.y = _1557;
    out.m_64.z = _1559;
    out.m_66.x = _1551;
    out.m_66.y = _1553;
    out.m_66.z = _1561;
    bool _1563 = _1549 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1565 = isnan(_1549);
    bool _1567 = _1563 || _1565;
    bool _1569 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1571 = _1567 || _1569;
    float _1573 = _1531;
    if (!_1571)
    {
        _1441 = 1.0;
    }
    float _1575 = _1441;
    bool _1577 = !_1571;
    float _1579 = _1575;
    if (!_1577)
    {
        bool _1581 = _1549 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1583 = isnan(_1549);
        bool _1585 = _1581 || _1583;
        bool _1587 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1589 = _1585 || _1587;
        if (!_1589)
        {
            float _1591 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1593 = _1549 + _1591;
            float _1595 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1597 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1595;
            float _1599 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1601 = _1599 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1603 = 1.0 / _1597;
            float _1605 = _1593 * _1603;
            float _1607 = fma(_1605, _1601, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1579 = _1607;
            _1609 = true;
        }
        else
        {
            bool _1611 = _1549 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1613 = isnan(_1549);
            bool _1615 = _1611 || _1613;
            bool _1617 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1619 = _1615 || _1617;
            if (!_1619)
            {
                float _1621 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1623 = _1549 + _1621;
                float _1625 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1627 = _1625 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1629 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1631 = _1629 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1633 = 1.0 / _1627;
                float _1635 = _1623 * _1633;
                float _1637 = fma(_1635, _1631, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1579 = _1637;
                _1609 = true;
            }
            else
            {
                _1579 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1609 = false;
    float _1639 = _1579;
    float _1641 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1643 = _1503 + _1641;
    float _1645 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1647 = _1509 + _1645;
    float _1649 = -_1041;
    float _1651 = fma(_1649, (*spvDescriptorSet0.vp_c9)._m0[18].w, _949);
    float _1653 = fma(_1643, _1639, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1655 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1657 = _1511 + _1655;
    float _1659 = fma(_1647, _1639, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1661 = -_943;
    float _1663 = _1661 + _1653;
    float _1665 = fma(_1657, _1639, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1667 = -_949;
    float _1669 = _1667 + _1659;
    float _1671 = _1663 * _1663;
    float _1673 = -_955;
    float _1675 = _1673 + _1665;
    float _1677 = fma(_1669, _1669, _1671);
    float _1679 = fma(_1675, _1675, _1677);
    float _1681 = sqrt(_1679);
    bool _1683 = _1681 > 0.0;
    bool _1685 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1687 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1689 = _1685 || _1687;
    bool _1691 = isnan(0.5);
    bool _1693 = _1689 || _1691;
    float _1695 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1697 = _1639;
    float _1699 = _1665;
    float _1701 = _1669;
    if (!_1683)
    {
        _1695 = _1659;
    }
    float _1703 = _1695;
    float _1705 = _1703;
    if (!_1683)
    {
        _1697 = _1653;
    }
    float _1707 = _1697;
    bool _1709 = !_1683;
    float _1711 = _1707;
    float _1713 = _1707;
    if (!_1709)
    {
        float _1715 = sqrt(_1017);
        float _1717 = rsqrt(_1679);
        bool _1719 = _1715 > 0.0;
        float _1721 = _1669 * _1717;
        float _1723 = _1663 * _1717;
        float _1725 = _1675 * _1717;
        float _1727 = _1717;
        _1701 = _1721;
        _1443 = _1715;
        if (!_1719)
        {
            _1727 = _1659;
        }
        float _1729 = _1727;
        _1705 = _1729;
        if (!_1719)
        {
            _1711 = _1653;
        }
        float _1731 = _1711;
        bool _1733 = !_1719;
        _1713 = _1731;
        if (!_1733)
        {
            float _1735 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1737 = _1085 * _1723;
            float _1739 = fma(_1083, _1721, _1737);
            float _1741 = fma(_1081, _1725, _1739);
            float _1743 = _1735 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1745 = _1741 * _1743;
            float _1747 = fma(_165, _1745, _1659);
            float _1749 = fma(_167, _1745, _1653);
            float _1751 = fma(_169, _1745, _1665);
            _1713 = _1749;
            _1699 = _1751;
            _1705 = _1747;
        }
    }
    float _1753 = _1713;
    float _1755 = _1699;
    float _1757 = _1705;
    float _1759 = _1701;
    float _1761 = _1443;
    float _1763 = -_1039;
    float _1765 = fma(_1763, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1753);
    float _1767 = -_1043;
    float _1769 = fma(_1767, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1755);
    float _1771 = -_1041;
    float _1773 = fma(_1771, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1757);
    float _1775 = -_1039;
    float _1777 = fma(_1775, (*spvDescriptorSet0.vp_c9)._m0[18].w, _943);
    float _1779 = -_1043;
    float _1781 = fma(_1779, (*spvDescriptorSet0.vp_c9)._m0[18].w, _955);
    float _1783 = _1765;
    float _1785 = _1773;
    float _1787 = _1769;
    float _1789 = _1759;
    float _1791 = _1761;
    float _1793 = _1781;
    if (!_1693)
    {
        float _1795 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1797 = _1777 + _1795;
        float _1799 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1801 = _1651 + _1799;
        float _1803 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1805 = -_949;
        float _1807 = _1805 + _1757;
        float _1809 = _1797 * _1797;
        float _1811 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1813 = _1781 + _1811;
        float _1815 = -_943;
        float _1817 = _1815 + _1753;
        float _1819 = -_955;
        float _1821 = _1819 + _1755;
        float _1823 = fma(_1801, _1801, _1809);
        float _1825 = fma(_1813, _1813, _1823);
        float _1827 = 1.0 / _1161;
        float _1829 = sqrt(_1825);
        float _1831 = _1807 * _1827;
        float _1833 = _1817 * _1827;
        float _1835 = _1821 * _1827;
        bool _1837 = _1829 > (*spvDescriptorSet0.vp_c9)._m0[199].x;
        bool _1839 = isnan(_1829);
        bool _1841 = _1837 || _1839;
        bool _1843 = isnan((*spvDescriptorSet0.vp_c9)._m0[199].x);
        bool _1845 = _1841 || _1843;
        float _1847 = precise::min(_1829, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1849 = _1847 * _1803;
        float _1851 = fma(_1831, _1849, _1651);
        float _1853 = fma(_1833, _1849, _1777);
        float _1855 = _1765;
        float _1857 = _1829;
        float _1859 = _1821;
        _173 = _1849;
        _1445 = _1831;
        _1447 = _1833;
        if (_1845)
        {
            float _1861 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
            _1855 = _1861;
        }
        float _1863 = _1855;
        if (_1845)
        {
            float _1865 = precise::max(_1829, (*spvDescriptorSet0.vp_c9)._m0[199].y);
            _1857 = _1865;
        }
        float _1867 = _1857;
        float _1869 = fma(_1835, _1849, _1781);
        float _1871 = _1867;
        float _1873 = _1863;
        _1787 = _1869;
        if (_1845)
        {
            float _1875 = _1867 * _1863;
            _1859 = _1875;
        }
        float _1877 = _1859;
        if (!_1845)
        {
            _1871 = _1851;
        }
        float _1879 = _1871;
        float _1881 = _1879;
        if (!_1845)
        {
            _1873 = _1853;
        }
        float _1883 = _1873;
        float _1885 = _1883;
        if (_1845)
        {
            float _1887 = fma(_1831, _1877, _1651);
            _1881 = _1887;
        }
        float _1889 = _1881;
        _1785 = _1889;
        if (_1845)
        {
            float _1891 = fma(_1833, _1877, _1777);
            _1885 = _1891;
        }
        float _1893 = _1885;
        _1783 = _1893;
        if (_1845)
        {
            float _1895 = fma(_1835, _1877, _1781);
            _1787 = _1895;
        }
    }
    float _1897 = _1783;
    float _1899 = _1785;
    float _1901 = _1787;
    float _1903 = _173;
    float _1905 = _1445;
    float _1907 = _1447;
    float _1909 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1911 = _1897 + _1909;
    float _1913 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1915 = _1899 + _1913;
    float _1917 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1919 = _1901 + _1917;
    float _1921 = _1911 * _1911;
    float _1923 = fma(_1915, _1915, _1921);
    float _1925 = fma(_1919, _1919, _1923);
    float _1927 = rsqrt(_1925);
    float _1929 = _1927 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1931 = _1915 * _1929;
    float _1933 = _1919 * _1929;
    float _1935 = _1931 * _1931;
    float _1937 = _1933 * _1933;
    float _1939 = _1935 + _1937;
    float _1941 = sqrt(_1939);
    bool _1943 = _1941 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1945 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1947 = _1941 + _1945;
    float _1949 = _169;
    float _1951 = _1939;
    float _1953 = _1947;
    float _1955 = _1905;
    if (_1943)
    {
        float _1957 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1949 = _1957;
    }
    float _1959 = _1949;
    if (_1943)
    {
        float _1961 = rsqrt(_1939);
        _1951 = _1961;
    }
    float _1963 = _1951;
    float _1965 = _1963;
    if (_1943)
    {
        float _1967 = _1947 * _1959;
        _1953 = _1967;
    }
    float _1969 = _1953;
    if (_1943)
    {
        float _1971 = _1969 * 0.15915493667125701904296875;
        _1955 = _1971;
    }
    float _1973 = _1955;
    float _1975 = _1903;
    if (_1943)
    {
        float _1977 = _1973 * 6.283185482025146484375;
        float _1979 = sin(_1977);
        _1975 = _1979;
    }
    float _1981 = _1975;
    float _1983 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1985 = precise::max(0.0, _1983);
    float _1987 = _1907;
    float _1989 = _1985;
    float _1991 = _1983;
    if (_1943)
    {
        float _1993 = _1973 * 6.283185482025146484375;
        float _1995 = cos(_1993);
        _1987 = _1995;
    }
    float _1997 = _1987;
    float _1999 = -_1929;
    float _2001 = -_1985;
    float _2003 = fma(_1911, _1999, _2001);
    if (_1943)
    {
        float _2005 = _2003 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1989 = _2005;
    }
    float _2007 = _1989;
    float _2009 = sqrt(_1925);
    float _2011 = _1981;
    float _2013 = _2007;
    if (_1943)
    {
        float _2015 = fma(_1981, _2007, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2011 = _2015;
    }
    float _2017 = _2011;
    float _2019 = _2017;
    if (!_1943)
    {
        _2013 = _1931;
    }
    float _2021 = _2013;
    float _2023 = _2021;
    float _2025 = _1997;
    if (_1943)
    {
        float _2027 = _1997 + (-1.0);
        _1991 = _2027;
    }
    float _2029 = _1991;
    float _2031 = _2029;
    if (_1943)
    {
        float _2033 = _1963 * _2017;
        _1789 = _2033;
    }
    float _2035 = _1789;
    if (!_1943)
    {
        _2019 = _2003;
    }
    float _2037 = _2019;
    float _2039 = _2037;
    if (_1943)
    {
        float _2041 = _2029 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1791 = _2041;
    }
    float _2043 = _1791;
    if (_1943)
    {
        float _2045 = _1931 * _2035;
        _2023 = _2045;
    }
    float _2047 = _2023;
    if (!_1943)
    {
        _2031 = _1933;
    }
    float _2049 = _2031;
    float _2051 = _2049;
    if (_1943)
    {
        float _2053 = _1933 * _2035;
        _2051 = _2053;
    }
    float _2055 = _2051;
    if (!_1943)
    {
        _1965 = _1935;
    }
    float _2057 = _1965;
    float _2059 = _2057;
    if (_1943)
    {
        float _2061 = fma(_2003, _1997, _2043);
        _2039 = _2061;
    }
    float _2063 = _2039;
    if (_1943)
    {
        float _2065 = _2047 * _2047;
        _2059 = _2065;
    }
    float _2067 = _2059;
    if (!_1943)
    {
        _2025 = _1937;
    }
    float _2069 = _2025;
    float _2071 = _2069;
    if (_1943)
    {
        float _2073 = _2055 * _2055;
        _2071 = _2073;
    }
    float _2075 = _2071;
    float _2077 = fma(_2063, _2063, _2067);
    float _2079 = _2077 + _2075;
    float _2081 = _1897 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2083 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2085 = fma(_2009, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2083);
    float _2087 = precise::clamp(_2085, 0.0, 1.0);
    float _2089 = _1897 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2091 = rsqrt(_2079);
    float _2093 = fma(_1899, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2081);
    float _2095 = -_2087;
    float _2097 = _2095 + 1.0;
    float _2099 = _1897 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2101 = fma(_1899, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2089);
    float _2103 = fma(_1901, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2093);
    float _2105 = _1897 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2107 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2109 = abs(_2097);
    float _2111 = log2(_2109);
    float _2113 = _2103 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2115 = fma(_1899, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2099);
    float _2117 = fma(_1901, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2101);
    float _2119 = fma(_1899, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2105);
    float _2121 = _2113 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2123 = fma(_1901, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2115);
    float _2125 = _2117 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2127 = _2091 * _2047;
    float _2129 = -_2121;
    float _2131 = fma(_2129, _2107, 1.0);
    float _2133 = fma(_1901, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2119);
    float _2135 = _2123 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2137 = _2125 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2139 = _2091 * _2063;
    float _2141 = _2127 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2143 = _2133 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2145 = fma(_2135, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2137);
    float _2147 = _2111 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2149 = _2091 * _2055;
    float _2151 = -_2141;
    float _2153 = fma(_2139, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2151);
    float _2155 = fma(_2113, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2145);
    float _2157 = exp2(_2147);
    float _2159 = _2125 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2161 = -_2149;
    float _2163 = fma(_2161, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2153);
    float _2165 = fma(_2143, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2155);
    float _2167 = _2125 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2169 = fma(_2135, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2159);
    float _2171 = fma(_2163, -0.5, 0.5);
    float _2173 = fma(_2163, 0.5, 0.5);
    float _2175 = log2(_2131);
    float _2177 = fma(_2135, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2167);
    float _2179 = _2139 + 1.0;
    float _2181 = fma(_2113, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2169);
    float _2183 = fma(_2173, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2185 = fma(_2113, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2177);
    float _2187 = 1.0 / _2165;
    float _2189 = -_2139;
    float _2191 = fma(_2157, _2179, _2189);
    float _2193 = fma(_2143, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2181);
    float _2195 = fma(_2143, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2185);
    float _2197 = fma(_2173, _2183, -0.212114393711090087890625);
    float _2199 = sqrt(_2171);
    float _2201 = _2175 * 0.693147182464599609375;
    float _2203 = fma(_2173, _2197, 1.570728778839111328125);
    float _2205 = _2201 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2207 = fma(_2191, 0.5, 0.5);
    float _2209 = _2193 * _2187;
    float _2211 = _2195 * _2187;
    float _2213 = fma(_2209, 0.5, 0.5);
    float _2215 = fma(_2211, -0.5, 0.5);
    float _2217 = _2199 * 0.636619746685028076171875;
    float3 _5970 = float3(_2213, _2215, _2205);
    float _2219 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5970, float3(0.0), isnan(_5970)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5970, float3(0.0), isnan(_5970)), level(0.0)).x;
    float3 _5981 = float3(_2213, _2215, _2205);
    float4 _2222 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5981, float3(0.0), isnan(_5981)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5981, float3(0.0), isnan(_5981)), level(0.0)).xyzw;
    float _2224 = _2222.x;
    float _2226 = _2222.y;
    float _2228 = _2222.z;
    float _2230 = _2222.w;
    float _2232 = -_2203;
    float _2234 = fma(_2217, _2232, 1.0);
    float2 _6003 = float2(_2234, _2207);
    float3 _2238 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6003, float2(0.0), isnan(_6003)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6003, float2(0.0), isnan(_6003)), level(0.0)).xyz;
    float _2240 = _2238.x;
    float _2242 = _2238.y;
    float _2244 = _2238.z;
    float _2246 = _1777 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2248 = _2111 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_68.x = _1915;
    out.m_68.y = _1911;
    out.m_68.z = _1919;
    float _2250 = fma(_1651, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2246);
    bool _2252 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2254 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2256 = _2252 || _2254;
    bool _2258 = isnan(0.5);
    bool _2260 = _2256 || _2258;
    float _2262 = fma(_1781, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2250);
    float _2264 = _1777 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2266 = exp2(_2248);
    float _2268 = _2262 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2270 = fma(_1651, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2264);
    float _2272 = fma(_1781, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2270);
    float _2274 = _2205;
    float _2276 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _2278 = _2268;
    float _2280 = _2213;
    if (!_2260)
    {
        _1573 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _2282 = _1573;
    float _2284 = 1.0 / _2268;
    if (_2260)
    {
        _1793 = 1.0;
    }
    float _2286 = _1793;
    float _2288 = _2272 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2290 = _2288 + _2268;
    float _2292 = _2286;
    if (!_2260)
    {
        float _2294 = -_2282;
        float _2296 = _2294 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _2274 = _2296;
    }
    float _2298 = _2274;
    float _2300 = -_2266;
    float _2302 = _2300 + 1.0;
    float _2304 = _2298;
    if (!_2260)
    {
        float _2306 = 1.0 / _2298;
        _2304 = _2306;
    }
    float _2308 = _2304;
    float _2310 = _2290 * _2284;
    float _2312 = _2310 * 0.5;
    float _2314 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2316 = fma(_2312, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2314);
    float _2318 = _2312;
    float _2320 = _2284;
    if (!_2260)
    {
        _2318 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2322 = _2318;
    float _2324 = 1.0 / _2316;
    float _2326 = _2322;
    if (!_2260)
    {
        float _2328 = -_2322;
        float _2330 = _2328 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2276 = _2330;
    }
    float _2332 = _2276;
    float _2334 = _2215;
    if (!_2260)
    {
        float _2336 = 1.0 / _2332;
        _2334 = _2336;
    }
    float _2338 = _2334;
    if (!_2260)
    {
        float _2340 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2342 = -_2282;
        float _2344 = fma(_2324, _2340, _2342);
        _2320 = _2344;
    }
    float _2346 = _2320;
    if (!_2260)
    {
        float _2348 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2350 = -_2322;
        float _2352 = fma(_2324, _2348, _2350);
        _2278 = _2352;
    }
    float _2354 = _2278;
    if (_2260)
    {
        _2326 = 1.0;
    }
    float _2356 = _2326;
    float _2358 = _2193 + _2165;
    float _2360 = _2356;
    if (!_2260)
    {
        float _2362 = _2346 * _2308;
        float _2364 = precise::clamp(_2362, 0.0, 1.0);
        _2280 = _2364;
    }
    float _2366 = _2280;
    float _2368 = _2125 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2370 = _2358 * 0.5;
    if (!_2260)
    {
        float _2372 = _2354 * _2338;
        float _2374 = precise::clamp(_2372, 0.0, 1.0);
        _2360 = _2374;
    }
    float _2376 = _2360;
    float _2378 = fma(_2135, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2368);
    if (!_2260)
    {
        float _2380 = -_2366;
        float _2382 = _2380 + 1.0;
        _2292 = _2382;
    }
    float _2384 = _2292;
    float _2386 = fma(_2113, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2378);
    float _2388 = _2165 * 0.5;
    float _2390 = _2376 * _2384;
    bool _2392 = _2376 > 0.0;
    bool _2394 = isnan(_2376);
    bool _2396 = _2392 || _2394;
    bool _2398 = isnan(0.0);
    bool _2400 = _2396 || _2398;
    float _2402 = fma(_2195, -0.5, _2388);
    float _2404 = _2302 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2406 = _2390 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2408 = fma(_2143, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2386);
    bool _2410 = _2384 <= 0.0;
    bool _2412 = !_2400;
    bool _2414 = _2410 || _2412;
    float _2416 = _2406 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2418 = _2408 + _2165;
    out.gl_Position.x = _2193;
    out.gl_Position.y = _2195;
    out.gl_Position.z = _2408;
    out.gl_Position.w = _2165;
    float _2420 = _2418 * 0.5;
    out.m_47.x = _2416;
    out.m_70.x = _2370;
    out.m_70.y = _2402;
    out.m_70.z = _2420;
    out.m_70.w = _2165;
    float _2422 = _2404 * _2219;
    float _2424 = -_2404;
    float _2426 = _2424 + 1.0;
    float _2428 = _2230 * _2422;
    float _2430 = _2230 * _2426;
    float _2432 = _2244 * _2422;
    float _2434 = fma(_2240, _2428, _2224);
    float _2436 = fma(_2242, _2428, _2226);
    float _2438 = fma(_2230, _2432, _2228);
    out.m_72.x = _2434;
    out.m_72.y = _2436;
    out.m_72.z = _2438;
    out.m_72.w = _2430;
    if (!_2414)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _2440 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2440;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1609 = false;
    bool _851 = false;
    bool _671 = false;
    bool _387 = false;
    bool _193 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _86 = in.m_44.w;
    float _88 = trunc(_86);
    int _91 = int(_88);
    bool _95 = _91 >= 1;
    float _97 = 0.0;
    if (!_95)
    {
        _97 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _99 = _97;
    float _101 = _99;
    if (!_95)
    {
        out.m_47.x = 0.0;
    }
    int _103 = 0;
    if (!_95)
    {
        float _105 = _99 * 5.0;
        _103 = as_type<int>(_105);
    }
    int _107 = _103;
    if (!_95)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2496 = as_type<float>(_107);
        out.gl_Position.z = _2496;
    }
    if (!_95)
    {
        return out;
    }
    float _109 = in.m_49.w;
    bool _111 = _109 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _113 = isnan(_109);
    bool _115 = _111 || _113;
    bool _117 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _119 = _115 || _117;
    float _121 = -_109;
    float _123 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _125 = 0.0;
    if (_119)
    {
        float _127 = float(_91);
        _125 = _127;
    }
    float _129 = _125;
    bool _131 = _123 >= _129;
    bool _133 = !_119;
    bool _135 = _131 || _133;
    if (_135)
    {
        _101 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _137 = _101;
    if (_135)
    {
        out.m_47.x = 0.0;
    }
    int _139 = 0;
    if (_135)
    {
        float _141 = _137 * 5.0;
        _139 = as_type<int>(_141);
    }
    int _143 = _139;
    if (_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2564 = as_type<float>(_143);
        out.gl_Position.z = _2564;
    }
    if (_135)
    {
        return out;
    }
    float _145 = in.m_51.x;
    float _147 = in.m_51.y;
    float _149 = in.m_51.z;
    bool _151 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _153 = _147 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _155 = _147 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _157 = _147 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _159 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[4].x, _153);
    float _161 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[5].x, _155);
    float _163 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[6].x, _157);
    float _165 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[4].z, _159);
    float _167 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[5].z, _161);
    float _169 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[6].z, _163);
    bool _171 = !_151;
    float _173 = _167;
    float _191;
    if (!_171)
    {
        float _175 = in.m_53.x;
        float _177 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _179 = _175 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _181 = fma(_179, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _183 = _181 * _177;
        float _185 = floor(_183);
        float _187 = -_185;
        float _189 = _183 + _187;
        _191 = _189;
        _193 = true;
    }
    else
    {
        float _195 = float(_91);
        float _197 = 1.0 / _195;
        float _199 = _123 * _197;
        _191 = _199;
    }
    _193 = false;
    float _201 = _191;
    float _203 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _205 = _201 + _203;
    float _207 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _209 = _201 + _207;
    bool _211 = _201 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _213 = isnan(_201);
    bool _215 = _211 || _213;
    bool _217 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _219 = _215 || _217;
    float _221 = float(_219);
    float _223 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _225 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _223;
    float _227 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _229 = _227 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _233 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _231;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _237 = _201 + _235;
    bool _239 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _241 = 1.0 / _229;
    float _243 = 1.0 / _225;
    float _245 = 1.0 / _233;
    float _247 = _237 * _241;
    bool _249 = _201 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _251 = isnan(_201);
    bool _253 = _249 || _251;
    bool _255 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _257 = _253 || _255;
    float _259 = float(_257);
    float _261 = _205 * _243;
    bool _263 = _201 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _265 = isnan(_201);
    bool _267 = _263 || _265;
    bool _269 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _271 = _267 || _269;
    float _273 = float(_271);
    float _275 = -_221;
    float _277 = _275 + 1.0;
    bool _279 = _201 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _281 = isnan(_201);
    bool _283 = _279 || _281;
    bool _285 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _287 = _283 || _285;
    float _289 = float(_287);
    float _291 = _273 * _277;
    float _293 = _209 * _245;
    float _295 = -_273;
    float _297 = _295 + 1.0;
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _301 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _299;
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _305 = _303 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _307 = _289 * _297;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _311 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _309;
    float _313 = -_289;
    float _315 = _313 + 1.0;
    float _317 = fma(_301, _261, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _321 = _319 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _323 = fma(_311, _261, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _325 = _259 * _315;
    float _327 = -_259;
    float _329 = _327 + 1.0;
    float _331 = _323 * _325;
    float _333 = _317 * _325;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _337 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _335;
    float _339 = fma(_321, _247, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _341 = fma(_305, _247, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _345 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _343;
    float _347 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[143].x, _331);
    float _349 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[143].y, _333);
    float _351 = fma(_337, _293, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _353 = fma(_345, _293, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _355 = fma(_339, _307, _347);
    float _357 = fma(_341, _307, _349);
    float _359 = fma(_351, _291, _355);
    float _361 = fma(_353, _291, _357);
    float _363 = fma(_221, (*spvDescriptorSet0.vp_c9)._m0[146].x, _359);
    float _365 = fma(_221, (*spvDescriptorSet0.vp_c9)._m0[146].y, _361);
    bool _367 = !_239;
    float _385;
    if (!_367)
    {
        float _369 = in.m_53.x;
        float _371 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _373 = _369 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _375 = fma(_373, (*spvDescriptorSet0.vp_c9)._m0[11].x, _123);
        float _377 = _375 * _371;
        float _379 = floor(_377);
        float _381 = -_379;
        float _383 = _377 + _381;
        _385 = _383;
        _387 = true;
    }
    else
    {
        float _389 = float(_91);
        float _391 = 1.0 / _389;
        float _393 = _123 * _391;
        _385 = _393;
    }
    _387 = false;
    float _395 = _385;
    float _397 = in.m_55.x;
    float _399 = in.m_55.y;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _403 = _395 + _401;
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _407 = _395 + _405;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _411 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _409;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _415 = _413 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _419 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _417;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _423 = _421 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _425 = 1.0 / _411;
    bool _427 = _395 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _429 = isnan(_395);
    bool _431 = _427 || _429;
    bool _433 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _435 = _431 || _433;
    float _437 = float(_435);
    float _439 = 1.0 / _415;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _443 = _395 + _441;
    bool _445 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _447 = _365 * _399;
    float _449 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _451 = _395 + _449;
    float _453 = 1.0 / _419;
    float _455 = _363 * _397;
    float _457 = _451 * _425;
    bool _459 = _395 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _461 = isnan(_395);
    bool _463 = _459 || _461;
    bool _465 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _467 = _463 || _465;
    float _469 = float(_467);
    bool _471 = _395 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _473 = isnan(_395);
    bool _475 = _471 || _473;
    bool _477 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _479 = _475 || _477;
    float _481 = float(_479);
    float _483 = 1.0 / _423;
    float _485 = _443 * _439;
    float _487 = -_469;
    float _489 = _487 + 1.0;
    float _491 = _481 * _489;
    float _493 = -_481;
    float _495 = _493 + 1.0;
    float _497 = _403 * _453;
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _501 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _499;
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _505 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _503;
    bool _507 = _395 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _509 = isnan(_395);
    bool _511 = _507 || _509;
    bool _513 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _515 = _511 || _513;
    float _517 = float(_515);
    float _519 = fma(_501, _457, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _521 = fma(_505, _457, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _523 = _407 * _483;
    bool _525 = _395 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _527 = isnan(_395);
    bool _529 = _525 || _527;
    bool _531 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _533 = _529 || _531;
    float _535 = float(_533);
    float _537 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _539 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _537;
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _543 = _541 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _545 = fma(_539, _457, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _547 = -_535;
    float _549 = _547 + 1.0;
    float _551 = _535 * _495;
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _555 = _553 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _559 = _557 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _561 = _437 * _549;
    float _563 = -_437;
    float _565 = _563 + 1.0;
    float _567 = fma(_543, _485, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _569 = fma(_555, _485, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _571 = fma(_559, _485, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _573 = _517 * _565;
    float _575 = -_517;
    float _577 = _575 + 1.0;
    float _579 = _519 * _573;
    float _581 = _521 * _573;
    float _583 = _545 * _573;
    float _585 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _587 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _585;
    float _589 = fma(_577, (*spvDescriptorSet0.vp_c9)._m0[107].x, _579);
    float _591 = fma(_577, (*spvDescriptorSet0.vp_c9)._m0[107].y, _581);
    float _593 = fma(_577, (*spvDescriptorSet0.vp_c9)._m0[107].z, _583);
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _597 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _595;
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _601 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _599;
    float _603 = fma(_587, _497, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _605 = fma(_567, _561, _589);
    float _607 = fma(_571, _561, _593);
    float _609 = fma(_569, _561, _591);
    float _611 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _613 = _611 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _617 = _615 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _619 = fma(_597, _497, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _621 = fma(_601, _497, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _625 = _623 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _627 = fma(_603, _551, _605);
    float _629 = fma(_613, _523, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _631 = fma(_617, _523, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _633 = fma(_625, _523, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _635 = fma(_619, _551, _609);
    float _637 = fma(_621, _551, _607);
    float _639 = fma(_629, _491, _627);
    float _641 = fma(_631, _491, _635);
    float _643 = fma(_633, _491, _637);
    float _645 = fma(_469, (*spvDescriptorSet0.vp_c9)._m0[111].x, _639);
    float _647 = fma(_469, (*spvDescriptorSet0.vp_c9)._m0[111].y, _641);
    float _649 = fma(_469, (*spvDescriptorSet0.vp_c9)._m0[111].z, _643);
    bool _651 = !_445;
    float _669;
    if (!_651)
    {
        float _653 = in.m_53.x;
        float _655 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _657 = _653 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _659 = fma(_657, (*spvDescriptorSet0.vp_c9)._m0[11].y, _123);
        float _661 = _659 * _655;
        float _663 = floor(_661);
        float _665 = -_663;
        float _667 = _661 + _665;
        _669 = _667;
        _671 = true;
    }
    else
    {
        float _673 = float(_91);
        float _675 = 1.0 / _673;
        float _677 = _123 * _675;
        _669 = _677;
    }
    _671 = false;
    float _679 = _669;
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _683 = _679 + _681;
    float _685 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _687 = _685 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _689 = _679 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _691 = isnan(_679);
    bool _693 = _689 || _691;
    bool _695 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _697 = _693 || _695;
    float _699 = float(_697);
    float _701 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _703 = _701 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _707 = _705 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _709 = _679 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _711 = isnan(_679);
    bool _713 = _709 || _711;
    bool _715 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _717 = _713 || _715;
    float _719 = float(_717);
    float _721 = 1.0 / _687;
    float _723 = -_699;
    float _725 = _723 + 1.0;
    float _727 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _729 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _727;
    bool _731 = _679 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _733 = isnan(_679);
    bool _735 = _731 || _733;
    bool _737 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _739 = _735 || _737;
    float _741 = float(_739);
    float _743 = _719 * _725;
    float _745 = -_719;
    float _747 = _745 + 1.0;
    bool _749 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _751 = 1.0 / _703;
    float _753 = _741 * _747;
    float _755 = -_741;
    float _757 = _755 + 1.0;
    float _759 = 1.0 / _707;
    float _761 = _729 * _721;
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _765 = _763 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _767 = fma(_761, _683, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _769 = _765 * _751;
    bool _771 = _679 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _773 = isnan(_679);
    bool _775 = _771 || _773;
    bool _777 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _779 = _775 || _777;
    float _781 = float(_779);
    float _783 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _785 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _783;
    float _787 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _789 = _679 + _787;
    float _791 = _767 * _753;
    float _793 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _795 = _679 + _793;
    float _797 = -_781;
    float _799 = _797 + 1.0;
    float _801 = fma(_769, _789, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _803 = _785 * _759;
    float _805 = fma(_757, (*spvDescriptorSet0.vp_c9)._m0[115].x, _791);
    float _807 = _699 * _799;
    float _809 = _645 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _811 = fma(_803, _795, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _813 = fma(_801, _743, _805);
    float _815 = _649 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _817 = _809 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _819 = fma(_811, _807, _813);
    float _821 = _647 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _823 = _815 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _825 = fma(_781, (*spvDescriptorSet0.vp_c9)._m0[118].x, _819);
    float _827 = _821 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _829 = _825 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_57.x = _817;
    out.m_57.y = _827;
    out.m_57.z = _823;
    out.m_57.w = _829;
    bool _831 = !_749;
    float _849;
    if (!_831)
    {
        float _833 = in.m_53.x;
        float _835 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _837 = _833 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _839 = fma(_837, (*spvDescriptorSet0.vp_c9)._m0[11].z, _123);
        float _841 = _839 * _835;
        float _843 = floor(_841);
        float _845 = -_843;
        float _847 = _841 + _845;
        _849 = _847;
        _851 = true;
    }
    else
    {
        float _853 = float(_91);
        float _855 = 1.0 / _853;
        float _857 = _123 * _855;
        _849 = _857;
    }
    _851 = false;
    float _859 = _849;
    float _861 = as_type<float>(int(gl_VertexIndex));
    float _863 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _865 = _859 + _863;
    float _867 = in.m_44.x;
    float _869 = in.m_44.y;
    float _871 = in.m_44.z;
    float _873 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _875 = _859 + _873;
    float _877 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _879 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _877;
    float _881 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _883 = _881 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _885 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _887 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _889 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _891 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _889;
    float _893 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _895 = _893 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _897 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _899 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _897;
    float _901 = 1.0 / _883;
    int _903 = as_type<int>(_861) & 1;
    bool _905 = _903 != 0;
    int _907 = as_type<int>(_861) & 2;
    bool _909 = _907 != 0;
    int _911 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _913 = _911 != 0;
    float _915 = 1.0 / _879;
    int _917 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _919 = _917 != 0;
    float _921 = _869 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _923 = in.m_53.x;
    float _925 = in.m_53.y;
    float _927 = _869 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _929 = _869 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _931 = fma(_867, (*spvDescriptorSet0.vp_c10)._m0[5].x, _921);
    float _933 = fma(_867, (*spvDescriptorSet0.vp_c10)._m0[4].x, _927);
    float _935 = fma(_867, (*spvDescriptorSet0.vp_c10)._m0[6].x, _929);
    float _937 = fma(_871, (*spvDescriptorSet0.vp_c10)._m0[5].z, _931);
    float _939 = fma(_871, (*spvDescriptorSet0.vp_c10)._m0[4].z, _933);
    float _941 = fma(_871, (*spvDescriptorSet0.vp_c10)._m0[6].z, _935);
    float _943 = _937 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _945 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _947 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _949 = _939 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _951 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _953 = _943 + _951;
    float _955 = _941 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _957 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _959 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _957;
    float _961 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _963 = _949 + _961;
    float _965 = _953 * _953;
    float _967 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _969 = _955 + _967;
    float _971 = 1.0 / _959;
    float _973 = _865 * _901;
    float _975 = fma(_963, _963, _965);
    float _977 = _923 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _979 = _925 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _981 = _923 > 0.5;
    float _983 = fma(_923, (*spvDescriptorSet0.vp_c9)._m0[78].z, _887);
    float _985 = -_947;
    float _987 = fma(_977, 2.0, _985);
    float _989 = fma(_969, _969, _975);
    float _991 = fma(_979, -2.0, _945);
    float _993 = _167 * _167;
    float _995 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _997 = _995 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _999 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1001 = _859 + _999;
    float _1003 = rsqrt(_989);
    float _1005 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1007 = fma(_165, _165, _993);
    float _1009 = _1001 * _915;
    float _1011 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1013 = _859 + _1011;
    float _1015 = fma(_925, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1005);
    float _1017 = fma(_169, _169, _1007);
    float _1019 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].z, _983);
    float _1021 = 1.0 / _997;
    bool _1023 = _925 > 0.5;
    float _1025 = _1013 * _971;
    float _1027 = -_123;
    float _1029 = fma(_1027, (*spvDescriptorSet0.vp_c9)._m0[76].x, _987);
    float _1031 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[76].y, _991);
    float _1033 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1015);
    float _1035 = fma(_891, _1009, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1037 = rsqrt(_1017);
    float _1039 = _953 * _1003;
    float _1041 = _963 * _1003;
    float _1043 = _969 * _1003;
    float _1045 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1047 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1045;
    float _1049 = -_1039;
    float _1051 = fma(_1049, (*spvDescriptorSet0.vp_c9)._m0[18].w, _953);
    float _1053 = -_1041;
    float _1055 = fma(_1053, (*spvDescriptorSet0.vp_c9)._m0[18].w, _963);
    float _1057 = -_1043;
    float _1059 = fma(_1057, (*spvDescriptorSet0.vp_c9)._m0[18].w, _969);
    float _1061 = _875 * _1021;
    float _1063 = _1051 * _1051;
    float _1065 = fma(_1047, _1009, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1067 = fma(_899, _1009, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1069 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1071 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1069;
    float _1073 = fma(_1055, _1055, _1063);
    float _1075 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1077 = _1075 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1079 = fma(_895, _973, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1081 = _169 * _1037;
    float _1083 = _165 * _1037;
    float _1085 = _167 * _1037;
    float _1087 = fma(_1059, _1059, _1073);
    float _1089 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1091 = _1081 * _1089;
    float _1093 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1095 = _1083 * _1093;
    float _1097 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1099 = _1085 * _1097;
    float _1101 = sqrt(_1087);
    float _1103 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1105 = -_1091;
    float _1107 = fma(_1083, _1103, _1105);
    float _1109 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1111 = -_1095;
    float _1113 = fma(_1085, _1109, _1111);
    float _1115 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1117 = -_1099;
    float _1119 = fma(_1081, _1115, _1117);
    float _1121 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1123 = _1121 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1125 = _1107 * _1107;
    float _1127 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1129 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1127;
    float _1131 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1133 = _1131 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1135 = fma(_1123, _973, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1137 = fma(_1119, _1119, _1125);
    float _1139 = _885 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1141 = _859 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1143 = isnan(_859);
    bool _1145 = _1141 || _1143;
    bool _1147 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1149 = _1145 || _1147;
    float _1151 = float(_1149);
    float _1153 = fma(_1113, _1113, _1137);
    float _1155 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1157 = _1155 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1159 = fma(_1129, _1025, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1161 = _1003 * _1101;
    float _1163 = rsqrt(_1153);
    float _1165 = fma(_1157, _973, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1167 = fma(_1133, _1061, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1169 = _447 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1171 = -_1151;
    float _1173 = _1171 + 1.0;
    bool _1175 = _859 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1177 = isnan(_859);
    bool _1179 = _1175 || _1177;
    bool _1181 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1183 = _1179 || _1181;
    float _1185 = float(_1183);
    float _1187 = _1169 * _1161;
    bool _1189 = _859 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1191 = isnan(_859);
    bool _1193 = _1189 || _1191;
    bool _1195 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1197 = _1193 || _1195;
    float _1199 = float(_1197);
    float _1201 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1203 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1201;
    float _1205 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1207 = _1205 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1209 = -_1185;
    float _1211 = _1209 + 1.0;
    bool _1213 = _859 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1215 = isnan(_859);
    bool _1217 = _1213 || _1215;
    bool _1219 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1221 = _1217 || _1219;
    float _1223 = float(_1221);
    float _1225 = fma(_1203, _1025, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1227 = fma(_1207, _1061, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1229 = fma(_1077, _1061, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1231 = fma(_1071, _1025, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    bool _1233 = !_905;
    float _1235 = _1233 ? (-0.5) : 0.5;
    float _1237 = _455 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _1239 = !_909;
    float _1241 = _1239 ? (-0.5) : 0.5;
    float _1243 = _1119 * _1163;
    float _1245 = _1107 * _1163;
    float _1247 = _1113 * _1163;
    bool _1249 = _859 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1251 = isnan(_859);
    bool _1253 = _1249 || _1251;
    bool _1255 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1257 = _1253 || _1255;
    float _1259 = float(_1257);
    float _1261 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1235);
    float _1263 = _1237 * _1161;
    float _1265 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1241);
    float _1267 = _1085 * _1247;
    float _1269 = _1259 * _1173;
    float _1271 = _1263 * _1261;
    float _1273 = -_1259;
    float _1275 = _1273 + 1.0;
    float _1277 = _1187 * _1265;
    float _1279 = _1161 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1281 = _1279 * 0.5;
    float _1283 = _1199 * _1211;
    float _1285 = _1185 * _1275;
    float _1287 = _1277 * _1083;
    float _1289 = _1083 * _1245;
    float _1291 = _1277 * _1081;
    float _1293 = -_1267;
    float _1295 = fma(_1081, _1245, _1293);
    float _1297 = fma(_1271, _1243, _1287);
    float _1299 = -_1289;
    float _1301 = fma(_1085, _1243, _1299);
    float _1303 = fma(_1271, _1247, _1291);
    float _1305 = -_1199;
    float _1307 = _1305 + 1.0;
    float _1309 = fma(_1281, _1295, _1297);
    float _1311 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1313 = fma(_1281, _1301, _1303);
    float _1315 = -_1235;
    int _1317 = _981 ? as_type<int>(_1315) : as_type<int>(_1235);
    float _1319 = _1223 * _1307;
    float _1321 = _949 + _1309;
    float _1323 = _955 + _1313;
    bool _1325 = !_913;
    float _1327 = _1325 ? _1235 : as_type<float>(_1317);
    float _1329 = _1035 * _1319;
    float _1331 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1333 = _1321 + _1331;
    float _1335 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1337 = _1323 + _1335;
    float _1339 = _1065 * _1319;
    float _1341 = _1327 + 0.5;
    float _1343 = _1333 * _1333;
    float _1345 = _1337 * _1337;
    float _1347 = _1067 * _1319;
    float _1349 = -_1223;
    float _1351 = _1349 + 1.0;
    float _1353 = fma(_1139, _1341, _1029);
    float _1355 = _1343 + _1345;
    float _1357 = -_1241;
    int _1359 = _1023 ? as_type<int>(_1357) : as_type<int>(_1241);
    float _1361 = fma(_1351, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1329);
    float _1363 = fma(_1351, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1339);
    float _1365 = sqrt(_1355);
    bool _1367 = !_919;
    float _1369 = _1367 ? _1241 : as_type<float>(_1359);
    float _1371 = fma(_1079, _1283, _1361);
    float _1373 = fma(_1135, _1283, _1363);
    float _1375 = _1311 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1377 = _1277 * _1085;
    float _1379 = _1369 + (-0.5);
    float _1381 = fma(_1225, _1285, _1373);
    float _1383 = fma(_1351, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1347);
    float _1385 = fma(_1271, _1245, _1377);
    float _1387 = -_1375;
    float _1389 = -_1031;
    float _1391 = fma(_1387, _1379, _1389);
    float _1393 = _1081 * _1243;
    float _1395 = fma(_1227, _1269, _1381);
    float _1397 = fma(_1165, _1283, _1383);
    float _1399 = fma(_1159, _1285, _1371);
    float _1401 = -_1393;
    float _1403 = fma(_1083, _1247, _1401);
    bool _1405 = _1365 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1407 = fma(_1231, _1285, _1397);
    float _1409 = fma(_1167, _1269, _1399);
    float _1411 = fma(_1281, _1403, _1385);
    float _1413 = _1241 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1415 = fma(_1229, _1269, _1407);
    float _1417 = fma(_1151, (*spvDescriptorSet0.vp_c9)._m0[127].x, _1409);
    float _1419 = _943 + _1411;
    float _1421 = fma(_1151, (*spvDescriptorSet0.vp_c9)._m0[127].y, _1395);
    float _1423 = fma(_1151, (*spvDescriptorSet0.vp_c9)._m0[127].z, _1415);
    float _1425 = _1235 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1427 = _1083 * _1413;
    float _1429 = _1085 * _1413;
    float _1431 = _1167;
    float _1433 = _1343;
    float _1435 = _1345;
    float _1437 = _1321;
    float _1439 = _1323;
    float _1441 = _1417;
    float _1443 = _1017;
    float _1445 = _955;
    float _1447 = _943;
    if (!_1405)
    {
        _1431 = _1419;
    }
    float _1449 = _1431;
    bool _1451 = !_1405;
    float _1453 = _1449;
    if (!_1451)
    {
        float _1455 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1457 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1459 = _1365 + _1457;
        float _1461 = _1419 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1463 = rsqrt(_1355);
        float _1465 = _1459 * _1455;
        float _1467 = _1465 * 0.15915493667125701904296875;
        float _1469 = _1467 * 6.283185482025146484375;
        float _1471 = sin(_1469);
        float _1473 = _1467 * 6.283185482025146484375;
        float _1475 = cos(_1473);
        float _1477 = fma(_1471, _1461, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1479 = _1463 * _1477;
        float _1481 = fma(_1333, _1479, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1483 = _1475 + (-1.0);
        float _1485 = fma(_1337, _1479, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1487 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1489 = _1481 + _1487;
        float _1491 = _1483 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1493 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1495 = _1485 + _1493;
        float _1497 = _1489 * _1489;
        float _1499 = fma(_1419, _1475, _1491);
        float _1501 = _1495 * _1495;
        _1453 = _1499;
        _1433 = _1497;
        _1435 = _1501;
        _1437 = _1481;
        _1439 = _1485;
    }
    float _1503 = _1453;
    float _1505 = _1433;
    float _1507 = _1435;
    float _1509 = _1437;
    float _1511 = _1439;
    float _1513 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1515 = _1503 + _1513;
    float _1517 = fma(_1243, _1425, _1427);
    float _1519 = _1081 * _1413;
    float _1521 = -_1019;
    float _1523 = _1521 + 1.0;
    float _1525 = fma(_1515, _1515, _1505);
    float _1527 = -_1033;
    float _1529 = _1527 + 1.0;
    float _1531 = fma(_1247, _1425, _1519);
    float _1533 = -_1523;
    float _1535 = fma(_1327, _1533, _1353);
    float _1537 = _1525 + _1507;
    float _1539 = fma(_1245, _1425, _1429);
    float _1541 = _1417 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1543 = _1421 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1545 = _1423 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1547 = fma(_1369, _1529, _1391);
    float _1549 = sqrt(_1537);
    float _1551 = _1295 + _1517;
    float _1553 = _1403 + _1539;
    float _1555 = _1541 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1557 = _1543 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1559 = _1545 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1561 = _1301 + _1531;
    out.m_62.x = _1535;
    out.m_62.y = _1547;
    out.m_64.x = _1555;
    out.m_64.y = _1557;
    out.m_64.z = _1559;
    out.m_66.x = _1551;
    out.m_66.y = _1553;
    out.m_66.z = _1561;
    bool _1563 = _1549 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1565 = isnan(_1549);
    bool _1567 = _1563 || _1565;
    bool _1569 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1571 = _1567 || _1569;
    float _1573 = _1531;
    if (!_1571)
    {
        _1441 = 1.0;
    }
    float _1575 = _1441;
    bool _1577 = !_1571;
    float _1579 = _1575;
    if (!_1577)
    {
        bool _1581 = _1549 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1583 = isnan(_1549);
        bool _1585 = _1581 || _1583;
        bool _1587 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1589 = _1585 || _1587;
        if (!_1589)
        {
            float _1591 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1593 = _1549 + _1591;
            float _1595 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1597 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1595;
            float _1599 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1601 = _1599 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1603 = 1.0 / _1597;
            float _1605 = _1593 * _1603;
            float _1607 = fma(_1605, _1601, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1579 = _1607;
            _1609 = true;
        }
        else
        {
            bool _1611 = _1549 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1613 = isnan(_1549);
            bool _1615 = _1611 || _1613;
            bool _1617 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1619 = _1615 || _1617;
            if (!_1619)
            {
                float _1621 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1623 = _1549 + _1621;
                float _1625 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1627 = _1625 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1629 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1631 = _1629 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1633 = 1.0 / _1627;
                float _1635 = _1623 * _1633;
                float _1637 = fma(_1635, _1631, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1579 = _1637;
                _1609 = true;
            }
            else
            {
                _1579 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1609 = false;
    float _1639 = _1579;
    float _1641 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1643 = _1503 + _1641;
    float _1645 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1647 = _1509 + _1645;
    float _1649 = -_1041;
    float _1651 = fma(_1649, (*spvDescriptorSet0.vp_c9)._m0[18].w, _949);
    float _1653 = fma(_1643, _1639, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1655 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1657 = _1511 + _1655;
    float _1659 = fma(_1647, _1639, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1661 = -_943;
    float _1663 = _1661 + _1653;
    float _1665 = fma(_1657, _1639, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1667 = -_949;
    float _1669 = _1667 + _1659;
    float _1671 = _1663 * _1663;
    float _1673 = -_955;
    float _1675 = _1673 + _1665;
    float _1677 = fma(_1669, _1669, _1671);
    float _1679 = fma(_1675, _1675, _1677);
    float _1681 = sqrt(_1679);
    bool _1683 = _1681 > 0.0;
    bool _1685 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1687 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1689 = _1685 || _1687;
    bool _1691 = isnan(0.5);
    bool _1693 = _1689 || _1691;
    float _1695 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1697 = _1639;
    float _1699 = _1665;
    float _1701 = _1669;
    if (!_1683)
    {
        _1695 = _1659;
    }
    float _1703 = _1695;
    float _1705 = _1703;
    if (!_1683)
    {
        _1697 = _1653;
    }
    float _1707 = _1697;
    bool _1709 = !_1683;
    float _1711 = _1707;
    float _1713 = _1707;
    if (!_1709)
    {
        float _1715 = sqrt(_1017);
        float _1717 = rsqrt(_1679);
        bool _1719 = _1715 > 0.0;
        float _1721 = _1669 * _1717;
        float _1723 = _1663 * _1717;
        float _1725 = _1675 * _1717;
        float _1727 = _1717;
        _1701 = _1721;
        _1443 = _1715;
        if (!_1719)
        {
            _1727 = _1659;
        }
        float _1729 = _1727;
        _1705 = _1729;
        if (!_1719)
        {
            _1711 = _1653;
        }
        float _1731 = _1711;
        bool _1733 = !_1719;
        _1713 = _1731;
        if (!_1733)
        {
            float _1735 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1737 = _1085 * _1723;
            float _1739 = fma(_1083, _1721, _1737);
            float _1741 = fma(_1081, _1725, _1739);
            float _1743 = _1735 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1745 = _1741 * _1743;
            float _1747 = fma(_165, _1745, _1659);
            float _1749 = fma(_167, _1745, _1653);
            float _1751 = fma(_169, _1745, _1665);
            _1713 = _1749;
            _1699 = _1751;
            _1705 = _1747;
        }
    }
    float _1753 = _1713;
    float _1755 = _1699;
    float _1757 = _1705;
    float _1759 = _1701;
    float _1761 = _1443;
    float _1763 = -_1039;
    float _1765 = fma(_1763, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1753);
    float _1767 = -_1043;
    float _1769 = fma(_1767, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1755);
    float _1771 = -_1041;
    float _1773 = fma(_1771, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1757);
    float _1775 = -_1039;
    float _1777 = fma(_1775, (*spvDescriptorSet0.vp_c9)._m0[18].w, _943);
    float _1779 = -_1043;
    float _1781 = fma(_1779, (*spvDescriptorSet0.vp_c9)._m0[18].w, _955);
    float _1783 = _1765;
    float _1785 = _1773;
    float _1787 = _1769;
    float _1789 = _1759;
    float _1791 = _1761;
    float _1793 = _1781;
    if (!_1693)
    {
        float _1795 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1797 = _1777 + _1795;
        float _1799 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1801 = _1651 + _1799;
        float _1803 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1805 = -_949;
        float _1807 = _1805 + _1757;
        float _1809 = _1797 * _1797;
        float _1811 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1813 = _1781 + _1811;
        float _1815 = -_943;
        float _1817 = _1815 + _1753;
        float _1819 = -_955;
        float _1821 = _1819 + _1755;
        float _1823 = fma(_1801, _1801, _1809);
        float _1825 = fma(_1813, _1813, _1823);
        float _1827 = 1.0 / _1161;
        float _1829 = sqrt(_1825);
        float _1831 = _1807 * _1827;
        float _1833 = _1817 * _1827;
        float _1835 = _1821 * _1827;
        bool _1837 = _1829 > (*spvDescriptorSet0.vp_c9)._m0[199].x;
        bool _1839 = isnan(_1829);
        bool _1841 = _1837 || _1839;
        bool _1843 = isnan((*spvDescriptorSet0.vp_c9)._m0[199].x);
        bool _1845 = _1841 || _1843;
        float _1847 = precise::min(_1829, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1849 = _1847 * _1803;
        float _1851 = fma(_1831, _1849, _1651);
        float _1853 = fma(_1833, _1849, _1777);
        float _1855 = _1765;
        float _1857 = _1829;
        float _1859 = _1821;
        _173 = _1849;
        _1445 = _1831;
        _1447 = _1833;
        if (_1845)
        {
            float _1861 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
            _1855 = _1861;
        }
        float _1863 = _1855;
        if (_1845)
        {
            float _1865 = precise::max(_1829, (*spvDescriptorSet0.vp_c9)._m0[199].y);
            _1857 = _1865;
        }
        float _1867 = _1857;
        float _1869 = fma(_1835, _1849, _1781);
        float _1871 = _1867;
        float _1873 = _1863;
        _1787 = _1869;
        if (_1845)
        {
            float _1875 = _1867 * _1863;
            _1859 = _1875;
        }
        float _1877 = _1859;
        if (!_1845)
        {
            _1871 = _1851;
        }
        float _1879 = _1871;
        float _1881 = _1879;
        if (!_1845)
        {
            _1873 = _1853;
        }
        float _1883 = _1873;
        float _1885 = _1883;
        if (_1845)
        {
            float _1887 = fma(_1831, _1877, _1651);
            _1881 = _1887;
        }
        float _1889 = _1881;
        _1785 = _1889;
        if (_1845)
        {
            float _1891 = fma(_1833, _1877, _1777);
            _1885 = _1891;
        }
        float _1893 = _1885;
        _1783 = _1893;
        if (_1845)
        {
            float _1895 = fma(_1835, _1877, _1781);
            _1787 = _1895;
        }
    }
    float _1897 = _1783;
    float _1899 = _1785;
    float _1901 = _1787;
    float _1903 = _173;
    float _1905 = _1445;
    float _1907 = _1447;
    float _1909 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1911 = _1897 + _1909;
    float _1913 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1915 = _1899 + _1913;
    float _1917 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1919 = _1901 + _1917;
    float _1921 = _1911 * _1911;
    float _1923 = fma(_1915, _1915, _1921);
    float _1925 = fma(_1919, _1919, _1923);
    float _1927 = rsqrt(_1925);
    float _1929 = _1927 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1931 = _1915 * _1929;
    float _1933 = _1919 * _1929;
    float _1935 = _1931 * _1931;
    float _1937 = _1933 * _1933;
    float _1939 = _1935 + _1937;
    float _1941 = sqrt(_1939);
    bool _1943 = _1941 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1945 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1947 = _1941 + _1945;
    float _1949 = _169;
    float _1951 = _1939;
    float _1953 = _1947;
    float _1955 = _1905;
    if (_1943)
    {
        float _1957 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1949 = _1957;
    }
    float _1959 = _1949;
    if (_1943)
    {
        float _1961 = rsqrt(_1939);
        _1951 = _1961;
    }
    float _1963 = _1951;
    float _1965 = _1963;
    if (_1943)
    {
        float _1967 = _1947 * _1959;
        _1953 = _1967;
    }
    float _1969 = _1953;
    if (_1943)
    {
        float _1971 = _1969 * 0.15915493667125701904296875;
        _1955 = _1971;
    }
    float _1973 = _1955;
    float _1975 = _1903;
    if (_1943)
    {
        float _1977 = _1973 * 6.283185482025146484375;
        float _1979 = sin(_1977);
        _1975 = _1979;
    }
    float _1981 = _1975;
    float _1983 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1985 = precise::max(0.0, _1983);
    float _1987 = _1907;
    float _1989 = _1985;
    float _1991 = _1983;
    if (_1943)
    {
        float _1993 = _1973 * 6.283185482025146484375;
        float _1995 = cos(_1993);
        _1987 = _1995;
    }
    float _1997 = _1987;
    float _1999 = -_1929;
    float _2001 = -_1985;
    float _2003 = fma(_1911, _1999, _2001);
    if (_1943)
    {
        float _2005 = _2003 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1989 = _2005;
    }
    float _2007 = _1989;
    float _2009 = sqrt(_1925);
    float _2011 = _1981;
    float _2013 = _2007;
    if (_1943)
    {
        float _2015 = fma(_1981, _2007, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2011 = _2015;
    }
    float _2017 = _2011;
    float _2019 = _2017;
    if (!_1943)
    {
        _2013 = _1931;
    }
    float _2021 = _2013;
    float _2023 = _2021;
    float _2025 = _1997;
    if (_1943)
    {
        float _2027 = _1997 + (-1.0);
        _1991 = _2027;
    }
    float _2029 = _1991;
    float _2031 = _2029;
    if (_1943)
    {
        float _2033 = _1963 * _2017;
        _1789 = _2033;
    }
    float _2035 = _1789;
    if (!_1943)
    {
        _2019 = _2003;
    }
    float _2037 = _2019;
    float _2039 = _2037;
    if (_1943)
    {
        float _2041 = _2029 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1791 = _2041;
    }
    float _2043 = _1791;
    if (_1943)
    {
        float _2045 = _1931 * _2035;
        _2023 = _2045;
    }
    float _2047 = _2023;
    if (!_1943)
    {
        _2031 = _1933;
    }
    float _2049 = _2031;
    float _2051 = _2049;
    if (_1943)
    {
        float _2053 = _1933 * _2035;
        _2051 = _2053;
    }
    float _2055 = _2051;
    if (!_1943)
    {
        _1965 = _1935;
    }
    float _2057 = _1965;
    float _2059 = _2057;
    if (_1943)
    {
        float _2061 = fma(_2003, _1997, _2043);
        _2039 = _2061;
    }
    float _2063 = _2039;
    if (_1943)
    {
        float _2065 = _2047 * _2047;
        _2059 = _2065;
    }
    float _2067 = _2059;
    if (!_1943)
    {
        _2025 = _1937;
    }
    float _2069 = _2025;
    float _2071 = _2069;
    if (_1943)
    {
        float _2073 = _2055 * _2055;
        _2071 = _2073;
    }
    float _2075 = _2071;
    float _2077 = fma(_2063, _2063, _2067);
    float _2079 = _2077 + _2075;
    float _2081 = _1897 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2083 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2085 = fma(_2009, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2083);
    float _2087 = precise::clamp(_2085, 0.0, 1.0);
    float _2089 = _1897 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2091 = rsqrt(_2079);
    float _2093 = fma(_1899, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2081);
    float _2095 = -_2087;
    float _2097 = _2095 + 1.0;
    float _2099 = _1897 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2101 = fma(_1899, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2089);
    float _2103 = fma(_1901, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2093);
    float _2105 = _1897 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2107 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2109 = abs(_2097);
    float _2111 = log2(_2109);
    float _2113 = _2103 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2115 = fma(_1899, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2099);
    float _2117 = fma(_1901, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2101);
    float _2119 = fma(_1899, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2105);
    float _2121 = _2113 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2123 = fma(_1901, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2115);
    float _2125 = _2117 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2127 = _2091 * _2047;
    float _2129 = -_2121;
    float _2131 = fma(_2129, _2107, 1.0);
    float _2133 = fma(_1901, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2119);
    float _2135 = _2123 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2137 = _2125 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2139 = _2091 * _2063;
    float _2141 = _2127 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2143 = _2133 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2145 = fma(_2135, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2137);
    float _2147 = _2111 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2149 = _2091 * _2055;
    float _2151 = -_2141;
    float _2153 = fma(_2139, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2151);
    float _2155 = fma(_2113, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2145);
    float _2157 = exp2(_2147);
    float _2159 = _2125 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2161 = -_2149;
    float _2163 = fma(_2161, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2153);
    float _2165 = fma(_2143, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2155);
    float _2167 = _2125 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2169 = fma(_2135, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2159);
    float _2171 = fma(_2163, -0.5, 0.5);
    float _2173 = fma(_2163, 0.5, 0.5);
    float _2175 = log2(_2131);
    float _2177 = fma(_2135, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2167);
    float _2179 = _2139 + 1.0;
    float _2181 = fma(_2113, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2169);
    float _2183 = fma(_2173, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2185 = fma(_2113, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2177);
    float _2187 = 1.0 / _2165;
    float _2189 = -_2139;
    float _2191 = fma(_2157, _2179, _2189);
    float _2193 = fma(_2143, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2181);
    float _2195 = fma(_2143, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2185);
    float _2197 = fma(_2173, _2183, -0.212114393711090087890625);
    float _2199 = sqrt(_2171);
    float _2201 = _2175 * 0.693147182464599609375;
    float _2203 = fma(_2173, _2197, 1.570728778839111328125);
    float _2205 = _2201 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2207 = fma(_2191, 0.5, 0.5);
    float _2209 = _2193 * _2187;
    float _2211 = _2195 * _2187;
    float _2213 = fma(_2209, 0.5, 0.5);
    float _2215 = fma(_2211, -0.5, 0.5);
    float _2217 = _2199 * 0.636619746685028076171875;
    float3 _5970 = float3(_2213, _2215, _2205);
    float _2219 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5970, float3(0.0), isnan(_5970)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5970, float3(0.0), isnan(_5970)), level(0.0)).x;
    float3 _5981 = float3(_2213, _2215, _2205);
    float4 _2222 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5981, float3(0.0), isnan(_5981)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5981, float3(0.0), isnan(_5981)), level(0.0)).xyzw;
    float _2224 = _2222.x;
    float _2226 = _2222.y;
    float _2228 = _2222.z;
    float _2230 = _2222.w;
    float _2232 = -_2203;
    float _2234 = fma(_2217, _2232, 1.0);
    float2 _6003 = float2(_2234, _2207);
    float3 _2238 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6003, float2(0.0), isnan(_6003)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6003, float2(0.0), isnan(_6003)), level(0.0)).xyz;
    float _2240 = _2238.x;
    float _2242 = _2238.y;
    float _2244 = _2238.z;
    float _2246 = _1777 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2248 = _2111 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_68.x = _1915;
    out.m_68.y = _1911;
    out.m_68.z = _1919;
    float _2250 = fma(_1651, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2246);
    bool _2252 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2254 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2256 = _2252 || _2254;
    bool _2258 = isnan(0.5);
    bool _2260 = _2256 || _2258;
    float _2262 = fma(_1781, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2250);
    float _2264 = _1777 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2266 = exp2(_2248);
    float _2268 = _2262 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2270 = fma(_1651, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2264);
    float _2272 = fma(_1781, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2270);
    float _2274 = _2205;
    float _2276 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _2278 = _2268;
    float _2280 = _2213;
    if (!_2260)
    {
        _1573 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _2282 = _1573;
    float _2284 = 1.0 / _2268;
    if (_2260)
    {
        _1793 = 1.0;
    }
    float _2286 = _1793;
    float _2288 = _2272 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2290 = _2288 + _2268;
    float _2292 = _2286;
    if (!_2260)
    {
        float _2294 = -_2282;
        float _2296 = _2294 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _2274 = _2296;
    }
    float _2298 = _2274;
    float _2300 = -_2266;
    float _2302 = _2300 + 1.0;
    float _2304 = _2298;
    if (!_2260)
    {
        float _2306 = 1.0 / _2298;
        _2304 = _2306;
    }
    float _2308 = _2304;
    float _2310 = _2290 * _2284;
    float _2312 = _2310 * 0.5;
    float _2314 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2316 = fma(_2312, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2314);
    float _2318 = _2312;
    float _2320 = _2284;
    if (!_2260)
    {
        _2318 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2322 = _2318;
    float _2324 = 1.0 / _2316;
    float _2326 = _2322;
    if (!_2260)
    {
        float _2328 = -_2322;
        float _2330 = _2328 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2276 = _2330;
    }
    float _2332 = _2276;
    float _2334 = _2215;
    if (!_2260)
    {
        float _2336 = 1.0 / _2332;
        _2334 = _2336;
    }
    float _2338 = _2334;
    if (!_2260)
    {
        float _2340 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2342 = -_2282;
        float _2344 = fma(_2324, _2340, _2342);
        _2320 = _2344;
    }
    float _2346 = _2320;
    if (!_2260)
    {
        float _2348 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2350 = -_2322;
        float _2352 = fma(_2324, _2348, _2350);
        _2278 = _2352;
    }
    float _2354 = _2278;
    if (_2260)
    {
        _2326 = 1.0;
    }
    float _2356 = _2326;
    float _2358 = _2193 + _2165;
    float _2360 = _2356;
    if (!_2260)
    {
        float _2362 = _2346 * _2308;
        float _2364 = precise::clamp(_2362, 0.0, 1.0);
        _2280 = _2364;
    }
    float _2366 = _2280;
    float _2368 = _2125 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2370 = _2358 * 0.5;
    if (!_2260)
    {
        float _2372 = _2354 * _2338;
        float _2374 = precise::clamp(_2372, 0.0, 1.0);
        _2360 = _2374;
    }
    float _2376 = _2360;
    float _2378 = fma(_2135, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2368);
    if (!_2260)
    {
        float _2380 = -_2366;
        float _2382 = _2380 + 1.0;
        _2292 = _2382;
    }
    float _2384 = _2292;
    float _2386 = fma(_2113, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2378);
    float _2388 = _2165 * 0.5;
    float _2390 = _2376 * _2384;
    bool _2392 = _2376 > 0.0;
    bool _2394 = isnan(_2376);
    bool _2396 = _2392 || _2394;
    bool _2398 = isnan(0.0);
    bool _2400 = _2396 || _2398;
    float _2402 = fma(_2195, -0.5, _2388);
    float _2404 = _2302 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2406 = _2390 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2408 = fma(_2143, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2386);
    bool _2410 = _2384 <= 0.0;
    bool _2412 = !_2400;
    bool _2414 = _2410 || _2412;
    float _2416 = _2406 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2418 = _2408 + _2165;
    out.gl_Position.x = _2193;
    out.gl_Position.y = _2195;
    out.gl_Position.z = _2408;
    out.gl_Position.w = _2165;
    float _2420 = _2418 * 0.5;
    out.m_47.x = _2416;
    out.m_70.x = _2370;
    out.m_70.y = _2402;
    out.m_70.z = _2420;
    out.m_70.w = _2165;
    float _2422 = _2404 * _2219;
    float _2424 = -_2404;
    float _2426 = _2424 + 1.0;
    float _2428 = _2230 * _2422;
    float _2430 = _2230 * _2426;
    float _2432 = _2244 * _2422;
    float _2434 = fma(_2240, _2428, _2224);
    float _2436 = fma(_2242, _2428, _2226);
    float _2438 = fma(_2230, _2432, _2228);
    out.m_72.x = _2434;
    out.m_72.y = _2436;
    out.m_72.z = _2438;
    out.m_72.w = _2430;
    if (!_2414)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _2440 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2440;
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
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1609 = false;
    bool _851 = false;
    bool _671 = false;
    bool _387 = false;
    bool _193 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _86 = in.m_44.w;
    float _88 = trunc(_86);
    int _91 = int(_88);
    bool _95 = _91 >= 1;
    float _97 = 0.0;
    if (!_95)
    {
        _97 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _99 = _97;
    float _101 = _99;
    if (!_95)
    {
        out.m_47.x = 0.0;
    }
    int _103 = 0;
    if (!_95)
    {
        float _105 = _99 * 5.0;
        _103 = as_type<int>(_105);
    }
    int _107 = _103;
    if (!_95)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2496 = as_type<float>(_107);
        out.gl_Position.z = _2496;
    }
    if (!_95)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _109 = in.m_49.w;
    bool _111 = _109 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _113 = isnan(_109);
    bool _115 = _111 || _113;
    bool _117 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _119 = _115 || _117;
    float _121 = -_109;
    float _123 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _125 = 0.0;
    if (_119)
    {
        float _127 = float(_91);
        _125 = _127;
    }
    float _129 = _125;
    bool _131 = _123 >= _129;
    bool _133 = !_119;
    bool _135 = _131 || _133;
    if (_135)
    {
        _101 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _137 = _101;
    if (_135)
    {
        out.m_47.x = 0.0;
    }
    int _139 = 0;
    if (_135)
    {
        float _141 = _137 * 5.0;
        _139 = as_type<int>(_141);
    }
    int _143 = _139;
    if (_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2564 = as_type<float>(_143);
        out.gl_Position.z = _2564;
    }
    if (_135)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _145 = in.m_51.x;
    float _147 = in.m_51.y;
    float _149 = in.m_51.z;
    bool _151 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _153 = _147 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _155 = _147 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _157 = _147 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _159 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[4].x, _153);
    float _161 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[5].x, _155);
    float _163 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[6].x, _157);
    float _165 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[4].z, _159);
    float _167 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[5].z, _161);
    float _169 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[6].z, _163);
    bool _171 = !_151;
    float _173 = _167;
    float _191;
    if (!_171)
    {
        float _175 = in.m_53.x;
        float _177 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _179 = _175 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _181 = fma(_179, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _183 = _181 * _177;
        float _185 = floor(_183);
        float _187 = -_185;
        float _189 = _183 + _187;
        _191 = _189;
        _193 = true;
    }
    else
    {
        float _195 = float(_91);
        float _197 = 1.0 / _195;
        float _199 = _123 * _197;
        _191 = _199;
    }
    _193 = false;
    float _201 = _191;
    float _203 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _205 = _201 + _203;
    float _207 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _209 = _201 + _207;
    bool _211 = _201 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _213 = isnan(_201);
    bool _215 = _211 || _213;
    bool _217 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _219 = _215 || _217;
    float _221 = float(_219);
    float _223 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _225 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _223;
    float _227 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _229 = _227 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _233 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _231;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _237 = _201 + _235;
    bool _239 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _241 = 1.0 / _229;
    float _243 = 1.0 / _225;
    float _245 = 1.0 / _233;
    float _247 = _237 * _241;
    bool _249 = _201 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _251 = isnan(_201);
    bool _253 = _249 || _251;
    bool _255 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _257 = _253 || _255;
    float _259 = float(_257);
    float _261 = _205 * _243;
    bool _263 = _201 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _265 = isnan(_201);
    bool _267 = _263 || _265;
    bool _269 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _271 = _267 || _269;
    float _273 = float(_271);
    float _275 = -_221;
    float _277 = _275 + 1.0;
    bool _279 = _201 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _281 = isnan(_201);
    bool _283 = _279 || _281;
    bool _285 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _287 = _283 || _285;
    float _289 = float(_287);
    float _291 = _273 * _277;
    float _293 = _209 * _245;
    float _295 = -_273;
    float _297 = _295 + 1.0;
    float _299 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _301 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _299;
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _305 = _303 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _307 = _289 * _297;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _311 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _309;
    float _313 = -_289;
    float _315 = _313 + 1.0;
    float _317 = fma(_301, _261, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _321 = _319 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _323 = fma(_311, _261, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _325 = _259 * _315;
    float _327 = -_259;
    float _329 = _327 + 1.0;
    float _331 = _323 * _325;
    float _333 = _317 * _325;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _337 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _335;
    float _339 = fma(_321, _247, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _341 = fma(_305, _247, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _345 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _343;
    float _347 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[143].x, _331);
    float _349 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[143].y, _333);
    float _351 = fma(_337, _293, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _353 = fma(_345, _293, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _355 = fma(_339, _307, _347);
    float _357 = fma(_341, _307, _349);
    float _359 = fma(_351, _291, _355);
    float _361 = fma(_353, _291, _357);
    float _363 = fma(_221, (*spvDescriptorSet0.vp_c9)._m0[146].x, _359);
    float _365 = fma(_221, (*spvDescriptorSet0.vp_c9)._m0[146].y, _361);
    bool _367 = !_239;
    float _385;
    if (!_367)
    {
        float _369 = in.m_53.x;
        float _371 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _373 = _369 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _375 = fma(_373, (*spvDescriptorSet0.vp_c9)._m0[11].x, _123);
        float _377 = _375 * _371;
        float _379 = floor(_377);
        float _381 = -_379;
        float _383 = _377 + _381;
        _385 = _383;
        _387 = true;
    }
    else
    {
        float _389 = float(_91);
        float _391 = 1.0 / _389;
        float _393 = _123 * _391;
        _385 = _393;
    }
    _387 = false;
    float _395 = _385;
    float _397 = in.m_55.x;
    float _399 = in.m_55.y;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _403 = _395 + _401;
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _407 = _395 + _405;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _411 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _409;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _415 = _413 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _417 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _419 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _417;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _423 = _421 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _425 = 1.0 / _411;
    bool _427 = _395 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _429 = isnan(_395);
    bool _431 = _427 || _429;
    bool _433 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _435 = _431 || _433;
    float _437 = float(_435);
    float _439 = 1.0 / _415;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _443 = _395 + _441;
    bool _445 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _447 = _365 * _399;
    float _449 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _451 = _395 + _449;
    float _453 = 1.0 / _419;
    float _455 = _363 * _397;
    float _457 = _451 * _425;
    bool _459 = _395 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _461 = isnan(_395);
    bool _463 = _459 || _461;
    bool _465 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _467 = _463 || _465;
    float _469 = float(_467);
    bool _471 = _395 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _473 = isnan(_395);
    bool _475 = _471 || _473;
    bool _477 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _479 = _475 || _477;
    float _481 = float(_479);
    float _483 = 1.0 / _423;
    float _485 = _443 * _439;
    float _487 = -_469;
    float _489 = _487 + 1.0;
    float _491 = _481 * _489;
    float _493 = -_481;
    float _495 = _493 + 1.0;
    float _497 = _403 * _453;
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _501 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _499;
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _505 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _503;
    bool _507 = _395 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _509 = isnan(_395);
    bool _511 = _507 || _509;
    bool _513 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _515 = _511 || _513;
    float _517 = float(_515);
    float _519 = fma(_501, _457, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _521 = fma(_505, _457, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _523 = _407 * _483;
    bool _525 = _395 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _527 = isnan(_395);
    bool _529 = _525 || _527;
    bool _531 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _533 = _529 || _531;
    float _535 = float(_533);
    float _537 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _539 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _537;
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _543 = _541 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _545 = fma(_539, _457, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _547 = -_535;
    float _549 = _547 + 1.0;
    float _551 = _535 * _495;
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _555 = _553 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _559 = _557 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _561 = _437 * _549;
    float _563 = -_437;
    float _565 = _563 + 1.0;
    float _567 = fma(_543, _485, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _569 = fma(_555, _485, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _571 = fma(_559, _485, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _573 = _517 * _565;
    float _575 = -_517;
    float _577 = _575 + 1.0;
    float _579 = _519 * _573;
    float _581 = _521 * _573;
    float _583 = _545 * _573;
    float _585 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _587 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _585;
    float _589 = fma(_577, (*spvDescriptorSet0.vp_c9)._m0[107].x, _579);
    float _591 = fma(_577, (*spvDescriptorSet0.vp_c9)._m0[107].y, _581);
    float _593 = fma(_577, (*spvDescriptorSet0.vp_c9)._m0[107].z, _583);
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _597 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _595;
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _601 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _599;
    float _603 = fma(_587, _497, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _605 = fma(_567, _561, _589);
    float _607 = fma(_571, _561, _593);
    float _609 = fma(_569, _561, _591);
    float _611 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _613 = _611 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _617 = _615 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _619 = fma(_597, _497, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _621 = fma(_601, _497, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _625 = _623 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _627 = fma(_603, _551, _605);
    float _629 = fma(_613, _523, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _631 = fma(_617, _523, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _633 = fma(_625, _523, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _635 = fma(_619, _551, _609);
    float _637 = fma(_621, _551, _607);
    float _639 = fma(_629, _491, _627);
    float _641 = fma(_631, _491, _635);
    float _643 = fma(_633, _491, _637);
    float _645 = fma(_469, (*spvDescriptorSet0.vp_c9)._m0[111].x, _639);
    float _647 = fma(_469, (*spvDescriptorSet0.vp_c9)._m0[111].y, _641);
    float _649 = fma(_469, (*spvDescriptorSet0.vp_c9)._m0[111].z, _643);
    bool _651 = !_445;
    float _669;
    if (!_651)
    {
        float _653 = in.m_53.x;
        float _655 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _657 = _653 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _659 = fma(_657, (*spvDescriptorSet0.vp_c9)._m0[11].y, _123);
        float _661 = _659 * _655;
        float _663 = floor(_661);
        float _665 = -_663;
        float _667 = _661 + _665;
        _669 = _667;
        _671 = true;
    }
    else
    {
        float _673 = float(_91);
        float _675 = 1.0 / _673;
        float _677 = _123 * _675;
        _669 = _677;
    }
    _671 = false;
    float _679 = _669;
    float _681 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _683 = _679 + _681;
    float _685 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _687 = _685 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _689 = _679 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _691 = isnan(_679);
    bool _693 = _689 || _691;
    bool _695 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _697 = _693 || _695;
    float _699 = float(_697);
    float _701 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _703 = _701 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _707 = _705 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _709 = _679 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _711 = isnan(_679);
    bool _713 = _709 || _711;
    bool _715 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _717 = _713 || _715;
    float _719 = float(_717);
    float _721 = 1.0 / _687;
    float _723 = -_699;
    float _725 = _723 + 1.0;
    float _727 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _729 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _727;
    bool _731 = _679 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _733 = isnan(_679);
    bool _735 = _731 || _733;
    bool _737 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _739 = _735 || _737;
    float _741 = float(_739);
    float _743 = _719 * _725;
    float _745 = -_719;
    float _747 = _745 + 1.0;
    bool _749 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _751 = 1.0 / _703;
    float _753 = _741 * _747;
    float _755 = -_741;
    float _757 = _755 + 1.0;
    float _759 = 1.0 / _707;
    float _761 = _729 * _721;
    float _763 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _765 = _763 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _767 = fma(_761, _683, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _769 = _765 * _751;
    bool _771 = _679 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _773 = isnan(_679);
    bool _775 = _771 || _773;
    bool _777 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _779 = _775 || _777;
    float _781 = float(_779);
    float _783 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _785 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _783;
    float _787 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _789 = _679 + _787;
    float _791 = _767 * _753;
    float _793 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _795 = _679 + _793;
    float _797 = -_781;
    float _799 = _797 + 1.0;
    float _801 = fma(_769, _789, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _803 = _785 * _759;
    float _805 = fma(_757, (*spvDescriptorSet0.vp_c9)._m0[115].x, _791);
    float _807 = _699 * _799;
    float _809 = _645 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _811 = fma(_803, _795, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _813 = fma(_801, _743, _805);
    float _815 = _649 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _817 = _809 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _819 = fma(_811, _807, _813);
    float _821 = _647 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _823 = _815 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _825 = fma(_781, (*spvDescriptorSet0.vp_c9)._m0[118].x, _819);
    float _827 = _821 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _829 = _825 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_57.x = _817;
    out.m_57.y = _827;
    out.m_57.z = _823;
    out.m_57.w = _829;
    bool _831 = !_749;
    float _849;
    if (!_831)
    {
        float _833 = in.m_53.x;
        float _835 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _837 = _833 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _839 = fma(_837, (*spvDescriptorSet0.vp_c9)._m0[11].z, _123);
        float _841 = _839 * _835;
        float _843 = floor(_841);
        float _845 = -_843;
        float _847 = _841 + _845;
        _849 = _847;
        _851 = true;
    }
    else
    {
        float _853 = float(_91);
        float _855 = 1.0 / _853;
        float _857 = _123 * _855;
        _849 = _857;
    }
    _851 = false;
    float _859 = _849;
    float _861 = as_type<float>(int(gl_VertexIndex));
    float _863 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _865 = _859 + _863;
    float _867 = in.m_44.x;
    float _869 = in.m_44.y;
    float _871 = in.m_44.z;
    float _873 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _875 = _859 + _873;
    float _877 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _879 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _877;
    float _881 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _883 = _881 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _885 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _887 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _889 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _891 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _889;
    float _893 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _895 = _893 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _897 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _899 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _897;
    float _901 = 1.0 / _883;
    int _903 = as_type<int>(_861) & 1;
    bool _905 = _903 != 0;
    int _907 = as_type<int>(_861) & 2;
    bool _909 = _907 != 0;
    int _911 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _913 = _911 != 0;
    float _915 = 1.0 / _879;
    int _917 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _919 = _917 != 0;
    float _921 = _869 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _923 = in.m_53.x;
    float _925 = in.m_53.y;
    float _927 = _869 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _929 = _869 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _931 = fma(_867, (*spvDescriptorSet0.vp_c10)._m0[5].x, _921);
    float _933 = fma(_867, (*spvDescriptorSet0.vp_c10)._m0[4].x, _927);
    float _935 = fma(_867, (*spvDescriptorSet0.vp_c10)._m0[6].x, _929);
    float _937 = fma(_871, (*spvDescriptorSet0.vp_c10)._m0[5].z, _931);
    float _939 = fma(_871, (*spvDescriptorSet0.vp_c10)._m0[4].z, _933);
    float _941 = fma(_871, (*spvDescriptorSet0.vp_c10)._m0[6].z, _935);
    float _943 = _937 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _945 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _947 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _949 = _939 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _951 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _953 = _943 + _951;
    float _955 = _941 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _957 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _959 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _957;
    float _961 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _963 = _949 + _961;
    float _965 = _953 * _953;
    float _967 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _969 = _955 + _967;
    float _971 = 1.0 / _959;
    float _973 = _865 * _901;
    float _975 = fma(_963, _963, _965);
    float _977 = _923 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _979 = _925 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _981 = _923 > 0.5;
    float _983 = fma(_923, (*spvDescriptorSet0.vp_c9)._m0[78].z, _887);
    float _985 = -_947;
    float _987 = fma(_977, 2.0, _985);
    float _989 = fma(_969, _969, _975);
    float _991 = fma(_979, -2.0, _945);
    float _993 = _167 * _167;
    float _995 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _997 = _995 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _999 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1001 = _859 + _999;
    float _1003 = rsqrt(_989);
    float _1005 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1007 = fma(_165, _165, _993);
    float _1009 = _1001 * _915;
    float _1011 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1013 = _859 + _1011;
    float _1015 = fma(_925, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1005);
    float _1017 = fma(_169, _169, _1007);
    float _1019 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].z, _983);
    float _1021 = 1.0 / _997;
    bool _1023 = _925 > 0.5;
    float _1025 = _1013 * _971;
    float _1027 = -_123;
    float _1029 = fma(_1027, (*spvDescriptorSet0.vp_c9)._m0[76].x, _987);
    float _1031 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[76].y, _991);
    float _1033 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1015);
    float _1035 = fma(_891, _1009, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1037 = rsqrt(_1017);
    float _1039 = _953 * _1003;
    float _1041 = _963 * _1003;
    float _1043 = _969 * _1003;
    float _1045 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1047 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1045;
    float _1049 = -_1039;
    float _1051 = fma(_1049, (*spvDescriptorSet0.vp_c9)._m0[18].w, _953);
    float _1053 = -_1041;
    float _1055 = fma(_1053, (*spvDescriptorSet0.vp_c9)._m0[18].w, _963);
    float _1057 = -_1043;
    float _1059 = fma(_1057, (*spvDescriptorSet0.vp_c9)._m0[18].w, _969);
    float _1061 = _875 * _1021;
    float _1063 = _1051 * _1051;
    float _1065 = fma(_1047, _1009, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1067 = fma(_899, _1009, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1069 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1071 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1069;
    float _1073 = fma(_1055, _1055, _1063);
    float _1075 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1077 = _1075 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1079 = fma(_895, _973, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1081 = _169 * _1037;
    float _1083 = _165 * _1037;
    float _1085 = _167 * _1037;
    float _1087 = fma(_1059, _1059, _1073);
    float _1089 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1091 = _1081 * _1089;
    float _1093 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1095 = _1083 * _1093;
    float _1097 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1099 = _1085 * _1097;
    float _1101 = sqrt(_1087);
    float _1103 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1105 = -_1091;
    float _1107 = fma(_1083, _1103, _1105);
    float _1109 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1111 = -_1095;
    float _1113 = fma(_1085, _1109, _1111);
    float _1115 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1117 = -_1099;
    float _1119 = fma(_1081, _1115, _1117);
    float _1121 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1123 = _1121 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1125 = _1107 * _1107;
    float _1127 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1129 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1127;
    float _1131 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1133 = _1131 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1135 = fma(_1123, _973, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1137 = fma(_1119, _1119, _1125);
    float _1139 = _885 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1141 = _859 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1143 = isnan(_859);
    bool _1145 = _1141 || _1143;
    bool _1147 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1149 = _1145 || _1147;
    float _1151 = float(_1149);
    float _1153 = fma(_1113, _1113, _1137);
    float _1155 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1157 = _1155 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1159 = fma(_1129, _1025, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1161 = _1003 * _1101;
    float _1163 = rsqrt(_1153);
    float _1165 = fma(_1157, _973, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1167 = fma(_1133, _1061, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1169 = _447 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1171 = -_1151;
    float _1173 = _1171 + 1.0;
    bool _1175 = _859 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1177 = isnan(_859);
    bool _1179 = _1175 || _1177;
    bool _1181 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1183 = _1179 || _1181;
    float _1185 = float(_1183);
    float _1187 = _1169 * _1161;
    bool _1189 = _859 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1191 = isnan(_859);
    bool _1193 = _1189 || _1191;
    bool _1195 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1197 = _1193 || _1195;
    float _1199 = float(_1197);
    float _1201 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1203 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1201;
    float _1205 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1207 = _1205 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1209 = -_1185;
    float _1211 = _1209 + 1.0;
    bool _1213 = _859 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1215 = isnan(_859);
    bool _1217 = _1213 || _1215;
    bool _1219 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1221 = _1217 || _1219;
    float _1223 = float(_1221);
    float _1225 = fma(_1203, _1025, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1227 = fma(_1207, _1061, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1229 = fma(_1077, _1061, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1231 = fma(_1071, _1025, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    bool _1233 = !_905;
    float _1235 = _1233 ? (-0.5) : 0.5;
    float _1237 = _455 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _1239 = !_909;
    float _1241 = _1239 ? (-0.5) : 0.5;
    float _1243 = _1119 * _1163;
    float _1245 = _1107 * _1163;
    float _1247 = _1113 * _1163;
    bool _1249 = _859 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1251 = isnan(_859);
    bool _1253 = _1249 || _1251;
    bool _1255 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1257 = _1253 || _1255;
    float _1259 = float(_1257);
    float _1261 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1235);
    float _1263 = _1237 * _1161;
    float _1265 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1241);
    float _1267 = _1085 * _1247;
    float _1269 = _1259 * _1173;
    float _1271 = _1263 * _1261;
    float _1273 = -_1259;
    float _1275 = _1273 + 1.0;
    float _1277 = _1187 * _1265;
    float _1279 = _1161 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1281 = _1279 * 0.5;
    float _1283 = _1199 * _1211;
    float _1285 = _1185 * _1275;
    float _1287 = _1277 * _1083;
    float _1289 = _1083 * _1245;
    float _1291 = _1277 * _1081;
    float _1293 = -_1267;
    float _1295 = fma(_1081, _1245, _1293);
    float _1297 = fma(_1271, _1243, _1287);
    float _1299 = -_1289;
    float _1301 = fma(_1085, _1243, _1299);
    float _1303 = fma(_1271, _1247, _1291);
    float _1305 = -_1199;
    float _1307 = _1305 + 1.0;
    float _1309 = fma(_1281, _1295, _1297);
    float _1311 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1313 = fma(_1281, _1301, _1303);
    float _1315 = -_1235;
    int _1317 = _981 ? as_type<int>(_1315) : as_type<int>(_1235);
    float _1319 = _1223 * _1307;
    float _1321 = _949 + _1309;
    float _1323 = _955 + _1313;
    bool _1325 = !_913;
    float _1327 = _1325 ? _1235 : as_type<float>(_1317);
    float _1329 = _1035 * _1319;
    float _1331 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1333 = _1321 + _1331;
    float _1335 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1337 = _1323 + _1335;
    float _1339 = _1065 * _1319;
    float _1341 = _1327 + 0.5;
    float _1343 = _1333 * _1333;
    float _1345 = _1337 * _1337;
    float _1347 = _1067 * _1319;
    float _1349 = -_1223;
    float _1351 = _1349 + 1.0;
    float _1353 = fma(_1139, _1341, _1029);
    float _1355 = _1343 + _1345;
    float _1357 = -_1241;
    int _1359 = _1023 ? as_type<int>(_1357) : as_type<int>(_1241);
    float _1361 = fma(_1351, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1329);
    float _1363 = fma(_1351, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1339);
    float _1365 = sqrt(_1355);
    bool _1367 = !_919;
    float _1369 = _1367 ? _1241 : as_type<float>(_1359);
    float _1371 = fma(_1079, _1283, _1361);
    float _1373 = fma(_1135, _1283, _1363);
    float _1375 = _1311 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1377 = _1277 * _1085;
    float _1379 = _1369 + (-0.5);
    float _1381 = fma(_1225, _1285, _1373);
    float _1383 = fma(_1351, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1347);
    float _1385 = fma(_1271, _1245, _1377);
    float _1387 = -_1375;
    float _1389 = -_1031;
    float _1391 = fma(_1387, _1379, _1389);
    float _1393 = _1081 * _1243;
    float _1395 = fma(_1227, _1269, _1381);
    float _1397 = fma(_1165, _1283, _1383);
    float _1399 = fma(_1159, _1285, _1371);
    float _1401 = -_1393;
    float _1403 = fma(_1083, _1247, _1401);
    bool _1405 = _1365 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1407 = fma(_1231, _1285, _1397);
    float _1409 = fma(_1167, _1269, _1399);
    float _1411 = fma(_1281, _1403, _1385);
    float _1413 = _1241 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1415 = fma(_1229, _1269, _1407);
    float _1417 = fma(_1151, (*spvDescriptorSet0.vp_c9)._m0[127].x, _1409);
    float _1419 = _943 + _1411;
    float _1421 = fma(_1151, (*spvDescriptorSet0.vp_c9)._m0[127].y, _1395);
    float _1423 = fma(_1151, (*spvDescriptorSet0.vp_c9)._m0[127].z, _1415);
    float _1425 = _1235 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1427 = _1083 * _1413;
    float _1429 = _1085 * _1413;
    float _1431 = _1167;
    float _1433 = _1343;
    float _1435 = _1345;
    float _1437 = _1321;
    float _1439 = _1323;
    float _1441 = _1417;
    float _1443 = _1017;
    float _1445 = _955;
    float _1447 = _943;
    if (!_1405)
    {
        _1431 = _1419;
    }
    float _1449 = _1431;
    bool _1451 = !_1405;
    float _1453 = _1449;
    if (!_1451)
    {
        float _1455 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1457 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1459 = _1365 + _1457;
        float _1461 = _1419 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1463 = rsqrt(_1355);
        float _1465 = _1459 * _1455;
        float _1467 = _1465 * 0.15915493667125701904296875;
        float _1469 = _1467 * 6.283185482025146484375;
        float _1471 = sin(_1469);
        float _1473 = _1467 * 6.283185482025146484375;
        float _1475 = cos(_1473);
        float _1477 = fma(_1471, _1461, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1479 = _1463 * _1477;
        float _1481 = fma(_1333, _1479, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1483 = _1475 + (-1.0);
        float _1485 = fma(_1337, _1479, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1487 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1489 = _1481 + _1487;
        float _1491 = _1483 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1493 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1495 = _1485 + _1493;
        float _1497 = _1489 * _1489;
        float _1499 = fma(_1419, _1475, _1491);
        float _1501 = _1495 * _1495;
        _1453 = _1499;
        _1433 = _1497;
        _1435 = _1501;
        _1437 = _1481;
        _1439 = _1485;
    }
    float _1503 = _1453;
    float _1505 = _1433;
    float _1507 = _1435;
    float _1509 = _1437;
    float _1511 = _1439;
    float _1513 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1515 = _1503 + _1513;
    float _1517 = fma(_1243, _1425, _1427);
    float _1519 = _1081 * _1413;
    float _1521 = -_1019;
    float _1523 = _1521 + 1.0;
    float _1525 = fma(_1515, _1515, _1505);
    float _1527 = -_1033;
    float _1529 = _1527 + 1.0;
    float _1531 = fma(_1247, _1425, _1519);
    float _1533 = -_1523;
    float _1535 = fma(_1327, _1533, _1353);
    float _1537 = _1525 + _1507;
    float _1539 = fma(_1245, _1425, _1429);
    float _1541 = _1417 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1543 = _1421 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1545 = _1423 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1547 = fma(_1369, _1529, _1391);
    float _1549 = sqrt(_1537);
    float _1551 = _1295 + _1517;
    float _1553 = _1403 + _1539;
    float _1555 = _1541 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1557 = _1543 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1559 = _1545 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1561 = _1301 + _1531;
    out.m_62.x = _1535;
    out.m_62.y = _1547;
    out.m_64.x = _1555;
    out.m_64.y = _1557;
    out.m_64.z = _1559;
    out.m_66.x = _1551;
    out.m_66.y = _1553;
    out.m_66.z = _1561;
    bool _1563 = _1549 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1565 = isnan(_1549);
    bool _1567 = _1563 || _1565;
    bool _1569 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1571 = _1567 || _1569;
    float _1573 = _1531;
    if (!_1571)
    {
        _1441 = 1.0;
    }
    float _1575 = _1441;
    bool _1577 = !_1571;
    float _1579 = _1575;
    if (!_1577)
    {
        bool _1581 = _1549 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1583 = isnan(_1549);
        bool _1585 = _1581 || _1583;
        bool _1587 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1589 = _1585 || _1587;
        if (!_1589)
        {
            float _1591 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1593 = _1549 + _1591;
            float _1595 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1597 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1595;
            float _1599 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1601 = _1599 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1603 = 1.0 / _1597;
            float _1605 = _1593 * _1603;
            float _1607 = fma(_1605, _1601, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1579 = _1607;
            _1609 = true;
        }
        else
        {
            bool _1611 = _1549 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1613 = isnan(_1549);
            bool _1615 = _1611 || _1613;
            bool _1617 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1619 = _1615 || _1617;
            if (!_1619)
            {
                float _1621 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1623 = _1549 + _1621;
                float _1625 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1627 = _1625 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1629 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1631 = _1629 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1633 = 1.0 / _1627;
                float _1635 = _1623 * _1633;
                float _1637 = fma(_1635, _1631, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1579 = _1637;
                _1609 = true;
            }
            else
            {
                _1579 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1609 = false;
    float _1639 = _1579;
    float _1641 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1643 = _1503 + _1641;
    float _1645 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1647 = _1509 + _1645;
    float _1649 = -_1041;
    float _1651 = fma(_1649, (*spvDescriptorSet0.vp_c9)._m0[18].w, _949);
    float _1653 = fma(_1643, _1639, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1655 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1657 = _1511 + _1655;
    float _1659 = fma(_1647, _1639, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1661 = -_943;
    float _1663 = _1661 + _1653;
    float _1665 = fma(_1657, _1639, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1667 = -_949;
    float _1669 = _1667 + _1659;
    float _1671 = _1663 * _1663;
    float _1673 = -_955;
    float _1675 = _1673 + _1665;
    float _1677 = fma(_1669, _1669, _1671);
    float _1679 = fma(_1675, _1675, _1677);
    float _1681 = sqrt(_1679);
    bool _1683 = _1681 > 0.0;
    bool _1685 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1687 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1689 = _1685 || _1687;
    bool _1691 = isnan(0.5);
    bool _1693 = _1689 || _1691;
    float _1695 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1697 = _1639;
    float _1699 = _1665;
    float _1701 = _1669;
    if (!_1683)
    {
        _1695 = _1659;
    }
    float _1703 = _1695;
    float _1705 = _1703;
    if (!_1683)
    {
        _1697 = _1653;
    }
    float _1707 = _1697;
    bool _1709 = !_1683;
    float _1711 = _1707;
    float _1713 = _1707;
    if (!_1709)
    {
        float _1715 = sqrt(_1017);
        float _1717 = rsqrt(_1679);
        bool _1719 = _1715 > 0.0;
        float _1721 = _1669 * _1717;
        float _1723 = _1663 * _1717;
        float _1725 = _1675 * _1717;
        float _1727 = _1717;
        _1701 = _1721;
        _1443 = _1715;
        if (!_1719)
        {
            _1727 = _1659;
        }
        float _1729 = _1727;
        _1705 = _1729;
        if (!_1719)
        {
            _1711 = _1653;
        }
        float _1731 = _1711;
        bool _1733 = !_1719;
        _1713 = _1731;
        if (!_1733)
        {
            float _1735 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1737 = _1085 * _1723;
            float _1739 = fma(_1083, _1721, _1737);
            float _1741 = fma(_1081, _1725, _1739);
            float _1743 = _1735 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1745 = _1741 * _1743;
            float _1747 = fma(_165, _1745, _1659);
            float _1749 = fma(_167, _1745, _1653);
            float _1751 = fma(_169, _1745, _1665);
            _1713 = _1749;
            _1699 = _1751;
            _1705 = _1747;
        }
    }
    float _1753 = _1713;
    float _1755 = _1699;
    float _1757 = _1705;
    float _1759 = _1701;
    float _1761 = _1443;
    float _1763 = -_1039;
    float _1765 = fma(_1763, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1753);
    float _1767 = -_1043;
    float _1769 = fma(_1767, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1755);
    float _1771 = -_1041;
    float _1773 = fma(_1771, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1757);
    float _1775 = -_1039;
    float _1777 = fma(_1775, (*spvDescriptorSet0.vp_c9)._m0[18].w, _943);
    float _1779 = -_1043;
    float _1781 = fma(_1779, (*spvDescriptorSet0.vp_c9)._m0[18].w, _955);
    float _1783 = _1765;
    float _1785 = _1773;
    float _1787 = _1769;
    float _1789 = _1759;
    float _1791 = _1761;
    float _1793 = _1781;
    if (!_1693)
    {
        float _1795 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1797 = _1777 + _1795;
        float _1799 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1801 = _1651 + _1799;
        float _1803 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1805 = -_949;
        float _1807 = _1805 + _1757;
        float _1809 = _1797 * _1797;
        float _1811 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1813 = _1781 + _1811;
        float _1815 = -_943;
        float _1817 = _1815 + _1753;
        float _1819 = -_955;
        float _1821 = _1819 + _1755;
        float _1823 = fma(_1801, _1801, _1809);
        float _1825 = fma(_1813, _1813, _1823);
        float _1827 = 1.0 / _1161;
        float _1829 = sqrt(_1825);
        float _1831 = _1807 * _1827;
        float _1833 = _1817 * _1827;
        float _1835 = _1821 * _1827;
        bool _1837 = _1829 > (*spvDescriptorSet0.vp_c9)._m0[199].x;
        bool _1839 = isnan(_1829);
        bool _1841 = _1837 || _1839;
        bool _1843 = isnan((*spvDescriptorSet0.vp_c9)._m0[199].x);
        bool _1845 = _1841 || _1843;
        float _1847 = precise::min(_1829, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1849 = _1847 * _1803;
        float _1851 = fma(_1831, _1849, _1651);
        float _1853 = fma(_1833, _1849, _1777);
        float _1855 = _1765;
        float _1857 = _1829;
        float _1859 = _1821;
        _173 = _1849;
        _1445 = _1831;
        _1447 = _1833;
        if (_1845)
        {
            float _1861 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
            _1855 = _1861;
        }
        float _1863 = _1855;
        if (_1845)
        {
            float _1865 = precise::max(_1829, (*spvDescriptorSet0.vp_c9)._m0[199].y);
            _1857 = _1865;
        }
        float _1867 = _1857;
        float _1869 = fma(_1835, _1849, _1781);
        float _1871 = _1867;
        float _1873 = _1863;
        _1787 = _1869;
        if (_1845)
        {
            float _1875 = _1867 * _1863;
            _1859 = _1875;
        }
        float _1877 = _1859;
        if (!_1845)
        {
            _1871 = _1851;
        }
        float _1879 = _1871;
        float _1881 = _1879;
        if (!_1845)
        {
            _1873 = _1853;
        }
        float _1883 = _1873;
        float _1885 = _1883;
        if (_1845)
        {
            float _1887 = fma(_1831, _1877, _1651);
            _1881 = _1887;
        }
        float _1889 = _1881;
        _1785 = _1889;
        if (_1845)
        {
            float _1891 = fma(_1833, _1877, _1777);
            _1885 = _1891;
        }
        float _1893 = _1885;
        _1783 = _1893;
        if (_1845)
        {
            float _1895 = fma(_1835, _1877, _1781);
            _1787 = _1895;
        }
    }
    float _1897 = _1783;
    float _1899 = _1785;
    float _1901 = _1787;
    float _1903 = _173;
    float _1905 = _1445;
    float _1907 = _1447;
    float _1909 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1911 = _1897 + _1909;
    float _1913 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1915 = _1899 + _1913;
    float _1917 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1919 = _1901 + _1917;
    float _1921 = _1911 * _1911;
    float _1923 = fma(_1915, _1915, _1921);
    float _1925 = fma(_1919, _1919, _1923);
    float _1927 = rsqrt(_1925);
    float _1929 = _1927 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1931 = _1915 * _1929;
    float _1933 = _1919 * _1929;
    float _1935 = _1931 * _1931;
    float _1937 = _1933 * _1933;
    float _1939 = _1935 + _1937;
    float _1941 = sqrt(_1939);
    bool _1943 = _1941 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1945 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1947 = _1941 + _1945;
    float _1949 = _169;
    float _1951 = _1939;
    float _1953 = _1947;
    float _1955 = _1905;
    if (_1943)
    {
        float _1957 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1949 = _1957;
    }
    float _1959 = _1949;
    if (_1943)
    {
        float _1961 = rsqrt(_1939);
        _1951 = _1961;
    }
    float _1963 = _1951;
    float _1965 = _1963;
    if (_1943)
    {
        float _1967 = _1947 * _1959;
        _1953 = _1967;
    }
    float _1969 = _1953;
    if (_1943)
    {
        float _1971 = _1969 * 0.15915493667125701904296875;
        _1955 = _1971;
    }
    float _1973 = _1955;
    float _1975 = _1903;
    if (_1943)
    {
        float _1977 = _1973 * 6.283185482025146484375;
        float _1979 = sin(_1977);
        _1975 = _1979;
    }
    float _1981 = _1975;
    float _1983 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1985 = precise::max(0.0, _1983);
    float _1987 = _1907;
    float _1989 = _1985;
    float _1991 = _1983;
    if (_1943)
    {
        float _1993 = _1973 * 6.283185482025146484375;
        float _1995 = cos(_1993);
        _1987 = _1995;
    }
    float _1997 = _1987;
    float _1999 = -_1929;
    float _2001 = -_1985;
    float _2003 = fma(_1911, _1999, _2001);
    if (_1943)
    {
        float _2005 = _2003 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1989 = _2005;
    }
    float _2007 = _1989;
    float _2009 = sqrt(_1925);
    float _2011 = _1981;
    float _2013 = _2007;
    if (_1943)
    {
        float _2015 = fma(_1981, _2007, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2011 = _2015;
    }
    float _2017 = _2011;
    float _2019 = _2017;
    if (!_1943)
    {
        _2013 = _1931;
    }
    float _2021 = _2013;
    float _2023 = _2021;
    float _2025 = _1997;
    if (_1943)
    {
        float _2027 = _1997 + (-1.0);
        _1991 = _2027;
    }
    float _2029 = _1991;
    float _2031 = _2029;
    if (_1943)
    {
        float _2033 = _1963 * _2017;
        _1789 = _2033;
    }
    float _2035 = _1789;
    if (!_1943)
    {
        _2019 = _2003;
    }
    float _2037 = _2019;
    float _2039 = _2037;
    if (_1943)
    {
        float _2041 = _2029 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1791 = _2041;
    }
    float _2043 = _1791;
    if (_1943)
    {
        float _2045 = _1931 * _2035;
        _2023 = _2045;
    }
    float _2047 = _2023;
    if (!_1943)
    {
        _2031 = _1933;
    }
    float _2049 = _2031;
    float _2051 = _2049;
    if (_1943)
    {
        float _2053 = _1933 * _2035;
        _2051 = _2053;
    }
    float _2055 = _2051;
    if (!_1943)
    {
        _1965 = _1935;
    }
    float _2057 = _1965;
    float _2059 = _2057;
    if (_1943)
    {
        float _2061 = fma(_2003, _1997, _2043);
        _2039 = _2061;
    }
    float _2063 = _2039;
    if (_1943)
    {
        float _2065 = _2047 * _2047;
        _2059 = _2065;
    }
    float _2067 = _2059;
    if (!_1943)
    {
        _2025 = _1937;
    }
    float _2069 = _2025;
    float _2071 = _2069;
    if (_1943)
    {
        float _2073 = _2055 * _2055;
        _2071 = _2073;
    }
    float _2075 = _2071;
    float _2077 = fma(_2063, _2063, _2067);
    float _2079 = _2077 + _2075;
    float _2081 = _1897 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2083 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2085 = fma(_2009, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2083);
    float _2087 = precise::clamp(_2085, 0.0, 1.0);
    float _2089 = _1897 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2091 = rsqrt(_2079);
    float _2093 = fma(_1899, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2081);
    float _2095 = -_2087;
    float _2097 = _2095 + 1.0;
    float _2099 = _1897 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2101 = fma(_1899, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2089);
    float _2103 = fma(_1901, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2093);
    float _2105 = _1897 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2107 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2109 = abs(_2097);
    float _2111 = log2(_2109);
    float _2113 = _2103 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2115 = fma(_1899, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2099);
    float _2117 = fma(_1901, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2101);
    float _2119 = fma(_1899, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2105);
    float _2121 = _2113 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2123 = fma(_1901, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2115);
    float _2125 = _2117 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2127 = _2091 * _2047;
    float _2129 = -_2121;
    float _2131 = fma(_2129, _2107, 1.0);
    float _2133 = fma(_1901, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2119);
    float _2135 = _2123 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2137 = _2125 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2139 = _2091 * _2063;
    float _2141 = _2127 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2143 = _2133 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2145 = fma(_2135, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2137);
    float _2147 = _2111 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2149 = _2091 * _2055;
    float _2151 = -_2141;
    float _2153 = fma(_2139, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2151);
    float _2155 = fma(_2113, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2145);
    float _2157 = exp2(_2147);
    float _2159 = _2125 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2161 = -_2149;
    float _2163 = fma(_2161, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2153);
    float _2165 = fma(_2143, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2155);
    float _2167 = _2125 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2169 = fma(_2135, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2159);
    float _2171 = fma(_2163, -0.5, 0.5);
    float _2173 = fma(_2163, 0.5, 0.5);
    float _2175 = log2(_2131);
    float _2177 = fma(_2135, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2167);
    float _2179 = _2139 + 1.0;
    float _2181 = fma(_2113, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2169);
    float _2183 = fma(_2173, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2185 = fma(_2113, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2177);
    float _2187 = 1.0 / _2165;
    float _2189 = -_2139;
    float _2191 = fma(_2157, _2179, _2189);
    float _2193 = fma(_2143, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2181);
    float _2195 = fma(_2143, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2185);
    float _2197 = fma(_2173, _2183, -0.212114393711090087890625);
    float _2199 = sqrt(_2171);
    float _2201 = _2175 * 0.693147182464599609375;
    float _2203 = fma(_2173, _2197, 1.570728778839111328125);
    float _2205 = _2201 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2207 = fma(_2191, 0.5, 0.5);
    float _2209 = _2193 * _2187;
    float _2211 = _2195 * _2187;
    float _2213 = fma(_2209, 0.5, 0.5);
    float _2215 = fma(_2211, -0.5, 0.5);
    float _2217 = _2199 * 0.636619746685028076171875;
    float3 _5970 = float3(_2213, _2215, _2205);
    float _2219 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5970, float3(0.0), isnan(_5970)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5970, float3(0.0), isnan(_5970)), level(0.0)).x;
    float3 _5981 = float3(_2213, _2215, _2205);
    float4 _2222 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5981, float3(0.0), isnan(_5981)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5981, float3(0.0), isnan(_5981)), level(0.0)).xyzw;
    float _2224 = _2222.x;
    float _2226 = _2222.y;
    float _2228 = _2222.z;
    float _2230 = _2222.w;
    float _2232 = -_2203;
    float _2234 = fma(_2217, _2232, 1.0);
    float2 _6003 = float2(_2234, _2207);
    float3 _2238 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6003, float2(0.0), isnan(_6003)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6003, float2(0.0), isnan(_6003)), level(0.0)).xyz;
    float _2240 = _2238.x;
    float _2242 = _2238.y;
    float _2244 = _2238.z;
    float _2246 = _1777 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2248 = _2111 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_68.x = _1915;
    out.m_68.y = _1911;
    out.m_68.z = _1919;
    float _2250 = fma(_1651, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2246);
    bool _2252 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2254 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2256 = _2252 || _2254;
    bool _2258 = isnan(0.5);
    bool _2260 = _2256 || _2258;
    float _2262 = fma(_1781, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2250);
    float _2264 = _1777 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2266 = exp2(_2248);
    float _2268 = _2262 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2270 = fma(_1651, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2264);
    float _2272 = fma(_1781, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2270);
    float _2274 = _2205;
    float _2276 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _2278 = _2268;
    float _2280 = _2213;
    if (!_2260)
    {
        _1573 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _2282 = _1573;
    float _2284 = 1.0 / _2268;
    if (_2260)
    {
        _1793 = 1.0;
    }
    float _2286 = _1793;
    float _2288 = _2272 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2290 = _2288 + _2268;
    float _2292 = _2286;
    if (!_2260)
    {
        float _2294 = -_2282;
        float _2296 = _2294 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _2274 = _2296;
    }
    float _2298 = _2274;
    float _2300 = -_2266;
    float _2302 = _2300 + 1.0;
    float _2304 = _2298;
    if (!_2260)
    {
        float _2306 = 1.0 / _2298;
        _2304 = _2306;
    }
    float _2308 = _2304;
    float _2310 = _2290 * _2284;
    float _2312 = _2310 * 0.5;
    float _2314 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2316 = fma(_2312, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2314);
    float _2318 = _2312;
    float _2320 = _2284;
    if (!_2260)
    {
        _2318 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2322 = _2318;
    float _2324 = 1.0 / _2316;
    float _2326 = _2322;
    if (!_2260)
    {
        float _2328 = -_2322;
        float _2330 = _2328 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2276 = _2330;
    }
    float _2332 = _2276;
    float _2334 = _2215;
    if (!_2260)
    {
        float _2336 = 1.0 / _2332;
        _2334 = _2336;
    }
    float _2338 = _2334;
    if (!_2260)
    {
        float _2340 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2342 = -_2282;
        float _2344 = fma(_2324, _2340, _2342);
        _2320 = _2344;
    }
    float _2346 = _2320;
    if (!_2260)
    {
        float _2348 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2350 = -_2322;
        float _2352 = fma(_2324, _2348, _2350);
        _2278 = _2352;
    }
    float _2354 = _2278;
    if (_2260)
    {
        _2326 = 1.0;
    }
    float _2356 = _2326;
    float _2358 = _2193 + _2165;
    float _2360 = _2356;
    if (!_2260)
    {
        float _2362 = _2346 * _2308;
        float _2364 = precise::clamp(_2362, 0.0, 1.0);
        _2280 = _2364;
    }
    float _2366 = _2280;
    float _2368 = _2125 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2370 = _2358 * 0.5;
    if (!_2260)
    {
        float _2372 = _2354 * _2338;
        float _2374 = precise::clamp(_2372, 0.0, 1.0);
        _2360 = _2374;
    }
    float _2376 = _2360;
    float _2378 = fma(_2135, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2368);
    if (!_2260)
    {
        float _2380 = -_2366;
        float _2382 = _2380 + 1.0;
        _2292 = _2382;
    }
    float _2384 = _2292;
    float _2386 = fma(_2113, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2378);
    float _2388 = _2165 * 0.5;
    float _2390 = _2376 * _2384;
    bool _2392 = _2376 > 0.0;
    bool _2394 = isnan(_2376);
    bool _2396 = _2392 || _2394;
    bool _2398 = isnan(0.0);
    bool _2400 = _2396 || _2398;
    float _2402 = fma(_2195, -0.5, _2388);
    float _2404 = _2302 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2406 = _2390 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2408 = fma(_2143, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2386);
    bool _2410 = _2384 <= 0.0;
    bool _2412 = !_2400;
    bool _2414 = _2410 || _2412;
    float _2416 = _2406 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2418 = _2408 + _2165;
    out.gl_Position.x = _2193;
    out.gl_Position.y = _2195;
    out.gl_Position.z = _2408;
    out.gl_Position.w = _2165;
    float _2420 = _2418 * 0.5;
    out.m_47.x = _2416;
    out.m_70.x = _2370;
    out.m_70.y = _2402;
    out.m_70.z = _2420;
    out.m_70.w = _2165;
    float _2422 = _2404 * _2219;
    float _2424 = -_2404;
    float _2426 = _2424 + 1.0;
    float _2428 = _2230 * _2422;
    float _2430 = _2230 * _2426;
    float _2432 = _2244 * _2422;
    float _2434 = fma(_2240, _2428, _2224);
    float _2436 = fma(_2242, _2428, _2226);
    float _2438 = fma(_2230, _2432, _2228);
    out.m_72.x = _2434;
    out.m_72.y = _2436;
    out.m_72.z = _2438;
    out.m_72.w = _2430;
    if (!_2414)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _2440 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2440;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

