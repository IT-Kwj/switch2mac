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
    constant _16* vp_c7 [[id(4)]];
    texture3d<float> vp_t_tcb_32 [[id(5)]];
    sampler vp_t_tcb_32Smplr [[id(6)]];
    texture3d<float> vp_t_tcb_30 [[id(7)]];
    sampler vp_t_tcb_30Smplr [[id(8)]];
    texture2d<float> vp_t_tcb_1C [[id(9)]];
    sampler vp_t_tcb_1CSmplr [[id(10)]];
    sampler vp_t_tcb_32Smplr_w [[id(11)]];
    sampler vp_t_tcb_30Smplr_w [[id(12)]];
    sampler vp_t_tcb_1CSmplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
};

struct main0_out
{
    float4 m_56 [[user(locn0)]];
    float4 m_68 [[user(locn1)]];
    float4 m_70 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_66 [[user(locn4)]];
    float4 m_72 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_58 [[attribute(1)]];
    float4 m_60 [[attribute(2)]];
    float4 m_62 [[attribute(3)]];
    float4 m_64 [[attribute(4)]];
    float4 m_42 [[attribute(5)]];
    float4 m_47 [[attribute(6)]];
    float4 m_52 [[attribute(7)]];
    float4 m_54 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1223 = false;
    bool _785 = false;
    bool _605 = false;
    bool _429 = false;
    bool _189 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _86 = in.m_42.w;
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
        out.m_45.x = 0.0;
    }
    int _103 = 0;
    if (!_95)
    {
        float _105 = _99 * 5.0;
        _103 = as_type<int>(_105);
    }
    int _107 = _103;
    int _109 = _107;
    if (!_95)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2879 = as_type<float>(_107);
        out.gl_Position.z = _2879;
    }
    if (!_95)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _111 = in.m_47.w;
    bool _113 = _111 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _115 = isnan(_111);
    bool _117 = _113 || _115;
    bool _119 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _121 = _117 || _119;
    float _123 = -_111;
    float _125 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _127 = _125;
    if (_121)
    {
        float _129 = float(_91);
        _101 = _129;
    }
    float _131 = _101;
    bool _133 = _125 >= _131;
    bool _135 = !_121;
    bool _137 = _133 || _135;
    float _139 = _131;
    if (_137)
    {
        _139 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _141 = _139;
    if (_137)
    {
        out.m_45.x = 0.0;
    }
    if (_137)
    {
        float _143 = _141 * 5.0;
        _109 = as_type<int>(_143);
    }
    int _145 = _109;
    if (_137)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2949 = as_type<float>(_145);
        out.gl_Position.z = _2949;
    }
    if (_137)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _147 = as_type<float>(int(gl_VertexIndex));
    bool _149 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _151 = as_type<int>(_147) & 1;
    bool _153 = _151 != 0;
    int _155 = as_type<int>(_147) & 2;
    bool _157 = _155 != 0;
    bool _159 = !_153;
    float _161 = _159 ? (-0.5) : 0.5;
    bool _163 = !_157;
    float _165 = _163 ? (-0.5) : 0.5;
    bool _167 = !_149;
    float _169 = 0.5;
    float _187;
    if (!_167)
    {
        float _171 = in.m_52.x;
        float _173 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _175 = _171 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _177 = fma(_175, (*spvDescriptorSet0.vp_c9)._m0[12].x, _125);
        float _179 = _177 * _173;
        float _181 = floor(_179);
        float _183 = -_181;
        float _185 = _179 + _183;
        _187 = _185;
        _189 = true;
    }
    else
    {
        float _191 = float(_91);
        float _193 = 1.0 / _191;
        float _195 = _125 * _193;
        _187 = _195;
    }
    _189 = false;
    float _197 = _187;
    float _199 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _201 = _197 + _199;
    float _203 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _205 = _197 + _203;
    float _207 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _209 = _197 + _207;
    float _211 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _213 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _211;
    float _215 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _217 = _215 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _219 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _221 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _219;
    float _223 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _225 = _223 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _227 = 1.0 / _213;
    bool _229 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _231 = 1.0 / _221;
    float _233 = 1.0 / _217;
    float _235 = _205 * _227;
    float _237 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _239 = _197 + _237;
    float _241 = 1.0 / _225;
    float _243 = _201 * _231;
    bool _245 = _197 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _247 = isnan(_197);
    bool _249 = _245 || _247;
    bool _251 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _253 = _249 || _251;
    float _255 = float(_253);
    float _257 = -_255;
    float _259 = _257 + 1.0;
    float _261 = _209 * _233;
    bool _263 = _197 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _265 = isnan(_197);
    bool _267 = _263 || _265;
    bool _269 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _271 = _267 || _269;
    float _273 = float(_271);
    bool _275 = _197 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _277 = isnan(_197);
    bool _279 = _275 || _277;
    bool _281 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _283 = _279 || _281;
    float _285 = float(_283);
    float _287 = _273 * _259;
    bool _289 = _197 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _291 = isnan(_197);
    bool _293 = _289 || _291;
    bool _295 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _297 = _293 || _295;
    float _299 = float(_297);
    float _301 = _239 * _241;
    float _303 = -_273;
    float _305 = _303 + 1.0;
    bool _307 = _197 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _309 = isnan(_197);
    bool _311 = _307 || _309;
    bool _313 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _315 = _311 || _313;
    float _317 = float(_315);
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _321 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _319;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _325 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _323;
    float _327 = _285 * _305;
    float _329 = -_285;
    float _331 = _329 + 1.0;
    float _333 = fma(_321, _235, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _335 = fma(_325, _235, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _339 = _337 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _341 = _299 * _331;
    float _343 = -_299;
    float _345 = _343 + 1.0;
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _349 = _347 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _351 = -_317;
    float _353 = _351 + 1.0;
    float _355 = fma(_339, _261, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _357 = _317 * _345;
    float _359 = fma(_349, _261, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _363 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _361;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _367 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _365;
    float _369 = _333 * _357;
    float _371 = _335 * _357;
    float _373 = fma(_363, _243, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _375 = fma(_367, _243, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _377 = fma(_353, (*spvDescriptorSet0.vp_c9)._m0[143].x, _369);
    float _379 = fma(_353, (*spvDescriptorSet0.vp_c9)._m0[143].y, _371);
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _383 = _381 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _387 = _385 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _389 = fma(_359, _341, _377);
    float _391 = fma(_355, _341, _379);
    float _393 = fma(_383, _301, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _395 = fma(_387, _301, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _397 = fma(_373, _327, _389);
    float _399 = fma(_375, _327, _391);
    float _401 = fma(_393, _287, _397);
    float _403 = fma(_395, _287, _399);
    float _405 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[147].x, _401);
    float _407 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[147].y, _403);
    bool _409 = !_229;
    float _427;
    if (!_409)
    {
        float _411 = in.m_52.x;
        float _413 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _415 = _411 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _417 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[11].x, _125);
        float _419 = _417 * _413;
        float _421 = floor(_419);
        float _423 = -_421;
        float _425 = _419 + _423;
        _427 = _425;
        _429 = true;
    }
    else
    {
        float _431 = float(_91);
        float _433 = 1.0 / _431;
        float _435 = _125 * _433;
        _427 = _435;
    }
    _429 = false;
    float _437 = _427;
    float _439 = in.m_54.x;
    float _441 = in.m_54.y;
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _445 = _437 + _443;
    bool _447 = _437 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _449 = isnan(_437);
    bool _451 = _447 || _449;
    bool _453 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _455 = _451 || _453;
    float _457 = float(_455);
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _461 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _459;
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _465 = _463 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _467 = _437 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _469 = isnan(_437);
    bool _471 = _467 || _469;
    bool _473 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _475 = _471 || _473;
    float _477 = float(_475);
    float _479 = -_457;
    float _481 = _479 + 1.0;
    float _483 = 1.0 / _461;
    bool _485 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _487 = 1.0 / _465;
    float _489 = _407 * _441;
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _493 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _491;
    float _495 = _445 * _483;
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _499 = _437 + _497;
    bool _501 = _437 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _503 = isnan(_437);
    bool _505 = _501 || _503;
    bool _507 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _509 = _505 || _507;
    float _511 = float(_509);
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _515 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _513;
    float _517 = fma(_493, _495, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _519 = _405 * _439;
    float _521 = _511 * _481;
    float _523 = -_511;
    float _525 = _523 + 1.0;
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _529 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _527;
    float _531 = fma(_515, _495, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _533 = _499 * _487;
    float _535 = _477 * _525;
    float _537 = fma(_529, _495, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _539 = -_477;
    float _541 = _539 + 1.0;
    float _543 = _517 * _535;
    float _545 = _537 * _535;
    float _547 = _531 * _535;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _551 = _549 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _555 = _553 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _559 = _557 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _561 = fma(_541, (*spvDescriptorSet0.vp_c9)._m0[107].x, _545);
    float _563 = fma(_541, (*spvDescriptorSet0.vp_c9)._m0[107].y, _543);
    float _565 = fma(_551, _533, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _567 = fma(_555, _533, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _569 = fma(_559, _533, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _571 = fma(_541, (*spvDescriptorSet0.vp_c9)._m0[107].z, _547);
    float _573 = fma(_565, _521, _561);
    float _575 = fma(_567, _521, _563);
    float _577 = fma(_569, _521, _571);
    float _579 = fma(_457, (*spvDescriptorSet0.vp_c9)._m0[109].x, _573);
    float _581 = fma(_457, (*spvDescriptorSet0.vp_c9)._m0[109].y, _575);
    float _583 = fma(_457, (*spvDescriptorSet0.vp_c9)._m0[109].z, _577);
    bool _585 = !_485;
    float _603;
    if (!_585)
    {
        float _587 = in.m_52.x;
        float _589 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _591 = _587 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _593 = fma(_591, (*spvDescriptorSet0.vp_c9)._m0[11].y, _125);
        float _595 = _593 * _589;
        float _597 = floor(_595);
        float _599 = -_597;
        float _601 = _595 + _599;
        _603 = _601;
        _605 = true;
    }
    else
    {
        float _607 = float(_91);
        float _609 = 1.0 / _607;
        float _611 = _125 * _609;
        _603 = _611;
    }
    _605 = false;
    float _613 = _603;
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _617 = _613 + _615;
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _621 = _619 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _625 = _623 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _627 = _613 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _629 = isnan(_613);
    bool _631 = _627 || _629;
    bool _633 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _635 = _631 || _633;
    float _637 = float(_635);
    float _639 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _641 = _639 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _643 = _613 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _645 = isnan(_613);
    bool _647 = _643 || _645;
    bool _649 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _651 = _647 || _649;
    float _653 = float(_651);
    float _655 = 1.0 / _621;
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _659 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _657;
    float _661 = -_637;
    float _663 = _661 + 1.0;
    bool _665 = _613 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _667 = isnan(_613);
    bool _669 = _665 || _667;
    bool _671 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _673 = _669 || _671;
    float _675 = float(_673);
    bool _677 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _679 = 1.0 / _625;
    float _681 = 1.0 / _641;
    float _683 = _659 * _655;
    float _685 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _687 = _685 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _689 = _653 * _663;
    float _691 = -_653;
    float _693 = _691 + 1.0;
    float _695 = fma(_683, _617, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _699 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _697;
    float _701 = _675 * _693;
    float _703 = _687 * _679;
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _707 = _613 + _705;
    bool _709 = _613 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _711 = isnan(_613);
    bool _713 = _709 || _711;
    bool _715 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _717 = _713 || _715;
    float _719 = float(_717);
    float _721 = _695 * _701;
    float _723 = -_675;
    float _725 = _723 + 1.0;
    float _727 = fma(_703, _707, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _729 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _731 = _613 + _729;
    float _733 = _699 * _681;
    float _735 = -_719;
    float _737 = _735 + 1.0;
    float _739 = fma(_725, (*spvDescriptorSet0.vp_c9)._m0[115].x, _721);
    float _741 = _579 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _743 = fma(_733, _731, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _745 = _637 * _737;
    float _747 = fma(_727, _689, _739);
    float _749 = _741 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _751 = fma(_743, _745, _747);
    float _753 = _581 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _755 = _583 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _757 = fma(_719, (*spvDescriptorSet0.vp_c9)._m0[118].x, _751);
    float _759 = _753 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _761 = _755 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _763 = _757 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_56.x = _749;
    out.m_56.y = _759;
    out.m_56.z = _761;
    out.m_56.w = _763;
    bool _765 = !_677;
    float _783;
    if (!_765)
    {
        float _767 = in.m_52.x;
        float _769 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _771 = _767 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _773 = fma(_771, (*spvDescriptorSet0.vp_c9)._m0[11].z, _125);
        float _775 = _773 * _769;
        float _777 = floor(_775);
        float _779 = -_777;
        float _781 = _775 + _779;
        _783 = _781;
        _785 = true;
    }
    else
    {
        float _787 = float(_91);
        float _789 = 1.0 / _787;
        float _791 = _125 * _789;
        _783 = _791;
    }
    _785 = false;
    float _793 = _783;
    float _795 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _797 = _793 + _795;
    float _799 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _801 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _799;
    float _803 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _805 = _803 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _807 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _809 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _807;
    float _811 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _813 = _811 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _815 = 1.0 / _801;
    float _817 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _819 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _817;
    float _821 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _823 = _821 + (*spvDescriptorSet0.vp_c9)._m0[129].w;
    bool _825 = _793 >= (*spvDescriptorSet0.vp_c9)._m0[130].w;
    bool _827 = isnan(_793);
    bool _829 = _825 || _827;
    bool _831 = isnan((*spvDescriptorSet0.vp_c9)._m0[130].w);
    bool _833 = _829 || _831;
    float _835 = float(_833);
    float _837 = -(*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _839 = (*spvDescriptorSet0.vp_c9)._m0[130].w + _837;
    float _841 = 1.0 / _805;
    float _843 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _845 = _793 + _843;
    bool _847 = _793 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _849 = isnan(_793);
    bool _851 = _847 || _849;
    bool _853 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _855 = _851 || _853;
    float _857 = float(_855);
    float _859 = 1.0 / _819;
    float _861 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _863 = _793 + _861;
    float _865 = _845 * _815;
    float _867 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _869 = _793 + _867;
    float _871 = -_835;
    float _873 = _871 + 1.0;
    bool _875 = _793 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _877 = isnan(_793);
    bool _879 = _875 || _877;
    bool _881 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _883 = _879 || _881;
    float _885 = float(_883);
    bool _887 = _793 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _889 = isnan(_793);
    bool _891 = _887 || _889;
    bool _893 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _895 = _891 || _893;
    float _897 = float(_895);
    float _899 = 1.0 / _809;
    float _901 = _863 * _841;
    float _903 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _905 = _793 + _903;
    bool _907 = _793 >= (*spvDescriptorSet0.vp_c9)._m0[129].w;
    bool _909 = isnan(_793);
    bool _911 = _907 || _909;
    bool _913 = isnan((*spvDescriptorSet0.vp_c9)._m0[129].w);
    bool _915 = _911 || _913;
    float _917 = float(_915);
    float _919 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _921 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _919;
    float _923 = 1.0 / _813;
    float _925 = _905 * _859;
    bool _927 = _793 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _929 = isnan(_793);
    bool _931 = _927 || _929;
    bool _933 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _935 = _931 || _933;
    float _937 = float(_935);
    float _939 = _917 * _873;
    bool _941 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _943 = 1.0 / _823;
    float _945 = _797 * _899;
    float _947 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _949 = _793 + _947;
    float _951 = -(*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _953 = _793 + _951;
    float _955 = 1.0 / _839;
    float _957 = _869 * _923;
    float _959 = -_917;
    float _961 = _959 + 1.0;
    float _963 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _965 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _963;
    float _967 = _937 * _961;
    float _969 = _949 * _943;
    float _971 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _973 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _971;
    float _975 = -_937;
    float _977 = _975 + 1.0;
    float _979 = fma(_965, _865, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _981 = fma(_973, _865, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _983 = -_857;
    float _985 = _983 + 1.0;
    float _987 = _857 * _977;
    float _989 = _953 * _955;
    float _991 = fma(_921, _865, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _993 = _793 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _995 = isnan(_793);
    bool _997 = _993 || _995;
    bool _999 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1001 = _997 || _999;
    float _1003 = float(_1001);
    float _1005 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1007 = _1005 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1009 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1011 = _1009 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1013 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1015 = _1013 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1017 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1019 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1017;
    float _1021 = _1003 * _985;
    float _1023 = -_1003;
    float _1025 = _1023 + 1.0;
    float _1027 = fma(_1007, _901, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1029 = fma(_1011, _901, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    bool _1031 = _793 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1033 = isnan(_793);
    bool _1035 = _1031 || _1033;
    bool _1037 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1039 = _1035 || _1037;
    float _1041 = float(_1039);
    float _1043 = _885 * _1025;
    float _1045 = -_885;
    float _1047 = _1045 + 1.0;
    float _1049 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1051 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1049;
    float _1053 = fma(_1015, _901, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1055 = _1041 * _1047;
    float _1057 = -_1041;
    float _1059 = _1057 + 1.0;
    float _1061 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1063 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1061;
    float _1065 = fma(_1051, _945, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1067 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1069 = _1067 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1071 = _897 * _1059;
    float _1073 = fma(_1063, _945, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1075 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1077 = _1075 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1079 = -_897;
    float _1081 = _1079 + 1.0;
    float _1083 = _981 * _1071;
    float _1085 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1087 = _1085 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1089 = _979 * _1071;
    float _1091 = _991 * _1071;
    float _1093 = fma(_1077, _957, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1095 = fma(_1087, _957, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1097 = fma(_1081, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1089);
    float _1099 = fma(_1081, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1083);
    float _1101 = fma(_1081, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1091);
    float _1103 = fma(_1069, _957, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1105 = fma(_1027, _1055, _1097);
    float _1107 = fma(_1053, _1055, _1099);
    float _1109 = fma(_1019, _945, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1111 = fma(_1029, _1055, _1101);
    float _1113 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1115 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _1113;
    float _1117 = fma(_1073, _1043, _1105);
    float _1119 = fma(_1065, _1043, _1107);
    float _1121 = fma(_1109, _1043, _1111);
    float _1123 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1125 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _1123;
    float _1127 = -(*spvDescriptorSet0.vp_c9)._m0[128].x;
    float _1129 = _1127 + (*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _1131 = -(*spvDescriptorSet0.vp_c9)._m0[128].y;
    float _1133 = _1131 + (*spvDescriptorSet0.vp_c9)._m0[129].y;
    float _1135 = -(*spvDescriptorSet0.vp_c9)._m0[128].z;
    float _1137 = _1135 + (*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _1139 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1141 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _1139;
    float _1143 = fma(_1115, _925, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _1145 = fma(_1095, _1021, _1117);
    float _1147 = fma(_1125, _925, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _1149 = fma(_1129, _969, (*spvDescriptorSet0.vp_c9)._m0[128].x);
    float _1151 = fma(_1133, _969, (*spvDescriptorSet0.vp_c9)._m0[128].y);
    float _1153 = fma(_1137, _969, (*spvDescriptorSet0.vp_c9)._m0[128].z);
    float _1155 = fma(_1093, _1021, _1119);
    float _1157 = fma(_1103, _1021, _1121);
    float _1159 = fma(_1141, _925, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _1161 = fma(_1143, _987, _1145);
    float _1163 = fma(_1147, _987, _1155);
    float _1165 = fma(_1159, _987, _1157);
    float _1167 = -(*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _1169 = (*spvDescriptorSet0.vp_c9)._m0[130].x + _1167;
    float _1171 = fma(_1149, _967, _1161);
    float _1173 = -(*spvDescriptorSet0.vp_c9)._m0[129].y;
    float _1175 = (*spvDescriptorSet0.vp_c9)._m0[130].y + _1173;
    float _1177 = fma(_1151, _967, _1163);
    float _1179 = -(*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _1181 = (*spvDescriptorSet0.vp_c9)._m0[130].z + _1179;
    float _1183 = fma(_1169, _989, (*spvDescriptorSet0.vp_c9)._m0[129].x);
    float _1185 = fma(_1175, _989, (*spvDescriptorSet0.vp_c9)._m0[129].y);
    float _1187 = fma(_1153, _967, _1165);
    float _1189 = fma(_1181, _989, (*spvDescriptorSet0.vp_c9)._m0[129].z);
    float _1191 = fma(_1183, _939, _1171);
    float _1193 = fma(_1185, _939, _1177);
    float _1195 = fma(_1189, _939, _1187);
    float _1197 = fma(_835, (*spvDescriptorSet0.vp_c9)._m0[130].x, _1191);
    float _1199 = fma(_835, (*spvDescriptorSet0.vp_c9)._m0[130].y, _1193);
    float _1201 = fma(_835, (*spvDescriptorSet0.vp_c9)._m0[130].z, _1195);
    bool _1203 = !_941;
    float _1221;
    if (!_1203)
    {
        float _1205 = in.m_52.x;
        float _1207 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1209 = _1205 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1211 = fma(_1209, (*spvDescriptorSet0.vp_c9)._m0[11].w, _125);
        float _1213 = _1211 * _1207;
        float _1215 = floor(_1213);
        float _1217 = -_1215;
        float _1219 = _1213 + _1217;
        _1221 = _1219;
        _1223 = true;
    }
    else
    {
        float _1225 = float(_91);
        float _1227 = 1.0 / _1225;
        float _1229 = _125 * _1227;
        _1221 = _1229;
    }
    _1223 = false;
    float _1231 = _1221;
    float _1233 = in.m_52.x;
    float _1235 = in.m_52.y;
    float _1237 = in.m_52.z;
    float _1239 = in.m_52.w;
    float _1241 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1243 = log2(_1241);
    float _1245 = in.m_42.x;
    float _1247 = in.m_42.y;
    float _1249 = in.m_42.z;
    int _1251 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1253 = _1251 != 0;
    float _1255 = _1197 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _1257 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1259 = _1257 != 0;
    float _1261 = in.m_58.x;
    float _1263 = in.m_58.y;
    float _1265 = in.m_58.z;
    float _1267 = in.m_58.w;
    int _1269 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1271 = _1269 != 0;
    int _1273 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1275 = _1273 != 0;
    float _1277 = in.m_60.x;
    float _1279 = in.m_60.y;
    float _1281 = in.m_60.z;
    float _1283 = in.m_60.w;
    float _1285 = in.m_62.x;
    float _1287 = in.m_62.y;
    float _1289 = in.m_62.z;
    float _1291 = in.m_62.w;
    float _1293 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1295 = _1243 * _125;
    float _1297 = _1237 * 2.0;
    bool _1299 = _1239 > 0.5;
    float _1301 = _1233 * 2.0;
    float _1303 = exp2(_1295);
    bool _1305 = _1233 > 0.5;
    int _1307 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1309 = _1307 != 0;
    float _1311 = _1247 * _1263;
    float _1313 = -_161;
    int _1315 = _1305 ? as_type<int>(_1313) : as_type<int>(_161);
    bool _1317 = _1235 > 0.5;
    float _1319 = floor(_1297);
    float _1321 = _1247 * _1279;
    float _1323 = -_165;
    int _1325 = _1317 ? as_type<int>(_1323) : as_type<int>(_165);
    float _1327 = _1247 * _1287;
    bool _1329 = _1237 > 0.5;
    float _1331 = fma(_1245, _1277, _1321);
    bool _1333 = !_1253;
    float _1335 = _1333 ? _161 : as_type<float>(_1315);
    float _1337 = floor(_1301);
    float _1339 = -_161;
    int _1341 = _1329 ? as_type<int>(_1339) : as_type<int>(_161);
    float _1343 = fma(_1245, _1285, _1327);
    bool _1345 = !_1259;
    float _1347 = _1345 ? _165 : as_type<float>(_1325);
    float _1349 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1351 = _1349 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    int _1353 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1355 = _1353 != 0;
    int _1357 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1359 = _1357 != 0;
    int _1361 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1363 = _1361 != 0;
    float _1365 = fma(_1245, _1261, _1311);
    float _1367 = _1261;
    float _1369 = _1277;
    float _1371 = _1321;
    if (!_1309)
    {
        _1367 = _1235;
    }
    float _1373 = _1367;
    float _1375 = _1235 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1377 = _1373;
    if (!_1309)
    {
        _1369 = _1237;
    }
    float _1379 = _1369;
    float _1381 = fma(_1249, _1289, _1343);
    float _1383 = _1379;
    if (!_1309)
    {
        _1371 = _1237;
    }
    float _1385 = _1371;
    float _1387 = -_1303;
    float _1389 = _1387 + 1.0;
    float _1391 = _1385;
    if (_1309)
    {
        _1377 = _1233;
    }
    float _1393 = _1377;
    float _1395 = _1381 + _1291;
    if (_1309)
    {
        _1383 = _1235;
    }
    float _1397 = _1383;
    if (_1309)
    {
        _1391 = _1235;
    }
    float _1399 = _1391;
    bool _1401 = _1319 >= 0.0;
    bool _1403 = isnan(_1319);
    bool _1405 = _1401 || _1403;
    bool _1407 = isnan(0.0);
    bool _1409 = _1405 || _1407;
    float _1411 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1413 = _1411 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1415 = _1409 ? 0 : 1;
    bool _1417 = _1319 > 0.0;
    float _1419 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1421 = _1419 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1423 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1425 = _1233 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1427 = 1.0 / _1413;
    int _1429 = ~_1415;
    int _1431 = _1429 + 1;
    int _1433 = _1431 + 1;
    float _1435 = fma(_1375, -2.0, _1423);
    float _1437 = -_1293;
    float _1439 = fma(_1425, 2.0, _1437);
    float _1441 = fma(_1249, _1265, _1365);
    float _1443 = fma(_1249, _1281, _1331);
    float _1445 = _1235 * 2.0;
    float _1447 = 1.0 / _1421;
    int _1449 = _1433;
    if (!_1417)
    {
        int _1451 = ~_1415;
        int _1453 = _1451 + 1;
        _1449 = _1453;
    }
    int _1455 = _1449;
    float _1457 = _1441 + _1267;
    float _1459 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1461 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1459;
    bool _1463 = _1337 >= 0.0;
    bool _1465 = isnan(_1337);
    bool _1467 = _1463 || _1465;
    bool _1469 = isnan(0.0);
    bool _1471 = _1467 || _1469;
    float _1473 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1475 = _1473 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1477 = 1.0 / _1351;
    int _1479 = _1471 ? 0 : 1;
    float _1481 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1483 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1481;
    bool _1485 = _1337 > 0.0;
    float _1487 = _1461 * _1427;
    float _1489 = _1235 + _1237;
    float _1491 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1493 = _1231 + _1491;
    float _1495 = floor(_1445);
    float _1497 = _1475 * _1447;
    float _1499 = _1235 + _1233;
    float _1501 = _1489 + (-1.0);
    float _1503 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1505 = -_125;
    float _1507 = fma(_1505, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1439);
    float _1509 = _1499 + (-1.0);
    bool _1511 = _1231 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1513 = isnan(_1231);
    bool _1515 = _1511 || _1513;
    bool _1517 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1519 = _1515 || _1517;
    float _1521 = float(_1519);
    float _1523 = _1483 * _1477;
    float _1525 = _1393 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _1527 = ~_1479;
    int _1529 = _1527 + 1;
    int _1531 = _1529 + 1;
    float _1533 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1435);
    int _1535 = _1531;
    float _1537 = _1457;
    if (!_1485)
    {
        int _1539 = ~_1479;
        int _1541 = _1539 + 1;
        _1535 = _1541;
    }
    int _1543 = _1535;
    float _1545 = fma(_1501, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1547 = fma(_1509, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1549 = _1495 >= 0.0;
    bool _1551 = isnan(_1495);
    bool _1553 = _1549 || _1551;
    bool _1555 = isnan(0.0);
    bool _1557 = _1553 || _1555;
    float _1559 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1561 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1563 = _1231 + _1561;
    bool _1565 = !_1271;
    float _1567 = _1565 ? _161 : as_type<float>(_1341);
    int _1569 = _1557 ? 0 : 1;
    float _1571 = fma(_1487, _1563, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1573 = _1495 > 0.0;
    float _1575 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1577 = _1231 + _1575;
    float _1579 = fma(_1523, _1493, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1581 = fma(_1399, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1503);
    float _1583 = _1443 + _1283;
    float _1585 = fma(_1497, _1577, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _1587 = _1231 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1589 = isnan(_1231);
    bool _1591 = _1587 || _1589;
    bool _1593 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1595 = _1591 || _1593;
    float _1597 = float(_1595);
    float _1599 = _1335 + 0.5;
    float _1601 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1603 = _1559 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1605 = -_1597;
    float _1607 = _1605 + 1.0;
    float _1609 = float(_1455);
    float _1611 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1613 = fma(_1603, _1599, _1507);
    bool _1615 = _1231 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1617 = isnan(_1231);
    bool _1619 = _1615 || _1617;
    bool _1621 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1623 = _1619 || _1621;
    float _1625 = float(_1623);
    bool _1627 = _1231 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1629 = isnan(_1231);
    bool _1631 = _1627 || _1629;
    bool _1633 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1635 = _1631 || _1633;
    float _1637 = float(_1635);
    float _1639 = _1521 * _1607;
    float _1641 = -_1521;
    float _1643 = _1641 + 1.0;
    float _1645 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1647 = -_1611;
    float _1649 = fma(_1525, 2.0, _1647);
    float _1651 = _1637 * _1643;
    float _1653 = -_1637;
    float _1655 = _1653 + 1.0;
    float _1657 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1659 = float(_1543);
    float _1661 = _1625 * _1655;
    float _1663 = fma(_1393, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1657);
    float _1665 = -_1625;
    float _1667 = _1665 + 1.0;
    float _1669 = _1571 * _1661;
    float _1671 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1673 = _1397 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1675 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1677 = fma(_1667, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1669);
    float _1679 = _1645 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1681 = _1347 + (-0.5);
    float _1683 = fma(_1673, -2.0, _1675);
    float _1685 = fma(_1585, _1651, _1677);
    float _1687 = _1601 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1689 = _1567 + 0.5;
    float _1691 = -_165;
    int _1693 = _1299 ? as_type<int>(_1691) : as_type<int>(_165);
    float _1695 = -_125;
    float _1697 = fma(_1695, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1649);
    float _1699 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1701 = !_1275;
    float _1703 = _1701 ? _165 : as_type<float>(_1693);
    float _1705 = -_1679;
    float _1707 = -_1533;
    float _1709 = fma(_1705, _1681, _1707);
    float _1711 = fma(_1687, _1689, _1697);
    int _1713 = ~_1569;
    int _1715 = _1713 + 1;
    int _1717 = _1715 + 1;
    float _1719 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1721 = _1717;
    float _1723 = _1545;
    if (!_1573)
    {
        int _1725 = ~_1569;
        int _1727 = _1725 + 1;
        _1721 = _1727;
    }
    int _1729 = _1721;
    float _1731 = _1671 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1733 = _1703 + (-0.5);
    float _1735 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1683);
    float _1737 = fma(_1233, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1699);
    float _1739 = fma(_1235, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1719);
    bool _1741 = !_1355;
    int _1743 = _1741 ? 0 : 1;
    float _1745 = -_1731;
    float _1747 = -_1735;
    float _1749 = fma(_1745, _1733, _1747);
    float _1751 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1737);
    bool _1753 = !_1359;
    int _1755 = _1753 ? 0 : 1;
    float _1757 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1663);
    float _1759 = -_1751;
    float _1761 = _1759 + 1.0;
    int _1763 = abs(_1743);
    float _1765 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1739);
    int _1767 = abs(_1755);
    float _1769 = -_1757;
    float _1771 = _1769 + 1.0;
    float _1773 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1775 = 1.0 + _1773;
    float _1777 = -_1765;
    float _1779 = _1777 + 1.0;
    float _1781 = -_1771;
    float _1783 = fma(_1567, _1781, _1711);
    float _1785 = float(_1763);
    float _1787 = 1.0 / _1775;
    float _1789 = -_1761;
    float _1791 = fma(_1335, _1789, _1613);
    float _1793 = fma(_1347, _1779, _1709);
    float _1795 = in.m_64.x;
    float _1797 = in.m_64.y;
    float _1799 = in.m_64.z;
    float _1801 = _1785 * _1609;
    float _1803 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1805 = _1457 + _1803;
    float _1807 = fma(_1579, _1639, _1685);
    float _1809 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1811 = _1395 + _1809;
    float _1813 = _1801 * (-2.0);
    float _1815 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1581);
    float _1817 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1819 = _1583 + _1817;
    float _1821 = fma(_1597, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1807);
    float _1823 = fma(_1547, _1813, _1547);
    float _1825 = -_1815;
    float _1827 = _1825 + 1.0;
    float _1829 = _1819 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1831 = _1819 * _1819;
    bool _1833 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1835 = isnan(0.0);
    bool _1837 = _1833 || _1835;
    bool _1839 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1841 = _1837 || _1839;
    float _1843 = fma(_1703, _1827, _1749);
    float _1845 = fma(_1805, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1829);
    float _1847 = fma(_1805, _1805, _1831);
    float _1849 = _1841 ? _1389 : 0.0;
    float _1851 = fma(_1811, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1845);
    float _1853 = float(_1767);
    out.m_66.x = _1791;
    out.m_66.y = _1793;
    out.m_66.z = _1783;
    out.m_66.w = _1843;
    bool _1855 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1857 = isnan(1.0);
    bool _1859 = _1855 || _1857;
    bool _1861 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1863 = _1859 || _1861;
    bool _1865 = _1851 >= 0.0;
    float _1867 = _1853 * _1659;
    float _1869 = _1867 * (-2.0);
    float _1871 = fma(_1813, _1795, _1795);
    float _1873 = _1235 + (-0.5);
    float _1875 = _1233 + (-0.5);
    float _1877 = fma(_1545, _1869, _1545);
    float _1879 = fma(_1869, _1797, _1797);
    float _1881 = _1199 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1883 = fma(_1811, _1811, _1847);
    float _1885 = _1255 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1887 = _1799;
    if (_1865)
    {
        _1723 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1889 = _1723;
    float _1891 = _1201 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1893 = rsqrt(_1883);
    bool _1895 = !_1363;
    int _1897 = _1895 ? 0 : 1;
    int _1899 = as_type<int>(_1889);
    if (_1863)
    {
        float _1901 = _1849 * _1787;
        _127 = _1901;
    }
    float _1903 = _127;
    float _1905 = fma(_1875, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1871);
    float _1907 = _1881 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1909 = _1891 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1911 = _1821 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _1913 = abs(_1897);
    if (_1865)
    {
        float _1915 = _1889 * 5.0;
        _1899 = as_type<int>(_1915);
    }
    int _1917 = _1899;
    float _1919 = fma(_1823, _1903, _1905);
    if (_1865)
    {
        out.m_45.x = 0.0;
    }
    float _1921 = fma(_1873, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1879);
    out.m_68.x = _1885;
    out.m_68.y = _1907;
    out.m_68.z = _1909;
    out.m_68.w = _1911;
    float _1923 = _1819 * _1893;
    float _1925 = float(_1913);
    float _1927 = _1805 * _1893;
    float _1929 = _1923;
    if (_1865)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5802 = as_type<float>(_1917);
        out.gl_Position.z = _5802;
    }
    float _1931 = _1811 * _1893;
    float _1933 = -_1923;
    float _1935 = fma(_1933, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1819);
    if (_1865)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1937 = -_1923;
    float _1939 = fma(_1937, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1583);
    float _1941 = -_1927;
    float _1943 = fma(_1941, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1457);
    float _1945 = float(_1729);
    float _1947 = -_1931;
    float _1949 = fma(_1947, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1395);
    float _1951 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1953 = _1939 + _1951;
    float _1955 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1957 = _1943 + _1955;
    float _1959 = _1237 + _1233;
    float _1961 = _1925 * _1945;
    float _1963 = _1953 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1965 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1967 = _1949 + _1965;
    float _1969 = _1959 + (-1.0);
    float _1971 = fma(_1957, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1963);
    float _1973 = _1961 * (-2.0);
    float _1975 = -_1927;
    float _1977 = fma(_1975, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1805);
    float _1979 = fma(_1969, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1981 = fma(_1967, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1971);
    float _1983 = _1935 * _1935;
    float _1985 = _1237 + (-0.5);
    float _1987 = fma(_1973, _1799, _1799);
    float _1989 = -_1931;
    float _1991 = fma(_1989, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1811);
    bool _1993 = _1981 >= 0.0;
    float _1995 = fma(_1977, _1977, _1983);
    float _1997 = fma(_1979, _1973, _1979);
    float _1999 = fma(_1985, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1987);
    float _2001 = fma(_1877, _1903, _1921);
    float _2003 = fma(_1991, _1991, _1995);
    float _2005 = _1919 * 0.15915493667125701904296875;
    float _2007 = fma(_1997, _1903, _1999);
    float _2009 = _2001 * 0.15915493667125701904296875;
    float _2011 = sqrt(_2003);
    float _2013 = _2007 * 0.15915493667125701904296875;
    int _2015 = as_type<int>(_1999);
    float _2017 = _1953;
    float _2019 = _1967;
    if (_1993)
    {
        _1887 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2021 = _1887;
    if (_1993)
    {
        out.m_45.x = 0.0;
    }
    float _2023 = _2005 * 6.283185482025146484375;
    float _2025 = sin(_2023);
    if (_1993)
    {
        float _2027 = _2021 * 5.0;
        _2015 = as_type<int>(_2027);
    }
    int _2029 = _2015;
    if (_1993)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5981 = as_type<float>(_2029);
        out.gl_Position.z = _5981;
    }
    float _2031 = _2005 * 6.283185482025146484375;
    float _2033 = cos(_2031);
    float _2035 = _1893 * _2011;
    float _2037 = _2009 * 6.283185482025146484375;
    float _2039 = sin(_2037);
    float _2041 = _2009 * 6.283185482025146484375;
    float _2043 = cos(_2041);
    float _2045 = _2013 * 6.283185482025146484375;
    float _2047 = sin(_2045);
    if (_1993)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2049 = _2013 * 6.283185482025146484375;
    float _2051 = cos(_2049);
    float _2053 = _489 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2055 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _165);
    float _2057 = _519 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2059 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _161);
    float _2061 = _2035 * _2053;
    float _2063 = _2025 * _2039;
    float _2065 = _2035 * _2057;
    float _2067 = _2033 * _2043;
    float _2069 = _2055 * _2061;
    float _2071 = _2059 * _2065;
    float _2073 = fma(_2047, _2067, _2063);
    float _2075 = _2033 * _2039;
    float _2077 = _2025 * _2043;
    float _2079 = fma(_2047, _2063, _2067);
    float _2081 = _2051 * _2069;
    float _2083 = _2039 * _2051;
    float _2085 = _2043 * _2051;
    float _2087 = -_2069;
    float _2089 = _2047 * _2087;
    float _2091 = _2033 * _2081;
    float _2093 = _2035 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2095 = _2093 * 0.5;
    float _2097 = -_2077;
    float _2099 = fma(_2047, _2075, _2097);
    float _2101 = -_2075;
    float _2103 = fma(_2047, _2077, _2101);
    float _2105 = fma(_2073, _2071, _2091);
    float _2107 = _2025 * _2081;
    float _2109 = fma(_2085, _2071, _2089);
    bool _2111 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2113 = isnan(0.5);
    bool _2115 = _2111 || _2113;
    bool _2117 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2119 = _2115 || _2117;
    float _2121 = fma(_2099, _2095, _2105);
    float _2123 = fma(_2103, _2071, _2107);
    float _2125 = fma(_2083, _2095, _2109);
    float _2127 = _2121 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2129 = fma(_2079, _2095, _2123);
    float _2131 = _2121 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2133 = _2121 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2135 = fma(_2125, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2127);
    float _2137 = fma(_2125, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2131);
    float _2139 = fma(_2125, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2133);
    float _2141 = fma(_2129, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2135);
    float _2143 = fma(_2129, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2137);
    float _2145 = fma(_2129, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2139);
    float _2147 = _2141 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2149 = _2143 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2151 = _1395 + _2147;
    float _2153 = _1457 + _2149;
    float _2155 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2157 = _2151 + _2155;
    float _2159 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2161 = _2153 + _2159;
    float _2163 = _2157 * _2157;
    float _2165 = fma(_2161, _2161, _2163);
    float _2167 = _2145 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2169 = sqrt(_2165);
    float _2171 = _1583 + _2167;
    bool _2173 = _2169 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2175 = _2167;
    float _2177 = _2145;
    float _2179 = _2095;
    if (!_2173)
    {
        _2175 = _2153;
    }
    float _2181 = _2175;
    float _2183 = _2181;
    if (!_2173)
    {
        _2177 = _2151;
    }
    float _2185 = _2177;
    float _2187 = _2185;
    if (!_2173)
    {
        _2179 = _2171;
    }
    float _2189 = _2179;
    bool _2191 = !_2173;
    float _2193 = _2189;
    if (!_2191)
    {
        float _2195 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2197 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2199 = _2169 + _2197;
        float _2201 = rsqrt(_2165);
        float _2203 = _2199 * _2195;
        float _2205 = _2171 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2207 = _2203 * 0.15915493667125701904296875;
        float _2209 = _2207 * 6.283185482025146484375;
        float _2211 = cos(_2209);
        float _2213 = _2207 * 6.283185482025146484375;
        float _2215 = sin(_2213);
        float _2217 = _2211 + (-1.0);
        float _2219 = _2217 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2221 = fma(_2215, _2205, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2223 = fma(_2171, _2211, _2219);
        float _2225 = _2201 * _2221;
        float _2227 = fma(_2161, _2225, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2229 = fma(_2157, _2225, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2183 = _2227;
        _2193 = _2223;
        _2187 = _2229;
    }
    float _2231 = _2183;
    float _2233 = _2193;
    float _2235 = _2187;
    float _2237 = -_1927;
    float _2239 = fma(_2237, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2231);
    float _2241 = -_1923;
    float _2243 = fma(_2241, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2233);
    float _2245 = -_1931;
    float _2247 = fma(_2245, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2235);
    float _2249 = _2243;
    float _2251 = _2239;
    float _2253 = _2247;
    if (!_2119)
    {
        float _2255 = _1953 * _1953;
        float _2257 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2259 = -_1457;
        float _2261 = _2259 + _2231;
        float _2263 = -_1583;
        float _2265 = _2263 + _2233;
        float _2267 = fma(_1957, _1957, _2255);
        float _2269 = fma(_1967, _1967, _2267);
        float _2271 = 1.0 / _2035;
        float _2273 = sqrt(_2269);
        float _2275 = precise::min(_2273, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2277 = _2275 * _2257;
        float _2279 = _2277 * _2271;
        float _2281 = -_1395;
        float _2283 = _2281 + _2235;
        float _2285 = fma(_2261, _2279, _1943);
        float _2287 = fma(_2265, _2279, _1939);
        float _2289 = fma(_2283, _2279, _1949);
        _2249 = _2287;
        _2251 = _2285;
        _2253 = _2289;
        _2017 = _2255;
    }
    float _2291 = _2249;
    float _2293 = _2251;
    float _2295 = _2253;
    float _2297 = _2017;
    float _2299 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2301 = _2291 + _2299;
    float _2303 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2305 = _2293 + _2303;
    float _2307 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2309 = _2295 + _2307;
    float _2311 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2313 = _2301 * _2301;
    float _2315 = fma(_2305, _2305, _2313);
    float _2317 = fma(_2309, _2309, _2315);
    float _2319 = rsqrt(_2317);
    float _2321 = sqrt(_2317);
    float _2323 = _2319 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2325 = _2305 * _2323;
    float _2327 = _2309 * _2323;
    float _2329 = _2325 * _2325;
    float _2331 = _2327 * _2327;
    float _2333 = _2329 + _2331;
    float _2335 = sqrt(_2333);
    bool _2337 = _2335 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2339 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2341 = _2335 + _2339;
    float _2343 = _2309;
    float _2345 = _2315;
    float _2347 = _2341;
    float _2349 = _2301;
    if (_2337)
    {
        float _2351 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2343 = _2351;
    }
    float _2353 = _2343;
    if (_2337)
    {
        float _2355 = rsqrt(_2333);
        _2345 = _2355;
    }
    float _2357 = _2345;
    float _2359 = _2357;
    if (_2337)
    {
        float _2361 = _2341 * _2353;
        _2347 = _2361;
    }
    float _2363 = _2347;
    if (_2337)
    {
        float _2365 = _2363 * 0.15915493667125701904296875;
        _2019 = _2365;
    }
    float _2367 = _2019;
    float _2369 = _2319;
    if (_2337)
    {
        float _2371 = _2367 * 6.283185482025146484375;
        float _2373 = sin(_2371);
        _2369 = _2373;
    }
    float _2375 = _2369;
    float _2377 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2379 = precise::max(0.0, _2377);
    float _2381 = _2297;
    float _2383 = _2379;
    float _2385 = _2377;
    if (_2337)
    {
        float _2387 = _2367 * 6.283185482025146484375;
        float _2389 = cos(_2387);
        _2381 = _2389;
    }
    float _2391 = _2381;
    float _2393 = -_2323;
    float _2395 = -_2379;
    float _2397 = fma(_2301, _2393, _2395);
    if (!_2337)
    {
        _2383 = _2327;
    }
    float _2399 = _2383;
    float _2401 = _2399;
    if (_2337)
    {
        float _2403 = _2397 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2385 = _2403;
    }
    float _2405 = _2385;
    float _2407 = _2375;
    float _2409 = _2405;
    if (_2337)
    {
        float _2411 = fma(_2375, _2405, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2407 = _2411;
    }
    float _2413 = _2407;
    float _2415 = _2413;
    if (_2337)
    {
        float _2417 = _2391 + (-1.0);
        _2409 = _2417;
    }
    float _2419 = _2409;
    float _2421 = _2419;
    if (_2337)
    {
        float _2423 = _2357 * _2413;
        _1929 = _2423;
    }
    float _2425 = _1929;
    if (!_2337)
    {
        _2359 = _2325;
    }
    float _2427 = _2359;
    float _2429 = _2427;
    if (_2337)
    {
        float _2431 = _2419 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2349 = _2431;
    }
    float _2433 = _2349;
    float _2435 = _2433;
    if (_2337)
    {
        float _2437 = _2325 * _2425;
        _2429 = _2437;
    }
    float _2439 = _2429;
    if (!_2337)
    {
        _2415 = _2397;
    }
    float _2441 = _2415;
    float _2443 = _2441;
    if (_2337)
    {
        float _2445 = _2327 * _2425;
        _2401 = _2445;
    }
    float _2447 = _2401;
    if (!_2337)
    {
        _2421 = _2329;
    }
    float _2449 = _2421;
    float _2451 = _2449;
    if (_2337)
    {
        float _2453 = fma(_2397, _2391, _2433);
        _2443 = _2453;
    }
    float _2455 = _2443;
    if (_2337)
    {
        float _2457 = _2439 * _2439;
        _2451 = _2457;
    }
    float _2459 = _2451;
    if (!_2337)
    {
        _2435 = _2331;
    }
    float _2461 = _2435;
    float _2463 = _2461;
    if (_2337)
    {
        float _2465 = _2447 * _2447;
        _2463 = _2465;
    }
    float _2467 = _2463;
    float _2469 = fma(_2455, _2455, _2459);
    float _2471 = _2291 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2473 = _2469 + _2467;
    float _2475 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2477 = fma(_2321, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2475);
    float _2479 = precise::clamp(_2477, 0.0, 1.0);
    float _2481 = _2291 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2483 = fma(_2293, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2471);
    float _2485 = rsqrt(_2473);
    float _2487 = -_2479;
    float _2489 = _2487 + 1.0;
    float _2491 = _2291 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2493 = fma(_2293, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2481);
    float _2495 = _2291 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2497 = fma(_2295, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2483);
    float _2499 = fma(_2293, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2491);
    float _2501 = fma(_2295, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2493);
    float _2503 = abs(_2489);
    float _2505 = log2(_2503);
    float _2507 = fma(_2293, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2495);
    float _2509 = fma(_2295, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2499);
    float _2511 = _2501 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2513 = _2497 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2515 = fma(_2295, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2507);
    float _2517 = _2509 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2519 = _2511 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2521 = _2485 * _2439;
    float _2523 = _2485 * _2455;
    float _2525 = _2513 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2527 = fma(_2517, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2519);
    float _2529 = _2521 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2531 = _2485 * _2447;
    float _2533 = _2515 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2535 = fma(_2513, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2527);
    float _2537 = _2505 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2539 = -_2529;
    float _2541 = fma(_2523, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2539);
    float _2543 = -_2525;
    float _2545 = fma(_2543, _2311, 1.0);
    float _2547 = fma(_2533, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2535);
    float _2549 = _2511 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2551 = -_2531;
    float _2553 = fma(_2551, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2541);
    float _2555 = exp2(_2537);
    float _2557 = _2511 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2559 = fma(_2517, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2549);
    float _2561 = fma(_2553, -0.5, 0.5);
    float _2563 = fma(_2553, 0.5, 0.5);
    float _2565 = fma(_2517, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2557);
    float _2567 = _2523 + 1.0;
    float _2569 = fma(_2513, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2559);
    float _2571 = log2(_2545);
    float _2573 = fma(_2513, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2565);
    float _2575 = fma(_2563, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2577 = fma(_2533, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2573);
    float _2579 = fma(_2563, _2575, -0.212114393711090087890625);
    float _2581 = 1.0 / _2547;
    float _2583 = -_2523;
    float _2585 = fma(_2555, _2567, _2583);
    float _2587 = fma(_2533, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2569);
    float _2589 = fma(_2563, _2579, 1.570728778839111328125);
    float _2591 = fma(_2585, 0.5, 0.5);
    float _2593 = sqrt(_2561);
    float _2595 = _2571 * 0.693147182464599609375;
    float _2597 = _2595 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2599 = _2587 * _2581;
    float _2601 = _2577 * _2581;
    float _2603 = fma(_2599, 0.5, 0.5);
    float _2605 = fma(_2601, -0.5, 0.5);
    float _2607 = _2593 * 0.636619746685028076171875;
    float _2609 = -_2589;
    float _2611 = fma(_2607, _2609, 1.0);
    float3 _6934 = float3(_2603, _2605, _2597);
    float _2613 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6934, float3(0.0), isnan(_6934)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6934, float3(0.0), isnan(_6934)), level(0.0)).x;
    float3 _6945 = float3(_2603, _2605, _2597);
    float4 _2616 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6945, float3(0.0), isnan(_6945)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6945, float3(0.0), isnan(_6945)), level(0.0)).xyzw;
    float _2618 = _2616.x;
    float _2620 = _2616.y;
    float _2622 = _2616.z;
    float _2624 = _2616.w;
    float2 _6962 = float2(_2611, _2591);
    float3 _2628 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6962, float2(0.0), isnan(_6962)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6962, float2(0.0), isnan(_6962)), level(0.0)).xyz;
    float _2630 = _2628.x;
    float _2632 = _2628.y;
    float _2634 = _2628.z;
    float _2636 = _1939 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2638 = _1939 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _2640 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2642 = isnan(0.5);
    bool _2644 = _2640 || _2642;
    bool _2646 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2648 = _2644 || _2646;
    float _2650 = _2511 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2652 = fma(_1943, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2636);
    float _2654 = fma(_1943, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2638);
    float _2656 = fma(_2517, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2650);
    float _2658 = fma(_1949, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2652);
    float _2660 = fma(_1949, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2654);
    float _2662 = _2658 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2664 = _2660 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2666 = 1.0 / _2662;
    float _2668 = _2664 + _2662;
    float _2670 = _2597;
    float _2672 = _2658;
    float _2674 = _2662;
    if (!_2648)
    {
        _1537 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _2676 = _1537;
    if (!_2648)
    {
        float _2678 = -_2676;
        float _2680 = _2678 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _2670 = _2680;
    }
    float _2682 = _2670;
    float _2684 = _2682;
    if (!_2648)
    {
        float _2686 = 1.0 / _2682;
        _2684 = _2686;
    }
    float _2688 = _2684;
    float _2690 = _2668 * _2666;
    float _2692 = _2690 * 0.5;
    float _2694 = _2666;
    float _2696 = _2692;
    if (_2648)
    {
        _2694 = 1.0;
    }
    float _2698 = _2694;
    float _2700 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2702 = fma(_2692, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2700);
    float _2704 = _2698;
    if (!_2648)
    {
        _2696 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2706 = _2696;
    float _2708 = 1.0 / _2702;
    float _2710 = _2706;
    if (!_2648)
    {
        float _2712 = -_2706;
        float _2714 = _2712 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2672 = _2714;
    }
    float _2716 = _2672;
    float _2718 = _2716;
    if (!_2648)
    {
        float _2720 = 1.0 / _2716;
        _2718 = _2720;
    }
    float _2722 = _2718;
    if (!_2648)
    {
        float _2724 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2726 = -_2676;
        float _2728 = fma(_2708, _2724, _2726);
        _2674 = _2728;
    }
    float _2730 = _2674;
    float _2732 = _2505 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2734 = _2730;
    if (!_2648)
    {
        float _2736 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2738 = -_2706;
        float _2740 = fma(_2708, _2736, _2738);
        _169 = _2740;
    }
    float _2742 = _169;
    if (_2648)
    {
        _2710 = 1.0;
    }
    float _2744 = _2710;
    float _2746 = _2744;
    if (!_2648)
    {
        float _2748 = _2730 * _2688;
        float _2750 = precise::clamp(_2748, 0.0, 1.0);
        _2734 = _2750;
    }
    float _2752 = _2734;
    float _2754 = fma(_2513, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2656);
    float _2756 = exp2(_2732);
    if (!_2648)
    {
        float _2758 = _2742 * _2722;
        float _2760 = precise::clamp(_2758, 0.0, 1.0);
        _2746 = _2760;
    }
    float _2762 = _2746;
    if (!_2648)
    {
        float _2764 = -_2752;
        float _2766 = _2764 + 1.0;
        _2704 = _2766;
    }
    float _2768 = _2704;
    float _2770 = fma(_2533, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2754);
    float _2772 = _2762 * _2768;
    bool _2774 = _2762 > 0.0;
    bool _2776 = isnan(_2762);
    bool _2778 = _2774 || _2776;
    bool _2780 = isnan(0.0);
    bool _2782 = _2778 || _2780;
    float _2784 = _2772 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2786 = _2768 <= 0.0;
    bool _2788 = !_2782;
    bool _2790 = _2786 || _2788;
    out.gl_Position.x = _2587;
    out.gl_Position.y = _2577;
    out.gl_Position.z = _2770;
    out.gl_Position.w = _2547;
    float _2792 = _2784 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2794 = _2770 + _2547;
    float _2796 = -_2756;
    float _2798 = _2796 + 1.0;
    float _2800 = _2794 * 0.5;
    float _2802 = _2798 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_45.x = _2792;
    float _2804 = -_2802;
    float _2806 = _2804 + 1.0;
    out.m_70.z = _2800;
    out.m_70.w = _2547;
    float _2808 = _2802 * _2613;
    float _2810 = _2624 * _2806;
    float _2812 = _2624 * _2808;
    float _2814 = _2634 * _2808;
    float _2816 = fma(_2630, _2812, _2618);
    float _2818 = fma(_2632, _2812, _2620);
    float _2820 = fma(_2624, _2814, _2622);
    out.m_72.x = _2816;
    out.m_72.y = _2818;
    out.m_72.z = _2820;
    out.m_72.w = _2810;
    if (!_2790)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2822 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_45.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2822;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1223 = false;
    bool _785 = false;
    bool _605 = false;
    bool _429 = false;
    bool _189 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _86 = in.m_42.w;
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
        out.m_45.x = 0.0;
    }
    int _103 = 0;
    if (!_95)
    {
        float _105 = _99 * 5.0;
        _103 = as_type<int>(_105);
    }
    int _107 = _103;
    int _109 = _107;
    if (!_95)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2879 = as_type<float>(_107);
        out.gl_Position.z = _2879;
    }
    if (!_95)
    {
        return out;
    }
    float _111 = in.m_47.w;
    bool _113 = _111 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _115 = isnan(_111);
    bool _117 = _113 || _115;
    bool _119 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _121 = _117 || _119;
    float _123 = -_111;
    float _125 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _127 = _125;
    if (_121)
    {
        float _129 = float(_91);
        _101 = _129;
    }
    float _131 = _101;
    bool _133 = _125 >= _131;
    bool _135 = !_121;
    bool _137 = _133 || _135;
    float _139 = _131;
    if (_137)
    {
        _139 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _141 = _139;
    if (_137)
    {
        out.m_45.x = 0.0;
    }
    if (_137)
    {
        float _143 = _141 * 5.0;
        _109 = as_type<int>(_143);
    }
    int _145 = _109;
    if (_137)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2949 = as_type<float>(_145);
        out.gl_Position.z = _2949;
    }
    if (_137)
    {
        return out;
    }
    float _147 = as_type<float>(int(gl_VertexIndex));
    bool _149 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _151 = as_type<int>(_147) & 1;
    bool _153 = _151 != 0;
    int _155 = as_type<int>(_147) & 2;
    bool _157 = _155 != 0;
    bool _159 = !_153;
    float _161 = _159 ? (-0.5) : 0.5;
    bool _163 = !_157;
    float _165 = _163 ? (-0.5) : 0.5;
    bool _167 = !_149;
    float _169 = 0.5;
    float _187;
    if (!_167)
    {
        float _171 = in.m_52.x;
        float _173 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _175 = _171 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _177 = fma(_175, (*spvDescriptorSet0.vp_c9)._m0[12].x, _125);
        float _179 = _177 * _173;
        float _181 = floor(_179);
        float _183 = -_181;
        float _185 = _179 + _183;
        _187 = _185;
        _189 = true;
    }
    else
    {
        float _191 = float(_91);
        float _193 = 1.0 / _191;
        float _195 = _125 * _193;
        _187 = _195;
    }
    _189 = false;
    float _197 = _187;
    float _199 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _201 = _197 + _199;
    float _203 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _205 = _197 + _203;
    float _207 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _209 = _197 + _207;
    float _211 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _213 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _211;
    float _215 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _217 = _215 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _219 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _221 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _219;
    float _223 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _225 = _223 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _227 = 1.0 / _213;
    bool _229 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _231 = 1.0 / _221;
    float _233 = 1.0 / _217;
    float _235 = _205 * _227;
    float _237 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _239 = _197 + _237;
    float _241 = 1.0 / _225;
    float _243 = _201 * _231;
    bool _245 = _197 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _247 = isnan(_197);
    bool _249 = _245 || _247;
    bool _251 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _253 = _249 || _251;
    float _255 = float(_253);
    float _257 = -_255;
    float _259 = _257 + 1.0;
    float _261 = _209 * _233;
    bool _263 = _197 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _265 = isnan(_197);
    bool _267 = _263 || _265;
    bool _269 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _271 = _267 || _269;
    float _273 = float(_271);
    bool _275 = _197 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _277 = isnan(_197);
    bool _279 = _275 || _277;
    bool _281 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _283 = _279 || _281;
    float _285 = float(_283);
    float _287 = _273 * _259;
    bool _289 = _197 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _291 = isnan(_197);
    bool _293 = _289 || _291;
    bool _295 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _297 = _293 || _295;
    float _299 = float(_297);
    float _301 = _239 * _241;
    float _303 = -_273;
    float _305 = _303 + 1.0;
    bool _307 = _197 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _309 = isnan(_197);
    bool _311 = _307 || _309;
    bool _313 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _315 = _311 || _313;
    float _317 = float(_315);
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _321 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _319;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _325 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _323;
    float _327 = _285 * _305;
    float _329 = -_285;
    float _331 = _329 + 1.0;
    float _333 = fma(_321, _235, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _335 = fma(_325, _235, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _339 = _337 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _341 = _299 * _331;
    float _343 = -_299;
    float _345 = _343 + 1.0;
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _349 = _347 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _351 = -_317;
    float _353 = _351 + 1.0;
    float _355 = fma(_339, _261, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _357 = _317 * _345;
    float _359 = fma(_349, _261, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _363 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _361;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _367 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _365;
    float _369 = _333 * _357;
    float _371 = _335 * _357;
    float _373 = fma(_363, _243, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _375 = fma(_367, _243, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _377 = fma(_353, (*spvDescriptorSet0.vp_c9)._m0[143].x, _369);
    float _379 = fma(_353, (*spvDescriptorSet0.vp_c9)._m0[143].y, _371);
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _383 = _381 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _387 = _385 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _389 = fma(_359, _341, _377);
    float _391 = fma(_355, _341, _379);
    float _393 = fma(_383, _301, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _395 = fma(_387, _301, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _397 = fma(_373, _327, _389);
    float _399 = fma(_375, _327, _391);
    float _401 = fma(_393, _287, _397);
    float _403 = fma(_395, _287, _399);
    float _405 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[147].x, _401);
    float _407 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[147].y, _403);
    bool _409 = !_229;
    float _427;
    if (!_409)
    {
        float _411 = in.m_52.x;
        float _413 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _415 = _411 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _417 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[11].x, _125);
        float _419 = _417 * _413;
        float _421 = floor(_419);
        float _423 = -_421;
        float _425 = _419 + _423;
        _427 = _425;
        _429 = true;
    }
    else
    {
        float _431 = float(_91);
        float _433 = 1.0 / _431;
        float _435 = _125 * _433;
        _427 = _435;
    }
    _429 = false;
    float _437 = _427;
    float _439 = in.m_54.x;
    float _441 = in.m_54.y;
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _445 = _437 + _443;
    bool _447 = _437 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _449 = isnan(_437);
    bool _451 = _447 || _449;
    bool _453 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _455 = _451 || _453;
    float _457 = float(_455);
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _461 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _459;
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _465 = _463 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _467 = _437 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _469 = isnan(_437);
    bool _471 = _467 || _469;
    bool _473 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _475 = _471 || _473;
    float _477 = float(_475);
    float _479 = -_457;
    float _481 = _479 + 1.0;
    float _483 = 1.0 / _461;
    bool _485 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _487 = 1.0 / _465;
    float _489 = _407 * _441;
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _493 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _491;
    float _495 = _445 * _483;
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _499 = _437 + _497;
    bool _501 = _437 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _503 = isnan(_437);
    bool _505 = _501 || _503;
    bool _507 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _509 = _505 || _507;
    float _511 = float(_509);
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _515 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _513;
    float _517 = fma(_493, _495, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _519 = _405 * _439;
    float _521 = _511 * _481;
    float _523 = -_511;
    float _525 = _523 + 1.0;
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _529 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _527;
    float _531 = fma(_515, _495, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _533 = _499 * _487;
    float _535 = _477 * _525;
    float _537 = fma(_529, _495, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _539 = -_477;
    float _541 = _539 + 1.0;
    float _543 = _517 * _535;
    float _545 = _537 * _535;
    float _547 = _531 * _535;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _551 = _549 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _555 = _553 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _559 = _557 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _561 = fma(_541, (*spvDescriptorSet0.vp_c9)._m0[107].x, _545);
    float _563 = fma(_541, (*spvDescriptorSet0.vp_c9)._m0[107].y, _543);
    float _565 = fma(_551, _533, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _567 = fma(_555, _533, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _569 = fma(_559, _533, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _571 = fma(_541, (*spvDescriptorSet0.vp_c9)._m0[107].z, _547);
    float _573 = fma(_565, _521, _561);
    float _575 = fma(_567, _521, _563);
    float _577 = fma(_569, _521, _571);
    float _579 = fma(_457, (*spvDescriptorSet0.vp_c9)._m0[109].x, _573);
    float _581 = fma(_457, (*spvDescriptorSet0.vp_c9)._m0[109].y, _575);
    float _583 = fma(_457, (*spvDescriptorSet0.vp_c9)._m0[109].z, _577);
    bool _585 = !_485;
    float _603;
    if (!_585)
    {
        float _587 = in.m_52.x;
        float _589 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _591 = _587 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _593 = fma(_591, (*spvDescriptorSet0.vp_c9)._m0[11].y, _125);
        float _595 = _593 * _589;
        float _597 = floor(_595);
        float _599 = -_597;
        float _601 = _595 + _599;
        _603 = _601;
        _605 = true;
    }
    else
    {
        float _607 = float(_91);
        float _609 = 1.0 / _607;
        float _611 = _125 * _609;
        _603 = _611;
    }
    _605 = false;
    float _613 = _603;
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _617 = _613 + _615;
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _621 = _619 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _625 = _623 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _627 = _613 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _629 = isnan(_613);
    bool _631 = _627 || _629;
    bool _633 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _635 = _631 || _633;
    float _637 = float(_635);
    float _639 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _641 = _639 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _643 = _613 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _645 = isnan(_613);
    bool _647 = _643 || _645;
    bool _649 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _651 = _647 || _649;
    float _653 = float(_651);
    float _655 = 1.0 / _621;
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _659 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _657;
    float _661 = -_637;
    float _663 = _661 + 1.0;
    bool _665 = _613 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _667 = isnan(_613);
    bool _669 = _665 || _667;
    bool _671 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _673 = _669 || _671;
    float _675 = float(_673);
    bool _677 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _679 = 1.0 / _625;
    float _681 = 1.0 / _641;
    float _683 = _659 * _655;
    float _685 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _687 = _685 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _689 = _653 * _663;
    float _691 = -_653;
    float _693 = _691 + 1.0;
    float _695 = fma(_683, _617, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _699 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _697;
    float _701 = _675 * _693;
    float _703 = _687 * _679;
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _707 = _613 + _705;
    bool _709 = _613 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _711 = isnan(_613);
    bool _713 = _709 || _711;
    bool _715 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _717 = _713 || _715;
    float _719 = float(_717);
    float _721 = _695 * _701;
    float _723 = -_675;
    float _725 = _723 + 1.0;
    float _727 = fma(_703, _707, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _729 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _731 = _613 + _729;
    float _733 = _699 * _681;
    float _735 = -_719;
    float _737 = _735 + 1.0;
    float _739 = fma(_725, (*spvDescriptorSet0.vp_c9)._m0[115].x, _721);
    float _741 = _579 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _743 = fma(_733, _731, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _745 = _637 * _737;
    float _747 = fma(_727, _689, _739);
    float _749 = _741 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _751 = fma(_743, _745, _747);
    float _753 = _581 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _755 = _583 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _757 = fma(_719, (*spvDescriptorSet0.vp_c9)._m0[118].x, _751);
    float _759 = _753 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _761 = _755 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _763 = _757 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_56.x = _749;
    out.m_56.y = _759;
    out.m_56.z = _761;
    out.m_56.w = _763;
    bool _765 = !_677;
    float _783;
    if (!_765)
    {
        float _767 = in.m_52.x;
        float _769 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _771 = _767 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _773 = fma(_771, (*spvDescriptorSet0.vp_c9)._m0[11].z, _125);
        float _775 = _773 * _769;
        float _777 = floor(_775);
        float _779 = -_777;
        float _781 = _775 + _779;
        _783 = _781;
        _785 = true;
    }
    else
    {
        float _787 = float(_91);
        float _789 = 1.0 / _787;
        float _791 = _125 * _789;
        _783 = _791;
    }
    _785 = false;
    float _793 = _783;
    float _795 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _797 = _793 + _795;
    float _799 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _801 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _799;
    float _803 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _805 = _803 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _807 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _809 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _807;
    float _811 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _813 = _811 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _815 = 1.0 / _801;
    float _817 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _819 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _817;
    float _821 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _823 = _821 + (*spvDescriptorSet0.vp_c9)._m0[129].w;
    bool _825 = _793 >= (*spvDescriptorSet0.vp_c9)._m0[130].w;
    bool _827 = isnan(_793);
    bool _829 = _825 || _827;
    bool _831 = isnan((*spvDescriptorSet0.vp_c9)._m0[130].w);
    bool _833 = _829 || _831;
    float _835 = float(_833);
    float _837 = -(*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _839 = (*spvDescriptorSet0.vp_c9)._m0[130].w + _837;
    float _841 = 1.0 / _805;
    float _843 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _845 = _793 + _843;
    bool _847 = _793 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _849 = isnan(_793);
    bool _851 = _847 || _849;
    bool _853 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _855 = _851 || _853;
    float _857 = float(_855);
    float _859 = 1.0 / _819;
    float _861 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _863 = _793 + _861;
    float _865 = _845 * _815;
    float _867 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _869 = _793 + _867;
    float _871 = -_835;
    float _873 = _871 + 1.0;
    bool _875 = _793 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _877 = isnan(_793);
    bool _879 = _875 || _877;
    bool _881 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _883 = _879 || _881;
    float _885 = float(_883);
    bool _887 = _793 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _889 = isnan(_793);
    bool _891 = _887 || _889;
    bool _893 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _895 = _891 || _893;
    float _897 = float(_895);
    float _899 = 1.0 / _809;
    float _901 = _863 * _841;
    float _903 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _905 = _793 + _903;
    bool _907 = _793 >= (*spvDescriptorSet0.vp_c9)._m0[129].w;
    bool _909 = isnan(_793);
    bool _911 = _907 || _909;
    bool _913 = isnan((*spvDescriptorSet0.vp_c9)._m0[129].w);
    bool _915 = _911 || _913;
    float _917 = float(_915);
    float _919 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _921 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _919;
    float _923 = 1.0 / _813;
    float _925 = _905 * _859;
    bool _927 = _793 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _929 = isnan(_793);
    bool _931 = _927 || _929;
    bool _933 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _935 = _931 || _933;
    float _937 = float(_935);
    float _939 = _917 * _873;
    bool _941 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _943 = 1.0 / _823;
    float _945 = _797 * _899;
    float _947 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _949 = _793 + _947;
    float _951 = -(*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _953 = _793 + _951;
    float _955 = 1.0 / _839;
    float _957 = _869 * _923;
    float _959 = -_917;
    float _961 = _959 + 1.0;
    float _963 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _965 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _963;
    float _967 = _937 * _961;
    float _969 = _949 * _943;
    float _971 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _973 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _971;
    float _975 = -_937;
    float _977 = _975 + 1.0;
    float _979 = fma(_965, _865, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _981 = fma(_973, _865, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _983 = -_857;
    float _985 = _983 + 1.0;
    float _987 = _857 * _977;
    float _989 = _953 * _955;
    float _991 = fma(_921, _865, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _993 = _793 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _995 = isnan(_793);
    bool _997 = _993 || _995;
    bool _999 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1001 = _997 || _999;
    float _1003 = float(_1001);
    float _1005 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1007 = _1005 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1009 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1011 = _1009 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1013 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1015 = _1013 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1017 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1019 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1017;
    float _1021 = _1003 * _985;
    float _1023 = -_1003;
    float _1025 = _1023 + 1.0;
    float _1027 = fma(_1007, _901, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1029 = fma(_1011, _901, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    bool _1031 = _793 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1033 = isnan(_793);
    bool _1035 = _1031 || _1033;
    bool _1037 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1039 = _1035 || _1037;
    float _1041 = float(_1039);
    float _1043 = _885 * _1025;
    float _1045 = -_885;
    float _1047 = _1045 + 1.0;
    float _1049 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1051 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1049;
    float _1053 = fma(_1015, _901, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1055 = _1041 * _1047;
    float _1057 = -_1041;
    float _1059 = _1057 + 1.0;
    float _1061 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1063 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1061;
    float _1065 = fma(_1051, _945, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1067 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1069 = _1067 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1071 = _897 * _1059;
    float _1073 = fma(_1063, _945, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1075 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1077 = _1075 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1079 = -_897;
    float _1081 = _1079 + 1.0;
    float _1083 = _981 * _1071;
    float _1085 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1087 = _1085 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1089 = _979 * _1071;
    float _1091 = _991 * _1071;
    float _1093 = fma(_1077, _957, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1095 = fma(_1087, _957, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1097 = fma(_1081, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1089);
    float _1099 = fma(_1081, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1083);
    float _1101 = fma(_1081, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1091);
    float _1103 = fma(_1069, _957, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1105 = fma(_1027, _1055, _1097);
    float _1107 = fma(_1053, _1055, _1099);
    float _1109 = fma(_1019, _945, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1111 = fma(_1029, _1055, _1101);
    float _1113 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1115 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _1113;
    float _1117 = fma(_1073, _1043, _1105);
    float _1119 = fma(_1065, _1043, _1107);
    float _1121 = fma(_1109, _1043, _1111);
    float _1123 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1125 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _1123;
    float _1127 = -(*spvDescriptorSet0.vp_c9)._m0[128].x;
    float _1129 = _1127 + (*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _1131 = -(*spvDescriptorSet0.vp_c9)._m0[128].y;
    float _1133 = _1131 + (*spvDescriptorSet0.vp_c9)._m0[129].y;
    float _1135 = -(*spvDescriptorSet0.vp_c9)._m0[128].z;
    float _1137 = _1135 + (*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _1139 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1141 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _1139;
    float _1143 = fma(_1115, _925, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _1145 = fma(_1095, _1021, _1117);
    float _1147 = fma(_1125, _925, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _1149 = fma(_1129, _969, (*spvDescriptorSet0.vp_c9)._m0[128].x);
    float _1151 = fma(_1133, _969, (*spvDescriptorSet0.vp_c9)._m0[128].y);
    float _1153 = fma(_1137, _969, (*spvDescriptorSet0.vp_c9)._m0[128].z);
    float _1155 = fma(_1093, _1021, _1119);
    float _1157 = fma(_1103, _1021, _1121);
    float _1159 = fma(_1141, _925, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _1161 = fma(_1143, _987, _1145);
    float _1163 = fma(_1147, _987, _1155);
    float _1165 = fma(_1159, _987, _1157);
    float _1167 = -(*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _1169 = (*spvDescriptorSet0.vp_c9)._m0[130].x + _1167;
    float _1171 = fma(_1149, _967, _1161);
    float _1173 = -(*spvDescriptorSet0.vp_c9)._m0[129].y;
    float _1175 = (*spvDescriptorSet0.vp_c9)._m0[130].y + _1173;
    float _1177 = fma(_1151, _967, _1163);
    float _1179 = -(*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _1181 = (*spvDescriptorSet0.vp_c9)._m0[130].z + _1179;
    float _1183 = fma(_1169, _989, (*spvDescriptorSet0.vp_c9)._m0[129].x);
    float _1185 = fma(_1175, _989, (*spvDescriptorSet0.vp_c9)._m0[129].y);
    float _1187 = fma(_1153, _967, _1165);
    float _1189 = fma(_1181, _989, (*spvDescriptorSet0.vp_c9)._m0[129].z);
    float _1191 = fma(_1183, _939, _1171);
    float _1193 = fma(_1185, _939, _1177);
    float _1195 = fma(_1189, _939, _1187);
    float _1197 = fma(_835, (*spvDescriptorSet0.vp_c9)._m0[130].x, _1191);
    float _1199 = fma(_835, (*spvDescriptorSet0.vp_c9)._m0[130].y, _1193);
    float _1201 = fma(_835, (*spvDescriptorSet0.vp_c9)._m0[130].z, _1195);
    bool _1203 = !_941;
    float _1221;
    if (!_1203)
    {
        float _1205 = in.m_52.x;
        float _1207 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1209 = _1205 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1211 = fma(_1209, (*spvDescriptorSet0.vp_c9)._m0[11].w, _125);
        float _1213 = _1211 * _1207;
        float _1215 = floor(_1213);
        float _1217 = -_1215;
        float _1219 = _1213 + _1217;
        _1221 = _1219;
        _1223 = true;
    }
    else
    {
        float _1225 = float(_91);
        float _1227 = 1.0 / _1225;
        float _1229 = _125 * _1227;
        _1221 = _1229;
    }
    _1223 = false;
    float _1231 = _1221;
    float _1233 = in.m_52.x;
    float _1235 = in.m_52.y;
    float _1237 = in.m_52.z;
    float _1239 = in.m_52.w;
    float _1241 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1243 = log2(_1241);
    float _1245 = in.m_42.x;
    float _1247 = in.m_42.y;
    float _1249 = in.m_42.z;
    int _1251 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1253 = _1251 != 0;
    float _1255 = _1197 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _1257 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1259 = _1257 != 0;
    float _1261 = in.m_58.x;
    float _1263 = in.m_58.y;
    float _1265 = in.m_58.z;
    float _1267 = in.m_58.w;
    int _1269 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1271 = _1269 != 0;
    int _1273 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1275 = _1273 != 0;
    float _1277 = in.m_60.x;
    float _1279 = in.m_60.y;
    float _1281 = in.m_60.z;
    float _1283 = in.m_60.w;
    float _1285 = in.m_62.x;
    float _1287 = in.m_62.y;
    float _1289 = in.m_62.z;
    float _1291 = in.m_62.w;
    float _1293 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1295 = _1243 * _125;
    float _1297 = _1237 * 2.0;
    bool _1299 = _1239 > 0.5;
    float _1301 = _1233 * 2.0;
    float _1303 = exp2(_1295);
    bool _1305 = _1233 > 0.5;
    int _1307 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1309 = _1307 != 0;
    float _1311 = _1247 * _1263;
    float _1313 = -_161;
    int _1315 = _1305 ? as_type<int>(_1313) : as_type<int>(_161);
    bool _1317 = _1235 > 0.5;
    float _1319 = floor(_1297);
    float _1321 = _1247 * _1279;
    float _1323 = -_165;
    int _1325 = _1317 ? as_type<int>(_1323) : as_type<int>(_165);
    float _1327 = _1247 * _1287;
    bool _1329 = _1237 > 0.5;
    float _1331 = fma(_1245, _1277, _1321);
    bool _1333 = !_1253;
    float _1335 = _1333 ? _161 : as_type<float>(_1315);
    float _1337 = floor(_1301);
    float _1339 = -_161;
    int _1341 = _1329 ? as_type<int>(_1339) : as_type<int>(_161);
    float _1343 = fma(_1245, _1285, _1327);
    bool _1345 = !_1259;
    float _1347 = _1345 ? _165 : as_type<float>(_1325);
    float _1349 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1351 = _1349 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    int _1353 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1355 = _1353 != 0;
    int _1357 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1359 = _1357 != 0;
    int _1361 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1363 = _1361 != 0;
    float _1365 = fma(_1245, _1261, _1311);
    float _1367 = _1261;
    float _1369 = _1277;
    float _1371 = _1321;
    if (!_1309)
    {
        _1367 = _1235;
    }
    float _1373 = _1367;
    float _1375 = _1235 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1377 = _1373;
    if (!_1309)
    {
        _1369 = _1237;
    }
    float _1379 = _1369;
    float _1381 = fma(_1249, _1289, _1343);
    float _1383 = _1379;
    if (!_1309)
    {
        _1371 = _1237;
    }
    float _1385 = _1371;
    float _1387 = -_1303;
    float _1389 = _1387 + 1.0;
    float _1391 = _1385;
    if (_1309)
    {
        _1377 = _1233;
    }
    float _1393 = _1377;
    float _1395 = _1381 + _1291;
    if (_1309)
    {
        _1383 = _1235;
    }
    float _1397 = _1383;
    if (_1309)
    {
        _1391 = _1235;
    }
    float _1399 = _1391;
    bool _1401 = _1319 >= 0.0;
    bool _1403 = isnan(_1319);
    bool _1405 = _1401 || _1403;
    bool _1407 = isnan(0.0);
    bool _1409 = _1405 || _1407;
    float _1411 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1413 = _1411 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1415 = _1409 ? 0 : 1;
    bool _1417 = _1319 > 0.0;
    float _1419 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1421 = _1419 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1423 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1425 = _1233 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1427 = 1.0 / _1413;
    int _1429 = ~_1415;
    int _1431 = _1429 + 1;
    int _1433 = _1431 + 1;
    float _1435 = fma(_1375, -2.0, _1423);
    float _1437 = -_1293;
    float _1439 = fma(_1425, 2.0, _1437);
    float _1441 = fma(_1249, _1265, _1365);
    float _1443 = fma(_1249, _1281, _1331);
    float _1445 = _1235 * 2.0;
    float _1447 = 1.0 / _1421;
    int _1449 = _1433;
    if (!_1417)
    {
        int _1451 = ~_1415;
        int _1453 = _1451 + 1;
        _1449 = _1453;
    }
    int _1455 = _1449;
    float _1457 = _1441 + _1267;
    float _1459 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1461 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1459;
    bool _1463 = _1337 >= 0.0;
    bool _1465 = isnan(_1337);
    bool _1467 = _1463 || _1465;
    bool _1469 = isnan(0.0);
    bool _1471 = _1467 || _1469;
    float _1473 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1475 = _1473 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1477 = 1.0 / _1351;
    int _1479 = _1471 ? 0 : 1;
    float _1481 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1483 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1481;
    bool _1485 = _1337 > 0.0;
    float _1487 = _1461 * _1427;
    float _1489 = _1235 + _1237;
    float _1491 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1493 = _1231 + _1491;
    float _1495 = floor(_1445);
    float _1497 = _1475 * _1447;
    float _1499 = _1235 + _1233;
    float _1501 = _1489 + (-1.0);
    float _1503 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1505 = -_125;
    float _1507 = fma(_1505, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1439);
    float _1509 = _1499 + (-1.0);
    bool _1511 = _1231 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1513 = isnan(_1231);
    bool _1515 = _1511 || _1513;
    bool _1517 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1519 = _1515 || _1517;
    float _1521 = float(_1519);
    float _1523 = _1483 * _1477;
    float _1525 = _1393 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _1527 = ~_1479;
    int _1529 = _1527 + 1;
    int _1531 = _1529 + 1;
    float _1533 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1435);
    int _1535 = _1531;
    float _1537 = _1457;
    if (!_1485)
    {
        int _1539 = ~_1479;
        int _1541 = _1539 + 1;
        _1535 = _1541;
    }
    int _1543 = _1535;
    float _1545 = fma(_1501, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1547 = fma(_1509, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1549 = _1495 >= 0.0;
    bool _1551 = isnan(_1495);
    bool _1553 = _1549 || _1551;
    bool _1555 = isnan(0.0);
    bool _1557 = _1553 || _1555;
    float _1559 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1561 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1563 = _1231 + _1561;
    bool _1565 = !_1271;
    float _1567 = _1565 ? _161 : as_type<float>(_1341);
    int _1569 = _1557 ? 0 : 1;
    float _1571 = fma(_1487, _1563, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1573 = _1495 > 0.0;
    float _1575 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1577 = _1231 + _1575;
    float _1579 = fma(_1523, _1493, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1581 = fma(_1399, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1503);
    float _1583 = _1443 + _1283;
    float _1585 = fma(_1497, _1577, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _1587 = _1231 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1589 = isnan(_1231);
    bool _1591 = _1587 || _1589;
    bool _1593 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1595 = _1591 || _1593;
    float _1597 = float(_1595);
    float _1599 = _1335 + 0.5;
    float _1601 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1603 = _1559 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1605 = -_1597;
    float _1607 = _1605 + 1.0;
    float _1609 = float(_1455);
    float _1611 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1613 = fma(_1603, _1599, _1507);
    bool _1615 = _1231 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1617 = isnan(_1231);
    bool _1619 = _1615 || _1617;
    bool _1621 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1623 = _1619 || _1621;
    float _1625 = float(_1623);
    bool _1627 = _1231 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1629 = isnan(_1231);
    bool _1631 = _1627 || _1629;
    bool _1633 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1635 = _1631 || _1633;
    float _1637 = float(_1635);
    float _1639 = _1521 * _1607;
    float _1641 = -_1521;
    float _1643 = _1641 + 1.0;
    float _1645 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1647 = -_1611;
    float _1649 = fma(_1525, 2.0, _1647);
    float _1651 = _1637 * _1643;
    float _1653 = -_1637;
    float _1655 = _1653 + 1.0;
    float _1657 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1659 = float(_1543);
    float _1661 = _1625 * _1655;
    float _1663 = fma(_1393, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1657);
    float _1665 = -_1625;
    float _1667 = _1665 + 1.0;
    float _1669 = _1571 * _1661;
    float _1671 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1673 = _1397 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1675 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1677 = fma(_1667, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1669);
    float _1679 = _1645 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1681 = _1347 + (-0.5);
    float _1683 = fma(_1673, -2.0, _1675);
    float _1685 = fma(_1585, _1651, _1677);
    float _1687 = _1601 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1689 = _1567 + 0.5;
    float _1691 = -_165;
    int _1693 = _1299 ? as_type<int>(_1691) : as_type<int>(_165);
    float _1695 = -_125;
    float _1697 = fma(_1695, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1649);
    float _1699 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1701 = !_1275;
    float _1703 = _1701 ? _165 : as_type<float>(_1693);
    float _1705 = -_1679;
    float _1707 = -_1533;
    float _1709 = fma(_1705, _1681, _1707);
    float _1711 = fma(_1687, _1689, _1697);
    int _1713 = ~_1569;
    int _1715 = _1713 + 1;
    int _1717 = _1715 + 1;
    float _1719 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1721 = _1717;
    float _1723 = _1545;
    if (!_1573)
    {
        int _1725 = ~_1569;
        int _1727 = _1725 + 1;
        _1721 = _1727;
    }
    int _1729 = _1721;
    float _1731 = _1671 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1733 = _1703 + (-0.5);
    float _1735 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1683);
    float _1737 = fma(_1233, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1699);
    float _1739 = fma(_1235, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1719);
    bool _1741 = !_1355;
    int _1743 = _1741 ? 0 : 1;
    float _1745 = -_1731;
    float _1747 = -_1735;
    float _1749 = fma(_1745, _1733, _1747);
    float _1751 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1737);
    bool _1753 = !_1359;
    int _1755 = _1753 ? 0 : 1;
    float _1757 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1663);
    float _1759 = -_1751;
    float _1761 = _1759 + 1.0;
    int _1763 = abs(_1743);
    float _1765 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1739);
    int _1767 = abs(_1755);
    float _1769 = -_1757;
    float _1771 = _1769 + 1.0;
    float _1773 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1775 = 1.0 + _1773;
    float _1777 = -_1765;
    float _1779 = _1777 + 1.0;
    float _1781 = -_1771;
    float _1783 = fma(_1567, _1781, _1711);
    float _1785 = float(_1763);
    float _1787 = 1.0 / _1775;
    float _1789 = -_1761;
    float _1791 = fma(_1335, _1789, _1613);
    float _1793 = fma(_1347, _1779, _1709);
    float _1795 = in.m_64.x;
    float _1797 = in.m_64.y;
    float _1799 = in.m_64.z;
    float _1801 = _1785 * _1609;
    float _1803 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1805 = _1457 + _1803;
    float _1807 = fma(_1579, _1639, _1685);
    float _1809 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1811 = _1395 + _1809;
    float _1813 = _1801 * (-2.0);
    float _1815 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1581);
    float _1817 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1819 = _1583 + _1817;
    float _1821 = fma(_1597, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1807);
    float _1823 = fma(_1547, _1813, _1547);
    float _1825 = -_1815;
    float _1827 = _1825 + 1.0;
    float _1829 = _1819 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1831 = _1819 * _1819;
    bool _1833 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1835 = isnan(0.0);
    bool _1837 = _1833 || _1835;
    bool _1839 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1841 = _1837 || _1839;
    float _1843 = fma(_1703, _1827, _1749);
    float _1845 = fma(_1805, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1829);
    float _1847 = fma(_1805, _1805, _1831);
    float _1849 = _1841 ? _1389 : 0.0;
    float _1851 = fma(_1811, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1845);
    float _1853 = float(_1767);
    out.m_66.x = _1791;
    out.m_66.y = _1793;
    out.m_66.z = _1783;
    out.m_66.w = _1843;
    bool _1855 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1857 = isnan(1.0);
    bool _1859 = _1855 || _1857;
    bool _1861 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1863 = _1859 || _1861;
    bool _1865 = _1851 >= 0.0;
    float _1867 = _1853 * _1659;
    float _1869 = _1867 * (-2.0);
    float _1871 = fma(_1813, _1795, _1795);
    float _1873 = _1235 + (-0.5);
    float _1875 = _1233 + (-0.5);
    float _1877 = fma(_1545, _1869, _1545);
    float _1879 = fma(_1869, _1797, _1797);
    float _1881 = _1199 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1883 = fma(_1811, _1811, _1847);
    float _1885 = _1255 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1887 = _1799;
    if (_1865)
    {
        _1723 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1889 = _1723;
    float _1891 = _1201 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1893 = rsqrt(_1883);
    bool _1895 = !_1363;
    int _1897 = _1895 ? 0 : 1;
    int _1899 = as_type<int>(_1889);
    if (_1863)
    {
        float _1901 = _1849 * _1787;
        _127 = _1901;
    }
    float _1903 = _127;
    float _1905 = fma(_1875, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1871);
    float _1907 = _1881 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1909 = _1891 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1911 = _1821 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _1913 = abs(_1897);
    if (_1865)
    {
        float _1915 = _1889 * 5.0;
        _1899 = as_type<int>(_1915);
    }
    int _1917 = _1899;
    float _1919 = fma(_1823, _1903, _1905);
    if (_1865)
    {
        out.m_45.x = 0.0;
    }
    float _1921 = fma(_1873, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1879);
    out.m_68.x = _1885;
    out.m_68.y = _1907;
    out.m_68.z = _1909;
    out.m_68.w = _1911;
    float _1923 = _1819 * _1893;
    float _1925 = float(_1913);
    float _1927 = _1805 * _1893;
    float _1929 = _1923;
    if (_1865)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5802 = as_type<float>(_1917);
        out.gl_Position.z = _5802;
    }
    float _1931 = _1811 * _1893;
    float _1933 = -_1923;
    float _1935 = fma(_1933, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1819);
    if (_1865)
    {
        return out;
    }
    float _1937 = -_1923;
    float _1939 = fma(_1937, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1583);
    float _1941 = -_1927;
    float _1943 = fma(_1941, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1457);
    float _1945 = float(_1729);
    float _1947 = -_1931;
    float _1949 = fma(_1947, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1395);
    float _1951 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1953 = _1939 + _1951;
    float _1955 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1957 = _1943 + _1955;
    float _1959 = _1237 + _1233;
    float _1961 = _1925 * _1945;
    float _1963 = _1953 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1965 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1967 = _1949 + _1965;
    float _1969 = _1959 + (-1.0);
    float _1971 = fma(_1957, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1963);
    float _1973 = _1961 * (-2.0);
    float _1975 = -_1927;
    float _1977 = fma(_1975, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1805);
    float _1979 = fma(_1969, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1981 = fma(_1967, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1971);
    float _1983 = _1935 * _1935;
    float _1985 = _1237 + (-0.5);
    float _1987 = fma(_1973, _1799, _1799);
    float _1989 = -_1931;
    float _1991 = fma(_1989, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1811);
    bool _1993 = _1981 >= 0.0;
    float _1995 = fma(_1977, _1977, _1983);
    float _1997 = fma(_1979, _1973, _1979);
    float _1999 = fma(_1985, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1987);
    float _2001 = fma(_1877, _1903, _1921);
    float _2003 = fma(_1991, _1991, _1995);
    float _2005 = _1919 * 0.15915493667125701904296875;
    float _2007 = fma(_1997, _1903, _1999);
    float _2009 = _2001 * 0.15915493667125701904296875;
    float _2011 = sqrt(_2003);
    float _2013 = _2007 * 0.15915493667125701904296875;
    int _2015 = as_type<int>(_1999);
    float _2017 = _1953;
    float _2019 = _1967;
    if (_1993)
    {
        _1887 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2021 = _1887;
    if (_1993)
    {
        out.m_45.x = 0.0;
    }
    float _2023 = _2005 * 6.283185482025146484375;
    float _2025 = sin(_2023);
    if (_1993)
    {
        float _2027 = _2021 * 5.0;
        _2015 = as_type<int>(_2027);
    }
    int _2029 = _2015;
    if (_1993)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5981 = as_type<float>(_2029);
        out.gl_Position.z = _5981;
    }
    float _2031 = _2005 * 6.283185482025146484375;
    float _2033 = cos(_2031);
    float _2035 = _1893 * _2011;
    float _2037 = _2009 * 6.283185482025146484375;
    float _2039 = sin(_2037);
    float _2041 = _2009 * 6.283185482025146484375;
    float _2043 = cos(_2041);
    float _2045 = _2013 * 6.283185482025146484375;
    float _2047 = sin(_2045);
    if (_1993)
    {
        return out;
    }
    float _2049 = _2013 * 6.283185482025146484375;
    float _2051 = cos(_2049);
    float _2053 = _489 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2055 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _165);
    float _2057 = _519 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2059 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _161);
    float _2061 = _2035 * _2053;
    float _2063 = _2025 * _2039;
    float _2065 = _2035 * _2057;
    float _2067 = _2033 * _2043;
    float _2069 = _2055 * _2061;
    float _2071 = _2059 * _2065;
    float _2073 = fma(_2047, _2067, _2063);
    float _2075 = _2033 * _2039;
    float _2077 = _2025 * _2043;
    float _2079 = fma(_2047, _2063, _2067);
    float _2081 = _2051 * _2069;
    float _2083 = _2039 * _2051;
    float _2085 = _2043 * _2051;
    float _2087 = -_2069;
    float _2089 = _2047 * _2087;
    float _2091 = _2033 * _2081;
    float _2093 = _2035 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2095 = _2093 * 0.5;
    float _2097 = -_2077;
    float _2099 = fma(_2047, _2075, _2097);
    float _2101 = -_2075;
    float _2103 = fma(_2047, _2077, _2101);
    float _2105 = fma(_2073, _2071, _2091);
    float _2107 = _2025 * _2081;
    float _2109 = fma(_2085, _2071, _2089);
    bool _2111 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2113 = isnan(0.5);
    bool _2115 = _2111 || _2113;
    bool _2117 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2119 = _2115 || _2117;
    float _2121 = fma(_2099, _2095, _2105);
    float _2123 = fma(_2103, _2071, _2107);
    float _2125 = fma(_2083, _2095, _2109);
    float _2127 = _2121 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2129 = fma(_2079, _2095, _2123);
    float _2131 = _2121 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2133 = _2121 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2135 = fma(_2125, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2127);
    float _2137 = fma(_2125, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2131);
    float _2139 = fma(_2125, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2133);
    float _2141 = fma(_2129, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2135);
    float _2143 = fma(_2129, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2137);
    float _2145 = fma(_2129, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2139);
    float _2147 = _2141 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2149 = _2143 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2151 = _1395 + _2147;
    float _2153 = _1457 + _2149;
    float _2155 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2157 = _2151 + _2155;
    float _2159 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2161 = _2153 + _2159;
    float _2163 = _2157 * _2157;
    float _2165 = fma(_2161, _2161, _2163);
    float _2167 = _2145 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2169 = sqrt(_2165);
    float _2171 = _1583 + _2167;
    bool _2173 = _2169 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2175 = _2167;
    float _2177 = _2145;
    float _2179 = _2095;
    if (!_2173)
    {
        _2175 = _2153;
    }
    float _2181 = _2175;
    float _2183 = _2181;
    if (!_2173)
    {
        _2177 = _2151;
    }
    float _2185 = _2177;
    float _2187 = _2185;
    if (!_2173)
    {
        _2179 = _2171;
    }
    float _2189 = _2179;
    bool _2191 = !_2173;
    float _2193 = _2189;
    if (!_2191)
    {
        float _2195 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2197 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2199 = _2169 + _2197;
        float _2201 = rsqrt(_2165);
        float _2203 = _2199 * _2195;
        float _2205 = _2171 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2207 = _2203 * 0.15915493667125701904296875;
        float _2209 = _2207 * 6.283185482025146484375;
        float _2211 = cos(_2209);
        float _2213 = _2207 * 6.283185482025146484375;
        float _2215 = sin(_2213);
        float _2217 = _2211 + (-1.0);
        float _2219 = _2217 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2221 = fma(_2215, _2205, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2223 = fma(_2171, _2211, _2219);
        float _2225 = _2201 * _2221;
        float _2227 = fma(_2161, _2225, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2229 = fma(_2157, _2225, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2183 = _2227;
        _2193 = _2223;
        _2187 = _2229;
    }
    float _2231 = _2183;
    float _2233 = _2193;
    float _2235 = _2187;
    float _2237 = -_1927;
    float _2239 = fma(_2237, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2231);
    float _2241 = -_1923;
    float _2243 = fma(_2241, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2233);
    float _2245 = -_1931;
    float _2247 = fma(_2245, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2235);
    float _2249 = _2243;
    float _2251 = _2239;
    float _2253 = _2247;
    if (!_2119)
    {
        float _2255 = _1953 * _1953;
        float _2257 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2259 = -_1457;
        float _2261 = _2259 + _2231;
        float _2263 = -_1583;
        float _2265 = _2263 + _2233;
        float _2267 = fma(_1957, _1957, _2255);
        float _2269 = fma(_1967, _1967, _2267);
        float _2271 = 1.0 / _2035;
        float _2273 = sqrt(_2269);
        float _2275 = precise::min(_2273, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2277 = _2275 * _2257;
        float _2279 = _2277 * _2271;
        float _2281 = -_1395;
        float _2283 = _2281 + _2235;
        float _2285 = fma(_2261, _2279, _1943);
        float _2287 = fma(_2265, _2279, _1939);
        float _2289 = fma(_2283, _2279, _1949);
        _2249 = _2287;
        _2251 = _2285;
        _2253 = _2289;
        _2017 = _2255;
    }
    float _2291 = _2249;
    float _2293 = _2251;
    float _2295 = _2253;
    float _2297 = _2017;
    float _2299 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2301 = _2291 + _2299;
    float _2303 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2305 = _2293 + _2303;
    float _2307 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2309 = _2295 + _2307;
    float _2311 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2313 = _2301 * _2301;
    float _2315 = fma(_2305, _2305, _2313);
    float _2317 = fma(_2309, _2309, _2315);
    float _2319 = rsqrt(_2317);
    float _2321 = sqrt(_2317);
    float _2323 = _2319 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2325 = _2305 * _2323;
    float _2327 = _2309 * _2323;
    float _2329 = _2325 * _2325;
    float _2331 = _2327 * _2327;
    float _2333 = _2329 + _2331;
    float _2335 = sqrt(_2333);
    bool _2337 = _2335 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2339 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2341 = _2335 + _2339;
    float _2343 = _2309;
    float _2345 = _2315;
    float _2347 = _2341;
    float _2349 = _2301;
    if (_2337)
    {
        float _2351 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2343 = _2351;
    }
    float _2353 = _2343;
    if (_2337)
    {
        float _2355 = rsqrt(_2333);
        _2345 = _2355;
    }
    float _2357 = _2345;
    float _2359 = _2357;
    if (_2337)
    {
        float _2361 = _2341 * _2353;
        _2347 = _2361;
    }
    float _2363 = _2347;
    if (_2337)
    {
        float _2365 = _2363 * 0.15915493667125701904296875;
        _2019 = _2365;
    }
    float _2367 = _2019;
    float _2369 = _2319;
    if (_2337)
    {
        float _2371 = _2367 * 6.283185482025146484375;
        float _2373 = sin(_2371);
        _2369 = _2373;
    }
    float _2375 = _2369;
    float _2377 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2379 = precise::max(0.0, _2377);
    float _2381 = _2297;
    float _2383 = _2379;
    float _2385 = _2377;
    if (_2337)
    {
        float _2387 = _2367 * 6.283185482025146484375;
        float _2389 = cos(_2387);
        _2381 = _2389;
    }
    float _2391 = _2381;
    float _2393 = -_2323;
    float _2395 = -_2379;
    float _2397 = fma(_2301, _2393, _2395);
    if (!_2337)
    {
        _2383 = _2327;
    }
    float _2399 = _2383;
    float _2401 = _2399;
    if (_2337)
    {
        float _2403 = _2397 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2385 = _2403;
    }
    float _2405 = _2385;
    float _2407 = _2375;
    float _2409 = _2405;
    if (_2337)
    {
        float _2411 = fma(_2375, _2405, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2407 = _2411;
    }
    float _2413 = _2407;
    float _2415 = _2413;
    if (_2337)
    {
        float _2417 = _2391 + (-1.0);
        _2409 = _2417;
    }
    float _2419 = _2409;
    float _2421 = _2419;
    if (_2337)
    {
        float _2423 = _2357 * _2413;
        _1929 = _2423;
    }
    float _2425 = _1929;
    if (!_2337)
    {
        _2359 = _2325;
    }
    float _2427 = _2359;
    float _2429 = _2427;
    if (_2337)
    {
        float _2431 = _2419 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2349 = _2431;
    }
    float _2433 = _2349;
    float _2435 = _2433;
    if (_2337)
    {
        float _2437 = _2325 * _2425;
        _2429 = _2437;
    }
    float _2439 = _2429;
    if (!_2337)
    {
        _2415 = _2397;
    }
    float _2441 = _2415;
    float _2443 = _2441;
    if (_2337)
    {
        float _2445 = _2327 * _2425;
        _2401 = _2445;
    }
    float _2447 = _2401;
    if (!_2337)
    {
        _2421 = _2329;
    }
    float _2449 = _2421;
    float _2451 = _2449;
    if (_2337)
    {
        float _2453 = fma(_2397, _2391, _2433);
        _2443 = _2453;
    }
    float _2455 = _2443;
    if (_2337)
    {
        float _2457 = _2439 * _2439;
        _2451 = _2457;
    }
    float _2459 = _2451;
    if (!_2337)
    {
        _2435 = _2331;
    }
    float _2461 = _2435;
    float _2463 = _2461;
    if (_2337)
    {
        float _2465 = _2447 * _2447;
        _2463 = _2465;
    }
    float _2467 = _2463;
    float _2469 = fma(_2455, _2455, _2459);
    float _2471 = _2291 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2473 = _2469 + _2467;
    float _2475 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2477 = fma(_2321, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2475);
    float _2479 = precise::clamp(_2477, 0.0, 1.0);
    float _2481 = _2291 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2483 = fma(_2293, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2471);
    float _2485 = rsqrt(_2473);
    float _2487 = -_2479;
    float _2489 = _2487 + 1.0;
    float _2491 = _2291 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2493 = fma(_2293, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2481);
    float _2495 = _2291 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2497 = fma(_2295, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2483);
    float _2499 = fma(_2293, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2491);
    float _2501 = fma(_2295, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2493);
    float _2503 = abs(_2489);
    float _2505 = log2(_2503);
    float _2507 = fma(_2293, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2495);
    float _2509 = fma(_2295, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2499);
    float _2511 = _2501 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2513 = _2497 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2515 = fma(_2295, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2507);
    float _2517 = _2509 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2519 = _2511 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2521 = _2485 * _2439;
    float _2523 = _2485 * _2455;
    float _2525 = _2513 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2527 = fma(_2517, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2519);
    float _2529 = _2521 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2531 = _2485 * _2447;
    float _2533 = _2515 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2535 = fma(_2513, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2527);
    float _2537 = _2505 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2539 = -_2529;
    float _2541 = fma(_2523, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2539);
    float _2543 = -_2525;
    float _2545 = fma(_2543, _2311, 1.0);
    float _2547 = fma(_2533, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2535);
    float _2549 = _2511 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2551 = -_2531;
    float _2553 = fma(_2551, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2541);
    float _2555 = exp2(_2537);
    float _2557 = _2511 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2559 = fma(_2517, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2549);
    float _2561 = fma(_2553, -0.5, 0.5);
    float _2563 = fma(_2553, 0.5, 0.5);
    float _2565 = fma(_2517, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2557);
    float _2567 = _2523 + 1.0;
    float _2569 = fma(_2513, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2559);
    float _2571 = log2(_2545);
    float _2573 = fma(_2513, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2565);
    float _2575 = fma(_2563, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2577 = fma(_2533, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2573);
    float _2579 = fma(_2563, _2575, -0.212114393711090087890625);
    float _2581 = 1.0 / _2547;
    float _2583 = -_2523;
    float _2585 = fma(_2555, _2567, _2583);
    float _2587 = fma(_2533, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2569);
    float _2589 = fma(_2563, _2579, 1.570728778839111328125);
    float _2591 = fma(_2585, 0.5, 0.5);
    float _2593 = sqrt(_2561);
    float _2595 = _2571 * 0.693147182464599609375;
    float _2597 = _2595 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2599 = _2587 * _2581;
    float _2601 = _2577 * _2581;
    float _2603 = fma(_2599, 0.5, 0.5);
    float _2605 = fma(_2601, -0.5, 0.5);
    float _2607 = _2593 * 0.636619746685028076171875;
    float _2609 = -_2589;
    float _2611 = fma(_2607, _2609, 1.0);
    float3 _6934 = float3(_2603, _2605, _2597);
    float _2613 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6934, float3(0.0), isnan(_6934)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6934, float3(0.0), isnan(_6934)), level(0.0)).x;
    float3 _6945 = float3(_2603, _2605, _2597);
    float4 _2616 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6945, float3(0.0), isnan(_6945)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6945, float3(0.0), isnan(_6945)), level(0.0)).xyzw;
    float _2618 = _2616.x;
    float _2620 = _2616.y;
    float _2622 = _2616.z;
    float _2624 = _2616.w;
    float2 _6962 = float2(_2611, _2591);
    float3 _2628 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6962, float2(0.0), isnan(_6962)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6962, float2(0.0), isnan(_6962)), level(0.0)).xyz;
    float _2630 = _2628.x;
    float _2632 = _2628.y;
    float _2634 = _2628.z;
    float _2636 = _1939 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2638 = _1939 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _2640 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2642 = isnan(0.5);
    bool _2644 = _2640 || _2642;
    bool _2646 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2648 = _2644 || _2646;
    float _2650 = _2511 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2652 = fma(_1943, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2636);
    float _2654 = fma(_1943, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2638);
    float _2656 = fma(_2517, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2650);
    float _2658 = fma(_1949, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2652);
    float _2660 = fma(_1949, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2654);
    float _2662 = _2658 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2664 = _2660 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2666 = 1.0 / _2662;
    float _2668 = _2664 + _2662;
    float _2670 = _2597;
    float _2672 = _2658;
    float _2674 = _2662;
    if (!_2648)
    {
        _1537 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _2676 = _1537;
    if (!_2648)
    {
        float _2678 = -_2676;
        float _2680 = _2678 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _2670 = _2680;
    }
    float _2682 = _2670;
    float _2684 = _2682;
    if (!_2648)
    {
        float _2686 = 1.0 / _2682;
        _2684 = _2686;
    }
    float _2688 = _2684;
    float _2690 = _2668 * _2666;
    float _2692 = _2690 * 0.5;
    float _2694 = _2666;
    float _2696 = _2692;
    if (_2648)
    {
        _2694 = 1.0;
    }
    float _2698 = _2694;
    float _2700 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2702 = fma(_2692, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2700);
    float _2704 = _2698;
    if (!_2648)
    {
        _2696 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2706 = _2696;
    float _2708 = 1.0 / _2702;
    float _2710 = _2706;
    if (!_2648)
    {
        float _2712 = -_2706;
        float _2714 = _2712 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2672 = _2714;
    }
    float _2716 = _2672;
    float _2718 = _2716;
    if (!_2648)
    {
        float _2720 = 1.0 / _2716;
        _2718 = _2720;
    }
    float _2722 = _2718;
    if (!_2648)
    {
        float _2724 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2726 = -_2676;
        float _2728 = fma(_2708, _2724, _2726);
        _2674 = _2728;
    }
    float _2730 = _2674;
    float _2732 = _2505 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2734 = _2730;
    if (!_2648)
    {
        float _2736 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2738 = -_2706;
        float _2740 = fma(_2708, _2736, _2738);
        _169 = _2740;
    }
    float _2742 = _169;
    if (_2648)
    {
        _2710 = 1.0;
    }
    float _2744 = _2710;
    float _2746 = _2744;
    if (!_2648)
    {
        float _2748 = _2730 * _2688;
        float _2750 = precise::clamp(_2748, 0.0, 1.0);
        _2734 = _2750;
    }
    float _2752 = _2734;
    float _2754 = fma(_2513, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2656);
    float _2756 = exp2(_2732);
    if (!_2648)
    {
        float _2758 = _2742 * _2722;
        float _2760 = precise::clamp(_2758, 0.0, 1.0);
        _2746 = _2760;
    }
    float _2762 = _2746;
    if (!_2648)
    {
        float _2764 = -_2752;
        float _2766 = _2764 + 1.0;
        _2704 = _2766;
    }
    float _2768 = _2704;
    float _2770 = fma(_2533, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2754);
    float _2772 = _2762 * _2768;
    bool _2774 = _2762 > 0.0;
    bool _2776 = isnan(_2762);
    bool _2778 = _2774 || _2776;
    bool _2780 = isnan(0.0);
    bool _2782 = _2778 || _2780;
    float _2784 = _2772 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2786 = _2768 <= 0.0;
    bool _2788 = !_2782;
    bool _2790 = _2786 || _2788;
    out.gl_Position.x = _2587;
    out.gl_Position.y = _2577;
    out.gl_Position.z = _2770;
    out.gl_Position.w = _2547;
    float _2792 = _2784 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2794 = _2770 + _2547;
    float _2796 = -_2756;
    float _2798 = _2796 + 1.0;
    float _2800 = _2794 * 0.5;
    float _2802 = _2798 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_45.x = _2792;
    float _2804 = -_2802;
    float _2806 = _2804 + 1.0;
    out.m_70.z = _2800;
    out.m_70.w = _2547;
    float _2808 = _2802 * _2613;
    float _2810 = _2624 * _2806;
    float _2812 = _2624 * _2808;
    float _2814 = _2634 * _2808;
    float _2816 = fma(_2630, _2812, _2618);
    float _2818 = fma(_2632, _2812, _2620);
    float _2820 = fma(_2624, _2814, _2622);
    out.m_72.x = _2816;
    out.m_72.y = _2818;
    out.m_72.z = _2820;
    out.m_72.w = _2810;
    if (!_2790)
    {
        return out;
    }
    float _2822 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_45.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2822;
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
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1223 = false;
    bool _785 = false;
    bool _605 = false;
    bool _429 = false;
    bool _189 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _86 = in.m_42.w;
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
        out.m_45.x = 0.0;
    }
    int _103 = 0;
    if (!_95)
    {
        float _105 = _99 * 5.0;
        _103 = as_type<int>(_105);
    }
    int _107 = _103;
    int _109 = _107;
    if (!_95)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2879 = as_type<float>(_107);
        out.gl_Position.z = _2879;
    }
    if (!_95)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _111 = in.m_47.w;
    bool _113 = _111 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _115 = isnan(_111);
    bool _117 = _113 || _115;
    bool _119 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _121 = _117 || _119;
    float _123 = -_111;
    float _125 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _127 = _125;
    if (_121)
    {
        float _129 = float(_91);
        _101 = _129;
    }
    float _131 = _101;
    bool _133 = _125 >= _131;
    bool _135 = !_121;
    bool _137 = _133 || _135;
    float _139 = _131;
    if (_137)
    {
        _139 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _141 = _139;
    if (_137)
    {
        out.m_45.x = 0.0;
    }
    if (_137)
    {
        float _143 = _141 * 5.0;
        _109 = as_type<int>(_143);
    }
    int _145 = _109;
    if (_137)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2949 = as_type<float>(_145);
        out.gl_Position.z = _2949;
    }
    if (_137)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _147 = as_type<float>(int(gl_VertexIndex));
    bool _149 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _151 = as_type<int>(_147) & 1;
    bool _153 = _151 != 0;
    int _155 = as_type<int>(_147) & 2;
    bool _157 = _155 != 0;
    bool _159 = !_153;
    float _161 = _159 ? (-0.5) : 0.5;
    bool _163 = !_157;
    float _165 = _163 ? (-0.5) : 0.5;
    bool _167 = !_149;
    float _169 = 0.5;
    float _187;
    if (!_167)
    {
        float _171 = in.m_52.x;
        float _173 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _175 = _171 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _177 = fma(_175, (*spvDescriptorSet0.vp_c9)._m0[12].x, _125);
        float _179 = _177 * _173;
        float _181 = floor(_179);
        float _183 = -_181;
        float _185 = _179 + _183;
        _187 = _185;
        _189 = true;
    }
    else
    {
        float _191 = float(_91);
        float _193 = 1.0 / _191;
        float _195 = _125 * _193;
        _187 = _195;
    }
    _189 = false;
    float _197 = _187;
    float _199 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _201 = _197 + _199;
    float _203 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _205 = _197 + _203;
    float _207 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _209 = _197 + _207;
    float _211 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _213 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _211;
    float _215 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _217 = _215 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _219 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _221 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _219;
    float _223 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _225 = _223 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _227 = 1.0 / _213;
    bool _229 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _231 = 1.0 / _221;
    float _233 = 1.0 / _217;
    float _235 = _205 * _227;
    float _237 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _239 = _197 + _237;
    float _241 = 1.0 / _225;
    float _243 = _201 * _231;
    bool _245 = _197 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _247 = isnan(_197);
    bool _249 = _245 || _247;
    bool _251 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _253 = _249 || _251;
    float _255 = float(_253);
    float _257 = -_255;
    float _259 = _257 + 1.0;
    float _261 = _209 * _233;
    bool _263 = _197 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _265 = isnan(_197);
    bool _267 = _263 || _265;
    bool _269 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _271 = _267 || _269;
    float _273 = float(_271);
    bool _275 = _197 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _277 = isnan(_197);
    bool _279 = _275 || _277;
    bool _281 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _283 = _279 || _281;
    float _285 = float(_283);
    float _287 = _273 * _259;
    bool _289 = _197 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _291 = isnan(_197);
    bool _293 = _289 || _291;
    bool _295 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _297 = _293 || _295;
    float _299 = float(_297);
    float _301 = _239 * _241;
    float _303 = -_273;
    float _305 = _303 + 1.0;
    bool _307 = _197 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _309 = isnan(_197);
    bool _311 = _307 || _309;
    bool _313 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _315 = _311 || _313;
    float _317 = float(_315);
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _321 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _319;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _325 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _323;
    float _327 = _285 * _305;
    float _329 = -_285;
    float _331 = _329 + 1.0;
    float _333 = fma(_321, _235, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _335 = fma(_325, _235, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _339 = _337 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _341 = _299 * _331;
    float _343 = -_299;
    float _345 = _343 + 1.0;
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _349 = _347 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _351 = -_317;
    float _353 = _351 + 1.0;
    float _355 = fma(_339, _261, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _357 = _317 * _345;
    float _359 = fma(_349, _261, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _363 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _361;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _367 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _365;
    float _369 = _333 * _357;
    float _371 = _335 * _357;
    float _373 = fma(_363, _243, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _375 = fma(_367, _243, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _377 = fma(_353, (*spvDescriptorSet0.vp_c9)._m0[143].x, _369);
    float _379 = fma(_353, (*spvDescriptorSet0.vp_c9)._m0[143].y, _371);
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _383 = _381 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _387 = _385 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _389 = fma(_359, _341, _377);
    float _391 = fma(_355, _341, _379);
    float _393 = fma(_383, _301, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _395 = fma(_387, _301, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _397 = fma(_373, _327, _389);
    float _399 = fma(_375, _327, _391);
    float _401 = fma(_393, _287, _397);
    float _403 = fma(_395, _287, _399);
    float _405 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[147].x, _401);
    float _407 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[147].y, _403);
    bool _409 = !_229;
    float _427;
    if (!_409)
    {
        float _411 = in.m_52.x;
        float _413 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _415 = _411 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _417 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[11].x, _125);
        float _419 = _417 * _413;
        float _421 = floor(_419);
        float _423 = -_421;
        float _425 = _419 + _423;
        _427 = _425;
        _429 = true;
    }
    else
    {
        float _431 = float(_91);
        float _433 = 1.0 / _431;
        float _435 = _125 * _433;
        _427 = _435;
    }
    _429 = false;
    float _437 = _427;
    float _439 = in.m_54.x;
    float _441 = in.m_54.y;
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _445 = _437 + _443;
    bool _447 = _437 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _449 = isnan(_437);
    bool _451 = _447 || _449;
    bool _453 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _455 = _451 || _453;
    float _457 = float(_455);
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _461 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _459;
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _465 = _463 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _467 = _437 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _469 = isnan(_437);
    bool _471 = _467 || _469;
    bool _473 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _475 = _471 || _473;
    float _477 = float(_475);
    float _479 = -_457;
    float _481 = _479 + 1.0;
    float _483 = 1.0 / _461;
    bool _485 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _487 = 1.0 / _465;
    float _489 = _407 * _441;
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _493 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _491;
    float _495 = _445 * _483;
    float _497 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _499 = _437 + _497;
    bool _501 = _437 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _503 = isnan(_437);
    bool _505 = _501 || _503;
    bool _507 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _509 = _505 || _507;
    float _511 = float(_509);
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _515 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _513;
    float _517 = fma(_493, _495, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _519 = _405 * _439;
    float _521 = _511 * _481;
    float _523 = -_511;
    float _525 = _523 + 1.0;
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _529 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _527;
    float _531 = fma(_515, _495, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _533 = _499 * _487;
    float _535 = _477 * _525;
    float _537 = fma(_529, _495, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _539 = -_477;
    float _541 = _539 + 1.0;
    float _543 = _517 * _535;
    float _545 = _537 * _535;
    float _547 = _531 * _535;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _551 = _549 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _555 = _553 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _559 = _557 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _561 = fma(_541, (*spvDescriptorSet0.vp_c9)._m0[107].x, _545);
    float _563 = fma(_541, (*spvDescriptorSet0.vp_c9)._m0[107].y, _543);
    float _565 = fma(_551, _533, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _567 = fma(_555, _533, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _569 = fma(_559, _533, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _571 = fma(_541, (*spvDescriptorSet0.vp_c9)._m0[107].z, _547);
    float _573 = fma(_565, _521, _561);
    float _575 = fma(_567, _521, _563);
    float _577 = fma(_569, _521, _571);
    float _579 = fma(_457, (*spvDescriptorSet0.vp_c9)._m0[109].x, _573);
    float _581 = fma(_457, (*spvDescriptorSet0.vp_c9)._m0[109].y, _575);
    float _583 = fma(_457, (*spvDescriptorSet0.vp_c9)._m0[109].z, _577);
    bool _585 = !_485;
    float _603;
    if (!_585)
    {
        float _587 = in.m_52.x;
        float _589 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _591 = _587 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _593 = fma(_591, (*spvDescriptorSet0.vp_c9)._m0[11].y, _125);
        float _595 = _593 * _589;
        float _597 = floor(_595);
        float _599 = -_597;
        float _601 = _595 + _599;
        _603 = _601;
        _605 = true;
    }
    else
    {
        float _607 = float(_91);
        float _609 = 1.0 / _607;
        float _611 = _125 * _609;
        _603 = _611;
    }
    _605 = false;
    float _613 = _603;
    float _615 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _617 = _613 + _615;
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _621 = _619 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _625 = _623 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _627 = _613 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _629 = isnan(_613);
    bool _631 = _627 || _629;
    bool _633 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _635 = _631 || _633;
    float _637 = float(_635);
    float _639 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _641 = _639 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _643 = _613 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _645 = isnan(_613);
    bool _647 = _643 || _645;
    bool _649 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _651 = _647 || _649;
    float _653 = float(_651);
    float _655 = 1.0 / _621;
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _659 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _657;
    float _661 = -_637;
    float _663 = _661 + 1.0;
    bool _665 = _613 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _667 = isnan(_613);
    bool _669 = _665 || _667;
    bool _671 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _673 = _669 || _671;
    float _675 = float(_673);
    bool _677 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _679 = 1.0 / _625;
    float _681 = 1.0 / _641;
    float _683 = _659 * _655;
    float _685 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _687 = _685 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _689 = _653 * _663;
    float _691 = -_653;
    float _693 = _691 + 1.0;
    float _695 = fma(_683, _617, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _699 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _697;
    float _701 = _675 * _693;
    float _703 = _687 * _679;
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _707 = _613 + _705;
    bool _709 = _613 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _711 = isnan(_613);
    bool _713 = _709 || _711;
    bool _715 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _717 = _713 || _715;
    float _719 = float(_717);
    float _721 = _695 * _701;
    float _723 = -_675;
    float _725 = _723 + 1.0;
    float _727 = fma(_703, _707, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _729 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _731 = _613 + _729;
    float _733 = _699 * _681;
    float _735 = -_719;
    float _737 = _735 + 1.0;
    float _739 = fma(_725, (*spvDescriptorSet0.vp_c9)._m0[115].x, _721);
    float _741 = _579 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _743 = fma(_733, _731, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _745 = _637 * _737;
    float _747 = fma(_727, _689, _739);
    float _749 = _741 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _751 = fma(_743, _745, _747);
    float _753 = _581 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _755 = _583 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _757 = fma(_719, (*spvDescriptorSet0.vp_c9)._m0[118].x, _751);
    float _759 = _753 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _761 = _755 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _763 = _757 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_56.x = _749;
    out.m_56.y = _759;
    out.m_56.z = _761;
    out.m_56.w = _763;
    bool _765 = !_677;
    float _783;
    if (!_765)
    {
        float _767 = in.m_52.x;
        float _769 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _771 = _767 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _773 = fma(_771, (*spvDescriptorSet0.vp_c9)._m0[11].z, _125);
        float _775 = _773 * _769;
        float _777 = floor(_775);
        float _779 = -_777;
        float _781 = _775 + _779;
        _783 = _781;
        _785 = true;
    }
    else
    {
        float _787 = float(_91);
        float _789 = 1.0 / _787;
        float _791 = _125 * _789;
        _783 = _791;
    }
    _785 = false;
    float _793 = _783;
    float _795 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _797 = _793 + _795;
    float _799 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _801 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _799;
    float _803 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _805 = _803 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _807 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _809 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _807;
    float _811 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _813 = _811 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _815 = 1.0 / _801;
    float _817 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _819 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _817;
    float _821 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _823 = _821 + (*spvDescriptorSet0.vp_c9)._m0[129].w;
    bool _825 = _793 >= (*spvDescriptorSet0.vp_c9)._m0[130].w;
    bool _827 = isnan(_793);
    bool _829 = _825 || _827;
    bool _831 = isnan((*spvDescriptorSet0.vp_c9)._m0[130].w);
    bool _833 = _829 || _831;
    float _835 = float(_833);
    float _837 = -(*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _839 = (*spvDescriptorSet0.vp_c9)._m0[130].w + _837;
    float _841 = 1.0 / _805;
    float _843 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _845 = _793 + _843;
    bool _847 = _793 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _849 = isnan(_793);
    bool _851 = _847 || _849;
    bool _853 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _855 = _851 || _853;
    float _857 = float(_855);
    float _859 = 1.0 / _819;
    float _861 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _863 = _793 + _861;
    float _865 = _845 * _815;
    float _867 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _869 = _793 + _867;
    float _871 = -_835;
    float _873 = _871 + 1.0;
    bool _875 = _793 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _877 = isnan(_793);
    bool _879 = _875 || _877;
    bool _881 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _883 = _879 || _881;
    float _885 = float(_883);
    bool _887 = _793 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _889 = isnan(_793);
    bool _891 = _887 || _889;
    bool _893 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _895 = _891 || _893;
    float _897 = float(_895);
    float _899 = 1.0 / _809;
    float _901 = _863 * _841;
    float _903 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _905 = _793 + _903;
    bool _907 = _793 >= (*spvDescriptorSet0.vp_c9)._m0[129].w;
    bool _909 = isnan(_793);
    bool _911 = _907 || _909;
    bool _913 = isnan((*spvDescriptorSet0.vp_c9)._m0[129].w);
    bool _915 = _911 || _913;
    float _917 = float(_915);
    float _919 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _921 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _919;
    float _923 = 1.0 / _813;
    float _925 = _905 * _859;
    bool _927 = _793 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _929 = isnan(_793);
    bool _931 = _927 || _929;
    bool _933 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _935 = _931 || _933;
    float _937 = float(_935);
    float _939 = _917 * _873;
    bool _941 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _943 = 1.0 / _823;
    float _945 = _797 * _899;
    float _947 = -(*spvDescriptorSet0.vp_c9)._m0[128].w;
    float _949 = _793 + _947;
    float _951 = -(*spvDescriptorSet0.vp_c9)._m0[129].w;
    float _953 = _793 + _951;
    float _955 = 1.0 / _839;
    float _957 = _869 * _923;
    float _959 = -_917;
    float _961 = _959 + 1.0;
    float _963 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _965 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _963;
    float _967 = _937 * _961;
    float _969 = _949 * _943;
    float _971 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _973 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _971;
    float _975 = -_937;
    float _977 = _975 + 1.0;
    float _979 = fma(_965, _865, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _981 = fma(_973, _865, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _983 = -_857;
    float _985 = _983 + 1.0;
    float _987 = _857 * _977;
    float _989 = _953 * _955;
    float _991 = fma(_921, _865, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _993 = _793 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _995 = isnan(_793);
    bool _997 = _993 || _995;
    bool _999 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1001 = _997 || _999;
    float _1003 = float(_1001);
    float _1005 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1007 = _1005 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1009 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1011 = _1009 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1013 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1015 = _1013 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1017 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1019 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1017;
    float _1021 = _1003 * _985;
    float _1023 = -_1003;
    float _1025 = _1023 + 1.0;
    float _1027 = fma(_1007, _901, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1029 = fma(_1011, _901, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    bool _1031 = _793 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1033 = isnan(_793);
    bool _1035 = _1031 || _1033;
    bool _1037 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1039 = _1035 || _1037;
    float _1041 = float(_1039);
    float _1043 = _885 * _1025;
    float _1045 = -_885;
    float _1047 = _1045 + 1.0;
    float _1049 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1051 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1049;
    float _1053 = fma(_1015, _901, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1055 = _1041 * _1047;
    float _1057 = -_1041;
    float _1059 = _1057 + 1.0;
    float _1061 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1063 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1061;
    float _1065 = fma(_1051, _945, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1067 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1069 = _1067 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1071 = _897 * _1059;
    float _1073 = fma(_1063, _945, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1075 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1077 = _1075 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1079 = -_897;
    float _1081 = _1079 + 1.0;
    float _1083 = _981 * _1071;
    float _1085 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1087 = _1085 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1089 = _979 * _1071;
    float _1091 = _991 * _1071;
    float _1093 = fma(_1077, _957, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1095 = fma(_1087, _957, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1097 = fma(_1081, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1089);
    float _1099 = fma(_1081, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1083);
    float _1101 = fma(_1081, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1091);
    float _1103 = fma(_1069, _957, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1105 = fma(_1027, _1055, _1097);
    float _1107 = fma(_1053, _1055, _1099);
    float _1109 = fma(_1019, _945, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1111 = fma(_1029, _1055, _1101);
    float _1113 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1115 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _1113;
    float _1117 = fma(_1073, _1043, _1105);
    float _1119 = fma(_1065, _1043, _1107);
    float _1121 = fma(_1109, _1043, _1111);
    float _1123 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1125 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _1123;
    float _1127 = -(*spvDescriptorSet0.vp_c9)._m0[128].x;
    float _1129 = _1127 + (*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _1131 = -(*spvDescriptorSet0.vp_c9)._m0[128].y;
    float _1133 = _1131 + (*spvDescriptorSet0.vp_c9)._m0[129].y;
    float _1135 = -(*spvDescriptorSet0.vp_c9)._m0[128].z;
    float _1137 = _1135 + (*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _1139 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1141 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _1139;
    float _1143 = fma(_1115, _925, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _1145 = fma(_1095, _1021, _1117);
    float _1147 = fma(_1125, _925, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _1149 = fma(_1129, _969, (*spvDescriptorSet0.vp_c9)._m0[128].x);
    float _1151 = fma(_1133, _969, (*spvDescriptorSet0.vp_c9)._m0[128].y);
    float _1153 = fma(_1137, _969, (*spvDescriptorSet0.vp_c9)._m0[128].z);
    float _1155 = fma(_1093, _1021, _1119);
    float _1157 = fma(_1103, _1021, _1121);
    float _1159 = fma(_1141, _925, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _1161 = fma(_1143, _987, _1145);
    float _1163 = fma(_1147, _987, _1155);
    float _1165 = fma(_1159, _987, _1157);
    float _1167 = -(*spvDescriptorSet0.vp_c9)._m0[129].x;
    float _1169 = (*spvDescriptorSet0.vp_c9)._m0[130].x + _1167;
    float _1171 = fma(_1149, _967, _1161);
    float _1173 = -(*spvDescriptorSet0.vp_c9)._m0[129].y;
    float _1175 = (*spvDescriptorSet0.vp_c9)._m0[130].y + _1173;
    float _1177 = fma(_1151, _967, _1163);
    float _1179 = -(*spvDescriptorSet0.vp_c9)._m0[129].z;
    float _1181 = (*spvDescriptorSet0.vp_c9)._m0[130].z + _1179;
    float _1183 = fma(_1169, _989, (*spvDescriptorSet0.vp_c9)._m0[129].x);
    float _1185 = fma(_1175, _989, (*spvDescriptorSet0.vp_c9)._m0[129].y);
    float _1187 = fma(_1153, _967, _1165);
    float _1189 = fma(_1181, _989, (*spvDescriptorSet0.vp_c9)._m0[129].z);
    float _1191 = fma(_1183, _939, _1171);
    float _1193 = fma(_1185, _939, _1177);
    float _1195 = fma(_1189, _939, _1187);
    float _1197 = fma(_835, (*spvDescriptorSet0.vp_c9)._m0[130].x, _1191);
    float _1199 = fma(_835, (*spvDescriptorSet0.vp_c9)._m0[130].y, _1193);
    float _1201 = fma(_835, (*spvDescriptorSet0.vp_c9)._m0[130].z, _1195);
    bool _1203 = !_941;
    float _1221;
    if (!_1203)
    {
        float _1205 = in.m_52.x;
        float _1207 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1209 = _1205 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1211 = fma(_1209, (*spvDescriptorSet0.vp_c9)._m0[11].w, _125);
        float _1213 = _1211 * _1207;
        float _1215 = floor(_1213);
        float _1217 = -_1215;
        float _1219 = _1213 + _1217;
        _1221 = _1219;
        _1223 = true;
    }
    else
    {
        float _1225 = float(_91);
        float _1227 = 1.0 / _1225;
        float _1229 = _125 * _1227;
        _1221 = _1229;
    }
    _1223 = false;
    float _1231 = _1221;
    float _1233 = in.m_52.x;
    float _1235 = in.m_52.y;
    float _1237 = in.m_52.z;
    float _1239 = in.m_52.w;
    float _1241 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1243 = log2(_1241);
    float _1245 = in.m_42.x;
    float _1247 = in.m_42.y;
    float _1249 = in.m_42.z;
    int _1251 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1253 = _1251 != 0;
    float _1255 = _1197 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _1257 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1259 = _1257 != 0;
    float _1261 = in.m_58.x;
    float _1263 = in.m_58.y;
    float _1265 = in.m_58.z;
    float _1267 = in.m_58.w;
    int _1269 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1271 = _1269 != 0;
    int _1273 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1275 = _1273 != 0;
    float _1277 = in.m_60.x;
    float _1279 = in.m_60.y;
    float _1281 = in.m_60.z;
    float _1283 = in.m_60.w;
    float _1285 = in.m_62.x;
    float _1287 = in.m_62.y;
    float _1289 = in.m_62.z;
    float _1291 = in.m_62.w;
    float _1293 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1295 = _1243 * _125;
    float _1297 = _1237 * 2.0;
    bool _1299 = _1239 > 0.5;
    float _1301 = _1233 * 2.0;
    float _1303 = exp2(_1295);
    bool _1305 = _1233 > 0.5;
    int _1307 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1309 = _1307 != 0;
    float _1311 = _1247 * _1263;
    float _1313 = -_161;
    int _1315 = _1305 ? as_type<int>(_1313) : as_type<int>(_161);
    bool _1317 = _1235 > 0.5;
    float _1319 = floor(_1297);
    float _1321 = _1247 * _1279;
    float _1323 = -_165;
    int _1325 = _1317 ? as_type<int>(_1323) : as_type<int>(_165);
    float _1327 = _1247 * _1287;
    bool _1329 = _1237 > 0.5;
    float _1331 = fma(_1245, _1277, _1321);
    bool _1333 = !_1253;
    float _1335 = _1333 ? _161 : as_type<float>(_1315);
    float _1337 = floor(_1301);
    float _1339 = -_161;
    int _1341 = _1329 ? as_type<int>(_1339) : as_type<int>(_161);
    float _1343 = fma(_1245, _1285, _1327);
    bool _1345 = !_1259;
    float _1347 = _1345 ? _165 : as_type<float>(_1325);
    float _1349 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1351 = _1349 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    int _1353 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1355 = _1353 != 0;
    int _1357 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1359 = _1357 != 0;
    int _1361 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1363 = _1361 != 0;
    float _1365 = fma(_1245, _1261, _1311);
    float _1367 = _1261;
    float _1369 = _1277;
    float _1371 = _1321;
    if (!_1309)
    {
        _1367 = _1235;
    }
    float _1373 = _1367;
    float _1375 = _1235 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1377 = _1373;
    if (!_1309)
    {
        _1369 = _1237;
    }
    float _1379 = _1369;
    float _1381 = fma(_1249, _1289, _1343);
    float _1383 = _1379;
    if (!_1309)
    {
        _1371 = _1237;
    }
    float _1385 = _1371;
    float _1387 = -_1303;
    float _1389 = _1387 + 1.0;
    float _1391 = _1385;
    if (_1309)
    {
        _1377 = _1233;
    }
    float _1393 = _1377;
    float _1395 = _1381 + _1291;
    if (_1309)
    {
        _1383 = _1235;
    }
    float _1397 = _1383;
    if (_1309)
    {
        _1391 = _1235;
    }
    float _1399 = _1391;
    bool _1401 = _1319 >= 0.0;
    bool _1403 = isnan(_1319);
    bool _1405 = _1401 || _1403;
    bool _1407 = isnan(0.0);
    bool _1409 = _1405 || _1407;
    float _1411 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1413 = _1411 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1415 = _1409 ? 0 : 1;
    bool _1417 = _1319 > 0.0;
    float _1419 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1421 = _1419 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1423 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1425 = _1233 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1427 = 1.0 / _1413;
    int _1429 = ~_1415;
    int _1431 = _1429 + 1;
    int _1433 = _1431 + 1;
    float _1435 = fma(_1375, -2.0, _1423);
    float _1437 = -_1293;
    float _1439 = fma(_1425, 2.0, _1437);
    float _1441 = fma(_1249, _1265, _1365);
    float _1443 = fma(_1249, _1281, _1331);
    float _1445 = _1235 * 2.0;
    float _1447 = 1.0 / _1421;
    int _1449 = _1433;
    if (!_1417)
    {
        int _1451 = ~_1415;
        int _1453 = _1451 + 1;
        _1449 = _1453;
    }
    int _1455 = _1449;
    float _1457 = _1441 + _1267;
    float _1459 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1461 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1459;
    bool _1463 = _1337 >= 0.0;
    bool _1465 = isnan(_1337);
    bool _1467 = _1463 || _1465;
    bool _1469 = isnan(0.0);
    bool _1471 = _1467 || _1469;
    float _1473 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1475 = _1473 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1477 = 1.0 / _1351;
    int _1479 = _1471 ? 0 : 1;
    float _1481 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1483 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1481;
    bool _1485 = _1337 > 0.0;
    float _1487 = _1461 * _1427;
    float _1489 = _1235 + _1237;
    float _1491 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1493 = _1231 + _1491;
    float _1495 = floor(_1445);
    float _1497 = _1475 * _1447;
    float _1499 = _1235 + _1233;
    float _1501 = _1489 + (-1.0);
    float _1503 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1505 = -_125;
    float _1507 = fma(_1505, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1439);
    float _1509 = _1499 + (-1.0);
    bool _1511 = _1231 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1513 = isnan(_1231);
    bool _1515 = _1511 || _1513;
    bool _1517 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1519 = _1515 || _1517;
    float _1521 = float(_1519);
    float _1523 = _1483 * _1477;
    float _1525 = _1393 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _1527 = ~_1479;
    int _1529 = _1527 + 1;
    int _1531 = _1529 + 1;
    float _1533 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1435);
    int _1535 = _1531;
    float _1537 = _1457;
    if (!_1485)
    {
        int _1539 = ~_1479;
        int _1541 = _1539 + 1;
        _1535 = _1541;
    }
    int _1543 = _1535;
    float _1545 = fma(_1501, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1547 = fma(_1509, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1549 = _1495 >= 0.0;
    bool _1551 = isnan(_1495);
    bool _1553 = _1549 || _1551;
    bool _1555 = isnan(0.0);
    bool _1557 = _1553 || _1555;
    float _1559 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1561 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1563 = _1231 + _1561;
    bool _1565 = !_1271;
    float _1567 = _1565 ? _161 : as_type<float>(_1341);
    int _1569 = _1557 ? 0 : 1;
    float _1571 = fma(_1487, _1563, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1573 = _1495 > 0.0;
    float _1575 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1577 = _1231 + _1575;
    float _1579 = fma(_1523, _1493, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1581 = fma(_1399, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1503);
    float _1583 = _1443 + _1283;
    float _1585 = fma(_1497, _1577, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _1587 = _1231 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1589 = isnan(_1231);
    bool _1591 = _1587 || _1589;
    bool _1593 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1595 = _1591 || _1593;
    float _1597 = float(_1595);
    float _1599 = _1335 + 0.5;
    float _1601 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1603 = _1559 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1605 = -_1597;
    float _1607 = _1605 + 1.0;
    float _1609 = float(_1455);
    float _1611 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1613 = fma(_1603, _1599, _1507);
    bool _1615 = _1231 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1617 = isnan(_1231);
    bool _1619 = _1615 || _1617;
    bool _1621 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1623 = _1619 || _1621;
    float _1625 = float(_1623);
    bool _1627 = _1231 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1629 = isnan(_1231);
    bool _1631 = _1627 || _1629;
    bool _1633 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1635 = _1631 || _1633;
    float _1637 = float(_1635);
    float _1639 = _1521 * _1607;
    float _1641 = -_1521;
    float _1643 = _1641 + 1.0;
    float _1645 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1647 = -_1611;
    float _1649 = fma(_1525, 2.0, _1647);
    float _1651 = _1637 * _1643;
    float _1653 = -_1637;
    float _1655 = _1653 + 1.0;
    float _1657 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1659 = float(_1543);
    float _1661 = _1625 * _1655;
    float _1663 = fma(_1393, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1657);
    float _1665 = -_1625;
    float _1667 = _1665 + 1.0;
    float _1669 = _1571 * _1661;
    float _1671 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1673 = _1397 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1675 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1677 = fma(_1667, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1669);
    float _1679 = _1645 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1681 = _1347 + (-0.5);
    float _1683 = fma(_1673, -2.0, _1675);
    float _1685 = fma(_1585, _1651, _1677);
    float _1687 = _1601 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1689 = _1567 + 0.5;
    float _1691 = -_165;
    int _1693 = _1299 ? as_type<int>(_1691) : as_type<int>(_165);
    float _1695 = -_125;
    float _1697 = fma(_1695, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1649);
    float _1699 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1701 = !_1275;
    float _1703 = _1701 ? _165 : as_type<float>(_1693);
    float _1705 = -_1679;
    float _1707 = -_1533;
    float _1709 = fma(_1705, _1681, _1707);
    float _1711 = fma(_1687, _1689, _1697);
    int _1713 = ~_1569;
    int _1715 = _1713 + 1;
    int _1717 = _1715 + 1;
    float _1719 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1721 = _1717;
    float _1723 = _1545;
    if (!_1573)
    {
        int _1725 = ~_1569;
        int _1727 = _1725 + 1;
        _1721 = _1727;
    }
    int _1729 = _1721;
    float _1731 = _1671 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1733 = _1703 + (-0.5);
    float _1735 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1683);
    float _1737 = fma(_1233, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1699);
    float _1739 = fma(_1235, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1719);
    bool _1741 = !_1355;
    int _1743 = _1741 ? 0 : 1;
    float _1745 = -_1731;
    float _1747 = -_1735;
    float _1749 = fma(_1745, _1733, _1747);
    float _1751 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1737);
    bool _1753 = !_1359;
    int _1755 = _1753 ? 0 : 1;
    float _1757 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1663);
    float _1759 = -_1751;
    float _1761 = _1759 + 1.0;
    int _1763 = abs(_1743);
    float _1765 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1739);
    int _1767 = abs(_1755);
    float _1769 = -_1757;
    float _1771 = _1769 + 1.0;
    float _1773 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1775 = 1.0 + _1773;
    float _1777 = -_1765;
    float _1779 = _1777 + 1.0;
    float _1781 = -_1771;
    float _1783 = fma(_1567, _1781, _1711);
    float _1785 = float(_1763);
    float _1787 = 1.0 / _1775;
    float _1789 = -_1761;
    float _1791 = fma(_1335, _1789, _1613);
    float _1793 = fma(_1347, _1779, _1709);
    float _1795 = in.m_64.x;
    float _1797 = in.m_64.y;
    float _1799 = in.m_64.z;
    float _1801 = _1785 * _1609;
    float _1803 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1805 = _1457 + _1803;
    float _1807 = fma(_1579, _1639, _1685);
    float _1809 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1811 = _1395 + _1809;
    float _1813 = _1801 * (-2.0);
    float _1815 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1581);
    float _1817 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1819 = _1583 + _1817;
    float _1821 = fma(_1597, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1807);
    float _1823 = fma(_1547, _1813, _1547);
    float _1825 = -_1815;
    float _1827 = _1825 + 1.0;
    float _1829 = _1819 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1831 = _1819 * _1819;
    bool _1833 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1835 = isnan(0.0);
    bool _1837 = _1833 || _1835;
    bool _1839 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1841 = _1837 || _1839;
    float _1843 = fma(_1703, _1827, _1749);
    float _1845 = fma(_1805, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1829);
    float _1847 = fma(_1805, _1805, _1831);
    float _1849 = _1841 ? _1389 : 0.0;
    float _1851 = fma(_1811, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1845);
    float _1853 = float(_1767);
    out.m_66.x = _1791;
    out.m_66.y = _1793;
    out.m_66.z = _1783;
    out.m_66.w = _1843;
    bool _1855 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1857 = isnan(1.0);
    bool _1859 = _1855 || _1857;
    bool _1861 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1863 = _1859 || _1861;
    bool _1865 = _1851 >= 0.0;
    float _1867 = _1853 * _1659;
    float _1869 = _1867 * (-2.0);
    float _1871 = fma(_1813, _1795, _1795);
    float _1873 = _1235 + (-0.5);
    float _1875 = _1233 + (-0.5);
    float _1877 = fma(_1545, _1869, _1545);
    float _1879 = fma(_1869, _1797, _1797);
    float _1881 = _1199 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1883 = fma(_1811, _1811, _1847);
    float _1885 = _1255 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1887 = _1799;
    if (_1865)
    {
        _1723 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1889 = _1723;
    float _1891 = _1201 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1893 = rsqrt(_1883);
    bool _1895 = !_1363;
    int _1897 = _1895 ? 0 : 1;
    int _1899 = as_type<int>(_1889);
    if (_1863)
    {
        float _1901 = _1849 * _1787;
        _127 = _1901;
    }
    float _1903 = _127;
    float _1905 = fma(_1875, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1871);
    float _1907 = _1881 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1909 = _1891 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1911 = _1821 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _1913 = abs(_1897);
    if (_1865)
    {
        float _1915 = _1889 * 5.0;
        _1899 = as_type<int>(_1915);
    }
    int _1917 = _1899;
    float _1919 = fma(_1823, _1903, _1905);
    if (_1865)
    {
        out.m_45.x = 0.0;
    }
    float _1921 = fma(_1873, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1879);
    out.m_68.x = _1885;
    out.m_68.y = _1907;
    out.m_68.z = _1909;
    out.m_68.w = _1911;
    float _1923 = _1819 * _1893;
    float _1925 = float(_1913);
    float _1927 = _1805 * _1893;
    float _1929 = _1923;
    if (_1865)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5802 = as_type<float>(_1917);
        out.gl_Position.z = _5802;
    }
    float _1931 = _1811 * _1893;
    float _1933 = -_1923;
    float _1935 = fma(_1933, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1819);
    if (_1865)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1937 = -_1923;
    float _1939 = fma(_1937, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1583);
    float _1941 = -_1927;
    float _1943 = fma(_1941, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1457);
    float _1945 = float(_1729);
    float _1947 = -_1931;
    float _1949 = fma(_1947, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1395);
    float _1951 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1953 = _1939 + _1951;
    float _1955 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1957 = _1943 + _1955;
    float _1959 = _1237 + _1233;
    float _1961 = _1925 * _1945;
    float _1963 = _1953 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1965 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1967 = _1949 + _1965;
    float _1969 = _1959 + (-1.0);
    float _1971 = fma(_1957, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1963);
    float _1973 = _1961 * (-2.0);
    float _1975 = -_1927;
    float _1977 = fma(_1975, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1805);
    float _1979 = fma(_1969, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1981 = fma(_1967, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1971);
    float _1983 = _1935 * _1935;
    float _1985 = _1237 + (-0.5);
    float _1987 = fma(_1973, _1799, _1799);
    float _1989 = -_1931;
    float _1991 = fma(_1989, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1811);
    bool _1993 = _1981 >= 0.0;
    float _1995 = fma(_1977, _1977, _1983);
    float _1997 = fma(_1979, _1973, _1979);
    float _1999 = fma(_1985, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1987);
    float _2001 = fma(_1877, _1903, _1921);
    float _2003 = fma(_1991, _1991, _1995);
    float _2005 = _1919 * 0.15915493667125701904296875;
    float _2007 = fma(_1997, _1903, _1999);
    float _2009 = _2001 * 0.15915493667125701904296875;
    float _2011 = sqrt(_2003);
    float _2013 = _2007 * 0.15915493667125701904296875;
    int _2015 = as_type<int>(_1999);
    float _2017 = _1953;
    float _2019 = _1967;
    if (_1993)
    {
        _1887 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2021 = _1887;
    if (_1993)
    {
        out.m_45.x = 0.0;
    }
    float _2023 = _2005 * 6.283185482025146484375;
    float _2025 = sin(_2023);
    if (_1993)
    {
        float _2027 = _2021 * 5.0;
        _2015 = as_type<int>(_2027);
    }
    int _2029 = _2015;
    if (_1993)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5981 = as_type<float>(_2029);
        out.gl_Position.z = _5981;
    }
    float _2031 = _2005 * 6.283185482025146484375;
    float _2033 = cos(_2031);
    float _2035 = _1893 * _2011;
    float _2037 = _2009 * 6.283185482025146484375;
    float _2039 = sin(_2037);
    float _2041 = _2009 * 6.283185482025146484375;
    float _2043 = cos(_2041);
    float _2045 = _2013 * 6.283185482025146484375;
    float _2047 = sin(_2045);
    if (_1993)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2049 = _2013 * 6.283185482025146484375;
    float _2051 = cos(_2049);
    float _2053 = _489 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2055 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _165);
    float _2057 = _519 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2059 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _161);
    float _2061 = _2035 * _2053;
    float _2063 = _2025 * _2039;
    float _2065 = _2035 * _2057;
    float _2067 = _2033 * _2043;
    float _2069 = _2055 * _2061;
    float _2071 = _2059 * _2065;
    float _2073 = fma(_2047, _2067, _2063);
    float _2075 = _2033 * _2039;
    float _2077 = _2025 * _2043;
    float _2079 = fma(_2047, _2063, _2067);
    float _2081 = _2051 * _2069;
    float _2083 = _2039 * _2051;
    float _2085 = _2043 * _2051;
    float _2087 = -_2069;
    float _2089 = _2047 * _2087;
    float _2091 = _2033 * _2081;
    float _2093 = _2035 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2095 = _2093 * 0.5;
    float _2097 = -_2077;
    float _2099 = fma(_2047, _2075, _2097);
    float _2101 = -_2075;
    float _2103 = fma(_2047, _2077, _2101);
    float _2105 = fma(_2073, _2071, _2091);
    float _2107 = _2025 * _2081;
    float _2109 = fma(_2085, _2071, _2089);
    bool _2111 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2113 = isnan(0.5);
    bool _2115 = _2111 || _2113;
    bool _2117 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2119 = _2115 || _2117;
    float _2121 = fma(_2099, _2095, _2105);
    float _2123 = fma(_2103, _2071, _2107);
    float _2125 = fma(_2083, _2095, _2109);
    float _2127 = _2121 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2129 = fma(_2079, _2095, _2123);
    float _2131 = _2121 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2133 = _2121 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2135 = fma(_2125, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2127);
    float _2137 = fma(_2125, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2131);
    float _2139 = fma(_2125, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2133);
    float _2141 = fma(_2129, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2135);
    float _2143 = fma(_2129, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2137);
    float _2145 = fma(_2129, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2139);
    float _2147 = _2141 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2149 = _2143 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2151 = _1395 + _2147;
    float _2153 = _1457 + _2149;
    float _2155 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2157 = _2151 + _2155;
    float _2159 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2161 = _2153 + _2159;
    float _2163 = _2157 * _2157;
    float _2165 = fma(_2161, _2161, _2163);
    float _2167 = _2145 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2169 = sqrt(_2165);
    float _2171 = _1583 + _2167;
    bool _2173 = _2169 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2175 = _2167;
    float _2177 = _2145;
    float _2179 = _2095;
    if (!_2173)
    {
        _2175 = _2153;
    }
    float _2181 = _2175;
    float _2183 = _2181;
    if (!_2173)
    {
        _2177 = _2151;
    }
    float _2185 = _2177;
    float _2187 = _2185;
    if (!_2173)
    {
        _2179 = _2171;
    }
    float _2189 = _2179;
    bool _2191 = !_2173;
    float _2193 = _2189;
    if (!_2191)
    {
        float _2195 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2197 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2199 = _2169 + _2197;
        float _2201 = rsqrt(_2165);
        float _2203 = _2199 * _2195;
        float _2205 = _2171 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2207 = _2203 * 0.15915493667125701904296875;
        float _2209 = _2207 * 6.283185482025146484375;
        float _2211 = cos(_2209);
        float _2213 = _2207 * 6.283185482025146484375;
        float _2215 = sin(_2213);
        float _2217 = _2211 + (-1.0);
        float _2219 = _2217 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2221 = fma(_2215, _2205, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2223 = fma(_2171, _2211, _2219);
        float _2225 = _2201 * _2221;
        float _2227 = fma(_2161, _2225, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2229 = fma(_2157, _2225, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2183 = _2227;
        _2193 = _2223;
        _2187 = _2229;
    }
    float _2231 = _2183;
    float _2233 = _2193;
    float _2235 = _2187;
    float _2237 = -_1927;
    float _2239 = fma(_2237, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2231);
    float _2241 = -_1923;
    float _2243 = fma(_2241, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2233);
    float _2245 = -_1931;
    float _2247 = fma(_2245, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2235);
    float _2249 = _2243;
    float _2251 = _2239;
    float _2253 = _2247;
    if (!_2119)
    {
        float _2255 = _1953 * _1953;
        float _2257 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2259 = -_1457;
        float _2261 = _2259 + _2231;
        float _2263 = -_1583;
        float _2265 = _2263 + _2233;
        float _2267 = fma(_1957, _1957, _2255);
        float _2269 = fma(_1967, _1967, _2267);
        float _2271 = 1.0 / _2035;
        float _2273 = sqrt(_2269);
        float _2275 = precise::min(_2273, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2277 = _2275 * _2257;
        float _2279 = _2277 * _2271;
        float _2281 = -_1395;
        float _2283 = _2281 + _2235;
        float _2285 = fma(_2261, _2279, _1943);
        float _2287 = fma(_2265, _2279, _1939);
        float _2289 = fma(_2283, _2279, _1949);
        _2249 = _2287;
        _2251 = _2285;
        _2253 = _2289;
        _2017 = _2255;
    }
    float _2291 = _2249;
    float _2293 = _2251;
    float _2295 = _2253;
    float _2297 = _2017;
    float _2299 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2301 = _2291 + _2299;
    float _2303 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2305 = _2293 + _2303;
    float _2307 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2309 = _2295 + _2307;
    float _2311 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2313 = _2301 * _2301;
    float _2315 = fma(_2305, _2305, _2313);
    float _2317 = fma(_2309, _2309, _2315);
    float _2319 = rsqrt(_2317);
    float _2321 = sqrt(_2317);
    float _2323 = _2319 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2325 = _2305 * _2323;
    float _2327 = _2309 * _2323;
    float _2329 = _2325 * _2325;
    float _2331 = _2327 * _2327;
    float _2333 = _2329 + _2331;
    float _2335 = sqrt(_2333);
    bool _2337 = _2335 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2339 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2341 = _2335 + _2339;
    float _2343 = _2309;
    float _2345 = _2315;
    float _2347 = _2341;
    float _2349 = _2301;
    if (_2337)
    {
        float _2351 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2343 = _2351;
    }
    float _2353 = _2343;
    if (_2337)
    {
        float _2355 = rsqrt(_2333);
        _2345 = _2355;
    }
    float _2357 = _2345;
    float _2359 = _2357;
    if (_2337)
    {
        float _2361 = _2341 * _2353;
        _2347 = _2361;
    }
    float _2363 = _2347;
    if (_2337)
    {
        float _2365 = _2363 * 0.15915493667125701904296875;
        _2019 = _2365;
    }
    float _2367 = _2019;
    float _2369 = _2319;
    if (_2337)
    {
        float _2371 = _2367 * 6.283185482025146484375;
        float _2373 = sin(_2371);
        _2369 = _2373;
    }
    float _2375 = _2369;
    float _2377 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2379 = precise::max(0.0, _2377);
    float _2381 = _2297;
    float _2383 = _2379;
    float _2385 = _2377;
    if (_2337)
    {
        float _2387 = _2367 * 6.283185482025146484375;
        float _2389 = cos(_2387);
        _2381 = _2389;
    }
    float _2391 = _2381;
    float _2393 = -_2323;
    float _2395 = -_2379;
    float _2397 = fma(_2301, _2393, _2395);
    if (!_2337)
    {
        _2383 = _2327;
    }
    float _2399 = _2383;
    float _2401 = _2399;
    if (_2337)
    {
        float _2403 = _2397 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2385 = _2403;
    }
    float _2405 = _2385;
    float _2407 = _2375;
    float _2409 = _2405;
    if (_2337)
    {
        float _2411 = fma(_2375, _2405, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2407 = _2411;
    }
    float _2413 = _2407;
    float _2415 = _2413;
    if (_2337)
    {
        float _2417 = _2391 + (-1.0);
        _2409 = _2417;
    }
    float _2419 = _2409;
    float _2421 = _2419;
    if (_2337)
    {
        float _2423 = _2357 * _2413;
        _1929 = _2423;
    }
    float _2425 = _1929;
    if (!_2337)
    {
        _2359 = _2325;
    }
    float _2427 = _2359;
    float _2429 = _2427;
    if (_2337)
    {
        float _2431 = _2419 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2349 = _2431;
    }
    float _2433 = _2349;
    float _2435 = _2433;
    if (_2337)
    {
        float _2437 = _2325 * _2425;
        _2429 = _2437;
    }
    float _2439 = _2429;
    if (!_2337)
    {
        _2415 = _2397;
    }
    float _2441 = _2415;
    float _2443 = _2441;
    if (_2337)
    {
        float _2445 = _2327 * _2425;
        _2401 = _2445;
    }
    float _2447 = _2401;
    if (!_2337)
    {
        _2421 = _2329;
    }
    float _2449 = _2421;
    float _2451 = _2449;
    if (_2337)
    {
        float _2453 = fma(_2397, _2391, _2433);
        _2443 = _2453;
    }
    float _2455 = _2443;
    if (_2337)
    {
        float _2457 = _2439 * _2439;
        _2451 = _2457;
    }
    float _2459 = _2451;
    if (!_2337)
    {
        _2435 = _2331;
    }
    float _2461 = _2435;
    float _2463 = _2461;
    if (_2337)
    {
        float _2465 = _2447 * _2447;
        _2463 = _2465;
    }
    float _2467 = _2463;
    float _2469 = fma(_2455, _2455, _2459);
    float _2471 = _2291 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2473 = _2469 + _2467;
    float _2475 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2477 = fma(_2321, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2475);
    float _2479 = precise::clamp(_2477, 0.0, 1.0);
    float _2481 = _2291 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2483 = fma(_2293, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2471);
    float _2485 = rsqrt(_2473);
    float _2487 = -_2479;
    float _2489 = _2487 + 1.0;
    float _2491 = _2291 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2493 = fma(_2293, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2481);
    float _2495 = _2291 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2497 = fma(_2295, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2483);
    float _2499 = fma(_2293, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2491);
    float _2501 = fma(_2295, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2493);
    float _2503 = abs(_2489);
    float _2505 = log2(_2503);
    float _2507 = fma(_2293, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2495);
    float _2509 = fma(_2295, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2499);
    float _2511 = _2501 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2513 = _2497 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2515 = fma(_2295, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2507);
    float _2517 = _2509 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2519 = _2511 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2521 = _2485 * _2439;
    float _2523 = _2485 * _2455;
    float _2525 = _2513 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2527 = fma(_2517, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2519);
    float _2529 = _2521 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2531 = _2485 * _2447;
    float _2533 = _2515 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2535 = fma(_2513, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2527);
    float _2537 = _2505 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2539 = -_2529;
    float _2541 = fma(_2523, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2539);
    float _2543 = -_2525;
    float _2545 = fma(_2543, _2311, 1.0);
    float _2547 = fma(_2533, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2535);
    float _2549 = _2511 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2551 = -_2531;
    float _2553 = fma(_2551, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2541);
    float _2555 = exp2(_2537);
    float _2557 = _2511 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2559 = fma(_2517, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2549);
    float _2561 = fma(_2553, -0.5, 0.5);
    float _2563 = fma(_2553, 0.5, 0.5);
    float _2565 = fma(_2517, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2557);
    float _2567 = _2523 + 1.0;
    float _2569 = fma(_2513, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2559);
    float _2571 = log2(_2545);
    float _2573 = fma(_2513, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2565);
    float _2575 = fma(_2563, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2577 = fma(_2533, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2573);
    float _2579 = fma(_2563, _2575, -0.212114393711090087890625);
    float _2581 = 1.0 / _2547;
    float _2583 = -_2523;
    float _2585 = fma(_2555, _2567, _2583);
    float _2587 = fma(_2533, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2569);
    float _2589 = fma(_2563, _2579, 1.570728778839111328125);
    float _2591 = fma(_2585, 0.5, 0.5);
    float _2593 = sqrt(_2561);
    float _2595 = _2571 * 0.693147182464599609375;
    float _2597 = _2595 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2599 = _2587 * _2581;
    float _2601 = _2577 * _2581;
    float _2603 = fma(_2599, 0.5, 0.5);
    float _2605 = fma(_2601, -0.5, 0.5);
    float _2607 = _2593 * 0.636619746685028076171875;
    float _2609 = -_2589;
    float _2611 = fma(_2607, _2609, 1.0);
    float3 _6934 = float3(_2603, _2605, _2597);
    float _2613 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6934, float3(0.0), isnan(_6934)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6934, float3(0.0), isnan(_6934)), level(0.0)).x;
    float3 _6945 = float3(_2603, _2605, _2597);
    float4 _2616 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6945, float3(0.0), isnan(_6945)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6945, float3(0.0), isnan(_6945)), level(0.0)).xyzw;
    float _2618 = _2616.x;
    float _2620 = _2616.y;
    float _2622 = _2616.z;
    float _2624 = _2616.w;
    float2 _6962 = float2(_2611, _2591);
    float3 _2628 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6962, float2(0.0), isnan(_6962)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6962, float2(0.0), isnan(_6962)), level(0.0)).xyz;
    float _2630 = _2628.x;
    float _2632 = _2628.y;
    float _2634 = _2628.z;
    float _2636 = _1939 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2638 = _1939 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _2640 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2642 = isnan(0.5);
    bool _2644 = _2640 || _2642;
    bool _2646 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2648 = _2644 || _2646;
    float _2650 = _2511 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2652 = fma(_1943, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2636);
    float _2654 = fma(_1943, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2638);
    float _2656 = fma(_2517, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2650);
    float _2658 = fma(_1949, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2652);
    float _2660 = fma(_1949, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2654);
    float _2662 = _2658 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2664 = _2660 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2666 = 1.0 / _2662;
    float _2668 = _2664 + _2662;
    float _2670 = _2597;
    float _2672 = _2658;
    float _2674 = _2662;
    if (!_2648)
    {
        _1537 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _2676 = _1537;
    if (!_2648)
    {
        float _2678 = -_2676;
        float _2680 = _2678 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _2670 = _2680;
    }
    float _2682 = _2670;
    float _2684 = _2682;
    if (!_2648)
    {
        float _2686 = 1.0 / _2682;
        _2684 = _2686;
    }
    float _2688 = _2684;
    float _2690 = _2668 * _2666;
    float _2692 = _2690 * 0.5;
    float _2694 = _2666;
    float _2696 = _2692;
    if (_2648)
    {
        _2694 = 1.0;
    }
    float _2698 = _2694;
    float _2700 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2702 = fma(_2692, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2700);
    float _2704 = _2698;
    if (!_2648)
    {
        _2696 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2706 = _2696;
    float _2708 = 1.0 / _2702;
    float _2710 = _2706;
    if (!_2648)
    {
        float _2712 = -_2706;
        float _2714 = _2712 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2672 = _2714;
    }
    float _2716 = _2672;
    float _2718 = _2716;
    if (!_2648)
    {
        float _2720 = 1.0 / _2716;
        _2718 = _2720;
    }
    float _2722 = _2718;
    if (!_2648)
    {
        float _2724 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2726 = -_2676;
        float _2728 = fma(_2708, _2724, _2726);
        _2674 = _2728;
    }
    float _2730 = _2674;
    float _2732 = _2505 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2734 = _2730;
    if (!_2648)
    {
        float _2736 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2738 = -_2706;
        float _2740 = fma(_2708, _2736, _2738);
        _169 = _2740;
    }
    float _2742 = _169;
    if (_2648)
    {
        _2710 = 1.0;
    }
    float _2744 = _2710;
    float _2746 = _2744;
    if (!_2648)
    {
        float _2748 = _2730 * _2688;
        float _2750 = precise::clamp(_2748, 0.0, 1.0);
        _2734 = _2750;
    }
    float _2752 = _2734;
    float _2754 = fma(_2513, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2656);
    float _2756 = exp2(_2732);
    if (!_2648)
    {
        float _2758 = _2742 * _2722;
        float _2760 = precise::clamp(_2758, 0.0, 1.0);
        _2746 = _2760;
    }
    float _2762 = _2746;
    if (!_2648)
    {
        float _2764 = -_2752;
        float _2766 = _2764 + 1.0;
        _2704 = _2766;
    }
    float _2768 = _2704;
    float _2770 = fma(_2533, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2754);
    float _2772 = _2762 * _2768;
    bool _2774 = _2762 > 0.0;
    bool _2776 = isnan(_2762);
    bool _2778 = _2774 || _2776;
    bool _2780 = isnan(0.0);
    bool _2782 = _2778 || _2780;
    float _2784 = _2772 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2786 = _2768 <= 0.0;
    bool _2788 = !_2782;
    bool _2790 = _2786 || _2788;
    out.gl_Position.x = _2587;
    out.gl_Position.y = _2577;
    out.gl_Position.z = _2770;
    out.gl_Position.w = _2547;
    float _2792 = _2784 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2794 = _2770 + _2547;
    float _2796 = -_2756;
    float _2798 = _2796 + 1.0;
    float _2800 = _2794 * 0.5;
    float _2802 = _2798 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_45.x = _2792;
    float _2804 = -_2802;
    float _2806 = _2804 + 1.0;
    out.m_70.z = _2800;
    out.m_70.w = _2547;
    float _2808 = _2802 * _2613;
    float _2810 = _2624 * _2806;
    float _2812 = _2624 * _2808;
    float _2814 = _2634 * _2808;
    float _2816 = fma(_2630, _2812, _2618);
    float _2818 = fma(_2632, _2812, _2620);
    float _2820 = fma(_2624, _2814, _2622);
    out.m_72.x = _2816;
    out.m_72.y = _2818;
    out.m_72.z = _2820;
    out.m_72.w = _2810;
    if (!_2790)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2822 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_45.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2822;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

