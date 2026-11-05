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
    float4 m_60 [[user(locn1)]];
    float4 m_62 [[user(locn2)]];
    float4 m_68 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_64 [[user(locn5)]];
    float4 m_66 [[user(locn6)]];
    float4 m_70 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_58 [[attribute(1)]];
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_54 [[attribute(4)]];
    float4 m_52 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _883 = false;
    bool _759 = false;
    bool _617 = false;
    bool _507 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _84 = in.m_42.w;
    float _86 = trunc(_84);
    int _89 = int(_86);
    bool _93 = _89 >= 1;
    float _95 = 0.0;
    if (!_93)
    {
        _95 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _97 = _95;
    float _99 = _97;
    if (!_93)
    {
        out.m_45.x = 0.0;
    }
    int _101 = 0;
    if (!_93)
    {
        float _103 = _97 * 5.0;
        _101 = as_type<int>(_103);
    }
    int _105 = _101;
    int _107 = _105;
    if (!_93)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3596 = as_type<float>(_105);
        out.gl_Position.z = _3596;
    }
    if (!_93)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _109 = in.m_47.w;
    bool _111 = _109 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _113 = isnan(_109);
    bool _115 = _111 || _113;
    bool _117 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _119 = _115 || _117;
    float _121 = -_109;
    float _123 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _125 = _123;
    if (_119)
    {
        float _127 = float(_89);
        _99 = _127;
    }
    float _129 = _99;
    bool _131 = _123 >= _129;
    bool _133 = !_119;
    bool _135 = _131 || _133;
    float _137 = _129;
    if (_135)
    {
        _137 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _137;
    if (_135)
    {
        out.m_45.x = 0.0;
    }
    if (_135)
    {
        float _141 = _139 * 5.0;
        _107 = as_type<int>(_141);
    }
    int _143 = _107;
    if (_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3666 = as_type<float>(_143);
        out.gl_Position.z = _3666;
    }
    if (_135)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _145 = as_type<float>(int(gl_VertexIndex));
    float _147 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _149 = in.m_52.w;
    bool _151 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _153 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _155 = _151 || _153;
    bool _157 = isnan(1.0);
    bool _159 = _155 || _157;
    float _161 = in.m_47.x;
    float _163 = in.m_47.y;
    float _165 = in.m_47.z;
    float _167 = in.m_42.x;
    float _169 = in.m_42.y;
    float _171 = in.m_42.z;
    int _173 = as_type<int>(_145) & 1;
    bool _175 = _173 != 0;
    int _177 = as_type<int>(_145) & 2;
    bool _179 = _177 != 0;
    int _181 = int(_175);
    int _183 = _179 ? 2 : 0;
    int _185 = _181 | _183;
    int _187 = _159 ? 4 : 0;
    int _189 = _185 | _187;
    int _191 = false ? 8 : 0;
    int _193 = _189 | _191;
    int _195 = false ? 16 : 0;
    int _197 = _193 | _195;
    int _199 = false ? 32 : 0;
    int _201 = _197 | _199;
    int _203 = false ? 64 : 0;
    int _205 = _201 | _203;
    int _207 = _205 & 4;
    float _209 = as_type<float>(_207);
    float _211 = _147;
    if (!_159)
    {
        float _213 = _147 * _147;
        float _215 = _213 * 0.5;
        _209 = _215;
    }
    float _217 = _209;
    bool _219 = !_175;
    float _221 = _219 ? (-0.5) : 0.5;
    bool _223 = !_179;
    float _225 = _223 ? (-0.5) : 0.5;
    float _227 = _217;
    if (!_159)
    {
        float _229 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _227 = _229;
    }
    float _231 = _227;
    bool _233 = !_159;
    float _235 = _231;
    float _237 = 0.0;
    if (!_233)
    {
        float _239 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _241 = log2(_239);
        float _243 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _245 = _243 + 1.0;
        float _247 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _249 = _147 * _241;
        float _251 = exp2(_249);
        float _253 = _247 * 0.693147182464599609375;
        float _255 = 1.0 / _253;
        float _257 = 1.0 / _245;
        float _259 = _251 + (-1.0);
        float _261 = -_259;
        float _263 = fma(_261, _255, _147);
        float _265 = _263 * _257;
        float _267 = _265 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _235 = _267;
        _237 = _245;
    }
    float _269 = _235;
    float _271 = _237;
    float _273 = _269 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _275 = !_159;
    float _277 = _271;
    float _279 = _269;
    if (!_275)
    {
        float _281 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _283 = log2(_281);
        float _285 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _287 = _285 + 1.0;
        float _289 = 1.0 / _287;
        float _291 = _147 * _283;
        float _293 = exp2(_291);
        float _295 = -_293;
        float _297 = _295 + 1.0;
        float _299 = _297 * _289;
        _277 = _289;
        _211 = _299;
    }
    float _301 = _277;
    float _303 = _211;
    float _305 = _273 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _307 = _273 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _309 = _269 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _311 = _273 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _313 = _301;
    if (!_159)
    {
        float _315 = _123 * _123;
        float _317 = _315 * 0.5;
        _313 = _317;
    }
    float _319 = _313;
    float _321 = fma(_309, (*spvDescriptorSet0.vp_c10)._m0[8].x, _305);
    float _323 = fma(_309, (*spvDescriptorSet0.vp_c10)._m0[8].y, _307);
    float _325 = fma(_309, (*spvDescriptorSet0.vp_c10)._m0[8].z, _311);
    float _327 = _269 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_159)
    {
        float _329 = _319 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _279 = _329;
    }
    float _331 = _279;
    bool _333 = !_159;
    float _335 = _331;
    if (!_333)
    {
        float _337 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _339 = log2(_337);
        float _341 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _343 = _341 + 1.0;
        float _345 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _347 = _123 * _339;
        float _349 = exp2(_347);
        float _351 = _345 * 0.693147182464599609375;
        float _353 = 1.0 / _351;
        float _355 = 1.0 / _343;
        float _357 = _349 + (-1.0);
        float _359 = -_357;
        float _361 = fma(_359, _353, _123);
        float _363 = _361 * _355;
        float _365 = _363 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _335 = _365;
    }
    float _367 = _335;
    float _369 = _367 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _371 = fma(_327, (*spvDescriptorSet0.vp_c10)._m0[10].x, _321);
    float _373 = fma(_327, (*spvDescriptorSet0.vp_c10)._m0[10].y, _323);
    float _375 = _367 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _377 = _369 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _379 = _369 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _381 = _369 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _383 = fma(_327, (*spvDescriptorSet0.vp_c10)._m0[10].z, _325);
    float _385 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[8].x, _377);
    float _387 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[8].y, _379);
    float _389 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[8].z, _381);
    float _391 = _367 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _393 = fma(_303, _161, _371);
    float _395 = fma(_303, _163, _373);
    float _397 = fma(_303, _165, _383);
    float _399 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[10].x, _385);
    float _401 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[10].y, _387);
    float _403 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[10].z, _389);
    float _405 = _391;
    if (!_159)
    {
        _405 = _123;
    }
    float _407 = _405;
    bool _409 = !_159;
    float _411 = _407;
    if (!_409)
    {
        float _413 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _415 = log2(_413);
        float _417 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _419 = _417 + 1.0;
        float _421 = 1.0 / _419;
        float _423 = _123 * _415;
        float _425 = exp2(_423);
        float _427 = -_425;
        float _429 = _427 + 1.0;
        float _431 = _429 * _421;
        _411 = _431;
    }
    float _433 = _411;
    float _435 = fma(_433, _163, _401);
    bool _437 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _439 = fma(_395, _149, _169);
    float _441 = fma(_433, _161, _399);
    float _443 = -_435;
    float _445 = _395 + _443;
    float _447 = fma(_433, _165, _403);
    float _449 = fma(_393, _149, _167);
    float _451 = -_441;
    float _453 = _393 + _451;
    float _455 = _445 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _457 = _445 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _459 = _445 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _461 = -_447;
    float _463 = _397 + _461;
    float _465 = fma(_453, (*spvDescriptorSet0.vp_c10)._m0[4].x, _455);
    float _467 = fma(_453, (*spvDescriptorSet0.vp_c10)._m0[5].x, _457);
    float _469 = fma(_453, (*spvDescriptorSet0.vp_c10)._m0[6].x, _459);
    float _471 = fma(_397, _149, _171);
    float _473 = fma(_463, (*spvDescriptorSet0.vp_c10)._m0[4].z, _465);
    float _475 = fma(_463, (*spvDescriptorSet0.vp_c10)._m0[5].z, _467);
    float _477 = fma(_463, (*spvDescriptorSet0.vp_c10)._m0[6].z, _469);
    bool _479 = !_437;
    float _481 = _475;
    float _483 = _473;
    float _485 = _477;
    float _487 = _447;
    float _505;
    if (!_479)
    {
        float _489 = in.m_54.x;
        float _491 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _493 = _489 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _495 = fma(_493, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _497 = _495 * _491;
        float _499 = floor(_497);
        float _501 = -_499;
        float _503 = _497 + _501;
        _505 = _503;
        _507 = true;
    }
    else
    {
        float _509 = float(_89);
        float _511 = 1.0 / _509;
        float _513 = _123 * _511;
        _505 = _513;
    }
    _507 = false;
    float _515 = _505;
    float _517 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _519 = _515 + _517;
    float _521 = in.m_52.x;
    float _523 = in.m_52.y;
    bool _525 = _515 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _527 = isnan(_515);
    bool _529 = _525 || _527;
    bool _531 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _533 = _529 || _531;
    float _535 = float(_533);
    float _537 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _539 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _537;
    bool _541 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _543 = 1.0 / _539;
    float _545 = -_535;
    float _547 = _545 + 1.0;
    float _549 = _519 * _543;
    bool _551 = _515 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _553 = isnan(_515);
    bool _555 = _551 || _553;
    bool _557 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _559 = _555 || _557;
    float _561 = float(_559);
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _565 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _563;
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _569 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _567;
    float _571 = _561 * _547;
    float _573 = fma(_565, _549, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _575 = fma(_569, _549, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _577 = -_561;
    float _579 = _577 + 1.0;
    float _581 = _573 * _571;
    float _583 = _575 * _571;
    float _585 = fma(_579, (*spvDescriptorSet0.vp_c9)._m0[143].x, _581);
    float _587 = fma(_579, (*spvDescriptorSet0.vp_c9)._m0[143].y, _583);
    float _589 = fma(_535, (*spvDescriptorSet0.vp_c9)._m0[144].x, _585);
    float _591 = fma(_535, (*spvDescriptorSet0.vp_c9)._m0[144].y, _587);
    float _593 = _589 * _521;
    float _595 = _591 * _523;
    bool _597 = !_541;
    float _615;
    if (!_597)
    {
        float _599 = in.m_54.x;
        float _601 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _603 = _599 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _605 = fma(_603, (*spvDescriptorSet0.vp_c9)._m0[11].y, _123);
        float _607 = _605 * _601;
        float _609 = floor(_607);
        float _611 = -_609;
        float _613 = _607 + _611;
        _615 = _613;
        _617 = true;
    }
    else
    {
        float _619 = float(_89);
        float _621 = 1.0 / _619;
        float _623 = _123 * _621;
        _615 = _623;
    }
    _617 = false;
    float _625 = _615;
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _629 = _625 + _627;
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _633 = _631 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _635 = _625 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _637 = isnan(_625);
    bool _639 = _635 || _637;
    bool _641 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _643 = _639 || _641;
    float _645 = float(_643);
    float _647 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _649 = _647 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _651 = _625 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _653 = isnan(_625);
    bool _655 = _651 || _653;
    bool _657 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _659 = _655 || _657;
    float _661 = float(_659);
    float _663 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _665 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _663;
    bool _667 = _625 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _669 = isnan(_625);
    bool _671 = _667 || _669;
    bool _673 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _675 = _671 || _673;
    float _677 = float(_675);
    float _679 = 1.0 / _633;
    float _681 = -_645;
    float _683 = _681 + 1.0;
    bool _685 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _687 = _661 * _683;
    float _689 = -_661;
    float _691 = _689 + 1.0;
    float _693 = 1.0 / _649;
    float _695 = _665 * _679;
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _699 = _697 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _701 = fma(_695, _629, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _703 = _699 * _693;
    float _705 = _701 * _687;
    float _707 = -_677;
    float _709 = _707 + 1.0;
    float _711 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _713 = _625 + _711;
    float _715 = fma(_691, (*spvDescriptorSet0.vp_c9)._m0[115].x, _705);
    float _717 = _645 * _709;
    float _719 = fma(_703, _713, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _721 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _723 = fma(_719, _717, _715);
    float _725 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _727 = _721 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _729 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _731 = fma(_677, (*spvDescriptorSet0.vp_c9)._m0[117].x, _723);
    float _733 = _725 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _735 = _729 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _737 = _731 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_56.x = _727;
    out.m_56.y = _733;
    out.m_56.z = _735;
    out.m_56.w = _737;
    bool _739 = !_685;
    float _757;
    if (!_739)
    {
        float _741 = in.m_54.x;
        float _743 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _745 = _741 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _747 = fma(_745, (*spvDescriptorSet0.vp_c9)._m0[11].z, _123);
        float _749 = _747 * _743;
        float _751 = floor(_749);
        float _753 = -_751;
        float _755 = _749 + _753;
        _757 = _755;
        _759 = true;
    }
    else
    {
        float _761 = float(_89);
        float _763 = 1.0 / _761;
        float _765 = _123 * _763;
        _757 = _765;
    }
    _759 = false;
    float _767 = _757;
    float _769 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _771 = _767 + _769;
    bool _773 = _767 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _775 = isnan(_767);
    bool _777 = _773 || _775;
    bool _779 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _781 = _777 || _779;
    float _783 = float(_781);
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _787 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _785;
    bool _789 = _767 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _791 = isnan(_767);
    bool _793 = _789 || _791;
    bool _795 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _797 = _793 || _795;
    float _799 = float(_797);
    float _801 = -_783;
    float _803 = _801 + 1.0;
    float _805 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _807 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _805;
    float _809 = 1.0 / _787;
    bool _811 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _813 = _799 * _803;
    float _815 = -_799;
    float _817 = _815 + 1.0;
    float _819 = _771 * _809;
    float _821 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _823 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _821;
    float _825 = fma(_807, _819, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _827 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _829 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _827;
    float _831 = fma(_823, _819, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _833 = _825 * _813;
    float _835 = fma(_829, _819, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _837 = _831 * _813;
    float _839 = _835 * _813;
    float _841 = fma(_817, (*spvDescriptorSet0.vp_c9)._m0[123].x, _833);
    float _843 = fma(_817, (*spvDescriptorSet0.vp_c9)._m0[123].y, _839);
    float _845 = fma(_817, (*spvDescriptorSet0.vp_c9)._m0[123].z, _837);
    float _847 = fma(_783, (*spvDescriptorSet0.vp_c9)._m0[124].x, _841);
    float _849 = fma(_783, (*spvDescriptorSet0.vp_c9)._m0[124].y, _843);
    float _851 = fma(_783, (*spvDescriptorSet0.vp_c9)._m0[124].z, _845);
    bool _853 = !_811;
    float _877;
    float _879;
    float _881;
    if (!_853)
    {
        float _855 = in.m_54.x;
        float _857 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _859 = float(_89);
        float _861 = 1.0 / _859;
        float _863 = _855 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _865 = _123 * _861;
        float _867 = fma(_863, (*spvDescriptorSet0.vp_c9)._m0[11].w, _123);
        float _869 = _867 * _857;
        float _871 = floor(_869);
        float _873 = -_871;
        float _875 = _869 + _873;
        _877 = _865;
        _879 = _859;
        _881 = _875;
        _883 = true;
    }
    else
    {
        float _885 = float(_89);
        float _887 = 1.0 / _885;
        float _889 = _123 * _887;
        _877 = _889;
        _879 = _885;
        _881 = _889;
    }
    _883 = false;
    float _891 = _877;
    float _893 = _879;
    float _895 = _881;
    float _897 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _899 = int(_897);
    float _901 = in.m_54.x;
    float _903 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _905 = _891 + _903;
    float _907 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _909 = _891 + _907;
    float _911 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _913 = _911 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _915 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _917 = int(_915);
    float _919 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _921 = _919 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _923 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _925 = _923 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _927 = _593 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _929 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _931 = _929 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _933 = float(_899);
    float _935 = 1.0 / _893;
    float _937 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _939 = _937 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _941 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _943 = _941 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    int _945 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _947 = _945 != 0;
    float _949 = float(uint(_917));
    float _951 = 1.0 / _933;
    int _953 = ~_917;
    int _955 = _953 + 1;
    float _957 = float(_917);
    bool _959 = _917 == 0;
    bool _961 = _895 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _963 = isnan(_895);
    bool _965 = _961 || _963;
    bool _967 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _969 = _965 || _967;
    float _971 = float(_969);
    float _973 = 1.0 / _949;
    bool _975 = _895 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _977 = isnan(_895);
    bool _979 = _975 || _977;
    bool _981 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _983 = _979 || _981;
    float _985 = float(_983);
    float _987 = _845;
    if (!_947)
    {
        float _989 = in.m_54.y;
        _987 = _989;
    }
    float _991 = _987;
    bool _993 = _891 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _995 = isnan(_891);
    bool _997 = _993 || _995;
    bool _999 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1001 = _997 || _999;
    float _1003 = float(_1001);
    bool _1005 = _891 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1007 = isnan(_891);
    bool _1009 = _1005 || _1007;
    bool _1011 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _1013 = _1009 || _1011;
    float _1015 = float(_1013);
    bool _1017 = _891 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1019 = isnan(_891);
    bool _1021 = _1017 || _1019;
    bool _1023 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _1025 = _1021 || _1023;
    float _1027 = float(_1025);
    float _1029 = _123 * _951;
    int _1031 = ~_917;
    int _1033 = _1031 + 1;
    float _1035 = 1.0 / _913;
    float _1037 = -_1003;
    float _1039 = _1037 + 1.0;
    int _1041 = as_type<int>(_973) + (-2);
    float _1043 = trunc(_1029);
    int _1045 = int(_1043);
    float _1047 = _951;
    if (!_947)
    {
        _1047 = _991;
    }
    float _1049 = _1047;
    float _1051 = 1.0 / _921;
    float _1053 = _1049;
    int _1055 = as_type<int>(_991);
    if (_947)
    {
        float _1057 = in.m_54.x;
        float _1059 = in.m_54.y;
        _1053 = _1057;
        _1055 = as_type<int>(_1059);
    }
    float _1061 = _1053;
    int _1063 = _1055;
    float _1065 = float(uint(_1045));
    float _1067 = 1.0 / _925;
    float _1069 = as_type<float>(_1041) * _1065;
    float _1071 = trunc(_1069);
    float _1073 = precise::max(_1071, 0.0);
    uint _1076 = uint(_1073);
    float _1078 = 1.0 / _931;
    float _1080 = float(_1045);
    bool _1082 = !_947;
    float _1084 = _1082 ? as_type<float>(_1063) : _901;
    bool _1086 = _1080 >= _957;
    bool _1088 = isnan(_1080);
    bool _1090 = _1086 || _1088;
    bool _1092 = isnan(_957);
    bool _1094 = _1090 || _1092;
    float _1096 = float(_1094);
    int _1098 = _1033 * int(_1076);
    int _1100 = _1098 + _1045;
    float _1102 = 1.0 / _939;
    float _1104 = float(uint(_1100));
    float _1106 = trunc(_1096);
    int _1108 = int(_1106);
    float _1110 = as_type<float>(_1041) * _1104;
    bool _1112 = !_947;
    float _1114 = _1112 ? 1.2345600128173828125 : 1.0;
    float _1116 = trunc(_1110);
    float _1118 = precise::max(_1116, 0.0);
    uint _1120 = uint(_1118);
    float _1122 = _1114 * _1084;
    int _1124 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1126 = _1124 != 0;
    float _1128 = floor(_1122);
    int _1130 = int(_1076) + int(_1120);
    float _1132 = 1.0 / _943;
    int _1134 = _955 * _1130;
    int _1136 = _1134 + _1045;
    bool _1138 = uint(_1136) >= uint(_917);
    bool _1140 = !_1138;
    int _1142 = _1140 ? 0 : (-1);
    int _1144 = ~_1130;
    int _1146 = _1144 + _1142;
    int _1148 = _1146 + 1;
    float _1150 = -_1128;
    float _1152 = _1122 + _1150;
    int _1154 = ~_1108;
    int _1156 = _1154 + 1;
    int _1158 = _1156 + 1;
    int _1160 = _917 * _1148;
    int _1162 = _1160 + _1045;
    float _1164 = _957 * _1152;
    float _1166 = _123 * _957;
    int _1168 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1170 = _1168 != 0;
    int _1172 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1174 = _1172 != 0;
    bool _1176 = !_959;
    int _1178 = _1176 ? _1162 : (-1);
    float _1180 = _1166 * _935;
    int _1182 = _917 + (-1);
    float _1184 = trunc(_1164);
    int _1186 = int(_1184);
    bool _1188 = !_1174;
    int _1190 = _1188 ? 0 : 1;
    int _1192 = _1158 * _1178;
    bool _1194 = !_1126;
    int _1196 = _1194 ? 0 : 1;
    int _1198 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1200 = _1198 != 0;
    int _1202 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1204 = _1202 != 0;
    int _1206 = _1108 * _1182;
    int _1208 = _1206 + _1192;
    bool _1210 = !_1170;
    int _1212 = _1210 ? 0 : 1;
    float _1214 = trunc(_1180);
    int _1216 = int(_1214);
    int _1218 = abs(_1196);
    int _1220 = abs(_1190);
    bool _1222 = !_1200;
    int _1224 = _1222 ? 0 : 1;
    int _1226 = abs(_1212);
    int _1228 = _1208 * _1220;
    float _1230 = _439 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _1232 = abs(_1224);
    int _1234 = _1186 * _1218;
    int _1236 = _1234 + _1045;
    bool _1238 = !_1204;
    int _1240 = _1238 ? 0 : 1;
    float _1242 = _439 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _1244 = _1216 * _1226;
    int _1246 = _1244 + _1228;
    int _1248 = abs(_1240);
    float _1250 = fma(_449, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1242);
    int _1252 = ~_917;
    int _1254 = _1252 + 1;
    int _1256 = _1236 * _1232;
    int _1258 = _1256 + _1246;
    float _1260 = fma(_449, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1230);
    float _1262 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1264 = log2(_1262);
    float _1266 = fma(_471, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1250);
    int _1268 = _1186 * _1248;
    int _1270 = _1268 + _1258;
    int _1272 = ~_917;
    int _1274 = _1272 + 1;
    float _1276 = float(uint(_1270));
    float _1278 = as_type<float>(_1041) * _1276;
    float _1280 = trunc(_1278);
    float _1282 = precise::max(_1280, 0.0);
    uint _1284 = uint(_1282);
    float _1286 = _123 * _1264;
    float _1288 = exp2(_1286);
    int _1290 = _1274 * int(_1284);
    int _1292 = _1290 + _1270;
    float _1294 = float(uint(_1292));
    float _1296 = -_1288;
    float _1298 = _1296 + 1.0;
    float _1300 = as_type<float>(_1041) * _1294;
    float _1302 = trunc(_1300);
    float _1304 = precise::max(_1302, 0.0);
    uint _1306 = uint(_1304);
    int _1308 = int(_1284) + int(_1306);
    int _1310 = _1254 * _1308;
    int _1312 = _1310 + _1270;
    bool _1314 = uint(_1312) >= uint(_917);
    bool _1316 = !_1314;
    int _1318 = _1316 ? 0 : (-1);
    int _1320 = ~_1308;
    int _1322 = _1320 + _1318;
    int _1324 = _1322 + 1;
    float _1326 = in.m_54.w;
    int _1328 = _917 * _1324;
    int _1330 = _1328 + _1270;
    float _1332 = in.m_54.z;
    float _1334 = _901 * 2.0;
    bool _1336 = !_959;
    int _1338 = _1336 ? _1330 : (-1);
    float _1340 = floor(_1334);
    int _1342 = _1338 & 3;
    bool _1344 = _1342 != 0;
    bool _1346 = uint(_1342) > 1u;
    bool _1348 = _1326 > 0.5;
    int _1350 = _1344 ? 0 : 1;
    bool _1352 = _1332 > 0.5;
    bool _1354 = _1340 >= 0.0;
    bool _1356 = isnan(_1340);
    bool _1358 = _1354 || _1356;
    bool _1360 = isnan(0.0);
    bool _1362 = _1358 || _1360;
    int _1364 = ~_1350;
    int _1366 = _1364 + 1;
    int _1368 = _1366 + 1;
    float _1370 = -_221;
    int _1372 = _1352 ? as_type<int>(_1370) : as_type<int>(_221);
    int _1374 = _1368;
    float _1376 = as_type<float>(_1306);
    if (!_1346)
    {
        int _1378 = ~_1350;
        int _1380 = _1378 + 1;
        _1374 = _1380;
    }
    int _1382 = _1374;
    float _1384 = -_225;
    int _1386 = _1348 ? as_type<int>(_1384) : as_type<int>(_225);
    int _1388 = _1362 ? 0 : 1;
    bool _1390 = _1340 > 0.0;
    bool _1392 = _901 > 0.5;
    int _1394 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1396 = _1394 != 0;
    int _1398 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1400 = _1398 != 0;
    float _1402 = -_221;
    int _1404 = _1392 ? as_type<int>(_1402) : as_type<int>(_221);
    int _1406 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1408 = _1406 != 0;
    int _1410 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1412 = _1410 != 0;
    int _1414 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1416 = _1414 != 0;
    int _1418 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1420 = _1418 != 0;
    float _1422 = _439 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _1424 = ~_1388;
    int _1426 = _1424 + 1;
    int _1428 = _1426 + 1;
    float _1430 = fma(_449, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1422);
    float _1432 = _1332 * 2.0;
    float _1434 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1436 = _1434 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    int _1438 = _1428;
    if (!_1390)
    {
        int _1440 = ~_1388;
        int _1442 = _1440 + 1;
        _1438 = _1442;
    }
    int _1444 = _1438;
    float _1446 = fma(_471, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1430);
    float _1448 = floor(_1432);
    float _1450 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1452 = _1450 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1454 = !_1396;
    float _1456 = _1454 ? _221 : as_type<float>(_1372);
    float _1458 = fma(_471, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1260);
    bool _1460 = !_1400;
    float _1462 = _1460 ? _225 : as_type<float>(_1386);
    float _1464 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1466 = _1464 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    int _1468 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1470 = _1468 != 0;
    float _1472 = _1446 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1474 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1476 = _1474 != 0;
    float _1478 = 1.0 / _1436;
    int _1480 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1482 = _1480 != 0;
    if (!_1420)
    {
        _1376 = _1332;
    }
    float _1484 = _1376;
    float _1486 = 1.0 / _1452;
    float _1488 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1490 = _1488 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1492 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1494 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1492;
    float _1496 = 0.0;
    float _1498 = _1484;
    if (!_1420)
    {
        _1496 = _1332;
    }
    float _1500 = _1496;
    float _1502 = _1490 * _1035;
    float _1504 = _1500;
    if (_1420)
    {
        _1498 = as_type<float>(_1063);
    }
    float _1506 = _1498;
    float _1508 = 1.0 / _1466;
    if (_1420)
    {
        _1504 = as_type<float>(_1063);
    }
    float _1510 = _1504;
    float _1512 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _1514 = _1512 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    bool _1516 = _1448 >= 0.0;
    bool _1518 = isnan(_1448);
    bool _1520 = _1516 || _1518;
    bool _1522 = isnan(0.0);
    bool _1524 = _1520 || _1522;
    float _1526 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1528 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1526;
    float _1530 = _1494 * _1051;
    float _1532 = _1514 * _1067;
    float _1534 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _1536 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _1534;
    float _1538 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1540 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1538;
    int _1542 = _1524 ? 0 : 1;
    float _1544 = _1528 * _1478;
    bool _1546 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1548 = isnan(0.0);
    bool _1550 = _1546 || _1548;
    bool _1552 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1554 = _1550 || _1552;
    float _1556 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1558 = _1556 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1560 = _1536 * _1078;
    float _1562 = _1540 * _1486;
    float _1564 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1566 = _1564 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1568 = _1554 ? _1298 : 0.0;
    float _1570 = _1558 * _1102;
    bool _1572 = _1448 > 0.0;
    float _1574 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1576 = _895 + _1574;
    float _1578 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1580 = _891 + _1578;
    float _1582 = _1566 * _1508;
    float _1584 = fma(_1502, _1576, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1586 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1588 = _891 + _1586;
    float _1590 = fma(_1532, _1580, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _1592 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1594 = _891 + _1592;
    float _1596 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1598 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1596;
    bool _1600 = _891 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1602 = isnan(_891);
    bool _1604 = _1600 || _1602;
    bool _1606 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1608 = _1604 || _1606;
    float _1610 = float(_1608);
    float _1612 = fma(_1544, _1588, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _1614 = fma(_1582, _1594, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    bool _1616 = _891 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1618 = isnan(_891);
    bool _1620 = _1616 || _1618;
    bool _1622 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1624 = _1620 || _1622;
    float _1626 = float(_1624);
    float _1628 = _1598 * _1132;
    float _1630 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1632 = _895 + _1630;
    float _1634 = -_1610;
    float _1636 = _1634 + 1.0;
    float _1638 = fma(_1560, _905, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    bool _1640 = _891 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1642 = isnan(_891);
    bool _1644 = _1640 || _1642;
    bool _1646 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1648 = _1644 || _1646;
    float _1650 = float(_1648);
    float _1652 = -_1626;
    float _1654 = _1652 + 1.0;
    float _1656 = fma(_1530, _1632, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1658 = _1626 * _1636;
    bool _1660 = _895 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1662 = isnan(_895);
    bool _1664 = _1660 || _1662;
    bool _1666 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1668 = _1664 || _1666;
    float _1670 = float(_1668);
    float _1672 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1674 = _891 + _1672;
    bool _1676 = _891 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1678 = isnan(_891);
    bool _1680 = _1676 || _1678;
    bool _1682 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1684 = _1680 || _1682;
    float _1686 = float(_1684);
    float _1688 = _1650 * _1654;
    float _1690 = -_1650;
    float _1692 = _1690 + 1.0;
    float _1694 = fma(_1562, _1674, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _1696 = -_1670;
    float _1698 = _1696 + 1.0;
    float _1700 = _1686 * _1692;
    float _1702 = -_1686;
    float _1704 = _1702 + 1.0;
    bool _1706 = _891 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1708 = isnan(_891);
    bool _1710 = _1706 || _1708;
    bool _1712 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1714 = _1710 || _1712;
    float _1716 = float(_1714);
    float _1718 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1720 = 1.0 + _1718;
    float _1722 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1724 = _891 + _1722;
    float _1726 = _1003 * _1704;
    float _1728 = _1015 * _1039;
    float _1730 = -_1015;
    float _1732 = _1730 + 1.0;
    float _1734 = _985 * _1698;
    float _1736 = 1.0 / _1720;
    float _1738 = -_985;
    float _1740 = _1738 + 1.0;
    float _1742 = _1027 * _1732;
    float _1744 = -_1027;
    float _1746 = _1744 + 1.0;
    float _1748 = fma(_1628, _1724, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _1750 = _971 * _1740;
    float _1752 = fma(_1570, _909, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _1754 = _1716 * _1746;
    float _1756 = _1656 * _1750;
    float _1758 = -_971;
    float _1760 = _1758 + 1.0;
    float _1762 = _1638 * _1754;
    float _1764 = -_1716;
    float _1766 = _1764 + 1.0;
    float _1768 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1770 = _1061 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1772 = _1568 * _1736;
    float _1774 = fma(_1061, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1768);
    float _1776 = fma(_1766, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1762);
    float _1778 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1780 = fma(_1590, _1742, _1776);
    float _1782 = _1506 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1784 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1786 = fma(_1510, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1778);
    float _1788 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _1790 = !_1476;
    float _1792 = _1790 ? _221 : as_type<float>(_1404);
    float _1794 = _901 + as_type<float>(_1063);
    float _1796 = as_type<float>(_1063) * 2.0;
    float _1798 = -_1784;
    float _1800 = fma(_1770, 2.0, _1798);
    float _1802 = fma(_1782, -2.0, _1788);
    float _1804 = _1794 + (-1.0);
    float _1806 = float(uint(_1236));
    float _1808 = floor(_1796);
    bool _1810 = !_1412;
    int _1812 = _1810 ? 0 : 1;
    float _1814 = fma(_1804, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1816 = fma(_1760, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1756);
    float _1818 = as_type<float>(_1041) * _1806;
    bool _1820 = !_1408;
    int _1822 = _1820 ? 0 : 1;
    float _1824 = fma(_1612, _1728, _1780);
    bool _1826 = as_type<float>(_1063) > 0.5;
    float _1828 = fma(_1584, _1734, _1816);
    int _1830 = abs(_1812);
    float _1832 = _1266 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1834 = ~_1542;
    int _1836 = _1834 + 1;
    int _1838 = _1836 + 1;
    float _1840 = trunc(_1818);
    float _1842 = precise::max(_1840, 0.0);
    uint _1844 = uint(_1842);
    int _1846 = _1838;
    if (!_1572)
    {
        int _1848 = ~_1542;
        int _1850 = _1848 + 1;
        _1846 = _1850;
    }
    int _1852 = _1846;
    float _1854 = _1332 + as_type<float>(_1063);
    float _1856 = -_225;
    int _1858 = _1826 ? as_type<int>(_1856) : as_type<int>(_225);
    float _1860 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1862 = _1472 + _1860;
    int _1864 = abs(_1822);
    float _1866 = _1458 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1868 = uint(_1342) >= 2u;
    float _1870 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1872 = _1832 + _1870;
    float _1874 = _1854 + (-1.0);
    bool _1876 = _1808 >= 0.0;
    bool _1878 = isnan(_1808);
    bool _1880 = _1876 || _1878;
    bool _1882 = isnan(0.0);
    bool _1884 = _1880 || _1882;
    float _1886 = -_123;
    float _1888 = fma(_1886, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1800);
    int _1890 = _1868 ? 0 : 1;
    float _1892 = _1872 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _1894 = _1808 > 0.0;
    float _1896 = fma(_1670, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1828);
    int _1898 = ~_917;
    int _1900 = _1898 + 1;
    float _1902 = fma(_1862, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1892);
    float _1904 = float(_1864);
    float _1906 = _1456 + 0.5;
    float _1908 = float(_1852);
    float _1910 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1912 = _1866 + _1910;
    float _1914 = float(_1830);
    float _1916 = fma(_1906, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1888);
    float _1918 = float(_1444);
    float _1920 = _1904 * _1908;
    float _1922 = fma(_1912, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1902);
    int _1924 = _1338 >> 31;
    float _1926 = _1914 * _1918;
    bool _1928 = !_1482;
    float _1930 = _1928 ? _225 : as_type<float>(_1858);
    int _1932 = _1900 * int(_1844);
    int _1934 = _1932 + _1236;
    float _1936 = _1462 + (-0.5);
    float _1938 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1802);
    int _1940 = _1924 & 3;
    float _1942 = _1896 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1944 = float(uint(_1934));
    float _1946 = -_1936;
    float _1948 = -_1938;
    float _1950 = fma(_1946, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1948);
    int _1952 = _1338 + _1940;
    float _1954 = fma(_1614, _1726, _1824);
    bool _1956 = _1922 >= 0.0;
    float _1958 = as_type<float>(_1041) * _1944;
    int _1960 = _1952 >> 2;
    float _1962 = _847 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1964 = _849 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1966 = _851 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1968 = _1960 << 4;
    int _1970 = _1968 + 512;
    float _1972 = in.m_58.x;
    float _1974 = in.m_58.y;
    float _1976 = in.m_58.z;
    float _1978 = trunc(_1958);
    float _1980 = precise::max(_1978, 0.0);
    uint _1982 = uint(_1980);
    float _1984 = fma(_1694, _1700, _1954);
    uint _1986 = uint(int(uint(_1970) >> uint(2)));
    uint _1988 = uint(int(uint(int(_1986)) >> uint(2)));
    int _1990 = int(_1986) & 3;
    float _1992 = (*spvDescriptorSet0.vp_c9)._m0[int(_1988)][_1990];
    int _1994 = int(_1986) + 1;
    uint _1996 = uint(int(uint(_1994) >> uint(2)));
    int _1998 = _1994 & 3;
    float _2000 = (*spvDescriptorSet0.vp_c9)._m0[int(_1996)][_1998];
    float _2002 = _1962 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2004 = _1964 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2006 = _1966 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2008 = _1884 ? 0 : 1;
    float _2010 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1774);
    float _2012 = _1920 * (-2.0);
    float _2014 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _2016 = _1970 + 8;
    uint _2018 = uint(int(uint(_2016) >> uint(2)));
    uint _2020 = uint(int(uint(int(_2018)) >> uint(2)));
    int _2022 = int(_2018) & 3;
    float _2024 = (*spvDescriptorSet0.vp_c9)._m0[int(_2020)][_2022];
    int _2026 = int(_2018) + 1;
    uint _2028 = uint(int(uint(_2026) >> uint(2)));
    int _2030 = _2026 & 3;
    float _2032 = (*spvDescriptorSet0.vp_c9)._m0[int(_2028)][_2030];
    out.m_60.x = _2002;
    out.m_60.y = _2004;
    out.m_60.z = _2006;
    out.m_60.w = _1942;
    int _2034 = ~_2008;
    int _2036 = _2034 + 1;
    int _2038 = _2036 + 1;
    float _2040 = fma(_1814, _2012, _1814);
    int _2042 = _2038;
    if (!_1894)
    {
        int _2044 = ~_2008;
        int _2046 = _2044 + 1;
        _2042 = _2046;
    }
    int _2048 = _2042;
    float _2050 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1786);
    int _2052 = int(_1844) + int(_1982);
    float _2054 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2056 = -_1930;
    float _2058 = _2056 + 0.5;
    bool _2060 = _1342 != 3;
    float _2062 = fma(_1752, _1688, _1984);
    int _2064 = _1338 & 3;
    bool _2066 = _2064 != 0;
    float _2068 = fma(_2012, _1972, _1972);
    float _2070 = _1792 + 0.5;
    float _2072 = -_2010;
    float _2074 = _2072 + 1.0;
    int _2076 = ~_917;
    int _2078 = _2076 + 1;
    float _2080 = fma(_1874, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _2082 = !_2066;
    int _2084 = _2082 ? 0 : 1;
    float _2086 = -_2074;
    float _2088 = fma(_1456, _2086, _1916);
    float _2090 = _2070 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2092 = -_2050;
    float _2094 = _2092 + 1.0;
    float _2096 = _2058 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _2098 = abs(_1382);
    int _2100 = _2078 * _2052;
    int _2102 = _2100 + _1236;
    int _2104 = abs(_2084);
    float _2106 = _2090 * _2014;
    float _2108 = fma(_1462, _2094, _1950);
    float _2110 = _2096 * _2054;
    bool _2112 = uint(_2102) >= uint(_917);
    float _2114 = fma(_1748, _1658, _2062);
    float _2116 = _1926 * (-2.0);
    bool _2118 = !_2112;
    int _2120 = _2118 ? 0 : (-1);
    out.m_62.x = _2106;
    out.m_62.y = _2110;
    out.m_62.z = _2088;
    out.m_62.w = _2108;
    int _2122 = ~_1890;
    int _2124 = _2122 + 1;
    int _2126 = _2124 + 1;
    float _2128 = fma(_1610, (*spvDescriptorSet0.vp_c9)._m0[158].x, _2114);
    bool _2130 = _1342 != 3;
    int _2132 = _2126;
    if (_1956)
    {
        out.m_45.x = 0.0;
    }
    if (_2060)
    {
        int _2134 = ~_1890;
        int _2136 = _2134 + 1;
        _2132 = _2136;
    }
    int _2138 = _2132;
    float _2140 = fma(_2080, _2116, _2080);
    out.m_64.x = _2128;
    int _2142 = ~_2098;
    int _2144 = _2142 + 1;
    int _2146 = _2144 + 1;
    float _2148 = fma(_2116, _1974, _1974);
    int _2150 = abs(_2138);
    int _2152 = ~_2052;
    int _2154 = _2152 + _2120;
    int _2156 = _2154 + 1;
    int _2158 = _2146 * as_type<int>(_2000);
    bool _2160 = !_2130;
    int _2162 = _2160 ? 0 : (-1);
    int _2164 = ~_2104;
    int _2166 = _2164 + 1;
    int _2168 = _2166 + 1;
    bool _2170 = !_1470;
    int _2172 = _2170 ? 0 : 1;
    int _2174 = abs(_2162);
    int _2176 = _2168 * as_type<int>(_1992);
    int _2178 = _2176 + _2158;
    float _2180 = _1872 * _1872;
    int _2182 = abs(_2172);
    float _2184 = _901 + (-0.5);
    int _2186 = ~_2150;
    int _2188 = _2186 + 1;
    int _2190 = _2188 + 1;
    int _2192 = ~_2174;
    int _2194 = _2192 + 1;
    int _2196 = _2194 + 1;
    bool _2198 = _917 == 0;
    int _2200 = _2190 * as_type<int>(_2024);
    int _2202 = _2200 + _2178;
    float _2204 = fma(_1862, _1862, _2180);
    float _2206 = fma(_2184, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2068);
    int _2208 = _917 * _2156;
    int _2210 = _2208 + _1236;
    int _2212 = ~_2182;
    int _2214 = _2212 + 1;
    int _2216 = _2214 + 1;
    int _2218 = _2196 * as_type<int>(_2032);
    int _2220 = _2218 + _2202;
    float _2222 = fma(_1912, _1912, _2204);
    float _2224 = _2204;
    if (_1956)
    {
        _2224 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2226 = _2224;
    float _2228 = as_type<float>(_1063) + (-0.5);
    bool _2230 = !_2198;
    int _2232 = _2230 ? _2210 : (-1);
    int _2234 = _2216 * _2220;
    bool _2236 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2238 = isnan(1.0);
    bool _2240 = _2236 || _2238;
    bool _2242 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2244 = _2240 || _2242;
    float _2246 = rsqrt(_2222);
    int _2248 = _2232 * _2182;
    int _2250 = _2248 + _2234;
    int _2252 = as_type<int>(_2226);
    if (_1956)
    {
        float _2254 = _2226 * 5.0;
        _2252 = as_type<int>(_2254);
    }
    int _2256 = _2252;
    float _2258 = _927 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    bool _2260 = !_2244;
    float _2262 = _2260 ? _123 : _1772;
    float _2264 = float(_2250);
    if (_1956)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6873 = as_type<float>(_2256);
        out.gl_Position.z = _6873;
    }
    bool _2266 = !_1416;
    int _2268 = _2266 ? 0 : 1;
    float _2270 = fma(_2262, _2040, _2206);
    out.m_66.y = _2264;
    float _2272 = _2258 * _2246;
    int _2274 = abs(_2268);
    float _2276 = _1862 * _2272;
    float _2278 = _1872 * _2272;
    if (_1956)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2280 = -_2278;
    float _2282 = _1832 + _2280;
    float _2284 = _1912 * _2272;
    float _2286 = -_2276;
    float _2288 = _1472 + _2286;
    float _2290 = -_2278;
    float _2292 = _1872 + _2290;
    float _2294 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2296 = _2282 + _2294;
    float _2298 = -_2284;
    float _2300 = _1866 + _2298;
    float _2302 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2304 = _2288 + _2302;
    float _2306 = float(_2274);
    float _2308 = _2296 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2310 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2312 = _2300 + _2310;
    float _2314 = float(_2048);
    float _2316 = fma(_2228, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2148);
    float _2318 = fma(_2304, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2308);
    float _2320 = -_2276;
    float _2322 = _1862 + _2320;
    float _2324 = -_2284;
    float _2326 = _1912 + _2324;
    float _2328 = fma(_2262, _2140, _2316);
    float _2330 = fma(_2312, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2318);
    float _2332 = _2292 * _2292;
    float _2334 = _2306 * _2314;
    float _2336 = _901 + _1332;
    float _2338 = _2270 * 0.15915493667125701904296875;
    bool _2340 = _2330 >= 0.0;
    float _2342 = fma(_2322, _2322, _2332);
    float _2344 = _2328 * 0.15915493667125701904296875;
    float _2346 = _2336 + (-1.0);
    float _2348 = fma(_2326, _2326, _2342);
    float _2350 = _2334 * (-2.0);
    float _2352 = _2344 * 6.283185482025146484375;
    float _2354 = sin(_2352);
    float _2356 = fma(_2346, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2358 = _1332 + (-0.5);
    float _2360 = fma(_2350, _1976, _1976);
    float _2362 = fma(_2356, _2350, _2356);
    float _2364 = _2326;
    int _2366 = as_type<int>(_2360);
    float _2368 = _2304;
    float _2370 = _2300;
    if (_2340)
    {
        _2364 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2372 = _2364;
    float _2374 = fma(_2358, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2360);
    float _2376 = _2338 * 6.283185482025146484375;
    float _2378 = sin(_2376);
    if (_2340)
    {
        out.m_45.x = 0.0;
    }
    if (_2340)
    {
        float _2380 = _2372 * 5.0;
        _2366 = as_type<int>(_2380);
    }
    int _2382 = _2366;
    float _2384 = fma(_2262, _2362, _2374);
    float _2386 = _2338 * 6.283185482025146484375;
    float _2388 = cos(_2386);
    if (_2340)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7072 = as_type<float>(_2382);
        out.gl_Position.z = _7072;
    }
    float _2390 = _2384 * 0.15915493667125701904296875;
    float _2392 = sqrt(_2348);
    float _2394 = _2344 * 6.283185482025146484375;
    float _2396 = cos(_2394);
    if (_2340)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2398 = _2390 * 6.283185482025146484375;
    float _2400 = cos(_2398);
    float _2402 = _2246 * _2392;
    float _2404 = _595 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2406 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _225);
    float _2408 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _221);
    float _2410 = _927 * _2402;
    float _2412 = _2402 * _2404;
    float _2414 = _2378 * _2354;
    float _2416 = _2390 * 6.283185482025146484375;
    float _2418 = sin(_2416);
    float _2420 = _2408 * _2410;
    float _2422 = _2406 * _2412;
    float _2424 = _2388 * _2396;
    float _2426 = _2388 * _2354;
    float _2428 = _2400 * _2422;
    float _2430 = _2354 * _2400;
    float _2432 = _2378 * _2396;
    float _2434 = _2396 * _2400;
    float _2436 = _2388 * _2428;
    float _2438 = _2402 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2440 = _2438 * 0.5;
    float _2442 = _2378 * _2428;
    float _2444 = fma(_2418, _2424, _2414);
    float _2446 = -_2422;
    float _2448 = _2418 * _2446;
    float _2450 = -_2432;
    float _2452 = fma(_2418, _2426, _2450);
    float _2454 = -_2426;
    float _2456 = fma(_2418, _2432, _2454);
    float _2458 = fma(_2444, _2420, _2436);
    float _2460 = fma(_2434, _2420, _2448);
    float _2462 = fma(_2418, _2414, _2424);
    float _2464 = fma(_2456, _2420, _2442);
    float _2466 = fma(_2452, _2440, _2458);
    float _2468 = fma(_2430, _2440, _2460);
    float _2470 = fma(_2462, _2440, _2464);
    float _2472 = _2466 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2474 = _2466 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2476 = fma(_2468, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2472);
    float _2478 = fma(_2468, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2474);
    float _2480 = fma(_2470, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2476);
    float _2482 = fma(_2470, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2478);
    float _2484 = _2480 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2486 = _2482 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2488 = _1866 + _2484;
    float _2490 = _1472 + _2486;
    float _2492 = _2466 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2494 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2496 = _2488 + _2494;
    float _2498 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2500 = _2490 + _2498;
    float _2502 = fma(_2468, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2492);
    float _2504 = _2496 * _2496;
    float _2506 = fma(_2470, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2502);
    float _2508 = fma(_2500, _2500, _2504);
    float _2510 = _2506 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2512 = sqrt(_2508);
    float _2514 = _1832 + _2510;
    bool _2516 = _2512 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2518 = _2506;
    float _2520 = _2490;
    float _2522 = _2510;
    float _2524 = _2496;
    float _2526 = _2508;
    if (!_2516)
    {
        _2518 = _2490;
    }
    float _2528 = _2518;
    float _2530 = _2528;
    if (!_2516)
    {
        _2520 = _2488;
    }
    float _2532 = _2520;
    float _2534 = _2532;
    if (!_2516)
    {
        _2522 = _2514;
    }
    float _2536 = _2522;
    bool _2538 = !_2516;
    float _2540 = _2536;
    if (!_2538)
    {
        float _2542 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2544 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2546 = _2512 + _2544;
        float _2548 = _2514 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2550 = rsqrt(_2508);
        float _2552 = _2546 * _2542;
        float _2554 = _2552 * 0.15915493667125701904296875;
        float _2556 = _2554 * 6.283185482025146484375;
        float _2558 = cos(_2556);
        float _2560 = _2554 * 6.283185482025146484375;
        float _2562 = sin(_2560);
        float _2564 = _2558 + (-1.0);
        float _2566 = fma(_2562, _2548, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2568 = _2564 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2570 = _2550 * _2566;
        float _2572 = fma(_2514, _2558, _2568);
        float _2574 = fma(_2500, _2570, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2576 = fma(_2496, _2570, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2540 = _2572;
        _2530 = _2574;
        _2534 = _2576;
    }
    float _2578 = _2540;
    float _2580 = _2530;
    float _2582 = _2534;
    float _2584 = -_1832;
    float _2586 = _2584 + _2578;
    float _2588 = -_1472;
    float _2590 = _2588 + _2580;
    float _2592 = -_1866;
    float _2594 = _2592 + _2582;
    float _2596 = _2586 * _2586;
    float _2598 = fma(_2590, _2590, _2596);
    float _2600 = fma(_2594, _2594, _2598);
    float _2602 = sqrt(_2600);
    bool _2604 = _2602 > 0.0;
    float _2606 = _2598;
    float _2608 = _2602;
    float _2610 = _2582;
    if (!_2604)
    {
        _2606 = _2580;
    }
    float _2612 = _2606;
    float _2614 = _2612;
    float _2616 = _2612;
    if (!_2604)
    {
        _2608 = _2578;
    }
    float _2618 = _2608;
    bool _2620 = !_2604;
    float _2622 = _2618;
    float _2624 = _2618;
    if (!_2620)
    {
        bool _2626 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2628 = _2488;
        if (_2626)
        {
            float _2630 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2628 = _2630;
        }
        float _2632 = _2628;
        float _2634 = _2632;
        if (_2626)
        {
            float _2636 = _473 * _2632;
            _2524 = _2636;
        }
        float _2638 = _2524;
        float _2640 = _2638;
        if (_2626)
        {
            float _2642 = _475 * _2632;
            _2526 = _2642;
        }
        float _2644 = _2526;
        float _2646 = _2644;
        if (_2626)
        {
            float _2648 = _477 * _2632;
            _2634 = _2648;
        }
        float _2650 = _2634;
        float _2652 = _2650;
        if (!_2626)
        {
            bool _2654 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
            bool _2656 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
            bool _2658 = _2654 || _2656;
            bool _2660 = isnan(1.0);
            bool _2662 = _2658 || _2660;
            float _2664 = _123 + 1.0;
            if (!_2662)
            {
                float _2666 = _2664 * _2664;
                float _2668 = _2666 * 0.5;
                _125 = _2668;
            }
            float _2670 = _125;
            float _2672 = _2670;
            if (!_2662)
            {
                float _2674 = _2670 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2672 = _2674;
            }
            float _2676 = _2672;
            bool _2678 = !_2662;
            float _2680 = _2676;
            if (!_2678)
            {
                float _2682 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2684 = log2(_2682);
                float _2686 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2688 = 1.0 + _2686;
                float _2690 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2692 = _2684 * _2664;
                float _2694 = 1.0 / _2688;
                float _2696 = _2690 * 0.693147182464599609375;
                float _2698 = exp2(_2692);
                float _2700 = 1.0 / _2696;
                float _2702 = _2698 + (-1.0);
                float _2704 = -_2702;
                float _2706 = fma(_2704, _2700, _2664);
                float _2708 = _2706 * _2694;
                float _2710 = _2708 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2680 = _2710;
            }
            float _2712 = _2680;
            float _2714 = _2712 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _2716 = _2712 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2718 = _2712 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2720 = _2712;
            if (!_2662)
            {
                _2720 = _2664;
            }
            float _2722 = _2720;
            float _2724 = _2714 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
            float _2726 = _2714 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
            float _2728 = _2714 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
            float _2730 = fma(_2716, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2724);
            float _2732 = fma(_2716, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2726);
            float _2734 = fma(_2718, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2730);
            bool _2736 = !_2662;
            float _2738 = _2722;
            _2614 = _2732;
            if (!_2736)
            {
                float _2740 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2742 = log2(_2740);
                float _2744 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2746 = 1.0 + _2744;
                float _2748 = 1.0 / _2746;
                float _2750 = _2742 * _2664;
                float _2752 = exp2(_2750);
                float _2754 = -_2752;
                float _2756 = _2754 + 1.0;
                float _2758 = _2756 * _2748;
                _2738 = _2758;
            }
            float _2760 = _2738;
            float _2762 = fma(_2716, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2728);
            float _2764 = fma(_2718, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2732);
            float _2766 = fma(_2760, _163, _2734);
            float _2768 = fma(_2718, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2762);
            float _2770 = fma(_2760, _161, _2764);
            float _2772 = -_435;
            float _2774 = _2772 + _2766;
            float _2776 = fma(_2760, _165, _2768);
            float _2778 = -_441;
            float _2780 = _2778 + _2770;
            float _2782 = _2774 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _2784 = _2774 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _2786 = _2774 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _2788 = -_447;
            float _2790 = _2788 + _2776;
            float _2792 = fma(_2780, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2782);
            float _2794 = fma(_2780, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2784);
            float _2796 = fma(_2780, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2786);
            float _2798 = fma(_2790, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2792);
            float _2800 = fma(_2790, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2794);
            float _2802 = fma(_2790, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2796);
            _481 = _2800;
            _483 = _2798;
            _485 = _2802;
            _2640 = _2798;
            _2646 = _2800;
            _2652 = _2802;
            _2622 = _2768;
        }
        float _2804 = _481;
        float _2806 = _483;
        float _2808 = _485;
        float _2810 = _2640;
        float _2812 = _2646;
        float _2814 = _2652;
        float _2816 = _2614;
        float _2818 = _2622;
        float _2820 = _2804 * _2804;
        float _2822 = rsqrt(_2600);
        float _2824 = fma(_2806, _2806, _2820);
        float _2826 = fma(_2808, _2808, _2824);
        float _2828 = sqrt(_2826);
        float _2830 = _2590 * _2822;
        float _2832 = _2586 * _2822;
        float _2834 = _2594 * _2822;
        bool _2836 = _2828 > 0.0;
        float _2838 = _2816;
        float _2840 = _2818;
        if (!_2836)
        {
            _2838 = _2580;
        }
        float _2842 = _2838;
        _2616 = _2842;
        if (!_2836)
        {
            _2840 = _2578;
        }
        float _2844 = _2840;
        bool _2846 = !_2836;
        _2624 = _2844;
        if (!_2846)
        {
            float _2848 = rsqrt(_2826);
            float _2850 = _2848 * _2804;
            float _2852 = _2848 * _2806;
            float _2854 = _2848 * _2808;
            float _2856 = _2832 * _2850;
            float _2858 = fma(_2830, _2852, _2856);
            float _2860 = fma(_2834, _2854, _2858);
            float _2862 = _2860 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2864 = fma(_2810, _2862, _2580);
            float _2866 = fma(_2812, _2862, _2578);
            float _2868 = fma(_2814, _2862, _2582);
            _2616 = _2864;
            _2610 = _2868;
            _2624 = _2866;
        }
    }
    float _2870 = _2616;
    float _2872 = _2610;
    float _2874 = _2624;
    float _2876 = _2282 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _2878 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2880 = isnan(0.5);
    bool _2882 = _2878 || _2880;
    bool _2884 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2886 = _2882 || _2884;
    float _2888 = -_2276;
    float _2890 = _2888 + _2870;
    bool _2892 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2894 = isnan(0.5);
    bool _2896 = _2892 || _2894;
    bool _2898 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2900 = _2896 || _2898;
    float _2902 = fma(_2288, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2876);
    float _2904 = -_2284;
    float _2906 = _2904 + _2872;
    float _2908 = fma(_2300, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2902);
    float _2910 = _2282 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2912 = _2908 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2914 = fma(_2288, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2910);
    float _2916 = 1.0 / _2912;
    float _2918 = fma(_2300, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2914);
    float _2920 = _2918 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2922 = _2920 + _2912;
    float _2924 = _2922 * _2916;
    float _2926 = _2924 * 0.5;
    float _2928 = -_2278;
    float _2930 = _2928 + _2874;
    float _2932 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2934 = fma(_2926, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2932);
    float _2936 = _2926;
    float _2938 = _2930;
    float _2940 = _2890;
    float _2942 = _2906;
    float _2944 = _2912;
    if (_2900)
    {
        _2936 = 1.0;
    }
    float _2946 = _2936;
    float _2948 = 1.0 / _2934;
    float _2950 = _2946;
    if (!_2886)
    {
        float _2952 = _2296 * _2296;
        float _2954 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2956 = -_1866;
        float _2958 = _2956 + _2872;
        float _2960 = -_1832;
        float _2962 = _2960 + _2874;
        float _2964 = fma(_2304, _2304, _2952);
        float _2966 = fma(_2312, _2312, _2964);
        float _2968 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2970 = sqrt(_2966);
        float _2972 = _2954 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2974 = 1.0 / _2402;
        float _2976 = precise::min(_2970, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2978 = _2976 * _2968;
        float _2980 = _2978 * _2974;
        float _2982 = -_1472;
        float _2984 = _2982 + _2870;
        float _2986 = _2972 * _2980;
        float _2988 = _2958 * _2980;
        float _2990 = fma(_2984, _2986, _2288);
        float _2992 = fma(_2962, _2986, _2282);
        float _2994 = fma(_2972, _2988, _2300);
        _2938 = _2992;
        _2940 = _2990;
        _2942 = _2994;
        _2368 = _2970;
        _2944 = _2980;
    }
    float _2996 = _2938;
    float _2998 = _2940;
    float _3000 = _2942;
    float _3002 = _2368;
    float _3004 = _2944;
    float _3006 = _3004;
    float _3008 = _3002;
    if (_2900)
    {
        _3006 = 1.0;
    }
    float _3010 = _3006;
    float _3012 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3014 = _2948 * _3012;
    float _3016 = _3010;
    float _3018 = _3014;
    if (!_2900)
    {
        float _3020 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3022 = _3020 * 0.15915493667125701904296875;
        float _3024 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3026 = _3022 * 6.283185482025146484375;
        float _3028 = cos(_3026);
        float _3030 = _3024 * 0.15915493667125701904296875;
        float _3032 = _3022 * 6.283185482025146484375;
        float _3034 = sin(_3032);
        float _3036 = 1.0 / _3028;
        float _3038 = _3030 * 6.283185482025146484375;
        float _3040 = cos(_3038);
        float _3042 = _3034 * _3036;
        float _3044 = _3030 * 6.283185482025146484375;
        float _3046 = sin(_3044);
        float _3048 = _3040 * _3042;
        float _3050 = 1.0 / _3048;
        float _3052 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3054 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3052;
        float _3056 = 1.0 / _3054;
        float _3058 = _3046 * _3050;
        float _3060 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3062 = fma(_3014, _3058, _3060);
        float _3064 = _3062 * _3056;
        float _3066 = precise::clamp(_3064, 0.0, 1.0);
        _2370 = _3056;
        _2950 = _3066;
    }
    float _3068 = _2370;
    float _3070 = _2950;
    float _3072 = _3068;
    if (!_2900)
    {
        float _3074 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3076 = _3074 * 0.15915493667125701904296875;
        float _3078 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3080 = _3076 * 6.283185482025146484375;
        float _3082 = cos(_3080);
        float _3084 = _3078 * 0.15915493667125701904296875;
        float _3086 = _3076 * 6.283185482025146484375;
        float _3088 = sin(_3086);
        float _3090 = 1.0 / _3082;
        float _3092 = _3084 * 6.283185482025146484375;
        float _3094 = cos(_3092);
        float _3096 = _3088 * _3090;
        float _3098 = _3084 * 6.283185482025146484375;
        float _3100 = sin(_3098);
        float _3102 = _3094 * _3096;
        float _3104 = 1.0 / _3102;
        float _3106 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3108 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _3106;
        float _3110 = 1.0 / _3108;
        float _3112 = _3100 * _3104;
        float _3114 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3116 = fma(_3014, _3112, _3114);
        float _3118 = _3116 * _3110;
        float _3120 = precise::clamp(_3118, 0.0, 1.0);
        float _3122 = -_3120;
        float _3124 = _3122 + 1.0;
        _3008 = _3112;
        _3072 = _3090;
        _3016 = _3124;
    }
    float _3126 = _3008;
    float _3128 = _3072;
    float _3130 = _3016;
    float _3132 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3134 = _2996 + _3132;
    float _3136 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3138 = _2998 + _3136;
    float _3140 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3142 = _3000 + _3140;
    float _3144 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3146 = _3134 * _3134;
    float _3148 = fma(_3138, _3138, _3146);
    float _3150 = fma(_3142, _3142, _3148);
    float _3152 = rsqrt(_3150);
    float _3154 = sqrt(_3150);
    float _3156 = _3152 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3158 = _3138 * _3156;
    float _3160 = _3142 * _3156;
    float _3162 = _3158 * _3158;
    float _3164 = _3160 * _3160;
    float _3166 = _3162 + _3164;
    float _3168 = sqrt(_3166);
    bool _3170 = _3168 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3172 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3174 = _3168 + _3172;
    float _3176 = _3152;
    float _3178 = _3128;
    float _3180 = _3174;
    float _3182 = _3126;
    float _3184 = _3134;
    if (_3170)
    {
        float _3186 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3176 = _3186;
    }
    float _3188 = _3176;
    if (_3170)
    {
        float _3190 = rsqrt(_3166);
        _3178 = _3190;
    }
    float _3192 = _3178;
    float _3194 = _3192;
    if (_3170)
    {
        float _3196 = _3174 * _3188;
        _3180 = _3196;
    }
    float _3198 = _3180;
    if (_3170)
    {
        float _3200 = _3198 * 0.15915493667125701904296875;
        _3182 = _3200;
    }
    float _3202 = _3182;
    float _3204 = _3142;
    if (_3170)
    {
        float _3206 = _3202 * 6.283185482025146484375;
        float _3208 = sin(_3206);
        _3204 = _3208;
    }
    float _3210 = _3204;
    float _3212 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3214 = precise::max(0.0, _3212);
    float _3216 = _3188;
    float _3218 = _3214;
    if (_3170)
    {
        float _3220 = _3202 * 6.283185482025146484375;
        float _3222 = cos(_3220);
        _3216 = _3222;
    }
    float _3224 = _3216;
    float _3226 = -_3156;
    float _3228 = -_3214;
    float _3230 = fma(_3134, _3226, _3228);
    if (_3170)
    {
        float _3232 = _3230 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3184 = _3232;
    }
    float _3234 = _3184;
    float _3236 = _3234;
    float _3238 = _3210;
    if (_3170)
    {
        float _3240 = fma(_3210, _3234, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3236 = _3240;
    }
    float _3242 = _3236;
    float _3244 = _3242;
    if (!_3170)
    {
        _3238 = _3162;
    }
    float _3246 = _3238;
    float _3248 = _3246;
    float _3250 = _3224;
    if (_3170)
    {
        float _3252 = _3224 + (-1.0);
        _3218 = _3252;
    }
    float _3254 = _3218;
    float _3256 = _3254;
    if (_3170)
    {
        float _3258 = _3192 * _3242;
        _487 = _3258;
    }
    float _3260 = _487;
    if (!_3170)
    {
        _3194 = _3158;
    }
    float _3262 = _3194;
    float _3264 = _3262;
    if (_3170)
    {
        float _3266 = _3254 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3018 = _3266;
    }
    float _3268 = _3018;
    if (_3170)
    {
        float _3270 = _3158 * _3260;
        _3264 = _3270;
    }
    float _3272 = _3264;
    if (!_3170)
    {
        _3244 = _3230;
    }
    float _3274 = _3244;
    float _3276 = _3274;
    if (!_3170)
    {
        _3256 = _3160;
    }
    float _3278 = _3256;
    float _3280 = _3278;
    if (_3170)
    {
        float _3282 = fma(_3230, _3224, _3268);
        _3276 = _3282;
    }
    float _3284 = _3276;
    if (_3170)
    {
        float _3286 = _3160 * _3260;
        _3280 = _3286;
    }
    float _3288 = _3280;
    if (_3170)
    {
        float _3290 = _3272 * _3272;
        _3248 = _3290;
    }
    float _3292 = _3248;
    if (!_3170)
    {
        _3250 = _3164;
    }
    float _3294 = _3250;
    float _3296 = _3294;
    if (_3170)
    {
        float _3298 = _3288 * _3288;
        _3296 = _3298;
    }
    float _3300 = _3296;
    float _3302 = fma(_3284, _3284, _3292);
    float _3304 = _2996 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3306 = _3302 + _3300;
    float _3308 = fma(_2998, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3304);
    float _3310 = _2996 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3312 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3314 = fma(_3154, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3312);
    float _3316 = precise::clamp(_3314, 0.0, 1.0);
    float _3318 = rsqrt(_3306);
    float _3320 = fma(_3000, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3308);
    float _3322 = _2996 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3324 = fma(_2998, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3310);
    float _3326 = _2996 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3328 = -_3316;
    float _3330 = _3328 + 1.0;
    float _3332 = fma(_2998, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3322);
    float _3334 = fma(_3000, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3324);
    float _3336 = _3320 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3338 = fma(_2998, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3326);
    float _3340 = abs(_3330);
    float _3342 = log2(_3340);
    float _3344 = fma(_3000, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3332);
    float _3346 = _3334 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3348 = fma(_3000, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3338);
    float _3350 = _3336 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3352 = _3344 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3354 = _3346 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3356 = _3318 * _3272;
    float _3358 = _3318 * _3288;
    float _3360 = _3348 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3362 = fma(_3352, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3354);
    float _3364 = _3318 * _3284;
    float _3366 = _3356 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3368 = -_3350;
    float _3370 = fma(_3368, _3144, 1.0);
    float _3372 = fma(_3336, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3362);
    float _3374 = _3346 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3376 = -_3366;
    float _3378 = fma(_3364, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3376);
    float _3380 = _3342 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3382 = fma(_3360, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3372);
    float _3384 = log2(_3370);
    float _3386 = -_3358;
    float _3388 = fma(_3386, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3378);
    float _3390 = _3346 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3392 = fma(_3388, -0.5, 0.5);
    float _3394 = fma(_3352, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3390);
    float _3396 = fma(_3388, 0.5, 0.5);
    float _3398 = exp2(_3380);
    float _3400 = fma(_3352, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3374);
    float _3402 = _3364 + 1.0;
    float _3404 = fma(_3336, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3394);
    float _3406 = fma(_3396, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3408 = fma(_3336, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3400);
    float _3410 = 1.0 / _3382;
    float _3412 = sqrt(_3392);
    float _3414 = -_3364;
    float _3416 = fma(_3398, _3402, _3414);
    float _3418 = fma(_3360, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3404);
    float _3420 = fma(_3360, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3408);
    float _3422 = fma(_3396, _3406, -0.212114393711090087890625);
    float _3424 = _3384 * 0.693147182464599609375;
    float _3426 = fma(_3416, 0.5, 0.5);
    float _3428 = _3418 * _3410;
    float _3430 = _3420 * _3410;
    float _3432 = fma(_3396, _3422, 1.570728778839111328125);
    float _3434 = _3424 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3436 = fma(_3428, 0.5, 0.5);
    float _3438 = fma(_3430, -0.5, 0.5);
    float _3440 = _3412 * 0.636619746685028076171875;
    float3 _8712 = float3(_3436, _3438, _3434);
    float _3442 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8712, float3(0.0), isnan(_8712)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8712, float3(0.0), isnan(_8712)), level(0.0)).x;
    float _3444 = -_3432;
    float _3446 = fma(_3440, _3444, 1.0);
    float3 _8728 = float3(_3436, _3438, _3434);
    float4 _3449 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8728, float3(0.0), isnan(_8728)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8728, float3(0.0), isnan(_8728)), level(0.0)).xyzw;
    float _3451 = _3449.x;
    float _3453 = _3449.y;
    float _3455 = _3449.z;
    float _3457 = _3449.w;
    float2 _8745 = float2(_3446, _3426);
    float3 _3461 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8745, float2(0.0), isnan(_8745)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8745, float2(0.0), isnan(_8745)), level(0.0)).xyz;
    float _3463 = _3461.x;
    float _3465 = _3461.y;
    float _3467 = _3461.z;
    float _3469 = _3342 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3471 = _3346 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _3473 = _3070 > 0.0;
    bool _3475 = isnan(_3070);
    bool _3477 = _3473 || _3475;
    bool _3479 = isnan(0.0);
    bool _3481 = _3477 || _3479;
    float _3483 = _3382 * 0.5;
    float _3485 = fma(_3352, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3471);
    float _3487 = exp2(_3469);
    bool _3489 = _3130 <= 0.0;
    bool _3491 = !_3481;
    bool _3493 = _3489 || _3491;
    float _3495 = fma(_3336, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3485);
    float _3497 = _3418 + _3382;
    float _3499 = fma(_3360, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3495);
    float _3501 = _3070 * _3130;
    float _3503 = _3497 * 0.5;
    float _3505 = _3499 + _3382;
    float _3507 = _3501 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.gl_Position.x = _3418;
    out.gl_Position.y = _3420;
    out.gl_Position.z = _3499;
    out.gl_Position.w = _3382;
    float _3509 = _3505 * 0.5;
    float _3511 = -_3487;
    float _3513 = _3511 + 1.0;
    float _3515 = fma(_3420, -0.5, _3483);
    float _3517 = _3507 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3519 = _3513 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_68.x = _3503;
    out.m_68.y = _3515;
    out.m_68.z = _3509;
    out.m_68.w = _3382;
    float _3521 = -_3519;
    float _3523 = _3521 + 1.0;
    out.m_45.x = _3517;
    float _3525 = _3519 * _3442;
    float _3527 = _3457 * _3525;
    float _3529 = _3457 * _3523;
    float _3531 = _3467 * _3525;
    float _3533 = fma(_3463, _3527, _3451);
    float _3535 = fma(_3465, _3527, _3453);
    float _3537 = fma(_3457, _3531, _3455);
    out.m_70.x = _3533;
    out.m_70.y = _3535;
    out.m_70.z = _3537;
    out.m_70.w = _3529;
    if (!_3493)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3539 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_45.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3539;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _883 = false;
    bool _759 = false;
    bool _617 = false;
    bool _507 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _84 = in.m_42.w;
    float _86 = trunc(_84);
    int _89 = int(_86);
    bool _93 = _89 >= 1;
    float _95 = 0.0;
    if (!_93)
    {
        _95 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _97 = _95;
    float _99 = _97;
    if (!_93)
    {
        out.m_45.x = 0.0;
    }
    int _101 = 0;
    if (!_93)
    {
        float _103 = _97 * 5.0;
        _101 = as_type<int>(_103);
    }
    int _105 = _101;
    int _107 = _105;
    if (!_93)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3596 = as_type<float>(_105);
        out.gl_Position.z = _3596;
    }
    if (!_93)
    {
        return out;
    }
    float _109 = in.m_47.w;
    bool _111 = _109 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _113 = isnan(_109);
    bool _115 = _111 || _113;
    bool _117 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _119 = _115 || _117;
    float _121 = -_109;
    float _123 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _125 = _123;
    if (_119)
    {
        float _127 = float(_89);
        _99 = _127;
    }
    float _129 = _99;
    bool _131 = _123 >= _129;
    bool _133 = !_119;
    bool _135 = _131 || _133;
    float _137 = _129;
    if (_135)
    {
        _137 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _137;
    if (_135)
    {
        out.m_45.x = 0.0;
    }
    if (_135)
    {
        float _141 = _139 * 5.0;
        _107 = as_type<int>(_141);
    }
    int _143 = _107;
    if (_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3666 = as_type<float>(_143);
        out.gl_Position.z = _3666;
    }
    if (_135)
    {
        return out;
    }
    float _145 = as_type<float>(int(gl_VertexIndex));
    float _147 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _149 = in.m_52.w;
    bool _151 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _153 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _155 = _151 || _153;
    bool _157 = isnan(1.0);
    bool _159 = _155 || _157;
    float _161 = in.m_47.x;
    float _163 = in.m_47.y;
    float _165 = in.m_47.z;
    float _167 = in.m_42.x;
    float _169 = in.m_42.y;
    float _171 = in.m_42.z;
    int _173 = as_type<int>(_145) & 1;
    bool _175 = _173 != 0;
    int _177 = as_type<int>(_145) & 2;
    bool _179 = _177 != 0;
    int _181 = int(_175);
    int _183 = _179 ? 2 : 0;
    int _185 = _181 | _183;
    int _187 = _159 ? 4 : 0;
    int _189 = _185 | _187;
    int _191 = false ? 8 : 0;
    int _193 = _189 | _191;
    int _195 = false ? 16 : 0;
    int _197 = _193 | _195;
    int _199 = false ? 32 : 0;
    int _201 = _197 | _199;
    int _203 = false ? 64 : 0;
    int _205 = _201 | _203;
    int _207 = _205 & 4;
    float _209 = as_type<float>(_207);
    float _211 = _147;
    if (!_159)
    {
        float _213 = _147 * _147;
        float _215 = _213 * 0.5;
        _209 = _215;
    }
    float _217 = _209;
    bool _219 = !_175;
    float _221 = _219 ? (-0.5) : 0.5;
    bool _223 = !_179;
    float _225 = _223 ? (-0.5) : 0.5;
    float _227 = _217;
    if (!_159)
    {
        float _229 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _227 = _229;
    }
    float _231 = _227;
    bool _233 = !_159;
    float _235 = _231;
    float _237 = 0.0;
    if (!_233)
    {
        float _239 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _241 = log2(_239);
        float _243 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _245 = _243 + 1.0;
        float _247 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _249 = _147 * _241;
        float _251 = exp2(_249);
        float _253 = _247 * 0.693147182464599609375;
        float _255 = 1.0 / _253;
        float _257 = 1.0 / _245;
        float _259 = _251 + (-1.0);
        float _261 = -_259;
        float _263 = fma(_261, _255, _147);
        float _265 = _263 * _257;
        float _267 = _265 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _235 = _267;
        _237 = _245;
    }
    float _269 = _235;
    float _271 = _237;
    float _273 = _269 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _275 = !_159;
    float _277 = _271;
    float _279 = _269;
    if (!_275)
    {
        float _281 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _283 = log2(_281);
        float _285 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _287 = _285 + 1.0;
        float _289 = 1.0 / _287;
        float _291 = _147 * _283;
        float _293 = exp2(_291);
        float _295 = -_293;
        float _297 = _295 + 1.0;
        float _299 = _297 * _289;
        _277 = _289;
        _211 = _299;
    }
    float _301 = _277;
    float _303 = _211;
    float _305 = _273 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _307 = _273 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _309 = _269 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _311 = _273 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _313 = _301;
    if (!_159)
    {
        float _315 = _123 * _123;
        float _317 = _315 * 0.5;
        _313 = _317;
    }
    float _319 = _313;
    float _321 = fma(_309, (*spvDescriptorSet0.vp_c10)._m0[8].x, _305);
    float _323 = fma(_309, (*spvDescriptorSet0.vp_c10)._m0[8].y, _307);
    float _325 = fma(_309, (*spvDescriptorSet0.vp_c10)._m0[8].z, _311);
    float _327 = _269 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_159)
    {
        float _329 = _319 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _279 = _329;
    }
    float _331 = _279;
    bool _333 = !_159;
    float _335 = _331;
    if (!_333)
    {
        float _337 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _339 = log2(_337);
        float _341 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _343 = _341 + 1.0;
        float _345 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _347 = _123 * _339;
        float _349 = exp2(_347);
        float _351 = _345 * 0.693147182464599609375;
        float _353 = 1.0 / _351;
        float _355 = 1.0 / _343;
        float _357 = _349 + (-1.0);
        float _359 = -_357;
        float _361 = fma(_359, _353, _123);
        float _363 = _361 * _355;
        float _365 = _363 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _335 = _365;
    }
    float _367 = _335;
    float _369 = _367 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _371 = fma(_327, (*spvDescriptorSet0.vp_c10)._m0[10].x, _321);
    float _373 = fma(_327, (*spvDescriptorSet0.vp_c10)._m0[10].y, _323);
    float _375 = _367 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _377 = _369 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _379 = _369 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _381 = _369 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _383 = fma(_327, (*spvDescriptorSet0.vp_c10)._m0[10].z, _325);
    float _385 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[8].x, _377);
    float _387 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[8].y, _379);
    float _389 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[8].z, _381);
    float _391 = _367 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _393 = fma(_303, _161, _371);
    float _395 = fma(_303, _163, _373);
    float _397 = fma(_303, _165, _383);
    float _399 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[10].x, _385);
    float _401 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[10].y, _387);
    float _403 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[10].z, _389);
    float _405 = _391;
    if (!_159)
    {
        _405 = _123;
    }
    float _407 = _405;
    bool _409 = !_159;
    float _411 = _407;
    if (!_409)
    {
        float _413 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _415 = log2(_413);
        float _417 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _419 = _417 + 1.0;
        float _421 = 1.0 / _419;
        float _423 = _123 * _415;
        float _425 = exp2(_423);
        float _427 = -_425;
        float _429 = _427 + 1.0;
        float _431 = _429 * _421;
        _411 = _431;
    }
    float _433 = _411;
    float _435 = fma(_433, _163, _401);
    bool _437 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _439 = fma(_395, _149, _169);
    float _441 = fma(_433, _161, _399);
    float _443 = -_435;
    float _445 = _395 + _443;
    float _447 = fma(_433, _165, _403);
    float _449 = fma(_393, _149, _167);
    float _451 = -_441;
    float _453 = _393 + _451;
    float _455 = _445 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _457 = _445 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _459 = _445 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _461 = -_447;
    float _463 = _397 + _461;
    float _465 = fma(_453, (*spvDescriptorSet0.vp_c10)._m0[4].x, _455);
    float _467 = fma(_453, (*spvDescriptorSet0.vp_c10)._m0[5].x, _457);
    float _469 = fma(_453, (*spvDescriptorSet0.vp_c10)._m0[6].x, _459);
    float _471 = fma(_397, _149, _171);
    float _473 = fma(_463, (*spvDescriptorSet0.vp_c10)._m0[4].z, _465);
    float _475 = fma(_463, (*spvDescriptorSet0.vp_c10)._m0[5].z, _467);
    float _477 = fma(_463, (*spvDescriptorSet0.vp_c10)._m0[6].z, _469);
    bool _479 = !_437;
    float _481 = _475;
    float _483 = _473;
    float _485 = _477;
    float _487 = _447;
    float _505;
    if (!_479)
    {
        float _489 = in.m_54.x;
        float _491 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _493 = _489 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _495 = fma(_493, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _497 = _495 * _491;
        float _499 = floor(_497);
        float _501 = -_499;
        float _503 = _497 + _501;
        _505 = _503;
        _507 = true;
    }
    else
    {
        float _509 = float(_89);
        float _511 = 1.0 / _509;
        float _513 = _123 * _511;
        _505 = _513;
    }
    _507 = false;
    float _515 = _505;
    float _517 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _519 = _515 + _517;
    float _521 = in.m_52.x;
    float _523 = in.m_52.y;
    bool _525 = _515 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _527 = isnan(_515);
    bool _529 = _525 || _527;
    bool _531 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _533 = _529 || _531;
    float _535 = float(_533);
    float _537 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _539 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _537;
    bool _541 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _543 = 1.0 / _539;
    float _545 = -_535;
    float _547 = _545 + 1.0;
    float _549 = _519 * _543;
    bool _551 = _515 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _553 = isnan(_515);
    bool _555 = _551 || _553;
    bool _557 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _559 = _555 || _557;
    float _561 = float(_559);
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _565 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _563;
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _569 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _567;
    float _571 = _561 * _547;
    float _573 = fma(_565, _549, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _575 = fma(_569, _549, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _577 = -_561;
    float _579 = _577 + 1.0;
    float _581 = _573 * _571;
    float _583 = _575 * _571;
    float _585 = fma(_579, (*spvDescriptorSet0.vp_c9)._m0[143].x, _581);
    float _587 = fma(_579, (*spvDescriptorSet0.vp_c9)._m0[143].y, _583);
    float _589 = fma(_535, (*spvDescriptorSet0.vp_c9)._m0[144].x, _585);
    float _591 = fma(_535, (*spvDescriptorSet0.vp_c9)._m0[144].y, _587);
    float _593 = _589 * _521;
    float _595 = _591 * _523;
    bool _597 = !_541;
    float _615;
    if (!_597)
    {
        float _599 = in.m_54.x;
        float _601 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _603 = _599 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _605 = fma(_603, (*spvDescriptorSet0.vp_c9)._m0[11].y, _123);
        float _607 = _605 * _601;
        float _609 = floor(_607);
        float _611 = -_609;
        float _613 = _607 + _611;
        _615 = _613;
        _617 = true;
    }
    else
    {
        float _619 = float(_89);
        float _621 = 1.0 / _619;
        float _623 = _123 * _621;
        _615 = _623;
    }
    _617 = false;
    float _625 = _615;
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _629 = _625 + _627;
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _633 = _631 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _635 = _625 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _637 = isnan(_625);
    bool _639 = _635 || _637;
    bool _641 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _643 = _639 || _641;
    float _645 = float(_643);
    float _647 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _649 = _647 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _651 = _625 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _653 = isnan(_625);
    bool _655 = _651 || _653;
    bool _657 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _659 = _655 || _657;
    float _661 = float(_659);
    float _663 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _665 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _663;
    bool _667 = _625 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _669 = isnan(_625);
    bool _671 = _667 || _669;
    bool _673 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _675 = _671 || _673;
    float _677 = float(_675);
    float _679 = 1.0 / _633;
    float _681 = -_645;
    float _683 = _681 + 1.0;
    bool _685 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _687 = _661 * _683;
    float _689 = -_661;
    float _691 = _689 + 1.0;
    float _693 = 1.0 / _649;
    float _695 = _665 * _679;
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _699 = _697 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _701 = fma(_695, _629, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _703 = _699 * _693;
    float _705 = _701 * _687;
    float _707 = -_677;
    float _709 = _707 + 1.0;
    float _711 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _713 = _625 + _711;
    float _715 = fma(_691, (*spvDescriptorSet0.vp_c9)._m0[115].x, _705);
    float _717 = _645 * _709;
    float _719 = fma(_703, _713, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _721 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _723 = fma(_719, _717, _715);
    float _725 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _727 = _721 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _729 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _731 = fma(_677, (*spvDescriptorSet0.vp_c9)._m0[117].x, _723);
    float _733 = _725 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _735 = _729 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _737 = _731 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_56.x = _727;
    out.m_56.y = _733;
    out.m_56.z = _735;
    out.m_56.w = _737;
    bool _739 = !_685;
    float _757;
    if (!_739)
    {
        float _741 = in.m_54.x;
        float _743 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _745 = _741 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _747 = fma(_745, (*spvDescriptorSet0.vp_c9)._m0[11].z, _123);
        float _749 = _747 * _743;
        float _751 = floor(_749);
        float _753 = -_751;
        float _755 = _749 + _753;
        _757 = _755;
        _759 = true;
    }
    else
    {
        float _761 = float(_89);
        float _763 = 1.0 / _761;
        float _765 = _123 * _763;
        _757 = _765;
    }
    _759 = false;
    float _767 = _757;
    float _769 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _771 = _767 + _769;
    bool _773 = _767 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _775 = isnan(_767);
    bool _777 = _773 || _775;
    bool _779 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _781 = _777 || _779;
    float _783 = float(_781);
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _787 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _785;
    bool _789 = _767 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _791 = isnan(_767);
    bool _793 = _789 || _791;
    bool _795 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _797 = _793 || _795;
    float _799 = float(_797);
    float _801 = -_783;
    float _803 = _801 + 1.0;
    float _805 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _807 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _805;
    float _809 = 1.0 / _787;
    bool _811 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _813 = _799 * _803;
    float _815 = -_799;
    float _817 = _815 + 1.0;
    float _819 = _771 * _809;
    float _821 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _823 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _821;
    float _825 = fma(_807, _819, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _827 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _829 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _827;
    float _831 = fma(_823, _819, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _833 = _825 * _813;
    float _835 = fma(_829, _819, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _837 = _831 * _813;
    float _839 = _835 * _813;
    float _841 = fma(_817, (*spvDescriptorSet0.vp_c9)._m0[123].x, _833);
    float _843 = fma(_817, (*spvDescriptorSet0.vp_c9)._m0[123].y, _839);
    float _845 = fma(_817, (*spvDescriptorSet0.vp_c9)._m0[123].z, _837);
    float _847 = fma(_783, (*spvDescriptorSet0.vp_c9)._m0[124].x, _841);
    float _849 = fma(_783, (*spvDescriptorSet0.vp_c9)._m0[124].y, _843);
    float _851 = fma(_783, (*spvDescriptorSet0.vp_c9)._m0[124].z, _845);
    bool _853 = !_811;
    float _877;
    float _879;
    float _881;
    if (!_853)
    {
        float _855 = in.m_54.x;
        float _857 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _859 = float(_89);
        float _861 = 1.0 / _859;
        float _863 = _855 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _865 = _123 * _861;
        float _867 = fma(_863, (*spvDescriptorSet0.vp_c9)._m0[11].w, _123);
        float _869 = _867 * _857;
        float _871 = floor(_869);
        float _873 = -_871;
        float _875 = _869 + _873;
        _877 = _865;
        _879 = _859;
        _881 = _875;
        _883 = true;
    }
    else
    {
        float _885 = float(_89);
        float _887 = 1.0 / _885;
        float _889 = _123 * _887;
        _877 = _889;
        _879 = _885;
        _881 = _889;
    }
    _883 = false;
    float _891 = _877;
    float _893 = _879;
    float _895 = _881;
    float _897 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _899 = int(_897);
    float _901 = in.m_54.x;
    float _903 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _905 = _891 + _903;
    float _907 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _909 = _891 + _907;
    float _911 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _913 = _911 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _915 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _917 = int(_915);
    float _919 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _921 = _919 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _923 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _925 = _923 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _927 = _593 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _929 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _931 = _929 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _933 = float(_899);
    float _935 = 1.0 / _893;
    float _937 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _939 = _937 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _941 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _943 = _941 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    int _945 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _947 = _945 != 0;
    float _949 = float(uint(_917));
    float _951 = 1.0 / _933;
    int _953 = ~_917;
    int _955 = _953 + 1;
    float _957 = float(_917);
    bool _959 = _917 == 0;
    bool _961 = _895 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _963 = isnan(_895);
    bool _965 = _961 || _963;
    bool _967 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _969 = _965 || _967;
    float _971 = float(_969);
    float _973 = 1.0 / _949;
    bool _975 = _895 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _977 = isnan(_895);
    bool _979 = _975 || _977;
    bool _981 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _983 = _979 || _981;
    float _985 = float(_983);
    float _987 = _845;
    if (!_947)
    {
        float _989 = in.m_54.y;
        _987 = _989;
    }
    float _991 = _987;
    bool _993 = _891 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _995 = isnan(_891);
    bool _997 = _993 || _995;
    bool _999 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1001 = _997 || _999;
    float _1003 = float(_1001);
    bool _1005 = _891 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1007 = isnan(_891);
    bool _1009 = _1005 || _1007;
    bool _1011 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _1013 = _1009 || _1011;
    float _1015 = float(_1013);
    bool _1017 = _891 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1019 = isnan(_891);
    bool _1021 = _1017 || _1019;
    bool _1023 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _1025 = _1021 || _1023;
    float _1027 = float(_1025);
    float _1029 = _123 * _951;
    int _1031 = ~_917;
    int _1033 = _1031 + 1;
    float _1035 = 1.0 / _913;
    float _1037 = -_1003;
    float _1039 = _1037 + 1.0;
    int _1041 = as_type<int>(_973) + (-2);
    float _1043 = trunc(_1029);
    int _1045 = int(_1043);
    float _1047 = _951;
    if (!_947)
    {
        _1047 = _991;
    }
    float _1049 = _1047;
    float _1051 = 1.0 / _921;
    float _1053 = _1049;
    int _1055 = as_type<int>(_991);
    if (_947)
    {
        float _1057 = in.m_54.x;
        float _1059 = in.m_54.y;
        _1053 = _1057;
        _1055 = as_type<int>(_1059);
    }
    float _1061 = _1053;
    int _1063 = _1055;
    float _1065 = float(uint(_1045));
    float _1067 = 1.0 / _925;
    float _1069 = as_type<float>(_1041) * _1065;
    float _1071 = trunc(_1069);
    float _1073 = precise::max(_1071, 0.0);
    uint _1076 = uint(_1073);
    float _1078 = 1.0 / _931;
    float _1080 = float(_1045);
    bool _1082 = !_947;
    float _1084 = _1082 ? as_type<float>(_1063) : _901;
    bool _1086 = _1080 >= _957;
    bool _1088 = isnan(_1080);
    bool _1090 = _1086 || _1088;
    bool _1092 = isnan(_957);
    bool _1094 = _1090 || _1092;
    float _1096 = float(_1094);
    int _1098 = _1033 * int(_1076);
    int _1100 = _1098 + _1045;
    float _1102 = 1.0 / _939;
    float _1104 = float(uint(_1100));
    float _1106 = trunc(_1096);
    int _1108 = int(_1106);
    float _1110 = as_type<float>(_1041) * _1104;
    bool _1112 = !_947;
    float _1114 = _1112 ? 1.2345600128173828125 : 1.0;
    float _1116 = trunc(_1110);
    float _1118 = precise::max(_1116, 0.0);
    uint _1120 = uint(_1118);
    float _1122 = _1114 * _1084;
    int _1124 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1126 = _1124 != 0;
    float _1128 = floor(_1122);
    int _1130 = int(_1076) + int(_1120);
    float _1132 = 1.0 / _943;
    int _1134 = _955 * _1130;
    int _1136 = _1134 + _1045;
    bool _1138 = uint(_1136) >= uint(_917);
    bool _1140 = !_1138;
    int _1142 = _1140 ? 0 : (-1);
    int _1144 = ~_1130;
    int _1146 = _1144 + _1142;
    int _1148 = _1146 + 1;
    float _1150 = -_1128;
    float _1152 = _1122 + _1150;
    int _1154 = ~_1108;
    int _1156 = _1154 + 1;
    int _1158 = _1156 + 1;
    int _1160 = _917 * _1148;
    int _1162 = _1160 + _1045;
    float _1164 = _957 * _1152;
    float _1166 = _123 * _957;
    int _1168 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1170 = _1168 != 0;
    int _1172 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1174 = _1172 != 0;
    bool _1176 = !_959;
    int _1178 = _1176 ? _1162 : (-1);
    float _1180 = _1166 * _935;
    int _1182 = _917 + (-1);
    float _1184 = trunc(_1164);
    int _1186 = int(_1184);
    bool _1188 = !_1174;
    int _1190 = _1188 ? 0 : 1;
    int _1192 = _1158 * _1178;
    bool _1194 = !_1126;
    int _1196 = _1194 ? 0 : 1;
    int _1198 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1200 = _1198 != 0;
    int _1202 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1204 = _1202 != 0;
    int _1206 = _1108 * _1182;
    int _1208 = _1206 + _1192;
    bool _1210 = !_1170;
    int _1212 = _1210 ? 0 : 1;
    float _1214 = trunc(_1180);
    int _1216 = int(_1214);
    int _1218 = abs(_1196);
    int _1220 = abs(_1190);
    bool _1222 = !_1200;
    int _1224 = _1222 ? 0 : 1;
    int _1226 = abs(_1212);
    int _1228 = _1208 * _1220;
    float _1230 = _439 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _1232 = abs(_1224);
    int _1234 = _1186 * _1218;
    int _1236 = _1234 + _1045;
    bool _1238 = !_1204;
    int _1240 = _1238 ? 0 : 1;
    float _1242 = _439 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _1244 = _1216 * _1226;
    int _1246 = _1244 + _1228;
    int _1248 = abs(_1240);
    float _1250 = fma(_449, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1242);
    int _1252 = ~_917;
    int _1254 = _1252 + 1;
    int _1256 = _1236 * _1232;
    int _1258 = _1256 + _1246;
    float _1260 = fma(_449, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1230);
    float _1262 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1264 = log2(_1262);
    float _1266 = fma(_471, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1250);
    int _1268 = _1186 * _1248;
    int _1270 = _1268 + _1258;
    int _1272 = ~_917;
    int _1274 = _1272 + 1;
    float _1276 = float(uint(_1270));
    float _1278 = as_type<float>(_1041) * _1276;
    float _1280 = trunc(_1278);
    float _1282 = precise::max(_1280, 0.0);
    uint _1284 = uint(_1282);
    float _1286 = _123 * _1264;
    float _1288 = exp2(_1286);
    int _1290 = _1274 * int(_1284);
    int _1292 = _1290 + _1270;
    float _1294 = float(uint(_1292));
    float _1296 = -_1288;
    float _1298 = _1296 + 1.0;
    float _1300 = as_type<float>(_1041) * _1294;
    float _1302 = trunc(_1300);
    float _1304 = precise::max(_1302, 0.0);
    uint _1306 = uint(_1304);
    int _1308 = int(_1284) + int(_1306);
    int _1310 = _1254 * _1308;
    int _1312 = _1310 + _1270;
    bool _1314 = uint(_1312) >= uint(_917);
    bool _1316 = !_1314;
    int _1318 = _1316 ? 0 : (-1);
    int _1320 = ~_1308;
    int _1322 = _1320 + _1318;
    int _1324 = _1322 + 1;
    float _1326 = in.m_54.w;
    int _1328 = _917 * _1324;
    int _1330 = _1328 + _1270;
    float _1332 = in.m_54.z;
    float _1334 = _901 * 2.0;
    bool _1336 = !_959;
    int _1338 = _1336 ? _1330 : (-1);
    float _1340 = floor(_1334);
    int _1342 = _1338 & 3;
    bool _1344 = _1342 != 0;
    bool _1346 = uint(_1342) > 1u;
    bool _1348 = _1326 > 0.5;
    int _1350 = _1344 ? 0 : 1;
    bool _1352 = _1332 > 0.5;
    bool _1354 = _1340 >= 0.0;
    bool _1356 = isnan(_1340);
    bool _1358 = _1354 || _1356;
    bool _1360 = isnan(0.0);
    bool _1362 = _1358 || _1360;
    int _1364 = ~_1350;
    int _1366 = _1364 + 1;
    int _1368 = _1366 + 1;
    float _1370 = -_221;
    int _1372 = _1352 ? as_type<int>(_1370) : as_type<int>(_221);
    int _1374 = _1368;
    float _1376 = as_type<float>(_1306);
    if (!_1346)
    {
        int _1378 = ~_1350;
        int _1380 = _1378 + 1;
        _1374 = _1380;
    }
    int _1382 = _1374;
    float _1384 = -_225;
    int _1386 = _1348 ? as_type<int>(_1384) : as_type<int>(_225);
    int _1388 = _1362 ? 0 : 1;
    bool _1390 = _1340 > 0.0;
    bool _1392 = _901 > 0.5;
    int _1394 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1396 = _1394 != 0;
    int _1398 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1400 = _1398 != 0;
    float _1402 = -_221;
    int _1404 = _1392 ? as_type<int>(_1402) : as_type<int>(_221);
    int _1406 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1408 = _1406 != 0;
    int _1410 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1412 = _1410 != 0;
    int _1414 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1416 = _1414 != 0;
    int _1418 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1420 = _1418 != 0;
    float _1422 = _439 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _1424 = ~_1388;
    int _1426 = _1424 + 1;
    int _1428 = _1426 + 1;
    float _1430 = fma(_449, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1422);
    float _1432 = _1332 * 2.0;
    float _1434 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1436 = _1434 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    int _1438 = _1428;
    if (!_1390)
    {
        int _1440 = ~_1388;
        int _1442 = _1440 + 1;
        _1438 = _1442;
    }
    int _1444 = _1438;
    float _1446 = fma(_471, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1430);
    float _1448 = floor(_1432);
    float _1450 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1452 = _1450 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1454 = !_1396;
    float _1456 = _1454 ? _221 : as_type<float>(_1372);
    float _1458 = fma(_471, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1260);
    bool _1460 = !_1400;
    float _1462 = _1460 ? _225 : as_type<float>(_1386);
    float _1464 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1466 = _1464 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    int _1468 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1470 = _1468 != 0;
    float _1472 = _1446 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1474 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1476 = _1474 != 0;
    float _1478 = 1.0 / _1436;
    int _1480 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1482 = _1480 != 0;
    if (!_1420)
    {
        _1376 = _1332;
    }
    float _1484 = _1376;
    float _1486 = 1.0 / _1452;
    float _1488 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1490 = _1488 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1492 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1494 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1492;
    float _1496 = 0.0;
    float _1498 = _1484;
    if (!_1420)
    {
        _1496 = _1332;
    }
    float _1500 = _1496;
    float _1502 = _1490 * _1035;
    float _1504 = _1500;
    if (_1420)
    {
        _1498 = as_type<float>(_1063);
    }
    float _1506 = _1498;
    float _1508 = 1.0 / _1466;
    if (_1420)
    {
        _1504 = as_type<float>(_1063);
    }
    float _1510 = _1504;
    float _1512 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _1514 = _1512 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    bool _1516 = _1448 >= 0.0;
    bool _1518 = isnan(_1448);
    bool _1520 = _1516 || _1518;
    bool _1522 = isnan(0.0);
    bool _1524 = _1520 || _1522;
    float _1526 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1528 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1526;
    float _1530 = _1494 * _1051;
    float _1532 = _1514 * _1067;
    float _1534 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _1536 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _1534;
    float _1538 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1540 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1538;
    int _1542 = _1524 ? 0 : 1;
    float _1544 = _1528 * _1478;
    bool _1546 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1548 = isnan(0.0);
    bool _1550 = _1546 || _1548;
    bool _1552 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1554 = _1550 || _1552;
    float _1556 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1558 = _1556 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1560 = _1536 * _1078;
    float _1562 = _1540 * _1486;
    float _1564 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1566 = _1564 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1568 = _1554 ? _1298 : 0.0;
    float _1570 = _1558 * _1102;
    bool _1572 = _1448 > 0.0;
    float _1574 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1576 = _895 + _1574;
    float _1578 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1580 = _891 + _1578;
    float _1582 = _1566 * _1508;
    float _1584 = fma(_1502, _1576, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1586 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1588 = _891 + _1586;
    float _1590 = fma(_1532, _1580, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _1592 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1594 = _891 + _1592;
    float _1596 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1598 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1596;
    bool _1600 = _891 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1602 = isnan(_891);
    bool _1604 = _1600 || _1602;
    bool _1606 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1608 = _1604 || _1606;
    float _1610 = float(_1608);
    float _1612 = fma(_1544, _1588, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _1614 = fma(_1582, _1594, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    bool _1616 = _891 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1618 = isnan(_891);
    bool _1620 = _1616 || _1618;
    bool _1622 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1624 = _1620 || _1622;
    float _1626 = float(_1624);
    float _1628 = _1598 * _1132;
    float _1630 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1632 = _895 + _1630;
    float _1634 = -_1610;
    float _1636 = _1634 + 1.0;
    float _1638 = fma(_1560, _905, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    bool _1640 = _891 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1642 = isnan(_891);
    bool _1644 = _1640 || _1642;
    bool _1646 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1648 = _1644 || _1646;
    float _1650 = float(_1648);
    float _1652 = -_1626;
    float _1654 = _1652 + 1.0;
    float _1656 = fma(_1530, _1632, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1658 = _1626 * _1636;
    bool _1660 = _895 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1662 = isnan(_895);
    bool _1664 = _1660 || _1662;
    bool _1666 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1668 = _1664 || _1666;
    float _1670 = float(_1668);
    float _1672 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1674 = _891 + _1672;
    bool _1676 = _891 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1678 = isnan(_891);
    bool _1680 = _1676 || _1678;
    bool _1682 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1684 = _1680 || _1682;
    float _1686 = float(_1684);
    float _1688 = _1650 * _1654;
    float _1690 = -_1650;
    float _1692 = _1690 + 1.0;
    float _1694 = fma(_1562, _1674, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _1696 = -_1670;
    float _1698 = _1696 + 1.0;
    float _1700 = _1686 * _1692;
    float _1702 = -_1686;
    float _1704 = _1702 + 1.0;
    bool _1706 = _891 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1708 = isnan(_891);
    bool _1710 = _1706 || _1708;
    bool _1712 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1714 = _1710 || _1712;
    float _1716 = float(_1714);
    float _1718 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1720 = 1.0 + _1718;
    float _1722 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1724 = _891 + _1722;
    float _1726 = _1003 * _1704;
    float _1728 = _1015 * _1039;
    float _1730 = -_1015;
    float _1732 = _1730 + 1.0;
    float _1734 = _985 * _1698;
    float _1736 = 1.0 / _1720;
    float _1738 = -_985;
    float _1740 = _1738 + 1.0;
    float _1742 = _1027 * _1732;
    float _1744 = -_1027;
    float _1746 = _1744 + 1.0;
    float _1748 = fma(_1628, _1724, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _1750 = _971 * _1740;
    float _1752 = fma(_1570, _909, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _1754 = _1716 * _1746;
    float _1756 = _1656 * _1750;
    float _1758 = -_971;
    float _1760 = _1758 + 1.0;
    float _1762 = _1638 * _1754;
    float _1764 = -_1716;
    float _1766 = _1764 + 1.0;
    float _1768 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1770 = _1061 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1772 = _1568 * _1736;
    float _1774 = fma(_1061, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1768);
    float _1776 = fma(_1766, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1762);
    float _1778 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1780 = fma(_1590, _1742, _1776);
    float _1782 = _1506 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1784 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1786 = fma(_1510, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1778);
    float _1788 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _1790 = !_1476;
    float _1792 = _1790 ? _221 : as_type<float>(_1404);
    float _1794 = _901 + as_type<float>(_1063);
    float _1796 = as_type<float>(_1063) * 2.0;
    float _1798 = -_1784;
    float _1800 = fma(_1770, 2.0, _1798);
    float _1802 = fma(_1782, -2.0, _1788);
    float _1804 = _1794 + (-1.0);
    float _1806 = float(uint(_1236));
    float _1808 = floor(_1796);
    bool _1810 = !_1412;
    int _1812 = _1810 ? 0 : 1;
    float _1814 = fma(_1804, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1816 = fma(_1760, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1756);
    float _1818 = as_type<float>(_1041) * _1806;
    bool _1820 = !_1408;
    int _1822 = _1820 ? 0 : 1;
    float _1824 = fma(_1612, _1728, _1780);
    bool _1826 = as_type<float>(_1063) > 0.5;
    float _1828 = fma(_1584, _1734, _1816);
    int _1830 = abs(_1812);
    float _1832 = _1266 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1834 = ~_1542;
    int _1836 = _1834 + 1;
    int _1838 = _1836 + 1;
    float _1840 = trunc(_1818);
    float _1842 = precise::max(_1840, 0.0);
    uint _1844 = uint(_1842);
    int _1846 = _1838;
    if (!_1572)
    {
        int _1848 = ~_1542;
        int _1850 = _1848 + 1;
        _1846 = _1850;
    }
    int _1852 = _1846;
    float _1854 = _1332 + as_type<float>(_1063);
    float _1856 = -_225;
    int _1858 = _1826 ? as_type<int>(_1856) : as_type<int>(_225);
    float _1860 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1862 = _1472 + _1860;
    int _1864 = abs(_1822);
    float _1866 = _1458 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1868 = uint(_1342) >= 2u;
    float _1870 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1872 = _1832 + _1870;
    float _1874 = _1854 + (-1.0);
    bool _1876 = _1808 >= 0.0;
    bool _1878 = isnan(_1808);
    bool _1880 = _1876 || _1878;
    bool _1882 = isnan(0.0);
    bool _1884 = _1880 || _1882;
    float _1886 = -_123;
    float _1888 = fma(_1886, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1800);
    int _1890 = _1868 ? 0 : 1;
    float _1892 = _1872 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _1894 = _1808 > 0.0;
    float _1896 = fma(_1670, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1828);
    int _1898 = ~_917;
    int _1900 = _1898 + 1;
    float _1902 = fma(_1862, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1892);
    float _1904 = float(_1864);
    float _1906 = _1456 + 0.5;
    float _1908 = float(_1852);
    float _1910 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1912 = _1866 + _1910;
    float _1914 = float(_1830);
    float _1916 = fma(_1906, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1888);
    float _1918 = float(_1444);
    float _1920 = _1904 * _1908;
    float _1922 = fma(_1912, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1902);
    int _1924 = _1338 >> 31;
    float _1926 = _1914 * _1918;
    bool _1928 = !_1482;
    float _1930 = _1928 ? _225 : as_type<float>(_1858);
    int _1932 = _1900 * int(_1844);
    int _1934 = _1932 + _1236;
    float _1936 = _1462 + (-0.5);
    float _1938 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1802);
    int _1940 = _1924 & 3;
    float _1942 = _1896 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1944 = float(uint(_1934));
    float _1946 = -_1936;
    float _1948 = -_1938;
    float _1950 = fma(_1946, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1948);
    int _1952 = _1338 + _1940;
    float _1954 = fma(_1614, _1726, _1824);
    bool _1956 = _1922 >= 0.0;
    float _1958 = as_type<float>(_1041) * _1944;
    int _1960 = _1952 >> 2;
    float _1962 = _847 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1964 = _849 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1966 = _851 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1968 = _1960 << 4;
    int _1970 = _1968 + 512;
    float _1972 = in.m_58.x;
    float _1974 = in.m_58.y;
    float _1976 = in.m_58.z;
    float _1978 = trunc(_1958);
    float _1980 = precise::max(_1978, 0.0);
    uint _1982 = uint(_1980);
    float _1984 = fma(_1694, _1700, _1954);
    uint _1986 = uint(int(uint(_1970) >> uint(2)));
    uint _1988 = uint(int(uint(int(_1986)) >> uint(2)));
    int _1990 = int(_1986) & 3;
    float _1992 = (*spvDescriptorSet0.vp_c9)._m0[int(_1988)][_1990];
    int _1994 = int(_1986) + 1;
    uint _1996 = uint(int(uint(_1994) >> uint(2)));
    int _1998 = _1994 & 3;
    float _2000 = (*spvDescriptorSet0.vp_c9)._m0[int(_1996)][_1998];
    float _2002 = _1962 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2004 = _1964 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2006 = _1966 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2008 = _1884 ? 0 : 1;
    float _2010 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1774);
    float _2012 = _1920 * (-2.0);
    float _2014 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _2016 = _1970 + 8;
    uint _2018 = uint(int(uint(_2016) >> uint(2)));
    uint _2020 = uint(int(uint(int(_2018)) >> uint(2)));
    int _2022 = int(_2018) & 3;
    float _2024 = (*spvDescriptorSet0.vp_c9)._m0[int(_2020)][_2022];
    int _2026 = int(_2018) + 1;
    uint _2028 = uint(int(uint(_2026) >> uint(2)));
    int _2030 = _2026 & 3;
    float _2032 = (*spvDescriptorSet0.vp_c9)._m0[int(_2028)][_2030];
    out.m_60.x = _2002;
    out.m_60.y = _2004;
    out.m_60.z = _2006;
    out.m_60.w = _1942;
    int _2034 = ~_2008;
    int _2036 = _2034 + 1;
    int _2038 = _2036 + 1;
    float _2040 = fma(_1814, _2012, _1814);
    int _2042 = _2038;
    if (!_1894)
    {
        int _2044 = ~_2008;
        int _2046 = _2044 + 1;
        _2042 = _2046;
    }
    int _2048 = _2042;
    float _2050 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1786);
    int _2052 = int(_1844) + int(_1982);
    float _2054 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2056 = -_1930;
    float _2058 = _2056 + 0.5;
    bool _2060 = _1342 != 3;
    float _2062 = fma(_1752, _1688, _1984);
    int _2064 = _1338 & 3;
    bool _2066 = _2064 != 0;
    float _2068 = fma(_2012, _1972, _1972);
    float _2070 = _1792 + 0.5;
    float _2072 = -_2010;
    float _2074 = _2072 + 1.0;
    int _2076 = ~_917;
    int _2078 = _2076 + 1;
    float _2080 = fma(_1874, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _2082 = !_2066;
    int _2084 = _2082 ? 0 : 1;
    float _2086 = -_2074;
    float _2088 = fma(_1456, _2086, _1916);
    float _2090 = _2070 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2092 = -_2050;
    float _2094 = _2092 + 1.0;
    float _2096 = _2058 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _2098 = abs(_1382);
    int _2100 = _2078 * _2052;
    int _2102 = _2100 + _1236;
    int _2104 = abs(_2084);
    float _2106 = _2090 * _2014;
    float _2108 = fma(_1462, _2094, _1950);
    float _2110 = _2096 * _2054;
    bool _2112 = uint(_2102) >= uint(_917);
    float _2114 = fma(_1748, _1658, _2062);
    float _2116 = _1926 * (-2.0);
    bool _2118 = !_2112;
    int _2120 = _2118 ? 0 : (-1);
    out.m_62.x = _2106;
    out.m_62.y = _2110;
    out.m_62.z = _2088;
    out.m_62.w = _2108;
    int _2122 = ~_1890;
    int _2124 = _2122 + 1;
    int _2126 = _2124 + 1;
    float _2128 = fma(_1610, (*spvDescriptorSet0.vp_c9)._m0[158].x, _2114);
    bool _2130 = _1342 != 3;
    int _2132 = _2126;
    if (_1956)
    {
        out.m_45.x = 0.0;
    }
    if (_2060)
    {
        int _2134 = ~_1890;
        int _2136 = _2134 + 1;
        _2132 = _2136;
    }
    int _2138 = _2132;
    float _2140 = fma(_2080, _2116, _2080);
    out.m_64.x = _2128;
    int _2142 = ~_2098;
    int _2144 = _2142 + 1;
    int _2146 = _2144 + 1;
    float _2148 = fma(_2116, _1974, _1974);
    int _2150 = abs(_2138);
    int _2152 = ~_2052;
    int _2154 = _2152 + _2120;
    int _2156 = _2154 + 1;
    int _2158 = _2146 * as_type<int>(_2000);
    bool _2160 = !_2130;
    int _2162 = _2160 ? 0 : (-1);
    int _2164 = ~_2104;
    int _2166 = _2164 + 1;
    int _2168 = _2166 + 1;
    bool _2170 = !_1470;
    int _2172 = _2170 ? 0 : 1;
    int _2174 = abs(_2162);
    int _2176 = _2168 * as_type<int>(_1992);
    int _2178 = _2176 + _2158;
    float _2180 = _1872 * _1872;
    int _2182 = abs(_2172);
    float _2184 = _901 + (-0.5);
    int _2186 = ~_2150;
    int _2188 = _2186 + 1;
    int _2190 = _2188 + 1;
    int _2192 = ~_2174;
    int _2194 = _2192 + 1;
    int _2196 = _2194 + 1;
    bool _2198 = _917 == 0;
    int _2200 = _2190 * as_type<int>(_2024);
    int _2202 = _2200 + _2178;
    float _2204 = fma(_1862, _1862, _2180);
    float _2206 = fma(_2184, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2068);
    int _2208 = _917 * _2156;
    int _2210 = _2208 + _1236;
    int _2212 = ~_2182;
    int _2214 = _2212 + 1;
    int _2216 = _2214 + 1;
    int _2218 = _2196 * as_type<int>(_2032);
    int _2220 = _2218 + _2202;
    float _2222 = fma(_1912, _1912, _2204);
    float _2224 = _2204;
    if (_1956)
    {
        _2224 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2226 = _2224;
    float _2228 = as_type<float>(_1063) + (-0.5);
    bool _2230 = !_2198;
    int _2232 = _2230 ? _2210 : (-1);
    int _2234 = _2216 * _2220;
    bool _2236 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2238 = isnan(1.0);
    bool _2240 = _2236 || _2238;
    bool _2242 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2244 = _2240 || _2242;
    float _2246 = rsqrt(_2222);
    int _2248 = _2232 * _2182;
    int _2250 = _2248 + _2234;
    int _2252 = as_type<int>(_2226);
    if (_1956)
    {
        float _2254 = _2226 * 5.0;
        _2252 = as_type<int>(_2254);
    }
    int _2256 = _2252;
    float _2258 = _927 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    bool _2260 = !_2244;
    float _2262 = _2260 ? _123 : _1772;
    float _2264 = float(_2250);
    if (_1956)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6873 = as_type<float>(_2256);
        out.gl_Position.z = _6873;
    }
    bool _2266 = !_1416;
    int _2268 = _2266 ? 0 : 1;
    float _2270 = fma(_2262, _2040, _2206);
    out.m_66.y = _2264;
    float _2272 = _2258 * _2246;
    int _2274 = abs(_2268);
    float _2276 = _1862 * _2272;
    float _2278 = _1872 * _2272;
    if (_1956)
    {
        return out;
    }
    float _2280 = -_2278;
    float _2282 = _1832 + _2280;
    float _2284 = _1912 * _2272;
    float _2286 = -_2276;
    float _2288 = _1472 + _2286;
    float _2290 = -_2278;
    float _2292 = _1872 + _2290;
    float _2294 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2296 = _2282 + _2294;
    float _2298 = -_2284;
    float _2300 = _1866 + _2298;
    float _2302 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2304 = _2288 + _2302;
    float _2306 = float(_2274);
    float _2308 = _2296 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2310 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2312 = _2300 + _2310;
    float _2314 = float(_2048);
    float _2316 = fma(_2228, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2148);
    float _2318 = fma(_2304, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2308);
    float _2320 = -_2276;
    float _2322 = _1862 + _2320;
    float _2324 = -_2284;
    float _2326 = _1912 + _2324;
    float _2328 = fma(_2262, _2140, _2316);
    float _2330 = fma(_2312, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2318);
    float _2332 = _2292 * _2292;
    float _2334 = _2306 * _2314;
    float _2336 = _901 + _1332;
    float _2338 = _2270 * 0.15915493667125701904296875;
    bool _2340 = _2330 >= 0.0;
    float _2342 = fma(_2322, _2322, _2332);
    float _2344 = _2328 * 0.15915493667125701904296875;
    float _2346 = _2336 + (-1.0);
    float _2348 = fma(_2326, _2326, _2342);
    float _2350 = _2334 * (-2.0);
    float _2352 = _2344 * 6.283185482025146484375;
    float _2354 = sin(_2352);
    float _2356 = fma(_2346, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2358 = _1332 + (-0.5);
    float _2360 = fma(_2350, _1976, _1976);
    float _2362 = fma(_2356, _2350, _2356);
    float _2364 = _2326;
    int _2366 = as_type<int>(_2360);
    float _2368 = _2304;
    float _2370 = _2300;
    if (_2340)
    {
        _2364 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2372 = _2364;
    float _2374 = fma(_2358, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2360);
    float _2376 = _2338 * 6.283185482025146484375;
    float _2378 = sin(_2376);
    if (_2340)
    {
        out.m_45.x = 0.0;
    }
    if (_2340)
    {
        float _2380 = _2372 * 5.0;
        _2366 = as_type<int>(_2380);
    }
    int _2382 = _2366;
    float _2384 = fma(_2262, _2362, _2374);
    float _2386 = _2338 * 6.283185482025146484375;
    float _2388 = cos(_2386);
    if (_2340)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7072 = as_type<float>(_2382);
        out.gl_Position.z = _7072;
    }
    float _2390 = _2384 * 0.15915493667125701904296875;
    float _2392 = sqrt(_2348);
    float _2394 = _2344 * 6.283185482025146484375;
    float _2396 = cos(_2394);
    if (_2340)
    {
        return out;
    }
    float _2398 = _2390 * 6.283185482025146484375;
    float _2400 = cos(_2398);
    float _2402 = _2246 * _2392;
    float _2404 = _595 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2406 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _225);
    float _2408 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _221);
    float _2410 = _927 * _2402;
    float _2412 = _2402 * _2404;
    float _2414 = _2378 * _2354;
    float _2416 = _2390 * 6.283185482025146484375;
    float _2418 = sin(_2416);
    float _2420 = _2408 * _2410;
    float _2422 = _2406 * _2412;
    float _2424 = _2388 * _2396;
    float _2426 = _2388 * _2354;
    float _2428 = _2400 * _2422;
    float _2430 = _2354 * _2400;
    float _2432 = _2378 * _2396;
    float _2434 = _2396 * _2400;
    float _2436 = _2388 * _2428;
    float _2438 = _2402 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2440 = _2438 * 0.5;
    float _2442 = _2378 * _2428;
    float _2444 = fma(_2418, _2424, _2414);
    float _2446 = -_2422;
    float _2448 = _2418 * _2446;
    float _2450 = -_2432;
    float _2452 = fma(_2418, _2426, _2450);
    float _2454 = -_2426;
    float _2456 = fma(_2418, _2432, _2454);
    float _2458 = fma(_2444, _2420, _2436);
    float _2460 = fma(_2434, _2420, _2448);
    float _2462 = fma(_2418, _2414, _2424);
    float _2464 = fma(_2456, _2420, _2442);
    float _2466 = fma(_2452, _2440, _2458);
    float _2468 = fma(_2430, _2440, _2460);
    float _2470 = fma(_2462, _2440, _2464);
    float _2472 = _2466 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2474 = _2466 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2476 = fma(_2468, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2472);
    float _2478 = fma(_2468, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2474);
    float _2480 = fma(_2470, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2476);
    float _2482 = fma(_2470, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2478);
    float _2484 = _2480 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2486 = _2482 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2488 = _1866 + _2484;
    float _2490 = _1472 + _2486;
    float _2492 = _2466 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2494 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2496 = _2488 + _2494;
    float _2498 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2500 = _2490 + _2498;
    float _2502 = fma(_2468, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2492);
    float _2504 = _2496 * _2496;
    float _2506 = fma(_2470, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2502);
    float _2508 = fma(_2500, _2500, _2504);
    float _2510 = _2506 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2512 = sqrt(_2508);
    float _2514 = _1832 + _2510;
    bool _2516 = _2512 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2518 = _2506;
    float _2520 = _2490;
    float _2522 = _2510;
    float _2524 = _2496;
    float _2526 = _2508;
    if (!_2516)
    {
        _2518 = _2490;
    }
    float _2528 = _2518;
    float _2530 = _2528;
    if (!_2516)
    {
        _2520 = _2488;
    }
    float _2532 = _2520;
    float _2534 = _2532;
    if (!_2516)
    {
        _2522 = _2514;
    }
    float _2536 = _2522;
    bool _2538 = !_2516;
    float _2540 = _2536;
    if (!_2538)
    {
        float _2542 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2544 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2546 = _2512 + _2544;
        float _2548 = _2514 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2550 = rsqrt(_2508);
        float _2552 = _2546 * _2542;
        float _2554 = _2552 * 0.15915493667125701904296875;
        float _2556 = _2554 * 6.283185482025146484375;
        float _2558 = cos(_2556);
        float _2560 = _2554 * 6.283185482025146484375;
        float _2562 = sin(_2560);
        float _2564 = _2558 + (-1.0);
        float _2566 = fma(_2562, _2548, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2568 = _2564 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2570 = _2550 * _2566;
        float _2572 = fma(_2514, _2558, _2568);
        float _2574 = fma(_2500, _2570, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2576 = fma(_2496, _2570, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2540 = _2572;
        _2530 = _2574;
        _2534 = _2576;
    }
    float _2578 = _2540;
    float _2580 = _2530;
    float _2582 = _2534;
    float _2584 = -_1832;
    float _2586 = _2584 + _2578;
    float _2588 = -_1472;
    float _2590 = _2588 + _2580;
    float _2592 = -_1866;
    float _2594 = _2592 + _2582;
    float _2596 = _2586 * _2586;
    float _2598 = fma(_2590, _2590, _2596);
    float _2600 = fma(_2594, _2594, _2598);
    float _2602 = sqrt(_2600);
    bool _2604 = _2602 > 0.0;
    float _2606 = _2598;
    float _2608 = _2602;
    float _2610 = _2582;
    if (!_2604)
    {
        _2606 = _2580;
    }
    float _2612 = _2606;
    float _2614 = _2612;
    float _2616 = _2612;
    if (!_2604)
    {
        _2608 = _2578;
    }
    float _2618 = _2608;
    bool _2620 = !_2604;
    float _2622 = _2618;
    float _2624 = _2618;
    if (!_2620)
    {
        bool _2626 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2628 = _2488;
        if (_2626)
        {
            float _2630 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2628 = _2630;
        }
        float _2632 = _2628;
        float _2634 = _2632;
        if (_2626)
        {
            float _2636 = _473 * _2632;
            _2524 = _2636;
        }
        float _2638 = _2524;
        float _2640 = _2638;
        if (_2626)
        {
            float _2642 = _475 * _2632;
            _2526 = _2642;
        }
        float _2644 = _2526;
        float _2646 = _2644;
        if (_2626)
        {
            float _2648 = _477 * _2632;
            _2634 = _2648;
        }
        float _2650 = _2634;
        float _2652 = _2650;
        if (!_2626)
        {
            bool _2654 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
            bool _2656 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
            bool _2658 = _2654 || _2656;
            bool _2660 = isnan(1.0);
            bool _2662 = _2658 || _2660;
            float _2664 = _123 + 1.0;
            if (!_2662)
            {
                float _2666 = _2664 * _2664;
                float _2668 = _2666 * 0.5;
                _125 = _2668;
            }
            float _2670 = _125;
            float _2672 = _2670;
            if (!_2662)
            {
                float _2674 = _2670 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2672 = _2674;
            }
            float _2676 = _2672;
            bool _2678 = !_2662;
            float _2680 = _2676;
            if (!_2678)
            {
                float _2682 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2684 = log2(_2682);
                float _2686 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2688 = 1.0 + _2686;
                float _2690 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2692 = _2684 * _2664;
                float _2694 = 1.0 / _2688;
                float _2696 = _2690 * 0.693147182464599609375;
                float _2698 = exp2(_2692);
                float _2700 = 1.0 / _2696;
                float _2702 = _2698 + (-1.0);
                float _2704 = -_2702;
                float _2706 = fma(_2704, _2700, _2664);
                float _2708 = _2706 * _2694;
                float _2710 = _2708 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2680 = _2710;
            }
            float _2712 = _2680;
            float _2714 = _2712 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _2716 = _2712 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2718 = _2712 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2720 = _2712;
            if (!_2662)
            {
                _2720 = _2664;
            }
            float _2722 = _2720;
            float _2724 = _2714 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
            float _2726 = _2714 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
            float _2728 = _2714 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
            float _2730 = fma(_2716, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2724);
            float _2732 = fma(_2716, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2726);
            float _2734 = fma(_2718, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2730);
            bool _2736 = !_2662;
            float _2738 = _2722;
            _2614 = _2732;
            if (!_2736)
            {
                float _2740 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2742 = log2(_2740);
                float _2744 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2746 = 1.0 + _2744;
                float _2748 = 1.0 / _2746;
                float _2750 = _2742 * _2664;
                float _2752 = exp2(_2750);
                float _2754 = -_2752;
                float _2756 = _2754 + 1.0;
                float _2758 = _2756 * _2748;
                _2738 = _2758;
            }
            float _2760 = _2738;
            float _2762 = fma(_2716, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2728);
            float _2764 = fma(_2718, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2732);
            float _2766 = fma(_2760, _163, _2734);
            float _2768 = fma(_2718, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2762);
            float _2770 = fma(_2760, _161, _2764);
            float _2772 = -_435;
            float _2774 = _2772 + _2766;
            float _2776 = fma(_2760, _165, _2768);
            float _2778 = -_441;
            float _2780 = _2778 + _2770;
            float _2782 = _2774 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _2784 = _2774 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _2786 = _2774 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _2788 = -_447;
            float _2790 = _2788 + _2776;
            float _2792 = fma(_2780, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2782);
            float _2794 = fma(_2780, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2784);
            float _2796 = fma(_2780, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2786);
            float _2798 = fma(_2790, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2792);
            float _2800 = fma(_2790, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2794);
            float _2802 = fma(_2790, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2796);
            _481 = _2800;
            _483 = _2798;
            _485 = _2802;
            _2640 = _2798;
            _2646 = _2800;
            _2652 = _2802;
            _2622 = _2768;
        }
        float _2804 = _481;
        float _2806 = _483;
        float _2808 = _485;
        float _2810 = _2640;
        float _2812 = _2646;
        float _2814 = _2652;
        float _2816 = _2614;
        float _2818 = _2622;
        float _2820 = _2804 * _2804;
        float _2822 = rsqrt(_2600);
        float _2824 = fma(_2806, _2806, _2820);
        float _2826 = fma(_2808, _2808, _2824);
        float _2828 = sqrt(_2826);
        float _2830 = _2590 * _2822;
        float _2832 = _2586 * _2822;
        float _2834 = _2594 * _2822;
        bool _2836 = _2828 > 0.0;
        float _2838 = _2816;
        float _2840 = _2818;
        if (!_2836)
        {
            _2838 = _2580;
        }
        float _2842 = _2838;
        _2616 = _2842;
        if (!_2836)
        {
            _2840 = _2578;
        }
        float _2844 = _2840;
        bool _2846 = !_2836;
        _2624 = _2844;
        if (!_2846)
        {
            float _2848 = rsqrt(_2826);
            float _2850 = _2848 * _2804;
            float _2852 = _2848 * _2806;
            float _2854 = _2848 * _2808;
            float _2856 = _2832 * _2850;
            float _2858 = fma(_2830, _2852, _2856);
            float _2860 = fma(_2834, _2854, _2858);
            float _2862 = _2860 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2864 = fma(_2810, _2862, _2580);
            float _2866 = fma(_2812, _2862, _2578);
            float _2868 = fma(_2814, _2862, _2582);
            _2616 = _2864;
            _2610 = _2868;
            _2624 = _2866;
        }
    }
    float _2870 = _2616;
    float _2872 = _2610;
    float _2874 = _2624;
    float _2876 = _2282 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _2878 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2880 = isnan(0.5);
    bool _2882 = _2878 || _2880;
    bool _2884 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2886 = _2882 || _2884;
    float _2888 = -_2276;
    float _2890 = _2888 + _2870;
    bool _2892 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2894 = isnan(0.5);
    bool _2896 = _2892 || _2894;
    bool _2898 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2900 = _2896 || _2898;
    float _2902 = fma(_2288, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2876);
    float _2904 = -_2284;
    float _2906 = _2904 + _2872;
    float _2908 = fma(_2300, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2902);
    float _2910 = _2282 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2912 = _2908 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2914 = fma(_2288, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2910);
    float _2916 = 1.0 / _2912;
    float _2918 = fma(_2300, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2914);
    float _2920 = _2918 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2922 = _2920 + _2912;
    float _2924 = _2922 * _2916;
    float _2926 = _2924 * 0.5;
    float _2928 = -_2278;
    float _2930 = _2928 + _2874;
    float _2932 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2934 = fma(_2926, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2932);
    float _2936 = _2926;
    float _2938 = _2930;
    float _2940 = _2890;
    float _2942 = _2906;
    float _2944 = _2912;
    if (_2900)
    {
        _2936 = 1.0;
    }
    float _2946 = _2936;
    float _2948 = 1.0 / _2934;
    float _2950 = _2946;
    if (!_2886)
    {
        float _2952 = _2296 * _2296;
        float _2954 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2956 = -_1866;
        float _2958 = _2956 + _2872;
        float _2960 = -_1832;
        float _2962 = _2960 + _2874;
        float _2964 = fma(_2304, _2304, _2952);
        float _2966 = fma(_2312, _2312, _2964);
        float _2968 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2970 = sqrt(_2966);
        float _2972 = _2954 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2974 = 1.0 / _2402;
        float _2976 = precise::min(_2970, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2978 = _2976 * _2968;
        float _2980 = _2978 * _2974;
        float _2982 = -_1472;
        float _2984 = _2982 + _2870;
        float _2986 = _2972 * _2980;
        float _2988 = _2958 * _2980;
        float _2990 = fma(_2984, _2986, _2288);
        float _2992 = fma(_2962, _2986, _2282);
        float _2994 = fma(_2972, _2988, _2300);
        _2938 = _2992;
        _2940 = _2990;
        _2942 = _2994;
        _2368 = _2970;
        _2944 = _2980;
    }
    float _2996 = _2938;
    float _2998 = _2940;
    float _3000 = _2942;
    float _3002 = _2368;
    float _3004 = _2944;
    float _3006 = _3004;
    float _3008 = _3002;
    if (_2900)
    {
        _3006 = 1.0;
    }
    float _3010 = _3006;
    float _3012 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3014 = _2948 * _3012;
    float _3016 = _3010;
    float _3018 = _3014;
    if (!_2900)
    {
        float _3020 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3022 = _3020 * 0.15915493667125701904296875;
        float _3024 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3026 = _3022 * 6.283185482025146484375;
        float _3028 = cos(_3026);
        float _3030 = _3024 * 0.15915493667125701904296875;
        float _3032 = _3022 * 6.283185482025146484375;
        float _3034 = sin(_3032);
        float _3036 = 1.0 / _3028;
        float _3038 = _3030 * 6.283185482025146484375;
        float _3040 = cos(_3038);
        float _3042 = _3034 * _3036;
        float _3044 = _3030 * 6.283185482025146484375;
        float _3046 = sin(_3044);
        float _3048 = _3040 * _3042;
        float _3050 = 1.0 / _3048;
        float _3052 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3054 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3052;
        float _3056 = 1.0 / _3054;
        float _3058 = _3046 * _3050;
        float _3060 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3062 = fma(_3014, _3058, _3060);
        float _3064 = _3062 * _3056;
        float _3066 = precise::clamp(_3064, 0.0, 1.0);
        _2370 = _3056;
        _2950 = _3066;
    }
    float _3068 = _2370;
    float _3070 = _2950;
    float _3072 = _3068;
    if (!_2900)
    {
        float _3074 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3076 = _3074 * 0.15915493667125701904296875;
        float _3078 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3080 = _3076 * 6.283185482025146484375;
        float _3082 = cos(_3080);
        float _3084 = _3078 * 0.15915493667125701904296875;
        float _3086 = _3076 * 6.283185482025146484375;
        float _3088 = sin(_3086);
        float _3090 = 1.0 / _3082;
        float _3092 = _3084 * 6.283185482025146484375;
        float _3094 = cos(_3092);
        float _3096 = _3088 * _3090;
        float _3098 = _3084 * 6.283185482025146484375;
        float _3100 = sin(_3098);
        float _3102 = _3094 * _3096;
        float _3104 = 1.0 / _3102;
        float _3106 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3108 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _3106;
        float _3110 = 1.0 / _3108;
        float _3112 = _3100 * _3104;
        float _3114 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3116 = fma(_3014, _3112, _3114);
        float _3118 = _3116 * _3110;
        float _3120 = precise::clamp(_3118, 0.0, 1.0);
        float _3122 = -_3120;
        float _3124 = _3122 + 1.0;
        _3008 = _3112;
        _3072 = _3090;
        _3016 = _3124;
    }
    float _3126 = _3008;
    float _3128 = _3072;
    float _3130 = _3016;
    float _3132 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3134 = _2996 + _3132;
    float _3136 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3138 = _2998 + _3136;
    float _3140 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3142 = _3000 + _3140;
    float _3144 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3146 = _3134 * _3134;
    float _3148 = fma(_3138, _3138, _3146);
    float _3150 = fma(_3142, _3142, _3148);
    float _3152 = rsqrt(_3150);
    float _3154 = sqrt(_3150);
    float _3156 = _3152 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3158 = _3138 * _3156;
    float _3160 = _3142 * _3156;
    float _3162 = _3158 * _3158;
    float _3164 = _3160 * _3160;
    float _3166 = _3162 + _3164;
    float _3168 = sqrt(_3166);
    bool _3170 = _3168 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3172 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3174 = _3168 + _3172;
    float _3176 = _3152;
    float _3178 = _3128;
    float _3180 = _3174;
    float _3182 = _3126;
    float _3184 = _3134;
    if (_3170)
    {
        float _3186 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3176 = _3186;
    }
    float _3188 = _3176;
    if (_3170)
    {
        float _3190 = rsqrt(_3166);
        _3178 = _3190;
    }
    float _3192 = _3178;
    float _3194 = _3192;
    if (_3170)
    {
        float _3196 = _3174 * _3188;
        _3180 = _3196;
    }
    float _3198 = _3180;
    if (_3170)
    {
        float _3200 = _3198 * 0.15915493667125701904296875;
        _3182 = _3200;
    }
    float _3202 = _3182;
    float _3204 = _3142;
    if (_3170)
    {
        float _3206 = _3202 * 6.283185482025146484375;
        float _3208 = sin(_3206);
        _3204 = _3208;
    }
    float _3210 = _3204;
    float _3212 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3214 = precise::max(0.0, _3212);
    float _3216 = _3188;
    float _3218 = _3214;
    if (_3170)
    {
        float _3220 = _3202 * 6.283185482025146484375;
        float _3222 = cos(_3220);
        _3216 = _3222;
    }
    float _3224 = _3216;
    float _3226 = -_3156;
    float _3228 = -_3214;
    float _3230 = fma(_3134, _3226, _3228);
    if (_3170)
    {
        float _3232 = _3230 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3184 = _3232;
    }
    float _3234 = _3184;
    float _3236 = _3234;
    float _3238 = _3210;
    if (_3170)
    {
        float _3240 = fma(_3210, _3234, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3236 = _3240;
    }
    float _3242 = _3236;
    float _3244 = _3242;
    if (!_3170)
    {
        _3238 = _3162;
    }
    float _3246 = _3238;
    float _3248 = _3246;
    float _3250 = _3224;
    if (_3170)
    {
        float _3252 = _3224 + (-1.0);
        _3218 = _3252;
    }
    float _3254 = _3218;
    float _3256 = _3254;
    if (_3170)
    {
        float _3258 = _3192 * _3242;
        _487 = _3258;
    }
    float _3260 = _487;
    if (!_3170)
    {
        _3194 = _3158;
    }
    float _3262 = _3194;
    float _3264 = _3262;
    if (_3170)
    {
        float _3266 = _3254 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3018 = _3266;
    }
    float _3268 = _3018;
    if (_3170)
    {
        float _3270 = _3158 * _3260;
        _3264 = _3270;
    }
    float _3272 = _3264;
    if (!_3170)
    {
        _3244 = _3230;
    }
    float _3274 = _3244;
    float _3276 = _3274;
    if (!_3170)
    {
        _3256 = _3160;
    }
    float _3278 = _3256;
    float _3280 = _3278;
    if (_3170)
    {
        float _3282 = fma(_3230, _3224, _3268);
        _3276 = _3282;
    }
    float _3284 = _3276;
    if (_3170)
    {
        float _3286 = _3160 * _3260;
        _3280 = _3286;
    }
    float _3288 = _3280;
    if (_3170)
    {
        float _3290 = _3272 * _3272;
        _3248 = _3290;
    }
    float _3292 = _3248;
    if (!_3170)
    {
        _3250 = _3164;
    }
    float _3294 = _3250;
    float _3296 = _3294;
    if (_3170)
    {
        float _3298 = _3288 * _3288;
        _3296 = _3298;
    }
    float _3300 = _3296;
    float _3302 = fma(_3284, _3284, _3292);
    float _3304 = _2996 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3306 = _3302 + _3300;
    float _3308 = fma(_2998, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3304);
    float _3310 = _2996 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3312 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3314 = fma(_3154, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3312);
    float _3316 = precise::clamp(_3314, 0.0, 1.0);
    float _3318 = rsqrt(_3306);
    float _3320 = fma(_3000, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3308);
    float _3322 = _2996 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3324 = fma(_2998, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3310);
    float _3326 = _2996 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3328 = -_3316;
    float _3330 = _3328 + 1.0;
    float _3332 = fma(_2998, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3322);
    float _3334 = fma(_3000, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3324);
    float _3336 = _3320 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3338 = fma(_2998, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3326);
    float _3340 = abs(_3330);
    float _3342 = log2(_3340);
    float _3344 = fma(_3000, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3332);
    float _3346 = _3334 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3348 = fma(_3000, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3338);
    float _3350 = _3336 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3352 = _3344 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3354 = _3346 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3356 = _3318 * _3272;
    float _3358 = _3318 * _3288;
    float _3360 = _3348 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3362 = fma(_3352, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3354);
    float _3364 = _3318 * _3284;
    float _3366 = _3356 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3368 = -_3350;
    float _3370 = fma(_3368, _3144, 1.0);
    float _3372 = fma(_3336, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3362);
    float _3374 = _3346 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3376 = -_3366;
    float _3378 = fma(_3364, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3376);
    float _3380 = _3342 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3382 = fma(_3360, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3372);
    float _3384 = log2(_3370);
    float _3386 = -_3358;
    float _3388 = fma(_3386, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3378);
    float _3390 = _3346 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3392 = fma(_3388, -0.5, 0.5);
    float _3394 = fma(_3352, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3390);
    float _3396 = fma(_3388, 0.5, 0.5);
    float _3398 = exp2(_3380);
    float _3400 = fma(_3352, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3374);
    float _3402 = _3364 + 1.0;
    float _3404 = fma(_3336, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3394);
    float _3406 = fma(_3396, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3408 = fma(_3336, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3400);
    float _3410 = 1.0 / _3382;
    float _3412 = sqrt(_3392);
    float _3414 = -_3364;
    float _3416 = fma(_3398, _3402, _3414);
    float _3418 = fma(_3360, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3404);
    float _3420 = fma(_3360, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3408);
    float _3422 = fma(_3396, _3406, -0.212114393711090087890625);
    float _3424 = _3384 * 0.693147182464599609375;
    float _3426 = fma(_3416, 0.5, 0.5);
    float _3428 = _3418 * _3410;
    float _3430 = _3420 * _3410;
    float _3432 = fma(_3396, _3422, 1.570728778839111328125);
    float _3434 = _3424 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3436 = fma(_3428, 0.5, 0.5);
    float _3438 = fma(_3430, -0.5, 0.5);
    float _3440 = _3412 * 0.636619746685028076171875;
    float3 _8712 = float3(_3436, _3438, _3434);
    float _3442 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8712, float3(0.0), isnan(_8712)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8712, float3(0.0), isnan(_8712)), level(0.0)).x;
    float _3444 = -_3432;
    float _3446 = fma(_3440, _3444, 1.0);
    float3 _8728 = float3(_3436, _3438, _3434);
    float4 _3449 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8728, float3(0.0), isnan(_8728)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8728, float3(0.0), isnan(_8728)), level(0.0)).xyzw;
    float _3451 = _3449.x;
    float _3453 = _3449.y;
    float _3455 = _3449.z;
    float _3457 = _3449.w;
    float2 _8745 = float2(_3446, _3426);
    float3 _3461 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8745, float2(0.0), isnan(_8745)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8745, float2(0.0), isnan(_8745)), level(0.0)).xyz;
    float _3463 = _3461.x;
    float _3465 = _3461.y;
    float _3467 = _3461.z;
    float _3469 = _3342 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3471 = _3346 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _3473 = _3070 > 0.0;
    bool _3475 = isnan(_3070);
    bool _3477 = _3473 || _3475;
    bool _3479 = isnan(0.0);
    bool _3481 = _3477 || _3479;
    float _3483 = _3382 * 0.5;
    float _3485 = fma(_3352, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3471);
    float _3487 = exp2(_3469);
    bool _3489 = _3130 <= 0.0;
    bool _3491 = !_3481;
    bool _3493 = _3489 || _3491;
    float _3495 = fma(_3336, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3485);
    float _3497 = _3418 + _3382;
    float _3499 = fma(_3360, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3495);
    float _3501 = _3070 * _3130;
    float _3503 = _3497 * 0.5;
    float _3505 = _3499 + _3382;
    float _3507 = _3501 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.gl_Position.x = _3418;
    out.gl_Position.y = _3420;
    out.gl_Position.z = _3499;
    out.gl_Position.w = _3382;
    float _3509 = _3505 * 0.5;
    float _3511 = -_3487;
    float _3513 = _3511 + 1.0;
    float _3515 = fma(_3420, -0.5, _3483);
    float _3517 = _3507 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3519 = _3513 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_68.x = _3503;
    out.m_68.y = _3515;
    out.m_68.z = _3509;
    out.m_68.w = _3382;
    float _3521 = -_3519;
    float _3523 = _3521 + 1.0;
    out.m_45.x = _3517;
    float _3525 = _3519 * _3442;
    float _3527 = _3457 * _3525;
    float _3529 = _3457 * _3523;
    float _3531 = _3467 * _3525;
    float _3533 = fma(_3463, _3527, _3451);
    float _3535 = fma(_3465, _3527, _3453);
    float _3537 = fma(_3457, _3531, _3455);
    out.m_70.x = _3533;
    out.m_70.y = _3535;
    out.m_70.z = _3537;
    out.m_70.w = _3529;
    if (!_3493)
    {
        return out;
    }
    float _3539 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_45.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3539;
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
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _883 = false;
    bool _759 = false;
    bool _617 = false;
    bool _507 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _84 = in.m_42.w;
    float _86 = trunc(_84);
    int _89 = int(_86);
    bool _93 = _89 >= 1;
    float _95 = 0.0;
    if (!_93)
    {
        _95 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _97 = _95;
    float _99 = _97;
    if (!_93)
    {
        out.m_45.x = 0.0;
    }
    int _101 = 0;
    if (!_93)
    {
        float _103 = _97 * 5.0;
        _101 = as_type<int>(_103);
    }
    int _105 = _101;
    int _107 = _105;
    if (!_93)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3596 = as_type<float>(_105);
        out.gl_Position.z = _3596;
    }
    if (!_93)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _109 = in.m_47.w;
    bool _111 = _109 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _113 = isnan(_109);
    bool _115 = _111 || _113;
    bool _117 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _119 = _115 || _117;
    float _121 = -_109;
    float _123 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _125 = _123;
    if (_119)
    {
        float _127 = float(_89);
        _99 = _127;
    }
    float _129 = _99;
    bool _131 = _123 >= _129;
    bool _133 = !_119;
    bool _135 = _131 || _133;
    float _137 = _129;
    if (_135)
    {
        _137 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _137;
    if (_135)
    {
        out.m_45.x = 0.0;
    }
    if (_135)
    {
        float _141 = _139 * 5.0;
        _107 = as_type<int>(_141);
    }
    int _143 = _107;
    if (_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3666 = as_type<float>(_143);
        out.gl_Position.z = _3666;
    }
    if (_135)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _145 = as_type<float>(int(gl_VertexIndex));
    float _147 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _149 = in.m_52.w;
    bool _151 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _153 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _155 = _151 || _153;
    bool _157 = isnan(1.0);
    bool _159 = _155 || _157;
    float _161 = in.m_47.x;
    float _163 = in.m_47.y;
    float _165 = in.m_47.z;
    float _167 = in.m_42.x;
    float _169 = in.m_42.y;
    float _171 = in.m_42.z;
    int _173 = as_type<int>(_145) & 1;
    bool _175 = _173 != 0;
    int _177 = as_type<int>(_145) & 2;
    bool _179 = _177 != 0;
    int _181 = int(_175);
    int _183 = _179 ? 2 : 0;
    int _185 = _181 | _183;
    int _187 = _159 ? 4 : 0;
    int _189 = _185 | _187;
    int _191 = false ? 8 : 0;
    int _193 = _189 | _191;
    int _195 = false ? 16 : 0;
    int _197 = _193 | _195;
    int _199 = false ? 32 : 0;
    int _201 = _197 | _199;
    int _203 = false ? 64 : 0;
    int _205 = _201 | _203;
    int _207 = _205 & 4;
    float _209 = as_type<float>(_207);
    float _211 = _147;
    if (!_159)
    {
        float _213 = _147 * _147;
        float _215 = _213 * 0.5;
        _209 = _215;
    }
    float _217 = _209;
    bool _219 = !_175;
    float _221 = _219 ? (-0.5) : 0.5;
    bool _223 = !_179;
    float _225 = _223 ? (-0.5) : 0.5;
    float _227 = _217;
    if (!_159)
    {
        float _229 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _227 = _229;
    }
    float _231 = _227;
    bool _233 = !_159;
    float _235 = _231;
    float _237 = 0.0;
    if (!_233)
    {
        float _239 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _241 = log2(_239);
        float _243 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _245 = _243 + 1.0;
        float _247 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _249 = _147 * _241;
        float _251 = exp2(_249);
        float _253 = _247 * 0.693147182464599609375;
        float _255 = 1.0 / _253;
        float _257 = 1.0 / _245;
        float _259 = _251 + (-1.0);
        float _261 = -_259;
        float _263 = fma(_261, _255, _147);
        float _265 = _263 * _257;
        float _267 = _265 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _235 = _267;
        _237 = _245;
    }
    float _269 = _235;
    float _271 = _237;
    float _273 = _269 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _275 = !_159;
    float _277 = _271;
    float _279 = _269;
    if (!_275)
    {
        float _281 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _283 = log2(_281);
        float _285 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _287 = _285 + 1.0;
        float _289 = 1.0 / _287;
        float _291 = _147 * _283;
        float _293 = exp2(_291);
        float _295 = -_293;
        float _297 = _295 + 1.0;
        float _299 = _297 * _289;
        _277 = _289;
        _211 = _299;
    }
    float _301 = _277;
    float _303 = _211;
    float _305 = _273 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _307 = _273 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _309 = _269 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _311 = _273 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _313 = _301;
    if (!_159)
    {
        float _315 = _123 * _123;
        float _317 = _315 * 0.5;
        _313 = _317;
    }
    float _319 = _313;
    float _321 = fma(_309, (*spvDescriptorSet0.vp_c10)._m0[8].x, _305);
    float _323 = fma(_309, (*spvDescriptorSet0.vp_c10)._m0[8].y, _307);
    float _325 = fma(_309, (*spvDescriptorSet0.vp_c10)._m0[8].z, _311);
    float _327 = _269 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_159)
    {
        float _329 = _319 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _279 = _329;
    }
    float _331 = _279;
    bool _333 = !_159;
    float _335 = _331;
    if (!_333)
    {
        float _337 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _339 = log2(_337);
        float _341 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _343 = _341 + 1.0;
        float _345 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _347 = _123 * _339;
        float _349 = exp2(_347);
        float _351 = _345 * 0.693147182464599609375;
        float _353 = 1.0 / _351;
        float _355 = 1.0 / _343;
        float _357 = _349 + (-1.0);
        float _359 = -_357;
        float _361 = fma(_359, _353, _123);
        float _363 = _361 * _355;
        float _365 = _363 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _335 = _365;
    }
    float _367 = _335;
    float _369 = _367 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _371 = fma(_327, (*spvDescriptorSet0.vp_c10)._m0[10].x, _321);
    float _373 = fma(_327, (*spvDescriptorSet0.vp_c10)._m0[10].y, _323);
    float _375 = _367 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _377 = _369 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _379 = _369 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _381 = _369 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _383 = fma(_327, (*spvDescriptorSet0.vp_c10)._m0[10].z, _325);
    float _385 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[8].x, _377);
    float _387 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[8].y, _379);
    float _389 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[8].z, _381);
    float _391 = _367 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _393 = fma(_303, _161, _371);
    float _395 = fma(_303, _163, _373);
    float _397 = fma(_303, _165, _383);
    float _399 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[10].x, _385);
    float _401 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[10].y, _387);
    float _403 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[10].z, _389);
    float _405 = _391;
    if (!_159)
    {
        _405 = _123;
    }
    float _407 = _405;
    bool _409 = !_159;
    float _411 = _407;
    if (!_409)
    {
        float _413 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _415 = log2(_413);
        float _417 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _419 = _417 + 1.0;
        float _421 = 1.0 / _419;
        float _423 = _123 * _415;
        float _425 = exp2(_423);
        float _427 = -_425;
        float _429 = _427 + 1.0;
        float _431 = _429 * _421;
        _411 = _431;
    }
    float _433 = _411;
    float _435 = fma(_433, _163, _401);
    bool _437 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _439 = fma(_395, _149, _169);
    float _441 = fma(_433, _161, _399);
    float _443 = -_435;
    float _445 = _395 + _443;
    float _447 = fma(_433, _165, _403);
    float _449 = fma(_393, _149, _167);
    float _451 = -_441;
    float _453 = _393 + _451;
    float _455 = _445 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _457 = _445 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _459 = _445 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _461 = -_447;
    float _463 = _397 + _461;
    float _465 = fma(_453, (*spvDescriptorSet0.vp_c10)._m0[4].x, _455);
    float _467 = fma(_453, (*spvDescriptorSet0.vp_c10)._m0[5].x, _457);
    float _469 = fma(_453, (*spvDescriptorSet0.vp_c10)._m0[6].x, _459);
    float _471 = fma(_397, _149, _171);
    float _473 = fma(_463, (*spvDescriptorSet0.vp_c10)._m0[4].z, _465);
    float _475 = fma(_463, (*spvDescriptorSet0.vp_c10)._m0[5].z, _467);
    float _477 = fma(_463, (*spvDescriptorSet0.vp_c10)._m0[6].z, _469);
    bool _479 = !_437;
    float _481 = _475;
    float _483 = _473;
    float _485 = _477;
    float _487 = _447;
    float _505;
    if (!_479)
    {
        float _489 = in.m_54.x;
        float _491 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _493 = _489 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _495 = fma(_493, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _497 = _495 * _491;
        float _499 = floor(_497);
        float _501 = -_499;
        float _503 = _497 + _501;
        _505 = _503;
        _507 = true;
    }
    else
    {
        float _509 = float(_89);
        float _511 = 1.0 / _509;
        float _513 = _123 * _511;
        _505 = _513;
    }
    _507 = false;
    float _515 = _505;
    float _517 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _519 = _515 + _517;
    float _521 = in.m_52.x;
    float _523 = in.m_52.y;
    bool _525 = _515 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _527 = isnan(_515);
    bool _529 = _525 || _527;
    bool _531 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _533 = _529 || _531;
    float _535 = float(_533);
    float _537 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _539 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _537;
    bool _541 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _543 = 1.0 / _539;
    float _545 = -_535;
    float _547 = _545 + 1.0;
    float _549 = _519 * _543;
    bool _551 = _515 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _553 = isnan(_515);
    bool _555 = _551 || _553;
    bool _557 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _559 = _555 || _557;
    float _561 = float(_559);
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _565 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _563;
    float _567 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _569 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _567;
    float _571 = _561 * _547;
    float _573 = fma(_565, _549, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _575 = fma(_569, _549, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _577 = -_561;
    float _579 = _577 + 1.0;
    float _581 = _573 * _571;
    float _583 = _575 * _571;
    float _585 = fma(_579, (*spvDescriptorSet0.vp_c9)._m0[143].x, _581);
    float _587 = fma(_579, (*spvDescriptorSet0.vp_c9)._m0[143].y, _583);
    float _589 = fma(_535, (*spvDescriptorSet0.vp_c9)._m0[144].x, _585);
    float _591 = fma(_535, (*spvDescriptorSet0.vp_c9)._m0[144].y, _587);
    float _593 = _589 * _521;
    float _595 = _591 * _523;
    bool _597 = !_541;
    float _615;
    if (!_597)
    {
        float _599 = in.m_54.x;
        float _601 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _603 = _599 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _605 = fma(_603, (*spvDescriptorSet0.vp_c9)._m0[11].y, _123);
        float _607 = _605 * _601;
        float _609 = floor(_607);
        float _611 = -_609;
        float _613 = _607 + _611;
        _615 = _613;
        _617 = true;
    }
    else
    {
        float _619 = float(_89);
        float _621 = 1.0 / _619;
        float _623 = _123 * _621;
        _615 = _623;
    }
    _617 = false;
    float _625 = _615;
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _629 = _625 + _627;
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _633 = _631 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _635 = _625 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _637 = isnan(_625);
    bool _639 = _635 || _637;
    bool _641 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _643 = _639 || _641;
    float _645 = float(_643);
    float _647 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _649 = _647 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _651 = _625 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _653 = isnan(_625);
    bool _655 = _651 || _653;
    bool _657 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _659 = _655 || _657;
    float _661 = float(_659);
    float _663 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _665 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _663;
    bool _667 = _625 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _669 = isnan(_625);
    bool _671 = _667 || _669;
    bool _673 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _675 = _671 || _673;
    float _677 = float(_675);
    float _679 = 1.0 / _633;
    float _681 = -_645;
    float _683 = _681 + 1.0;
    bool _685 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _687 = _661 * _683;
    float _689 = -_661;
    float _691 = _689 + 1.0;
    float _693 = 1.0 / _649;
    float _695 = _665 * _679;
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _699 = _697 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _701 = fma(_695, _629, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _703 = _699 * _693;
    float _705 = _701 * _687;
    float _707 = -_677;
    float _709 = _707 + 1.0;
    float _711 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _713 = _625 + _711;
    float _715 = fma(_691, (*spvDescriptorSet0.vp_c9)._m0[115].x, _705);
    float _717 = _645 * _709;
    float _719 = fma(_703, _713, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _721 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _723 = fma(_719, _717, _715);
    float _725 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _727 = _721 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _729 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _731 = fma(_677, (*spvDescriptorSet0.vp_c9)._m0[117].x, _723);
    float _733 = _725 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _735 = _729 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _737 = _731 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_56.x = _727;
    out.m_56.y = _733;
    out.m_56.z = _735;
    out.m_56.w = _737;
    bool _739 = !_685;
    float _757;
    if (!_739)
    {
        float _741 = in.m_54.x;
        float _743 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _745 = _741 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _747 = fma(_745, (*spvDescriptorSet0.vp_c9)._m0[11].z, _123);
        float _749 = _747 * _743;
        float _751 = floor(_749);
        float _753 = -_751;
        float _755 = _749 + _753;
        _757 = _755;
        _759 = true;
    }
    else
    {
        float _761 = float(_89);
        float _763 = 1.0 / _761;
        float _765 = _123 * _763;
        _757 = _765;
    }
    _759 = false;
    float _767 = _757;
    float _769 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _771 = _767 + _769;
    bool _773 = _767 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _775 = isnan(_767);
    bool _777 = _773 || _775;
    bool _779 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _781 = _777 || _779;
    float _783 = float(_781);
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _787 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _785;
    bool _789 = _767 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _791 = isnan(_767);
    bool _793 = _789 || _791;
    bool _795 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _797 = _793 || _795;
    float _799 = float(_797);
    float _801 = -_783;
    float _803 = _801 + 1.0;
    float _805 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _807 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _805;
    float _809 = 1.0 / _787;
    bool _811 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _813 = _799 * _803;
    float _815 = -_799;
    float _817 = _815 + 1.0;
    float _819 = _771 * _809;
    float _821 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _823 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _821;
    float _825 = fma(_807, _819, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _827 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _829 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _827;
    float _831 = fma(_823, _819, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _833 = _825 * _813;
    float _835 = fma(_829, _819, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _837 = _831 * _813;
    float _839 = _835 * _813;
    float _841 = fma(_817, (*spvDescriptorSet0.vp_c9)._m0[123].x, _833);
    float _843 = fma(_817, (*spvDescriptorSet0.vp_c9)._m0[123].y, _839);
    float _845 = fma(_817, (*spvDescriptorSet0.vp_c9)._m0[123].z, _837);
    float _847 = fma(_783, (*spvDescriptorSet0.vp_c9)._m0[124].x, _841);
    float _849 = fma(_783, (*spvDescriptorSet0.vp_c9)._m0[124].y, _843);
    float _851 = fma(_783, (*spvDescriptorSet0.vp_c9)._m0[124].z, _845);
    bool _853 = !_811;
    float _877;
    float _879;
    float _881;
    if (!_853)
    {
        float _855 = in.m_54.x;
        float _857 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _859 = float(_89);
        float _861 = 1.0 / _859;
        float _863 = _855 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _865 = _123 * _861;
        float _867 = fma(_863, (*spvDescriptorSet0.vp_c9)._m0[11].w, _123);
        float _869 = _867 * _857;
        float _871 = floor(_869);
        float _873 = -_871;
        float _875 = _869 + _873;
        _877 = _865;
        _879 = _859;
        _881 = _875;
        _883 = true;
    }
    else
    {
        float _885 = float(_89);
        float _887 = 1.0 / _885;
        float _889 = _123 * _887;
        _877 = _889;
        _879 = _885;
        _881 = _889;
    }
    _883 = false;
    float _891 = _877;
    float _893 = _879;
    float _895 = _881;
    float _897 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _899 = int(_897);
    float _901 = in.m_54.x;
    float _903 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _905 = _891 + _903;
    float _907 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _909 = _891 + _907;
    float _911 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _913 = _911 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _915 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _917 = int(_915);
    float _919 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _921 = _919 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _923 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _925 = _923 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _927 = _593 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _929 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _931 = _929 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _933 = float(_899);
    float _935 = 1.0 / _893;
    float _937 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _939 = _937 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _941 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _943 = _941 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    int _945 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _947 = _945 != 0;
    float _949 = float(uint(_917));
    float _951 = 1.0 / _933;
    int _953 = ~_917;
    int _955 = _953 + 1;
    float _957 = float(_917);
    bool _959 = _917 == 0;
    bool _961 = _895 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _963 = isnan(_895);
    bool _965 = _961 || _963;
    bool _967 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _969 = _965 || _967;
    float _971 = float(_969);
    float _973 = 1.0 / _949;
    bool _975 = _895 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _977 = isnan(_895);
    bool _979 = _975 || _977;
    bool _981 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _983 = _979 || _981;
    float _985 = float(_983);
    float _987 = _845;
    if (!_947)
    {
        float _989 = in.m_54.y;
        _987 = _989;
    }
    float _991 = _987;
    bool _993 = _891 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _995 = isnan(_891);
    bool _997 = _993 || _995;
    bool _999 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1001 = _997 || _999;
    float _1003 = float(_1001);
    bool _1005 = _891 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1007 = isnan(_891);
    bool _1009 = _1005 || _1007;
    bool _1011 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _1013 = _1009 || _1011;
    float _1015 = float(_1013);
    bool _1017 = _891 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1019 = isnan(_891);
    bool _1021 = _1017 || _1019;
    bool _1023 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _1025 = _1021 || _1023;
    float _1027 = float(_1025);
    float _1029 = _123 * _951;
    int _1031 = ~_917;
    int _1033 = _1031 + 1;
    float _1035 = 1.0 / _913;
    float _1037 = -_1003;
    float _1039 = _1037 + 1.0;
    int _1041 = as_type<int>(_973) + (-2);
    float _1043 = trunc(_1029);
    int _1045 = int(_1043);
    float _1047 = _951;
    if (!_947)
    {
        _1047 = _991;
    }
    float _1049 = _1047;
    float _1051 = 1.0 / _921;
    float _1053 = _1049;
    int _1055 = as_type<int>(_991);
    if (_947)
    {
        float _1057 = in.m_54.x;
        float _1059 = in.m_54.y;
        _1053 = _1057;
        _1055 = as_type<int>(_1059);
    }
    float _1061 = _1053;
    int _1063 = _1055;
    float _1065 = float(uint(_1045));
    float _1067 = 1.0 / _925;
    float _1069 = as_type<float>(_1041) * _1065;
    float _1071 = trunc(_1069);
    float _1073 = precise::max(_1071, 0.0);
    uint _1076 = uint(_1073);
    float _1078 = 1.0 / _931;
    float _1080 = float(_1045);
    bool _1082 = !_947;
    float _1084 = _1082 ? as_type<float>(_1063) : _901;
    bool _1086 = _1080 >= _957;
    bool _1088 = isnan(_1080);
    bool _1090 = _1086 || _1088;
    bool _1092 = isnan(_957);
    bool _1094 = _1090 || _1092;
    float _1096 = float(_1094);
    int _1098 = _1033 * int(_1076);
    int _1100 = _1098 + _1045;
    float _1102 = 1.0 / _939;
    float _1104 = float(uint(_1100));
    float _1106 = trunc(_1096);
    int _1108 = int(_1106);
    float _1110 = as_type<float>(_1041) * _1104;
    bool _1112 = !_947;
    float _1114 = _1112 ? 1.2345600128173828125 : 1.0;
    float _1116 = trunc(_1110);
    float _1118 = precise::max(_1116, 0.0);
    uint _1120 = uint(_1118);
    float _1122 = _1114 * _1084;
    int _1124 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1126 = _1124 != 0;
    float _1128 = floor(_1122);
    int _1130 = int(_1076) + int(_1120);
    float _1132 = 1.0 / _943;
    int _1134 = _955 * _1130;
    int _1136 = _1134 + _1045;
    bool _1138 = uint(_1136) >= uint(_917);
    bool _1140 = !_1138;
    int _1142 = _1140 ? 0 : (-1);
    int _1144 = ~_1130;
    int _1146 = _1144 + _1142;
    int _1148 = _1146 + 1;
    float _1150 = -_1128;
    float _1152 = _1122 + _1150;
    int _1154 = ~_1108;
    int _1156 = _1154 + 1;
    int _1158 = _1156 + 1;
    int _1160 = _917 * _1148;
    int _1162 = _1160 + _1045;
    float _1164 = _957 * _1152;
    float _1166 = _123 * _957;
    int _1168 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1170 = _1168 != 0;
    int _1172 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1174 = _1172 != 0;
    bool _1176 = !_959;
    int _1178 = _1176 ? _1162 : (-1);
    float _1180 = _1166 * _935;
    int _1182 = _917 + (-1);
    float _1184 = trunc(_1164);
    int _1186 = int(_1184);
    bool _1188 = !_1174;
    int _1190 = _1188 ? 0 : 1;
    int _1192 = _1158 * _1178;
    bool _1194 = !_1126;
    int _1196 = _1194 ? 0 : 1;
    int _1198 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1200 = _1198 != 0;
    int _1202 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1204 = _1202 != 0;
    int _1206 = _1108 * _1182;
    int _1208 = _1206 + _1192;
    bool _1210 = !_1170;
    int _1212 = _1210 ? 0 : 1;
    float _1214 = trunc(_1180);
    int _1216 = int(_1214);
    int _1218 = abs(_1196);
    int _1220 = abs(_1190);
    bool _1222 = !_1200;
    int _1224 = _1222 ? 0 : 1;
    int _1226 = abs(_1212);
    int _1228 = _1208 * _1220;
    float _1230 = _439 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _1232 = abs(_1224);
    int _1234 = _1186 * _1218;
    int _1236 = _1234 + _1045;
    bool _1238 = !_1204;
    int _1240 = _1238 ? 0 : 1;
    float _1242 = _439 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _1244 = _1216 * _1226;
    int _1246 = _1244 + _1228;
    int _1248 = abs(_1240);
    float _1250 = fma(_449, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1242);
    int _1252 = ~_917;
    int _1254 = _1252 + 1;
    int _1256 = _1236 * _1232;
    int _1258 = _1256 + _1246;
    float _1260 = fma(_449, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1230);
    float _1262 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1264 = log2(_1262);
    float _1266 = fma(_471, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1250);
    int _1268 = _1186 * _1248;
    int _1270 = _1268 + _1258;
    int _1272 = ~_917;
    int _1274 = _1272 + 1;
    float _1276 = float(uint(_1270));
    float _1278 = as_type<float>(_1041) * _1276;
    float _1280 = trunc(_1278);
    float _1282 = precise::max(_1280, 0.0);
    uint _1284 = uint(_1282);
    float _1286 = _123 * _1264;
    float _1288 = exp2(_1286);
    int _1290 = _1274 * int(_1284);
    int _1292 = _1290 + _1270;
    float _1294 = float(uint(_1292));
    float _1296 = -_1288;
    float _1298 = _1296 + 1.0;
    float _1300 = as_type<float>(_1041) * _1294;
    float _1302 = trunc(_1300);
    float _1304 = precise::max(_1302, 0.0);
    uint _1306 = uint(_1304);
    int _1308 = int(_1284) + int(_1306);
    int _1310 = _1254 * _1308;
    int _1312 = _1310 + _1270;
    bool _1314 = uint(_1312) >= uint(_917);
    bool _1316 = !_1314;
    int _1318 = _1316 ? 0 : (-1);
    int _1320 = ~_1308;
    int _1322 = _1320 + _1318;
    int _1324 = _1322 + 1;
    float _1326 = in.m_54.w;
    int _1328 = _917 * _1324;
    int _1330 = _1328 + _1270;
    float _1332 = in.m_54.z;
    float _1334 = _901 * 2.0;
    bool _1336 = !_959;
    int _1338 = _1336 ? _1330 : (-1);
    float _1340 = floor(_1334);
    int _1342 = _1338 & 3;
    bool _1344 = _1342 != 0;
    bool _1346 = uint(_1342) > 1u;
    bool _1348 = _1326 > 0.5;
    int _1350 = _1344 ? 0 : 1;
    bool _1352 = _1332 > 0.5;
    bool _1354 = _1340 >= 0.0;
    bool _1356 = isnan(_1340);
    bool _1358 = _1354 || _1356;
    bool _1360 = isnan(0.0);
    bool _1362 = _1358 || _1360;
    int _1364 = ~_1350;
    int _1366 = _1364 + 1;
    int _1368 = _1366 + 1;
    float _1370 = -_221;
    int _1372 = _1352 ? as_type<int>(_1370) : as_type<int>(_221);
    int _1374 = _1368;
    float _1376 = as_type<float>(_1306);
    if (!_1346)
    {
        int _1378 = ~_1350;
        int _1380 = _1378 + 1;
        _1374 = _1380;
    }
    int _1382 = _1374;
    float _1384 = -_225;
    int _1386 = _1348 ? as_type<int>(_1384) : as_type<int>(_225);
    int _1388 = _1362 ? 0 : 1;
    bool _1390 = _1340 > 0.0;
    bool _1392 = _901 > 0.5;
    int _1394 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1396 = _1394 != 0;
    int _1398 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1400 = _1398 != 0;
    float _1402 = -_221;
    int _1404 = _1392 ? as_type<int>(_1402) : as_type<int>(_221);
    int _1406 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1408 = _1406 != 0;
    int _1410 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1412 = _1410 != 0;
    int _1414 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1416 = _1414 != 0;
    int _1418 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1420 = _1418 != 0;
    float _1422 = _439 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _1424 = ~_1388;
    int _1426 = _1424 + 1;
    int _1428 = _1426 + 1;
    float _1430 = fma(_449, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1422);
    float _1432 = _1332 * 2.0;
    float _1434 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1436 = _1434 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    int _1438 = _1428;
    if (!_1390)
    {
        int _1440 = ~_1388;
        int _1442 = _1440 + 1;
        _1438 = _1442;
    }
    int _1444 = _1438;
    float _1446 = fma(_471, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1430);
    float _1448 = floor(_1432);
    float _1450 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1452 = _1450 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1454 = !_1396;
    float _1456 = _1454 ? _221 : as_type<float>(_1372);
    float _1458 = fma(_471, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1260);
    bool _1460 = !_1400;
    float _1462 = _1460 ? _225 : as_type<float>(_1386);
    float _1464 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1466 = _1464 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    int _1468 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1470 = _1468 != 0;
    float _1472 = _1446 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1474 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1476 = _1474 != 0;
    float _1478 = 1.0 / _1436;
    int _1480 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1482 = _1480 != 0;
    if (!_1420)
    {
        _1376 = _1332;
    }
    float _1484 = _1376;
    float _1486 = 1.0 / _1452;
    float _1488 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1490 = _1488 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1492 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1494 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1492;
    float _1496 = 0.0;
    float _1498 = _1484;
    if (!_1420)
    {
        _1496 = _1332;
    }
    float _1500 = _1496;
    float _1502 = _1490 * _1035;
    float _1504 = _1500;
    if (_1420)
    {
        _1498 = as_type<float>(_1063);
    }
    float _1506 = _1498;
    float _1508 = 1.0 / _1466;
    if (_1420)
    {
        _1504 = as_type<float>(_1063);
    }
    float _1510 = _1504;
    float _1512 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _1514 = _1512 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    bool _1516 = _1448 >= 0.0;
    bool _1518 = isnan(_1448);
    bool _1520 = _1516 || _1518;
    bool _1522 = isnan(0.0);
    bool _1524 = _1520 || _1522;
    float _1526 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1528 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1526;
    float _1530 = _1494 * _1051;
    float _1532 = _1514 * _1067;
    float _1534 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _1536 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _1534;
    float _1538 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1540 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1538;
    int _1542 = _1524 ? 0 : 1;
    float _1544 = _1528 * _1478;
    bool _1546 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1548 = isnan(0.0);
    bool _1550 = _1546 || _1548;
    bool _1552 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1554 = _1550 || _1552;
    float _1556 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1558 = _1556 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1560 = _1536 * _1078;
    float _1562 = _1540 * _1486;
    float _1564 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1566 = _1564 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1568 = _1554 ? _1298 : 0.0;
    float _1570 = _1558 * _1102;
    bool _1572 = _1448 > 0.0;
    float _1574 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1576 = _895 + _1574;
    float _1578 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1580 = _891 + _1578;
    float _1582 = _1566 * _1508;
    float _1584 = fma(_1502, _1576, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1586 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1588 = _891 + _1586;
    float _1590 = fma(_1532, _1580, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _1592 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1594 = _891 + _1592;
    float _1596 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1598 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1596;
    bool _1600 = _891 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1602 = isnan(_891);
    bool _1604 = _1600 || _1602;
    bool _1606 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1608 = _1604 || _1606;
    float _1610 = float(_1608);
    float _1612 = fma(_1544, _1588, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _1614 = fma(_1582, _1594, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    bool _1616 = _891 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1618 = isnan(_891);
    bool _1620 = _1616 || _1618;
    bool _1622 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1624 = _1620 || _1622;
    float _1626 = float(_1624);
    float _1628 = _1598 * _1132;
    float _1630 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1632 = _895 + _1630;
    float _1634 = -_1610;
    float _1636 = _1634 + 1.0;
    float _1638 = fma(_1560, _905, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    bool _1640 = _891 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1642 = isnan(_891);
    bool _1644 = _1640 || _1642;
    bool _1646 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1648 = _1644 || _1646;
    float _1650 = float(_1648);
    float _1652 = -_1626;
    float _1654 = _1652 + 1.0;
    float _1656 = fma(_1530, _1632, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1658 = _1626 * _1636;
    bool _1660 = _895 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1662 = isnan(_895);
    bool _1664 = _1660 || _1662;
    bool _1666 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1668 = _1664 || _1666;
    float _1670 = float(_1668);
    float _1672 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1674 = _891 + _1672;
    bool _1676 = _891 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1678 = isnan(_891);
    bool _1680 = _1676 || _1678;
    bool _1682 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1684 = _1680 || _1682;
    float _1686 = float(_1684);
    float _1688 = _1650 * _1654;
    float _1690 = -_1650;
    float _1692 = _1690 + 1.0;
    float _1694 = fma(_1562, _1674, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _1696 = -_1670;
    float _1698 = _1696 + 1.0;
    float _1700 = _1686 * _1692;
    float _1702 = -_1686;
    float _1704 = _1702 + 1.0;
    bool _1706 = _891 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1708 = isnan(_891);
    bool _1710 = _1706 || _1708;
    bool _1712 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1714 = _1710 || _1712;
    float _1716 = float(_1714);
    float _1718 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1720 = 1.0 + _1718;
    float _1722 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1724 = _891 + _1722;
    float _1726 = _1003 * _1704;
    float _1728 = _1015 * _1039;
    float _1730 = -_1015;
    float _1732 = _1730 + 1.0;
    float _1734 = _985 * _1698;
    float _1736 = 1.0 / _1720;
    float _1738 = -_985;
    float _1740 = _1738 + 1.0;
    float _1742 = _1027 * _1732;
    float _1744 = -_1027;
    float _1746 = _1744 + 1.0;
    float _1748 = fma(_1628, _1724, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _1750 = _971 * _1740;
    float _1752 = fma(_1570, _909, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _1754 = _1716 * _1746;
    float _1756 = _1656 * _1750;
    float _1758 = -_971;
    float _1760 = _1758 + 1.0;
    float _1762 = _1638 * _1754;
    float _1764 = -_1716;
    float _1766 = _1764 + 1.0;
    float _1768 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1770 = _1061 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1772 = _1568 * _1736;
    float _1774 = fma(_1061, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1768);
    float _1776 = fma(_1766, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1762);
    float _1778 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1780 = fma(_1590, _1742, _1776);
    float _1782 = _1506 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1784 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1786 = fma(_1510, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1778);
    float _1788 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _1790 = !_1476;
    float _1792 = _1790 ? _221 : as_type<float>(_1404);
    float _1794 = _901 + as_type<float>(_1063);
    float _1796 = as_type<float>(_1063) * 2.0;
    float _1798 = -_1784;
    float _1800 = fma(_1770, 2.0, _1798);
    float _1802 = fma(_1782, -2.0, _1788);
    float _1804 = _1794 + (-1.0);
    float _1806 = float(uint(_1236));
    float _1808 = floor(_1796);
    bool _1810 = !_1412;
    int _1812 = _1810 ? 0 : 1;
    float _1814 = fma(_1804, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1816 = fma(_1760, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1756);
    float _1818 = as_type<float>(_1041) * _1806;
    bool _1820 = !_1408;
    int _1822 = _1820 ? 0 : 1;
    float _1824 = fma(_1612, _1728, _1780);
    bool _1826 = as_type<float>(_1063) > 0.5;
    float _1828 = fma(_1584, _1734, _1816);
    int _1830 = abs(_1812);
    float _1832 = _1266 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1834 = ~_1542;
    int _1836 = _1834 + 1;
    int _1838 = _1836 + 1;
    float _1840 = trunc(_1818);
    float _1842 = precise::max(_1840, 0.0);
    uint _1844 = uint(_1842);
    int _1846 = _1838;
    if (!_1572)
    {
        int _1848 = ~_1542;
        int _1850 = _1848 + 1;
        _1846 = _1850;
    }
    int _1852 = _1846;
    float _1854 = _1332 + as_type<float>(_1063);
    float _1856 = -_225;
    int _1858 = _1826 ? as_type<int>(_1856) : as_type<int>(_225);
    float _1860 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1862 = _1472 + _1860;
    int _1864 = abs(_1822);
    float _1866 = _1458 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1868 = uint(_1342) >= 2u;
    float _1870 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1872 = _1832 + _1870;
    float _1874 = _1854 + (-1.0);
    bool _1876 = _1808 >= 0.0;
    bool _1878 = isnan(_1808);
    bool _1880 = _1876 || _1878;
    bool _1882 = isnan(0.0);
    bool _1884 = _1880 || _1882;
    float _1886 = -_123;
    float _1888 = fma(_1886, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1800);
    int _1890 = _1868 ? 0 : 1;
    float _1892 = _1872 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _1894 = _1808 > 0.0;
    float _1896 = fma(_1670, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1828);
    int _1898 = ~_917;
    int _1900 = _1898 + 1;
    float _1902 = fma(_1862, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1892);
    float _1904 = float(_1864);
    float _1906 = _1456 + 0.5;
    float _1908 = float(_1852);
    float _1910 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1912 = _1866 + _1910;
    float _1914 = float(_1830);
    float _1916 = fma(_1906, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1888);
    float _1918 = float(_1444);
    float _1920 = _1904 * _1908;
    float _1922 = fma(_1912, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1902);
    int _1924 = _1338 >> 31;
    float _1926 = _1914 * _1918;
    bool _1928 = !_1482;
    float _1930 = _1928 ? _225 : as_type<float>(_1858);
    int _1932 = _1900 * int(_1844);
    int _1934 = _1932 + _1236;
    float _1936 = _1462 + (-0.5);
    float _1938 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1802);
    int _1940 = _1924 & 3;
    float _1942 = _1896 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1944 = float(uint(_1934));
    float _1946 = -_1936;
    float _1948 = -_1938;
    float _1950 = fma(_1946, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1948);
    int _1952 = _1338 + _1940;
    float _1954 = fma(_1614, _1726, _1824);
    bool _1956 = _1922 >= 0.0;
    float _1958 = as_type<float>(_1041) * _1944;
    int _1960 = _1952 >> 2;
    float _1962 = _847 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1964 = _849 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1966 = _851 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _1968 = _1960 << 4;
    int _1970 = _1968 + 512;
    float _1972 = in.m_58.x;
    float _1974 = in.m_58.y;
    float _1976 = in.m_58.z;
    float _1978 = trunc(_1958);
    float _1980 = precise::max(_1978, 0.0);
    uint _1982 = uint(_1980);
    float _1984 = fma(_1694, _1700, _1954);
    uint _1986 = uint(int(uint(_1970) >> uint(2)));
    uint _1988 = uint(int(uint(int(_1986)) >> uint(2)));
    int _1990 = int(_1986) & 3;
    float _1992 = (*spvDescriptorSet0.vp_c9)._m0[int(_1988)][_1990];
    int _1994 = int(_1986) + 1;
    uint _1996 = uint(int(uint(_1994) >> uint(2)));
    int _1998 = _1994 & 3;
    float _2000 = (*spvDescriptorSet0.vp_c9)._m0[int(_1996)][_1998];
    float _2002 = _1962 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2004 = _1964 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2006 = _1966 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2008 = _1884 ? 0 : 1;
    float _2010 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1774);
    float _2012 = _1920 * (-2.0);
    float _2014 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _2016 = _1970 + 8;
    uint _2018 = uint(int(uint(_2016) >> uint(2)));
    uint _2020 = uint(int(uint(int(_2018)) >> uint(2)));
    int _2022 = int(_2018) & 3;
    float _2024 = (*spvDescriptorSet0.vp_c9)._m0[int(_2020)][_2022];
    int _2026 = int(_2018) + 1;
    uint _2028 = uint(int(uint(_2026) >> uint(2)));
    int _2030 = _2026 & 3;
    float _2032 = (*spvDescriptorSet0.vp_c9)._m0[int(_2028)][_2030];
    out.m_60.x = _2002;
    out.m_60.y = _2004;
    out.m_60.z = _2006;
    out.m_60.w = _1942;
    int _2034 = ~_2008;
    int _2036 = _2034 + 1;
    int _2038 = _2036 + 1;
    float _2040 = fma(_1814, _2012, _1814);
    int _2042 = _2038;
    if (!_1894)
    {
        int _2044 = ~_2008;
        int _2046 = _2044 + 1;
        _2042 = _2046;
    }
    int _2048 = _2042;
    float _2050 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1786);
    int _2052 = int(_1844) + int(_1982);
    float _2054 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2056 = -_1930;
    float _2058 = _2056 + 0.5;
    bool _2060 = _1342 != 3;
    float _2062 = fma(_1752, _1688, _1984);
    int _2064 = _1338 & 3;
    bool _2066 = _2064 != 0;
    float _2068 = fma(_2012, _1972, _1972);
    float _2070 = _1792 + 0.5;
    float _2072 = -_2010;
    float _2074 = _2072 + 1.0;
    int _2076 = ~_917;
    int _2078 = _2076 + 1;
    float _2080 = fma(_1874, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _2082 = !_2066;
    int _2084 = _2082 ? 0 : 1;
    float _2086 = -_2074;
    float _2088 = fma(_1456, _2086, _1916);
    float _2090 = _2070 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2092 = -_2050;
    float _2094 = _2092 + 1.0;
    float _2096 = _2058 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _2098 = abs(_1382);
    int _2100 = _2078 * _2052;
    int _2102 = _2100 + _1236;
    int _2104 = abs(_2084);
    float _2106 = _2090 * _2014;
    float _2108 = fma(_1462, _2094, _1950);
    float _2110 = _2096 * _2054;
    bool _2112 = uint(_2102) >= uint(_917);
    float _2114 = fma(_1748, _1658, _2062);
    float _2116 = _1926 * (-2.0);
    bool _2118 = !_2112;
    int _2120 = _2118 ? 0 : (-1);
    out.m_62.x = _2106;
    out.m_62.y = _2110;
    out.m_62.z = _2088;
    out.m_62.w = _2108;
    int _2122 = ~_1890;
    int _2124 = _2122 + 1;
    int _2126 = _2124 + 1;
    float _2128 = fma(_1610, (*spvDescriptorSet0.vp_c9)._m0[158].x, _2114);
    bool _2130 = _1342 != 3;
    int _2132 = _2126;
    if (_1956)
    {
        out.m_45.x = 0.0;
    }
    if (_2060)
    {
        int _2134 = ~_1890;
        int _2136 = _2134 + 1;
        _2132 = _2136;
    }
    int _2138 = _2132;
    float _2140 = fma(_2080, _2116, _2080);
    out.m_64.x = _2128;
    int _2142 = ~_2098;
    int _2144 = _2142 + 1;
    int _2146 = _2144 + 1;
    float _2148 = fma(_2116, _1974, _1974);
    int _2150 = abs(_2138);
    int _2152 = ~_2052;
    int _2154 = _2152 + _2120;
    int _2156 = _2154 + 1;
    int _2158 = _2146 * as_type<int>(_2000);
    bool _2160 = !_2130;
    int _2162 = _2160 ? 0 : (-1);
    int _2164 = ~_2104;
    int _2166 = _2164 + 1;
    int _2168 = _2166 + 1;
    bool _2170 = !_1470;
    int _2172 = _2170 ? 0 : 1;
    int _2174 = abs(_2162);
    int _2176 = _2168 * as_type<int>(_1992);
    int _2178 = _2176 + _2158;
    float _2180 = _1872 * _1872;
    int _2182 = abs(_2172);
    float _2184 = _901 + (-0.5);
    int _2186 = ~_2150;
    int _2188 = _2186 + 1;
    int _2190 = _2188 + 1;
    int _2192 = ~_2174;
    int _2194 = _2192 + 1;
    int _2196 = _2194 + 1;
    bool _2198 = _917 == 0;
    int _2200 = _2190 * as_type<int>(_2024);
    int _2202 = _2200 + _2178;
    float _2204 = fma(_1862, _1862, _2180);
    float _2206 = fma(_2184, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2068);
    int _2208 = _917 * _2156;
    int _2210 = _2208 + _1236;
    int _2212 = ~_2182;
    int _2214 = _2212 + 1;
    int _2216 = _2214 + 1;
    int _2218 = _2196 * as_type<int>(_2032);
    int _2220 = _2218 + _2202;
    float _2222 = fma(_1912, _1912, _2204);
    float _2224 = _2204;
    if (_1956)
    {
        _2224 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2226 = _2224;
    float _2228 = as_type<float>(_1063) + (-0.5);
    bool _2230 = !_2198;
    int _2232 = _2230 ? _2210 : (-1);
    int _2234 = _2216 * _2220;
    bool _2236 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2238 = isnan(1.0);
    bool _2240 = _2236 || _2238;
    bool _2242 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2244 = _2240 || _2242;
    float _2246 = rsqrt(_2222);
    int _2248 = _2232 * _2182;
    int _2250 = _2248 + _2234;
    int _2252 = as_type<int>(_2226);
    if (_1956)
    {
        float _2254 = _2226 * 5.0;
        _2252 = as_type<int>(_2254);
    }
    int _2256 = _2252;
    float _2258 = _927 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    bool _2260 = !_2244;
    float _2262 = _2260 ? _123 : _1772;
    float _2264 = float(_2250);
    if (_1956)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6873 = as_type<float>(_2256);
        out.gl_Position.z = _6873;
    }
    bool _2266 = !_1416;
    int _2268 = _2266 ? 0 : 1;
    float _2270 = fma(_2262, _2040, _2206);
    out.m_66.y = _2264;
    float _2272 = _2258 * _2246;
    int _2274 = abs(_2268);
    float _2276 = _1862 * _2272;
    float _2278 = _1872 * _2272;
    if (_1956)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2280 = -_2278;
    float _2282 = _1832 + _2280;
    float _2284 = _1912 * _2272;
    float _2286 = -_2276;
    float _2288 = _1472 + _2286;
    float _2290 = -_2278;
    float _2292 = _1872 + _2290;
    float _2294 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2296 = _2282 + _2294;
    float _2298 = -_2284;
    float _2300 = _1866 + _2298;
    float _2302 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2304 = _2288 + _2302;
    float _2306 = float(_2274);
    float _2308 = _2296 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2310 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2312 = _2300 + _2310;
    float _2314 = float(_2048);
    float _2316 = fma(_2228, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2148);
    float _2318 = fma(_2304, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2308);
    float _2320 = -_2276;
    float _2322 = _1862 + _2320;
    float _2324 = -_2284;
    float _2326 = _1912 + _2324;
    float _2328 = fma(_2262, _2140, _2316);
    float _2330 = fma(_2312, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2318);
    float _2332 = _2292 * _2292;
    float _2334 = _2306 * _2314;
    float _2336 = _901 + _1332;
    float _2338 = _2270 * 0.15915493667125701904296875;
    bool _2340 = _2330 >= 0.0;
    float _2342 = fma(_2322, _2322, _2332);
    float _2344 = _2328 * 0.15915493667125701904296875;
    float _2346 = _2336 + (-1.0);
    float _2348 = fma(_2326, _2326, _2342);
    float _2350 = _2334 * (-2.0);
    float _2352 = _2344 * 6.283185482025146484375;
    float _2354 = sin(_2352);
    float _2356 = fma(_2346, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2358 = _1332 + (-0.5);
    float _2360 = fma(_2350, _1976, _1976);
    float _2362 = fma(_2356, _2350, _2356);
    float _2364 = _2326;
    int _2366 = as_type<int>(_2360);
    float _2368 = _2304;
    float _2370 = _2300;
    if (_2340)
    {
        _2364 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2372 = _2364;
    float _2374 = fma(_2358, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2360);
    float _2376 = _2338 * 6.283185482025146484375;
    float _2378 = sin(_2376);
    if (_2340)
    {
        out.m_45.x = 0.0;
    }
    if (_2340)
    {
        float _2380 = _2372 * 5.0;
        _2366 = as_type<int>(_2380);
    }
    int _2382 = _2366;
    float _2384 = fma(_2262, _2362, _2374);
    float _2386 = _2338 * 6.283185482025146484375;
    float _2388 = cos(_2386);
    if (_2340)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7072 = as_type<float>(_2382);
        out.gl_Position.z = _7072;
    }
    float _2390 = _2384 * 0.15915493667125701904296875;
    float _2392 = sqrt(_2348);
    float _2394 = _2344 * 6.283185482025146484375;
    float _2396 = cos(_2394);
    if (_2340)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2398 = _2390 * 6.283185482025146484375;
    float _2400 = cos(_2398);
    float _2402 = _2246 * _2392;
    float _2404 = _595 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2406 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _225);
    float _2408 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _221);
    float _2410 = _927 * _2402;
    float _2412 = _2402 * _2404;
    float _2414 = _2378 * _2354;
    float _2416 = _2390 * 6.283185482025146484375;
    float _2418 = sin(_2416);
    float _2420 = _2408 * _2410;
    float _2422 = _2406 * _2412;
    float _2424 = _2388 * _2396;
    float _2426 = _2388 * _2354;
    float _2428 = _2400 * _2422;
    float _2430 = _2354 * _2400;
    float _2432 = _2378 * _2396;
    float _2434 = _2396 * _2400;
    float _2436 = _2388 * _2428;
    float _2438 = _2402 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2440 = _2438 * 0.5;
    float _2442 = _2378 * _2428;
    float _2444 = fma(_2418, _2424, _2414);
    float _2446 = -_2422;
    float _2448 = _2418 * _2446;
    float _2450 = -_2432;
    float _2452 = fma(_2418, _2426, _2450);
    float _2454 = -_2426;
    float _2456 = fma(_2418, _2432, _2454);
    float _2458 = fma(_2444, _2420, _2436);
    float _2460 = fma(_2434, _2420, _2448);
    float _2462 = fma(_2418, _2414, _2424);
    float _2464 = fma(_2456, _2420, _2442);
    float _2466 = fma(_2452, _2440, _2458);
    float _2468 = fma(_2430, _2440, _2460);
    float _2470 = fma(_2462, _2440, _2464);
    float _2472 = _2466 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2474 = _2466 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2476 = fma(_2468, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2472);
    float _2478 = fma(_2468, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2474);
    float _2480 = fma(_2470, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2476);
    float _2482 = fma(_2470, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2478);
    float _2484 = _2480 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2486 = _2482 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2488 = _1866 + _2484;
    float _2490 = _1472 + _2486;
    float _2492 = _2466 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2494 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2496 = _2488 + _2494;
    float _2498 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2500 = _2490 + _2498;
    float _2502 = fma(_2468, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2492);
    float _2504 = _2496 * _2496;
    float _2506 = fma(_2470, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2502);
    float _2508 = fma(_2500, _2500, _2504);
    float _2510 = _2506 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2512 = sqrt(_2508);
    float _2514 = _1832 + _2510;
    bool _2516 = _2512 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2518 = _2506;
    float _2520 = _2490;
    float _2522 = _2510;
    float _2524 = _2496;
    float _2526 = _2508;
    if (!_2516)
    {
        _2518 = _2490;
    }
    float _2528 = _2518;
    float _2530 = _2528;
    if (!_2516)
    {
        _2520 = _2488;
    }
    float _2532 = _2520;
    float _2534 = _2532;
    if (!_2516)
    {
        _2522 = _2514;
    }
    float _2536 = _2522;
    bool _2538 = !_2516;
    float _2540 = _2536;
    if (!_2538)
    {
        float _2542 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2544 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2546 = _2512 + _2544;
        float _2548 = _2514 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2550 = rsqrt(_2508);
        float _2552 = _2546 * _2542;
        float _2554 = _2552 * 0.15915493667125701904296875;
        float _2556 = _2554 * 6.283185482025146484375;
        float _2558 = cos(_2556);
        float _2560 = _2554 * 6.283185482025146484375;
        float _2562 = sin(_2560);
        float _2564 = _2558 + (-1.0);
        float _2566 = fma(_2562, _2548, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2568 = _2564 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2570 = _2550 * _2566;
        float _2572 = fma(_2514, _2558, _2568);
        float _2574 = fma(_2500, _2570, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2576 = fma(_2496, _2570, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2540 = _2572;
        _2530 = _2574;
        _2534 = _2576;
    }
    float _2578 = _2540;
    float _2580 = _2530;
    float _2582 = _2534;
    float _2584 = -_1832;
    float _2586 = _2584 + _2578;
    float _2588 = -_1472;
    float _2590 = _2588 + _2580;
    float _2592 = -_1866;
    float _2594 = _2592 + _2582;
    float _2596 = _2586 * _2586;
    float _2598 = fma(_2590, _2590, _2596);
    float _2600 = fma(_2594, _2594, _2598);
    float _2602 = sqrt(_2600);
    bool _2604 = _2602 > 0.0;
    float _2606 = _2598;
    float _2608 = _2602;
    float _2610 = _2582;
    if (!_2604)
    {
        _2606 = _2580;
    }
    float _2612 = _2606;
    float _2614 = _2612;
    float _2616 = _2612;
    if (!_2604)
    {
        _2608 = _2578;
    }
    float _2618 = _2608;
    bool _2620 = !_2604;
    float _2622 = _2618;
    float _2624 = _2618;
    if (!_2620)
    {
        bool _2626 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2628 = _2488;
        if (_2626)
        {
            float _2630 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2628 = _2630;
        }
        float _2632 = _2628;
        float _2634 = _2632;
        if (_2626)
        {
            float _2636 = _473 * _2632;
            _2524 = _2636;
        }
        float _2638 = _2524;
        float _2640 = _2638;
        if (_2626)
        {
            float _2642 = _475 * _2632;
            _2526 = _2642;
        }
        float _2644 = _2526;
        float _2646 = _2644;
        if (_2626)
        {
            float _2648 = _477 * _2632;
            _2634 = _2648;
        }
        float _2650 = _2634;
        float _2652 = _2650;
        if (!_2626)
        {
            bool _2654 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
            bool _2656 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
            bool _2658 = _2654 || _2656;
            bool _2660 = isnan(1.0);
            bool _2662 = _2658 || _2660;
            float _2664 = _123 + 1.0;
            if (!_2662)
            {
                float _2666 = _2664 * _2664;
                float _2668 = _2666 * 0.5;
                _125 = _2668;
            }
            float _2670 = _125;
            float _2672 = _2670;
            if (!_2662)
            {
                float _2674 = _2670 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2672 = _2674;
            }
            float _2676 = _2672;
            bool _2678 = !_2662;
            float _2680 = _2676;
            if (!_2678)
            {
                float _2682 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2684 = log2(_2682);
                float _2686 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2688 = 1.0 + _2686;
                float _2690 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2692 = _2684 * _2664;
                float _2694 = 1.0 / _2688;
                float _2696 = _2690 * 0.693147182464599609375;
                float _2698 = exp2(_2692);
                float _2700 = 1.0 / _2696;
                float _2702 = _2698 + (-1.0);
                float _2704 = -_2702;
                float _2706 = fma(_2704, _2700, _2664);
                float _2708 = _2706 * _2694;
                float _2710 = _2708 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2680 = _2710;
            }
            float _2712 = _2680;
            float _2714 = _2712 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _2716 = _2712 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2718 = _2712 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2720 = _2712;
            if (!_2662)
            {
                _2720 = _2664;
            }
            float _2722 = _2720;
            float _2724 = _2714 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
            float _2726 = _2714 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
            float _2728 = _2714 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
            float _2730 = fma(_2716, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2724);
            float _2732 = fma(_2716, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2726);
            float _2734 = fma(_2718, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2730);
            bool _2736 = !_2662;
            float _2738 = _2722;
            _2614 = _2732;
            if (!_2736)
            {
                float _2740 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2742 = log2(_2740);
                float _2744 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2746 = 1.0 + _2744;
                float _2748 = 1.0 / _2746;
                float _2750 = _2742 * _2664;
                float _2752 = exp2(_2750);
                float _2754 = -_2752;
                float _2756 = _2754 + 1.0;
                float _2758 = _2756 * _2748;
                _2738 = _2758;
            }
            float _2760 = _2738;
            float _2762 = fma(_2716, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2728);
            float _2764 = fma(_2718, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2732);
            float _2766 = fma(_2760, _163, _2734);
            float _2768 = fma(_2718, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2762);
            float _2770 = fma(_2760, _161, _2764);
            float _2772 = -_435;
            float _2774 = _2772 + _2766;
            float _2776 = fma(_2760, _165, _2768);
            float _2778 = -_441;
            float _2780 = _2778 + _2770;
            float _2782 = _2774 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _2784 = _2774 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _2786 = _2774 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _2788 = -_447;
            float _2790 = _2788 + _2776;
            float _2792 = fma(_2780, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2782);
            float _2794 = fma(_2780, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2784);
            float _2796 = fma(_2780, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2786);
            float _2798 = fma(_2790, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2792);
            float _2800 = fma(_2790, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2794);
            float _2802 = fma(_2790, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2796);
            _481 = _2800;
            _483 = _2798;
            _485 = _2802;
            _2640 = _2798;
            _2646 = _2800;
            _2652 = _2802;
            _2622 = _2768;
        }
        float _2804 = _481;
        float _2806 = _483;
        float _2808 = _485;
        float _2810 = _2640;
        float _2812 = _2646;
        float _2814 = _2652;
        float _2816 = _2614;
        float _2818 = _2622;
        float _2820 = _2804 * _2804;
        float _2822 = rsqrt(_2600);
        float _2824 = fma(_2806, _2806, _2820);
        float _2826 = fma(_2808, _2808, _2824);
        float _2828 = sqrt(_2826);
        float _2830 = _2590 * _2822;
        float _2832 = _2586 * _2822;
        float _2834 = _2594 * _2822;
        bool _2836 = _2828 > 0.0;
        float _2838 = _2816;
        float _2840 = _2818;
        if (!_2836)
        {
            _2838 = _2580;
        }
        float _2842 = _2838;
        _2616 = _2842;
        if (!_2836)
        {
            _2840 = _2578;
        }
        float _2844 = _2840;
        bool _2846 = !_2836;
        _2624 = _2844;
        if (!_2846)
        {
            float _2848 = rsqrt(_2826);
            float _2850 = _2848 * _2804;
            float _2852 = _2848 * _2806;
            float _2854 = _2848 * _2808;
            float _2856 = _2832 * _2850;
            float _2858 = fma(_2830, _2852, _2856);
            float _2860 = fma(_2834, _2854, _2858);
            float _2862 = _2860 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2864 = fma(_2810, _2862, _2580);
            float _2866 = fma(_2812, _2862, _2578);
            float _2868 = fma(_2814, _2862, _2582);
            _2616 = _2864;
            _2610 = _2868;
            _2624 = _2866;
        }
    }
    float _2870 = _2616;
    float _2872 = _2610;
    float _2874 = _2624;
    float _2876 = _2282 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _2878 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2880 = isnan(0.5);
    bool _2882 = _2878 || _2880;
    bool _2884 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2886 = _2882 || _2884;
    float _2888 = -_2276;
    float _2890 = _2888 + _2870;
    bool _2892 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2894 = isnan(0.5);
    bool _2896 = _2892 || _2894;
    bool _2898 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2900 = _2896 || _2898;
    float _2902 = fma(_2288, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2876);
    float _2904 = -_2284;
    float _2906 = _2904 + _2872;
    float _2908 = fma(_2300, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2902);
    float _2910 = _2282 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2912 = _2908 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2914 = fma(_2288, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2910);
    float _2916 = 1.0 / _2912;
    float _2918 = fma(_2300, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2914);
    float _2920 = _2918 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2922 = _2920 + _2912;
    float _2924 = _2922 * _2916;
    float _2926 = _2924 * 0.5;
    float _2928 = -_2278;
    float _2930 = _2928 + _2874;
    float _2932 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2934 = fma(_2926, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2932);
    float _2936 = _2926;
    float _2938 = _2930;
    float _2940 = _2890;
    float _2942 = _2906;
    float _2944 = _2912;
    if (_2900)
    {
        _2936 = 1.0;
    }
    float _2946 = _2936;
    float _2948 = 1.0 / _2934;
    float _2950 = _2946;
    if (!_2886)
    {
        float _2952 = _2296 * _2296;
        float _2954 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2956 = -_1866;
        float _2958 = _2956 + _2872;
        float _2960 = -_1832;
        float _2962 = _2960 + _2874;
        float _2964 = fma(_2304, _2304, _2952);
        float _2966 = fma(_2312, _2312, _2964);
        float _2968 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2970 = sqrt(_2966);
        float _2972 = _2954 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2974 = 1.0 / _2402;
        float _2976 = precise::min(_2970, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2978 = _2976 * _2968;
        float _2980 = _2978 * _2974;
        float _2982 = -_1472;
        float _2984 = _2982 + _2870;
        float _2986 = _2972 * _2980;
        float _2988 = _2958 * _2980;
        float _2990 = fma(_2984, _2986, _2288);
        float _2992 = fma(_2962, _2986, _2282);
        float _2994 = fma(_2972, _2988, _2300);
        _2938 = _2992;
        _2940 = _2990;
        _2942 = _2994;
        _2368 = _2970;
        _2944 = _2980;
    }
    float _2996 = _2938;
    float _2998 = _2940;
    float _3000 = _2942;
    float _3002 = _2368;
    float _3004 = _2944;
    float _3006 = _3004;
    float _3008 = _3002;
    if (_2900)
    {
        _3006 = 1.0;
    }
    float _3010 = _3006;
    float _3012 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3014 = _2948 * _3012;
    float _3016 = _3010;
    float _3018 = _3014;
    if (!_2900)
    {
        float _3020 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3022 = _3020 * 0.15915493667125701904296875;
        float _3024 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3026 = _3022 * 6.283185482025146484375;
        float _3028 = cos(_3026);
        float _3030 = _3024 * 0.15915493667125701904296875;
        float _3032 = _3022 * 6.283185482025146484375;
        float _3034 = sin(_3032);
        float _3036 = 1.0 / _3028;
        float _3038 = _3030 * 6.283185482025146484375;
        float _3040 = cos(_3038);
        float _3042 = _3034 * _3036;
        float _3044 = _3030 * 6.283185482025146484375;
        float _3046 = sin(_3044);
        float _3048 = _3040 * _3042;
        float _3050 = 1.0 / _3048;
        float _3052 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3054 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3052;
        float _3056 = 1.0 / _3054;
        float _3058 = _3046 * _3050;
        float _3060 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3062 = fma(_3014, _3058, _3060);
        float _3064 = _3062 * _3056;
        float _3066 = precise::clamp(_3064, 0.0, 1.0);
        _2370 = _3056;
        _2950 = _3066;
    }
    float _3068 = _2370;
    float _3070 = _2950;
    float _3072 = _3068;
    if (!_2900)
    {
        float _3074 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3076 = _3074 * 0.15915493667125701904296875;
        float _3078 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3080 = _3076 * 6.283185482025146484375;
        float _3082 = cos(_3080);
        float _3084 = _3078 * 0.15915493667125701904296875;
        float _3086 = _3076 * 6.283185482025146484375;
        float _3088 = sin(_3086);
        float _3090 = 1.0 / _3082;
        float _3092 = _3084 * 6.283185482025146484375;
        float _3094 = cos(_3092);
        float _3096 = _3088 * _3090;
        float _3098 = _3084 * 6.283185482025146484375;
        float _3100 = sin(_3098);
        float _3102 = _3094 * _3096;
        float _3104 = 1.0 / _3102;
        float _3106 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3108 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _3106;
        float _3110 = 1.0 / _3108;
        float _3112 = _3100 * _3104;
        float _3114 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3116 = fma(_3014, _3112, _3114);
        float _3118 = _3116 * _3110;
        float _3120 = precise::clamp(_3118, 0.0, 1.0);
        float _3122 = -_3120;
        float _3124 = _3122 + 1.0;
        _3008 = _3112;
        _3072 = _3090;
        _3016 = _3124;
    }
    float _3126 = _3008;
    float _3128 = _3072;
    float _3130 = _3016;
    float _3132 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3134 = _2996 + _3132;
    float _3136 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3138 = _2998 + _3136;
    float _3140 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3142 = _3000 + _3140;
    float _3144 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3146 = _3134 * _3134;
    float _3148 = fma(_3138, _3138, _3146);
    float _3150 = fma(_3142, _3142, _3148);
    float _3152 = rsqrt(_3150);
    float _3154 = sqrt(_3150);
    float _3156 = _3152 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3158 = _3138 * _3156;
    float _3160 = _3142 * _3156;
    float _3162 = _3158 * _3158;
    float _3164 = _3160 * _3160;
    float _3166 = _3162 + _3164;
    float _3168 = sqrt(_3166);
    bool _3170 = _3168 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3172 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3174 = _3168 + _3172;
    float _3176 = _3152;
    float _3178 = _3128;
    float _3180 = _3174;
    float _3182 = _3126;
    float _3184 = _3134;
    if (_3170)
    {
        float _3186 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3176 = _3186;
    }
    float _3188 = _3176;
    if (_3170)
    {
        float _3190 = rsqrt(_3166);
        _3178 = _3190;
    }
    float _3192 = _3178;
    float _3194 = _3192;
    if (_3170)
    {
        float _3196 = _3174 * _3188;
        _3180 = _3196;
    }
    float _3198 = _3180;
    if (_3170)
    {
        float _3200 = _3198 * 0.15915493667125701904296875;
        _3182 = _3200;
    }
    float _3202 = _3182;
    float _3204 = _3142;
    if (_3170)
    {
        float _3206 = _3202 * 6.283185482025146484375;
        float _3208 = sin(_3206);
        _3204 = _3208;
    }
    float _3210 = _3204;
    float _3212 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3214 = precise::max(0.0, _3212);
    float _3216 = _3188;
    float _3218 = _3214;
    if (_3170)
    {
        float _3220 = _3202 * 6.283185482025146484375;
        float _3222 = cos(_3220);
        _3216 = _3222;
    }
    float _3224 = _3216;
    float _3226 = -_3156;
    float _3228 = -_3214;
    float _3230 = fma(_3134, _3226, _3228);
    if (_3170)
    {
        float _3232 = _3230 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3184 = _3232;
    }
    float _3234 = _3184;
    float _3236 = _3234;
    float _3238 = _3210;
    if (_3170)
    {
        float _3240 = fma(_3210, _3234, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3236 = _3240;
    }
    float _3242 = _3236;
    float _3244 = _3242;
    if (!_3170)
    {
        _3238 = _3162;
    }
    float _3246 = _3238;
    float _3248 = _3246;
    float _3250 = _3224;
    if (_3170)
    {
        float _3252 = _3224 + (-1.0);
        _3218 = _3252;
    }
    float _3254 = _3218;
    float _3256 = _3254;
    if (_3170)
    {
        float _3258 = _3192 * _3242;
        _487 = _3258;
    }
    float _3260 = _487;
    if (!_3170)
    {
        _3194 = _3158;
    }
    float _3262 = _3194;
    float _3264 = _3262;
    if (_3170)
    {
        float _3266 = _3254 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3018 = _3266;
    }
    float _3268 = _3018;
    if (_3170)
    {
        float _3270 = _3158 * _3260;
        _3264 = _3270;
    }
    float _3272 = _3264;
    if (!_3170)
    {
        _3244 = _3230;
    }
    float _3274 = _3244;
    float _3276 = _3274;
    if (!_3170)
    {
        _3256 = _3160;
    }
    float _3278 = _3256;
    float _3280 = _3278;
    if (_3170)
    {
        float _3282 = fma(_3230, _3224, _3268);
        _3276 = _3282;
    }
    float _3284 = _3276;
    if (_3170)
    {
        float _3286 = _3160 * _3260;
        _3280 = _3286;
    }
    float _3288 = _3280;
    if (_3170)
    {
        float _3290 = _3272 * _3272;
        _3248 = _3290;
    }
    float _3292 = _3248;
    if (!_3170)
    {
        _3250 = _3164;
    }
    float _3294 = _3250;
    float _3296 = _3294;
    if (_3170)
    {
        float _3298 = _3288 * _3288;
        _3296 = _3298;
    }
    float _3300 = _3296;
    float _3302 = fma(_3284, _3284, _3292);
    float _3304 = _2996 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3306 = _3302 + _3300;
    float _3308 = fma(_2998, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3304);
    float _3310 = _2996 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3312 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3314 = fma(_3154, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3312);
    float _3316 = precise::clamp(_3314, 0.0, 1.0);
    float _3318 = rsqrt(_3306);
    float _3320 = fma(_3000, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3308);
    float _3322 = _2996 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3324 = fma(_2998, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3310);
    float _3326 = _2996 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3328 = -_3316;
    float _3330 = _3328 + 1.0;
    float _3332 = fma(_2998, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3322);
    float _3334 = fma(_3000, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3324);
    float _3336 = _3320 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3338 = fma(_2998, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3326);
    float _3340 = abs(_3330);
    float _3342 = log2(_3340);
    float _3344 = fma(_3000, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3332);
    float _3346 = _3334 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3348 = fma(_3000, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3338);
    float _3350 = _3336 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3352 = _3344 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3354 = _3346 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3356 = _3318 * _3272;
    float _3358 = _3318 * _3288;
    float _3360 = _3348 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3362 = fma(_3352, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3354);
    float _3364 = _3318 * _3284;
    float _3366 = _3356 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3368 = -_3350;
    float _3370 = fma(_3368, _3144, 1.0);
    float _3372 = fma(_3336, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3362);
    float _3374 = _3346 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3376 = -_3366;
    float _3378 = fma(_3364, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3376);
    float _3380 = _3342 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3382 = fma(_3360, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3372);
    float _3384 = log2(_3370);
    float _3386 = -_3358;
    float _3388 = fma(_3386, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3378);
    float _3390 = _3346 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3392 = fma(_3388, -0.5, 0.5);
    float _3394 = fma(_3352, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3390);
    float _3396 = fma(_3388, 0.5, 0.5);
    float _3398 = exp2(_3380);
    float _3400 = fma(_3352, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3374);
    float _3402 = _3364 + 1.0;
    float _3404 = fma(_3336, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3394);
    float _3406 = fma(_3396, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3408 = fma(_3336, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3400);
    float _3410 = 1.0 / _3382;
    float _3412 = sqrt(_3392);
    float _3414 = -_3364;
    float _3416 = fma(_3398, _3402, _3414);
    float _3418 = fma(_3360, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3404);
    float _3420 = fma(_3360, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3408);
    float _3422 = fma(_3396, _3406, -0.212114393711090087890625);
    float _3424 = _3384 * 0.693147182464599609375;
    float _3426 = fma(_3416, 0.5, 0.5);
    float _3428 = _3418 * _3410;
    float _3430 = _3420 * _3410;
    float _3432 = fma(_3396, _3422, 1.570728778839111328125);
    float _3434 = _3424 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3436 = fma(_3428, 0.5, 0.5);
    float _3438 = fma(_3430, -0.5, 0.5);
    float _3440 = _3412 * 0.636619746685028076171875;
    float3 _8712 = float3(_3436, _3438, _3434);
    float _3442 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8712, float3(0.0), isnan(_8712)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8712, float3(0.0), isnan(_8712)), level(0.0)).x;
    float _3444 = -_3432;
    float _3446 = fma(_3440, _3444, 1.0);
    float3 _8728 = float3(_3436, _3438, _3434);
    float4 _3449 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8728, float3(0.0), isnan(_8728)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8728, float3(0.0), isnan(_8728)), level(0.0)).xyzw;
    float _3451 = _3449.x;
    float _3453 = _3449.y;
    float _3455 = _3449.z;
    float _3457 = _3449.w;
    float2 _8745 = float2(_3446, _3426);
    float3 _3461 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8745, float2(0.0), isnan(_8745)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8745, float2(0.0), isnan(_8745)), level(0.0)).xyz;
    float _3463 = _3461.x;
    float _3465 = _3461.y;
    float _3467 = _3461.z;
    float _3469 = _3342 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3471 = _3346 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _3473 = _3070 > 0.0;
    bool _3475 = isnan(_3070);
    bool _3477 = _3473 || _3475;
    bool _3479 = isnan(0.0);
    bool _3481 = _3477 || _3479;
    float _3483 = _3382 * 0.5;
    float _3485 = fma(_3352, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3471);
    float _3487 = exp2(_3469);
    bool _3489 = _3130 <= 0.0;
    bool _3491 = !_3481;
    bool _3493 = _3489 || _3491;
    float _3495 = fma(_3336, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3485);
    float _3497 = _3418 + _3382;
    float _3499 = fma(_3360, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3495);
    float _3501 = _3070 * _3130;
    float _3503 = _3497 * 0.5;
    float _3505 = _3499 + _3382;
    float _3507 = _3501 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.gl_Position.x = _3418;
    out.gl_Position.y = _3420;
    out.gl_Position.z = _3499;
    out.gl_Position.w = _3382;
    float _3509 = _3505 * 0.5;
    float _3511 = -_3487;
    float _3513 = _3511 + 1.0;
    float _3515 = fma(_3420, -0.5, _3483);
    float _3517 = _3507 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3519 = _3513 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_68.x = _3503;
    out.m_68.y = _3515;
    out.m_68.z = _3509;
    out.m_68.w = _3382;
    float _3521 = -_3519;
    float _3523 = _3521 + 1.0;
    out.m_45.x = _3517;
    float _3525 = _3519 * _3442;
    float _3527 = _3457 * _3525;
    float _3529 = _3457 * _3523;
    float _3531 = _3467 * _3525;
    float _3533 = fma(_3463, _3527, _3451);
    float _3535 = fma(_3465, _3527, _3453);
    float _3537 = fma(_3457, _3531, _3455);
    out.m_70.x = _3533;
    out.m_70.y = _3535;
    out.m_70.z = _3537;
    out.m_70.w = _3529;
    if (!_3493)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3539 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_45.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3539;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

