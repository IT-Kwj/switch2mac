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
    constant _16* vp_c9 [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
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
    float4 m_58 [[user(locn1)]];
    float4 m_60 [[user(locn2)]];
    float4 m_70 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_62 [[user(locn5)]];
    float4 m_64 [[user(locn6)]];
    float4 m_68 [[user(locn7)]];
    float4 m_72 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_66 [[attribute(1)]];
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_54 [[attribute(4)]];
    float4 m_52 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _887 = false;
    bool _763 = false;
    bool _621 = false;
    bool _511 = false;
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
        float _3680 = as_type<float>(_107);
        out.gl_Position.z = _3680;
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
        float _3750 = as_type<float>(_145);
        out.gl_Position.z = _3750;
    }
    if (_137)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _147 = as_type<float>(int(gl_VertexIndex));
    float _149 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _151 = in.m_52.w;
    bool _153 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _155 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _157 = _153 || _155;
    bool _159 = isnan(1.0);
    bool _161 = _157 || _159;
    float _163 = in.m_47.x;
    float _165 = in.m_47.y;
    float _167 = in.m_47.z;
    float _169 = in.m_42.x;
    float _171 = in.m_42.y;
    float _173 = in.m_42.z;
    int _175 = as_type<int>(_147) & 1;
    bool _177 = _175 != 0;
    int _179 = as_type<int>(_147) & 2;
    bool _181 = _179 != 0;
    int _183 = int(_177);
    int _185 = _181 ? 2 : 0;
    int _187 = _183 | _185;
    int _189 = _161 ? 4 : 0;
    int _191 = _187 | _189;
    int _193 = false ? 8 : 0;
    int _195 = _191 | _193;
    int _197 = false ? 16 : 0;
    int _199 = _195 | _197;
    int _201 = false ? 32 : 0;
    int _203 = _199 | _201;
    int _205 = false ? 64 : 0;
    int _207 = _203 | _205;
    int _209 = _207 & 4;
    float _211 = as_type<float>(_209);
    float _213 = _149;
    if (!_161)
    {
        float _215 = _149 * _149;
        float _217 = _215 * 0.5;
        _211 = _217;
    }
    float _219 = _211;
    bool _221 = !_177;
    float _223 = _221 ? (-0.5) : 0.5;
    bool _225 = !_181;
    float _227 = _225 ? (-0.5) : 0.5;
    float _229 = _219;
    if (!_161)
    {
        float _231 = _219 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _229 = _231;
    }
    float _233 = _229;
    bool _235 = !_161;
    float _237 = _233;
    float _239 = 0.0;
    if (!_235)
    {
        float _241 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _243 = log2(_241);
        float _245 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _247 = _245 + 1.0;
        float _249 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _251 = _149 * _243;
        float _253 = exp2(_251);
        float _255 = _249 * 0.693147182464599609375;
        float _257 = 1.0 / _255;
        float _259 = 1.0 / _247;
        float _261 = _253 + (-1.0);
        float _263 = -_261;
        float _265 = fma(_263, _257, _149);
        float _267 = _265 * _259;
        float _269 = _267 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _237 = _269;
        _239 = _247;
    }
    float _271 = _237;
    float _273 = _239;
    float _275 = _271 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _277 = !_161;
    float _279 = _273;
    float _281 = _271;
    if (!_277)
    {
        float _283 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _285 = log2(_283);
        float _287 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _289 = _287 + 1.0;
        float _291 = 1.0 / _289;
        float _293 = _149 * _285;
        float _295 = exp2(_293);
        float _297 = -_295;
        float _299 = _297 + 1.0;
        float _301 = _299 * _291;
        _279 = _291;
        _213 = _301;
    }
    float _303 = _279;
    float _305 = _213;
    float _307 = _275 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _309 = _275 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _311 = _271 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _313 = _275 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _315 = _303;
    if (!_161)
    {
        float _317 = _125 * _125;
        float _319 = _317 * 0.5;
        _315 = _319;
    }
    float _321 = _315;
    float _323 = fma(_311, (*spvDescriptorSet0.vp_c10)._m0[8].x, _307);
    float _325 = fma(_311, (*spvDescriptorSet0.vp_c10)._m0[8].y, _309);
    float _327 = fma(_311, (*spvDescriptorSet0.vp_c10)._m0[8].z, _313);
    float _329 = _271 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_161)
    {
        float _331 = _321 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _281 = _331;
    }
    float _333 = _281;
    bool _335 = !_161;
    float _337 = _333;
    if (!_335)
    {
        float _339 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _341 = log2(_339);
        float _343 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _345 = _343 + 1.0;
        float _347 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _349 = _125 * _341;
        float _351 = exp2(_349);
        float _353 = _347 * 0.693147182464599609375;
        float _355 = 1.0 / _353;
        float _357 = 1.0 / _345;
        float _359 = _351 + (-1.0);
        float _361 = -_359;
        float _363 = fma(_361, _355, _125);
        float _365 = _363 * _357;
        float _367 = _365 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _337 = _367;
    }
    float _369 = _337;
    float _371 = _369 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _373 = fma(_329, (*spvDescriptorSet0.vp_c10)._m0[10].x, _323);
    float _375 = fma(_329, (*spvDescriptorSet0.vp_c10)._m0[10].y, _325);
    float _377 = _369 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _379 = _371 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _381 = _371 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _383 = _371 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _385 = fma(_329, (*spvDescriptorSet0.vp_c10)._m0[10].z, _327);
    float _387 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[8].x, _379);
    float _389 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[8].y, _381);
    float _391 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[8].z, _383);
    float _393 = _369 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _395 = fma(_305, _163, _373);
    float _397 = fma(_305, _165, _375);
    float _399 = fma(_305, _167, _385);
    float _401 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[10].x, _387);
    float _403 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[10].y, _389);
    float _405 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[10].z, _391);
    float _407 = _393;
    if (!_161)
    {
        _407 = _125;
    }
    float _409 = _407;
    bool _411 = !_161;
    float _413 = _409;
    if (!_411)
    {
        float _415 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _417 = log2(_415);
        float _419 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _421 = _419 + 1.0;
        float _423 = 1.0 / _421;
        float _425 = _125 * _417;
        float _427 = exp2(_425);
        float _429 = -_427;
        float _431 = _429 + 1.0;
        float _433 = _431 * _423;
        _413 = _433;
    }
    float _435 = _413;
    float _437 = fma(_435, _165, _403);
    bool _439 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _441 = fma(_397, _151, _171);
    float _443 = fma(_435, _163, _401);
    float _445 = -_437;
    float _447 = _397 + _445;
    float _449 = fma(_435, _167, _405);
    float _451 = fma(_395, _151, _169);
    float _453 = -_443;
    float _455 = _395 + _453;
    float _457 = _447 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _459 = _447 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _461 = _447 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _463 = -_449;
    float _465 = _399 + _463;
    float _467 = fma(_455, (*spvDescriptorSet0.vp_c10)._m0[4].x, _457);
    float _469 = fma(_455, (*spvDescriptorSet0.vp_c10)._m0[5].x, _459);
    float _471 = fma(_455, (*spvDescriptorSet0.vp_c10)._m0[6].x, _461);
    float _473 = fma(_399, _151, _173);
    float _475 = fma(_465, (*spvDescriptorSet0.vp_c10)._m0[4].z, _467);
    float _477 = fma(_465, (*spvDescriptorSet0.vp_c10)._m0[5].z, _469);
    float _479 = fma(_465, (*spvDescriptorSet0.vp_c10)._m0[6].z, _471);
    bool _481 = !_439;
    float _483 = _477;
    float _485 = _475;
    float _487 = _479;
    float _489 = _449;
    float _491 = _449;
    float _509;
    if (!_481)
    {
        float _493 = in.m_54.x;
        float _495 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _497 = _493 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _499 = fma(_497, (*spvDescriptorSet0.vp_c9)._m0[12].x, _125);
        float _501 = _499 * _495;
        float _503 = floor(_501);
        float _505 = -_503;
        float _507 = _501 + _505;
        _509 = _507;
        _511 = true;
    }
    else
    {
        float _513 = float(_91);
        float _515 = 1.0 / _513;
        float _517 = _125 * _515;
        _509 = _517;
    }
    _511 = false;
    float _519 = _509;
    float _521 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _523 = _519 + _521;
    float _525 = in.m_52.x;
    float _527 = in.m_52.y;
    bool _529 = _519 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _531 = isnan(_519);
    bool _533 = _529 || _531;
    bool _535 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _537 = _533 || _535;
    float _539 = float(_537);
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _543 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _541;
    bool _545 = _519 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _547 = isnan(_519);
    bool _549 = _545 || _547;
    bool _551 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _553 = _549 || _551;
    float _555 = float(_553);
    float _557 = -_539;
    float _559 = _557 + 1.0;
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _563 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _561;
    float _565 = 1.0 / _543;
    bool _567 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _569 = _555 * _559;
    float _571 = -_555;
    float _573 = _571 + 1.0;
    float _575 = _523 * _565;
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _579 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _577;
    float _581 = fma(_563, _575, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _583 = fma(_579, _575, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _585 = _581 * _569;
    float _587 = _583 * _569;
    float _589 = fma(_573, (*spvDescriptorSet0.vp_c9)._m0[143].x, _585);
    float _591 = fma(_573, (*spvDescriptorSet0.vp_c9)._m0[143].y, _587);
    float _593 = fma(_539, (*spvDescriptorSet0.vp_c9)._m0[144].x, _589);
    float _595 = fma(_539, (*spvDescriptorSet0.vp_c9)._m0[144].y, _591);
    float _597 = _593 * _525;
    float _599 = _595 * _527;
    bool _601 = !_567;
    float _619;
    if (!_601)
    {
        float _603 = in.m_54.x;
        float _605 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _607 = _603 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _609 = fma(_607, (*spvDescriptorSet0.vp_c9)._m0[11].y, _125);
        float _611 = _609 * _605;
        float _613 = floor(_611);
        float _615 = -_613;
        float _617 = _611 + _615;
        _619 = _617;
        _621 = true;
    }
    else
    {
        float _623 = float(_91);
        float _625 = 1.0 / _623;
        float _627 = _125 * _625;
        _619 = _627;
    }
    _621 = false;
    float _629 = _619;
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _633 = _629 + _631;
    float _635 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _637 = _635 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _639 = _629 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _641 = isnan(_629);
    bool _643 = _639 || _641;
    bool _645 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _647 = _643 || _645;
    float _649 = float(_647);
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _653 = _651 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _655 = _629 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _657 = isnan(_629);
    bool _659 = _655 || _657;
    bool _661 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _663 = _659 || _661;
    float _665 = float(_663);
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _669 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _667;
    bool _671 = _629 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _673 = isnan(_629);
    bool _675 = _671 || _673;
    bool _677 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _679 = _675 || _677;
    float _681 = float(_679);
    float _683 = 1.0 / _637;
    float _685 = -_649;
    float _687 = _685 + 1.0;
    bool _689 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _691 = _665 * _687;
    float _693 = -_665;
    float _695 = _693 + 1.0;
    float _697 = 1.0 / _653;
    float _699 = _669 * _683;
    float _701 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _703 = _701 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _705 = fma(_699, _633, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _707 = -_681;
    float _709 = _707 + 1.0;
    float _711 = _705 * _691;
    float _713 = _703 * _697;
    float _715 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _717 = _629 + _715;
    float _719 = _649 * _709;
    float _721 = fma(_695, (*spvDescriptorSet0.vp_c9)._m0[115].x, _711);
    float _723 = fma(_713, _717, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _725 = fma(_723, _719, _721);
    float _727 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _729 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _731 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _733 = fma(_681, (*spvDescriptorSet0.vp_c9)._m0[117].x, _725);
    float _735 = _729 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _737 = _727 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _739 = _731 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _741 = _733 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_56.x = _737;
    out.m_56.y = _735;
    out.m_56.z = _739;
    out.m_56.w = _741;
    bool _743 = !_689;
    float _761;
    if (!_743)
    {
        float _745 = in.m_54.x;
        float _747 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _749 = _745 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _751 = fma(_749, (*spvDescriptorSet0.vp_c9)._m0[11].z, _125);
        float _753 = _751 * _747;
        float _755 = floor(_753);
        float _757 = -_755;
        float _759 = _753 + _757;
        _761 = _759;
        _763 = true;
    }
    else
    {
        float _765 = float(_91);
        float _767 = 1.0 / _765;
        float _769 = _125 * _767;
        _761 = _769;
    }
    _763 = false;
    float _771 = _761;
    float _773 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _775 = _771 + _773;
    bool _777 = _771 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _779 = isnan(_771);
    bool _781 = _777 || _779;
    bool _783 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _785 = _781 || _783;
    float _787 = float(_785);
    float _789 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _791 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _789;
    bool _793 = _771 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _795 = isnan(_771);
    bool _797 = _793 || _795;
    bool _799 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _801 = _797 || _799;
    float _803 = float(_801);
    float _805 = -_787;
    float _807 = _805 + 1.0;
    float _809 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _811 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _809;
    float _813 = 1.0 / _791;
    bool _815 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _817 = _803 * _807;
    float _819 = -_803;
    float _821 = _819 + 1.0;
    float _823 = _775 * _813;
    float _825 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _827 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _825;
    float _829 = fma(_811, _823, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _831 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _833 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _831;
    float _835 = fma(_827, _823, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _837 = _829 * _817;
    float _839 = fma(_833, _823, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _841 = _835 * _817;
    float _843 = fma(_821, (*spvDescriptorSet0.vp_c9)._m0[123].x, _837);
    float _845 = _839 * _817;
    float _847 = fma(_821, (*spvDescriptorSet0.vp_c9)._m0[123].z, _841);
    float _849 = fma(_821, (*spvDescriptorSet0.vp_c9)._m0[123].y, _845);
    float _851 = fma(_787, (*spvDescriptorSet0.vp_c9)._m0[124].x, _843);
    float _853 = fma(_787, (*spvDescriptorSet0.vp_c9)._m0[124].z, _847);
    float _855 = fma(_787, (*spvDescriptorSet0.vp_c9)._m0[124].y, _849);
    bool _857 = !_815;
    float _881;
    float _883;
    float _885;
    if (!_857)
    {
        float _859 = in.m_54.x;
        float _861 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _863 = float(_91);
        float _865 = 1.0 / _863;
        float _867 = _859 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _869 = _125 * _865;
        float _871 = fma(_867, (*spvDescriptorSet0.vp_c9)._m0[11].w, _125);
        float _873 = _871 * _861;
        float _875 = floor(_873);
        float _877 = -_875;
        float _879 = _873 + _877;
        _881 = _869;
        _883 = _879;
        _885 = _863;
        _887 = true;
    }
    else
    {
        float _889 = float(_91);
        float _891 = 1.0 / _889;
        float _893 = _125 * _891;
        _881 = _893;
        _883 = _893;
        _885 = _889;
    }
    _887 = false;
    float _895 = _881;
    float _897 = _883;
    float _899 = _885;
    float _901 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _903 = int(_901);
    float _905 = in.m_54.x;
    float _907 = _441 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _909 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _911 = _909 != 0;
    float _913 = _441 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _915 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _917 = int(_915);
    bool _919 = !_911;
    float _921 = _919 ? 1.2345600128173828125 : 1.0;
    float _923 = fma(_451, (*spvDescriptorSet0.vp_c10)._m0[5].x, _907);
    float _925 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _927 = _895 + _925;
    float _929 = fma(_473, (*spvDescriptorSet0.vp_c10)._m0[5].z, _923);
    float _931 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _933 = log2(_931);
    float _935 = float(_903);
    float _937 = _817;
    float _939 = _935;
    float _941 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (!_911)
    {
        float _943 = in.m_54.y;
        _937 = _943;
    }
    float _945 = _937;
    float _947 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _949 = _947 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _951 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _953 = _951 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _955 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _957 = _955 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _959 = 1.0 / _935;
    float _961 = float(uint(_917));
    float _963 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _965 = _963 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _967 = float(_917);
    float _969 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _971 = _969 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    int _973 = ~_917;
    int _975 = _973 + 1;
    float _977 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _979 = _895 + _977;
    bool _981 = _917 == 0;
    float _983 = 1.0 / _961;
    float _985 = _855 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _987 = _851 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _989 = _897 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _991 = isnan(_897);
    bool _993 = _989 || _991;
    bool _995 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _997 = _993 || _995;
    float _999 = float(_997);
    float _1001 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _1003 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _1001;
    bool _1005 = _895 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1007 = isnan(_895);
    bool _1009 = _1005 || _1007;
    bool _1011 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _1013 = _1009 || _1011;
    float _1015 = float(_1013);
    float _1017 = _125 * _959;
    float _1019 = 1.0 / _949;
    if (!_911)
    {
        _939 = _945;
    }
    float _1021 = _939;
    float _1023 = -_1015;
    float _1025 = _1023 + 1.0;
    bool _1027 = _895 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1029 = isnan(_895);
    bool _1031 = _1027 || _1029;
    bool _1033 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1035 = _1031 || _1033;
    float _1037 = float(_1035);
    float _1039 = _1021;
    if (!_911)
    {
        _941 = _1021;
    }
    float _1041 = _941;
    float _1043 = trunc(_1017);
    int _1045 = int(_1043);
    int _1047 = as_type<int>(_983) + (-2);
    float _1049 = _1037 * _1025;
    int _1051 = ~_917;
    int _1053 = _1051 + 1;
    float _1055 = _1041;
    float _1057 = _945;
    if (_911)
    {
        float _1059 = in.m_54.x;
        float _1061 = in.m_54.y;
        _1055 = _1059;
        _1057 = _1061;
    }
    float _1063 = _1055;
    float _1065 = _1057;
    float _1067 = 0.0;
    if (_911)
    {
        _1067 = _905;
    }
    float _1069 = _1067;
    float _1071 = 1.0 / _953;
    float _1073 = float(uint(_1045));
    float _1075 = 1.0 / _957;
    float _1077 = as_type<float>(_1047) * _1073;
    float _1079 = trunc(_1077);
    float _1081 = precise::max(_1079, 0.0);
    uint _1084 = uint(_1081);
    float _1086 = _1065 * 2.0;
    float _1088 = _1069;
    if (_911)
    {
        _1039 = _1065;
    }
    float _1090 = _1039;
    float _1092 = 1.0 / _965;
    int _1094 = _1053 * int(_1084);
    int _1096 = _1094 + _1045;
    float _1098 = 1.0 / _971;
    float _1100 = float(uint(_1096));
    float _1102 = _1003 * _1092;
    float _1104 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1106 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1104;
    float _1108 = as_type<float>(_1047) * _1100;
    float _1110 = float(_1045);
    bool _1112 = _1110 >= _967;
    bool _1114 = isnan(_1110);
    bool _1116 = _1112 || _1114;
    bool _1118 = isnan(_967);
    bool _1120 = _1116 || _1118;
    float _1122 = float(_1120);
    float _1124 = trunc(_1108);
    float _1126 = precise::max(_1124, 0.0);
    uint _1128 = uint(_1126);
    bool _1130 = !_911;
    float _1132 = _1130 ? _1065 : _905;
    float _1134 = _1132 * _921;
    float _1136 = trunc(_1122);
    int _1138 = int(_1136);
    int _1140 = int(_1084) + int(_1128);
    float _1142 = floor(_1134);
    int _1144 = _975 * _1140;
    int _1146 = _1144 + _1045;
    int _1148 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1150 = _1148 != 0;
    float _1152 = 1.0 / _899;
    bool _1154 = uint(_1146) >= uint(_917);
    bool _1156 = !_1154;
    int _1158 = _1156 ? 0 : (-1);
    int _1160 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1162 = _1160 != 0;
    int _1164 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1166 = _1164 != 0;
    int _1168 = ~_1140;
    int _1170 = _1168 + _1158;
    int _1172 = _1170 + 1;
    float _1174 = -_1142;
    float _1176 = _1134 + _1174;
    int _1178 = ~_1138;
    int _1180 = _1178 + 1;
    int _1182 = _1180 + 1;
    bool _1184 = !_1166;
    int _1186 = _1184 ? 0 : 1;
    int _1188 = _917 * _1172;
    int _1190 = _1188 + _1045;
    float _1192 = _967 * _1176;
    float _1194 = _125 * _967;
    int _1196 = abs(_1186);
    bool _1198 = !_981;
    int _1200 = _1198 ? _1190 : (-1);
    float _1202 = _1194 * _1152;
    int _1204 = _917 + (-1);
    float _1206 = trunc(_1192);
    int _1208 = int(_1206);
    int _1210 = _1200 * _1182;
    bool _1212 = !_1150;
    int _1214 = _1212 ? 0 : 1;
    int _1216 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1218 = _1216 != 0;
    int _1220 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1222 = _1220 != 0;
    int _1224 = _1138 * _1204;
    int _1226 = _1224 + _1210;
    bool _1228 = !_1162;
    int _1230 = _1228 ? 0 : 1;
    float _1232 = trunc(_1202);
    int _1234 = int(_1232);
    int _1236 = abs(_1214);
    bool _1238 = !_1218;
    int _1240 = _1238 ? 0 : 1;
    int _1242 = abs(_1230);
    int _1244 = _1208 * _1236;
    int _1246 = _1244 + _1045;
    bool _1248 = !_1222;
    int _1250 = _1248 ? 0 : 1;
    int _1252 = abs(_1240);
    int _1254 = _1226 * _1196;
    int _1256 = abs(_1250);
    int _1258 = _1234 * _1242;
    int _1260 = _1258 + _1254;
    int _1262 = ~_917;
    int _1264 = _1262 + 1;
    int _1266 = _1246 * _1252;
    int _1268 = _1266 + _1260;
    int _1270 = _1208 * _1256;
    int _1272 = _1270 + _1268;
    int _1274 = ~_917;
    int _1276 = _1274 + 1;
    float _1278 = float(uint(_1272));
    float _1280 = as_type<float>(_1047) * _1278;
    float _1282 = trunc(_1280);
    float _1284 = precise::max(_1282, 0.0);
    uint _1286 = uint(_1284);
    int _1288 = _1276 * int(_1286);
    int _1290 = _1288 + _1272;
    float _1292 = float(uint(_1290));
    float _1294 = as_type<float>(_1047) * _1292;
    float _1296 = in.m_54.z;
    float _1298 = in.m_54.w;
    float _1300 = trunc(_1294);
    float _1302 = precise::max(_1300, 0.0);
    uint _1304 = uint(_1302);
    int _1306 = int(_1286) + int(_1304);
    bool _1308 = _1298 > 0.5;
    int _1310 = _1264 * _1306;
    int _1312 = _1310 + _1272;
    bool _1314 = _1296 > 0.5;
    float _1316 = -_227;
    int _1318 = _1308 ? as_type<int>(_1316) : as_type<int>(_227);
    bool _1320 = uint(_1312) >= uint(_917);
    bool _1322 = !_1320;
    int _1324 = _1322 ? 0 : (-1);
    if (!_911)
    {
        _1088 = _1296;
    }
    float _1326 = _1088;
    float _1328 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1330 = _1328 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    int _1332 = ~_1306;
    int _1334 = _1332 + _1324;
    int _1336 = _1334 + 1;
    int _1338 = _917 * _1336;
    int _1340 = _1338 + _1272;
    float _1342 = -_223;
    int _1344 = _1314 ? as_type<int>(_1342) : as_type<int>(_223);
    float _1346 = 1.0 / _1330;
    float _1348 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1350 = _1348 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1352 = !_981;
    int _1354 = _1352 ? _1340 : (-1);
    float _1356 = -_227;
    int _1358 = _1314 ? as_type<int>(_1356) : as_type<int>(_227);
    int _1360 = _1354 & 3;
    bool _1362 = _1360 != 0;
    float _1364 = 1.0 / _1350;
    int _1366 = _1354 & 3;
    bool _1368 = _1366 != 0;
    bool _1370 = uint(_1360) > 1u;
    int _1372 = _1368 ? 0 : 1;
    int _1374 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1376 = _1374 != 0;
    int _1378 = ~_1372;
    int _1380 = _1378 + 1;
    int _1382 = _1380 + 1;
    bool _1384 = !_1376;
    float _1386 = _1384 ? _227 : as_type<float>(_1318);
    bool _1388 = _1360 != 3;
    bool _1390 = uint(_1360) >= 2u;
    float _1392 = _1106 * _1364;
    int _1394 = _1382;
    if (!_1370)
    {
        int _1396 = ~_1372;
        int _1398 = _1396 + 1;
        _1394 = _1398;
    }
    int _1400 = _1394;
    int _1402 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1404 = _1402 != 0;
    int _1406 = _1390 ? 0 : 1;
    int _1408 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1410 = _1408 != 0;
    int _1412 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1414 = _1412 != 0;
    bool _1416 = !_1404;
    float _1418 = _1416 ? _223 : as_type<float>(_1344);
    int _1420 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1422 = _1420 != 0;
    bool _1424 = !_1414;
    float _1426 = _1424 ? _227 : as_type<float>(_1358);
    float _1428 = _905 * 2.0;
    int _1430 = ~_1406;
    int _1432 = _1430 + 1;
    int _1434 = _1432 + 1;
    int _1436 = _1434;
    if (_1388)
    {
        int _1438 = ~_1406;
        int _1440 = _1438 + 1;
        _1436 = _1440;
    }
    int _1442 = _1436;
    float _1444 = floor(_1428);
    bool _1446 = _1065 > 0.5;
    bool _1448 = !_1422;
    int _1450 = _1448 ? 0 : 1;
    bool _1452 = _905 > 0.5;
    float _1454 = -_223;
    int _1456 = _1446 ? as_type<int>(_1454) : as_type<int>(_223);
    float _1458 = -_227;
    int _1460 = _1446 ? as_type<int>(_1458) : as_type<int>(_227);
    int _1462 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1464 = _1462 != 0;
    float _1466 = -_223;
    int _1468 = _1452 ? as_type<int>(_1466) : as_type<int>(_223);
    int _1470 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1472 = _1470 != 0;
    float _1474 = _441 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _1476 = !_1464;
    float _1478 = _1476 ? _223 : as_type<float>(_1468);
    bool _1480 = _1444 >= 0.0;
    bool _1482 = isnan(_1444);
    bool _1484 = _1480 || _1482;
    bool _1486 = isnan(0.0);
    bool _1488 = _1484 || _1486;
    float _1490 = fma(_451, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1474);
    float _1492 = fma(_451, (*spvDescriptorSet0.vp_c10)._m0[6].x, _913);
    float _1494 = floor(_1086);
    int _1496 = _1488 ? 0 : 1;
    float _1498 = fma(_473, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1490);
    bool _1500 = _1444 > 0.0;
    float _1502 = fma(_473, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1492);
    float _1504 = _1296 * 2.0;
    int _1506 = ~_1496;
    int _1508 = _1506 + 1;
    int _1510 = _1508 + 1;
    float _1512 = _1478 + 0.5;
    float _1514 = _125 * _933;
    float _1516 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _1518 = _1516 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1520 = floor(_1504);
    float _1522 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1524 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1522;
    float _1526 = _1502 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1528 = _1510;
    if (!_1500)
    {
        int _1530 = ~_1496;
        int _1532 = _1530 + 1;
        _1528 = _1532;
    }
    int _1534 = _1528;
    float _1536 = _1518 * _1346;
    bool _1538 = _1494 >= 0.0;
    bool _1540 = isnan(_1494);
    bool _1542 = _1538 || _1540;
    bool _1544 = isnan(0.0);
    bool _1546 = _1542 || _1544;
    float _1548 = exp2(_1514);
    float _1550 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1552 = _1550 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1554 = _1524 * _1071;
    int _1556 = _1546 ? 0 : 1;
    float _1558 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1560 = _897 + _1558;
    bool _1562 = _1494 > 0.0;
    float _1564 = _1552 * _1019;
    int _1566 = ~_1556;
    int _1568 = _1566 + 1;
    int _1570 = _1568 + 1;
    float _1572 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1574 = _1572 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1576 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1578 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1576;
    float _1580 = fma(_1554, _1560, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1582 = _1574 * _1075;
    bool _1584 = _895 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1586 = isnan(_895);
    bool _1588 = _1584 || _1586;
    bool _1590 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1592 = _1588 || _1590;
    float _1594 = float(_1592);
    float _1596 = _1578 * _1098;
    float _1598 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1600 = _1598 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _1602 = -_1548;
    float _1604 = _1602 + 1.0;
    bool _1606 = _895 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1608 = isnan(_895);
    bool _1610 = _1606 || _1608;
    bool _1612 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1614 = _1610 || _1612;
    float _1616 = float(_1614);
    float _1618 = -_1594;
    float _1620 = _1618 + 1.0;
    int _1622 = _1570;
    if (!_1562)
    {
        int _1624 = ~_1556;
        int _1626 = _1624 + 1;
        _1622 = _1626;
    }
    int _1628 = _1622;
    float _1630 = 1.0 / _1600;
    bool _1632 = _1520 >= 0.0;
    bool _1634 = isnan(_1520);
    bool _1636 = _1632 || _1634;
    bool _1638 = isnan(0.0);
    bool _1640 = _1636 || _1638;
    float _1642 = _1616 * _1620;
    bool _1644 = _895 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1646 = isnan(_895);
    bool _1648 = _1644 || _1646;
    bool _1650 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1652 = _1648 || _1650;
    float _1654 = float(_1652);
    float _1656 = -_1616;
    float _1658 = _1656 + 1.0;
    int _1660 = _1640 ? 0 : 1;
    float _1662 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1664 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1662;
    bool _1666 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1668 = isnan(0.0);
    bool _1670 = _1666 || _1668;
    bool _1672 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1674 = _1670 || _1672;
    float _1676 = fma(_1596, _979, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _1678 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1680 = _895 + _1678;
    bool _1682 = _895 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1684 = isnan(_895);
    bool _1686 = _1682 || _1684;
    bool _1688 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1690 = _1686 || _1688;
    float _1692 = float(_1690);
    float _1694 = _1512 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1696 = _1674 ? _1604 : 0.0;
    float _1698 = fma(_1536, _1680, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    bool _1700 = _1520 > 0.0;
    float _1702 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1704 = _895 + _1702;
    float _1706 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1708 = _895 + _1706;
    float _1710 = -_1692;
    float _1712 = _1710 + 1.0;
    float _1714 = _1664 * _1630;
    float _1716 = fma(_1102, _1704, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _1718 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1720 = _895 + _1718;
    float _1722 = fma(_1564, _1708, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    bool _1724 = _895 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1726 = isnan(_895);
    bool _1728 = _1724 || _1726;
    bool _1730 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1732 = _1728 || _1730;
    float _1734 = float(_1732);
    float _1736 = _1716 * _1049;
    float _1738 = fma(_1392, _1720, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _1740 = _1654 * _1658;
    float _1742 = -_1654;
    float _1744 = _1742 + 1.0;
    bool _1746 = _897 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1748 = isnan(_897);
    bool _1750 = _1746 || _1748;
    bool _1752 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1754 = _1750 || _1752;
    float _1756 = float(_1754);
    bool _1758 = _895 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1760 = isnan(_895);
    bool _1762 = _1758 || _1760;
    bool _1764 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _1766 = _1762 || _1764;
    float _1768 = float(_1766);
    float _1770 = _1692 * _1744;
    float _1772 = _1734 * _1712;
    float _1774 = -_1734;
    float _1776 = _1774 + 1.0;
    float _1778 = -_1768;
    float _1780 = _1778 + 1.0;
    int _1782 = ~_917;
    int _1784 = _1782 + 1;
    float _1786 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1788 = 1.0 + _1786;
    float _1790 = _1768 * _1776;
    float _1792 = -_1756;
    float _1794 = _1792 + 1.0;
    float _1796 = _1015 * _1780;
    bool _1798 = !_1410;
    float _1800 = _1798 ? _223 : as_type<float>(_1456);
    float _1802 = 1.0 / _1788;
    float _1804 = _999 * _1794;
    float _1806 = fma(_1582, _927, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _1808 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1810 = _895 + _1808;
    float _1812 = -_1037;
    float _1814 = _1812 + 1.0;
    float _1816 = _1580 * _1804;
    float _1818 = fma(_1714, _1810, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _1820 = float(uint(_1246));
    float _1822 = fma(_1814, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1736);
    float _1824 = -_999;
    float _1826 = _1824 + 1.0;
    float _1828 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1830 = as_type<float>(_1047) * _1820;
    float _1832 = _1326 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1834 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1836 = _1696 * _1802;
    float _1838 = _1802;
    float _1840 = _1756;
    if (!_911)
    {
        float _1842 = in.m_54.z;
        _1838 = _1842;
    }
    float _1844 = _1838;
    float _1846 = trunc(_1830);
    float _1848 = precise::max(_1846, 0.0);
    uint _1850 = uint(_1848);
    int _1852 = ~_1660;
    int _1854 = _1852 + 1;
    int _1856 = _1854 + 1;
    float _1858 = fma(_1826, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1816);
    float _1860 = -_1828;
    float _1862 = fma(_1832, 2.0, _1860);
    int _1864 = _1856;
    if (!_1700)
    {
        int _1866 = ~_1660;
        int _1868 = _1866 + 1;
        _1864 = _1868;
    }
    int _1870 = _1864;
    float _1872 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _1874 = ~_917;
    int _1876 = _1874 + 1;
    float _1878 = fma(_1063, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1834);
    float _1880 = _1063 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1882 = fma(_1756, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1858);
    float _1884 = fma(_1698, _1796, _1822);
    float _1886 = -_1872;
    float _1888 = fma(_1880, 2.0, _1886);
    float _1890 = _1065 + _905;
    int _1892 = _1876 * int(_1850);
    int _1894 = _1892 + _1246;
    int _1896 = abs(_1400);
    float _1898 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1900 = _1890 + (-1.0);
    float _1902 = float(uint(_1894));
    float _1904 = fma(_1738, _1790, _1884);
    float _1906 = _1844;
    if (!_911)
    {
        _1840 = _1844;
    }
    float _1908 = _1840;
    float _1910 = fma(_1900, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1912 = _1908;
    if (_911)
    {
        _1906 = _1090;
    }
    float _1914 = _1906;
    float _1916 = as_type<float>(_1047) * _1902;
    float _1918 = _1498 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1920 = _853 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1922 = _1914;
    if (_911)
    {
        _1912 = _1090;
    }
    float _1924 = _1912;
    float _1926 = fma(_1914, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1898);
    float _1928 = _929 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1930 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1932 = _1918 + _1930;
    float _1934 = trunc(_1916);
    float _1936 = precise::max(_1934, 0.0);
    uint _1938 = uint(_1936);
    if (_911)
    {
        _1922 = _1090;
    }
    float _1940 = _1922;
    float _1942 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1944 = _1928 + _1942;
    float _1946 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1948 = _1526 + _1946;
    float _1950 = _985 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1952 = _987 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1954 = _1944 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1956 = _1920 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1958 = _1882 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1960 = fma(_1932, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1954);
    float _1962 = fma(_1722, _1772, _1904);
    float _1964 = _1924 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1966 = -_125;
    float _1968 = fma(_1966, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1888);
    float _1970 = fma(_1948, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1960);
    float _1972 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1974 = fma(_1676, _1770, _1962);
    int _1976 = _1354 >> 31;
    out.m_58.x = _1952;
    out.m_58.y = _1950;
    out.m_58.z = _1956;
    out.m_58.w = _1958;
    bool _1978 = _1970 >= 0.0;
    float _1980 = fma(_1964, -2.0, _1972);
    float _1982 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _1984 = _1976 & 3;
    float _1986 = fma(_1806, _1740, _1974);
    int _1988 = int(_1850) + int(_1938);
    float _1990 = _1418 + 0.5;
    float _1992 = _1940;
    if (!_911)
    {
        _1992 = _905;
    }
    float _1994 = _1992;
    float _1996 = _1386 + (-0.5);
    int _1998 = _1354 + _1984;
    int _2000 = _1784 * _1988;
    int _2002 = _2000 + _1246;
    float _2004 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2006 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1980);
    float _2008 = _1994 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _2010 = _1998 >> 2;
    float _2012 = fma(_1990, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1968);
    float _2014 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1878);
    float _2016 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    bool _2018 = !_1472;
    float _2020 = _2018 ? _227 : as_type<float>(_1460);
    float _2022 = -_125;
    float _2024 = fma(_2022, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1862);
    int _2026 = _2010 << 4;
    int _2028 = _2026 + 512;
    float _2030 = fma(_2008, -2.0, _2016);
    bool _2032 = uint(_2002) >= uint(_917);
    float _2034 = _1982 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _2036 = _1360 != 3;
    float _2038 = _1800 + 0.5;
    float _2040 = _2008;
    if (_1978)
    {
        _2040 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2042 = _2040;
    float _2044 = -_1996;
    float _2046 = -_2006;
    float _2048 = fma(_2044, (*spvDescriptorSet0.vp_c9)._m0[85].y, _2046);
    float _2050 = fma(_1818, _1642, _1986);
    int _2052 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2054 = _2052 != 0;
    int _2056 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2058 = _2056 != 0;
    int _2060 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2062 = _2060 != 0;
    uint _2064 = uint(int(uint(_2028) >> uint(2)));
    uint _2066 = uint(int(uint(int(_2064)) >> uint(2)));
    int _2068 = int(_2064) & 3;
    float _2070 = (*spvDescriptorSet0.vp_c9)._m0[int(_2066)][_2068];
    int _2072 = int(_2064) + 1;
    uint _2074 = uint(int(uint(_2072) >> uint(2)));
    int _2076 = _2072 & 3;
    float _2078 = (*spvDescriptorSet0.vp_c9)._m0[int(_2074)][_2076];
    float _2080 = fma(_2034, _2038, _2024);
    int _2082 = as_type<int>(_2042);
    if (_1978)
    {
        float _2084 = _2042 * 5.0;
        _2082 = as_type<int>(_2084);
    }
    int _2086 = _2082;
    float _2088 = -_2014;
    float _2090 = _2088 + 1.0;
    float _2092 = _1944 * _1944;
    float _2094 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2096 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1926);
    if (_1978)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6721 = as_type<float>(_2086);
        out.gl_Position.z = _6721;
    }
    float _2098 = -_2020;
    float _2100 = _2098 + 0.5;
    bool _2102 = !_1362;
    int _2104 = _2102 ? 0 : 1;
    float _2106 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2030);
    bool _2108 = !_2036;
    int _2110 = _2108 ? 0 : (-1);
    float _2112 = fma(_1594, (*spvDescriptorSet0.vp_c9)._m0[158].x, _2050);
    float _2114 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _2116 = abs(_2104);
    if (_1978)
    {
        out.m_45.x = 0.0;
    }
    bool _2118 = !_2032;
    int _2120 = _2118 ? 0 : (-1);
    bool _2122 = _917 == 0;
    float _2124 = -_2090;
    float _2126 = fma(_1418, _2124, _2012);
    float _2128 = _1694 * _2004;
    float _2130 = fma(_1932, _1932, _2092);
    int _2132 = _2028 + 8;
    uint _2134 = uint(int(uint(_2132) >> uint(2)));
    uint _2136 = uint(int(uint(int(_2134)) >> uint(2)));
    int _2138 = int(_2134) & 3;
    float _2140 = (*spvDescriptorSet0.vp_c9)._m0[int(_2136)][_2138];
    int _2142 = int(_2134) + 1;
    uint _2144 = uint(int(uint(_2142) >> uint(2)));
    int _2146 = _2142 & 3;
    float _2148 = (*spvDescriptorSet0.vp_c9)._m0[int(_2144)][_2146];
    float _2150 = _2100 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2152 = fma(_1948, _1948, _2130);
    float _2154 = -_2096;
    float _2156 = _2154 + 1.0;
    float _2158 = _2150 * _2094;
    float _2160 = _2114 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2162 = fma(_1386, _2156, _2048);
    float _2164 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2166 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2168 = _597 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2170 = rsqrt(_2152);
    float _2172 = fma(_905, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2164);
    float _2174 = fma(_1065, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2166);
    float _2176 = _1426 + (-0.5);
    out.m_60.x = _2128;
    out.m_60.y = _2158;
    out.m_60.z = _2126;
    out.m_60.w = _2162;
    float _2178 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2172);
    float _2180 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2174);
    float _2182 = -_2160;
    float _2184 = -_2106;
    float _2186 = fma(_2182, _2176, _2184);
    int _2188 = ~_1988;
    int _2190 = _2188 + _2120;
    int _2192 = _2190 + 1;
    float _2194 = -_2178;
    float _2196 = _2194 + 1.0;
    float _2198 = -_2180;
    float _2200 = _2198 + 1.0;
    float _2202 = _2168 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    out.m_62.x = _2112;
    float _2204 = -_2196;
    float _2206 = fma(_1800, _2204, _2080);
    float _2208 = fma(_1426, _2200, _2186);
    int _2210 = _917 * _2192;
    int _2212 = _2210 + _1246;
    float _2214 = _2202 * _2170;
    float _2216 = float(_1870);
    out.m_64.x = _2206;
    out.m_64.y = _2208;
    int _2218 = ~_1896;
    int _2220 = _2218 + 1;
    int _2222 = _2220 + 1;
    float _2224 = _1944 * _2214;
    int _2226 = ~_2116;
    int _2228 = _2226 + 1;
    int _2230 = _2228 + 1;
    float _2232 = _1932 * _2214;
    int _2234 = abs(_1442);
    int _2236 = _2222 * as_type<int>(_2078);
    int _2238 = abs(_2110);
    float _2240 = -_2224;
    float _2242 = _1944 + _2240;
    bool _2244 = !_2058;
    int _2246 = _2244 ? 0 : 1;
    int _2248 = _2230 * as_type<int>(_2070);
    int _2250 = _2248 + _2236;
    int _2252 = ~_2234;
    int _2254 = _2252 + 1;
    int _2256 = _2254 + 1;
    float _2258 = -_2232;
    float _2260 = _1932 + _2258;
    bool _2262 = !_2054;
    int _2264 = _2262 ? 0 : 1;
    float _2266 = in.m_66.x;
    float _2268 = in.m_66.y;
    float _2270 = in.m_66.z;
    int _2272 = abs(_1450);
    int _2274 = _2256 * as_type<int>(_2140);
    int _2276 = _2274 + _2250;
    int _2278 = abs(_2264);
    float _2280 = _2242 * _2242;
    int _2282 = ~_2238;
    int _2284 = _2282 + 1;
    int _2286 = _2284 + 1;
    float _2288 = _1948 * _2214;
    float _2290 = fma(_2260, _2260, _2280);
    float _2292 = float(_2278);
    int _2294 = _2286 * as_type<int>(_2148);
    int _2296 = _2294 + _2276;
    int _2298 = ~_2272;
    int _2300 = _2298 + 1;
    int _2302 = _2300 + 1;
    float _2304 = -_2288;
    float _2306 = _1948 + _2304;
    bool _2308 = !_2122;
    int _2310 = _2308 ? _2212 : (-1);
    float _2312 = _2292 * _2216;
    int _2314 = _2296 * _2302;
    int _2316 = abs(_2246);
    float _2318 = _2312 * (-2.0);
    float _2320 = float(_1534);
    int _2322 = _2310 * _2272;
    int _2324 = _2322 + _2314;
    float _2326 = float(_2316);
    float _2328 = _905 + (-0.5);
    float _2330 = fma(_2306, _2306, _2290);
    float _2332 = fma(_2318, _2266, _2266);
    float _2334 = float(_2324);
    float _2336 = _2326 * _2320;
    float _2338 = fma(_1910, _2318, _1910);
    float _2340 = fma(_2328, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2332);
    bool _2342 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2344 = isnan(1.0);
    bool _2346 = _2342 || _2344;
    bool _2348 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2350 = _2346 || _2348;
    out.m_68.y = _2334;
    float _2352 = _1296 + _1065;
    bool _2354 = !_2062;
    int _2356 = _2354 ? 0 : 1;
    float _2358 = _2270;
    if (_1978)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2360 = -_2224;
    float _2362 = _1928 + _2360;
    float _2364 = -_2232;
    float _2366 = _1918 + _2364;
    int _2368 = abs(_2356);
    float _2370 = -_2288;
    float _2372 = _1526 + _2370;
    float _2374 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2376 = _2362 + _2374;
    float _2378 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2380 = _2366 + _2378;
    float _2382 = float(_1628);
    float _2384 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2386 = _2372 + _2384;
    float _2388 = _2376 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _2390 = !_2350;
    float _2392 = _2390 ? _125 : _1836;
    float _2394 = _2352 + (-1.0);
    float _2396 = _1296 + _905;
    float _2398 = fma(_2380, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2388);
    float _2400 = float(_2368);
    float _2402 = fma(_2392, _2338, _2340);
    float _2404 = fma(_2394, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2406 = fma(_2386, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2398);
    float _2408 = _2336 * (-2.0);
    float _2410 = _1065 + (-0.5);
    float _2412 = _2400 * _2382;
    float _2414 = fma(_2408, _2268, _2268);
    float _2416 = fma(_2404, _2408, _2404);
    bool _2418 = _2406 >= 0.0;
    float _2420 = _2396 + (-1.0);
    float _2422 = fma(_2410, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2414);
    float _2424 = _2412 * (-2.0);
    float _2426 = _1296 + (-0.5);
    float _2428 = fma(_2420, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2430 = fma(_2392, _2416, _2422);
    float _2432 = fma(_2424, _2270, _2270);
    float _2434 = _2402 * 0.15915493667125701904296875;
    float _2436 = sqrt(_2330);
    float _2438 = _2430 * 0.15915493667125701904296875;
    float _2440 = fma(_2426, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2432);
    float _2442 = fma(_2428, _2424, _2428);
    float _2444 = _2366;
    if (_2418)
    {
        _2358 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2446 = _2358;
    int _2448 = as_type<int>(_2446);
    if (_2418)
    {
        out.m_45.x = 0.0;
    }
    float _2450 = fma(_2392, _2442, _2440);
    float _2452 = _2434 * 6.283185482025146484375;
    float _2454 = sin(_2452);
    if (_2418)
    {
        float _2456 = _2446 * 5.0;
        _2448 = as_type<int>(_2456);
    }
    int _2458 = _2448;
    float _2460 = _2450 * 0.15915493667125701904296875;
    if (_2418)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7284 = as_type<float>(_2458);
        out.gl_Position.z = _7284;
    }
    float _2462 = _2434 * 6.283185482025146484375;
    float _2464 = cos(_2462);
    float _2466 = _2438 * 6.283185482025146484375;
    float _2468 = sin(_2466);
    float _2470 = _2438 * 6.283185482025146484375;
    float _2472 = cos(_2470);
    if (_2418)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2474 = _2460 * 6.283185482025146484375;
    float _2476 = cos(_2474);
    float _2478 = _2170 * _2436;
    float _2480 = _599 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2482 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _227);
    float _2484 = _2464 * _2472;
    float _2486 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _223);
    float _2488 = _2478 * _2480;
    float _2490 = _2168 * _2478;
    float _2492 = _2460 * 6.283185482025146484375;
    float _2494 = sin(_2492);
    float _2496 = _2464 * _2468;
    float _2498 = _2482 * _2488;
    float _2500 = _2454 * _2468;
    float _2502 = _2476 * _2498;
    float _2504 = _2486 * _2490;
    float _2506 = _2454 * _2472;
    float _2508 = _2468 * _2476;
    float _2510 = _2464 * _2502;
    float _2512 = _2472 * _2476;
    float _2514 = _2454 * _2502;
    float _2516 = fma(_2494, _2484, _2500);
    float _2518 = -_2498;
    float _2520 = _2494 * _2518;
    float _2522 = -_2506;
    float _2524 = fma(_2494, _2496, _2522);
    float _2526 = -_2496;
    float _2528 = fma(_2494, _2506, _2526);
    float _2530 = fma(_2516, _2504, _2510);
    float _2532 = _2478 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2534 = _2532 * 0.5;
    float _2536 = fma(_2512, _2504, _2520);
    float _2538 = fma(_2494, _2500, _2484);
    float _2540 = fma(_2528, _2504, _2514);
    float _2542 = fma(_2524, _2534, _2530);
    float _2544 = fma(_2508, _2534, _2536);
    float _2546 = fma(_2538, _2534, _2540);
    float _2548 = _2542 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2550 = _2542 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2552 = _2542 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2554 = fma(_2544, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2548);
    float _2556 = fma(_2544, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2550);
    float _2558 = fma(_2544, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2552);
    float _2560 = fma(_2546, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2554);
    float _2562 = fma(_2546, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2556);
    float _2564 = fma(_2546, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2558);
    float _2566 = _2560 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2568 = _2562 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2570 = _1526 + _2566;
    float _2572 = _1918 + _2568;
    float _2574 = _2564 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2576 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2578 = _2570 + _2576;
    float _2580 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2582 = _2572 + _2580;
    float _2584 = _1928 + _2574;
    float _2586 = _2578 * _2578;
    float _2588 = fma(_2582, _2582, _2586);
    float _2590 = sqrt(_2588);
    bool _2592 = _2590 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2594 = _2574;
    float _2596 = _2586;
    float _2598 = _2546;
    float _2600 = _2588;
    float _2602 = _2578;
    if (!_2592)
    {
        _2594 = _2572;
    }
    float _2604 = _2594;
    float _2606 = _2604;
    if (!_2592)
    {
        _2596 = _2570;
    }
    float _2608 = _2596;
    float _2610 = _2608;
    if (!_2592)
    {
        _2598 = _2584;
    }
    float _2612 = _2598;
    bool _2614 = !_2592;
    float _2616 = _2612;
    if (!_2614)
    {
        float _2618 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2620 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2622 = _2590 + _2620;
        float _2624 = rsqrt(_2588);
        float _2626 = _2622 * _2618;
        float _2628 = _2584 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2630 = _2626 * 0.15915493667125701904296875;
        float _2632 = _2630 * 6.283185482025146484375;
        float _2634 = cos(_2632);
        float _2636 = _2630 * 6.283185482025146484375;
        float _2638 = sin(_2636);
        float _2640 = _2634 + (-1.0);
        float _2642 = _2640 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2644 = fma(_2638, _2628, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2646 = fma(_2584, _2634, _2642);
        float _2648 = _2624 * _2644;
        float _2650 = fma(_2582, _2648, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2652 = fma(_2578, _2648, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2616 = _2646;
        _2606 = _2650;
        _2610 = _2652;
    }
    float _2654 = _2616;
    float _2656 = _2606;
    float _2658 = _2610;
    float _2660 = -_1928;
    float _2662 = _2660 + _2654;
    float _2664 = -_1918;
    float _2666 = _2664 + _2656;
    float _2668 = -_1526;
    float _2670 = _2668 + _2658;
    float _2672 = _2662 * _2662;
    float _2674 = fma(_2666, _2666, _2672);
    float _2676 = fma(_2670, _2670, _2674);
    float _2678 = sqrt(_2676);
    bool _2680 = _2678 > 0.0;
    float _2682 = _2678;
    float _2684 = _2674;
    float _2686 = _2654;
    float _2688 = _2656;
    float _2690 = _2662;
    if (!_2680)
    {
        _2682 = _2656;
    }
    float _2692 = _2682;
    float _2694 = _2692;
    float _2696 = _2692;
    if (!_2680)
    {
        _2684 = _2658;
    }
    float _2698 = _2684;
    bool _2700 = !_2680;
    float _2702 = _2698;
    float _2704 = _2698;
    if (!_2700)
    {
        bool _2706 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2708 = _2582;
        if (_2706)
        {
            float _2710 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2708 = _2710;
        }
        float _2712 = _2708;
        float _2714 = _2712;
        if (_2706)
        {
            float _2716 = _475 * _2712;
            _2600 = _2716;
        }
        float _2718 = _2600;
        float _2720 = _2718;
        if (_2706)
        {
            float _2722 = _477 * _2712;
            _2602 = _2722;
        }
        float _2724 = _2602;
        float _2726 = _2724;
        if (_2706)
        {
            float _2728 = _479 * _2712;
            _2714 = _2728;
        }
        float _2730 = _2714;
        float _2732 = _2730;
        if (!_2706)
        {
            bool _2734 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
            bool _2736 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
            bool _2738 = _2734 || _2736;
            bool _2740 = isnan(1.0);
            bool _2742 = _2738 || _2740;
            float _2744 = _125 + 1.0;
            if (!_2742)
            {
                float _2746 = _2744 * _2744;
                float _2748 = _2746 * 0.5;
                _127 = _2748;
            }
            float _2750 = _127;
            float _2752 = _2750;
            if (!_2742)
            {
                float _2754 = _2750 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2752 = _2754;
            }
            float _2756 = _2752;
            bool _2758 = !_2742;
            float _2760 = _2756;
            if (!_2758)
            {
                float _2762 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2764 = log2(_2762);
                float _2766 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2768 = 1.0 + _2766;
                float _2770 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2772 = _2764 * _2744;
                float _2774 = 1.0 / _2768;
                float _2776 = _2770 * 0.693147182464599609375;
                float _2778 = exp2(_2772);
                float _2780 = 1.0 / _2776;
                float _2782 = _2778 + (-1.0);
                float _2784 = -_2782;
                float _2786 = fma(_2784, _2780, _2744);
                float _2788 = _2786 * _2774;
                float _2790 = _2788 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2760 = _2790;
            }
            float _2792 = _2760;
            float _2794 = _2792 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _2796 = _2792 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2798 = _2792 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2800 = _2792;
            if (!_2742)
            {
                _2800 = _2744;
            }
            float _2802 = _2800;
            float _2804 = _2794 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
            float _2806 = _2794 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
            float _2808 = _2794 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
            float _2810 = fma(_2796, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2804);
            float _2812 = fma(_2796, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2806);
            float _2814 = fma(_2798, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2810);
            bool _2816 = !_2742;
            float _2818 = _2802;
            _2702 = _2812;
            if (!_2816)
            {
                float _2820 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2822 = log2(_2820);
                float _2824 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2826 = 1.0 + _2824;
                float _2828 = 1.0 / _2826;
                float _2830 = _2822 * _2744;
                float _2832 = exp2(_2830);
                float _2834 = -_2832;
                float _2836 = _2834 + 1.0;
                float _2838 = _2836 * _2828;
                _2818 = _2838;
            }
            float _2840 = _2818;
            float _2842 = fma(_2796, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2808);
            float _2844 = fma(_2798, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2812);
            float _2846 = fma(_2840, _165, _2814);
            float _2848 = fma(_2798, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2842);
            float _2850 = fma(_2840, _163, _2844);
            float _2852 = -_437;
            float _2854 = _2852 + _2846;
            float _2856 = fma(_2840, _167, _2848);
            float _2858 = -_443;
            float _2860 = _2858 + _2850;
            float _2862 = _2854 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _2864 = _2854 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _2866 = _2854 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _2868 = -_449;
            float _2870 = _2868 + _2856;
            float _2872 = fma(_2860, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2862);
            float _2874 = fma(_2860, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2864);
            float _2876 = fma(_2860, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2866);
            float _2878 = fma(_2870, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2872);
            float _2880 = fma(_2870, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2874);
            float _2882 = fma(_2870, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2876);
            _483 = _2880;
            _485 = _2878;
            _487 = _2882;
            _2720 = _2878;
            _2726 = _2880;
            _2732 = _2882;
            _2694 = _2848;
            _489 = _2874;
        }
        float _2884 = _483;
        float _2886 = _485;
        float _2888 = _487;
        float _2890 = _2720;
        float _2892 = _2726;
        float _2894 = _2732;
        float _2896 = _2702;
        float _2898 = _2694;
        float _2900 = _489;
        float _2902 = _2884 * _2884;
        float _2904 = rsqrt(_2676);
        float _2906 = fma(_2886, _2886, _2902);
        float _2908 = fma(_2888, _2888, _2906);
        float _2910 = sqrt(_2908);
        float _2912 = _2666 * _2904;
        float _2914 = _2662 * _2904;
        float _2916 = _2670 * _2904;
        bool _2918 = _2910 > 0.0;
        float _2920 = _2898;
        float _2922 = _2896;
        _491 = _2900;
        if (!_2918)
        {
            _2920 = _2656;
        }
        float _2924 = _2920;
        _2696 = _2924;
        if (!_2918)
        {
            _2922 = _2658;
        }
        float _2926 = _2922;
        bool _2928 = !_2918;
        _2704 = _2926;
        if (!_2928)
        {
            float _2930 = rsqrt(_2908);
            float _2932 = _2930 * _2884;
            float _2934 = _2930 * _2886;
            float _2936 = _2930 * _2888;
            float _2938 = _2914 * _2932;
            float _2940 = fma(_2912, _2934, _2938);
            float _2942 = fma(_2916, _2936, _2940);
            float _2944 = _2942 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2946 = fma(_2890, _2944, _2656);
            float _2948 = fma(_2892, _2944, _2654);
            float _2950 = fma(_2894, _2944, _2658);
            _2704 = _2950;
            _2686 = _2948;
            _2696 = _2946;
        }
    }
    float _2952 = _2704;
    float _2954 = _2686;
    float _2956 = _2696;
    float _2958 = _491;
    float _2960 = _2362 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _2962 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2964 = isnan(0.5);
    bool _2966 = _2962 || _2964;
    bool _2968 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2970 = _2966 || _2968;
    float _2972 = fma(_2366, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2960);
    bool _2974 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2976 = isnan(0.5);
    bool _2978 = _2974 || _2976;
    bool _2980 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2982 = _2978 || _2980;
    float _2984 = fma(_2372, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2972);
    float _2986 = _2362 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2988 = _2984 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2990 = fma(_2366, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2986);
    float _2992 = 1.0 / _2988;
    float _2994 = fma(_2372, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2990);
    float _2996 = _2954;
    float _2998 = _2958;
    if (_2982)
    {
        _2688 = 1.0;
    }
    float _3000 = _2688;
    float _3002 = _2994 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3004 = _3002 + _2988;
    float _3006 = -_2288;
    float _3008 = _3006 + _2952;
    float _3010 = _3004 * _2992;
    float _3012 = _3010 * 0.5;
    float _3014 = -_2224;
    float _3016 = _3014 + _2954;
    float _3018 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3020 = fma(_3012, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3018);
    float _3022 = -_2232;
    float _3024 = _3022 + _2956;
    float _3026 = 1.0 / _3020;
    float _3028 = _3016;
    float _3030 = _3024;
    float _3032 = _3008;
    float _3034 = _3000;
    if (!_2970)
    {
        float _3036 = _2376 * _2376;
        float _3038 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3040 = -_1526;
        float _3042 = _3040 + _2952;
        float _3044 = fma(_2380, _2380, _3036);
        float _3046 = fma(_2386, _2386, _3044);
        float _3048 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3050 = sqrt(_3046);
        float _3052 = 1.0 / _2478;
        float _3054 = _3048 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3056 = precise::min(_3050, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3058 = _3056 * _3038;
        float _3060 = _3058 * _3052;
        float _3062 = -_1918;
        float _3064 = _3062 + _2956;
        float _3066 = -_1928;
        float _3068 = _3066 + _2954;
        float _3070 = _3054 * _3060;
        float _3072 = _3042 * _3060;
        float _3074 = fma(_3064, _3070, _2366);
        float _3076 = fma(_3068, _3070, _2362);
        float _3078 = fma(_3054, _3072, _2372);
        _2690 = _3060;
        _3028 = _3076;
        _3030 = _3074;
        _3032 = _3078;
    }
    float _3080 = _2690;
    float _3082 = _3028;
    float _3084 = _3030;
    float _3086 = _3032;
    float _3088 = _3080;
    if (_2982)
    {
        _3088 = 1.0;
    }
    float _3090 = _3088;
    float _3092 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3094 = _3026 * _3092;
    float _3096 = _3090;
    if (!_2982)
    {
        float _3098 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3100 = _3098 * 0.15915493667125701904296875;
        float _3102 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3104 = _3100 * 6.283185482025146484375;
        float _3106 = cos(_3104);
        float _3108 = _3102 * 0.15915493667125701904296875;
        float _3110 = _3100 * 6.283185482025146484375;
        float _3112 = sin(_3110);
        float _3114 = 1.0 / _3106;
        float _3116 = _3108 * 6.283185482025146484375;
        float _3118 = cos(_3116);
        float _3120 = _3112 * _3114;
        float _3122 = _3108 * 6.283185482025146484375;
        float _3124 = sin(_3122);
        float _3126 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3128 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3126;
        float _3130 = _3118 * _3120;
        float _3132 = 1.0 / _3128;
        float _3134 = 1.0 / _3130;
        float _3136 = _3124 * _3134;
        float _3138 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3140 = fma(_3094, _3136, _3138);
        float _3142 = _3140 * _3132;
        float _3144 = precise::clamp(_3142, 0.0, 1.0);
        _2444 = _3132;
        _2996 = _3100;
        _3034 = _3144;
    }
    float _3146 = _2444;
    float _3148 = _2996;
    float _3150 = _3034;
    float _3152 = _3146;
    float _3154 = _3148;
    if (!_2982)
    {
        float _3156 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3158 = _3156 * 0.15915493667125701904296875;
        float _3160 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3162 = _3158 * 6.283185482025146484375;
        float _3164 = cos(_3162);
        float _3166 = _3160 * 0.15915493667125701904296875;
        float _3168 = _3158 * 6.283185482025146484375;
        float _3170 = sin(_3168);
        float _3172 = 1.0 / _3164;
        float _3174 = _3166 * 6.283185482025146484375;
        float _3176 = cos(_3174);
        float _3178 = _3170 * _3172;
        float _3180 = _3166 * 6.283185482025146484375;
        float _3182 = sin(_3180);
        float _3184 = _3176 * _3178;
        float _3186 = 1.0 / _3184;
        float _3188 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3190 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _3188;
        float _3192 = 1.0 / _3190;
        float _3194 = _3182 * _3186;
        float _3196 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3198 = fma(_3094, _3194, _3196);
        float _3200 = _3198 * _3192;
        float _3202 = precise::clamp(_3200, 0.0, 1.0);
        float _3204 = -_3202;
        float _3206 = _3204 + 1.0;
        _3152 = _3186;
        _3154 = _3184;
        _3096 = _3206;
    }
    float _3208 = _3152;
    float _3210 = _3154;
    float _3212 = _3096;
    float _3214 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3216 = _3082 + _3214;
    float _3218 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3220 = _3084 + _3218;
    float _3222 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3224 = _3086 + _3222;
    float _3226 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3228 = _3216 * _3216;
    float _3230 = fma(_3220, _3220, _3228);
    float _3232 = fma(_3224, _3224, _3230);
    float _3234 = rsqrt(_3232);
    float _3236 = sqrt(_3232);
    float _3238 = _3234 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3240 = _3220 * _3238;
    float _3242 = _3224 * _3238;
    float _3244 = _3240 * _3240;
    float _3246 = _3242 * _3242;
    float _3248 = _3244 + _3246;
    float _3250 = sqrt(_3248);
    bool _3252 = _3250 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3254 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3256 = _3250 + _3254;
    float _3258 = _3224;
    float _3260 = _3210;
    float _3262 = _3256;
    float _3264 = _3208;
    float _3266 = _3216;
    if (_3252)
    {
        float _3268 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3258 = _3268;
    }
    float _3270 = _3258;
    if (_3252)
    {
        float _3272 = rsqrt(_3248);
        _3260 = _3272;
    }
    float _3274 = _3260;
    float _3276 = _3274;
    if (_3252)
    {
        float _3278 = _3256 * _3270;
        _3262 = _3278;
    }
    float _3280 = _3262;
    if (_3252)
    {
        float _3282 = _3280 * 0.15915493667125701904296875;
        _3264 = _3282;
    }
    float _3284 = _3264;
    float _3286 = _3234;
    if (_3252)
    {
        float _3288 = _3284 * 6.283185482025146484375;
        float _3290 = sin(_3288);
        _3286 = _3290;
    }
    float _3292 = _3286;
    float _3294 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3296 = precise::max(0.0, _3294);
    float _3298 = _3228;
    float _3300 = _3296;
    float _3302 = _3294;
    if (_3252)
    {
        float _3304 = _3284 * 6.283185482025146484375;
        float _3306 = cos(_3304);
        _3298 = _3306;
    }
    float _3308 = _3298;
    float _3310 = -_3238;
    float _3312 = -_3296;
    float _3314 = fma(_3216, _3310, _3312);
    if (!_3252)
    {
        _3266 = _3244;
    }
    float _3316 = _3266;
    float _3318 = _3316;
    if (_3252)
    {
        float _3320 = _3314 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3300 = _3320;
    }
    float _3322 = _3300;
    float _3324 = _3082 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3326 = _3322;
    float _3328 = _3292;
    if (_3252)
    {
        float _3330 = fma(_3292, _3322, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3326 = _3330;
    }
    float _3332 = _3326;
    float _3334 = _3332;
    if (!_3252)
    {
        _3328 = _3240;
    }
    float _3336 = _3328;
    float _3338 = _3336;
    float _3340 = _3308;
    if (_3252)
    {
        float _3342 = _3308 + (-1.0);
        _3302 = _3342;
    }
    float _3344 = _3302;
    float _3346 = _3344;
    if (_3252)
    {
        float _3348 = _3274 * _3332;
        _2998 = _3348;
    }
    float _3350 = _2998;
    if (!_3252)
    {
        _3334 = _3314;
    }
    float _3352 = _3334;
    float _3354 = _3352;
    if (_3252)
    {
        float _3356 = _3344 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3276 = _3356;
    }
    float _3358 = _3276;
    if (_3252)
    {
        float _3360 = _3240 * _3350;
        _3338 = _3360;
    }
    float _3362 = _3338;
    if (!_3252)
    {
        _3346 = _3242;
    }
    float _3364 = _3346;
    float _3366 = _3364;
    if (_3252)
    {
        float _3368 = _3242 * _3350;
        _3366 = _3368;
    }
    float _3370 = _3366;
    if (_3252)
    {
        float _3372 = fma(_3314, _3308, _3358);
        _3354 = _3372;
    }
    float _3374 = _3354;
    if (_3252)
    {
        float _3376 = _3362 * _3362;
        _3318 = _3376;
    }
    float _3378 = _3318;
    if (!_3252)
    {
        _3340 = _3246;
    }
    float _3380 = _3340;
    float _3382 = _3380;
    if (_3252)
    {
        float _3384 = _3370 * _3370;
        _3382 = _3384;
    }
    float _3386 = _3382;
    float _3388 = fma(_3374, _3374, _3378);
    float _3390 = _3388 + _3386;
    float _3392 = fma(_3084, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3324);
    float _3394 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3396 = fma(_3236, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3394);
    float _3398 = precise::clamp(_3396, 0.0, 1.0);
    float _3400 = _3082 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3402 = _3082 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3404 = _3082 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3406 = rsqrt(_3390);
    float _3408 = -_3398;
    float _3410 = _3408 + 1.0;
    float _3412 = fma(_3084, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3400);
    float _3414 = fma(_3084, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3402);
    float _3416 = fma(_3084, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3404);
    float _3418 = fma(_3086, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3392);
    float _3420 = fma(_3086, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3412);
    float _3422 = fma(_3086, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3414);
    float _3424 = abs(_3410);
    float _3426 = log2(_3424);
    float _3428 = fma(_3086, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3416);
    float _3430 = _3420 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3432 = _3422 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3434 = _3418 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3436 = _3428 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3438 = _3430 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3440 = _3406 * _3362;
    float _3442 = _3406 * _3374;
    float _3444 = fma(_3432, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3438);
    float _3446 = _3406 * _3370;
    float _3448 = _3440 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3450 = _3434 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3452 = fma(_3434, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3444);
    float _3454 = _3430 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3456 = -_3448;
    float _3458 = fma(_3442, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3456);
    float _3460 = _3426 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3462 = -_3450;
    float _3464 = fma(_3462, _3226, 1.0);
    float _3466 = fma(_3436, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3452);
    float _3468 = -_3446;
    float _3470 = fma(_3468, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3458);
    float _3472 = _3430 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3474 = fma(_3432, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3454);
    float _3476 = exp2(_3460);
    float _3478 = fma(_3470, -0.5, 0.5);
    float _3480 = fma(_3432, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3472);
    float _3482 = fma(_3470, 0.5, 0.5);
    float _3484 = fma(_3434, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3474);
    float _3486 = _3442 + 1.0;
    float _3488 = fma(_3434, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3480);
    float _3490 = fma(_3482, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3492 = log2(_3464);
    float _3494 = fma(_3436, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3484);
    float _3496 = fma(_3436, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3488);
    float _3498 = fma(_3482, _3490, -0.212114393711090087890625);
    float _3500 = fma(_3482, _3498, 1.570728778839111328125);
    float _3502 = 1.0 / _3466;
    float _3504 = -_3442;
    float _3506 = fma(_3476, _3486, _3504);
    float _3508 = fma(_3506, 0.5, 0.5);
    float _3510 = sqrt(_3478);
    float _3512 = _3492 * 0.693147182464599609375;
    float _3514 = _3512 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3516 = _3494 * _3502;
    float _3518 = _3496 * _3502;
    float _3520 = fma(_3516, 0.5, 0.5);
    float _3522 = fma(_3518, -0.5, 0.5);
    float _3524 = _3510 * 0.636619746685028076171875;
    float3 _8934 = float3(_3520, _3522, _3514);
    float _3526 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8934, float3(0.0), isnan(_8934)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8934, float3(0.0), isnan(_8934)), level(0.0)).x;
    float3 _8945 = float3(_3520, _3522, _3514);
    float4 _3529 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8945, float3(0.0), isnan(_8945)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8945, float3(0.0), isnan(_8945)), level(0.0)).xyzw;
    float _3531 = _3529.x;
    float _3533 = _3529.y;
    float _3535 = _3529.z;
    float _3537 = _3529.w;
    float _3539 = -_3500;
    float _3541 = fma(_3524, _3539, 1.0);
    float2 _8967 = float2(_3541, _3508);
    float3 _3545 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8967, float2(0.0), isnan(_8967)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8967, float2(0.0), isnan(_8967)), level(0.0)).xyz;
    float _3547 = _3545.x;
    float _3549 = _3545.y;
    float _3551 = _3545.z;
    float _3553 = _3426 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3555 = _3430 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _3557 = _3150 > 0.0;
    bool _3559 = isnan(_3150);
    bool _3561 = _3557 || _3559;
    bool _3563 = isnan(0.0);
    bool _3565 = _3561 || _3563;
    float _3567 = fma(_3432, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3555);
    float _3569 = exp2(_3553);
    bool _3571 = _3212 <= 0.0;
    bool _3573 = !_3565;
    bool _3575 = _3571 || _3573;
    float _3577 = fma(_3434, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3567);
    float _3579 = _3150 * _3212;
    float _3581 = _3466 * 0.5;
    float _3583 = fma(_3436, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3577);
    float _3585 = _3494 + _3466;
    float _3587 = _3579 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3589 = fma(_3496, -0.5, _3581);
    float _3591 = _3583 + _3466;
    float _3593 = _3585 * 0.5;
    out.gl_Position.x = _3494;
    out.gl_Position.y = _3496;
    out.gl_Position.z = _3583;
    out.gl_Position.w = _3466;
    float _3595 = _3587 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3597 = _3591 * 0.5;
    float _3599 = -_3569;
    float _3601 = _3599 + 1.0;
    out.m_45.x = _3595;
    float _3603 = _3601 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_70.x = _3593;
    out.m_70.y = _3589;
    out.m_70.z = _3597;
    out.m_70.w = _3466;
    float _3605 = -_3603;
    float _3607 = _3605 + 1.0;
    float _3609 = _3603 * _3526;
    float _3611 = _3537 * _3607;
    float _3613 = _3537 * _3609;
    float _3615 = _3551 * _3609;
    float _3617 = fma(_3547, _3613, _3531);
    float _3619 = fma(_3549, _3613, _3533);
    float _3621 = fma(_3537, _3615, _3535);
    out.m_72.x = _3617;
    out.m_72.y = _3619;
    out.m_72.z = _3621;
    out.m_72.w = _3611;
    if (!_3575)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3623 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_45.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3623;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _887 = false;
    bool _763 = false;
    bool _621 = false;
    bool _511 = false;
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
        float _3680 = as_type<float>(_107);
        out.gl_Position.z = _3680;
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
        float _3750 = as_type<float>(_145);
        out.gl_Position.z = _3750;
    }
    if (_137)
    {
        return out;
    }
    float _147 = as_type<float>(int(gl_VertexIndex));
    float _149 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _151 = in.m_52.w;
    bool _153 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _155 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _157 = _153 || _155;
    bool _159 = isnan(1.0);
    bool _161 = _157 || _159;
    float _163 = in.m_47.x;
    float _165 = in.m_47.y;
    float _167 = in.m_47.z;
    float _169 = in.m_42.x;
    float _171 = in.m_42.y;
    float _173 = in.m_42.z;
    int _175 = as_type<int>(_147) & 1;
    bool _177 = _175 != 0;
    int _179 = as_type<int>(_147) & 2;
    bool _181 = _179 != 0;
    int _183 = int(_177);
    int _185 = _181 ? 2 : 0;
    int _187 = _183 | _185;
    int _189 = _161 ? 4 : 0;
    int _191 = _187 | _189;
    int _193 = false ? 8 : 0;
    int _195 = _191 | _193;
    int _197 = false ? 16 : 0;
    int _199 = _195 | _197;
    int _201 = false ? 32 : 0;
    int _203 = _199 | _201;
    int _205 = false ? 64 : 0;
    int _207 = _203 | _205;
    int _209 = _207 & 4;
    float _211 = as_type<float>(_209);
    float _213 = _149;
    if (!_161)
    {
        float _215 = _149 * _149;
        float _217 = _215 * 0.5;
        _211 = _217;
    }
    float _219 = _211;
    bool _221 = !_177;
    float _223 = _221 ? (-0.5) : 0.5;
    bool _225 = !_181;
    float _227 = _225 ? (-0.5) : 0.5;
    float _229 = _219;
    if (!_161)
    {
        float _231 = _219 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _229 = _231;
    }
    float _233 = _229;
    bool _235 = !_161;
    float _237 = _233;
    float _239 = 0.0;
    if (!_235)
    {
        float _241 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _243 = log2(_241);
        float _245 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _247 = _245 + 1.0;
        float _249 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _251 = _149 * _243;
        float _253 = exp2(_251);
        float _255 = _249 * 0.693147182464599609375;
        float _257 = 1.0 / _255;
        float _259 = 1.0 / _247;
        float _261 = _253 + (-1.0);
        float _263 = -_261;
        float _265 = fma(_263, _257, _149);
        float _267 = _265 * _259;
        float _269 = _267 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _237 = _269;
        _239 = _247;
    }
    float _271 = _237;
    float _273 = _239;
    float _275 = _271 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _277 = !_161;
    float _279 = _273;
    float _281 = _271;
    if (!_277)
    {
        float _283 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _285 = log2(_283);
        float _287 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _289 = _287 + 1.0;
        float _291 = 1.0 / _289;
        float _293 = _149 * _285;
        float _295 = exp2(_293);
        float _297 = -_295;
        float _299 = _297 + 1.0;
        float _301 = _299 * _291;
        _279 = _291;
        _213 = _301;
    }
    float _303 = _279;
    float _305 = _213;
    float _307 = _275 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _309 = _275 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _311 = _271 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _313 = _275 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _315 = _303;
    if (!_161)
    {
        float _317 = _125 * _125;
        float _319 = _317 * 0.5;
        _315 = _319;
    }
    float _321 = _315;
    float _323 = fma(_311, (*spvDescriptorSet0.vp_c10)._m0[8].x, _307);
    float _325 = fma(_311, (*spvDescriptorSet0.vp_c10)._m0[8].y, _309);
    float _327 = fma(_311, (*spvDescriptorSet0.vp_c10)._m0[8].z, _313);
    float _329 = _271 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_161)
    {
        float _331 = _321 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _281 = _331;
    }
    float _333 = _281;
    bool _335 = !_161;
    float _337 = _333;
    if (!_335)
    {
        float _339 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _341 = log2(_339);
        float _343 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _345 = _343 + 1.0;
        float _347 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _349 = _125 * _341;
        float _351 = exp2(_349);
        float _353 = _347 * 0.693147182464599609375;
        float _355 = 1.0 / _353;
        float _357 = 1.0 / _345;
        float _359 = _351 + (-1.0);
        float _361 = -_359;
        float _363 = fma(_361, _355, _125);
        float _365 = _363 * _357;
        float _367 = _365 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _337 = _367;
    }
    float _369 = _337;
    float _371 = _369 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _373 = fma(_329, (*spvDescriptorSet0.vp_c10)._m0[10].x, _323);
    float _375 = fma(_329, (*spvDescriptorSet0.vp_c10)._m0[10].y, _325);
    float _377 = _369 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _379 = _371 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _381 = _371 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _383 = _371 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _385 = fma(_329, (*spvDescriptorSet0.vp_c10)._m0[10].z, _327);
    float _387 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[8].x, _379);
    float _389 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[8].y, _381);
    float _391 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[8].z, _383);
    float _393 = _369 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _395 = fma(_305, _163, _373);
    float _397 = fma(_305, _165, _375);
    float _399 = fma(_305, _167, _385);
    float _401 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[10].x, _387);
    float _403 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[10].y, _389);
    float _405 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[10].z, _391);
    float _407 = _393;
    if (!_161)
    {
        _407 = _125;
    }
    float _409 = _407;
    bool _411 = !_161;
    float _413 = _409;
    if (!_411)
    {
        float _415 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _417 = log2(_415);
        float _419 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _421 = _419 + 1.0;
        float _423 = 1.0 / _421;
        float _425 = _125 * _417;
        float _427 = exp2(_425);
        float _429 = -_427;
        float _431 = _429 + 1.0;
        float _433 = _431 * _423;
        _413 = _433;
    }
    float _435 = _413;
    float _437 = fma(_435, _165, _403);
    bool _439 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _441 = fma(_397, _151, _171);
    float _443 = fma(_435, _163, _401);
    float _445 = -_437;
    float _447 = _397 + _445;
    float _449 = fma(_435, _167, _405);
    float _451 = fma(_395, _151, _169);
    float _453 = -_443;
    float _455 = _395 + _453;
    float _457 = _447 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _459 = _447 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _461 = _447 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _463 = -_449;
    float _465 = _399 + _463;
    float _467 = fma(_455, (*spvDescriptorSet0.vp_c10)._m0[4].x, _457);
    float _469 = fma(_455, (*spvDescriptorSet0.vp_c10)._m0[5].x, _459);
    float _471 = fma(_455, (*spvDescriptorSet0.vp_c10)._m0[6].x, _461);
    float _473 = fma(_399, _151, _173);
    float _475 = fma(_465, (*spvDescriptorSet0.vp_c10)._m0[4].z, _467);
    float _477 = fma(_465, (*spvDescriptorSet0.vp_c10)._m0[5].z, _469);
    float _479 = fma(_465, (*spvDescriptorSet0.vp_c10)._m0[6].z, _471);
    bool _481 = !_439;
    float _483 = _477;
    float _485 = _475;
    float _487 = _479;
    float _489 = _449;
    float _491 = _449;
    float _509;
    if (!_481)
    {
        float _493 = in.m_54.x;
        float _495 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _497 = _493 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _499 = fma(_497, (*spvDescriptorSet0.vp_c9)._m0[12].x, _125);
        float _501 = _499 * _495;
        float _503 = floor(_501);
        float _505 = -_503;
        float _507 = _501 + _505;
        _509 = _507;
        _511 = true;
    }
    else
    {
        float _513 = float(_91);
        float _515 = 1.0 / _513;
        float _517 = _125 * _515;
        _509 = _517;
    }
    _511 = false;
    float _519 = _509;
    float _521 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _523 = _519 + _521;
    float _525 = in.m_52.x;
    float _527 = in.m_52.y;
    bool _529 = _519 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _531 = isnan(_519);
    bool _533 = _529 || _531;
    bool _535 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _537 = _533 || _535;
    float _539 = float(_537);
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _543 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _541;
    bool _545 = _519 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _547 = isnan(_519);
    bool _549 = _545 || _547;
    bool _551 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _553 = _549 || _551;
    float _555 = float(_553);
    float _557 = -_539;
    float _559 = _557 + 1.0;
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _563 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _561;
    float _565 = 1.0 / _543;
    bool _567 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _569 = _555 * _559;
    float _571 = -_555;
    float _573 = _571 + 1.0;
    float _575 = _523 * _565;
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _579 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _577;
    float _581 = fma(_563, _575, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _583 = fma(_579, _575, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _585 = _581 * _569;
    float _587 = _583 * _569;
    float _589 = fma(_573, (*spvDescriptorSet0.vp_c9)._m0[143].x, _585);
    float _591 = fma(_573, (*spvDescriptorSet0.vp_c9)._m0[143].y, _587);
    float _593 = fma(_539, (*spvDescriptorSet0.vp_c9)._m0[144].x, _589);
    float _595 = fma(_539, (*spvDescriptorSet0.vp_c9)._m0[144].y, _591);
    float _597 = _593 * _525;
    float _599 = _595 * _527;
    bool _601 = !_567;
    float _619;
    if (!_601)
    {
        float _603 = in.m_54.x;
        float _605 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _607 = _603 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _609 = fma(_607, (*spvDescriptorSet0.vp_c9)._m0[11].y, _125);
        float _611 = _609 * _605;
        float _613 = floor(_611);
        float _615 = -_613;
        float _617 = _611 + _615;
        _619 = _617;
        _621 = true;
    }
    else
    {
        float _623 = float(_91);
        float _625 = 1.0 / _623;
        float _627 = _125 * _625;
        _619 = _627;
    }
    _621 = false;
    float _629 = _619;
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _633 = _629 + _631;
    float _635 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _637 = _635 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _639 = _629 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _641 = isnan(_629);
    bool _643 = _639 || _641;
    bool _645 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _647 = _643 || _645;
    float _649 = float(_647);
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _653 = _651 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _655 = _629 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _657 = isnan(_629);
    bool _659 = _655 || _657;
    bool _661 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _663 = _659 || _661;
    float _665 = float(_663);
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _669 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _667;
    bool _671 = _629 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _673 = isnan(_629);
    bool _675 = _671 || _673;
    bool _677 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _679 = _675 || _677;
    float _681 = float(_679);
    float _683 = 1.0 / _637;
    float _685 = -_649;
    float _687 = _685 + 1.0;
    bool _689 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _691 = _665 * _687;
    float _693 = -_665;
    float _695 = _693 + 1.0;
    float _697 = 1.0 / _653;
    float _699 = _669 * _683;
    float _701 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _703 = _701 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _705 = fma(_699, _633, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _707 = -_681;
    float _709 = _707 + 1.0;
    float _711 = _705 * _691;
    float _713 = _703 * _697;
    float _715 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _717 = _629 + _715;
    float _719 = _649 * _709;
    float _721 = fma(_695, (*spvDescriptorSet0.vp_c9)._m0[115].x, _711);
    float _723 = fma(_713, _717, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _725 = fma(_723, _719, _721);
    float _727 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _729 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _731 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _733 = fma(_681, (*spvDescriptorSet0.vp_c9)._m0[117].x, _725);
    float _735 = _729 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _737 = _727 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _739 = _731 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _741 = _733 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_56.x = _737;
    out.m_56.y = _735;
    out.m_56.z = _739;
    out.m_56.w = _741;
    bool _743 = !_689;
    float _761;
    if (!_743)
    {
        float _745 = in.m_54.x;
        float _747 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _749 = _745 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _751 = fma(_749, (*spvDescriptorSet0.vp_c9)._m0[11].z, _125);
        float _753 = _751 * _747;
        float _755 = floor(_753);
        float _757 = -_755;
        float _759 = _753 + _757;
        _761 = _759;
        _763 = true;
    }
    else
    {
        float _765 = float(_91);
        float _767 = 1.0 / _765;
        float _769 = _125 * _767;
        _761 = _769;
    }
    _763 = false;
    float _771 = _761;
    float _773 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _775 = _771 + _773;
    bool _777 = _771 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _779 = isnan(_771);
    bool _781 = _777 || _779;
    bool _783 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _785 = _781 || _783;
    float _787 = float(_785);
    float _789 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _791 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _789;
    bool _793 = _771 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _795 = isnan(_771);
    bool _797 = _793 || _795;
    bool _799 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _801 = _797 || _799;
    float _803 = float(_801);
    float _805 = -_787;
    float _807 = _805 + 1.0;
    float _809 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _811 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _809;
    float _813 = 1.0 / _791;
    bool _815 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _817 = _803 * _807;
    float _819 = -_803;
    float _821 = _819 + 1.0;
    float _823 = _775 * _813;
    float _825 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _827 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _825;
    float _829 = fma(_811, _823, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _831 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _833 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _831;
    float _835 = fma(_827, _823, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _837 = _829 * _817;
    float _839 = fma(_833, _823, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _841 = _835 * _817;
    float _843 = fma(_821, (*spvDescriptorSet0.vp_c9)._m0[123].x, _837);
    float _845 = _839 * _817;
    float _847 = fma(_821, (*spvDescriptorSet0.vp_c9)._m0[123].z, _841);
    float _849 = fma(_821, (*spvDescriptorSet0.vp_c9)._m0[123].y, _845);
    float _851 = fma(_787, (*spvDescriptorSet0.vp_c9)._m0[124].x, _843);
    float _853 = fma(_787, (*spvDescriptorSet0.vp_c9)._m0[124].z, _847);
    float _855 = fma(_787, (*spvDescriptorSet0.vp_c9)._m0[124].y, _849);
    bool _857 = !_815;
    float _881;
    float _883;
    float _885;
    if (!_857)
    {
        float _859 = in.m_54.x;
        float _861 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _863 = float(_91);
        float _865 = 1.0 / _863;
        float _867 = _859 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _869 = _125 * _865;
        float _871 = fma(_867, (*spvDescriptorSet0.vp_c9)._m0[11].w, _125);
        float _873 = _871 * _861;
        float _875 = floor(_873);
        float _877 = -_875;
        float _879 = _873 + _877;
        _881 = _869;
        _883 = _879;
        _885 = _863;
        _887 = true;
    }
    else
    {
        float _889 = float(_91);
        float _891 = 1.0 / _889;
        float _893 = _125 * _891;
        _881 = _893;
        _883 = _893;
        _885 = _889;
    }
    _887 = false;
    float _895 = _881;
    float _897 = _883;
    float _899 = _885;
    float _901 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _903 = int(_901);
    float _905 = in.m_54.x;
    float _907 = _441 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _909 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _911 = _909 != 0;
    float _913 = _441 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _915 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _917 = int(_915);
    bool _919 = !_911;
    float _921 = _919 ? 1.2345600128173828125 : 1.0;
    float _923 = fma(_451, (*spvDescriptorSet0.vp_c10)._m0[5].x, _907);
    float _925 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _927 = _895 + _925;
    float _929 = fma(_473, (*spvDescriptorSet0.vp_c10)._m0[5].z, _923);
    float _931 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _933 = log2(_931);
    float _935 = float(_903);
    float _937 = _817;
    float _939 = _935;
    float _941 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (!_911)
    {
        float _943 = in.m_54.y;
        _937 = _943;
    }
    float _945 = _937;
    float _947 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _949 = _947 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _951 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _953 = _951 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _955 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _957 = _955 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _959 = 1.0 / _935;
    float _961 = float(uint(_917));
    float _963 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _965 = _963 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _967 = float(_917);
    float _969 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _971 = _969 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    int _973 = ~_917;
    int _975 = _973 + 1;
    float _977 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _979 = _895 + _977;
    bool _981 = _917 == 0;
    float _983 = 1.0 / _961;
    float _985 = _855 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _987 = _851 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _989 = _897 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _991 = isnan(_897);
    bool _993 = _989 || _991;
    bool _995 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _997 = _993 || _995;
    float _999 = float(_997);
    float _1001 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _1003 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _1001;
    bool _1005 = _895 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1007 = isnan(_895);
    bool _1009 = _1005 || _1007;
    bool _1011 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _1013 = _1009 || _1011;
    float _1015 = float(_1013);
    float _1017 = _125 * _959;
    float _1019 = 1.0 / _949;
    if (!_911)
    {
        _939 = _945;
    }
    float _1021 = _939;
    float _1023 = -_1015;
    float _1025 = _1023 + 1.0;
    bool _1027 = _895 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1029 = isnan(_895);
    bool _1031 = _1027 || _1029;
    bool _1033 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1035 = _1031 || _1033;
    float _1037 = float(_1035);
    float _1039 = _1021;
    if (!_911)
    {
        _941 = _1021;
    }
    float _1041 = _941;
    float _1043 = trunc(_1017);
    int _1045 = int(_1043);
    int _1047 = as_type<int>(_983) + (-2);
    float _1049 = _1037 * _1025;
    int _1051 = ~_917;
    int _1053 = _1051 + 1;
    float _1055 = _1041;
    float _1057 = _945;
    if (_911)
    {
        float _1059 = in.m_54.x;
        float _1061 = in.m_54.y;
        _1055 = _1059;
        _1057 = _1061;
    }
    float _1063 = _1055;
    float _1065 = _1057;
    float _1067 = 0.0;
    if (_911)
    {
        _1067 = _905;
    }
    float _1069 = _1067;
    float _1071 = 1.0 / _953;
    float _1073 = float(uint(_1045));
    float _1075 = 1.0 / _957;
    float _1077 = as_type<float>(_1047) * _1073;
    float _1079 = trunc(_1077);
    float _1081 = precise::max(_1079, 0.0);
    uint _1084 = uint(_1081);
    float _1086 = _1065 * 2.0;
    float _1088 = _1069;
    if (_911)
    {
        _1039 = _1065;
    }
    float _1090 = _1039;
    float _1092 = 1.0 / _965;
    int _1094 = _1053 * int(_1084);
    int _1096 = _1094 + _1045;
    float _1098 = 1.0 / _971;
    float _1100 = float(uint(_1096));
    float _1102 = _1003 * _1092;
    float _1104 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1106 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1104;
    float _1108 = as_type<float>(_1047) * _1100;
    float _1110 = float(_1045);
    bool _1112 = _1110 >= _967;
    bool _1114 = isnan(_1110);
    bool _1116 = _1112 || _1114;
    bool _1118 = isnan(_967);
    bool _1120 = _1116 || _1118;
    float _1122 = float(_1120);
    float _1124 = trunc(_1108);
    float _1126 = precise::max(_1124, 0.0);
    uint _1128 = uint(_1126);
    bool _1130 = !_911;
    float _1132 = _1130 ? _1065 : _905;
    float _1134 = _1132 * _921;
    float _1136 = trunc(_1122);
    int _1138 = int(_1136);
    int _1140 = int(_1084) + int(_1128);
    float _1142 = floor(_1134);
    int _1144 = _975 * _1140;
    int _1146 = _1144 + _1045;
    int _1148 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1150 = _1148 != 0;
    float _1152 = 1.0 / _899;
    bool _1154 = uint(_1146) >= uint(_917);
    bool _1156 = !_1154;
    int _1158 = _1156 ? 0 : (-1);
    int _1160 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1162 = _1160 != 0;
    int _1164 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1166 = _1164 != 0;
    int _1168 = ~_1140;
    int _1170 = _1168 + _1158;
    int _1172 = _1170 + 1;
    float _1174 = -_1142;
    float _1176 = _1134 + _1174;
    int _1178 = ~_1138;
    int _1180 = _1178 + 1;
    int _1182 = _1180 + 1;
    bool _1184 = !_1166;
    int _1186 = _1184 ? 0 : 1;
    int _1188 = _917 * _1172;
    int _1190 = _1188 + _1045;
    float _1192 = _967 * _1176;
    float _1194 = _125 * _967;
    int _1196 = abs(_1186);
    bool _1198 = !_981;
    int _1200 = _1198 ? _1190 : (-1);
    float _1202 = _1194 * _1152;
    int _1204 = _917 + (-1);
    float _1206 = trunc(_1192);
    int _1208 = int(_1206);
    int _1210 = _1200 * _1182;
    bool _1212 = !_1150;
    int _1214 = _1212 ? 0 : 1;
    int _1216 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1218 = _1216 != 0;
    int _1220 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1222 = _1220 != 0;
    int _1224 = _1138 * _1204;
    int _1226 = _1224 + _1210;
    bool _1228 = !_1162;
    int _1230 = _1228 ? 0 : 1;
    float _1232 = trunc(_1202);
    int _1234 = int(_1232);
    int _1236 = abs(_1214);
    bool _1238 = !_1218;
    int _1240 = _1238 ? 0 : 1;
    int _1242 = abs(_1230);
    int _1244 = _1208 * _1236;
    int _1246 = _1244 + _1045;
    bool _1248 = !_1222;
    int _1250 = _1248 ? 0 : 1;
    int _1252 = abs(_1240);
    int _1254 = _1226 * _1196;
    int _1256 = abs(_1250);
    int _1258 = _1234 * _1242;
    int _1260 = _1258 + _1254;
    int _1262 = ~_917;
    int _1264 = _1262 + 1;
    int _1266 = _1246 * _1252;
    int _1268 = _1266 + _1260;
    int _1270 = _1208 * _1256;
    int _1272 = _1270 + _1268;
    int _1274 = ~_917;
    int _1276 = _1274 + 1;
    float _1278 = float(uint(_1272));
    float _1280 = as_type<float>(_1047) * _1278;
    float _1282 = trunc(_1280);
    float _1284 = precise::max(_1282, 0.0);
    uint _1286 = uint(_1284);
    int _1288 = _1276 * int(_1286);
    int _1290 = _1288 + _1272;
    float _1292 = float(uint(_1290));
    float _1294 = as_type<float>(_1047) * _1292;
    float _1296 = in.m_54.z;
    float _1298 = in.m_54.w;
    float _1300 = trunc(_1294);
    float _1302 = precise::max(_1300, 0.0);
    uint _1304 = uint(_1302);
    int _1306 = int(_1286) + int(_1304);
    bool _1308 = _1298 > 0.5;
    int _1310 = _1264 * _1306;
    int _1312 = _1310 + _1272;
    bool _1314 = _1296 > 0.5;
    float _1316 = -_227;
    int _1318 = _1308 ? as_type<int>(_1316) : as_type<int>(_227);
    bool _1320 = uint(_1312) >= uint(_917);
    bool _1322 = !_1320;
    int _1324 = _1322 ? 0 : (-1);
    if (!_911)
    {
        _1088 = _1296;
    }
    float _1326 = _1088;
    float _1328 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1330 = _1328 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    int _1332 = ~_1306;
    int _1334 = _1332 + _1324;
    int _1336 = _1334 + 1;
    int _1338 = _917 * _1336;
    int _1340 = _1338 + _1272;
    float _1342 = -_223;
    int _1344 = _1314 ? as_type<int>(_1342) : as_type<int>(_223);
    float _1346 = 1.0 / _1330;
    float _1348 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1350 = _1348 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1352 = !_981;
    int _1354 = _1352 ? _1340 : (-1);
    float _1356 = -_227;
    int _1358 = _1314 ? as_type<int>(_1356) : as_type<int>(_227);
    int _1360 = _1354 & 3;
    bool _1362 = _1360 != 0;
    float _1364 = 1.0 / _1350;
    int _1366 = _1354 & 3;
    bool _1368 = _1366 != 0;
    bool _1370 = uint(_1360) > 1u;
    int _1372 = _1368 ? 0 : 1;
    int _1374 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1376 = _1374 != 0;
    int _1378 = ~_1372;
    int _1380 = _1378 + 1;
    int _1382 = _1380 + 1;
    bool _1384 = !_1376;
    float _1386 = _1384 ? _227 : as_type<float>(_1318);
    bool _1388 = _1360 != 3;
    bool _1390 = uint(_1360) >= 2u;
    float _1392 = _1106 * _1364;
    int _1394 = _1382;
    if (!_1370)
    {
        int _1396 = ~_1372;
        int _1398 = _1396 + 1;
        _1394 = _1398;
    }
    int _1400 = _1394;
    int _1402 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1404 = _1402 != 0;
    int _1406 = _1390 ? 0 : 1;
    int _1408 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1410 = _1408 != 0;
    int _1412 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1414 = _1412 != 0;
    bool _1416 = !_1404;
    float _1418 = _1416 ? _223 : as_type<float>(_1344);
    int _1420 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1422 = _1420 != 0;
    bool _1424 = !_1414;
    float _1426 = _1424 ? _227 : as_type<float>(_1358);
    float _1428 = _905 * 2.0;
    int _1430 = ~_1406;
    int _1432 = _1430 + 1;
    int _1434 = _1432 + 1;
    int _1436 = _1434;
    if (_1388)
    {
        int _1438 = ~_1406;
        int _1440 = _1438 + 1;
        _1436 = _1440;
    }
    int _1442 = _1436;
    float _1444 = floor(_1428);
    bool _1446 = _1065 > 0.5;
    bool _1448 = !_1422;
    int _1450 = _1448 ? 0 : 1;
    bool _1452 = _905 > 0.5;
    float _1454 = -_223;
    int _1456 = _1446 ? as_type<int>(_1454) : as_type<int>(_223);
    float _1458 = -_227;
    int _1460 = _1446 ? as_type<int>(_1458) : as_type<int>(_227);
    int _1462 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1464 = _1462 != 0;
    float _1466 = -_223;
    int _1468 = _1452 ? as_type<int>(_1466) : as_type<int>(_223);
    int _1470 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1472 = _1470 != 0;
    float _1474 = _441 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _1476 = !_1464;
    float _1478 = _1476 ? _223 : as_type<float>(_1468);
    bool _1480 = _1444 >= 0.0;
    bool _1482 = isnan(_1444);
    bool _1484 = _1480 || _1482;
    bool _1486 = isnan(0.0);
    bool _1488 = _1484 || _1486;
    float _1490 = fma(_451, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1474);
    float _1492 = fma(_451, (*spvDescriptorSet0.vp_c10)._m0[6].x, _913);
    float _1494 = floor(_1086);
    int _1496 = _1488 ? 0 : 1;
    float _1498 = fma(_473, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1490);
    bool _1500 = _1444 > 0.0;
    float _1502 = fma(_473, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1492);
    float _1504 = _1296 * 2.0;
    int _1506 = ~_1496;
    int _1508 = _1506 + 1;
    int _1510 = _1508 + 1;
    float _1512 = _1478 + 0.5;
    float _1514 = _125 * _933;
    float _1516 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _1518 = _1516 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1520 = floor(_1504);
    float _1522 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1524 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1522;
    float _1526 = _1502 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1528 = _1510;
    if (!_1500)
    {
        int _1530 = ~_1496;
        int _1532 = _1530 + 1;
        _1528 = _1532;
    }
    int _1534 = _1528;
    float _1536 = _1518 * _1346;
    bool _1538 = _1494 >= 0.0;
    bool _1540 = isnan(_1494);
    bool _1542 = _1538 || _1540;
    bool _1544 = isnan(0.0);
    bool _1546 = _1542 || _1544;
    float _1548 = exp2(_1514);
    float _1550 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1552 = _1550 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1554 = _1524 * _1071;
    int _1556 = _1546 ? 0 : 1;
    float _1558 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1560 = _897 + _1558;
    bool _1562 = _1494 > 0.0;
    float _1564 = _1552 * _1019;
    int _1566 = ~_1556;
    int _1568 = _1566 + 1;
    int _1570 = _1568 + 1;
    float _1572 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1574 = _1572 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1576 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1578 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1576;
    float _1580 = fma(_1554, _1560, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1582 = _1574 * _1075;
    bool _1584 = _895 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1586 = isnan(_895);
    bool _1588 = _1584 || _1586;
    bool _1590 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1592 = _1588 || _1590;
    float _1594 = float(_1592);
    float _1596 = _1578 * _1098;
    float _1598 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1600 = _1598 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _1602 = -_1548;
    float _1604 = _1602 + 1.0;
    bool _1606 = _895 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1608 = isnan(_895);
    bool _1610 = _1606 || _1608;
    bool _1612 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1614 = _1610 || _1612;
    float _1616 = float(_1614);
    float _1618 = -_1594;
    float _1620 = _1618 + 1.0;
    int _1622 = _1570;
    if (!_1562)
    {
        int _1624 = ~_1556;
        int _1626 = _1624 + 1;
        _1622 = _1626;
    }
    int _1628 = _1622;
    float _1630 = 1.0 / _1600;
    bool _1632 = _1520 >= 0.0;
    bool _1634 = isnan(_1520);
    bool _1636 = _1632 || _1634;
    bool _1638 = isnan(0.0);
    bool _1640 = _1636 || _1638;
    float _1642 = _1616 * _1620;
    bool _1644 = _895 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1646 = isnan(_895);
    bool _1648 = _1644 || _1646;
    bool _1650 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1652 = _1648 || _1650;
    float _1654 = float(_1652);
    float _1656 = -_1616;
    float _1658 = _1656 + 1.0;
    int _1660 = _1640 ? 0 : 1;
    float _1662 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1664 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1662;
    bool _1666 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1668 = isnan(0.0);
    bool _1670 = _1666 || _1668;
    bool _1672 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1674 = _1670 || _1672;
    float _1676 = fma(_1596, _979, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _1678 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1680 = _895 + _1678;
    bool _1682 = _895 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1684 = isnan(_895);
    bool _1686 = _1682 || _1684;
    bool _1688 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1690 = _1686 || _1688;
    float _1692 = float(_1690);
    float _1694 = _1512 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1696 = _1674 ? _1604 : 0.0;
    float _1698 = fma(_1536, _1680, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    bool _1700 = _1520 > 0.0;
    float _1702 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1704 = _895 + _1702;
    float _1706 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1708 = _895 + _1706;
    float _1710 = -_1692;
    float _1712 = _1710 + 1.0;
    float _1714 = _1664 * _1630;
    float _1716 = fma(_1102, _1704, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _1718 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1720 = _895 + _1718;
    float _1722 = fma(_1564, _1708, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    bool _1724 = _895 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1726 = isnan(_895);
    bool _1728 = _1724 || _1726;
    bool _1730 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1732 = _1728 || _1730;
    float _1734 = float(_1732);
    float _1736 = _1716 * _1049;
    float _1738 = fma(_1392, _1720, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _1740 = _1654 * _1658;
    float _1742 = -_1654;
    float _1744 = _1742 + 1.0;
    bool _1746 = _897 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1748 = isnan(_897);
    bool _1750 = _1746 || _1748;
    bool _1752 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1754 = _1750 || _1752;
    float _1756 = float(_1754);
    bool _1758 = _895 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1760 = isnan(_895);
    bool _1762 = _1758 || _1760;
    bool _1764 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _1766 = _1762 || _1764;
    float _1768 = float(_1766);
    float _1770 = _1692 * _1744;
    float _1772 = _1734 * _1712;
    float _1774 = -_1734;
    float _1776 = _1774 + 1.0;
    float _1778 = -_1768;
    float _1780 = _1778 + 1.0;
    int _1782 = ~_917;
    int _1784 = _1782 + 1;
    float _1786 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1788 = 1.0 + _1786;
    float _1790 = _1768 * _1776;
    float _1792 = -_1756;
    float _1794 = _1792 + 1.0;
    float _1796 = _1015 * _1780;
    bool _1798 = !_1410;
    float _1800 = _1798 ? _223 : as_type<float>(_1456);
    float _1802 = 1.0 / _1788;
    float _1804 = _999 * _1794;
    float _1806 = fma(_1582, _927, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _1808 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1810 = _895 + _1808;
    float _1812 = -_1037;
    float _1814 = _1812 + 1.0;
    float _1816 = _1580 * _1804;
    float _1818 = fma(_1714, _1810, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _1820 = float(uint(_1246));
    float _1822 = fma(_1814, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1736);
    float _1824 = -_999;
    float _1826 = _1824 + 1.0;
    float _1828 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1830 = as_type<float>(_1047) * _1820;
    float _1832 = _1326 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1834 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1836 = _1696 * _1802;
    float _1838 = _1802;
    float _1840 = _1756;
    if (!_911)
    {
        float _1842 = in.m_54.z;
        _1838 = _1842;
    }
    float _1844 = _1838;
    float _1846 = trunc(_1830);
    float _1848 = precise::max(_1846, 0.0);
    uint _1850 = uint(_1848);
    int _1852 = ~_1660;
    int _1854 = _1852 + 1;
    int _1856 = _1854 + 1;
    float _1858 = fma(_1826, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1816);
    float _1860 = -_1828;
    float _1862 = fma(_1832, 2.0, _1860);
    int _1864 = _1856;
    if (!_1700)
    {
        int _1866 = ~_1660;
        int _1868 = _1866 + 1;
        _1864 = _1868;
    }
    int _1870 = _1864;
    float _1872 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _1874 = ~_917;
    int _1876 = _1874 + 1;
    float _1878 = fma(_1063, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1834);
    float _1880 = _1063 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1882 = fma(_1756, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1858);
    float _1884 = fma(_1698, _1796, _1822);
    float _1886 = -_1872;
    float _1888 = fma(_1880, 2.0, _1886);
    float _1890 = _1065 + _905;
    int _1892 = _1876 * int(_1850);
    int _1894 = _1892 + _1246;
    int _1896 = abs(_1400);
    float _1898 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1900 = _1890 + (-1.0);
    float _1902 = float(uint(_1894));
    float _1904 = fma(_1738, _1790, _1884);
    float _1906 = _1844;
    if (!_911)
    {
        _1840 = _1844;
    }
    float _1908 = _1840;
    float _1910 = fma(_1900, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1912 = _1908;
    if (_911)
    {
        _1906 = _1090;
    }
    float _1914 = _1906;
    float _1916 = as_type<float>(_1047) * _1902;
    float _1918 = _1498 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1920 = _853 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1922 = _1914;
    if (_911)
    {
        _1912 = _1090;
    }
    float _1924 = _1912;
    float _1926 = fma(_1914, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1898);
    float _1928 = _929 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1930 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1932 = _1918 + _1930;
    float _1934 = trunc(_1916);
    float _1936 = precise::max(_1934, 0.0);
    uint _1938 = uint(_1936);
    if (_911)
    {
        _1922 = _1090;
    }
    float _1940 = _1922;
    float _1942 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1944 = _1928 + _1942;
    float _1946 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1948 = _1526 + _1946;
    float _1950 = _985 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1952 = _987 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1954 = _1944 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1956 = _1920 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1958 = _1882 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1960 = fma(_1932, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1954);
    float _1962 = fma(_1722, _1772, _1904);
    float _1964 = _1924 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1966 = -_125;
    float _1968 = fma(_1966, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1888);
    float _1970 = fma(_1948, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1960);
    float _1972 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1974 = fma(_1676, _1770, _1962);
    int _1976 = _1354 >> 31;
    out.m_58.x = _1952;
    out.m_58.y = _1950;
    out.m_58.z = _1956;
    out.m_58.w = _1958;
    bool _1978 = _1970 >= 0.0;
    float _1980 = fma(_1964, -2.0, _1972);
    float _1982 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _1984 = _1976 & 3;
    float _1986 = fma(_1806, _1740, _1974);
    int _1988 = int(_1850) + int(_1938);
    float _1990 = _1418 + 0.5;
    float _1992 = _1940;
    if (!_911)
    {
        _1992 = _905;
    }
    float _1994 = _1992;
    float _1996 = _1386 + (-0.5);
    int _1998 = _1354 + _1984;
    int _2000 = _1784 * _1988;
    int _2002 = _2000 + _1246;
    float _2004 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2006 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1980);
    float _2008 = _1994 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _2010 = _1998 >> 2;
    float _2012 = fma(_1990, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1968);
    float _2014 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1878);
    float _2016 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    bool _2018 = !_1472;
    float _2020 = _2018 ? _227 : as_type<float>(_1460);
    float _2022 = -_125;
    float _2024 = fma(_2022, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1862);
    int _2026 = _2010 << 4;
    int _2028 = _2026 + 512;
    float _2030 = fma(_2008, -2.0, _2016);
    bool _2032 = uint(_2002) >= uint(_917);
    float _2034 = _1982 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _2036 = _1360 != 3;
    float _2038 = _1800 + 0.5;
    float _2040 = _2008;
    if (_1978)
    {
        _2040 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2042 = _2040;
    float _2044 = -_1996;
    float _2046 = -_2006;
    float _2048 = fma(_2044, (*spvDescriptorSet0.vp_c9)._m0[85].y, _2046);
    float _2050 = fma(_1818, _1642, _1986);
    int _2052 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2054 = _2052 != 0;
    int _2056 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2058 = _2056 != 0;
    int _2060 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2062 = _2060 != 0;
    uint _2064 = uint(int(uint(_2028) >> uint(2)));
    uint _2066 = uint(int(uint(int(_2064)) >> uint(2)));
    int _2068 = int(_2064) & 3;
    float _2070 = (*spvDescriptorSet0.vp_c9)._m0[int(_2066)][_2068];
    int _2072 = int(_2064) + 1;
    uint _2074 = uint(int(uint(_2072) >> uint(2)));
    int _2076 = _2072 & 3;
    float _2078 = (*spvDescriptorSet0.vp_c9)._m0[int(_2074)][_2076];
    float _2080 = fma(_2034, _2038, _2024);
    int _2082 = as_type<int>(_2042);
    if (_1978)
    {
        float _2084 = _2042 * 5.0;
        _2082 = as_type<int>(_2084);
    }
    int _2086 = _2082;
    float _2088 = -_2014;
    float _2090 = _2088 + 1.0;
    float _2092 = _1944 * _1944;
    float _2094 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2096 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1926);
    if (_1978)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6721 = as_type<float>(_2086);
        out.gl_Position.z = _6721;
    }
    float _2098 = -_2020;
    float _2100 = _2098 + 0.5;
    bool _2102 = !_1362;
    int _2104 = _2102 ? 0 : 1;
    float _2106 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2030);
    bool _2108 = !_2036;
    int _2110 = _2108 ? 0 : (-1);
    float _2112 = fma(_1594, (*spvDescriptorSet0.vp_c9)._m0[158].x, _2050);
    float _2114 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _2116 = abs(_2104);
    if (_1978)
    {
        out.m_45.x = 0.0;
    }
    bool _2118 = !_2032;
    int _2120 = _2118 ? 0 : (-1);
    bool _2122 = _917 == 0;
    float _2124 = -_2090;
    float _2126 = fma(_1418, _2124, _2012);
    float _2128 = _1694 * _2004;
    float _2130 = fma(_1932, _1932, _2092);
    int _2132 = _2028 + 8;
    uint _2134 = uint(int(uint(_2132) >> uint(2)));
    uint _2136 = uint(int(uint(int(_2134)) >> uint(2)));
    int _2138 = int(_2134) & 3;
    float _2140 = (*spvDescriptorSet0.vp_c9)._m0[int(_2136)][_2138];
    int _2142 = int(_2134) + 1;
    uint _2144 = uint(int(uint(_2142) >> uint(2)));
    int _2146 = _2142 & 3;
    float _2148 = (*spvDescriptorSet0.vp_c9)._m0[int(_2144)][_2146];
    float _2150 = _2100 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2152 = fma(_1948, _1948, _2130);
    float _2154 = -_2096;
    float _2156 = _2154 + 1.0;
    float _2158 = _2150 * _2094;
    float _2160 = _2114 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2162 = fma(_1386, _2156, _2048);
    float _2164 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2166 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2168 = _597 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2170 = rsqrt(_2152);
    float _2172 = fma(_905, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2164);
    float _2174 = fma(_1065, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2166);
    float _2176 = _1426 + (-0.5);
    out.m_60.x = _2128;
    out.m_60.y = _2158;
    out.m_60.z = _2126;
    out.m_60.w = _2162;
    float _2178 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2172);
    float _2180 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2174);
    float _2182 = -_2160;
    float _2184 = -_2106;
    float _2186 = fma(_2182, _2176, _2184);
    int _2188 = ~_1988;
    int _2190 = _2188 + _2120;
    int _2192 = _2190 + 1;
    float _2194 = -_2178;
    float _2196 = _2194 + 1.0;
    float _2198 = -_2180;
    float _2200 = _2198 + 1.0;
    float _2202 = _2168 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    out.m_62.x = _2112;
    float _2204 = -_2196;
    float _2206 = fma(_1800, _2204, _2080);
    float _2208 = fma(_1426, _2200, _2186);
    int _2210 = _917 * _2192;
    int _2212 = _2210 + _1246;
    float _2214 = _2202 * _2170;
    float _2216 = float(_1870);
    out.m_64.x = _2206;
    out.m_64.y = _2208;
    int _2218 = ~_1896;
    int _2220 = _2218 + 1;
    int _2222 = _2220 + 1;
    float _2224 = _1944 * _2214;
    int _2226 = ~_2116;
    int _2228 = _2226 + 1;
    int _2230 = _2228 + 1;
    float _2232 = _1932 * _2214;
    int _2234 = abs(_1442);
    int _2236 = _2222 * as_type<int>(_2078);
    int _2238 = abs(_2110);
    float _2240 = -_2224;
    float _2242 = _1944 + _2240;
    bool _2244 = !_2058;
    int _2246 = _2244 ? 0 : 1;
    int _2248 = _2230 * as_type<int>(_2070);
    int _2250 = _2248 + _2236;
    int _2252 = ~_2234;
    int _2254 = _2252 + 1;
    int _2256 = _2254 + 1;
    float _2258 = -_2232;
    float _2260 = _1932 + _2258;
    bool _2262 = !_2054;
    int _2264 = _2262 ? 0 : 1;
    float _2266 = in.m_66.x;
    float _2268 = in.m_66.y;
    float _2270 = in.m_66.z;
    int _2272 = abs(_1450);
    int _2274 = _2256 * as_type<int>(_2140);
    int _2276 = _2274 + _2250;
    int _2278 = abs(_2264);
    float _2280 = _2242 * _2242;
    int _2282 = ~_2238;
    int _2284 = _2282 + 1;
    int _2286 = _2284 + 1;
    float _2288 = _1948 * _2214;
    float _2290 = fma(_2260, _2260, _2280);
    float _2292 = float(_2278);
    int _2294 = _2286 * as_type<int>(_2148);
    int _2296 = _2294 + _2276;
    int _2298 = ~_2272;
    int _2300 = _2298 + 1;
    int _2302 = _2300 + 1;
    float _2304 = -_2288;
    float _2306 = _1948 + _2304;
    bool _2308 = !_2122;
    int _2310 = _2308 ? _2212 : (-1);
    float _2312 = _2292 * _2216;
    int _2314 = _2296 * _2302;
    int _2316 = abs(_2246);
    float _2318 = _2312 * (-2.0);
    float _2320 = float(_1534);
    int _2322 = _2310 * _2272;
    int _2324 = _2322 + _2314;
    float _2326 = float(_2316);
    float _2328 = _905 + (-0.5);
    float _2330 = fma(_2306, _2306, _2290);
    float _2332 = fma(_2318, _2266, _2266);
    float _2334 = float(_2324);
    float _2336 = _2326 * _2320;
    float _2338 = fma(_1910, _2318, _1910);
    float _2340 = fma(_2328, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2332);
    bool _2342 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2344 = isnan(1.0);
    bool _2346 = _2342 || _2344;
    bool _2348 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2350 = _2346 || _2348;
    out.m_68.y = _2334;
    float _2352 = _1296 + _1065;
    bool _2354 = !_2062;
    int _2356 = _2354 ? 0 : 1;
    float _2358 = _2270;
    if (_1978)
    {
        return out;
    }
    float _2360 = -_2224;
    float _2362 = _1928 + _2360;
    float _2364 = -_2232;
    float _2366 = _1918 + _2364;
    int _2368 = abs(_2356);
    float _2370 = -_2288;
    float _2372 = _1526 + _2370;
    float _2374 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2376 = _2362 + _2374;
    float _2378 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2380 = _2366 + _2378;
    float _2382 = float(_1628);
    float _2384 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2386 = _2372 + _2384;
    float _2388 = _2376 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _2390 = !_2350;
    float _2392 = _2390 ? _125 : _1836;
    float _2394 = _2352 + (-1.0);
    float _2396 = _1296 + _905;
    float _2398 = fma(_2380, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2388);
    float _2400 = float(_2368);
    float _2402 = fma(_2392, _2338, _2340);
    float _2404 = fma(_2394, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2406 = fma(_2386, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2398);
    float _2408 = _2336 * (-2.0);
    float _2410 = _1065 + (-0.5);
    float _2412 = _2400 * _2382;
    float _2414 = fma(_2408, _2268, _2268);
    float _2416 = fma(_2404, _2408, _2404);
    bool _2418 = _2406 >= 0.0;
    float _2420 = _2396 + (-1.0);
    float _2422 = fma(_2410, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2414);
    float _2424 = _2412 * (-2.0);
    float _2426 = _1296 + (-0.5);
    float _2428 = fma(_2420, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2430 = fma(_2392, _2416, _2422);
    float _2432 = fma(_2424, _2270, _2270);
    float _2434 = _2402 * 0.15915493667125701904296875;
    float _2436 = sqrt(_2330);
    float _2438 = _2430 * 0.15915493667125701904296875;
    float _2440 = fma(_2426, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2432);
    float _2442 = fma(_2428, _2424, _2428);
    float _2444 = _2366;
    if (_2418)
    {
        _2358 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2446 = _2358;
    int _2448 = as_type<int>(_2446);
    if (_2418)
    {
        out.m_45.x = 0.0;
    }
    float _2450 = fma(_2392, _2442, _2440);
    float _2452 = _2434 * 6.283185482025146484375;
    float _2454 = sin(_2452);
    if (_2418)
    {
        float _2456 = _2446 * 5.0;
        _2448 = as_type<int>(_2456);
    }
    int _2458 = _2448;
    float _2460 = _2450 * 0.15915493667125701904296875;
    if (_2418)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7284 = as_type<float>(_2458);
        out.gl_Position.z = _7284;
    }
    float _2462 = _2434 * 6.283185482025146484375;
    float _2464 = cos(_2462);
    float _2466 = _2438 * 6.283185482025146484375;
    float _2468 = sin(_2466);
    float _2470 = _2438 * 6.283185482025146484375;
    float _2472 = cos(_2470);
    if (_2418)
    {
        return out;
    }
    float _2474 = _2460 * 6.283185482025146484375;
    float _2476 = cos(_2474);
    float _2478 = _2170 * _2436;
    float _2480 = _599 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2482 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _227);
    float _2484 = _2464 * _2472;
    float _2486 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _223);
    float _2488 = _2478 * _2480;
    float _2490 = _2168 * _2478;
    float _2492 = _2460 * 6.283185482025146484375;
    float _2494 = sin(_2492);
    float _2496 = _2464 * _2468;
    float _2498 = _2482 * _2488;
    float _2500 = _2454 * _2468;
    float _2502 = _2476 * _2498;
    float _2504 = _2486 * _2490;
    float _2506 = _2454 * _2472;
    float _2508 = _2468 * _2476;
    float _2510 = _2464 * _2502;
    float _2512 = _2472 * _2476;
    float _2514 = _2454 * _2502;
    float _2516 = fma(_2494, _2484, _2500);
    float _2518 = -_2498;
    float _2520 = _2494 * _2518;
    float _2522 = -_2506;
    float _2524 = fma(_2494, _2496, _2522);
    float _2526 = -_2496;
    float _2528 = fma(_2494, _2506, _2526);
    float _2530 = fma(_2516, _2504, _2510);
    float _2532 = _2478 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2534 = _2532 * 0.5;
    float _2536 = fma(_2512, _2504, _2520);
    float _2538 = fma(_2494, _2500, _2484);
    float _2540 = fma(_2528, _2504, _2514);
    float _2542 = fma(_2524, _2534, _2530);
    float _2544 = fma(_2508, _2534, _2536);
    float _2546 = fma(_2538, _2534, _2540);
    float _2548 = _2542 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2550 = _2542 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2552 = _2542 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2554 = fma(_2544, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2548);
    float _2556 = fma(_2544, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2550);
    float _2558 = fma(_2544, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2552);
    float _2560 = fma(_2546, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2554);
    float _2562 = fma(_2546, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2556);
    float _2564 = fma(_2546, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2558);
    float _2566 = _2560 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2568 = _2562 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2570 = _1526 + _2566;
    float _2572 = _1918 + _2568;
    float _2574 = _2564 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2576 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2578 = _2570 + _2576;
    float _2580 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2582 = _2572 + _2580;
    float _2584 = _1928 + _2574;
    float _2586 = _2578 * _2578;
    float _2588 = fma(_2582, _2582, _2586);
    float _2590 = sqrt(_2588);
    bool _2592 = _2590 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2594 = _2574;
    float _2596 = _2586;
    float _2598 = _2546;
    float _2600 = _2588;
    float _2602 = _2578;
    if (!_2592)
    {
        _2594 = _2572;
    }
    float _2604 = _2594;
    float _2606 = _2604;
    if (!_2592)
    {
        _2596 = _2570;
    }
    float _2608 = _2596;
    float _2610 = _2608;
    if (!_2592)
    {
        _2598 = _2584;
    }
    float _2612 = _2598;
    bool _2614 = !_2592;
    float _2616 = _2612;
    if (!_2614)
    {
        float _2618 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2620 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2622 = _2590 + _2620;
        float _2624 = rsqrt(_2588);
        float _2626 = _2622 * _2618;
        float _2628 = _2584 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2630 = _2626 * 0.15915493667125701904296875;
        float _2632 = _2630 * 6.283185482025146484375;
        float _2634 = cos(_2632);
        float _2636 = _2630 * 6.283185482025146484375;
        float _2638 = sin(_2636);
        float _2640 = _2634 + (-1.0);
        float _2642 = _2640 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2644 = fma(_2638, _2628, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2646 = fma(_2584, _2634, _2642);
        float _2648 = _2624 * _2644;
        float _2650 = fma(_2582, _2648, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2652 = fma(_2578, _2648, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2616 = _2646;
        _2606 = _2650;
        _2610 = _2652;
    }
    float _2654 = _2616;
    float _2656 = _2606;
    float _2658 = _2610;
    float _2660 = -_1928;
    float _2662 = _2660 + _2654;
    float _2664 = -_1918;
    float _2666 = _2664 + _2656;
    float _2668 = -_1526;
    float _2670 = _2668 + _2658;
    float _2672 = _2662 * _2662;
    float _2674 = fma(_2666, _2666, _2672);
    float _2676 = fma(_2670, _2670, _2674);
    float _2678 = sqrt(_2676);
    bool _2680 = _2678 > 0.0;
    float _2682 = _2678;
    float _2684 = _2674;
    float _2686 = _2654;
    float _2688 = _2656;
    float _2690 = _2662;
    if (!_2680)
    {
        _2682 = _2656;
    }
    float _2692 = _2682;
    float _2694 = _2692;
    float _2696 = _2692;
    if (!_2680)
    {
        _2684 = _2658;
    }
    float _2698 = _2684;
    bool _2700 = !_2680;
    float _2702 = _2698;
    float _2704 = _2698;
    if (!_2700)
    {
        bool _2706 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2708 = _2582;
        if (_2706)
        {
            float _2710 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2708 = _2710;
        }
        float _2712 = _2708;
        float _2714 = _2712;
        if (_2706)
        {
            float _2716 = _475 * _2712;
            _2600 = _2716;
        }
        float _2718 = _2600;
        float _2720 = _2718;
        if (_2706)
        {
            float _2722 = _477 * _2712;
            _2602 = _2722;
        }
        float _2724 = _2602;
        float _2726 = _2724;
        if (_2706)
        {
            float _2728 = _479 * _2712;
            _2714 = _2728;
        }
        float _2730 = _2714;
        float _2732 = _2730;
        if (!_2706)
        {
            bool _2734 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
            bool _2736 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
            bool _2738 = _2734 || _2736;
            bool _2740 = isnan(1.0);
            bool _2742 = _2738 || _2740;
            float _2744 = _125 + 1.0;
            if (!_2742)
            {
                float _2746 = _2744 * _2744;
                float _2748 = _2746 * 0.5;
                _127 = _2748;
            }
            float _2750 = _127;
            float _2752 = _2750;
            if (!_2742)
            {
                float _2754 = _2750 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2752 = _2754;
            }
            float _2756 = _2752;
            bool _2758 = !_2742;
            float _2760 = _2756;
            if (!_2758)
            {
                float _2762 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2764 = log2(_2762);
                float _2766 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2768 = 1.0 + _2766;
                float _2770 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2772 = _2764 * _2744;
                float _2774 = 1.0 / _2768;
                float _2776 = _2770 * 0.693147182464599609375;
                float _2778 = exp2(_2772);
                float _2780 = 1.0 / _2776;
                float _2782 = _2778 + (-1.0);
                float _2784 = -_2782;
                float _2786 = fma(_2784, _2780, _2744);
                float _2788 = _2786 * _2774;
                float _2790 = _2788 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2760 = _2790;
            }
            float _2792 = _2760;
            float _2794 = _2792 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _2796 = _2792 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2798 = _2792 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2800 = _2792;
            if (!_2742)
            {
                _2800 = _2744;
            }
            float _2802 = _2800;
            float _2804 = _2794 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
            float _2806 = _2794 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
            float _2808 = _2794 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
            float _2810 = fma(_2796, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2804);
            float _2812 = fma(_2796, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2806);
            float _2814 = fma(_2798, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2810);
            bool _2816 = !_2742;
            float _2818 = _2802;
            _2702 = _2812;
            if (!_2816)
            {
                float _2820 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2822 = log2(_2820);
                float _2824 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2826 = 1.0 + _2824;
                float _2828 = 1.0 / _2826;
                float _2830 = _2822 * _2744;
                float _2832 = exp2(_2830);
                float _2834 = -_2832;
                float _2836 = _2834 + 1.0;
                float _2838 = _2836 * _2828;
                _2818 = _2838;
            }
            float _2840 = _2818;
            float _2842 = fma(_2796, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2808);
            float _2844 = fma(_2798, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2812);
            float _2846 = fma(_2840, _165, _2814);
            float _2848 = fma(_2798, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2842);
            float _2850 = fma(_2840, _163, _2844);
            float _2852 = -_437;
            float _2854 = _2852 + _2846;
            float _2856 = fma(_2840, _167, _2848);
            float _2858 = -_443;
            float _2860 = _2858 + _2850;
            float _2862 = _2854 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _2864 = _2854 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _2866 = _2854 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _2868 = -_449;
            float _2870 = _2868 + _2856;
            float _2872 = fma(_2860, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2862);
            float _2874 = fma(_2860, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2864);
            float _2876 = fma(_2860, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2866);
            float _2878 = fma(_2870, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2872);
            float _2880 = fma(_2870, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2874);
            float _2882 = fma(_2870, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2876);
            _483 = _2880;
            _485 = _2878;
            _487 = _2882;
            _2720 = _2878;
            _2726 = _2880;
            _2732 = _2882;
            _2694 = _2848;
            _489 = _2874;
        }
        float _2884 = _483;
        float _2886 = _485;
        float _2888 = _487;
        float _2890 = _2720;
        float _2892 = _2726;
        float _2894 = _2732;
        float _2896 = _2702;
        float _2898 = _2694;
        float _2900 = _489;
        float _2902 = _2884 * _2884;
        float _2904 = rsqrt(_2676);
        float _2906 = fma(_2886, _2886, _2902);
        float _2908 = fma(_2888, _2888, _2906);
        float _2910 = sqrt(_2908);
        float _2912 = _2666 * _2904;
        float _2914 = _2662 * _2904;
        float _2916 = _2670 * _2904;
        bool _2918 = _2910 > 0.0;
        float _2920 = _2898;
        float _2922 = _2896;
        _491 = _2900;
        if (!_2918)
        {
            _2920 = _2656;
        }
        float _2924 = _2920;
        _2696 = _2924;
        if (!_2918)
        {
            _2922 = _2658;
        }
        float _2926 = _2922;
        bool _2928 = !_2918;
        _2704 = _2926;
        if (!_2928)
        {
            float _2930 = rsqrt(_2908);
            float _2932 = _2930 * _2884;
            float _2934 = _2930 * _2886;
            float _2936 = _2930 * _2888;
            float _2938 = _2914 * _2932;
            float _2940 = fma(_2912, _2934, _2938);
            float _2942 = fma(_2916, _2936, _2940);
            float _2944 = _2942 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2946 = fma(_2890, _2944, _2656);
            float _2948 = fma(_2892, _2944, _2654);
            float _2950 = fma(_2894, _2944, _2658);
            _2704 = _2950;
            _2686 = _2948;
            _2696 = _2946;
        }
    }
    float _2952 = _2704;
    float _2954 = _2686;
    float _2956 = _2696;
    float _2958 = _491;
    float _2960 = _2362 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _2962 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2964 = isnan(0.5);
    bool _2966 = _2962 || _2964;
    bool _2968 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2970 = _2966 || _2968;
    float _2972 = fma(_2366, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2960);
    bool _2974 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2976 = isnan(0.5);
    bool _2978 = _2974 || _2976;
    bool _2980 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2982 = _2978 || _2980;
    float _2984 = fma(_2372, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2972);
    float _2986 = _2362 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2988 = _2984 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2990 = fma(_2366, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2986);
    float _2992 = 1.0 / _2988;
    float _2994 = fma(_2372, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2990);
    float _2996 = _2954;
    float _2998 = _2958;
    if (_2982)
    {
        _2688 = 1.0;
    }
    float _3000 = _2688;
    float _3002 = _2994 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3004 = _3002 + _2988;
    float _3006 = -_2288;
    float _3008 = _3006 + _2952;
    float _3010 = _3004 * _2992;
    float _3012 = _3010 * 0.5;
    float _3014 = -_2224;
    float _3016 = _3014 + _2954;
    float _3018 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3020 = fma(_3012, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3018);
    float _3022 = -_2232;
    float _3024 = _3022 + _2956;
    float _3026 = 1.0 / _3020;
    float _3028 = _3016;
    float _3030 = _3024;
    float _3032 = _3008;
    float _3034 = _3000;
    if (!_2970)
    {
        float _3036 = _2376 * _2376;
        float _3038 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3040 = -_1526;
        float _3042 = _3040 + _2952;
        float _3044 = fma(_2380, _2380, _3036);
        float _3046 = fma(_2386, _2386, _3044);
        float _3048 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3050 = sqrt(_3046);
        float _3052 = 1.0 / _2478;
        float _3054 = _3048 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3056 = precise::min(_3050, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3058 = _3056 * _3038;
        float _3060 = _3058 * _3052;
        float _3062 = -_1918;
        float _3064 = _3062 + _2956;
        float _3066 = -_1928;
        float _3068 = _3066 + _2954;
        float _3070 = _3054 * _3060;
        float _3072 = _3042 * _3060;
        float _3074 = fma(_3064, _3070, _2366);
        float _3076 = fma(_3068, _3070, _2362);
        float _3078 = fma(_3054, _3072, _2372);
        _2690 = _3060;
        _3028 = _3076;
        _3030 = _3074;
        _3032 = _3078;
    }
    float _3080 = _2690;
    float _3082 = _3028;
    float _3084 = _3030;
    float _3086 = _3032;
    float _3088 = _3080;
    if (_2982)
    {
        _3088 = 1.0;
    }
    float _3090 = _3088;
    float _3092 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3094 = _3026 * _3092;
    float _3096 = _3090;
    if (!_2982)
    {
        float _3098 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3100 = _3098 * 0.15915493667125701904296875;
        float _3102 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3104 = _3100 * 6.283185482025146484375;
        float _3106 = cos(_3104);
        float _3108 = _3102 * 0.15915493667125701904296875;
        float _3110 = _3100 * 6.283185482025146484375;
        float _3112 = sin(_3110);
        float _3114 = 1.0 / _3106;
        float _3116 = _3108 * 6.283185482025146484375;
        float _3118 = cos(_3116);
        float _3120 = _3112 * _3114;
        float _3122 = _3108 * 6.283185482025146484375;
        float _3124 = sin(_3122);
        float _3126 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3128 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3126;
        float _3130 = _3118 * _3120;
        float _3132 = 1.0 / _3128;
        float _3134 = 1.0 / _3130;
        float _3136 = _3124 * _3134;
        float _3138 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3140 = fma(_3094, _3136, _3138);
        float _3142 = _3140 * _3132;
        float _3144 = precise::clamp(_3142, 0.0, 1.0);
        _2444 = _3132;
        _2996 = _3100;
        _3034 = _3144;
    }
    float _3146 = _2444;
    float _3148 = _2996;
    float _3150 = _3034;
    float _3152 = _3146;
    float _3154 = _3148;
    if (!_2982)
    {
        float _3156 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3158 = _3156 * 0.15915493667125701904296875;
        float _3160 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3162 = _3158 * 6.283185482025146484375;
        float _3164 = cos(_3162);
        float _3166 = _3160 * 0.15915493667125701904296875;
        float _3168 = _3158 * 6.283185482025146484375;
        float _3170 = sin(_3168);
        float _3172 = 1.0 / _3164;
        float _3174 = _3166 * 6.283185482025146484375;
        float _3176 = cos(_3174);
        float _3178 = _3170 * _3172;
        float _3180 = _3166 * 6.283185482025146484375;
        float _3182 = sin(_3180);
        float _3184 = _3176 * _3178;
        float _3186 = 1.0 / _3184;
        float _3188 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3190 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _3188;
        float _3192 = 1.0 / _3190;
        float _3194 = _3182 * _3186;
        float _3196 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3198 = fma(_3094, _3194, _3196);
        float _3200 = _3198 * _3192;
        float _3202 = precise::clamp(_3200, 0.0, 1.0);
        float _3204 = -_3202;
        float _3206 = _3204 + 1.0;
        _3152 = _3186;
        _3154 = _3184;
        _3096 = _3206;
    }
    float _3208 = _3152;
    float _3210 = _3154;
    float _3212 = _3096;
    float _3214 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3216 = _3082 + _3214;
    float _3218 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3220 = _3084 + _3218;
    float _3222 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3224 = _3086 + _3222;
    float _3226 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3228 = _3216 * _3216;
    float _3230 = fma(_3220, _3220, _3228);
    float _3232 = fma(_3224, _3224, _3230);
    float _3234 = rsqrt(_3232);
    float _3236 = sqrt(_3232);
    float _3238 = _3234 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3240 = _3220 * _3238;
    float _3242 = _3224 * _3238;
    float _3244 = _3240 * _3240;
    float _3246 = _3242 * _3242;
    float _3248 = _3244 + _3246;
    float _3250 = sqrt(_3248);
    bool _3252 = _3250 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3254 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3256 = _3250 + _3254;
    float _3258 = _3224;
    float _3260 = _3210;
    float _3262 = _3256;
    float _3264 = _3208;
    float _3266 = _3216;
    if (_3252)
    {
        float _3268 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3258 = _3268;
    }
    float _3270 = _3258;
    if (_3252)
    {
        float _3272 = rsqrt(_3248);
        _3260 = _3272;
    }
    float _3274 = _3260;
    float _3276 = _3274;
    if (_3252)
    {
        float _3278 = _3256 * _3270;
        _3262 = _3278;
    }
    float _3280 = _3262;
    if (_3252)
    {
        float _3282 = _3280 * 0.15915493667125701904296875;
        _3264 = _3282;
    }
    float _3284 = _3264;
    float _3286 = _3234;
    if (_3252)
    {
        float _3288 = _3284 * 6.283185482025146484375;
        float _3290 = sin(_3288);
        _3286 = _3290;
    }
    float _3292 = _3286;
    float _3294 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3296 = precise::max(0.0, _3294);
    float _3298 = _3228;
    float _3300 = _3296;
    float _3302 = _3294;
    if (_3252)
    {
        float _3304 = _3284 * 6.283185482025146484375;
        float _3306 = cos(_3304);
        _3298 = _3306;
    }
    float _3308 = _3298;
    float _3310 = -_3238;
    float _3312 = -_3296;
    float _3314 = fma(_3216, _3310, _3312);
    if (!_3252)
    {
        _3266 = _3244;
    }
    float _3316 = _3266;
    float _3318 = _3316;
    if (_3252)
    {
        float _3320 = _3314 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3300 = _3320;
    }
    float _3322 = _3300;
    float _3324 = _3082 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3326 = _3322;
    float _3328 = _3292;
    if (_3252)
    {
        float _3330 = fma(_3292, _3322, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3326 = _3330;
    }
    float _3332 = _3326;
    float _3334 = _3332;
    if (!_3252)
    {
        _3328 = _3240;
    }
    float _3336 = _3328;
    float _3338 = _3336;
    float _3340 = _3308;
    if (_3252)
    {
        float _3342 = _3308 + (-1.0);
        _3302 = _3342;
    }
    float _3344 = _3302;
    float _3346 = _3344;
    if (_3252)
    {
        float _3348 = _3274 * _3332;
        _2998 = _3348;
    }
    float _3350 = _2998;
    if (!_3252)
    {
        _3334 = _3314;
    }
    float _3352 = _3334;
    float _3354 = _3352;
    if (_3252)
    {
        float _3356 = _3344 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3276 = _3356;
    }
    float _3358 = _3276;
    if (_3252)
    {
        float _3360 = _3240 * _3350;
        _3338 = _3360;
    }
    float _3362 = _3338;
    if (!_3252)
    {
        _3346 = _3242;
    }
    float _3364 = _3346;
    float _3366 = _3364;
    if (_3252)
    {
        float _3368 = _3242 * _3350;
        _3366 = _3368;
    }
    float _3370 = _3366;
    if (_3252)
    {
        float _3372 = fma(_3314, _3308, _3358);
        _3354 = _3372;
    }
    float _3374 = _3354;
    if (_3252)
    {
        float _3376 = _3362 * _3362;
        _3318 = _3376;
    }
    float _3378 = _3318;
    if (!_3252)
    {
        _3340 = _3246;
    }
    float _3380 = _3340;
    float _3382 = _3380;
    if (_3252)
    {
        float _3384 = _3370 * _3370;
        _3382 = _3384;
    }
    float _3386 = _3382;
    float _3388 = fma(_3374, _3374, _3378);
    float _3390 = _3388 + _3386;
    float _3392 = fma(_3084, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3324);
    float _3394 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3396 = fma(_3236, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3394);
    float _3398 = precise::clamp(_3396, 0.0, 1.0);
    float _3400 = _3082 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3402 = _3082 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3404 = _3082 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3406 = rsqrt(_3390);
    float _3408 = -_3398;
    float _3410 = _3408 + 1.0;
    float _3412 = fma(_3084, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3400);
    float _3414 = fma(_3084, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3402);
    float _3416 = fma(_3084, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3404);
    float _3418 = fma(_3086, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3392);
    float _3420 = fma(_3086, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3412);
    float _3422 = fma(_3086, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3414);
    float _3424 = abs(_3410);
    float _3426 = log2(_3424);
    float _3428 = fma(_3086, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3416);
    float _3430 = _3420 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3432 = _3422 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3434 = _3418 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3436 = _3428 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3438 = _3430 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3440 = _3406 * _3362;
    float _3442 = _3406 * _3374;
    float _3444 = fma(_3432, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3438);
    float _3446 = _3406 * _3370;
    float _3448 = _3440 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3450 = _3434 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3452 = fma(_3434, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3444);
    float _3454 = _3430 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3456 = -_3448;
    float _3458 = fma(_3442, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3456);
    float _3460 = _3426 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3462 = -_3450;
    float _3464 = fma(_3462, _3226, 1.0);
    float _3466 = fma(_3436, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3452);
    float _3468 = -_3446;
    float _3470 = fma(_3468, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3458);
    float _3472 = _3430 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3474 = fma(_3432, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3454);
    float _3476 = exp2(_3460);
    float _3478 = fma(_3470, -0.5, 0.5);
    float _3480 = fma(_3432, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3472);
    float _3482 = fma(_3470, 0.5, 0.5);
    float _3484 = fma(_3434, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3474);
    float _3486 = _3442 + 1.0;
    float _3488 = fma(_3434, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3480);
    float _3490 = fma(_3482, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3492 = log2(_3464);
    float _3494 = fma(_3436, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3484);
    float _3496 = fma(_3436, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3488);
    float _3498 = fma(_3482, _3490, -0.212114393711090087890625);
    float _3500 = fma(_3482, _3498, 1.570728778839111328125);
    float _3502 = 1.0 / _3466;
    float _3504 = -_3442;
    float _3506 = fma(_3476, _3486, _3504);
    float _3508 = fma(_3506, 0.5, 0.5);
    float _3510 = sqrt(_3478);
    float _3512 = _3492 * 0.693147182464599609375;
    float _3514 = _3512 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3516 = _3494 * _3502;
    float _3518 = _3496 * _3502;
    float _3520 = fma(_3516, 0.5, 0.5);
    float _3522 = fma(_3518, -0.5, 0.5);
    float _3524 = _3510 * 0.636619746685028076171875;
    float3 _8934 = float3(_3520, _3522, _3514);
    float _3526 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8934, float3(0.0), isnan(_8934)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8934, float3(0.0), isnan(_8934)), level(0.0)).x;
    float3 _8945 = float3(_3520, _3522, _3514);
    float4 _3529 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8945, float3(0.0), isnan(_8945)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8945, float3(0.0), isnan(_8945)), level(0.0)).xyzw;
    float _3531 = _3529.x;
    float _3533 = _3529.y;
    float _3535 = _3529.z;
    float _3537 = _3529.w;
    float _3539 = -_3500;
    float _3541 = fma(_3524, _3539, 1.0);
    float2 _8967 = float2(_3541, _3508);
    float3 _3545 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8967, float2(0.0), isnan(_8967)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8967, float2(0.0), isnan(_8967)), level(0.0)).xyz;
    float _3547 = _3545.x;
    float _3549 = _3545.y;
    float _3551 = _3545.z;
    float _3553 = _3426 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3555 = _3430 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _3557 = _3150 > 0.0;
    bool _3559 = isnan(_3150);
    bool _3561 = _3557 || _3559;
    bool _3563 = isnan(0.0);
    bool _3565 = _3561 || _3563;
    float _3567 = fma(_3432, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3555);
    float _3569 = exp2(_3553);
    bool _3571 = _3212 <= 0.0;
    bool _3573 = !_3565;
    bool _3575 = _3571 || _3573;
    float _3577 = fma(_3434, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3567);
    float _3579 = _3150 * _3212;
    float _3581 = _3466 * 0.5;
    float _3583 = fma(_3436, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3577);
    float _3585 = _3494 + _3466;
    float _3587 = _3579 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3589 = fma(_3496, -0.5, _3581);
    float _3591 = _3583 + _3466;
    float _3593 = _3585 * 0.5;
    out.gl_Position.x = _3494;
    out.gl_Position.y = _3496;
    out.gl_Position.z = _3583;
    out.gl_Position.w = _3466;
    float _3595 = _3587 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3597 = _3591 * 0.5;
    float _3599 = -_3569;
    float _3601 = _3599 + 1.0;
    out.m_45.x = _3595;
    float _3603 = _3601 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_70.x = _3593;
    out.m_70.y = _3589;
    out.m_70.z = _3597;
    out.m_70.w = _3466;
    float _3605 = -_3603;
    float _3607 = _3605 + 1.0;
    float _3609 = _3603 * _3526;
    float _3611 = _3537 * _3607;
    float _3613 = _3537 * _3609;
    float _3615 = _3551 * _3609;
    float _3617 = fma(_3547, _3613, _3531);
    float _3619 = fma(_3549, _3613, _3533);
    float _3621 = fma(_3537, _3615, _3535);
    out.m_72.x = _3617;
    out.m_72.y = _3619;
    out.m_72.z = _3621;
    out.m_72.w = _3611;
    if (!_3575)
    {
        return out;
    }
    float _3623 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_45.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3623;
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
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _887 = false;
    bool _763 = false;
    bool _621 = false;
    bool _511 = false;
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
        float _3680 = as_type<float>(_107);
        out.gl_Position.z = _3680;
    }
    if (!_95)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _3750 = as_type<float>(_145);
        out.gl_Position.z = _3750;
    }
    if (_137)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _147 = as_type<float>(int(gl_VertexIndex));
    float _149 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _151 = in.m_52.w;
    bool _153 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _155 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _157 = _153 || _155;
    bool _159 = isnan(1.0);
    bool _161 = _157 || _159;
    float _163 = in.m_47.x;
    float _165 = in.m_47.y;
    float _167 = in.m_47.z;
    float _169 = in.m_42.x;
    float _171 = in.m_42.y;
    float _173 = in.m_42.z;
    int _175 = as_type<int>(_147) & 1;
    bool _177 = _175 != 0;
    int _179 = as_type<int>(_147) & 2;
    bool _181 = _179 != 0;
    int _183 = int(_177);
    int _185 = _181 ? 2 : 0;
    int _187 = _183 | _185;
    int _189 = _161 ? 4 : 0;
    int _191 = _187 | _189;
    int _193 = false ? 8 : 0;
    int _195 = _191 | _193;
    int _197 = false ? 16 : 0;
    int _199 = _195 | _197;
    int _201 = false ? 32 : 0;
    int _203 = _199 | _201;
    int _205 = false ? 64 : 0;
    int _207 = _203 | _205;
    int _209 = _207 & 4;
    float _211 = as_type<float>(_209);
    float _213 = _149;
    if (!_161)
    {
        float _215 = _149 * _149;
        float _217 = _215 * 0.5;
        _211 = _217;
    }
    float _219 = _211;
    bool _221 = !_177;
    float _223 = _221 ? (-0.5) : 0.5;
    bool _225 = !_181;
    float _227 = _225 ? (-0.5) : 0.5;
    float _229 = _219;
    if (!_161)
    {
        float _231 = _219 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _229 = _231;
    }
    float _233 = _229;
    bool _235 = !_161;
    float _237 = _233;
    float _239 = 0.0;
    if (!_235)
    {
        float _241 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _243 = log2(_241);
        float _245 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _247 = _245 + 1.0;
        float _249 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _251 = _149 * _243;
        float _253 = exp2(_251);
        float _255 = _249 * 0.693147182464599609375;
        float _257 = 1.0 / _255;
        float _259 = 1.0 / _247;
        float _261 = _253 + (-1.0);
        float _263 = -_261;
        float _265 = fma(_263, _257, _149);
        float _267 = _265 * _259;
        float _269 = _267 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _237 = _269;
        _239 = _247;
    }
    float _271 = _237;
    float _273 = _239;
    float _275 = _271 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _277 = !_161;
    float _279 = _273;
    float _281 = _271;
    if (!_277)
    {
        float _283 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _285 = log2(_283);
        float _287 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _289 = _287 + 1.0;
        float _291 = 1.0 / _289;
        float _293 = _149 * _285;
        float _295 = exp2(_293);
        float _297 = -_295;
        float _299 = _297 + 1.0;
        float _301 = _299 * _291;
        _279 = _291;
        _213 = _301;
    }
    float _303 = _279;
    float _305 = _213;
    float _307 = _275 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _309 = _275 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _311 = _271 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _313 = _275 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _315 = _303;
    if (!_161)
    {
        float _317 = _125 * _125;
        float _319 = _317 * 0.5;
        _315 = _319;
    }
    float _321 = _315;
    float _323 = fma(_311, (*spvDescriptorSet0.vp_c10)._m0[8].x, _307);
    float _325 = fma(_311, (*spvDescriptorSet0.vp_c10)._m0[8].y, _309);
    float _327 = fma(_311, (*spvDescriptorSet0.vp_c10)._m0[8].z, _313);
    float _329 = _271 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_161)
    {
        float _331 = _321 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _281 = _331;
    }
    float _333 = _281;
    bool _335 = !_161;
    float _337 = _333;
    if (!_335)
    {
        float _339 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _341 = log2(_339);
        float _343 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _345 = _343 + 1.0;
        float _347 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _349 = _125 * _341;
        float _351 = exp2(_349);
        float _353 = _347 * 0.693147182464599609375;
        float _355 = 1.0 / _353;
        float _357 = 1.0 / _345;
        float _359 = _351 + (-1.0);
        float _361 = -_359;
        float _363 = fma(_361, _355, _125);
        float _365 = _363 * _357;
        float _367 = _365 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _337 = _367;
    }
    float _369 = _337;
    float _371 = _369 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _373 = fma(_329, (*spvDescriptorSet0.vp_c10)._m0[10].x, _323);
    float _375 = fma(_329, (*spvDescriptorSet0.vp_c10)._m0[10].y, _325);
    float _377 = _369 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _379 = _371 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _381 = _371 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _383 = _371 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _385 = fma(_329, (*spvDescriptorSet0.vp_c10)._m0[10].z, _327);
    float _387 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[8].x, _379);
    float _389 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[8].y, _381);
    float _391 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[8].z, _383);
    float _393 = _369 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _395 = fma(_305, _163, _373);
    float _397 = fma(_305, _165, _375);
    float _399 = fma(_305, _167, _385);
    float _401 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[10].x, _387);
    float _403 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[10].y, _389);
    float _405 = fma(_393, (*spvDescriptorSet0.vp_c10)._m0[10].z, _391);
    float _407 = _393;
    if (!_161)
    {
        _407 = _125;
    }
    float _409 = _407;
    bool _411 = !_161;
    float _413 = _409;
    if (!_411)
    {
        float _415 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _417 = log2(_415);
        float _419 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _421 = _419 + 1.0;
        float _423 = 1.0 / _421;
        float _425 = _125 * _417;
        float _427 = exp2(_425);
        float _429 = -_427;
        float _431 = _429 + 1.0;
        float _433 = _431 * _423;
        _413 = _433;
    }
    float _435 = _413;
    float _437 = fma(_435, _165, _403);
    bool _439 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _441 = fma(_397, _151, _171);
    float _443 = fma(_435, _163, _401);
    float _445 = -_437;
    float _447 = _397 + _445;
    float _449 = fma(_435, _167, _405);
    float _451 = fma(_395, _151, _169);
    float _453 = -_443;
    float _455 = _395 + _453;
    float _457 = _447 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _459 = _447 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _461 = _447 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _463 = -_449;
    float _465 = _399 + _463;
    float _467 = fma(_455, (*spvDescriptorSet0.vp_c10)._m0[4].x, _457);
    float _469 = fma(_455, (*spvDescriptorSet0.vp_c10)._m0[5].x, _459);
    float _471 = fma(_455, (*spvDescriptorSet0.vp_c10)._m0[6].x, _461);
    float _473 = fma(_399, _151, _173);
    float _475 = fma(_465, (*spvDescriptorSet0.vp_c10)._m0[4].z, _467);
    float _477 = fma(_465, (*spvDescriptorSet0.vp_c10)._m0[5].z, _469);
    float _479 = fma(_465, (*spvDescriptorSet0.vp_c10)._m0[6].z, _471);
    bool _481 = !_439;
    float _483 = _477;
    float _485 = _475;
    float _487 = _479;
    float _489 = _449;
    float _491 = _449;
    float _509;
    if (!_481)
    {
        float _493 = in.m_54.x;
        float _495 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _497 = _493 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _499 = fma(_497, (*spvDescriptorSet0.vp_c9)._m0[12].x, _125);
        float _501 = _499 * _495;
        float _503 = floor(_501);
        float _505 = -_503;
        float _507 = _501 + _505;
        _509 = _507;
        _511 = true;
    }
    else
    {
        float _513 = float(_91);
        float _515 = 1.0 / _513;
        float _517 = _125 * _515;
        _509 = _517;
    }
    _511 = false;
    float _519 = _509;
    float _521 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _523 = _519 + _521;
    float _525 = in.m_52.x;
    float _527 = in.m_52.y;
    bool _529 = _519 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _531 = isnan(_519);
    bool _533 = _529 || _531;
    bool _535 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _537 = _533 || _535;
    float _539 = float(_537);
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _543 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _541;
    bool _545 = _519 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _547 = isnan(_519);
    bool _549 = _545 || _547;
    bool _551 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _553 = _549 || _551;
    float _555 = float(_553);
    float _557 = -_539;
    float _559 = _557 + 1.0;
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _563 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _561;
    float _565 = 1.0 / _543;
    bool _567 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _569 = _555 * _559;
    float _571 = -_555;
    float _573 = _571 + 1.0;
    float _575 = _523 * _565;
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _579 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _577;
    float _581 = fma(_563, _575, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _583 = fma(_579, _575, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _585 = _581 * _569;
    float _587 = _583 * _569;
    float _589 = fma(_573, (*spvDescriptorSet0.vp_c9)._m0[143].x, _585);
    float _591 = fma(_573, (*spvDescriptorSet0.vp_c9)._m0[143].y, _587);
    float _593 = fma(_539, (*spvDescriptorSet0.vp_c9)._m0[144].x, _589);
    float _595 = fma(_539, (*spvDescriptorSet0.vp_c9)._m0[144].y, _591);
    float _597 = _593 * _525;
    float _599 = _595 * _527;
    bool _601 = !_567;
    float _619;
    if (!_601)
    {
        float _603 = in.m_54.x;
        float _605 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _607 = _603 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _609 = fma(_607, (*spvDescriptorSet0.vp_c9)._m0[11].y, _125);
        float _611 = _609 * _605;
        float _613 = floor(_611);
        float _615 = -_613;
        float _617 = _611 + _615;
        _619 = _617;
        _621 = true;
    }
    else
    {
        float _623 = float(_91);
        float _625 = 1.0 / _623;
        float _627 = _125 * _625;
        _619 = _627;
    }
    _621 = false;
    float _629 = _619;
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _633 = _629 + _631;
    float _635 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _637 = _635 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _639 = _629 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _641 = isnan(_629);
    bool _643 = _639 || _641;
    bool _645 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _647 = _643 || _645;
    float _649 = float(_647);
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _653 = _651 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _655 = _629 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _657 = isnan(_629);
    bool _659 = _655 || _657;
    bool _661 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _663 = _659 || _661;
    float _665 = float(_663);
    float _667 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _669 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _667;
    bool _671 = _629 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _673 = isnan(_629);
    bool _675 = _671 || _673;
    bool _677 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _679 = _675 || _677;
    float _681 = float(_679);
    float _683 = 1.0 / _637;
    float _685 = -_649;
    float _687 = _685 + 1.0;
    bool _689 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _691 = _665 * _687;
    float _693 = -_665;
    float _695 = _693 + 1.0;
    float _697 = 1.0 / _653;
    float _699 = _669 * _683;
    float _701 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _703 = _701 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _705 = fma(_699, _633, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _707 = -_681;
    float _709 = _707 + 1.0;
    float _711 = _705 * _691;
    float _713 = _703 * _697;
    float _715 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _717 = _629 + _715;
    float _719 = _649 * _709;
    float _721 = fma(_695, (*spvDescriptorSet0.vp_c9)._m0[115].x, _711);
    float _723 = fma(_713, _717, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _725 = fma(_723, _719, _721);
    float _727 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _729 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _731 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _733 = fma(_681, (*spvDescriptorSet0.vp_c9)._m0[117].x, _725);
    float _735 = _729 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _737 = _727 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _739 = _731 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _741 = _733 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_56.x = _737;
    out.m_56.y = _735;
    out.m_56.z = _739;
    out.m_56.w = _741;
    bool _743 = !_689;
    float _761;
    if (!_743)
    {
        float _745 = in.m_54.x;
        float _747 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _749 = _745 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _751 = fma(_749, (*spvDescriptorSet0.vp_c9)._m0[11].z, _125);
        float _753 = _751 * _747;
        float _755 = floor(_753);
        float _757 = -_755;
        float _759 = _753 + _757;
        _761 = _759;
        _763 = true;
    }
    else
    {
        float _765 = float(_91);
        float _767 = 1.0 / _765;
        float _769 = _125 * _767;
        _761 = _769;
    }
    _763 = false;
    float _771 = _761;
    float _773 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _775 = _771 + _773;
    bool _777 = _771 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _779 = isnan(_771);
    bool _781 = _777 || _779;
    bool _783 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _785 = _781 || _783;
    float _787 = float(_785);
    float _789 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _791 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _789;
    bool _793 = _771 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _795 = isnan(_771);
    bool _797 = _793 || _795;
    bool _799 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _801 = _797 || _799;
    float _803 = float(_801);
    float _805 = -_787;
    float _807 = _805 + 1.0;
    float _809 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _811 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _809;
    float _813 = 1.0 / _791;
    bool _815 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _817 = _803 * _807;
    float _819 = -_803;
    float _821 = _819 + 1.0;
    float _823 = _775 * _813;
    float _825 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _827 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _825;
    float _829 = fma(_811, _823, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _831 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _833 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _831;
    float _835 = fma(_827, _823, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _837 = _829 * _817;
    float _839 = fma(_833, _823, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _841 = _835 * _817;
    float _843 = fma(_821, (*spvDescriptorSet0.vp_c9)._m0[123].x, _837);
    float _845 = _839 * _817;
    float _847 = fma(_821, (*spvDescriptorSet0.vp_c9)._m0[123].z, _841);
    float _849 = fma(_821, (*spvDescriptorSet0.vp_c9)._m0[123].y, _845);
    float _851 = fma(_787, (*spvDescriptorSet0.vp_c9)._m0[124].x, _843);
    float _853 = fma(_787, (*spvDescriptorSet0.vp_c9)._m0[124].z, _847);
    float _855 = fma(_787, (*spvDescriptorSet0.vp_c9)._m0[124].y, _849);
    bool _857 = !_815;
    float _881;
    float _883;
    float _885;
    if (!_857)
    {
        float _859 = in.m_54.x;
        float _861 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _863 = float(_91);
        float _865 = 1.0 / _863;
        float _867 = _859 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _869 = _125 * _865;
        float _871 = fma(_867, (*spvDescriptorSet0.vp_c9)._m0[11].w, _125);
        float _873 = _871 * _861;
        float _875 = floor(_873);
        float _877 = -_875;
        float _879 = _873 + _877;
        _881 = _869;
        _883 = _879;
        _885 = _863;
        _887 = true;
    }
    else
    {
        float _889 = float(_91);
        float _891 = 1.0 / _889;
        float _893 = _125 * _891;
        _881 = _893;
        _883 = _893;
        _885 = _889;
    }
    _887 = false;
    float _895 = _881;
    float _897 = _883;
    float _899 = _885;
    float _901 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _903 = int(_901);
    float _905 = in.m_54.x;
    float _907 = _441 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _909 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _911 = _909 != 0;
    float _913 = _441 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _915 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _917 = int(_915);
    bool _919 = !_911;
    float _921 = _919 ? 1.2345600128173828125 : 1.0;
    float _923 = fma(_451, (*spvDescriptorSet0.vp_c10)._m0[5].x, _907);
    float _925 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _927 = _895 + _925;
    float _929 = fma(_473, (*spvDescriptorSet0.vp_c10)._m0[5].z, _923);
    float _931 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _933 = log2(_931);
    float _935 = float(_903);
    float _937 = _817;
    float _939 = _935;
    float _941 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (!_911)
    {
        float _943 = in.m_54.y;
        _937 = _943;
    }
    float _945 = _937;
    float _947 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _949 = _947 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _951 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _953 = _951 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _955 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _957 = _955 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _959 = 1.0 / _935;
    float _961 = float(uint(_917));
    float _963 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _965 = _963 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _967 = float(_917);
    float _969 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _971 = _969 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    int _973 = ~_917;
    int _975 = _973 + 1;
    float _977 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _979 = _895 + _977;
    bool _981 = _917 == 0;
    float _983 = 1.0 / _961;
    float _985 = _855 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _987 = _851 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _989 = _897 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _991 = isnan(_897);
    bool _993 = _989 || _991;
    bool _995 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _997 = _993 || _995;
    float _999 = float(_997);
    float _1001 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _1003 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _1001;
    bool _1005 = _895 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1007 = isnan(_895);
    bool _1009 = _1005 || _1007;
    bool _1011 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _1013 = _1009 || _1011;
    float _1015 = float(_1013);
    float _1017 = _125 * _959;
    float _1019 = 1.0 / _949;
    if (!_911)
    {
        _939 = _945;
    }
    float _1021 = _939;
    float _1023 = -_1015;
    float _1025 = _1023 + 1.0;
    bool _1027 = _895 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1029 = isnan(_895);
    bool _1031 = _1027 || _1029;
    bool _1033 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1035 = _1031 || _1033;
    float _1037 = float(_1035);
    float _1039 = _1021;
    if (!_911)
    {
        _941 = _1021;
    }
    float _1041 = _941;
    float _1043 = trunc(_1017);
    int _1045 = int(_1043);
    int _1047 = as_type<int>(_983) + (-2);
    float _1049 = _1037 * _1025;
    int _1051 = ~_917;
    int _1053 = _1051 + 1;
    float _1055 = _1041;
    float _1057 = _945;
    if (_911)
    {
        float _1059 = in.m_54.x;
        float _1061 = in.m_54.y;
        _1055 = _1059;
        _1057 = _1061;
    }
    float _1063 = _1055;
    float _1065 = _1057;
    float _1067 = 0.0;
    if (_911)
    {
        _1067 = _905;
    }
    float _1069 = _1067;
    float _1071 = 1.0 / _953;
    float _1073 = float(uint(_1045));
    float _1075 = 1.0 / _957;
    float _1077 = as_type<float>(_1047) * _1073;
    float _1079 = trunc(_1077);
    float _1081 = precise::max(_1079, 0.0);
    uint _1084 = uint(_1081);
    float _1086 = _1065 * 2.0;
    float _1088 = _1069;
    if (_911)
    {
        _1039 = _1065;
    }
    float _1090 = _1039;
    float _1092 = 1.0 / _965;
    int _1094 = _1053 * int(_1084);
    int _1096 = _1094 + _1045;
    float _1098 = 1.0 / _971;
    float _1100 = float(uint(_1096));
    float _1102 = _1003 * _1092;
    float _1104 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1106 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1104;
    float _1108 = as_type<float>(_1047) * _1100;
    float _1110 = float(_1045);
    bool _1112 = _1110 >= _967;
    bool _1114 = isnan(_1110);
    bool _1116 = _1112 || _1114;
    bool _1118 = isnan(_967);
    bool _1120 = _1116 || _1118;
    float _1122 = float(_1120);
    float _1124 = trunc(_1108);
    float _1126 = precise::max(_1124, 0.0);
    uint _1128 = uint(_1126);
    bool _1130 = !_911;
    float _1132 = _1130 ? _1065 : _905;
    float _1134 = _1132 * _921;
    float _1136 = trunc(_1122);
    int _1138 = int(_1136);
    int _1140 = int(_1084) + int(_1128);
    float _1142 = floor(_1134);
    int _1144 = _975 * _1140;
    int _1146 = _1144 + _1045;
    int _1148 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1150 = _1148 != 0;
    float _1152 = 1.0 / _899;
    bool _1154 = uint(_1146) >= uint(_917);
    bool _1156 = !_1154;
    int _1158 = _1156 ? 0 : (-1);
    int _1160 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1162 = _1160 != 0;
    int _1164 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1166 = _1164 != 0;
    int _1168 = ~_1140;
    int _1170 = _1168 + _1158;
    int _1172 = _1170 + 1;
    float _1174 = -_1142;
    float _1176 = _1134 + _1174;
    int _1178 = ~_1138;
    int _1180 = _1178 + 1;
    int _1182 = _1180 + 1;
    bool _1184 = !_1166;
    int _1186 = _1184 ? 0 : 1;
    int _1188 = _917 * _1172;
    int _1190 = _1188 + _1045;
    float _1192 = _967 * _1176;
    float _1194 = _125 * _967;
    int _1196 = abs(_1186);
    bool _1198 = !_981;
    int _1200 = _1198 ? _1190 : (-1);
    float _1202 = _1194 * _1152;
    int _1204 = _917 + (-1);
    float _1206 = trunc(_1192);
    int _1208 = int(_1206);
    int _1210 = _1200 * _1182;
    bool _1212 = !_1150;
    int _1214 = _1212 ? 0 : 1;
    int _1216 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1218 = _1216 != 0;
    int _1220 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1222 = _1220 != 0;
    int _1224 = _1138 * _1204;
    int _1226 = _1224 + _1210;
    bool _1228 = !_1162;
    int _1230 = _1228 ? 0 : 1;
    float _1232 = trunc(_1202);
    int _1234 = int(_1232);
    int _1236 = abs(_1214);
    bool _1238 = !_1218;
    int _1240 = _1238 ? 0 : 1;
    int _1242 = abs(_1230);
    int _1244 = _1208 * _1236;
    int _1246 = _1244 + _1045;
    bool _1248 = !_1222;
    int _1250 = _1248 ? 0 : 1;
    int _1252 = abs(_1240);
    int _1254 = _1226 * _1196;
    int _1256 = abs(_1250);
    int _1258 = _1234 * _1242;
    int _1260 = _1258 + _1254;
    int _1262 = ~_917;
    int _1264 = _1262 + 1;
    int _1266 = _1246 * _1252;
    int _1268 = _1266 + _1260;
    int _1270 = _1208 * _1256;
    int _1272 = _1270 + _1268;
    int _1274 = ~_917;
    int _1276 = _1274 + 1;
    float _1278 = float(uint(_1272));
    float _1280 = as_type<float>(_1047) * _1278;
    float _1282 = trunc(_1280);
    float _1284 = precise::max(_1282, 0.0);
    uint _1286 = uint(_1284);
    int _1288 = _1276 * int(_1286);
    int _1290 = _1288 + _1272;
    float _1292 = float(uint(_1290));
    float _1294 = as_type<float>(_1047) * _1292;
    float _1296 = in.m_54.z;
    float _1298 = in.m_54.w;
    float _1300 = trunc(_1294);
    float _1302 = precise::max(_1300, 0.0);
    uint _1304 = uint(_1302);
    int _1306 = int(_1286) + int(_1304);
    bool _1308 = _1298 > 0.5;
    int _1310 = _1264 * _1306;
    int _1312 = _1310 + _1272;
    bool _1314 = _1296 > 0.5;
    float _1316 = -_227;
    int _1318 = _1308 ? as_type<int>(_1316) : as_type<int>(_227);
    bool _1320 = uint(_1312) >= uint(_917);
    bool _1322 = !_1320;
    int _1324 = _1322 ? 0 : (-1);
    if (!_911)
    {
        _1088 = _1296;
    }
    float _1326 = _1088;
    float _1328 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1330 = _1328 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    int _1332 = ~_1306;
    int _1334 = _1332 + _1324;
    int _1336 = _1334 + 1;
    int _1338 = _917 * _1336;
    int _1340 = _1338 + _1272;
    float _1342 = -_223;
    int _1344 = _1314 ? as_type<int>(_1342) : as_type<int>(_223);
    float _1346 = 1.0 / _1330;
    float _1348 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1350 = _1348 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1352 = !_981;
    int _1354 = _1352 ? _1340 : (-1);
    float _1356 = -_227;
    int _1358 = _1314 ? as_type<int>(_1356) : as_type<int>(_227);
    int _1360 = _1354 & 3;
    bool _1362 = _1360 != 0;
    float _1364 = 1.0 / _1350;
    int _1366 = _1354 & 3;
    bool _1368 = _1366 != 0;
    bool _1370 = uint(_1360) > 1u;
    int _1372 = _1368 ? 0 : 1;
    int _1374 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1376 = _1374 != 0;
    int _1378 = ~_1372;
    int _1380 = _1378 + 1;
    int _1382 = _1380 + 1;
    bool _1384 = !_1376;
    float _1386 = _1384 ? _227 : as_type<float>(_1318);
    bool _1388 = _1360 != 3;
    bool _1390 = uint(_1360) >= 2u;
    float _1392 = _1106 * _1364;
    int _1394 = _1382;
    if (!_1370)
    {
        int _1396 = ~_1372;
        int _1398 = _1396 + 1;
        _1394 = _1398;
    }
    int _1400 = _1394;
    int _1402 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1404 = _1402 != 0;
    int _1406 = _1390 ? 0 : 1;
    int _1408 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1410 = _1408 != 0;
    int _1412 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1414 = _1412 != 0;
    bool _1416 = !_1404;
    float _1418 = _1416 ? _223 : as_type<float>(_1344);
    int _1420 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1422 = _1420 != 0;
    bool _1424 = !_1414;
    float _1426 = _1424 ? _227 : as_type<float>(_1358);
    float _1428 = _905 * 2.0;
    int _1430 = ~_1406;
    int _1432 = _1430 + 1;
    int _1434 = _1432 + 1;
    int _1436 = _1434;
    if (_1388)
    {
        int _1438 = ~_1406;
        int _1440 = _1438 + 1;
        _1436 = _1440;
    }
    int _1442 = _1436;
    float _1444 = floor(_1428);
    bool _1446 = _1065 > 0.5;
    bool _1448 = !_1422;
    int _1450 = _1448 ? 0 : 1;
    bool _1452 = _905 > 0.5;
    float _1454 = -_223;
    int _1456 = _1446 ? as_type<int>(_1454) : as_type<int>(_223);
    float _1458 = -_227;
    int _1460 = _1446 ? as_type<int>(_1458) : as_type<int>(_227);
    int _1462 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1464 = _1462 != 0;
    float _1466 = -_223;
    int _1468 = _1452 ? as_type<int>(_1466) : as_type<int>(_223);
    int _1470 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1472 = _1470 != 0;
    float _1474 = _441 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _1476 = !_1464;
    float _1478 = _1476 ? _223 : as_type<float>(_1468);
    bool _1480 = _1444 >= 0.0;
    bool _1482 = isnan(_1444);
    bool _1484 = _1480 || _1482;
    bool _1486 = isnan(0.0);
    bool _1488 = _1484 || _1486;
    float _1490 = fma(_451, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1474);
    float _1492 = fma(_451, (*spvDescriptorSet0.vp_c10)._m0[6].x, _913);
    float _1494 = floor(_1086);
    int _1496 = _1488 ? 0 : 1;
    float _1498 = fma(_473, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1490);
    bool _1500 = _1444 > 0.0;
    float _1502 = fma(_473, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1492);
    float _1504 = _1296 * 2.0;
    int _1506 = ~_1496;
    int _1508 = _1506 + 1;
    int _1510 = _1508 + 1;
    float _1512 = _1478 + 0.5;
    float _1514 = _125 * _933;
    float _1516 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _1518 = _1516 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1520 = floor(_1504);
    float _1522 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1524 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1522;
    float _1526 = _1502 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1528 = _1510;
    if (!_1500)
    {
        int _1530 = ~_1496;
        int _1532 = _1530 + 1;
        _1528 = _1532;
    }
    int _1534 = _1528;
    float _1536 = _1518 * _1346;
    bool _1538 = _1494 >= 0.0;
    bool _1540 = isnan(_1494);
    bool _1542 = _1538 || _1540;
    bool _1544 = isnan(0.0);
    bool _1546 = _1542 || _1544;
    float _1548 = exp2(_1514);
    float _1550 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1552 = _1550 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1554 = _1524 * _1071;
    int _1556 = _1546 ? 0 : 1;
    float _1558 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1560 = _897 + _1558;
    bool _1562 = _1494 > 0.0;
    float _1564 = _1552 * _1019;
    int _1566 = ~_1556;
    int _1568 = _1566 + 1;
    int _1570 = _1568 + 1;
    float _1572 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1574 = _1572 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1576 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1578 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1576;
    float _1580 = fma(_1554, _1560, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1582 = _1574 * _1075;
    bool _1584 = _895 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1586 = isnan(_895);
    bool _1588 = _1584 || _1586;
    bool _1590 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1592 = _1588 || _1590;
    float _1594 = float(_1592);
    float _1596 = _1578 * _1098;
    float _1598 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1600 = _1598 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _1602 = -_1548;
    float _1604 = _1602 + 1.0;
    bool _1606 = _895 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1608 = isnan(_895);
    bool _1610 = _1606 || _1608;
    bool _1612 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1614 = _1610 || _1612;
    float _1616 = float(_1614);
    float _1618 = -_1594;
    float _1620 = _1618 + 1.0;
    int _1622 = _1570;
    if (!_1562)
    {
        int _1624 = ~_1556;
        int _1626 = _1624 + 1;
        _1622 = _1626;
    }
    int _1628 = _1622;
    float _1630 = 1.0 / _1600;
    bool _1632 = _1520 >= 0.0;
    bool _1634 = isnan(_1520);
    bool _1636 = _1632 || _1634;
    bool _1638 = isnan(0.0);
    bool _1640 = _1636 || _1638;
    float _1642 = _1616 * _1620;
    bool _1644 = _895 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1646 = isnan(_895);
    bool _1648 = _1644 || _1646;
    bool _1650 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1652 = _1648 || _1650;
    float _1654 = float(_1652);
    float _1656 = -_1616;
    float _1658 = _1656 + 1.0;
    int _1660 = _1640 ? 0 : 1;
    float _1662 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1664 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1662;
    bool _1666 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1668 = isnan(0.0);
    bool _1670 = _1666 || _1668;
    bool _1672 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1674 = _1670 || _1672;
    float _1676 = fma(_1596, _979, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _1678 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1680 = _895 + _1678;
    bool _1682 = _895 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1684 = isnan(_895);
    bool _1686 = _1682 || _1684;
    bool _1688 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1690 = _1686 || _1688;
    float _1692 = float(_1690);
    float _1694 = _1512 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1696 = _1674 ? _1604 : 0.0;
    float _1698 = fma(_1536, _1680, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    bool _1700 = _1520 > 0.0;
    float _1702 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1704 = _895 + _1702;
    float _1706 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1708 = _895 + _1706;
    float _1710 = -_1692;
    float _1712 = _1710 + 1.0;
    float _1714 = _1664 * _1630;
    float _1716 = fma(_1102, _1704, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _1718 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1720 = _895 + _1718;
    float _1722 = fma(_1564, _1708, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    bool _1724 = _895 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1726 = isnan(_895);
    bool _1728 = _1724 || _1726;
    bool _1730 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1732 = _1728 || _1730;
    float _1734 = float(_1732);
    float _1736 = _1716 * _1049;
    float _1738 = fma(_1392, _1720, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _1740 = _1654 * _1658;
    float _1742 = -_1654;
    float _1744 = _1742 + 1.0;
    bool _1746 = _897 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1748 = isnan(_897);
    bool _1750 = _1746 || _1748;
    bool _1752 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1754 = _1750 || _1752;
    float _1756 = float(_1754);
    bool _1758 = _895 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1760 = isnan(_895);
    bool _1762 = _1758 || _1760;
    bool _1764 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _1766 = _1762 || _1764;
    float _1768 = float(_1766);
    float _1770 = _1692 * _1744;
    float _1772 = _1734 * _1712;
    float _1774 = -_1734;
    float _1776 = _1774 + 1.0;
    float _1778 = -_1768;
    float _1780 = _1778 + 1.0;
    int _1782 = ~_917;
    int _1784 = _1782 + 1;
    float _1786 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1788 = 1.0 + _1786;
    float _1790 = _1768 * _1776;
    float _1792 = -_1756;
    float _1794 = _1792 + 1.0;
    float _1796 = _1015 * _1780;
    bool _1798 = !_1410;
    float _1800 = _1798 ? _223 : as_type<float>(_1456);
    float _1802 = 1.0 / _1788;
    float _1804 = _999 * _1794;
    float _1806 = fma(_1582, _927, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _1808 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1810 = _895 + _1808;
    float _1812 = -_1037;
    float _1814 = _1812 + 1.0;
    float _1816 = _1580 * _1804;
    float _1818 = fma(_1714, _1810, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _1820 = float(uint(_1246));
    float _1822 = fma(_1814, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1736);
    float _1824 = -_999;
    float _1826 = _1824 + 1.0;
    float _1828 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1830 = as_type<float>(_1047) * _1820;
    float _1832 = _1326 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1834 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1836 = _1696 * _1802;
    float _1838 = _1802;
    float _1840 = _1756;
    if (!_911)
    {
        float _1842 = in.m_54.z;
        _1838 = _1842;
    }
    float _1844 = _1838;
    float _1846 = trunc(_1830);
    float _1848 = precise::max(_1846, 0.0);
    uint _1850 = uint(_1848);
    int _1852 = ~_1660;
    int _1854 = _1852 + 1;
    int _1856 = _1854 + 1;
    float _1858 = fma(_1826, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1816);
    float _1860 = -_1828;
    float _1862 = fma(_1832, 2.0, _1860);
    int _1864 = _1856;
    if (!_1700)
    {
        int _1866 = ~_1660;
        int _1868 = _1866 + 1;
        _1864 = _1868;
    }
    int _1870 = _1864;
    float _1872 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _1874 = ~_917;
    int _1876 = _1874 + 1;
    float _1878 = fma(_1063, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1834);
    float _1880 = _1063 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1882 = fma(_1756, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1858);
    float _1884 = fma(_1698, _1796, _1822);
    float _1886 = -_1872;
    float _1888 = fma(_1880, 2.0, _1886);
    float _1890 = _1065 + _905;
    int _1892 = _1876 * int(_1850);
    int _1894 = _1892 + _1246;
    int _1896 = abs(_1400);
    float _1898 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1900 = _1890 + (-1.0);
    float _1902 = float(uint(_1894));
    float _1904 = fma(_1738, _1790, _1884);
    float _1906 = _1844;
    if (!_911)
    {
        _1840 = _1844;
    }
    float _1908 = _1840;
    float _1910 = fma(_1900, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1912 = _1908;
    if (_911)
    {
        _1906 = _1090;
    }
    float _1914 = _1906;
    float _1916 = as_type<float>(_1047) * _1902;
    float _1918 = _1498 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1920 = _853 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1922 = _1914;
    if (_911)
    {
        _1912 = _1090;
    }
    float _1924 = _1912;
    float _1926 = fma(_1914, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1898);
    float _1928 = _929 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1930 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1932 = _1918 + _1930;
    float _1934 = trunc(_1916);
    float _1936 = precise::max(_1934, 0.0);
    uint _1938 = uint(_1936);
    if (_911)
    {
        _1922 = _1090;
    }
    float _1940 = _1922;
    float _1942 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1944 = _1928 + _1942;
    float _1946 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1948 = _1526 + _1946;
    float _1950 = _985 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1952 = _987 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1954 = _1944 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1956 = _1920 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1958 = _1882 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1960 = fma(_1932, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1954);
    float _1962 = fma(_1722, _1772, _1904);
    float _1964 = _1924 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1966 = -_125;
    float _1968 = fma(_1966, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1888);
    float _1970 = fma(_1948, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1960);
    float _1972 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1974 = fma(_1676, _1770, _1962);
    int _1976 = _1354 >> 31;
    out.m_58.x = _1952;
    out.m_58.y = _1950;
    out.m_58.z = _1956;
    out.m_58.w = _1958;
    bool _1978 = _1970 >= 0.0;
    float _1980 = fma(_1964, -2.0, _1972);
    float _1982 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _1984 = _1976 & 3;
    float _1986 = fma(_1806, _1740, _1974);
    int _1988 = int(_1850) + int(_1938);
    float _1990 = _1418 + 0.5;
    float _1992 = _1940;
    if (!_911)
    {
        _1992 = _905;
    }
    float _1994 = _1992;
    float _1996 = _1386 + (-0.5);
    int _1998 = _1354 + _1984;
    int _2000 = _1784 * _1988;
    int _2002 = _2000 + _1246;
    float _2004 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2006 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1980);
    float _2008 = _1994 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _2010 = _1998 >> 2;
    float _2012 = fma(_1990, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1968);
    float _2014 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1878);
    float _2016 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    bool _2018 = !_1472;
    float _2020 = _2018 ? _227 : as_type<float>(_1460);
    float _2022 = -_125;
    float _2024 = fma(_2022, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1862);
    int _2026 = _2010 << 4;
    int _2028 = _2026 + 512;
    float _2030 = fma(_2008, -2.0, _2016);
    bool _2032 = uint(_2002) >= uint(_917);
    float _2034 = _1982 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _2036 = _1360 != 3;
    float _2038 = _1800 + 0.5;
    float _2040 = _2008;
    if (_1978)
    {
        _2040 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2042 = _2040;
    float _2044 = -_1996;
    float _2046 = -_2006;
    float _2048 = fma(_2044, (*spvDescriptorSet0.vp_c9)._m0[85].y, _2046);
    float _2050 = fma(_1818, _1642, _1986);
    int _2052 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2054 = _2052 != 0;
    int _2056 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2058 = _2056 != 0;
    int _2060 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2062 = _2060 != 0;
    uint _2064 = uint(int(uint(_2028) >> uint(2)));
    uint _2066 = uint(int(uint(int(_2064)) >> uint(2)));
    int _2068 = int(_2064) & 3;
    float _2070 = (*spvDescriptorSet0.vp_c9)._m0[int(_2066)][_2068];
    int _2072 = int(_2064) + 1;
    uint _2074 = uint(int(uint(_2072) >> uint(2)));
    int _2076 = _2072 & 3;
    float _2078 = (*spvDescriptorSet0.vp_c9)._m0[int(_2074)][_2076];
    float _2080 = fma(_2034, _2038, _2024);
    int _2082 = as_type<int>(_2042);
    if (_1978)
    {
        float _2084 = _2042 * 5.0;
        _2082 = as_type<int>(_2084);
    }
    int _2086 = _2082;
    float _2088 = -_2014;
    float _2090 = _2088 + 1.0;
    float _2092 = _1944 * _1944;
    float _2094 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2096 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1926);
    if (_1978)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6721 = as_type<float>(_2086);
        out.gl_Position.z = _6721;
    }
    float _2098 = -_2020;
    float _2100 = _2098 + 0.5;
    bool _2102 = !_1362;
    int _2104 = _2102 ? 0 : 1;
    float _2106 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2030);
    bool _2108 = !_2036;
    int _2110 = _2108 ? 0 : (-1);
    float _2112 = fma(_1594, (*spvDescriptorSet0.vp_c9)._m0[158].x, _2050);
    float _2114 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _2116 = abs(_2104);
    if (_1978)
    {
        out.m_45.x = 0.0;
    }
    bool _2118 = !_2032;
    int _2120 = _2118 ? 0 : (-1);
    bool _2122 = _917 == 0;
    float _2124 = -_2090;
    float _2126 = fma(_1418, _2124, _2012);
    float _2128 = _1694 * _2004;
    float _2130 = fma(_1932, _1932, _2092);
    int _2132 = _2028 + 8;
    uint _2134 = uint(int(uint(_2132) >> uint(2)));
    uint _2136 = uint(int(uint(int(_2134)) >> uint(2)));
    int _2138 = int(_2134) & 3;
    float _2140 = (*spvDescriptorSet0.vp_c9)._m0[int(_2136)][_2138];
    int _2142 = int(_2134) + 1;
    uint _2144 = uint(int(uint(_2142) >> uint(2)));
    int _2146 = _2142 & 3;
    float _2148 = (*spvDescriptorSet0.vp_c9)._m0[int(_2144)][_2146];
    float _2150 = _2100 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2152 = fma(_1948, _1948, _2130);
    float _2154 = -_2096;
    float _2156 = _2154 + 1.0;
    float _2158 = _2150 * _2094;
    float _2160 = _2114 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2162 = fma(_1386, _2156, _2048);
    float _2164 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2166 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2168 = _597 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2170 = rsqrt(_2152);
    float _2172 = fma(_905, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2164);
    float _2174 = fma(_1065, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2166);
    float _2176 = _1426 + (-0.5);
    out.m_60.x = _2128;
    out.m_60.y = _2158;
    out.m_60.z = _2126;
    out.m_60.w = _2162;
    float _2178 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2172);
    float _2180 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2174);
    float _2182 = -_2160;
    float _2184 = -_2106;
    float _2186 = fma(_2182, _2176, _2184);
    int _2188 = ~_1988;
    int _2190 = _2188 + _2120;
    int _2192 = _2190 + 1;
    float _2194 = -_2178;
    float _2196 = _2194 + 1.0;
    float _2198 = -_2180;
    float _2200 = _2198 + 1.0;
    float _2202 = _2168 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    out.m_62.x = _2112;
    float _2204 = -_2196;
    float _2206 = fma(_1800, _2204, _2080);
    float _2208 = fma(_1426, _2200, _2186);
    int _2210 = _917 * _2192;
    int _2212 = _2210 + _1246;
    float _2214 = _2202 * _2170;
    float _2216 = float(_1870);
    out.m_64.x = _2206;
    out.m_64.y = _2208;
    int _2218 = ~_1896;
    int _2220 = _2218 + 1;
    int _2222 = _2220 + 1;
    float _2224 = _1944 * _2214;
    int _2226 = ~_2116;
    int _2228 = _2226 + 1;
    int _2230 = _2228 + 1;
    float _2232 = _1932 * _2214;
    int _2234 = abs(_1442);
    int _2236 = _2222 * as_type<int>(_2078);
    int _2238 = abs(_2110);
    float _2240 = -_2224;
    float _2242 = _1944 + _2240;
    bool _2244 = !_2058;
    int _2246 = _2244 ? 0 : 1;
    int _2248 = _2230 * as_type<int>(_2070);
    int _2250 = _2248 + _2236;
    int _2252 = ~_2234;
    int _2254 = _2252 + 1;
    int _2256 = _2254 + 1;
    float _2258 = -_2232;
    float _2260 = _1932 + _2258;
    bool _2262 = !_2054;
    int _2264 = _2262 ? 0 : 1;
    float _2266 = in.m_66.x;
    float _2268 = in.m_66.y;
    float _2270 = in.m_66.z;
    int _2272 = abs(_1450);
    int _2274 = _2256 * as_type<int>(_2140);
    int _2276 = _2274 + _2250;
    int _2278 = abs(_2264);
    float _2280 = _2242 * _2242;
    int _2282 = ~_2238;
    int _2284 = _2282 + 1;
    int _2286 = _2284 + 1;
    float _2288 = _1948 * _2214;
    float _2290 = fma(_2260, _2260, _2280);
    float _2292 = float(_2278);
    int _2294 = _2286 * as_type<int>(_2148);
    int _2296 = _2294 + _2276;
    int _2298 = ~_2272;
    int _2300 = _2298 + 1;
    int _2302 = _2300 + 1;
    float _2304 = -_2288;
    float _2306 = _1948 + _2304;
    bool _2308 = !_2122;
    int _2310 = _2308 ? _2212 : (-1);
    float _2312 = _2292 * _2216;
    int _2314 = _2296 * _2302;
    int _2316 = abs(_2246);
    float _2318 = _2312 * (-2.0);
    float _2320 = float(_1534);
    int _2322 = _2310 * _2272;
    int _2324 = _2322 + _2314;
    float _2326 = float(_2316);
    float _2328 = _905 + (-0.5);
    float _2330 = fma(_2306, _2306, _2290);
    float _2332 = fma(_2318, _2266, _2266);
    float _2334 = float(_2324);
    float _2336 = _2326 * _2320;
    float _2338 = fma(_1910, _2318, _1910);
    float _2340 = fma(_2328, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2332);
    bool _2342 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2344 = isnan(1.0);
    bool _2346 = _2342 || _2344;
    bool _2348 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2350 = _2346 || _2348;
    out.m_68.y = _2334;
    float _2352 = _1296 + _1065;
    bool _2354 = !_2062;
    int _2356 = _2354 ? 0 : 1;
    float _2358 = _2270;
    if (_1978)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2360 = -_2224;
    float _2362 = _1928 + _2360;
    float _2364 = -_2232;
    float _2366 = _1918 + _2364;
    int _2368 = abs(_2356);
    float _2370 = -_2288;
    float _2372 = _1526 + _2370;
    float _2374 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2376 = _2362 + _2374;
    float _2378 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2380 = _2366 + _2378;
    float _2382 = float(_1628);
    float _2384 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2386 = _2372 + _2384;
    float _2388 = _2376 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _2390 = !_2350;
    float _2392 = _2390 ? _125 : _1836;
    float _2394 = _2352 + (-1.0);
    float _2396 = _1296 + _905;
    float _2398 = fma(_2380, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2388);
    float _2400 = float(_2368);
    float _2402 = fma(_2392, _2338, _2340);
    float _2404 = fma(_2394, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2406 = fma(_2386, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2398);
    float _2408 = _2336 * (-2.0);
    float _2410 = _1065 + (-0.5);
    float _2412 = _2400 * _2382;
    float _2414 = fma(_2408, _2268, _2268);
    float _2416 = fma(_2404, _2408, _2404);
    bool _2418 = _2406 >= 0.0;
    float _2420 = _2396 + (-1.0);
    float _2422 = fma(_2410, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2414);
    float _2424 = _2412 * (-2.0);
    float _2426 = _1296 + (-0.5);
    float _2428 = fma(_2420, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2430 = fma(_2392, _2416, _2422);
    float _2432 = fma(_2424, _2270, _2270);
    float _2434 = _2402 * 0.15915493667125701904296875;
    float _2436 = sqrt(_2330);
    float _2438 = _2430 * 0.15915493667125701904296875;
    float _2440 = fma(_2426, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2432);
    float _2442 = fma(_2428, _2424, _2428);
    float _2444 = _2366;
    if (_2418)
    {
        _2358 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2446 = _2358;
    int _2448 = as_type<int>(_2446);
    if (_2418)
    {
        out.m_45.x = 0.0;
    }
    float _2450 = fma(_2392, _2442, _2440);
    float _2452 = _2434 * 6.283185482025146484375;
    float _2454 = sin(_2452);
    if (_2418)
    {
        float _2456 = _2446 * 5.0;
        _2448 = as_type<int>(_2456);
    }
    int _2458 = _2448;
    float _2460 = _2450 * 0.15915493667125701904296875;
    if (_2418)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7284 = as_type<float>(_2458);
        out.gl_Position.z = _7284;
    }
    float _2462 = _2434 * 6.283185482025146484375;
    float _2464 = cos(_2462);
    float _2466 = _2438 * 6.283185482025146484375;
    float _2468 = sin(_2466);
    float _2470 = _2438 * 6.283185482025146484375;
    float _2472 = cos(_2470);
    if (_2418)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2474 = _2460 * 6.283185482025146484375;
    float _2476 = cos(_2474);
    float _2478 = _2170 * _2436;
    float _2480 = _599 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2482 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _227);
    float _2484 = _2464 * _2472;
    float _2486 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _223);
    float _2488 = _2478 * _2480;
    float _2490 = _2168 * _2478;
    float _2492 = _2460 * 6.283185482025146484375;
    float _2494 = sin(_2492);
    float _2496 = _2464 * _2468;
    float _2498 = _2482 * _2488;
    float _2500 = _2454 * _2468;
    float _2502 = _2476 * _2498;
    float _2504 = _2486 * _2490;
    float _2506 = _2454 * _2472;
    float _2508 = _2468 * _2476;
    float _2510 = _2464 * _2502;
    float _2512 = _2472 * _2476;
    float _2514 = _2454 * _2502;
    float _2516 = fma(_2494, _2484, _2500);
    float _2518 = -_2498;
    float _2520 = _2494 * _2518;
    float _2522 = -_2506;
    float _2524 = fma(_2494, _2496, _2522);
    float _2526 = -_2496;
    float _2528 = fma(_2494, _2506, _2526);
    float _2530 = fma(_2516, _2504, _2510);
    float _2532 = _2478 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2534 = _2532 * 0.5;
    float _2536 = fma(_2512, _2504, _2520);
    float _2538 = fma(_2494, _2500, _2484);
    float _2540 = fma(_2528, _2504, _2514);
    float _2542 = fma(_2524, _2534, _2530);
    float _2544 = fma(_2508, _2534, _2536);
    float _2546 = fma(_2538, _2534, _2540);
    float _2548 = _2542 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2550 = _2542 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2552 = _2542 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2554 = fma(_2544, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2548);
    float _2556 = fma(_2544, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2550);
    float _2558 = fma(_2544, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2552);
    float _2560 = fma(_2546, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2554);
    float _2562 = fma(_2546, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2556);
    float _2564 = fma(_2546, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2558);
    float _2566 = _2560 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2568 = _2562 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2570 = _1526 + _2566;
    float _2572 = _1918 + _2568;
    float _2574 = _2564 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2576 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2578 = _2570 + _2576;
    float _2580 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2582 = _2572 + _2580;
    float _2584 = _1928 + _2574;
    float _2586 = _2578 * _2578;
    float _2588 = fma(_2582, _2582, _2586);
    float _2590 = sqrt(_2588);
    bool _2592 = _2590 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2594 = _2574;
    float _2596 = _2586;
    float _2598 = _2546;
    float _2600 = _2588;
    float _2602 = _2578;
    if (!_2592)
    {
        _2594 = _2572;
    }
    float _2604 = _2594;
    float _2606 = _2604;
    if (!_2592)
    {
        _2596 = _2570;
    }
    float _2608 = _2596;
    float _2610 = _2608;
    if (!_2592)
    {
        _2598 = _2584;
    }
    float _2612 = _2598;
    bool _2614 = !_2592;
    float _2616 = _2612;
    if (!_2614)
    {
        float _2618 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2620 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2622 = _2590 + _2620;
        float _2624 = rsqrt(_2588);
        float _2626 = _2622 * _2618;
        float _2628 = _2584 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2630 = _2626 * 0.15915493667125701904296875;
        float _2632 = _2630 * 6.283185482025146484375;
        float _2634 = cos(_2632);
        float _2636 = _2630 * 6.283185482025146484375;
        float _2638 = sin(_2636);
        float _2640 = _2634 + (-1.0);
        float _2642 = _2640 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2644 = fma(_2638, _2628, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2646 = fma(_2584, _2634, _2642);
        float _2648 = _2624 * _2644;
        float _2650 = fma(_2582, _2648, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2652 = fma(_2578, _2648, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2616 = _2646;
        _2606 = _2650;
        _2610 = _2652;
    }
    float _2654 = _2616;
    float _2656 = _2606;
    float _2658 = _2610;
    float _2660 = -_1928;
    float _2662 = _2660 + _2654;
    float _2664 = -_1918;
    float _2666 = _2664 + _2656;
    float _2668 = -_1526;
    float _2670 = _2668 + _2658;
    float _2672 = _2662 * _2662;
    float _2674 = fma(_2666, _2666, _2672);
    float _2676 = fma(_2670, _2670, _2674);
    float _2678 = sqrt(_2676);
    bool _2680 = _2678 > 0.0;
    float _2682 = _2678;
    float _2684 = _2674;
    float _2686 = _2654;
    float _2688 = _2656;
    float _2690 = _2662;
    if (!_2680)
    {
        _2682 = _2656;
    }
    float _2692 = _2682;
    float _2694 = _2692;
    float _2696 = _2692;
    if (!_2680)
    {
        _2684 = _2658;
    }
    float _2698 = _2684;
    bool _2700 = !_2680;
    float _2702 = _2698;
    float _2704 = _2698;
    if (!_2700)
    {
        bool _2706 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2708 = _2582;
        if (_2706)
        {
            float _2710 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2708 = _2710;
        }
        float _2712 = _2708;
        float _2714 = _2712;
        if (_2706)
        {
            float _2716 = _475 * _2712;
            _2600 = _2716;
        }
        float _2718 = _2600;
        float _2720 = _2718;
        if (_2706)
        {
            float _2722 = _477 * _2712;
            _2602 = _2722;
        }
        float _2724 = _2602;
        float _2726 = _2724;
        if (_2706)
        {
            float _2728 = _479 * _2712;
            _2714 = _2728;
        }
        float _2730 = _2714;
        float _2732 = _2730;
        if (!_2706)
        {
            bool _2734 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
            bool _2736 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
            bool _2738 = _2734 || _2736;
            bool _2740 = isnan(1.0);
            bool _2742 = _2738 || _2740;
            float _2744 = _125 + 1.0;
            if (!_2742)
            {
                float _2746 = _2744 * _2744;
                float _2748 = _2746 * 0.5;
                _127 = _2748;
            }
            float _2750 = _127;
            float _2752 = _2750;
            if (!_2742)
            {
                float _2754 = _2750 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2752 = _2754;
            }
            float _2756 = _2752;
            bool _2758 = !_2742;
            float _2760 = _2756;
            if (!_2758)
            {
                float _2762 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2764 = log2(_2762);
                float _2766 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2768 = 1.0 + _2766;
                float _2770 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2772 = _2764 * _2744;
                float _2774 = 1.0 / _2768;
                float _2776 = _2770 * 0.693147182464599609375;
                float _2778 = exp2(_2772);
                float _2780 = 1.0 / _2776;
                float _2782 = _2778 + (-1.0);
                float _2784 = -_2782;
                float _2786 = fma(_2784, _2780, _2744);
                float _2788 = _2786 * _2774;
                float _2790 = _2788 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2760 = _2790;
            }
            float _2792 = _2760;
            float _2794 = _2792 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _2796 = _2792 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2798 = _2792 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2800 = _2792;
            if (!_2742)
            {
                _2800 = _2744;
            }
            float _2802 = _2800;
            float _2804 = _2794 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
            float _2806 = _2794 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
            float _2808 = _2794 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
            float _2810 = fma(_2796, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2804);
            float _2812 = fma(_2796, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2806);
            float _2814 = fma(_2798, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2810);
            bool _2816 = !_2742;
            float _2818 = _2802;
            _2702 = _2812;
            if (!_2816)
            {
                float _2820 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2822 = log2(_2820);
                float _2824 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2826 = 1.0 + _2824;
                float _2828 = 1.0 / _2826;
                float _2830 = _2822 * _2744;
                float _2832 = exp2(_2830);
                float _2834 = -_2832;
                float _2836 = _2834 + 1.0;
                float _2838 = _2836 * _2828;
                _2818 = _2838;
            }
            float _2840 = _2818;
            float _2842 = fma(_2796, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2808);
            float _2844 = fma(_2798, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2812);
            float _2846 = fma(_2840, _165, _2814);
            float _2848 = fma(_2798, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2842);
            float _2850 = fma(_2840, _163, _2844);
            float _2852 = -_437;
            float _2854 = _2852 + _2846;
            float _2856 = fma(_2840, _167, _2848);
            float _2858 = -_443;
            float _2860 = _2858 + _2850;
            float _2862 = _2854 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _2864 = _2854 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _2866 = _2854 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _2868 = -_449;
            float _2870 = _2868 + _2856;
            float _2872 = fma(_2860, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2862);
            float _2874 = fma(_2860, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2864);
            float _2876 = fma(_2860, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2866);
            float _2878 = fma(_2870, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2872);
            float _2880 = fma(_2870, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2874);
            float _2882 = fma(_2870, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2876);
            _483 = _2880;
            _485 = _2878;
            _487 = _2882;
            _2720 = _2878;
            _2726 = _2880;
            _2732 = _2882;
            _2694 = _2848;
            _489 = _2874;
        }
        float _2884 = _483;
        float _2886 = _485;
        float _2888 = _487;
        float _2890 = _2720;
        float _2892 = _2726;
        float _2894 = _2732;
        float _2896 = _2702;
        float _2898 = _2694;
        float _2900 = _489;
        float _2902 = _2884 * _2884;
        float _2904 = rsqrt(_2676);
        float _2906 = fma(_2886, _2886, _2902);
        float _2908 = fma(_2888, _2888, _2906);
        float _2910 = sqrt(_2908);
        float _2912 = _2666 * _2904;
        float _2914 = _2662 * _2904;
        float _2916 = _2670 * _2904;
        bool _2918 = _2910 > 0.0;
        float _2920 = _2898;
        float _2922 = _2896;
        _491 = _2900;
        if (!_2918)
        {
            _2920 = _2656;
        }
        float _2924 = _2920;
        _2696 = _2924;
        if (!_2918)
        {
            _2922 = _2658;
        }
        float _2926 = _2922;
        bool _2928 = !_2918;
        _2704 = _2926;
        if (!_2928)
        {
            float _2930 = rsqrt(_2908);
            float _2932 = _2930 * _2884;
            float _2934 = _2930 * _2886;
            float _2936 = _2930 * _2888;
            float _2938 = _2914 * _2932;
            float _2940 = fma(_2912, _2934, _2938);
            float _2942 = fma(_2916, _2936, _2940);
            float _2944 = _2942 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2946 = fma(_2890, _2944, _2656);
            float _2948 = fma(_2892, _2944, _2654);
            float _2950 = fma(_2894, _2944, _2658);
            _2704 = _2950;
            _2686 = _2948;
            _2696 = _2946;
        }
    }
    float _2952 = _2704;
    float _2954 = _2686;
    float _2956 = _2696;
    float _2958 = _491;
    float _2960 = _2362 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _2962 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2964 = isnan(0.5);
    bool _2966 = _2962 || _2964;
    bool _2968 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2970 = _2966 || _2968;
    float _2972 = fma(_2366, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2960);
    bool _2974 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2976 = isnan(0.5);
    bool _2978 = _2974 || _2976;
    bool _2980 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2982 = _2978 || _2980;
    float _2984 = fma(_2372, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2972);
    float _2986 = _2362 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2988 = _2984 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2990 = fma(_2366, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2986);
    float _2992 = 1.0 / _2988;
    float _2994 = fma(_2372, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2990);
    float _2996 = _2954;
    float _2998 = _2958;
    if (_2982)
    {
        _2688 = 1.0;
    }
    float _3000 = _2688;
    float _3002 = _2994 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3004 = _3002 + _2988;
    float _3006 = -_2288;
    float _3008 = _3006 + _2952;
    float _3010 = _3004 * _2992;
    float _3012 = _3010 * 0.5;
    float _3014 = -_2224;
    float _3016 = _3014 + _2954;
    float _3018 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3020 = fma(_3012, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3018);
    float _3022 = -_2232;
    float _3024 = _3022 + _2956;
    float _3026 = 1.0 / _3020;
    float _3028 = _3016;
    float _3030 = _3024;
    float _3032 = _3008;
    float _3034 = _3000;
    if (!_2970)
    {
        float _3036 = _2376 * _2376;
        float _3038 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3040 = -_1526;
        float _3042 = _3040 + _2952;
        float _3044 = fma(_2380, _2380, _3036);
        float _3046 = fma(_2386, _2386, _3044);
        float _3048 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3050 = sqrt(_3046);
        float _3052 = 1.0 / _2478;
        float _3054 = _3048 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3056 = precise::min(_3050, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3058 = _3056 * _3038;
        float _3060 = _3058 * _3052;
        float _3062 = -_1918;
        float _3064 = _3062 + _2956;
        float _3066 = -_1928;
        float _3068 = _3066 + _2954;
        float _3070 = _3054 * _3060;
        float _3072 = _3042 * _3060;
        float _3074 = fma(_3064, _3070, _2366);
        float _3076 = fma(_3068, _3070, _2362);
        float _3078 = fma(_3054, _3072, _2372);
        _2690 = _3060;
        _3028 = _3076;
        _3030 = _3074;
        _3032 = _3078;
    }
    float _3080 = _2690;
    float _3082 = _3028;
    float _3084 = _3030;
    float _3086 = _3032;
    float _3088 = _3080;
    if (_2982)
    {
        _3088 = 1.0;
    }
    float _3090 = _3088;
    float _3092 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3094 = _3026 * _3092;
    float _3096 = _3090;
    if (!_2982)
    {
        float _3098 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3100 = _3098 * 0.15915493667125701904296875;
        float _3102 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3104 = _3100 * 6.283185482025146484375;
        float _3106 = cos(_3104);
        float _3108 = _3102 * 0.15915493667125701904296875;
        float _3110 = _3100 * 6.283185482025146484375;
        float _3112 = sin(_3110);
        float _3114 = 1.0 / _3106;
        float _3116 = _3108 * 6.283185482025146484375;
        float _3118 = cos(_3116);
        float _3120 = _3112 * _3114;
        float _3122 = _3108 * 6.283185482025146484375;
        float _3124 = sin(_3122);
        float _3126 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3128 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3126;
        float _3130 = _3118 * _3120;
        float _3132 = 1.0 / _3128;
        float _3134 = 1.0 / _3130;
        float _3136 = _3124 * _3134;
        float _3138 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3140 = fma(_3094, _3136, _3138);
        float _3142 = _3140 * _3132;
        float _3144 = precise::clamp(_3142, 0.0, 1.0);
        _2444 = _3132;
        _2996 = _3100;
        _3034 = _3144;
    }
    float _3146 = _2444;
    float _3148 = _2996;
    float _3150 = _3034;
    float _3152 = _3146;
    float _3154 = _3148;
    if (!_2982)
    {
        float _3156 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3158 = _3156 * 0.15915493667125701904296875;
        float _3160 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3162 = _3158 * 6.283185482025146484375;
        float _3164 = cos(_3162);
        float _3166 = _3160 * 0.15915493667125701904296875;
        float _3168 = _3158 * 6.283185482025146484375;
        float _3170 = sin(_3168);
        float _3172 = 1.0 / _3164;
        float _3174 = _3166 * 6.283185482025146484375;
        float _3176 = cos(_3174);
        float _3178 = _3170 * _3172;
        float _3180 = _3166 * 6.283185482025146484375;
        float _3182 = sin(_3180);
        float _3184 = _3176 * _3178;
        float _3186 = 1.0 / _3184;
        float _3188 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3190 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _3188;
        float _3192 = 1.0 / _3190;
        float _3194 = _3182 * _3186;
        float _3196 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3198 = fma(_3094, _3194, _3196);
        float _3200 = _3198 * _3192;
        float _3202 = precise::clamp(_3200, 0.0, 1.0);
        float _3204 = -_3202;
        float _3206 = _3204 + 1.0;
        _3152 = _3186;
        _3154 = _3184;
        _3096 = _3206;
    }
    float _3208 = _3152;
    float _3210 = _3154;
    float _3212 = _3096;
    float _3214 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3216 = _3082 + _3214;
    float _3218 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3220 = _3084 + _3218;
    float _3222 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3224 = _3086 + _3222;
    float _3226 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3228 = _3216 * _3216;
    float _3230 = fma(_3220, _3220, _3228);
    float _3232 = fma(_3224, _3224, _3230);
    float _3234 = rsqrt(_3232);
    float _3236 = sqrt(_3232);
    float _3238 = _3234 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3240 = _3220 * _3238;
    float _3242 = _3224 * _3238;
    float _3244 = _3240 * _3240;
    float _3246 = _3242 * _3242;
    float _3248 = _3244 + _3246;
    float _3250 = sqrt(_3248);
    bool _3252 = _3250 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3254 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3256 = _3250 + _3254;
    float _3258 = _3224;
    float _3260 = _3210;
    float _3262 = _3256;
    float _3264 = _3208;
    float _3266 = _3216;
    if (_3252)
    {
        float _3268 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3258 = _3268;
    }
    float _3270 = _3258;
    if (_3252)
    {
        float _3272 = rsqrt(_3248);
        _3260 = _3272;
    }
    float _3274 = _3260;
    float _3276 = _3274;
    if (_3252)
    {
        float _3278 = _3256 * _3270;
        _3262 = _3278;
    }
    float _3280 = _3262;
    if (_3252)
    {
        float _3282 = _3280 * 0.15915493667125701904296875;
        _3264 = _3282;
    }
    float _3284 = _3264;
    float _3286 = _3234;
    if (_3252)
    {
        float _3288 = _3284 * 6.283185482025146484375;
        float _3290 = sin(_3288);
        _3286 = _3290;
    }
    float _3292 = _3286;
    float _3294 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3296 = precise::max(0.0, _3294);
    float _3298 = _3228;
    float _3300 = _3296;
    float _3302 = _3294;
    if (_3252)
    {
        float _3304 = _3284 * 6.283185482025146484375;
        float _3306 = cos(_3304);
        _3298 = _3306;
    }
    float _3308 = _3298;
    float _3310 = -_3238;
    float _3312 = -_3296;
    float _3314 = fma(_3216, _3310, _3312);
    if (!_3252)
    {
        _3266 = _3244;
    }
    float _3316 = _3266;
    float _3318 = _3316;
    if (_3252)
    {
        float _3320 = _3314 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3300 = _3320;
    }
    float _3322 = _3300;
    float _3324 = _3082 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3326 = _3322;
    float _3328 = _3292;
    if (_3252)
    {
        float _3330 = fma(_3292, _3322, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3326 = _3330;
    }
    float _3332 = _3326;
    float _3334 = _3332;
    if (!_3252)
    {
        _3328 = _3240;
    }
    float _3336 = _3328;
    float _3338 = _3336;
    float _3340 = _3308;
    if (_3252)
    {
        float _3342 = _3308 + (-1.0);
        _3302 = _3342;
    }
    float _3344 = _3302;
    float _3346 = _3344;
    if (_3252)
    {
        float _3348 = _3274 * _3332;
        _2998 = _3348;
    }
    float _3350 = _2998;
    if (!_3252)
    {
        _3334 = _3314;
    }
    float _3352 = _3334;
    float _3354 = _3352;
    if (_3252)
    {
        float _3356 = _3344 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3276 = _3356;
    }
    float _3358 = _3276;
    if (_3252)
    {
        float _3360 = _3240 * _3350;
        _3338 = _3360;
    }
    float _3362 = _3338;
    if (!_3252)
    {
        _3346 = _3242;
    }
    float _3364 = _3346;
    float _3366 = _3364;
    if (_3252)
    {
        float _3368 = _3242 * _3350;
        _3366 = _3368;
    }
    float _3370 = _3366;
    if (_3252)
    {
        float _3372 = fma(_3314, _3308, _3358);
        _3354 = _3372;
    }
    float _3374 = _3354;
    if (_3252)
    {
        float _3376 = _3362 * _3362;
        _3318 = _3376;
    }
    float _3378 = _3318;
    if (!_3252)
    {
        _3340 = _3246;
    }
    float _3380 = _3340;
    float _3382 = _3380;
    if (_3252)
    {
        float _3384 = _3370 * _3370;
        _3382 = _3384;
    }
    float _3386 = _3382;
    float _3388 = fma(_3374, _3374, _3378);
    float _3390 = _3388 + _3386;
    float _3392 = fma(_3084, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3324);
    float _3394 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3396 = fma(_3236, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3394);
    float _3398 = precise::clamp(_3396, 0.0, 1.0);
    float _3400 = _3082 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3402 = _3082 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3404 = _3082 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3406 = rsqrt(_3390);
    float _3408 = -_3398;
    float _3410 = _3408 + 1.0;
    float _3412 = fma(_3084, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3400);
    float _3414 = fma(_3084, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3402);
    float _3416 = fma(_3084, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3404);
    float _3418 = fma(_3086, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3392);
    float _3420 = fma(_3086, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3412);
    float _3422 = fma(_3086, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3414);
    float _3424 = abs(_3410);
    float _3426 = log2(_3424);
    float _3428 = fma(_3086, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3416);
    float _3430 = _3420 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3432 = _3422 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3434 = _3418 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3436 = _3428 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3438 = _3430 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3440 = _3406 * _3362;
    float _3442 = _3406 * _3374;
    float _3444 = fma(_3432, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3438);
    float _3446 = _3406 * _3370;
    float _3448 = _3440 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3450 = _3434 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3452 = fma(_3434, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3444);
    float _3454 = _3430 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3456 = -_3448;
    float _3458 = fma(_3442, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3456);
    float _3460 = _3426 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3462 = -_3450;
    float _3464 = fma(_3462, _3226, 1.0);
    float _3466 = fma(_3436, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3452);
    float _3468 = -_3446;
    float _3470 = fma(_3468, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3458);
    float _3472 = _3430 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3474 = fma(_3432, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3454);
    float _3476 = exp2(_3460);
    float _3478 = fma(_3470, -0.5, 0.5);
    float _3480 = fma(_3432, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3472);
    float _3482 = fma(_3470, 0.5, 0.5);
    float _3484 = fma(_3434, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3474);
    float _3486 = _3442 + 1.0;
    float _3488 = fma(_3434, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3480);
    float _3490 = fma(_3482, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3492 = log2(_3464);
    float _3494 = fma(_3436, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3484);
    float _3496 = fma(_3436, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3488);
    float _3498 = fma(_3482, _3490, -0.212114393711090087890625);
    float _3500 = fma(_3482, _3498, 1.570728778839111328125);
    float _3502 = 1.0 / _3466;
    float _3504 = -_3442;
    float _3506 = fma(_3476, _3486, _3504);
    float _3508 = fma(_3506, 0.5, 0.5);
    float _3510 = sqrt(_3478);
    float _3512 = _3492 * 0.693147182464599609375;
    float _3514 = _3512 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3516 = _3494 * _3502;
    float _3518 = _3496 * _3502;
    float _3520 = fma(_3516, 0.5, 0.5);
    float _3522 = fma(_3518, -0.5, 0.5);
    float _3524 = _3510 * 0.636619746685028076171875;
    float3 _8934 = float3(_3520, _3522, _3514);
    float _3526 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8934, float3(0.0), isnan(_8934)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8934, float3(0.0), isnan(_8934)), level(0.0)).x;
    float3 _8945 = float3(_3520, _3522, _3514);
    float4 _3529 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8945, float3(0.0), isnan(_8945)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8945, float3(0.0), isnan(_8945)), level(0.0)).xyzw;
    float _3531 = _3529.x;
    float _3533 = _3529.y;
    float _3535 = _3529.z;
    float _3537 = _3529.w;
    float _3539 = -_3500;
    float _3541 = fma(_3524, _3539, 1.0);
    float2 _8967 = float2(_3541, _3508);
    float3 _3545 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8967, float2(0.0), isnan(_8967)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8967, float2(0.0), isnan(_8967)), level(0.0)).xyz;
    float _3547 = _3545.x;
    float _3549 = _3545.y;
    float _3551 = _3545.z;
    float _3553 = _3426 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3555 = _3430 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _3557 = _3150 > 0.0;
    bool _3559 = isnan(_3150);
    bool _3561 = _3557 || _3559;
    bool _3563 = isnan(0.0);
    bool _3565 = _3561 || _3563;
    float _3567 = fma(_3432, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3555);
    float _3569 = exp2(_3553);
    bool _3571 = _3212 <= 0.0;
    bool _3573 = !_3565;
    bool _3575 = _3571 || _3573;
    float _3577 = fma(_3434, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3567);
    float _3579 = _3150 * _3212;
    float _3581 = _3466 * 0.5;
    float _3583 = fma(_3436, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3577);
    float _3585 = _3494 + _3466;
    float _3587 = _3579 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3589 = fma(_3496, -0.5, _3581);
    float _3591 = _3583 + _3466;
    float _3593 = _3585 * 0.5;
    out.gl_Position.x = _3494;
    out.gl_Position.y = _3496;
    out.gl_Position.z = _3583;
    out.gl_Position.w = _3466;
    float _3595 = _3587 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3597 = _3591 * 0.5;
    float _3599 = -_3569;
    float _3601 = _3599 + 1.0;
    out.m_45.x = _3595;
    float _3603 = _3601 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_70.x = _3593;
    out.m_70.y = _3589;
    out.m_70.z = _3597;
    out.m_70.w = _3466;
    float _3605 = -_3603;
    float _3607 = _3605 + 1.0;
    float _3609 = _3603 * _3526;
    float _3611 = _3537 * _3607;
    float _3613 = _3537 * _3609;
    float _3615 = _3551 * _3609;
    float _3617 = fma(_3547, _3613, _3531);
    float _3619 = fma(_3549, _3613, _3533);
    float _3621 = fma(_3537, _3615, _3535);
    out.m_72.x = _3617;
    out.m_72.y = _3619;
    out.m_72.z = _3621;
    out.m_72.w = _3611;
    if (!_3575)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3623 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_45.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3623;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

