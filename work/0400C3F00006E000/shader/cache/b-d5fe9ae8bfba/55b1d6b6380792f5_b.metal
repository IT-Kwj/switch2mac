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
    constant _16* vp_c13 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_28 [[id(7)]];
    sampler vp_t_tcb_28Smplr [[id(8)]];
    texture2d<float> vp_t_tcb_24 [[id(9)]];
    sampler vp_t_tcb_24Smplr [[id(10)]];
    texture3d<float> vp_t_tcb_32 [[id(11)]];
    sampler vp_t_tcb_32Smplr [[id(12)]];
    texture3d<float> vp_t_tcb_30 [[id(13)]];
    sampler vp_t_tcb_30Smplr [[id(14)]];
    texture2d<float> vp_t_tcb_1C [[id(15)]];
    sampler vp_t_tcb_1CSmplr [[id(16)]];
    sampler vp_t_tcb_28Smplr_w [[id(17)]];
    sampler vp_t_tcb_24Smplr_w [[id(18)]];
    sampler vp_t_tcb_32Smplr_w [[id(19)]];
    sampler vp_t_tcb_30Smplr_w [[id(20)]];
    sampler vp_t_tcb_1CSmplr_w [[id(21)]];
    constant dm_border_t* dm_border [[id(22)]];
};

struct main0_out
{
    float4 m_74 [[user(locn0)]];
    float4 m_70 [[user(locn1)]];
    float4 m_72 [[user(locn2)]];
    float4 m_84 [[user(locn3)]];
    float4 m_92 [[user(locn4)]];
    float4 m_53 [[user(locn5)]];
    float4 m_78 [[user(locn6)]];
    float4 m_80 [[user(locn7)]];
    float4 m_82 [[user(locn8)]];
    float4 m_76 [[user(locn9)]];
    float4 m_90 [[user(locn10)]];
    float4 m_86 [[user(locn11)]];
    float4 m_88 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_64 [[attribute(0)]];
    float4 m_66 [[attribute(1)]];
    float4 m_57 [[attribute(2)]];
    float4 m_50 [[attribute(3)]];
    float4 m_55 [[attribute(4)]];
    float4 m_59 [[attribute(5)]];
    float4 m_68 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2256 = false;
    bool _1235 = false;
    bool _317 = false;
    bool _215 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _106 = in.m_50.w;
    float _108 = trunc(_106);
    int _111 = int(_108);
    bool _115 = _111 >= 1;
    float _117 = 0.0;
    if (!_115)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _119 = _117;
    float _121 = _119;
    if (!_115)
    {
        out.m_53.x = 0.0;
    }
    int _123 = 0;
    if (!_115)
    {
        float _125 = _119 * 5.0;
        _123 = as_type<int>(_125);
    }
    int _127 = _123;
    if (!_115)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2560 = as_type<float>(_127);
        out.gl_Position.z = _2560;
    }
    if (!_115)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _129 = in.m_55.w;
    bool _131 = _129 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = isnan(_129);
    bool _135 = _131 || _133;
    bool _137 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _139 = _135 || _137;
    float _141 = -_129;
    float _143 = _141 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _145 = 0.0;
    float _147 = _143;
    if (_139)
    {
        float _149 = float(_111);
        _145 = _149;
    }
    float _151 = _145;
    bool _153 = _143 >= _151;
    bool _155 = !_139;
    bool _157 = _153 || _155;
    if (_157)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _159 = _121;
    if (_157)
    {
        out.m_53.x = 0.0;
    }
    int _161 = 0;
    if (_157)
    {
        float _163 = _159 * 5.0;
        _161 = as_type<int>(_163);
    }
    int _165 = _161;
    if (_157)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2629 = as_type<float>(_165);
        out.gl_Position.z = _2629;
    }
    if (_157)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _167 = in.m_57.x;
    float _169 = in.m_57.y;
    float _171 = in.m_57.z;
    bool _173 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _175 = _169 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _177 = _169 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _179 = _169 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _181 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[4].x, _175);
    float _183 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[5].x, _177);
    float _185 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[6].x, _179);
    float _187 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[4].z, _181);
    float _189 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[5].z, _183);
    float _191 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[6].z, _185);
    bool _193 = !_173;
    float _195 = _191;
    float _213;
    if (!_193)
    {
        float _197 = in.m_59.x;
        float _199 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _201 = _197 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _203 = fma(_201, (*spvDescriptorSet0.vp_c9)._m0[12].x, _143);
        float _205 = _203 * _199;
        float _207 = floor(_205);
        float _209 = -_207;
        float _211 = _205 + _209;
        _213 = _211;
        _215 = true;
    }
    else
    {
        float _217 = float(_111);
        float _219 = 1.0 / _217;
        float _221 = _143 * _219;
        _213 = _221;
    }
    _215 = false;
    float _223 = _213;
    float _225 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _227 = _223 + _225;
    bool _229 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _231 = isnan(_223);
    bool _233 = _229 || _231;
    bool _235 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _237 = _233 || _235;
    float _239 = float(_237);
    float _241 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _243 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _241;
    float _245 = -_239;
    float _247 = _245 + 1.0;
    bool _249 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _251 = isnan(_223);
    bool _253 = _249 || _251;
    bool _255 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _257 = _253 || _255;
    float _259 = float(_257);
    float _261 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _263 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _261;
    bool _265 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _267 = 1.0 / _243;
    float _269 = _259 * _247;
    float _271 = -_259;
    float _273 = _271 + 1.0;
    float _275 = _227 * _267;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _279 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _277;
    float _281 = fma(_263, _275, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _283 = fma(_279, _275, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _285 = _281 * _269;
    float _287 = _283 * _269;
    float _289 = fma(_273, (*spvDescriptorSet0.vp_c9)._m0[143].x, _285);
    float _291 = fma(_273, (*spvDescriptorSet0.vp_c9)._m0[143].y, _287);
    float _293 = fma(_239, (*spvDescriptorSet0.vp_c9)._m0[144].x, _289);
    float _295 = fma(_239, (*spvDescriptorSet0.vp_c9)._m0[144].y, _291);
    bool _297 = !_265;
    float _315;
    if (!_297)
    {
        float _299 = in.m_59.x;
        float _301 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _303 = _299 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _305 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[11].y, _143);
        float _307 = _305 * _301;
        float _309 = floor(_307);
        float _311 = -_309;
        float _313 = _307 + _311;
        _315 = _313;
        _317 = true;
    }
    else
    {
        float _319 = float(_111);
        float _321 = 1.0 / _319;
        float _323 = _143 * _321;
        _315 = _323;
    }
    _317 = false;
    float _325 = _315;
    float _327 = in.m_59.x;
    float _329 = in.m_59.y;
    float _331 = in.m_59.z;
    float _333 = in.m_59.w;
    float _335 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _337 = log2(_335);
    float _339 = as_type<float>(int(gl_VertexIndex));
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _343 = 1.0 + _341;
    float _345 = in.m_64.y;
    float _347 = 1.0 / _343;
    float _349 = _337 * _143;
    float _351 = exp2(_349);
    float _353 = _331 * 2.0;
    float _355 = _327 * 2.0;
    float _357 = _329 * 2.0;
    int _359 = as_type<int>(_339) & 1;
    bool _361 = _359 != 0;
    int _363 = as_type<int>(_339) & 2;
    bool _365 = _363 != 0;
    bool _367 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _369 = isnan(1.0);
    bool _371 = _367 || _369;
    bool _373 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _375 = _371 || _373;
    float _377 = floor(_353);
    bool _379 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _381 = isnan(0.0);
    bool _383 = _379 || _381;
    bool _385 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _387 = _383 || _385;
    bool _389 = _333 > 0.5;
    float _391 = _329 + _331;
    float _393 = floor(_355);
    float _395 = -_351;
    float _397 = _395 + 1.0;
    float _399 = _391 + (-1.0);
    float _401 = _387 ? _397 : 0.0;
    float _403 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _405 = _377 > 0.0;
    float _407 = floor(_357);
    bool _409 = _377 >= 0.0;
    bool _411 = isnan(_377);
    bool _413 = _409 || _411;
    bool _415 = isnan(0.0);
    bool _417 = _413 || _415;
    if (_375)
    {
        float _419 = _401 * _347;
        _147 = _419;
    }
    float _421 = _147;
    float _423 = _331 + _327;
    int _425 = _417 ? 0 : 1;
    int _427 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _429 = _427 != 0;
    int _431 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _433 = _431 != 0;
    int _435 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _437 = _435 != 0;
    float _439 = _423 + (-1.0);
    int _441 = ~_425;
    int _443 = _441 + 1;
    int _445 = _443 + 1;
    int _447 = _445;
    if (!_405)
    {
        int _449 = ~_425;
        int _451 = _449 + 1;
        _447 = _451;
    }
    int _453 = _447;
    bool _455 = _393 >= 0.0;
    bool _457 = isnan(_393);
    bool _459 = _455 || _457;
    bool _461 = isnan(0.0);
    bool _463 = _459 || _461;
    float _465 = fma(_439, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _467 = !_429;
    int _469 = _467 ? 0 : 1;
    float _471 = _329 + _327;
    int _473 = _463 ? 0 : 1;
    bool _475 = _393 > 0.0;
    float _477 = _471 + (-1.0);
    int _479 = abs(_469);
    float _481 = in.m_66.x;
    float _483 = in.m_66.y;
    float _485 = in.m_66.z;
    bool _487 = _407 >= 0.0;
    bool _489 = isnan(_407);
    bool _491 = _487 || _489;
    bool _493 = isnan(0.0);
    bool _495 = _491 || _493;
    float _497 = float(_479);
    int _499 = _495 ? 0 : 1;
    bool _501 = _407 > 0.0;
    float _503 = float(_453);
    float _505 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _507 = ~_473;
    int _509 = _507 + 1;
    int _511 = _509 + 1;
    int _513 = _511;
    if (!_475)
    {
        int _515 = ~_473;
        int _517 = _515 + 1;
        _513 = _517;
    }
    int _519 = _513;
    float _521 = _497 * _503;
    bool _523 = !_433;
    int _525 = _523 ? 0 : 1;
    bool _527 = !_437;
    int _529 = _527 ? 0 : 1;
    float _531 = _521 * (-2.0);
    int _533 = ~_499;
    int _535 = _533 + 1;
    int _537 = _535 + 1;
    int _539 = _537;
    if (!_501)
    {
        int _541 = ~_499;
        int _543 = _541 + 1;
        _539 = _543;
    }
    int _545 = _539;
    int _547 = abs(_525);
    float _549 = fma(_531, _481, _481);
    int _551 = abs(_529);
    float _553 = fma(_505, _531, _505);
    float _555 = float(_547);
    float _557 = float(_519);
    float _559 = float(_551);
    float _561 = float(_545);
    float _563 = _555 * _557;
    bool _565 = _327 > 0.5;
    float _567 = _327 + (-0.5);
    float _569 = _559 * _561;
    float _571 = _563 * (-2.0);
    float _573 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[196].x, _549);
    float _575 = _569 * (-2.0);
    float _577 = fma(_571, _483, _483);
    float _579 = fma(_553, _421, _573);
    float _581 = fma(_403, _571, _403);
    float _583 = in.m_68.x;
    float _585 = in.m_68.y;
    float _587 = fma(_575, _485, _485);
    float _589 = _329 + (-0.5);
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _593 = _591 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _595 = in.m_50.x;
    float _597 = in.m_50.y;
    float _599 = in.m_50.z;
    float _601 = _331 + (-0.5);
    float _603 = fma(_589, (*spvDescriptorSet0.vp_c9)._m0[196].y, _577);
    float _605 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _607 = _605 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _609 = fma(_465, _575, _465);
    float _611 = fma(_601, (*spvDescriptorSet0.vp_c9)._m0[196].z, _587);
    float _613 = fma(_581, _421, _603);
    float _615 = 1.0 / _593;
    float _617 = _579 * 0.15915493667125701904296875;
    float _619 = fma(_609, _421, _611);
    float _621 = _613 * 0.15915493667125701904296875;
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _625 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _623;
    bool _627 = _329 > 0.5;
    float _629 = 1.0 / _607;
    bool _631 = !_361;
    float _633 = _631 ? (-0.5) : 0.5;
    float _635 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _637 = _293 * _583;
    float _639 = _295 * _585;
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _643 = _641 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _645 = _619 * 0.15915493667125701904296875;
    float _647 = _597 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _649 = _597 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _651 = _617 * 6.283185482025146484375;
    float _653 = sin(_651);
    float _655 = fma(_595, (*spvDescriptorSet0.vp_c10)._m0[4].x, _647);
    float _657 = fma(_595, (*spvDescriptorSet0.vp_c10)._m0[6].x, _649);
    float _659 = _625 * _615;
    float _661 = _643 * _629;
    float _663 = fma(_599, (*spvDescriptorSet0.vp_c10)._m0[6].z, _657);
    float _665 = _617 * 6.283185482025146484375;
    float _667 = cos(_665);
    float _669 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _671 = _325 + _669;
    bool _673 = !_365;
    float _675 = _673 ? (-0.5) : 0.5;
    float _677 = fma(_599, (*spvDescriptorSet0.vp_c10)._m0[4].z, _655);
    float _679 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _681 = _325 + _679;
    float _683 = _637 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _685 = fma(_661, _671, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _687 = _621 * 6.283185482025146484375;
    float _689 = sin(_687);
    float _691 = _639 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _693 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _675);
    float _695 = fma(_659, _681, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _697 = _677 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _699 = _663 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _701 = _691 * _693;
    int _703 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _705 = _703 != 0;
    float _707 = _621 * 6.283185482025146484375;
    float _709 = cos(_707);
    int _711 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _713 = _711 != 0;
    int _715 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _717 = _715 != 0;
    float _719 = _645 * 6.283185482025146484375;
    float _721 = cos(_719);
    float _723 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _633);
    float _725 = _667 * _689;
    float _727 = _653 * _689;
    float _729 = _683 * _723;
    bool _731 = _325 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _733 = isnan(_325);
    bool _735 = _731 || _733;
    bool _737 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _739 = _735 || _737;
    float _741 = float(_739);
    float _743 = _645 * 6.283185482025146484375;
    float _745 = sin(_743);
    float _747 = _653 * _709;
    float _749 = _667 * _709;
    float _751 = -_741;
    float _753 = _751 + 1.0;
    float _755 = _653 * _721;
    float _757 = _709 * _721;
    float _759 = _667 * _721;
    float _761 = _689 * _721;
    float _763 = _759 * _701;
    float _765 = _759 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _767 = -_725;
    float _769 = fma(_745, _747, _767);
    float _771 = -_747;
    float _773 = fma(_745, _725, _771);
    bool _775 = _325 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _777 = isnan(_325);
    bool _779 = _775 || _777;
    bool _781 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _783 = _779 || _781;
    float _785 = float(_783);
    float _787 = fma(_745, _749, _727);
    bool _789 = _325 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _791 = isnan(_325);
    bool _793 = _789 || _791;
    bool _795 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _797 = _793 || _795;
    float _799 = float(_797);
    float _801 = -_701;
    float _803 = _745 * _801;
    float _805 = fma(_745, _727, _749);
    float _807 = _785 * _753;
    float _809 = -_785;
    float _811 = _809 + 1.0;
    float _813 = fma(_787, _729, _763);
    float _815 = _755 * _701;
    float _817 = fma(_757, _729, _803);
    float _819 = _799 * _811;
    float _821 = fma(_773, _635, _813);
    float _823 = fma(_769, _729, _815);
    float _825 = fma(_761, _635, _817);
    float _827 = _695 * _819;
    float _829 = _821 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _831 = _821 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _833 = fma(_805, _635, _823);
    float _835 = fma(_825, (*spvDescriptorSet0.vp_c8)._m0[24].x, _829);
    float _837 = fma(_825, (*spvDescriptorSet0.vp_c8)._m0[26].x, _831);
    float _839 = -_799;
    float _841 = _839 + 1.0;
    float _843 = fma(_833, (*spvDescriptorSet0.vp_c8)._m0[24].z, _835);
    float _845 = fma(_833, (*spvDescriptorSet0.vp_c8)._m0[26].z, _837);
    float _847 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _849 = _843 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _851 = _845 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _853 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _855 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _857 = _697 + _849;
    float _859 = _699 + _851;
    float _861 = fma(_841, (*spvDescriptorSet0.vp_c9)._m0[115].x, _827);
    float _863 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _865 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _867 = _857 + _865;
    float _869 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _871 = _859 + _869;
    float _873 = fma(_685, _807, _861);
    float _875 = _863 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _877 = _867 * _867;
    float _879 = _871 * _871;
    float _881 = _847 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _883 = _855 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _885 = -_745;
    float _887 = fma(_885, (*spvDescriptorSet0.vp_c8)._m0[26].x, _765);
    float _889 = _877 + _879;
    float _891 = _597 + _345;
    float _893 = _759 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    out.m_70.x = _875;
    out.m_70.y = _881;
    out.m_70.z = _883;
    out.m_70.w = _853;
    float _895 = sqrt(_889);
    float _897 = _759 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _899 = -_745;
    float _901 = fma(_899, (*spvDescriptorSet0.vp_c8)._m0[25].x, _893);
    float _903 = fma(_741, (*spvDescriptorSet0.vp_c9)._m0[117].x, _873);
    float _905 = _787 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _907 = -_745;
    float _909 = fma(_907, (*spvDescriptorSet0.vp_c8)._m0[24].x, _897);
    float _911 = fma(_755, (*spvDescriptorSet0.vp_c8)._m0[25].z, _901);
    float _913 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _915 = fma(_755, (*spvDescriptorSet0.vp_c8)._m0[24].z, _909);
    float _917 = fma(_757, (*spvDescriptorSet0.vp_c8)._m0[26].x, _905);
    float _919 = fma(_755, (*spvDescriptorSet0.vp_c8)._m0[26].z, _887);
    float _921 = _787 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _923 = _821 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _925 = _773 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _927 = _787 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _929 = fma(_757, (*spvDescriptorSet0.vp_c8)._m0[24].x, _921);
    float _931 = fma(_825, (*spvDescriptorSet0.vp_c8)._m0[25].x, _923);
    float _933 = _773 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _935 = _773 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _937 = fma(_761, (*spvDescriptorSet0.vp_c8)._m0[25].x, _925);
    bool _939 = _895 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _941 = fma(_761, (*spvDescriptorSet0.vp_c8)._m0[24].x, _933);
    float _943 = fma(_761, (*spvDescriptorSet0.vp_c8)._m0[26].x, _935);
    float _945 = fma(_833, (*spvDescriptorSet0.vp_c8)._m0[25].z, _931);
    float _947 = fma(_757, (*spvDescriptorSet0.vp_c8)._m0[25].x, _927);
    float _949 = fma(_805, (*spvDescriptorSet0.vp_c8)._m0[24].z, _941);
    float _951 = fma(_805, (*spvDescriptorSet0.vp_c8)._m0[25].z, _937);
    float _953 = fma(_805, (*spvDescriptorSet0.vp_c8)._m0[26].z, _943);
    float _955 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _957 = _945 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _959 = -_675;
    int _961 = _389 ? as_type<int>(_959) : as_type<int>(_675);
    bool _963 = _331 > 0.5;
    float _965 = _891 + _957;
    float _967 = _757;
    float _969 = _905;
    float _971 = _937;
    float _973 = _877;
    float _975 = _879;
    float _977 = _919;
    if (!_939)
    {
        _967 = _857;
    }
    float _979 = _967;
    float _981 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _983 = _979;
    if (!_939)
    {
        _969 = _859;
    }
    float _985 = _969;
    float _987 = _985;
    if (!_939)
    {
        _971 = _965;
    }
    float _989 = _971;
    bool _991 = !_939;
    float _993 = _989;
    if (!_991)
    {
        float _995 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _997 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _999 = _895 + _997;
        float _1001 = _965 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1003 = rsqrt(_889);
        float _1005 = _999 * _995;
        float _1007 = _1005 * 0.15915493667125701904296875;
        float _1009 = _1007 * 6.283185482025146484375;
        float _1011 = sin(_1009);
        float _1013 = _1007 * 6.283185482025146484375;
        float _1015 = cos(_1013);
        float _1017 = fma(_1011, _1001, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1019 = _1003 * _1017;
        float _1021 = _1015 + (-1.0);
        float _1023 = fma(_867, _1019, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1025 = fma(_871, _1019, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1027 = _1021 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1029 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1031 = _1023 + _1029;
        float _1033 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1035 = _1025 + _1033;
        float _1037 = fma(_965, _1015, _1027);
        float _1039 = _1031 * _1031;
        float _1041 = _1035 * _1035;
        _993 = _1037;
        _973 = _1039;
        _975 = _1041;
        _983 = _1023;
        _987 = _1025;
    }
    float _1043 = _993;
    float _1045 = _973;
    float _1047 = _975;
    float _1049 = _983;
    float _1051 = _987;
    float _1053 = _675 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1055 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1057 = _1043 + _1055;
    float _1059 = -_633;
    int _1061 = _565 ? as_type<int>(_1059) : as_type<int>(_633);
    float _1063 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1065 = fma(_1053, _1053, 1.0);
    float _1067 = fma(_1057, _1057, _1045);
    int _1069 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1071 = _1069 != 0;
    float _1073 = fma(_769, (*spvDescriptorSet0.vp_c8)._m0[24].z, _929);
    float _1075 = -_633;
    int _1077 = _963 ? as_type<int>(_1075) : as_type<int>(_633);
    float _1079 = _1053 * _915;
    float _1081 = -_675;
    int _1083 = _627 ? as_type<int>(_1081) : as_type<int>(_675);
    float _1085 = rsqrt(_1065);
    bool _1087 = !_1071;
    float _1089 = _1087 ? _633 : as_type<float>(_1061);
    float _1091 = fma(_769, (*spvDescriptorSet0.vp_c8)._m0[26].z, _917);
    bool _1093 = !_713;
    float _1095 = _1093 ? _633 : as_type<float>(_1077);
    float _1097 = _633 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _1099 = !_705;
    float _1101 = _1099 ? _675 : as_type<float>(_1083);
    float _1103 = _1053 * _911;
    bool _1105 = !_717;
    float _1107 = _1105 ? _675 : as_type<float>(_961);
    float _1109 = fma(_769, (*spvDescriptorSet0.vp_c8)._m0[25].z, _947);
    float _1111 = _1053 * _919;
    float _1113 = _1089 + 0.5;
    float _1115 = _1095 + 0.5;
    float _1117 = _1067 + _1047;
    float _1119 = -_1101;
    float _1121 = _1119 + 0.5;
    float _1123 = -_1107;
    float _1125 = _1123 + 0.5;
    float _1127 = fma(_1097, _1073, _1079);
    float _1129 = _1053 * _1085;
    float _1131 = fma(_1097, _1109, _1103);
    float _1133 = fma(_1097, _1091, _1111);
    float _1135 = _1113 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1137 = _1115 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1139 = _1121 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1141 = _1125 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1143 = -_949;
    float _1145 = _1129 * _1143;
    float _1147 = _1135 * _913;
    float _1149 = _1137 * _981;
    float _1151 = _1139 * _955;
    float _1153 = _1141 * _1063;
    float _1155 = fma(_1085, _915, _1145);
    float _1157 = -_951;
    float _1159 = _1129 * _1157;
    float _1161 = -_953;
    float _1163 = _1129 * _1161;
    float _1165 = fma(_1085, _911, _1159);
    float _1167 = sqrt(_1117);
    float _1169 = fma(_1085, _919, _1163);
    float _1171 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1173 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1175 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1177 = _903 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1179 = _1171 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1181 = _1173 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1183 = _1175 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1185 = _949 + _1127;
    float _1187 = _951 + _1131;
    float _1189 = _953 + _1133;
    out.m_72.x = _1147;
    out.m_72.y = _1151;
    out.m_72.z = _1149;
    out.m_72.w = _1153;
    out.m_74.x = _1179;
    out.m_74.y = _1181;
    out.m_74.z = _1183;
    out.m_74.w = _1177;
    bool _1191 = _1167 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1193 = isnan(_1167);
    bool _1195 = _1191 || _1193;
    bool _1197 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1199 = _1195 || _1197;
    out.m_76.x = _1073;
    out.m_76.y = _1109;
    out.m_76.z = _1091;
    out.m_78.x = _1155;
    out.m_78.y = _1165;
    out.m_78.z = _1169;
    out.m_80.x = _1185;
    out.m_80.y = _1187;
    out.m_80.z = _1189;
    if (!_1199)
    {
        _977 = 1.0;
    }
    float _1201 = _977;
    bool _1203 = !_1199;
    float _1205 = _1201;
    if (!_1203)
    {
        bool _1207 = _1167 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1209 = isnan(_1167);
        bool _1211 = _1207 || _1209;
        bool _1213 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1215 = _1211 || _1213;
        if (!_1215)
        {
            float _1217 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1219 = _1167 + _1217;
            float _1221 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1223 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1221;
            float _1225 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1227 = _1225 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1229 = 1.0 / _1223;
            float _1231 = _1219 * _1229;
            float _1233 = fma(_1231, _1227, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1205 = _1233;
            _1235 = true;
        }
        else
        {
            bool _1237 = _1167 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1239 = isnan(_1167);
            bool _1241 = _1237 || _1239;
            bool _1243 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1245 = _1241 || _1243;
            if (!_1245)
            {
                float _1247 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1249 = _1167 + _1247;
                float _1251 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1253 = _1251 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1255 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1257 = _1255 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1259 = 1.0 / _1253;
                float _1261 = _1249 * _1259;
                float _1263 = fma(_1261, _1257, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1205 = _1263;
                _1235 = true;
            }
            else
            {
                _1205 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1235 = false;
    float _1265 = _1205;
    float _1267 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1269 = _1049 + _1267;
    float _1271 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1273 = _1051 + _1271;
    float _1275 = fma(_1269, _1265, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1277 = fma(_1273, _1265, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1279 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1281 = _1275 + _1279;
    float _1283 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1285 = _1277 + _1283;
    float _1287 = fma(_1281, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1289 = fma(_1285, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _4467 = float2(_1287, _1289);
    float _1291 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_4467, float2(0.0), isnan(_4467)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_4467, float2(0.0), isnan(_4467)), level(0.0)).x;
    float _1293 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1295 = _1043 + _1293;
    float _1297 = -_697;
    float _1299 = _1297 + _1275;
    float _1301 = -_699;
    float _1303 = _1301 + _1277;
    float _1305 = fma(_1295, _1265, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1307 = -_891;
    float _1309 = _1307 + _1305;
    float _1311 = fma(_1291, 100.0, _891);
    float _1313 = fma(_1291, 100.0, _1305);
    float _1315 = _1311 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1317 = _1311 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1319 = fma(_697, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1315);
    float _1321 = fma(_697, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1317);
    float _1323 = fma(_699, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1319);
    float _1325 = _1309 * _1309;
    float _1327 = fma(_699, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1321);
    float _1329 = _1323 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1331 = fma(_1299, _1299, _1325);
    float _1333 = _1327 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1335 = 1.0 / _1329;
    float _1337 = fma(_1303, _1303, _1331);
    float _1339 = _1333 + _1329;
    float _1341 = sqrt(_1337);
    bool _1343 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1345 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1347 = _1343 || _1345;
    bool _1349 = isnan(0.5);
    bool _1351 = _1347 || _1349;
    float _1353 = _1339 * _1335;
    float _1355 = _1353 * 0.5;
    float _1357 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1359 = fma(_1355, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1357);
    bool _1361 = _1341 > 0.0;
    float _1363 = 1.0 / _1359;
    bool _1365 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1367 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1369 = _1365 || _1367;
    bool _1371 = isnan(0.5);
    bool _1373 = _1369 || _1371;
    float _1375 = _1291;
    float _1377 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1379 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1381 = _1273;
    float _1383 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1385 = _1355;
    float _1387 = _1277;
    float _1389 = _1275;
    float _1391 = _1337;
    if (!_1361)
    {
        _1375 = _1275;
    }
    float _1393 = _1375;
    float _1395 = _1393;
    if (!_1361)
    {
        _1377 = _1277;
    }
    float _1397 = _1377;
    float _1399 = _1397;
    if (!_1361)
    {
        _1379 = _1313;
    }
    float _1401 = _1379;
    bool _1403 = !_1361;
    float _1405 = _1401;
    float _1407 = _1401;
    if (!_1403)
    {
        float _1409 = _189 * _189;
        float _1411 = fma(_187, _187, _1409);
        float _1413 = fma(_191, _191, _1411);
        float _1415 = rsqrt(_1337);
        float _1417 = sqrt(_1413);
        float _1419 = _1299 * _1415;
        float _1421 = _1309 * _1415;
        float _1423 = _1303 * _1415;
        bool _1425 = _1417 > 0.0;
        float _1427 = _1417;
        float _1429 = _1415;
        _1381 = _1423;
        _1383 = _1413;
        if (!_1425)
        {
            _1427 = _1275;
        }
        float _1431 = _1427;
        _1395 = _1431;
        if (!_1425)
        {
            _1405 = _1313;
        }
        float _1433 = _1405;
        _1407 = _1433;
        if (!_1425)
        {
            _1429 = _1277;
        }
        float _1435 = _1429;
        bool _1437 = !_1425;
        _1399 = _1435;
        if (!_1437)
        {
            float _1439 = rsqrt(_1413);
            float _1441 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1443 = _189 * _1439;
            float _1445 = _187 * _1439;
            float _1447 = _191 * _1439;
            float _1449 = _1421 * _1443;
            float _1451 = fma(_1419, _1445, _1449);
            float _1453 = _1441 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1455 = fma(_1423, _1447, _1451);
            float _1457 = _1455 * _1453;
            float _1459 = fma(_187, _1457, _1275);
            float _1461 = fma(_189, _1457, _1313);
            float _1463 = fma(_191, _1457, _1277);
            _1395 = _1459;
            _1407 = _1461;
            _1399 = _1463;
            _1385 = _1441;
        }
    }
    float _1465 = _1395;
    float _1467 = _1407;
    float _1469 = _1399;
    float _1471 = _1381;
    float _1473 = _1383;
    float _1475 = _1385;
    float _1477 = _1473;
    float _1479 = _1469;
    float _1481 = _1475;
    float _1483 = _1471;
    if (_1351)
    {
        _1477 = 1.0;
    }
    float _1485 = _1477;
    float _1487 = _1485;
    if (_1373)
    {
        _1387 = _1465;
    }
    float _1489 = _1387;
    float _1491 = _1489;
    if (_1373)
    {
        _1389 = _1467;
    }
    float _1493 = _1389;
    float _1495 = _1493;
    if (!_1373)
    {
        float _1497 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1499 = _1311 + _1497;
        float _1501 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1503 = _697 + _1501;
        float _1505 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1507 = -_699;
        float _1509 = _1507 + _1469;
        float _1511 = _1499 * _1499;
        float _1513 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1515 = _699 + _1513;
        float _1517 = fma(_1503, _1503, _1511);
        float _1519 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1521 = fma(_1515, _1515, _1517);
        float _1523 = sqrt(_1521);
        float _1525 = _1505 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1527 = precise::min(_1523, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1529 = _1527 * _1519;
        float _1531 = -_1311;
        float _1533 = _1531 + _1467;
        float _1535 = _1525 * _1529;
        float _1537 = -_697;
        float _1539 = _1537 + _1465;
        float _1541 = fma(_1533, _1535, _1311);
        float _1543 = fma(_1539, _1535, _697);
        float _1545 = fma(_1509, _1535, _699);
        _1391 = _1519;
        _1495 = _1541;
        _1491 = _1543;
        _1479 = _1545;
        _1481 = _1523;
    }
    float _1547 = _1391;
    float _1549 = _1495;
    float _1551 = _1491;
    float _1553 = _1479;
    float _1555 = _1481;
    float _1557 = _1555;
    float _1559 = _1547;
    if (_1351)
    {
        _1557 = 1.0;
    }
    float _1561 = _1557;
    float _1563 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1565 = _1363 * _1563;
    float _1567 = _1561;
    if (!_1351)
    {
        float _1569 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1571 = _1569 * 0.15915493667125701904296875;
        float _1573 = _1571 * 6.283185482025146484375;
        float _1575 = cos(_1573);
        float _1577 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1579 = _1577 * 0.15915493667125701904296875;
        float _1581 = _1571 * 6.283185482025146484375;
        float _1583 = sin(_1581);
        float _1585 = 1.0 / _1575;
        float _1587 = _1579 * 6.283185482025146484375;
        float _1589 = cos(_1587);
        float _1591 = _1583 * _1585;
        float _1593 = _1579 * 6.283185482025146484375;
        float _1595 = sin(_1593);
        float _1597 = _1589 * _1591;
        float _1599 = 1.0 / _1597;
        float _1601 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1603 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1601;
        float _1605 = 1.0 / _1603;
        float _1607 = _1595 * _1599;
        float _1609 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1611 = fma(_1565, _1607, _1609);
        float _1613 = _1611 * _1605;
        float _1615 = precise::clamp(_1613, 0.0, 1.0);
        _195 = _1571;
        _1487 = _1615;
    }
    float _1617 = _195;
    float _1619 = _1487;
    float _1621 = _1617;
    if (!_1351)
    {
        float _1623 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1625 = _1623 * 0.15915493667125701904296875;
        float _1627 = _1625 * 6.283185482025146484375;
        float _1629 = cos(_1627);
        float _1631 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1633 = _1631 * 0.15915493667125701904296875;
        float _1635 = _1625 * 6.283185482025146484375;
        float _1637 = sin(_1635);
        float _1639 = 1.0 / _1629;
        float _1641 = _1633 * 6.283185482025146484375;
        float _1643 = cos(_1641);
        float _1645 = _1637 * _1639;
        float _1647 = _1633 * 6.283185482025146484375;
        float _1649 = sin(_1647);
        float _1651 = _1643 * _1645;
        float _1653 = 1.0 / _1651;
        float _1655 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1657 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1655;
        float _1659 = 1.0 / _1657;
        float _1661 = _1649 * _1653;
        float _1663 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1665 = fma(_1565, _1661, _1663);
        float _1667 = _1665 * _1659;
        float _1669 = precise::clamp(_1667, 0.0, 1.0);
        float _1671 = -_1669;
        float _1673 = _1671 + 1.0;
        _1559 = _1653;
        _1567 = _1673;
    }
    float _1675 = _1559;
    float _1677 = _1567;
    float _1679 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1681 = _1549 + _1679;
    float _1683 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1685 = _1551 + _1683;
    float _1687 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1689 = _1553 + _1687;
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
    float _1719 = _1675;
    float _1721 = _1697;
    float _1723 = _1717;
    float _1725 = _1681;
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
    float _1735 = _1729;
    if (_1713)
    {
        float _1737 = _1717 * _1729;
        _1723 = _1737;
    }
    float _1739 = _1723;
    if (_1713)
    {
        float _1741 = _1739 * 0.15915493667125701904296875;
        _1621 = _1741;
    }
    float _1743 = _1621;
    float _1745 = _1689;
    float _1747 = _1743;
    if (_1713)
    {
        float _1749 = _1743 * 6.283185482025146484375;
        float _1751 = sin(_1749);
        _1745 = _1751;
    }
    float _1753 = _1745;
    float _1755 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1757 = precise::max(0.0, _1755);
    float _1759 = _1309;
    if (_1713)
    {
        float _1761 = _1743 * 6.283185482025146484375;
        float _1763 = cos(_1761);
        _1759 = _1763;
    }
    float _1765 = _1759;
    float _1767 = -_1699;
    float _1769 = -_1757;
    float _1771 = fma(_1681, _1767, _1769);
    float _1773 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_1713)
    {
        float _1775 = _1771 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1725 = _1775;
    }
    float _1777 = _1725;
    float _1779 = _1777;
    if (!_1713)
    {
        _1747 = _1771;
    }
    float _1781 = _1747;
    float _1783 = fma(_697, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1785 = _1753;
    float _1787 = _1781;
    if (_1713)
    {
        float _1789 = fma(_1753, _1777, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1735 = _1789;
    }
    float _1791 = _1735;
    float _1793 = _1791;
    if (!_1713)
    {
        _1785 = _1703;
    }
    float _1795 = _1785;
    float _1797 = _1795;
    float _1799 = _1765;
    if (_1713)
    {
        float _1801 = _1765 + (-1.0);
        _1779 = _1801;
    }
    float _1803 = _1779;
    float _1805 = _1803;
    if (_1713)
    {
        float _1807 = _1733 * _1791;
        _1483 = _1807;
    }
    float _1809 = _1483;
    if (!_1713)
    {
        _1793 = _1701;
    }
    float _1811 = _1793;
    float _1813 = sqrt(_1695);
    float _1815 = _1811;
    if (_1713)
    {
        float _1817 = _1803 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1773 = _1817;
    }
    float _1819 = _1773;
    if (_1713)
    {
        float _1821 = _1701 * _1809;
        _1815 = _1821;
    }
    float _1823 = _1815;
    if (!_1713)
    {
        _1805 = _1705;
    }
    float _1825 = _1805;
    float _1827 = _1825;
    if (_1713)
    {
        float _1829 = _1703 * _1809;
        _1797 = _1829;
    }
    float _1831 = _1797;
    if (_1713)
    {
        float _1833 = fma(_1771, _1765, _1819);
        _1787 = _1833;
    }
    float _1835 = _1787;
    if (_1713)
    {
        float _1837 = _1823 * _1823;
        _1827 = _1837;
    }
    float _1839 = _1827;
    float _1841 = _1549 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_1713)
    {
        _1799 = _1707;
    }
    float _1843 = _1799;
    float _1845 = _1843;
    if (_1713)
    {
        float _1847 = _1831 * _1831;
        _1845 = _1847;
    }
    float _1849 = _1845;
    float _1851 = fma(_1835, _1835, _1839);
    float _1853 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1841);
    float _1855 = floor(_1783);
    float _1857 = _1851 + _1849;
    float _1859 = fma(_1553, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1853);
    float _1861 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1863 = fma(_1813, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1861);
    float _1865 = precise::clamp(_1863, 0.0, 1.0);
    float _1867 = _1859 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1869 = _1549 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1871 = rsqrt(_1857);
    float _1873 = -_1865;
    float _1875 = _1873 + 1.0;
    float _1877 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1879 = _1867 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1881 = fma(_699, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1883 = _1549 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1885 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1869);
    float _1887 = -_1879;
    float _1889 = fma(_1887, _1877, 1.0);
    float _1891 = _1549 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1893 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1883);
    float _1895 = abs(_1875);
    float _1897 = log2(_1895);
    float _1899 = fma(_1553, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1885);
    float _1901 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1891);
    float _1903 = fma(_1553, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1893);
    float _1905 = -_1855;
    float _1907 = _1783 + _1905;
    float _1909 = _1871 * _1823;
    float _1911 = fma(_1553, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1901);
    float _1913 = _1871 * _1835;
    float _1915 = _1871 * _1831;
    float _1917 = _1909 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1919 = _1911 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1921 = _1903 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1923 = floor(_1881);
    float _1925 = -_1917;
    float _1927 = fma(_1913, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1925);
    float _1929 = _1919 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1931 = _1897 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1933 = _1919 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1935 = -_1915;
    float _1937 = fma(_1935, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1927);
    float _1939 = fma(_1921, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1929);
    float _1941 = log2(_1889);
    float _1943 = fma(_1937, -0.5, 0.5);
    float _1945 = fma(_1867, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1939);
    float _1947 = fma(_1921, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1933);
    float _1949 = exp2(_1931);
    float _1951 = _1899 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1953 = -_1923;
    float _1955 = _1881 + _1953;
    float _1957 = fma(_1951, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1945);
    float _1959 = _1919 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1961 = sqrt(_1943);
    float _1963 = fma(_1937, 0.5, 0.5);
    float _1965 = fma(_1921, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1959);
    float _1967 = _1913 + 1.0;
    float _1969 = _1941 * 0.693147182464599609375;
    float _1971 = fma(_1963, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1973 = fma(_1867, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1965);
    float _1975 = 1.0 / _1957;
    float _1977 = fma(_1867, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1947);
    float _1979 = fma(_1963, _1971, -0.212114393711090087890625);
    float _1981 = fma(_1951, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1973);
    float2 _5543 = float2(_1907, _1955);
    float _1983 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5543, float2(0.0), isnan(_5543)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5543, float2(0.0), isnan(_5543)), level(0.0)).x;
    float _1985 = fma(_1951, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1977);
    float _1987 = fma(_1963, _1979, 1.570728778839111328125);
    float _1989 = -_1913;
    float _1991 = fma(_1949, _1967, _1989);
    float _1993 = _1961 * 0.636619746685028076171875;
    float _1995 = -_1987;
    float _1997 = fma(_1993, _1995, 1.0);
    float _1999 = fma(_1991, 0.5, 0.5);
    float _2001 = _1985 * _1975;
    float _2003 = _1981 * _1975;
    float _2005 = _1969 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2007 = fma(_2001, 0.5, 0.5);
    float _2009 = fma(_2003, -0.5, 0.5);
    float3 _5591 = float3(_2007, _2009, _2005);
    float _2011 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5591, float3(0.0), isnan(_5591)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5591, float3(0.0), isnan(_5591)), level(0.0)).x;
    float3 _5602 = float3(_2007, _2009, _2005);
    float4 _2014 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5602, float3(0.0), isnan(_5602)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5602, float3(0.0), isnan(_5602)), level(0.0)).xyzw;
    float _2016 = _2014.x;
    float _2018 = _2014.y;
    float _2020 = _2014.z;
    float _2022 = _2014.w;
    float2 _5618 = float2(_1997, _1999);
    float3 _2026 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5618, float2(0.0), isnan(_5618)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5618, float2(0.0), isnan(_5618)), level(0.0)).xyz;
    float _2028 = _2026.x;
    float _2030 = _2026.y;
    float _2032 = _2026.z;
    float _2034 = abs(_1565);
    float _2036 = log2(_2034);
    float _2038 = _1919 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_82.x = _1551;
    out.m_82.y = _1549;
    out.m_82.z = _1553;
    bool _2040 = _1813 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2042 = isnan(_1813);
    bool _2044 = _2040 || _2042;
    bool _2046 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2048 = _2044 || _2046;
    float _2050 = fma(_1921, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2038);
    float _2052 = fma(_1867, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2050);
    float _2054 = in.m_64.x;
    float _2056 = fma(_1951, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2052);
    float _2058 = _2036 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2060 = exp2(_2058);
    float _2062 = fma(_2060, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2064 = precise::clamp(_2062, 0.0, 1.0);
    float _2066 = fma(_2064, -2.0, 3.0);
    float _2068 = _2064 * _2064;
    float _2070 = _2068 * _2066;
    float _2072 = _1897 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2074 = _1565 <= 8000.0;
    bool _2076 = isnan(_1565);
    bool _2078 = _2074 || _2076;
    bool _2080 = isnan(8000.0);
    bool _2082 = _2078 || _2080;
    float _2084 = float(_2082);
    float _2086 = -_2070;
    float _2088 = _2086 + 1.0;
    float _2090 = exp2(_2072);
    float _2092 = fma(_2088, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2070);
    float _2094 = _2056 + _1957;
    out.gl_Position.x = _1985;
    out.gl_Position.y = _1981;
    out.gl_Position.z = _2056;
    out.gl_Position.w = _1957;
    float _2096 = _2084 * _2092;
    float _2098 = _2094 * 0.5;
    float _2100 = _2096 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_84.z = _2098;
    out.m_84.w = _1957;
    float _2102 = -_2090;
    float _2104 = _2102 + 1.0;
    float _2106 = _1957;
    float _2108 = _2056;
    float _2110 = _1981;
    float _2112 = _1985;
    if (!_2048)
    {
        _2106 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2114 = _2106;
    float _2116 = _2114;
    float _2118 = _2114;
    if (!_2048)
    {
        _2108 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2120 = _2108;
    float _2122 = _2104 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2124 = _2120;
    float _2126 = _2120;
    if (!_2048)
    {
        _2110 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2128 = _2110;
    float _2130 = _2128;
    float _2132 = _2128;
    if (!_2048)
    {
        _2112 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2134 = _2112;
    float _2136 = -_1983;
    float _2138 = _2136 + 1.0;
    float _2140 = _2138 * _2100;
    float _2142 = precise::clamp(_2140, 0.0, 1.0);
    float _2144 = -_2142;
    float _2146 = fma(_2144, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2148 = _1619 * _1677;
    float _2150 = _2146 * _2054;
    float _2152 = _2150 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2154 = _2122 * _2011;
    float _2156 = -_2122;
    float _2158 = _2156 + 1.0;
    out.m_86.x = _2152;
    float _2160 = _2022 * _2154;
    float _2162 = _2032 * _2154;
    float _2164 = _2022 * _2158;
    float _2166 = fma(_2028, _2160, _2016);
    float _2168 = fma(_2030, _2160, _2018);
    float _2170 = fma(_2022, _2162, _2020);
    float _2172 = _2148 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2174 = _2016;
    float _2176 = _2148;
    float _2178 = _2134;
    float _2180 = _2134;
    if (!_2048)
    {
        _2174 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2182 = _2174;
    float _2184 = _2182;
    float _2186 = _2182;
    if (!_2048)
    {
        _2176 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2188 = _2176;
    out.m_88.x = _2166;
    out.m_88.y = _2168;
    out.m_88.z = _2170;
    out.m_88.w = _2164;
    bool _2190 = !_2048;
    float _2192 = _2188;
    float _2194 = _2188;
    if (!_2190)
    {
        bool _2196 = _1813 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2198 = isnan(_1813);
        bool _2200 = _2196 || _2198;
        bool _2202 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2204 = _2200 || _2202;
        if (!_2204)
        {
            float _2206 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2208 = _1813 + _2206;
            float _2210 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2212 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2210;
            float _2214 = 1.0 / _2212;
            float _2216 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2218 = _2216 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2220 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2222 = _2220 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2224 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2226 = _2224 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2228 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2230 = _2228 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2232 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2234 = _2232 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2236 = _2208 * _2214;
            float _2238 = precise::clamp(_2236, 0.0, 1.0);
            float _2240 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2242 = _2240 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2244 = fma(_2238, _2218, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2246 = fma(_2238, _2242, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2248 = fma(_2238, _2222, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2250 = fma(_2238, _2226, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2252 = fma(_2238, _2230, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2254 = fma(_2238, _2234, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2118 = _2246;
            _2180 = _2252;
            _2186 = _2244;
            _2132 = _2250;
            _2126 = _2248;
            _2194 = _2254;
            _2256 = true;
        }
        else
        {
            bool _2258 = _1813 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2260 = isnan(_1813);
            bool _2262 = _2258 || _2260;
            bool _2264 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2266 = _2262 || _2264;
            if (!_2266)
            {
                _2184 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2268 = _2184;
            _2186 = _2268;
            if (!_2266)
            {
                _2116 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2270 = _2116;
            _2118 = _2270;
            if (!_2266)
            {
                _2124 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2272 = _2124;
            _2126 = _2272;
            if (!_2266)
            {
                _2130 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2274 = _2130;
            _2132 = _2274;
            if (!_2266)
            {
                _2178 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2276 = _2178;
            _2180 = _2276;
            if (!_2266)
            {
                _2192 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2278 = _2192;
            bool _2280 = !_2266;
            _2194 = _2278;
            if (!_2280)
            {
                bool _2282 = _1813 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2284 = isnan(_1813);
                bool _2286 = _2282 || _2284;
                bool _2288 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2290 = _2286 || _2288;
                if (!_2290)
                {
                    float _2292 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2294 = _1813 + _2292;
                    float _2296 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2298 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2296;
                    float _2300 = 1.0 / _2298;
                    float _2302 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2304 = _2302 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2306 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2308 = _2306 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2310 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2312 = _2310 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2314 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2316 = _2314 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2318 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2320 = _2318 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2322 = _2294 * _2300;
                    float _2324 = precise::clamp(_2322, 0.0, 1.0);
                    float _2326 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2328 = _2326 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2330 = fma(_2324, _2304, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2332 = fma(_2324, _2328, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2334 = fma(_2324, _2308, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2336 = fma(_2324, _2312, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2338 = fma(_2324, _2316, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2340 = fma(_2324, _2320, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2118 = _2332;
                    _2180 = _2338;
                    _2186 = _2330;
                    _2132 = _2336;
                    _2126 = _2334;
                    _2194 = _2340;
                    _2256 = true;
                }
                else
                {
                    _2118 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2180 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2186 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2132 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2126 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2194 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2256 = false;
    float _2342 = _2118;
    float _2344 = _2180;
    float _2346 = _2186;
    float _2348 = _2132;
    float _2350 = _2126;
    float _2352 = _2194;
    float _2354 = fma(_1187, -0.5, 0.5);
    float _2356 = precise::clamp(_2354, 0.0, 1.0);
    float _2358 = -_2342;
    float _2360 = _2358 + _2344;
    float _2362 = _2172 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2364 = -_2346;
    float _2366 = _2364 + _2348;
    out.m_90.x = 0.0;
    float _2368 = fma(_2356, _2360, _2342);
    float _2370 = fma(_2356, _2366, _2346);
    out.m_53.x = _2362;
    float _2372 = -_2350;
    float _2374 = _2372 + _2352;
    float _2376 = _2368 * 0.586610972881317138671875;
    bool _2378 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2380 = fma(_2356, _2374, _2350);
    float _2382 = fma(_2370, 0.298911988735198974609375, _2376);
    bool _2384 = _1619 > 0.0;
    bool _2386 = isnan(_1619);
    bool _2388 = _2384 || _2386;
    bool _2390 = isnan(0.0);
    bool _2392 = _2388 || _2390;
    float _2394 = fma(_2380, 0.114477999508380889892578125, _2382);
    bool _2396 = _1677 <= 0.0;
    bool _2398 = !_2392;
    bool _2400 = _2396 || _2398;
    float _2402 = -_2394;
    float _2404 = _2370 + _2402;
    float _2406 = -_2394;
    float _2408 = _2368 + _2406;
    float _2410 = -_2394;
    float _2412 = _2380 + _2410;
    float _2414 = fma(_2404, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2394);
    float _2416 = fma(_2408, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2394);
    float _2418 = fma(_2412, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2394);
    bool _2420 = !_2378;
    if (!_2420)
    {
        float _2422 = -_1549;
        float _2424 = _2422 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2426 = -_1551;
        float _2428 = _2426 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2430 = -_1553;
        float _2432 = _2430 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2434 = _2424 * _2424;
        float _2436 = fma(_2428, _2428, _2434);
        float _2438 = fma(_2432, _2432, _2436);
        float _2440 = sqrt(_2438);
        float _2442 = rsqrt(_2438);
        float _2444 = -_2440;
        float _2446 = _2444 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2448 = _2446 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2450 = precise::clamp(_2448, 0.0, 1.0);
        float _2452 = _2428 * _2442;
        float _2454 = _2424 * _2442;
        float _2456 = abs(_2450);
        float _2458 = log2(_2456);
        float _2460 = _2432 * _2442;
        float _2462 = _2452 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2464 = _1187 * _2454;
        float _2466 = -_2454;
        float _2468 = -_2462;
        float _2470 = fma(_2466, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2468);
        float _2472 = fma(_1185, _2452, _2464);
        float _2474 = -_2460;
        float _2476 = fma(_2474, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2470);
        float _2478 = fma(_1189, _2460, _2472);
        float _2480 = precise::clamp(_2478, 0.0, 1.0);
        float _2482 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2484 = _2476 + _2482;
        float _2486 = _2458 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2488 = _2484 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2490 = precise::clamp(_2488, 0.0, 1.0);
        float _2492 = exp2(_2486);
        float _2494 = _2492 * _2490;
        float _2496 = _2480 * _2494;
        float _2498 = _2496 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2500 = _2496 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2502 = _2496 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_90.x = _2498;
        out.m_90.y = _2500;
        out.m_90.z = _2502;
    }
    out.m_92.x = _2414;
    out.m_92.y = _2416;
    out.m_92.z = _2418;
    if (!_2400)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_53.x = 0.0;
    float _2504 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2504;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2256 = false;
    bool _1235 = false;
    bool _317 = false;
    bool _215 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _106 = in.m_50.w;
    float _108 = trunc(_106);
    int _111 = int(_108);
    bool _115 = _111 >= 1;
    float _117 = 0.0;
    if (!_115)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _119 = _117;
    float _121 = _119;
    if (!_115)
    {
        out.m_53.x = 0.0;
    }
    int _123 = 0;
    if (!_115)
    {
        float _125 = _119 * 5.0;
        _123 = as_type<int>(_125);
    }
    int _127 = _123;
    if (!_115)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2560 = as_type<float>(_127);
        out.gl_Position.z = _2560;
    }
    if (!_115)
    {
        return out;
    }
    float _129 = in.m_55.w;
    bool _131 = _129 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = isnan(_129);
    bool _135 = _131 || _133;
    bool _137 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _139 = _135 || _137;
    float _141 = -_129;
    float _143 = _141 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _145 = 0.0;
    float _147 = _143;
    if (_139)
    {
        float _149 = float(_111);
        _145 = _149;
    }
    float _151 = _145;
    bool _153 = _143 >= _151;
    bool _155 = !_139;
    bool _157 = _153 || _155;
    if (_157)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _159 = _121;
    if (_157)
    {
        out.m_53.x = 0.0;
    }
    int _161 = 0;
    if (_157)
    {
        float _163 = _159 * 5.0;
        _161 = as_type<int>(_163);
    }
    int _165 = _161;
    if (_157)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2629 = as_type<float>(_165);
        out.gl_Position.z = _2629;
    }
    if (_157)
    {
        return out;
    }
    float _167 = in.m_57.x;
    float _169 = in.m_57.y;
    float _171 = in.m_57.z;
    bool _173 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _175 = _169 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _177 = _169 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _179 = _169 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _181 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[4].x, _175);
    float _183 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[5].x, _177);
    float _185 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[6].x, _179);
    float _187 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[4].z, _181);
    float _189 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[5].z, _183);
    float _191 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[6].z, _185);
    bool _193 = !_173;
    float _195 = _191;
    float _213;
    if (!_193)
    {
        float _197 = in.m_59.x;
        float _199 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _201 = _197 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _203 = fma(_201, (*spvDescriptorSet0.vp_c9)._m0[12].x, _143);
        float _205 = _203 * _199;
        float _207 = floor(_205);
        float _209 = -_207;
        float _211 = _205 + _209;
        _213 = _211;
        _215 = true;
    }
    else
    {
        float _217 = float(_111);
        float _219 = 1.0 / _217;
        float _221 = _143 * _219;
        _213 = _221;
    }
    _215 = false;
    float _223 = _213;
    float _225 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _227 = _223 + _225;
    bool _229 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _231 = isnan(_223);
    bool _233 = _229 || _231;
    bool _235 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _237 = _233 || _235;
    float _239 = float(_237);
    float _241 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _243 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _241;
    float _245 = -_239;
    float _247 = _245 + 1.0;
    bool _249 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _251 = isnan(_223);
    bool _253 = _249 || _251;
    bool _255 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _257 = _253 || _255;
    float _259 = float(_257);
    float _261 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _263 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _261;
    bool _265 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _267 = 1.0 / _243;
    float _269 = _259 * _247;
    float _271 = -_259;
    float _273 = _271 + 1.0;
    float _275 = _227 * _267;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _279 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _277;
    float _281 = fma(_263, _275, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _283 = fma(_279, _275, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _285 = _281 * _269;
    float _287 = _283 * _269;
    float _289 = fma(_273, (*spvDescriptorSet0.vp_c9)._m0[143].x, _285);
    float _291 = fma(_273, (*spvDescriptorSet0.vp_c9)._m0[143].y, _287);
    float _293 = fma(_239, (*spvDescriptorSet0.vp_c9)._m0[144].x, _289);
    float _295 = fma(_239, (*spvDescriptorSet0.vp_c9)._m0[144].y, _291);
    bool _297 = !_265;
    float _315;
    if (!_297)
    {
        float _299 = in.m_59.x;
        float _301 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _303 = _299 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _305 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[11].y, _143);
        float _307 = _305 * _301;
        float _309 = floor(_307);
        float _311 = -_309;
        float _313 = _307 + _311;
        _315 = _313;
        _317 = true;
    }
    else
    {
        float _319 = float(_111);
        float _321 = 1.0 / _319;
        float _323 = _143 * _321;
        _315 = _323;
    }
    _317 = false;
    float _325 = _315;
    float _327 = in.m_59.x;
    float _329 = in.m_59.y;
    float _331 = in.m_59.z;
    float _333 = in.m_59.w;
    float _335 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _337 = log2(_335);
    float _339 = as_type<float>(int(gl_VertexIndex));
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _343 = 1.0 + _341;
    float _345 = in.m_64.y;
    float _347 = 1.0 / _343;
    float _349 = _337 * _143;
    float _351 = exp2(_349);
    float _353 = _331 * 2.0;
    float _355 = _327 * 2.0;
    float _357 = _329 * 2.0;
    int _359 = as_type<int>(_339) & 1;
    bool _361 = _359 != 0;
    int _363 = as_type<int>(_339) & 2;
    bool _365 = _363 != 0;
    bool _367 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _369 = isnan(1.0);
    bool _371 = _367 || _369;
    bool _373 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _375 = _371 || _373;
    float _377 = floor(_353);
    bool _379 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _381 = isnan(0.0);
    bool _383 = _379 || _381;
    bool _385 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _387 = _383 || _385;
    bool _389 = _333 > 0.5;
    float _391 = _329 + _331;
    float _393 = floor(_355);
    float _395 = -_351;
    float _397 = _395 + 1.0;
    float _399 = _391 + (-1.0);
    float _401 = _387 ? _397 : 0.0;
    float _403 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _405 = _377 > 0.0;
    float _407 = floor(_357);
    bool _409 = _377 >= 0.0;
    bool _411 = isnan(_377);
    bool _413 = _409 || _411;
    bool _415 = isnan(0.0);
    bool _417 = _413 || _415;
    if (_375)
    {
        float _419 = _401 * _347;
        _147 = _419;
    }
    float _421 = _147;
    float _423 = _331 + _327;
    int _425 = _417 ? 0 : 1;
    int _427 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _429 = _427 != 0;
    int _431 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _433 = _431 != 0;
    int _435 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _437 = _435 != 0;
    float _439 = _423 + (-1.0);
    int _441 = ~_425;
    int _443 = _441 + 1;
    int _445 = _443 + 1;
    int _447 = _445;
    if (!_405)
    {
        int _449 = ~_425;
        int _451 = _449 + 1;
        _447 = _451;
    }
    int _453 = _447;
    bool _455 = _393 >= 0.0;
    bool _457 = isnan(_393);
    bool _459 = _455 || _457;
    bool _461 = isnan(0.0);
    bool _463 = _459 || _461;
    float _465 = fma(_439, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _467 = !_429;
    int _469 = _467 ? 0 : 1;
    float _471 = _329 + _327;
    int _473 = _463 ? 0 : 1;
    bool _475 = _393 > 0.0;
    float _477 = _471 + (-1.0);
    int _479 = abs(_469);
    float _481 = in.m_66.x;
    float _483 = in.m_66.y;
    float _485 = in.m_66.z;
    bool _487 = _407 >= 0.0;
    bool _489 = isnan(_407);
    bool _491 = _487 || _489;
    bool _493 = isnan(0.0);
    bool _495 = _491 || _493;
    float _497 = float(_479);
    int _499 = _495 ? 0 : 1;
    bool _501 = _407 > 0.0;
    float _503 = float(_453);
    float _505 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _507 = ~_473;
    int _509 = _507 + 1;
    int _511 = _509 + 1;
    int _513 = _511;
    if (!_475)
    {
        int _515 = ~_473;
        int _517 = _515 + 1;
        _513 = _517;
    }
    int _519 = _513;
    float _521 = _497 * _503;
    bool _523 = !_433;
    int _525 = _523 ? 0 : 1;
    bool _527 = !_437;
    int _529 = _527 ? 0 : 1;
    float _531 = _521 * (-2.0);
    int _533 = ~_499;
    int _535 = _533 + 1;
    int _537 = _535 + 1;
    int _539 = _537;
    if (!_501)
    {
        int _541 = ~_499;
        int _543 = _541 + 1;
        _539 = _543;
    }
    int _545 = _539;
    int _547 = abs(_525);
    float _549 = fma(_531, _481, _481);
    int _551 = abs(_529);
    float _553 = fma(_505, _531, _505);
    float _555 = float(_547);
    float _557 = float(_519);
    float _559 = float(_551);
    float _561 = float(_545);
    float _563 = _555 * _557;
    bool _565 = _327 > 0.5;
    float _567 = _327 + (-0.5);
    float _569 = _559 * _561;
    float _571 = _563 * (-2.0);
    float _573 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[196].x, _549);
    float _575 = _569 * (-2.0);
    float _577 = fma(_571, _483, _483);
    float _579 = fma(_553, _421, _573);
    float _581 = fma(_403, _571, _403);
    float _583 = in.m_68.x;
    float _585 = in.m_68.y;
    float _587 = fma(_575, _485, _485);
    float _589 = _329 + (-0.5);
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _593 = _591 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _595 = in.m_50.x;
    float _597 = in.m_50.y;
    float _599 = in.m_50.z;
    float _601 = _331 + (-0.5);
    float _603 = fma(_589, (*spvDescriptorSet0.vp_c9)._m0[196].y, _577);
    float _605 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _607 = _605 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _609 = fma(_465, _575, _465);
    float _611 = fma(_601, (*spvDescriptorSet0.vp_c9)._m0[196].z, _587);
    float _613 = fma(_581, _421, _603);
    float _615 = 1.0 / _593;
    float _617 = _579 * 0.15915493667125701904296875;
    float _619 = fma(_609, _421, _611);
    float _621 = _613 * 0.15915493667125701904296875;
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _625 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _623;
    bool _627 = _329 > 0.5;
    float _629 = 1.0 / _607;
    bool _631 = !_361;
    float _633 = _631 ? (-0.5) : 0.5;
    float _635 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _637 = _293 * _583;
    float _639 = _295 * _585;
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _643 = _641 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _645 = _619 * 0.15915493667125701904296875;
    float _647 = _597 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _649 = _597 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _651 = _617 * 6.283185482025146484375;
    float _653 = sin(_651);
    float _655 = fma(_595, (*spvDescriptorSet0.vp_c10)._m0[4].x, _647);
    float _657 = fma(_595, (*spvDescriptorSet0.vp_c10)._m0[6].x, _649);
    float _659 = _625 * _615;
    float _661 = _643 * _629;
    float _663 = fma(_599, (*spvDescriptorSet0.vp_c10)._m0[6].z, _657);
    float _665 = _617 * 6.283185482025146484375;
    float _667 = cos(_665);
    float _669 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _671 = _325 + _669;
    bool _673 = !_365;
    float _675 = _673 ? (-0.5) : 0.5;
    float _677 = fma(_599, (*spvDescriptorSet0.vp_c10)._m0[4].z, _655);
    float _679 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _681 = _325 + _679;
    float _683 = _637 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _685 = fma(_661, _671, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _687 = _621 * 6.283185482025146484375;
    float _689 = sin(_687);
    float _691 = _639 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _693 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _675);
    float _695 = fma(_659, _681, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _697 = _677 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _699 = _663 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _701 = _691 * _693;
    int _703 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _705 = _703 != 0;
    float _707 = _621 * 6.283185482025146484375;
    float _709 = cos(_707);
    int _711 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _713 = _711 != 0;
    int _715 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _717 = _715 != 0;
    float _719 = _645 * 6.283185482025146484375;
    float _721 = cos(_719);
    float _723 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _633);
    float _725 = _667 * _689;
    float _727 = _653 * _689;
    float _729 = _683 * _723;
    bool _731 = _325 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _733 = isnan(_325);
    bool _735 = _731 || _733;
    bool _737 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _739 = _735 || _737;
    float _741 = float(_739);
    float _743 = _645 * 6.283185482025146484375;
    float _745 = sin(_743);
    float _747 = _653 * _709;
    float _749 = _667 * _709;
    float _751 = -_741;
    float _753 = _751 + 1.0;
    float _755 = _653 * _721;
    float _757 = _709 * _721;
    float _759 = _667 * _721;
    float _761 = _689 * _721;
    float _763 = _759 * _701;
    float _765 = _759 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _767 = -_725;
    float _769 = fma(_745, _747, _767);
    float _771 = -_747;
    float _773 = fma(_745, _725, _771);
    bool _775 = _325 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _777 = isnan(_325);
    bool _779 = _775 || _777;
    bool _781 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _783 = _779 || _781;
    float _785 = float(_783);
    float _787 = fma(_745, _749, _727);
    bool _789 = _325 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _791 = isnan(_325);
    bool _793 = _789 || _791;
    bool _795 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _797 = _793 || _795;
    float _799 = float(_797);
    float _801 = -_701;
    float _803 = _745 * _801;
    float _805 = fma(_745, _727, _749);
    float _807 = _785 * _753;
    float _809 = -_785;
    float _811 = _809 + 1.0;
    float _813 = fma(_787, _729, _763);
    float _815 = _755 * _701;
    float _817 = fma(_757, _729, _803);
    float _819 = _799 * _811;
    float _821 = fma(_773, _635, _813);
    float _823 = fma(_769, _729, _815);
    float _825 = fma(_761, _635, _817);
    float _827 = _695 * _819;
    float _829 = _821 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _831 = _821 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _833 = fma(_805, _635, _823);
    float _835 = fma(_825, (*spvDescriptorSet0.vp_c8)._m0[24].x, _829);
    float _837 = fma(_825, (*spvDescriptorSet0.vp_c8)._m0[26].x, _831);
    float _839 = -_799;
    float _841 = _839 + 1.0;
    float _843 = fma(_833, (*spvDescriptorSet0.vp_c8)._m0[24].z, _835);
    float _845 = fma(_833, (*spvDescriptorSet0.vp_c8)._m0[26].z, _837);
    float _847 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _849 = _843 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _851 = _845 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _853 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _855 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _857 = _697 + _849;
    float _859 = _699 + _851;
    float _861 = fma(_841, (*spvDescriptorSet0.vp_c9)._m0[115].x, _827);
    float _863 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _865 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _867 = _857 + _865;
    float _869 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _871 = _859 + _869;
    float _873 = fma(_685, _807, _861);
    float _875 = _863 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _877 = _867 * _867;
    float _879 = _871 * _871;
    float _881 = _847 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _883 = _855 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _885 = -_745;
    float _887 = fma(_885, (*spvDescriptorSet0.vp_c8)._m0[26].x, _765);
    float _889 = _877 + _879;
    float _891 = _597 + _345;
    float _893 = _759 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    out.m_70.x = _875;
    out.m_70.y = _881;
    out.m_70.z = _883;
    out.m_70.w = _853;
    float _895 = sqrt(_889);
    float _897 = _759 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _899 = -_745;
    float _901 = fma(_899, (*spvDescriptorSet0.vp_c8)._m0[25].x, _893);
    float _903 = fma(_741, (*spvDescriptorSet0.vp_c9)._m0[117].x, _873);
    float _905 = _787 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _907 = -_745;
    float _909 = fma(_907, (*spvDescriptorSet0.vp_c8)._m0[24].x, _897);
    float _911 = fma(_755, (*spvDescriptorSet0.vp_c8)._m0[25].z, _901);
    float _913 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _915 = fma(_755, (*spvDescriptorSet0.vp_c8)._m0[24].z, _909);
    float _917 = fma(_757, (*spvDescriptorSet0.vp_c8)._m0[26].x, _905);
    float _919 = fma(_755, (*spvDescriptorSet0.vp_c8)._m0[26].z, _887);
    float _921 = _787 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _923 = _821 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _925 = _773 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _927 = _787 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _929 = fma(_757, (*spvDescriptorSet0.vp_c8)._m0[24].x, _921);
    float _931 = fma(_825, (*spvDescriptorSet0.vp_c8)._m0[25].x, _923);
    float _933 = _773 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _935 = _773 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _937 = fma(_761, (*spvDescriptorSet0.vp_c8)._m0[25].x, _925);
    bool _939 = _895 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _941 = fma(_761, (*spvDescriptorSet0.vp_c8)._m0[24].x, _933);
    float _943 = fma(_761, (*spvDescriptorSet0.vp_c8)._m0[26].x, _935);
    float _945 = fma(_833, (*spvDescriptorSet0.vp_c8)._m0[25].z, _931);
    float _947 = fma(_757, (*spvDescriptorSet0.vp_c8)._m0[25].x, _927);
    float _949 = fma(_805, (*spvDescriptorSet0.vp_c8)._m0[24].z, _941);
    float _951 = fma(_805, (*spvDescriptorSet0.vp_c8)._m0[25].z, _937);
    float _953 = fma(_805, (*spvDescriptorSet0.vp_c8)._m0[26].z, _943);
    float _955 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _957 = _945 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _959 = -_675;
    int _961 = _389 ? as_type<int>(_959) : as_type<int>(_675);
    bool _963 = _331 > 0.5;
    float _965 = _891 + _957;
    float _967 = _757;
    float _969 = _905;
    float _971 = _937;
    float _973 = _877;
    float _975 = _879;
    float _977 = _919;
    if (!_939)
    {
        _967 = _857;
    }
    float _979 = _967;
    float _981 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _983 = _979;
    if (!_939)
    {
        _969 = _859;
    }
    float _985 = _969;
    float _987 = _985;
    if (!_939)
    {
        _971 = _965;
    }
    float _989 = _971;
    bool _991 = !_939;
    float _993 = _989;
    if (!_991)
    {
        float _995 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _997 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _999 = _895 + _997;
        float _1001 = _965 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1003 = rsqrt(_889);
        float _1005 = _999 * _995;
        float _1007 = _1005 * 0.15915493667125701904296875;
        float _1009 = _1007 * 6.283185482025146484375;
        float _1011 = sin(_1009);
        float _1013 = _1007 * 6.283185482025146484375;
        float _1015 = cos(_1013);
        float _1017 = fma(_1011, _1001, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1019 = _1003 * _1017;
        float _1021 = _1015 + (-1.0);
        float _1023 = fma(_867, _1019, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1025 = fma(_871, _1019, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1027 = _1021 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1029 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1031 = _1023 + _1029;
        float _1033 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1035 = _1025 + _1033;
        float _1037 = fma(_965, _1015, _1027);
        float _1039 = _1031 * _1031;
        float _1041 = _1035 * _1035;
        _993 = _1037;
        _973 = _1039;
        _975 = _1041;
        _983 = _1023;
        _987 = _1025;
    }
    float _1043 = _993;
    float _1045 = _973;
    float _1047 = _975;
    float _1049 = _983;
    float _1051 = _987;
    float _1053 = _675 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1055 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1057 = _1043 + _1055;
    float _1059 = -_633;
    int _1061 = _565 ? as_type<int>(_1059) : as_type<int>(_633);
    float _1063 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1065 = fma(_1053, _1053, 1.0);
    float _1067 = fma(_1057, _1057, _1045);
    int _1069 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1071 = _1069 != 0;
    float _1073 = fma(_769, (*spvDescriptorSet0.vp_c8)._m0[24].z, _929);
    float _1075 = -_633;
    int _1077 = _963 ? as_type<int>(_1075) : as_type<int>(_633);
    float _1079 = _1053 * _915;
    float _1081 = -_675;
    int _1083 = _627 ? as_type<int>(_1081) : as_type<int>(_675);
    float _1085 = rsqrt(_1065);
    bool _1087 = !_1071;
    float _1089 = _1087 ? _633 : as_type<float>(_1061);
    float _1091 = fma(_769, (*spvDescriptorSet0.vp_c8)._m0[26].z, _917);
    bool _1093 = !_713;
    float _1095 = _1093 ? _633 : as_type<float>(_1077);
    float _1097 = _633 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _1099 = !_705;
    float _1101 = _1099 ? _675 : as_type<float>(_1083);
    float _1103 = _1053 * _911;
    bool _1105 = !_717;
    float _1107 = _1105 ? _675 : as_type<float>(_961);
    float _1109 = fma(_769, (*spvDescriptorSet0.vp_c8)._m0[25].z, _947);
    float _1111 = _1053 * _919;
    float _1113 = _1089 + 0.5;
    float _1115 = _1095 + 0.5;
    float _1117 = _1067 + _1047;
    float _1119 = -_1101;
    float _1121 = _1119 + 0.5;
    float _1123 = -_1107;
    float _1125 = _1123 + 0.5;
    float _1127 = fma(_1097, _1073, _1079);
    float _1129 = _1053 * _1085;
    float _1131 = fma(_1097, _1109, _1103);
    float _1133 = fma(_1097, _1091, _1111);
    float _1135 = _1113 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1137 = _1115 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1139 = _1121 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1141 = _1125 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1143 = -_949;
    float _1145 = _1129 * _1143;
    float _1147 = _1135 * _913;
    float _1149 = _1137 * _981;
    float _1151 = _1139 * _955;
    float _1153 = _1141 * _1063;
    float _1155 = fma(_1085, _915, _1145);
    float _1157 = -_951;
    float _1159 = _1129 * _1157;
    float _1161 = -_953;
    float _1163 = _1129 * _1161;
    float _1165 = fma(_1085, _911, _1159);
    float _1167 = sqrt(_1117);
    float _1169 = fma(_1085, _919, _1163);
    float _1171 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1173 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1175 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1177 = _903 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1179 = _1171 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1181 = _1173 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1183 = _1175 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1185 = _949 + _1127;
    float _1187 = _951 + _1131;
    float _1189 = _953 + _1133;
    out.m_72.x = _1147;
    out.m_72.y = _1151;
    out.m_72.z = _1149;
    out.m_72.w = _1153;
    out.m_74.x = _1179;
    out.m_74.y = _1181;
    out.m_74.z = _1183;
    out.m_74.w = _1177;
    bool _1191 = _1167 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1193 = isnan(_1167);
    bool _1195 = _1191 || _1193;
    bool _1197 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1199 = _1195 || _1197;
    out.m_76.x = _1073;
    out.m_76.y = _1109;
    out.m_76.z = _1091;
    out.m_78.x = _1155;
    out.m_78.y = _1165;
    out.m_78.z = _1169;
    out.m_80.x = _1185;
    out.m_80.y = _1187;
    out.m_80.z = _1189;
    if (!_1199)
    {
        _977 = 1.0;
    }
    float _1201 = _977;
    bool _1203 = !_1199;
    float _1205 = _1201;
    if (!_1203)
    {
        bool _1207 = _1167 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1209 = isnan(_1167);
        bool _1211 = _1207 || _1209;
        bool _1213 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1215 = _1211 || _1213;
        if (!_1215)
        {
            float _1217 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1219 = _1167 + _1217;
            float _1221 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1223 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1221;
            float _1225 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1227 = _1225 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1229 = 1.0 / _1223;
            float _1231 = _1219 * _1229;
            float _1233 = fma(_1231, _1227, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1205 = _1233;
            _1235 = true;
        }
        else
        {
            bool _1237 = _1167 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1239 = isnan(_1167);
            bool _1241 = _1237 || _1239;
            bool _1243 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1245 = _1241 || _1243;
            if (!_1245)
            {
                float _1247 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1249 = _1167 + _1247;
                float _1251 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1253 = _1251 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1255 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1257 = _1255 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1259 = 1.0 / _1253;
                float _1261 = _1249 * _1259;
                float _1263 = fma(_1261, _1257, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1205 = _1263;
                _1235 = true;
            }
            else
            {
                _1205 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1235 = false;
    float _1265 = _1205;
    float _1267 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1269 = _1049 + _1267;
    float _1271 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1273 = _1051 + _1271;
    float _1275 = fma(_1269, _1265, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1277 = fma(_1273, _1265, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1279 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1281 = _1275 + _1279;
    float _1283 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1285 = _1277 + _1283;
    float _1287 = fma(_1281, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1289 = fma(_1285, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _4467 = float2(_1287, _1289);
    float _1291 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_4467, float2(0.0), isnan(_4467)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_4467, float2(0.0), isnan(_4467)), level(0.0)).x;
    float _1293 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1295 = _1043 + _1293;
    float _1297 = -_697;
    float _1299 = _1297 + _1275;
    float _1301 = -_699;
    float _1303 = _1301 + _1277;
    float _1305 = fma(_1295, _1265, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1307 = -_891;
    float _1309 = _1307 + _1305;
    float _1311 = fma(_1291, 100.0, _891);
    float _1313 = fma(_1291, 100.0, _1305);
    float _1315 = _1311 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1317 = _1311 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1319 = fma(_697, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1315);
    float _1321 = fma(_697, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1317);
    float _1323 = fma(_699, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1319);
    float _1325 = _1309 * _1309;
    float _1327 = fma(_699, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1321);
    float _1329 = _1323 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1331 = fma(_1299, _1299, _1325);
    float _1333 = _1327 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1335 = 1.0 / _1329;
    float _1337 = fma(_1303, _1303, _1331);
    float _1339 = _1333 + _1329;
    float _1341 = sqrt(_1337);
    bool _1343 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1345 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1347 = _1343 || _1345;
    bool _1349 = isnan(0.5);
    bool _1351 = _1347 || _1349;
    float _1353 = _1339 * _1335;
    float _1355 = _1353 * 0.5;
    float _1357 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1359 = fma(_1355, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1357);
    bool _1361 = _1341 > 0.0;
    float _1363 = 1.0 / _1359;
    bool _1365 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1367 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1369 = _1365 || _1367;
    bool _1371 = isnan(0.5);
    bool _1373 = _1369 || _1371;
    float _1375 = _1291;
    float _1377 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1379 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1381 = _1273;
    float _1383 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1385 = _1355;
    float _1387 = _1277;
    float _1389 = _1275;
    float _1391 = _1337;
    if (!_1361)
    {
        _1375 = _1275;
    }
    float _1393 = _1375;
    float _1395 = _1393;
    if (!_1361)
    {
        _1377 = _1277;
    }
    float _1397 = _1377;
    float _1399 = _1397;
    if (!_1361)
    {
        _1379 = _1313;
    }
    float _1401 = _1379;
    bool _1403 = !_1361;
    float _1405 = _1401;
    float _1407 = _1401;
    if (!_1403)
    {
        float _1409 = _189 * _189;
        float _1411 = fma(_187, _187, _1409);
        float _1413 = fma(_191, _191, _1411);
        float _1415 = rsqrt(_1337);
        float _1417 = sqrt(_1413);
        float _1419 = _1299 * _1415;
        float _1421 = _1309 * _1415;
        float _1423 = _1303 * _1415;
        bool _1425 = _1417 > 0.0;
        float _1427 = _1417;
        float _1429 = _1415;
        _1381 = _1423;
        _1383 = _1413;
        if (!_1425)
        {
            _1427 = _1275;
        }
        float _1431 = _1427;
        _1395 = _1431;
        if (!_1425)
        {
            _1405 = _1313;
        }
        float _1433 = _1405;
        _1407 = _1433;
        if (!_1425)
        {
            _1429 = _1277;
        }
        float _1435 = _1429;
        bool _1437 = !_1425;
        _1399 = _1435;
        if (!_1437)
        {
            float _1439 = rsqrt(_1413);
            float _1441 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1443 = _189 * _1439;
            float _1445 = _187 * _1439;
            float _1447 = _191 * _1439;
            float _1449 = _1421 * _1443;
            float _1451 = fma(_1419, _1445, _1449);
            float _1453 = _1441 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1455 = fma(_1423, _1447, _1451);
            float _1457 = _1455 * _1453;
            float _1459 = fma(_187, _1457, _1275);
            float _1461 = fma(_189, _1457, _1313);
            float _1463 = fma(_191, _1457, _1277);
            _1395 = _1459;
            _1407 = _1461;
            _1399 = _1463;
            _1385 = _1441;
        }
    }
    float _1465 = _1395;
    float _1467 = _1407;
    float _1469 = _1399;
    float _1471 = _1381;
    float _1473 = _1383;
    float _1475 = _1385;
    float _1477 = _1473;
    float _1479 = _1469;
    float _1481 = _1475;
    float _1483 = _1471;
    if (_1351)
    {
        _1477 = 1.0;
    }
    float _1485 = _1477;
    float _1487 = _1485;
    if (_1373)
    {
        _1387 = _1465;
    }
    float _1489 = _1387;
    float _1491 = _1489;
    if (_1373)
    {
        _1389 = _1467;
    }
    float _1493 = _1389;
    float _1495 = _1493;
    if (!_1373)
    {
        float _1497 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1499 = _1311 + _1497;
        float _1501 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1503 = _697 + _1501;
        float _1505 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1507 = -_699;
        float _1509 = _1507 + _1469;
        float _1511 = _1499 * _1499;
        float _1513 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1515 = _699 + _1513;
        float _1517 = fma(_1503, _1503, _1511);
        float _1519 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1521 = fma(_1515, _1515, _1517);
        float _1523 = sqrt(_1521);
        float _1525 = _1505 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1527 = precise::min(_1523, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1529 = _1527 * _1519;
        float _1531 = -_1311;
        float _1533 = _1531 + _1467;
        float _1535 = _1525 * _1529;
        float _1537 = -_697;
        float _1539 = _1537 + _1465;
        float _1541 = fma(_1533, _1535, _1311);
        float _1543 = fma(_1539, _1535, _697);
        float _1545 = fma(_1509, _1535, _699);
        _1391 = _1519;
        _1495 = _1541;
        _1491 = _1543;
        _1479 = _1545;
        _1481 = _1523;
    }
    float _1547 = _1391;
    float _1549 = _1495;
    float _1551 = _1491;
    float _1553 = _1479;
    float _1555 = _1481;
    float _1557 = _1555;
    float _1559 = _1547;
    if (_1351)
    {
        _1557 = 1.0;
    }
    float _1561 = _1557;
    float _1563 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1565 = _1363 * _1563;
    float _1567 = _1561;
    if (!_1351)
    {
        float _1569 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1571 = _1569 * 0.15915493667125701904296875;
        float _1573 = _1571 * 6.283185482025146484375;
        float _1575 = cos(_1573);
        float _1577 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1579 = _1577 * 0.15915493667125701904296875;
        float _1581 = _1571 * 6.283185482025146484375;
        float _1583 = sin(_1581);
        float _1585 = 1.0 / _1575;
        float _1587 = _1579 * 6.283185482025146484375;
        float _1589 = cos(_1587);
        float _1591 = _1583 * _1585;
        float _1593 = _1579 * 6.283185482025146484375;
        float _1595 = sin(_1593);
        float _1597 = _1589 * _1591;
        float _1599 = 1.0 / _1597;
        float _1601 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1603 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1601;
        float _1605 = 1.0 / _1603;
        float _1607 = _1595 * _1599;
        float _1609 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1611 = fma(_1565, _1607, _1609);
        float _1613 = _1611 * _1605;
        float _1615 = precise::clamp(_1613, 0.0, 1.0);
        _195 = _1571;
        _1487 = _1615;
    }
    float _1617 = _195;
    float _1619 = _1487;
    float _1621 = _1617;
    if (!_1351)
    {
        float _1623 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1625 = _1623 * 0.15915493667125701904296875;
        float _1627 = _1625 * 6.283185482025146484375;
        float _1629 = cos(_1627);
        float _1631 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1633 = _1631 * 0.15915493667125701904296875;
        float _1635 = _1625 * 6.283185482025146484375;
        float _1637 = sin(_1635);
        float _1639 = 1.0 / _1629;
        float _1641 = _1633 * 6.283185482025146484375;
        float _1643 = cos(_1641);
        float _1645 = _1637 * _1639;
        float _1647 = _1633 * 6.283185482025146484375;
        float _1649 = sin(_1647);
        float _1651 = _1643 * _1645;
        float _1653 = 1.0 / _1651;
        float _1655 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1657 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1655;
        float _1659 = 1.0 / _1657;
        float _1661 = _1649 * _1653;
        float _1663 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1665 = fma(_1565, _1661, _1663);
        float _1667 = _1665 * _1659;
        float _1669 = precise::clamp(_1667, 0.0, 1.0);
        float _1671 = -_1669;
        float _1673 = _1671 + 1.0;
        _1559 = _1653;
        _1567 = _1673;
    }
    float _1675 = _1559;
    float _1677 = _1567;
    float _1679 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1681 = _1549 + _1679;
    float _1683 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1685 = _1551 + _1683;
    float _1687 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1689 = _1553 + _1687;
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
    float _1719 = _1675;
    float _1721 = _1697;
    float _1723 = _1717;
    float _1725 = _1681;
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
    float _1735 = _1729;
    if (_1713)
    {
        float _1737 = _1717 * _1729;
        _1723 = _1737;
    }
    float _1739 = _1723;
    if (_1713)
    {
        float _1741 = _1739 * 0.15915493667125701904296875;
        _1621 = _1741;
    }
    float _1743 = _1621;
    float _1745 = _1689;
    float _1747 = _1743;
    if (_1713)
    {
        float _1749 = _1743 * 6.283185482025146484375;
        float _1751 = sin(_1749);
        _1745 = _1751;
    }
    float _1753 = _1745;
    float _1755 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1757 = precise::max(0.0, _1755);
    float _1759 = _1309;
    if (_1713)
    {
        float _1761 = _1743 * 6.283185482025146484375;
        float _1763 = cos(_1761);
        _1759 = _1763;
    }
    float _1765 = _1759;
    float _1767 = -_1699;
    float _1769 = -_1757;
    float _1771 = fma(_1681, _1767, _1769);
    float _1773 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_1713)
    {
        float _1775 = _1771 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1725 = _1775;
    }
    float _1777 = _1725;
    float _1779 = _1777;
    if (!_1713)
    {
        _1747 = _1771;
    }
    float _1781 = _1747;
    float _1783 = fma(_697, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1785 = _1753;
    float _1787 = _1781;
    if (_1713)
    {
        float _1789 = fma(_1753, _1777, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1735 = _1789;
    }
    float _1791 = _1735;
    float _1793 = _1791;
    if (!_1713)
    {
        _1785 = _1703;
    }
    float _1795 = _1785;
    float _1797 = _1795;
    float _1799 = _1765;
    if (_1713)
    {
        float _1801 = _1765 + (-1.0);
        _1779 = _1801;
    }
    float _1803 = _1779;
    float _1805 = _1803;
    if (_1713)
    {
        float _1807 = _1733 * _1791;
        _1483 = _1807;
    }
    float _1809 = _1483;
    if (!_1713)
    {
        _1793 = _1701;
    }
    float _1811 = _1793;
    float _1813 = sqrt(_1695);
    float _1815 = _1811;
    if (_1713)
    {
        float _1817 = _1803 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1773 = _1817;
    }
    float _1819 = _1773;
    if (_1713)
    {
        float _1821 = _1701 * _1809;
        _1815 = _1821;
    }
    float _1823 = _1815;
    if (!_1713)
    {
        _1805 = _1705;
    }
    float _1825 = _1805;
    float _1827 = _1825;
    if (_1713)
    {
        float _1829 = _1703 * _1809;
        _1797 = _1829;
    }
    float _1831 = _1797;
    if (_1713)
    {
        float _1833 = fma(_1771, _1765, _1819);
        _1787 = _1833;
    }
    float _1835 = _1787;
    if (_1713)
    {
        float _1837 = _1823 * _1823;
        _1827 = _1837;
    }
    float _1839 = _1827;
    float _1841 = _1549 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_1713)
    {
        _1799 = _1707;
    }
    float _1843 = _1799;
    float _1845 = _1843;
    if (_1713)
    {
        float _1847 = _1831 * _1831;
        _1845 = _1847;
    }
    float _1849 = _1845;
    float _1851 = fma(_1835, _1835, _1839);
    float _1853 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1841);
    float _1855 = floor(_1783);
    float _1857 = _1851 + _1849;
    float _1859 = fma(_1553, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1853);
    float _1861 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1863 = fma(_1813, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1861);
    float _1865 = precise::clamp(_1863, 0.0, 1.0);
    float _1867 = _1859 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1869 = _1549 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1871 = rsqrt(_1857);
    float _1873 = -_1865;
    float _1875 = _1873 + 1.0;
    float _1877 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1879 = _1867 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1881 = fma(_699, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1883 = _1549 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1885 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1869);
    float _1887 = -_1879;
    float _1889 = fma(_1887, _1877, 1.0);
    float _1891 = _1549 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1893 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1883);
    float _1895 = abs(_1875);
    float _1897 = log2(_1895);
    float _1899 = fma(_1553, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1885);
    float _1901 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1891);
    float _1903 = fma(_1553, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1893);
    float _1905 = -_1855;
    float _1907 = _1783 + _1905;
    float _1909 = _1871 * _1823;
    float _1911 = fma(_1553, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1901);
    float _1913 = _1871 * _1835;
    float _1915 = _1871 * _1831;
    float _1917 = _1909 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1919 = _1911 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1921 = _1903 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1923 = floor(_1881);
    float _1925 = -_1917;
    float _1927 = fma(_1913, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1925);
    float _1929 = _1919 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1931 = _1897 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1933 = _1919 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1935 = -_1915;
    float _1937 = fma(_1935, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1927);
    float _1939 = fma(_1921, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1929);
    float _1941 = log2(_1889);
    float _1943 = fma(_1937, -0.5, 0.5);
    float _1945 = fma(_1867, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1939);
    float _1947 = fma(_1921, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1933);
    float _1949 = exp2(_1931);
    float _1951 = _1899 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1953 = -_1923;
    float _1955 = _1881 + _1953;
    float _1957 = fma(_1951, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1945);
    float _1959 = _1919 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1961 = sqrt(_1943);
    float _1963 = fma(_1937, 0.5, 0.5);
    float _1965 = fma(_1921, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1959);
    float _1967 = _1913 + 1.0;
    float _1969 = _1941 * 0.693147182464599609375;
    float _1971 = fma(_1963, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1973 = fma(_1867, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1965);
    float _1975 = 1.0 / _1957;
    float _1977 = fma(_1867, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1947);
    float _1979 = fma(_1963, _1971, -0.212114393711090087890625);
    float _1981 = fma(_1951, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1973);
    float2 _5543 = float2(_1907, _1955);
    float _1983 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5543, float2(0.0), isnan(_5543)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5543, float2(0.0), isnan(_5543)), level(0.0)).x;
    float _1985 = fma(_1951, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1977);
    float _1987 = fma(_1963, _1979, 1.570728778839111328125);
    float _1989 = -_1913;
    float _1991 = fma(_1949, _1967, _1989);
    float _1993 = _1961 * 0.636619746685028076171875;
    float _1995 = -_1987;
    float _1997 = fma(_1993, _1995, 1.0);
    float _1999 = fma(_1991, 0.5, 0.5);
    float _2001 = _1985 * _1975;
    float _2003 = _1981 * _1975;
    float _2005 = _1969 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2007 = fma(_2001, 0.5, 0.5);
    float _2009 = fma(_2003, -0.5, 0.5);
    float3 _5591 = float3(_2007, _2009, _2005);
    float _2011 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5591, float3(0.0), isnan(_5591)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5591, float3(0.0), isnan(_5591)), level(0.0)).x;
    float3 _5602 = float3(_2007, _2009, _2005);
    float4 _2014 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5602, float3(0.0), isnan(_5602)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5602, float3(0.0), isnan(_5602)), level(0.0)).xyzw;
    float _2016 = _2014.x;
    float _2018 = _2014.y;
    float _2020 = _2014.z;
    float _2022 = _2014.w;
    float2 _5618 = float2(_1997, _1999);
    float3 _2026 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5618, float2(0.0), isnan(_5618)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5618, float2(0.0), isnan(_5618)), level(0.0)).xyz;
    float _2028 = _2026.x;
    float _2030 = _2026.y;
    float _2032 = _2026.z;
    float _2034 = abs(_1565);
    float _2036 = log2(_2034);
    float _2038 = _1919 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_82.x = _1551;
    out.m_82.y = _1549;
    out.m_82.z = _1553;
    bool _2040 = _1813 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2042 = isnan(_1813);
    bool _2044 = _2040 || _2042;
    bool _2046 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2048 = _2044 || _2046;
    float _2050 = fma(_1921, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2038);
    float _2052 = fma(_1867, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2050);
    float _2054 = in.m_64.x;
    float _2056 = fma(_1951, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2052);
    float _2058 = _2036 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2060 = exp2(_2058);
    float _2062 = fma(_2060, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2064 = precise::clamp(_2062, 0.0, 1.0);
    float _2066 = fma(_2064, -2.0, 3.0);
    float _2068 = _2064 * _2064;
    float _2070 = _2068 * _2066;
    float _2072 = _1897 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2074 = _1565 <= 8000.0;
    bool _2076 = isnan(_1565);
    bool _2078 = _2074 || _2076;
    bool _2080 = isnan(8000.0);
    bool _2082 = _2078 || _2080;
    float _2084 = float(_2082);
    float _2086 = -_2070;
    float _2088 = _2086 + 1.0;
    float _2090 = exp2(_2072);
    float _2092 = fma(_2088, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2070);
    float _2094 = _2056 + _1957;
    out.gl_Position.x = _1985;
    out.gl_Position.y = _1981;
    out.gl_Position.z = _2056;
    out.gl_Position.w = _1957;
    float _2096 = _2084 * _2092;
    float _2098 = _2094 * 0.5;
    float _2100 = _2096 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_84.z = _2098;
    out.m_84.w = _1957;
    float _2102 = -_2090;
    float _2104 = _2102 + 1.0;
    float _2106 = _1957;
    float _2108 = _2056;
    float _2110 = _1981;
    float _2112 = _1985;
    if (!_2048)
    {
        _2106 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2114 = _2106;
    float _2116 = _2114;
    float _2118 = _2114;
    if (!_2048)
    {
        _2108 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2120 = _2108;
    float _2122 = _2104 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2124 = _2120;
    float _2126 = _2120;
    if (!_2048)
    {
        _2110 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2128 = _2110;
    float _2130 = _2128;
    float _2132 = _2128;
    if (!_2048)
    {
        _2112 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2134 = _2112;
    float _2136 = -_1983;
    float _2138 = _2136 + 1.0;
    float _2140 = _2138 * _2100;
    float _2142 = precise::clamp(_2140, 0.0, 1.0);
    float _2144 = -_2142;
    float _2146 = fma(_2144, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2148 = _1619 * _1677;
    float _2150 = _2146 * _2054;
    float _2152 = _2150 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2154 = _2122 * _2011;
    float _2156 = -_2122;
    float _2158 = _2156 + 1.0;
    out.m_86.x = _2152;
    float _2160 = _2022 * _2154;
    float _2162 = _2032 * _2154;
    float _2164 = _2022 * _2158;
    float _2166 = fma(_2028, _2160, _2016);
    float _2168 = fma(_2030, _2160, _2018);
    float _2170 = fma(_2022, _2162, _2020);
    float _2172 = _2148 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2174 = _2016;
    float _2176 = _2148;
    float _2178 = _2134;
    float _2180 = _2134;
    if (!_2048)
    {
        _2174 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2182 = _2174;
    float _2184 = _2182;
    float _2186 = _2182;
    if (!_2048)
    {
        _2176 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2188 = _2176;
    out.m_88.x = _2166;
    out.m_88.y = _2168;
    out.m_88.z = _2170;
    out.m_88.w = _2164;
    bool _2190 = !_2048;
    float _2192 = _2188;
    float _2194 = _2188;
    if (!_2190)
    {
        bool _2196 = _1813 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2198 = isnan(_1813);
        bool _2200 = _2196 || _2198;
        bool _2202 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2204 = _2200 || _2202;
        if (!_2204)
        {
            float _2206 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2208 = _1813 + _2206;
            float _2210 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2212 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2210;
            float _2214 = 1.0 / _2212;
            float _2216 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2218 = _2216 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2220 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2222 = _2220 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2224 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2226 = _2224 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2228 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2230 = _2228 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2232 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2234 = _2232 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2236 = _2208 * _2214;
            float _2238 = precise::clamp(_2236, 0.0, 1.0);
            float _2240 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2242 = _2240 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2244 = fma(_2238, _2218, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2246 = fma(_2238, _2242, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2248 = fma(_2238, _2222, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2250 = fma(_2238, _2226, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2252 = fma(_2238, _2230, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2254 = fma(_2238, _2234, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2118 = _2246;
            _2180 = _2252;
            _2186 = _2244;
            _2132 = _2250;
            _2126 = _2248;
            _2194 = _2254;
            _2256 = true;
        }
        else
        {
            bool _2258 = _1813 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2260 = isnan(_1813);
            bool _2262 = _2258 || _2260;
            bool _2264 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2266 = _2262 || _2264;
            if (!_2266)
            {
                _2184 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2268 = _2184;
            _2186 = _2268;
            if (!_2266)
            {
                _2116 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2270 = _2116;
            _2118 = _2270;
            if (!_2266)
            {
                _2124 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2272 = _2124;
            _2126 = _2272;
            if (!_2266)
            {
                _2130 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2274 = _2130;
            _2132 = _2274;
            if (!_2266)
            {
                _2178 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2276 = _2178;
            _2180 = _2276;
            if (!_2266)
            {
                _2192 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2278 = _2192;
            bool _2280 = !_2266;
            _2194 = _2278;
            if (!_2280)
            {
                bool _2282 = _1813 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2284 = isnan(_1813);
                bool _2286 = _2282 || _2284;
                bool _2288 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2290 = _2286 || _2288;
                if (!_2290)
                {
                    float _2292 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2294 = _1813 + _2292;
                    float _2296 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2298 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2296;
                    float _2300 = 1.0 / _2298;
                    float _2302 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2304 = _2302 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2306 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2308 = _2306 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2310 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2312 = _2310 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2314 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2316 = _2314 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2318 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2320 = _2318 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2322 = _2294 * _2300;
                    float _2324 = precise::clamp(_2322, 0.0, 1.0);
                    float _2326 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2328 = _2326 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2330 = fma(_2324, _2304, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2332 = fma(_2324, _2328, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2334 = fma(_2324, _2308, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2336 = fma(_2324, _2312, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2338 = fma(_2324, _2316, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2340 = fma(_2324, _2320, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2118 = _2332;
                    _2180 = _2338;
                    _2186 = _2330;
                    _2132 = _2336;
                    _2126 = _2334;
                    _2194 = _2340;
                    _2256 = true;
                }
                else
                {
                    _2118 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2180 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2186 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2132 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2126 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2194 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2256 = false;
    float _2342 = _2118;
    float _2344 = _2180;
    float _2346 = _2186;
    float _2348 = _2132;
    float _2350 = _2126;
    float _2352 = _2194;
    float _2354 = fma(_1187, -0.5, 0.5);
    float _2356 = precise::clamp(_2354, 0.0, 1.0);
    float _2358 = -_2342;
    float _2360 = _2358 + _2344;
    float _2362 = _2172 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2364 = -_2346;
    float _2366 = _2364 + _2348;
    out.m_90.x = 0.0;
    float _2368 = fma(_2356, _2360, _2342);
    float _2370 = fma(_2356, _2366, _2346);
    out.m_53.x = _2362;
    float _2372 = -_2350;
    float _2374 = _2372 + _2352;
    float _2376 = _2368 * 0.586610972881317138671875;
    bool _2378 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2380 = fma(_2356, _2374, _2350);
    float _2382 = fma(_2370, 0.298911988735198974609375, _2376);
    bool _2384 = _1619 > 0.0;
    bool _2386 = isnan(_1619);
    bool _2388 = _2384 || _2386;
    bool _2390 = isnan(0.0);
    bool _2392 = _2388 || _2390;
    float _2394 = fma(_2380, 0.114477999508380889892578125, _2382);
    bool _2396 = _1677 <= 0.0;
    bool _2398 = !_2392;
    bool _2400 = _2396 || _2398;
    float _2402 = -_2394;
    float _2404 = _2370 + _2402;
    float _2406 = -_2394;
    float _2408 = _2368 + _2406;
    float _2410 = -_2394;
    float _2412 = _2380 + _2410;
    float _2414 = fma(_2404, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2394);
    float _2416 = fma(_2408, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2394);
    float _2418 = fma(_2412, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2394);
    bool _2420 = !_2378;
    if (!_2420)
    {
        float _2422 = -_1549;
        float _2424 = _2422 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2426 = -_1551;
        float _2428 = _2426 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2430 = -_1553;
        float _2432 = _2430 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2434 = _2424 * _2424;
        float _2436 = fma(_2428, _2428, _2434);
        float _2438 = fma(_2432, _2432, _2436);
        float _2440 = sqrt(_2438);
        float _2442 = rsqrt(_2438);
        float _2444 = -_2440;
        float _2446 = _2444 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2448 = _2446 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2450 = precise::clamp(_2448, 0.0, 1.0);
        float _2452 = _2428 * _2442;
        float _2454 = _2424 * _2442;
        float _2456 = abs(_2450);
        float _2458 = log2(_2456);
        float _2460 = _2432 * _2442;
        float _2462 = _2452 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2464 = _1187 * _2454;
        float _2466 = -_2454;
        float _2468 = -_2462;
        float _2470 = fma(_2466, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2468);
        float _2472 = fma(_1185, _2452, _2464);
        float _2474 = -_2460;
        float _2476 = fma(_2474, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2470);
        float _2478 = fma(_1189, _2460, _2472);
        float _2480 = precise::clamp(_2478, 0.0, 1.0);
        float _2482 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2484 = _2476 + _2482;
        float _2486 = _2458 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2488 = _2484 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2490 = precise::clamp(_2488, 0.0, 1.0);
        float _2492 = exp2(_2486);
        float _2494 = _2492 * _2490;
        float _2496 = _2480 * _2494;
        float _2498 = _2496 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2500 = _2496 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2502 = _2496 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_90.x = _2498;
        out.m_90.y = _2500;
        out.m_90.z = _2502;
    }
    out.m_92.x = _2414;
    out.m_92.y = _2416;
    out.m_92.z = _2418;
    if (!_2400)
    {
        return out;
    }
    out.m_53.x = 0.0;
    float _2504 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2504;
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
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2256 = false;
    bool _1235 = false;
    bool _317 = false;
    bool _215 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _106 = in.m_50.w;
    float _108 = trunc(_106);
    int _111 = int(_108);
    bool _115 = _111 >= 1;
    float _117 = 0.0;
    if (!_115)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _119 = _117;
    float _121 = _119;
    if (!_115)
    {
        out.m_53.x = 0.0;
    }
    int _123 = 0;
    if (!_115)
    {
        float _125 = _119 * 5.0;
        _123 = as_type<int>(_125);
    }
    int _127 = _123;
    if (!_115)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2560 = as_type<float>(_127);
        out.gl_Position.z = _2560;
    }
    if (!_115)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _129 = in.m_55.w;
    bool _131 = _129 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _133 = isnan(_129);
    bool _135 = _131 || _133;
    bool _137 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _139 = _135 || _137;
    float _141 = -_129;
    float _143 = _141 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _145 = 0.0;
    float _147 = _143;
    if (_139)
    {
        float _149 = float(_111);
        _145 = _149;
    }
    float _151 = _145;
    bool _153 = _143 >= _151;
    bool _155 = !_139;
    bool _157 = _153 || _155;
    if (_157)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _159 = _121;
    if (_157)
    {
        out.m_53.x = 0.0;
    }
    int _161 = 0;
    if (_157)
    {
        float _163 = _159 * 5.0;
        _161 = as_type<int>(_163);
    }
    int _165 = _161;
    if (_157)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2629 = as_type<float>(_165);
        out.gl_Position.z = _2629;
    }
    if (_157)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _167 = in.m_57.x;
    float _169 = in.m_57.y;
    float _171 = in.m_57.z;
    bool _173 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _175 = _169 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _177 = _169 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _179 = _169 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _181 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[4].x, _175);
    float _183 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[5].x, _177);
    float _185 = fma(_167, (*spvDescriptorSet0.vp_c10)._m0[6].x, _179);
    float _187 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[4].z, _181);
    float _189 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[5].z, _183);
    float _191 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[6].z, _185);
    bool _193 = !_173;
    float _195 = _191;
    float _213;
    if (!_193)
    {
        float _197 = in.m_59.x;
        float _199 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _201 = _197 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _203 = fma(_201, (*spvDescriptorSet0.vp_c9)._m0[12].x, _143);
        float _205 = _203 * _199;
        float _207 = floor(_205);
        float _209 = -_207;
        float _211 = _205 + _209;
        _213 = _211;
        _215 = true;
    }
    else
    {
        float _217 = float(_111);
        float _219 = 1.0 / _217;
        float _221 = _143 * _219;
        _213 = _221;
    }
    _215 = false;
    float _223 = _213;
    float _225 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _227 = _223 + _225;
    bool _229 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _231 = isnan(_223);
    bool _233 = _229 || _231;
    bool _235 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _237 = _233 || _235;
    float _239 = float(_237);
    float _241 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _243 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _241;
    float _245 = -_239;
    float _247 = _245 + 1.0;
    bool _249 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _251 = isnan(_223);
    bool _253 = _249 || _251;
    bool _255 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _257 = _253 || _255;
    float _259 = float(_257);
    float _261 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _263 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _261;
    bool _265 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _267 = 1.0 / _243;
    float _269 = _259 * _247;
    float _271 = -_259;
    float _273 = _271 + 1.0;
    float _275 = _227 * _267;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _279 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _277;
    float _281 = fma(_263, _275, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _283 = fma(_279, _275, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _285 = _281 * _269;
    float _287 = _283 * _269;
    float _289 = fma(_273, (*spvDescriptorSet0.vp_c9)._m0[143].x, _285);
    float _291 = fma(_273, (*spvDescriptorSet0.vp_c9)._m0[143].y, _287);
    float _293 = fma(_239, (*spvDescriptorSet0.vp_c9)._m0[144].x, _289);
    float _295 = fma(_239, (*spvDescriptorSet0.vp_c9)._m0[144].y, _291);
    bool _297 = !_265;
    float _315;
    if (!_297)
    {
        float _299 = in.m_59.x;
        float _301 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _303 = _299 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _305 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[11].y, _143);
        float _307 = _305 * _301;
        float _309 = floor(_307);
        float _311 = -_309;
        float _313 = _307 + _311;
        _315 = _313;
        _317 = true;
    }
    else
    {
        float _319 = float(_111);
        float _321 = 1.0 / _319;
        float _323 = _143 * _321;
        _315 = _323;
    }
    _317 = false;
    float _325 = _315;
    float _327 = in.m_59.x;
    float _329 = in.m_59.y;
    float _331 = in.m_59.z;
    float _333 = in.m_59.w;
    float _335 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _337 = log2(_335);
    float _339 = as_type<float>(int(gl_VertexIndex));
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _343 = 1.0 + _341;
    float _345 = in.m_64.y;
    float _347 = 1.0 / _343;
    float _349 = _337 * _143;
    float _351 = exp2(_349);
    float _353 = _331 * 2.0;
    float _355 = _327 * 2.0;
    float _357 = _329 * 2.0;
    int _359 = as_type<int>(_339) & 1;
    bool _361 = _359 != 0;
    int _363 = as_type<int>(_339) & 2;
    bool _365 = _363 != 0;
    bool _367 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _369 = isnan(1.0);
    bool _371 = _367 || _369;
    bool _373 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _375 = _371 || _373;
    float _377 = floor(_353);
    bool _379 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _381 = isnan(0.0);
    bool _383 = _379 || _381;
    bool _385 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _387 = _383 || _385;
    bool _389 = _333 > 0.5;
    float _391 = _329 + _331;
    float _393 = floor(_355);
    float _395 = -_351;
    float _397 = _395 + 1.0;
    float _399 = _391 + (-1.0);
    float _401 = _387 ? _397 : 0.0;
    float _403 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _405 = _377 > 0.0;
    float _407 = floor(_357);
    bool _409 = _377 >= 0.0;
    bool _411 = isnan(_377);
    bool _413 = _409 || _411;
    bool _415 = isnan(0.0);
    bool _417 = _413 || _415;
    if (_375)
    {
        float _419 = _401 * _347;
        _147 = _419;
    }
    float _421 = _147;
    float _423 = _331 + _327;
    int _425 = _417 ? 0 : 1;
    int _427 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _429 = _427 != 0;
    int _431 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _433 = _431 != 0;
    int _435 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _437 = _435 != 0;
    float _439 = _423 + (-1.0);
    int _441 = ~_425;
    int _443 = _441 + 1;
    int _445 = _443 + 1;
    int _447 = _445;
    if (!_405)
    {
        int _449 = ~_425;
        int _451 = _449 + 1;
        _447 = _451;
    }
    int _453 = _447;
    bool _455 = _393 >= 0.0;
    bool _457 = isnan(_393);
    bool _459 = _455 || _457;
    bool _461 = isnan(0.0);
    bool _463 = _459 || _461;
    float _465 = fma(_439, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _467 = !_429;
    int _469 = _467 ? 0 : 1;
    float _471 = _329 + _327;
    int _473 = _463 ? 0 : 1;
    bool _475 = _393 > 0.0;
    float _477 = _471 + (-1.0);
    int _479 = abs(_469);
    float _481 = in.m_66.x;
    float _483 = in.m_66.y;
    float _485 = in.m_66.z;
    bool _487 = _407 >= 0.0;
    bool _489 = isnan(_407);
    bool _491 = _487 || _489;
    bool _493 = isnan(0.0);
    bool _495 = _491 || _493;
    float _497 = float(_479);
    int _499 = _495 ? 0 : 1;
    bool _501 = _407 > 0.0;
    float _503 = float(_453);
    float _505 = fma(_477, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _507 = ~_473;
    int _509 = _507 + 1;
    int _511 = _509 + 1;
    int _513 = _511;
    if (!_475)
    {
        int _515 = ~_473;
        int _517 = _515 + 1;
        _513 = _517;
    }
    int _519 = _513;
    float _521 = _497 * _503;
    bool _523 = !_433;
    int _525 = _523 ? 0 : 1;
    bool _527 = !_437;
    int _529 = _527 ? 0 : 1;
    float _531 = _521 * (-2.0);
    int _533 = ~_499;
    int _535 = _533 + 1;
    int _537 = _535 + 1;
    int _539 = _537;
    if (!_501)
    {
        int _541 = ~_499;
        int _543 = _541 + 1;
        _539 = _543;
    }
    int _545 = _539;
    int _547 = abs(_525);
    float _549 = fma(_531, _481, _481);
    int _551 = abs(_529);
    float _553 = fma(_505, _531, _505);
    float _555 = float(_547);
    float _557 = float(_519);
    float _559 = float(_551);
    float _561 = float(_545);
    float _563 = _555 * _557;
    bool _565 = _327 > 0.5;
    float _567 = _327 + (-0.5);
    float _569 = _559 * _561;
    float _571 = _563 * (-2.0);
    float _573 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[196].x, _549);
    float _575 = _569 * (-2.0);
    float _577 = fma(_571, _483, _483);
    float _579 = fma(_553, _421, _573);
    float _581 = fma(_403, _571, _403);
    float _583 = in.m_68.x;
    float _585 = in.m_68.y;
    float _587 = fma(_575, _485, _485);
    float _589 = _329 + (-0.5);
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _593 = _591 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _595 = in.m_50.x;
    float _597 = in.m_50.y;
    float _599 = in.m_50.z;
    float _601 = _331 + (-0.5);
    float _603 = fma(_589, (*spvDescriptorSet0.vp_c9)._m0[196].y, _577);
    float _605 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _607 = _605 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _609 = fma(_465, _575, _465);
    float _611 = fma(_601, (*spvDescriptorSet0.vp_c9)._m0[196].z, _587);
    float _613 = fma(_581, _421, _603);
    float _615 = 1.0 / _593;
    float _617 = _579 * 0.15915493667125701904296875;
    float _619 = fma(_609, _421, _611);
    float _621 = _613 * 0.15915493667125701904296875;
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _625 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _623;
    bool _627 = _329 > 0.5;
    float _629 = 1.0 / _607;
    bool _631 = !_361;
    float _633 = _631 ? (-0.5) : 0.5;
    float _635 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _637 = _293 * _583;
    float _639 = _295 * _585;
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _643 = _641 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _645 = _619 * 0.15915493667125701904296875;
    float _647 = _597 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _649 = _597 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _651 = _617 * 6.283185482025146484375;
    float _653 = sin(_651);
    float _655 = fma(_595, (*spvDescriptorSet0.vp_c10)._m0[4].x, _647);
    float _657 = fma(_595, (*spvDescriptorSet0.vp_c10)._m0[6].x, _649);
    float _659 = _625 * _615;
    float _661 = _643 * _629;
    float _663 = fma(_599, (*spvDescriptorSet0.vp_c10)._m0[6].z, _657);
    float _665 = _617 * 6.283185482025146484375;
    float _667 = cos(_665);
    float _669 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _671 = _325 + _669;
    bool _673 = !_365;
    float _675 = _673 ? (-0.5) : 0.5;
    float _677 = fma(_599, (*spvDescriptorSet0.vp_c10)._m0[4].z, _655);
    float _679 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _681 = _325 + _679;
    float _683 = _637 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _685 = fma(_661, _671, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _687 = _621 * 6.283185482025146484375;
    float _689 = sin(_687);
    float _691 = _639 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _693 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _675);
    float _695 = fma(_659, _681, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _697 = _677 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _699 = _663 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _701 = _691 * _693;
    int _703 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _705 = _703 != 0;
    float _707 = _621 * 6.283185482025146484375;
    float _709 = cos(_707);
    int _711 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _713 = _711 != 0;
    int _715 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _717 = _715 != 0;
    float _719 = _645 * 6.283185482025146484375;
    float _721 = cos(_719);
    float _723 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _633);
    float _725 = _667 * _689;
    float _727 = _653 * _689;
    float _729 = _683 * _723;
    bool _731 = _325 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _733 = isnan(_325);
    bool _735 = _731 || _733;
    bool _737 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _739 = _735 || _737;
    float _741 = float(_739);
    float _743 = _645 * 6.283185482025146484375;
    float _745 = sin(_743);
    float _747 = _653 * _709;
    float _749 = _667 * _709;
    float _751 = -_741;
    float _753 = _751 + 1.0;
    float _755 = _653 * _721;
    float _757 = _709 * _721;
    float _759 = _667 * _721;
    float _761 = _689 * _721;
    float _763 = _759 * _701;
    float _765 = _759 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _767 = -_725;
    float _769 = fma(_745, _747, _767);
    float _771 = -_747;
    float _773 = fma(_745, _725, _771);
    bool _775 = _325 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _777 = isnan(_325);
    bool _779 = _775 || _777;
    bool _781 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _783 = _779 || _781;
    float _785 = float(_783);
    float _787 = fma(_745, _749, _727);
    bool _789 = _325 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _791 = isnan(_325);
    bool _793 = _789 || _791;
    bool _795 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _797 = _793 || _795;
    float _799 = float(_797);
    float _801 = -_701;
    float _803 = _745 * _801;
    float _805 = fma(_745, _727, _749);
    float _807 = _785 * _753;
    float _809 = -_785;
    float _811 = _809 + 1.0;
    float _813 = fma(_787, _729, _763);
    float _815 = _755 * _701;
    float _817 = fma(_757, _729, _803);
    float _819 = _799 * _811;
    float _821 = fma(_773, _635, _813);
    float _823 = fma(_769, _729, _815);
    float _825 = fma(_761, _635, _817);
    float _827 = _695 * _819;
    float _829 = _821 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _831 = _821 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _833 = fma(_805, _635, _823);
    float _835 = fma(_825, (*spvDescriptorSet0.vp_c8)._m0[24].x, _829);
    float _837 = fma(_825, (*spvDescriptorSet0.vp_c8)._m0[26].x, _831);
    float _839 = -_799;
    float _841 = _839 + 1.0;
    float _843 = fma(_833, (*spvDescriptorSet0.vp_c8)._m0[24].z, _835);
    float _845 = fma(_833, (*spvDescriptorSet0.vp_c8)._m0[26].z, _837);
    float _847 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _849 = _843 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _851 = _845 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _853 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _855 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _857 = _697 + _849;
    float _859 = _699 + _851;
    float _861 = fma(_841, (*spvDescriptorSet0.vp_c9)._m0[115].x, _827);
    float _863 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _865 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _867 = _857 + _865;
    float _869 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _871 = _859 + _869;
    float _873 = fma(_685, _807, _861);
    float _875 = _863 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _877 = _867 * _867;
    float _879 = _871 * _871;
    float _881 = _847 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _883 = _855 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _885 = -_745;
    float _887 = fma(_885, (*spvDescriptorSet0.vp_c8)._m0[26].x, _765);
    float _889 = _877 + _879;
    float _891 = _597 + _345;
    float _893 = _759 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    out.m_70.x = _875;
    out.m_70.y = _881;
    out.m_70.z = _883;
    out.m_70.w = _853;
    float _895 = sqrt(_889);
    float _897 = _759 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _899 = -_745;
    float _901 = fma(_899, (*spvDescriptorSet0.vp_c8)._m0[25].x, _893);
    float _903 = fma(_741, (*spvDescriptorSet0.vp_c9)._m0[117].x, _873);
    float _905 = _787 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _907 = -_745;
    float _909 = fma(_907, (*spvDescriptorSet0.vp_c8)._m0[24].x, _897);
    float _911 = fma(_755, (*spvDescriptorSet0.vp_c8)._m0[25].z, _901);
    float _913 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _915 = fma(_755, (*spvDescriptorSet0.vp_c8)._m0[24].z, _909);
    float _917 = fma(_757, (*spvDescriptorSet0.vp_c8)._m0[26].x, _905);
    float _919 = fma(_755, (*spvDescriptorSet0.vp_c8)._m0[26].z, _887);
    float _921 = _787 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _923 = _821 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _925 = _773 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _927 = _787 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _929 = fma(_757, (*spvDescriptorSet0.vp_c8)._m0[24].x, _921);
    float _931 = fma(_825, (*spvDescriptorSet0.vp_c8)._m0[25].x, _923);
    float _933 = _773 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _935 = _773 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _937 = fma(_761, (*spvDescriptorSet0.vp_c8)._m0[25].x, _925);
    bool _939 = _895 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _941 = fma(_761, (*spvDescriptorSet0.vp_c8)._m0[24].x, _933);
    float _943 = fma(_761, (*spvDescriptorSet0.vp_c8)._m0[26].x, _935);
    float _945 = fma(_833, (*spvDescriptorSet0.vp_c8)._m0[25].z, _931);
    float _947 = fma(_757, (*spvDescriptorSet0.vp_c8)._m0[25].x, _927);
    float _949 = fma(_805, (*spvDescriptorSet0.vp_c8)._m0[24].z, _941);
    float _951 = fma(_805, (*spvDescriptorSet0.vp_c8)._m0[25].z, _937);
    float _953 = fma(_805, (*spvDescriptorSet0.vp_c8)._m0[26].z, _943);
    float _955 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _957 = _945 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _959 = -_675;
    int _961 = _389 ? as_type<int>(_959) : as_type<int>(_675);
    bool _963 = _331 > 0.5;
    float _965 = _891 + _957;
    float _967 = _757;
    float _969 = _905;
    float _971 = _937;
    float _973 = _877;
    float _975 = _879;
    float _977 = _919;
    if (!_939)
    {
        _967 = _857;
    }
    float _979 = _967;
    float _981 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _983 = _979;
    if (!_939)
    {
        _969 = _859;
    }
    float _985 = _969;
    float _987 = _985;
    if (!_939)
    {
        _971 = _965;
    }
    float _989 = _971;
    bool _991 = !_939;
    float _993 = _989;
    if (!_991)
    {
        float _995 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _997 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _999 = _895 + _997;
        float _1001 = _965 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1003 = rsqrt(_889);
        float _1005 = _999 * _995;
        float _1007 = _1005 * 0.15915493667125701904296875;
        float _1009 = _1007 * 6.283185482025146484375;
        float _1011 = sin(_1009);
        float _1013 = _1007 * 6.283185482025146484375;
        float _1015 = cos(_1013);
        float _1017 = fma(_1011, _1001, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1019 = _1003 * _1017;
        float _1021 = _1015 + (-1.0);
        float _1023 = fma(_867, _1019, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1025 = fma(_871, _1019, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1027 = _1021 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1029 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1031 = _1023 + _1029;
        float _1033 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1035 = _1025 + _1033;
        float _1037 = fma(_965, _1015, _1027);
        float _1039 = _1031 * _1031;
        float _1041 = _1035 * _1035;
        _993 = _1037;
        _973 = _1039;
        _975 = _1041;
        _983 = _1023;
        _987 = _1025;
    }
    float _1043 = _993;
    float _1045 = _973;
    float _1047 = _975;
    float _1049 = _983;
    float _1051 = _987;
    float _1053 = _675 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1055 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1057 = _1043 + _1055;
    float _1059 = -_633;
    int _1061 = _565 ? as_type<int>(_1059) : as_type<int>(_633);
    float _1063 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1065 = fma(_1053, _1053, 1.0);
    float _1067 = fma(_1057, _1057, _1045);
    int _1069 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1071 = _1069 != 0;
    float _1073 = fma(_769, (*spvDescriptorSet0.vp_c8)._m0[24].z, _929);
    float _1075 = -_633;
    int _1077 = _963 ? as_type<int>(_1075) : as_type<int>(_633);
    float _1079 = _1053 * _915;
    float _1081 = -_675;
    int _1083 = _627 ? as_type<int>(_1081) : as_type<int>(_675);
    float _1085 = rsqrt(_1065);
    bool _1087 = !_1071;
    float _1089 = _1087 ? _633 : as_type<float>(_1061);
    float _1091 = fma(_769, (*spvDescriptorSet0.vp_c8)._m0[26].z, _917);
    bool _1093 = !_713;
    float _1095 = _1093 ? _633 : as_type<float>(_1077);
    float _1097 = _633 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _1099 = !_705;
    float _1101 = _1099 ? _675 : as_type<float>(_1083);
    float _1103 = _1053 * _911;
    bool _1105 = !_717;
    float _1107 = _1105 ? _675 : as_type<float>(_961);
    float _1109 = fma(_769, (*spvDescriptorSet0.vp_c8)._m0[25].z, _947);
    float _1111 = _1053 * _919;
    float _1113 = _1089 + 0.5;
    float _1115 = _1095 + 0.5;
    float _1117 = _1067 + _1047;
    float _1119 = -_1101;
    float _1121 = _1119 + 0.5;
    float _1123 = -_1107;
    float _1125 = _1123 + 0.5;
    float _1127 = fma(_1097, _1073, _1079);
    float _1129 = _1053 * _1085;
    float _1131 = fma(_1097, _1109, _1103);
    float _1133 = fma(_1097, _1091, _1111);
    float _1135 = _1113 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1137 = _1115 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1139 = _1121 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1141 = _1125 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1143 = -_949;
    float _1145 = _1129 * _1143;
    float _1147 = _1135 * _913;
    float _1149 = _1137 * _981;
    float _1151 = _1139 * _955;
    float _1153 = _1141 * _1063;
    float _1155 = fma(_1085, _915, _1145);
    float _1157 = -_951;
    float _1159 = _1129 * _1157;
    float _1161 = -_953;
    float _1163 = _1129 * _1161;
    float _1165 = fma(_1085, _911, _1159);
    float _1167 = sqrt(_1117);
    float _1169 = fma(_1085, _919, _1163);
    float _1171 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1173 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1175 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1177 = _903 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1179 = _1171 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1181 = _1173 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1183 = _1175 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1185 = _949 + _1127;
    float _1187 = _951 + _1131;
    float _1189 = _953 + _1133;
    out.m_72.x = _1147;
    out.m_72.y = _1151;
    out.m_72.z = _1149;
    out.m_72.w = _1153;
    out.m_74.x = _1179;
    out.m_74.y = _1181;
    out.m_74.z = _1183;
    out.m_74.w = _1177;
    bool _1191 = _1167 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1193 = isnan(_1167);
    bool _1195 = _1191 || _1193;
    bool _1197 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1199 = _1195 || _1197;
    out.m_76.x = _1073;
    out.m_76.y = _1109;
    out.m_76.z = _1091;
    out.m_78.x = _1155;
    out.m_78.y = _1165;
    out.m_78.z = _1169;
    out.m_80.x = _1185;
    out.m_80.y = _1187;
    out.m_80.z = _1189;
    if (!_1199)
    {
        _977 = 1.0;
    }
    float _1201 = _977;
    bool _1203 = !_1199;
    float _1205 = _1201;
    if (!_1203)
    {
        bool _1207 = _1167 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1209 = isnan(_1167);
        bool _1211 = _1207 || _1209;
        bool _1213 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1215 = _1211 || _1213;
        if (!_1215)
        {
            float _1217 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1219 = _1167 + _1217;
            float _1221 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1223 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1221;
            float _1225 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1227 = _1225 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1229 = 1.0 / _1223;
            float _1231 = _1219 * _1229;
            float _1233 = fma(_1231, _1227, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1205 = _1233;
            _1235 = true;
        }
        else
        {
            bool _1237 = _1167 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1239 = isnan(_1167);
            bool _1241 = _1237 || _1239;
            bool _1243 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1245 = _1241 || _1243;
            if (!_1245)
            {
                float _1247 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1249 = _1167 + _1247;
                float _1251 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1253 = _1251 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1255 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1257 = _1255 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1259 = 1.0 / _1253;
                float _1261 = _1249 * _1259;
                float _1263 = fma(_1261, _1257, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1205 = _1263;
                _1235 = true;
            }
            else
            {
                _1205 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1235 = false;
    float _1265 = _1205;
    float _1267 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1269 = _1049 + _1267;
    float _1271 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1273 = _1051 + _1271;
    float _1275 = fma(_1269, _1265, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1277 = fma(_1273, _1265, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1279 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1281 = _1275 + _1279;
    float _1283 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1285 = _1277 + _1283;
    float _1287 = fma(_1281, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1289 = fma(_1285, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _4467 = float2(_1287, _1289);
    float _1291 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_4467, float2(0.0), isnan(_4467)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_4467, float2(0.0), isnan(_4467)), level(0.0)).x;
    float _1293 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1295 = _1043 + _1293;
    float _1297 = -_697;
    float _1299 = _1297 + _1275;
    float _1301 = -_699;
    float _1303 = _1301 + _1277;
    float _1305 = fma(_1295, _1265, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1307 = -_891;
    float _1309 = _1307 + _1305;
    float _1311 = fma(_1291, 100.0, _891);
    float _1313 = fma(_1291, 100.0, _1305);
    float _1315 = _1311 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1317 = _1311 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1319 = fma(_697, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1315);
    float _1321 = fma(_697, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1317);
    float _1323 = fma(_699, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1319);
    float _1325 = _1309 * _1309;
    float _1327 = fma(_699, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1321);
    float _1329 = _1323 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1331 = fma(_1299, _1299, _1325);
    float _1333 = _1327 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1335 = 1.0 / _1329;
    float _1337 = fma(_1303, _1303, _1331);
    float _1339 = _1333 + _1329;
    float _1341 = sqrt(_1337);
    bool _1343 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1345 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1347 = _1343 || _1345;
    bool _1349 = isnan(0.5);
    bool _1351 = _1347 || _1349;
    float _1353 = _1339 * _1335;
    float _1355 = _1353 * 0.5;
    float _1357 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1359 = fma(_1355, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1357);
    bool _1361 = _1341 > 0.0;
    float _1363 = 1.0 / _1359;
    bool _1365 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1367 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1369 = _1365 || _1367;
    bool _1371 = isnan(0.5);
    bool _1373 = _1369 || _1371;
    float _1375 = _1291;
    float _1377 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _1379 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1381 = _1273;
    float _1383 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1385 = _1355;
    float _1387 = _1277;
    float _1389 = _1275;
    float _1391 = _1337;
    if (!_1361)
    {
        _1375 = _1275;
    }
    float _1393 = _1375;
    float _1395 = _1393;
    if (!_1361)
    {
        _1377 = _1277;
    }
    float _1397 = _1377;
    float _1399 = _1397;
    if (!_1361)
    {
        _1379 = _1313;
    }
    float _1401 = _1379;
    bool _1403 = !_1361;
    float _1405 = _1401;
    float _1407 = _1401;
    if (!_1403)
    {
        float _1409 = _189 * _189;
        float _1411 = fma(_187, _187, _1409);
        float _1413 = fma(_191, _191, _1411);
        float _1415 = rsqrt(_1337);
        float _1417 = sqrt(_1413);
        float _1419 = _1299 * _1415;
        float _1421 = _1309 * _1415;
        float _1423 = _1303 * _1415;
        bool _1425 = _1417 > 0.0;
        float _1427 = _1417;
        float _1429 = _1415;
        _1381 = _1423;
        _1383 = _1413;
        if (!_1425)
        {
            _1427 = _1275;
        }
        float _1431 = _1427;
        _1395 = _1431;
        if (!_1425)
        {
            _1405 = _1313;
        }
        float _1433 = _1405;
        _1407 = _1433;
        if (!_1425)
        {
            _1429 = _1277;
        }
        float _1435 = _1429;
        bool _1437 = !_1425;
        _1399 = _1435;
        if (!_1437)
        {
            float _1439 = rsqrt(_1413);
            float _1441 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1443 = _189 * _1439;
            float _1445 = _187 * _1439;
            float _1447 = _191 * _1439;
            float _1449 = _1421 * _1443;
            float _1451 = fma(_1419, _1445, _1449);
            float _1453 = _1441 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1455 = fma(_1423, _1447, _1451);
            float _1457 = _1455 * _1453;
            float _1459 = fma(_187, _1457, _1275);
            float _1461 = fma(_189, _1457, _1313);
            float _1463 = fma(_191, _1457, _1277);
            _1395 = _1459;
            _1407 = _1461;
            _1399 = _1463;
            _1385 = _1441;
        }
    }
    float _1465 = _1395;
    float _1467 = _1407;
    float _1469 = _1399;
    float _1471 = _1381;
    float _1473 = _1383;
    float _1475 = _1385;
    float _1477 = _1473;
    float _1479 = _1469;
    float _1481 = _1475;
    float _1483 = _1471;
    if (_1351)
    {
        _1477 = 1.0;
    }
    float _1485 = _1477;
    float _1487 = _1485;
    if (_1373)
    {
        _1387 = _1465;
    }
    float _1489 = _1387;
    float _1491 = _1489;
    if (_1373)
    {
        _1389 = _1467;
    }
    float _1493 = _1389;
    float _1495 = _1493;
    if (!_1373)
    {
        float _1497 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1499 = _1311 + _1497;
        float _1501 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1503 = _697 + _1501;
        float _1505 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1507 = -_699;
        float _1509 = _1507 + _1469;
        float _1511 = _1499 * _1499;
        float _1513 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1515 = _699 + _1513;
        float _1517 = fma(_1503, _1503, _1511);
        float _1519 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1521 = fma(_1515, _1515, _1517);
        float _1523 = sqrt(_1521);
        float _1525 = _1505 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1527 = precise::min(_1523, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1529 = _1527 * _1519;
        float _1531 = -_1311;
        float _1533 = _1531 + _1467;
        float _1535 = _1525 * _1529;
        float _1537 = -_697;
        float _1539 = _1537 + _1465;
        float _1541 = fma(_1533, _1535, _1311);
        float _1543 = fma(_1539, _1535, _697);
        float _1545 = fma(_1509, _1535, _699);
        _1391 = _1519;
        _1495 = _1541;
        _1491 = _1543;
        _1479 = _1545;
        _1481 = _1523;
    }
    float _1547 = _1391;
    float _1549 = _1495;
    float _1551 = _1491;
    float _1553 = _1479;
    float _1555 = _1481;
    float _1557 = _1555;
    float _1559 = _1547;
    if (_1351)
    {
        _1557 = 1.0;
    }
    float _1561 = _1557;
    float _1563 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1565 = _1363 * _1563;
    float _1567 = _1561;
    if (!_1351)
    {
        float _1569 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1571 = _1569 * 0.15915493667125701904296875;
        float _1573 = _1571 * 6.283185482025146484375;
        float _1575 = cos(_1573);
        float _1577 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1579 = _1577 * 0.15915493667125701904296875;
        float _1581 = _1571 * 6.283185482025146484375;
        float _1583 = sin(_1581);
        float _1585 = 1.0 / _1575;
        float _1587 = _1579 * 6.283185482025146484375;
        float _1589 = cos(_1587);
        float _1591 = _1583 * _1585;
        float _1593 = _1579 * 6.283185482025146484375;
        float _1595 = sin(_1593);
        float _1597 = _1589 * _1591;
        float _1599 = 1.0 / _1597;
        float _1601 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1603 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1601;
        float _1605 = 1.0 / _1603;
        float _1607 = _1595 * _1599;
        float _1609 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1611 = fma(_1565, _1607, _1609);
        float _1613 = _1611 * _1605;
        float _1615 = precise::clamp(_1613, 0.0, 1.0);
        _195 = _1571;
        _1487 = _1615;
    }
    float _1617 = _195;
    float _1619 = _1487;
    float _1621 = _1617;
    if (!_1351)
    {
        float _1623 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1625 = _1623 * 0.15915493667125701904296875;
        float _1627 = _1625 * 6.283185482025146484375;
        float _1629 = cos(_1627);
        float _1631 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1633 = _1631 * 0.15915493667125701904296875;
        float _1635 = _1625 * 6.283185482025146484375;
        float _1637 = sin(_1635);
        float _1639 = 1.0 / _1629;
        float _1641 = _1633 * 6.283185482025146484375;
        float _1643 = cos(_1641);
        float _1645 = _1637 * _1639;
        float _1647 = _1633 * 6.283185482025146484375;
        float _1649 = sin(_1647);
        float _1651 = _1643 * _1645;
        float _1653 = 1.0 / _1651;
        float _1655 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1657 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1655;
        float _1659 = 1.0 / _1657;
        float _1661 = _1649 * _1653;
        float _1663 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1665 = fma(_1565, _1661, _1663);
        float _1667 = _1665 * _1659;
        float _1669 = precise::clamp(_1667, 0.0, 1.0);
        float _1671 = -_1669;
        float _1673 = _1671 + 1.0;
        _1559 = _1653;
        _1567 = _1673;
    }
    float _1675 = _1559;
    float _1677 = _1567;
    float _1679 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1681 = _1549 + _1679;
    float _1683 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1685 = _1551 + _1683;
    float _1687 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1689 = _1553 + _1687;
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
    float _1719 = _1675;
    float _1721 = _1697;
    float _1723 = _1717;
    float _1725 = _1681;
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
    float _1735 = _1729;
    if (_1713)
    {
        float _1737 = _1717 * _1729;
        _1723 = _1737;
    }
    float _1739 = _1723;
    if (_1713)
    {
        float _1741 = _1739 * 0.15915493667125701904296875;
        _1621 = _1741;
    }
    float _1743 = _1621;
    float _1745 = _1689;
    float _1747 = _1743;
    if (_1713)
    {
        float _1749 = _1743 * 6.283185482025146484375;
        float _1751 = sin(_1749);
        _1745 = _1751;
    }
    float _1753 = _1745;
    float _1755 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1757 = precise::max(0.0, _1755);
    float _1759 = _1309;
    if (_1713)
    {
        float _1761 = _1743 * 6.283185482025146484375;
        float _1763 = cos(_1761);
        _1759 = _1763;
    }
    float _1765 = _1759;
    float _1767 = -_1699;
    float _1769 = -_1757;
    float _1771 = fma(_1681, _1767, _1769);
    float _1773 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_1713)
    {
        float _1775 = _1771 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1725 = _1775;
    }
    float _1777 = _1725;
    float _1779 = _1777;
    if (!_1713)
    {
        _1747 = _1771;
    }
    float _1781 = _1747;
    float _1783 = fma(_697, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1785 = _1753;
    float _1787 = _1781;
    if (_1713)
    {
        float _1789 = fma(_1753, _1777, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1735 = _1789;
    }
    float _1791 = _1735;
    float _1793 = _1791;
    if (!_1713)
    {
        _1785 = _1703;
    }
    float _1795 = _1785;
    float _1797 = _1795;
    float _1799 = _1765;
    if (_1713)
    {
        float _1801 = _1765 + (-1.0);
        _1779 = _1801;
    }
    float _1803 = _1779;
    float _1805 = _1803;
    if (_1713)
    {
        float _1807 = _1733 * _1791;
        _1483 = _1807;
    }
    float _1809 = _1483;
    if (!_1713)
    {
        _1793 = _1701;
    }
    float _1811 = _1793;
    float _1813 = sqrt(_1695);
    float _1815 = _1811;
    if (_1713)
    {
        float _1817 = _1803 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1773 = _1817;
    }
    float _1819 = _1773;
    if (_1713)
    {
        float _1821 = _1701 * _1809;
        _1815 = _1821;
    }
    float _1823 = _1815;
    if (!_1713)
    {
        _1805 = _1705;
    }
    float _1825 = _1805;
    float _1827 = _1825;
    if (_1713)
    {
        float _1829 = _1703 * _1809;
        _1797 = _1829;
    }
    float _1831 = _1797;
    if (_1713)
    {
        float _1833 = fma(_1771, _1765, _1819);
        _1787 = _1833;
    }
    float _1835 = _1787;
    if (_1713)
    {
        float _1837 = _1823 * _1823;
        _1827 = _1837;
    }
    float _1839 = _1827;
    float _1841 = _1549 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_1713)
    {
        _1799 = _1707;
    }
    float _1843 = _1799;
    float _1845 = _1843;
    if (_1713)
    {
        float _1847 = _1831 * _1831;
        _1845 = _1847;
    }
    float _1849 = _1845;
    float _1851 = fma(_1835, _1835, _1839);
    float _1853 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1841);
    float _1855 = floor(_1783);
    float _1857 = _1851 + _1849;
    float _1859 = fma(_1553, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1853);
    float _1861 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1863 = fma(_1813, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1861);
    float _1865 = precise::clamp(_1863, 0.0, 1.0);
    float _1867 = _1859 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1869 = _1549 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1871 = rsqrt(_1857);
    float _1873 = -_1865;
    float _1875 = _1873 + 1.0;
    float _1877 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1879 = _1867 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1881 = fma(_699, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1883 = _1549 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1885 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1869);
    float _1887 = -_1879;
    float _1889 = fma(_1887, _1877, 1.0);
    float _1891 = _1549 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1893 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1883);
    float _1895 = abs(_1875);
    float _1897 = log2(_1895);
    float _1899 = fma(_1553, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1885);
    float _1901 = fma(_1551, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1891);
    float _1903 = fma(_1553, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1893);
    float _1905 = -_1855;
    float _1907 = _1783 + _1905;
    float _1909 = _1871 * _1823;
    float _1911 = fma(_1553, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1901);
    float _1913 = _1871 * _1835;
    float _1915 = _1871 * _1831;
    float _1917 = _1909 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1919 = _1911 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1921 = _1903 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1923 = floor(_1881);
    float _1925 = -_1917;
    float _1927 = fma(_1913, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1925);
    float _1929 = _1919 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1931 = _1897 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1933 = _1919 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1935 = -_1915;
    float _1937 = fma(_1935, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1927);
    float _1939 = fma(_1921, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1929);
    float _1941 = log2(_1889);
    float _1943 = fma(_1937, -0.5, 0.5);
    float _1945 = fma(_1867, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1939);
    float _1947 = fma(_1921, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1933);
    float _1949 = exp2(_1931);
    float _1951 = _1899 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1953 = -_1923;
    float _1955 = _1881 + _1953;
    float _1957 = fma(_1951, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1945);
    float _1959 = _1919 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1961 = sqrt(_1943);
    float _1963 = fma(_1937, 0.5, 0.5);
    float _1965 = fma(_1921, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1959);
    float _1967 = _1913 + 1.0;
    float _1969 = _1941 * 0.693147182464599609375;
    float _1971 = fma(_1963, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1973 = fma(_1867, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1965);
    float _1975 = 1.0 / _1957;
    float _1977 = fma(_1867, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1947);
    float _1979 = fma(_1963, _1971, -0.212114393711090087890625);
    float _1981 = fma(_1951, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1973);
    float2 _5543 = float2(_1907, _1955);
    float _1983 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5543, float2(0.0), isnan(_5543)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5543, float2(0.0), isnan(_5543)), level(0.0)).x;
    float _1985 = fma(_1951, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1977);
    float _1987 = fma(_1963, _1979, 1.570728778839111328125);
    float _1989 = -_1913;
    float _1991 = fma(_1949, _1967, _1989);
    float _1993 = _1961 * 0.636619746685028076171875;
    float _1995 = -_1987;
    float _1997 = fma(_1993, _1995, 1.0);
    float _1999 = fma(_1991, 0.5, 0.5);
    float _2001 = _1985 * _1975;
    float _2003 = _1981 * _1975;
    float _2005 = _1969 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2007 = fma(_2001, 0.5, 0.5);
    float _2009 = fma(_2003, -0.5, 0.5);
    float3 _5591 = float3(_2007, _2009, _2005);
    float _2011 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5591, float3(0.0), isnan(_5591)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5591, float3(0.0), isnan(_5591)), level(0.0)).x;
    float3 _5602 = float3(_2007, _2009, _2005);
    float4 _2014 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5602, float3(0.0), isnan(_5602)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5602, float3(0.0), isnan(_5602)), level(0.0)).xyzw;
    float _2016 = _2014.x;
    float _2018 = _2014.y;
    float _2020 = _2014.z;
    float _2022 = _2014.w;
    float2 _5618 = float2(_1997, _1999);
    float3 _2026 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5618, float2(0.0), isnan(_5618)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5618, float2(0.0), isnan(_5618)), level(0.0)).xyz;
    float _2028 = _2026.x;
    float _2030 = _2026.y;
    float _2032 = _2026.z;
    float _2034 = abs(_1565);
    float _2036 = log2(_2034);
    float _2038 = _1919 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_82.x = _1551;
    out.m_82.y = _1549;
    out.m_82.z = _1553;
    bool _2040 = _1813 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2042 = isnan(_1813);
    bool _2044 = _2040 || _2042;
    bool _2046 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2048 = _2044 || _2046;
    float _2050 = fma(_1921, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2038);
    float _2052 = fma(_1867, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2050);
    float _2054 = in.m_64.x;
    float _2056 = fma(_1951, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2052);
    float _2058 = _2036 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2060 = exp2(_2058);
    float _2062 = fma(_2060, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2064 = precise::clamp(_2062, 0.0, 1.0);
    float _2066 = fma(_2064, -2.0, 3.0);
    float _2068 = _2064 * _2064;
    float _2070 = _2068 * _2066;
    float _2072 = _1897 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2074 = _1565 <= 8000.0;
    bool _2076 = isnan(_1565);
    bool _2078 = _2074 || _2076;
    bool _2080 = isnan(8000.0);
    bool _2082 = _2078 || _2080;
    float _2084 = float(_2082);
    float _2086 = -_2070;
    float _2088 = _2086 + 1.0;
    float _2090 = exp2(_2072);
    float _2092 = fma(_2088, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2070);
    float _2094 = _2056 + _1957;
    out.gl_Position.x = _1985;
    out.gl_Position.y = _1981;
    out.gl_Position.z = _2056;
    out.gl_Position.w = _1957;
    float _2096 = _2084 * _2092;
    float _2098 = _2094 * 0.5;
    float _2100 = _2096 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_84.z = _2098;
    out.m_84.w = _1957;
    float _2102 = -_2090;
    float _2104 = _2102 + 1.0;
    float _2106 = _1957;
    float _2108 = _2056;
    float _2110 = _1981;
    float _2112 = _1985;
    if (!_2048)
    {
        _2106 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2114 = _2106;
    float _2116 = _2114;
    float _2118 = _2114;
    if (!_2048)
    {
        _2108 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2120 = _2108;
    float _2122 = _2104 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2124 = _2120;
    float _2126 = _2120;
    if (!_2048)
    {
        _2110 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2128 = _2110;
    float _2130 = _2128;
    float _2132 = _2128;
    if (!_2048)
    {
        _2112 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2134 = _2112;
    float _2136 = -_1983;
    float _2138 = _2136 + 1.0;
    float _2140 = _2138 * _2100;
    float _2142 = precise::clamp(_2140, 0.0, 1.0);
    float _2144 = -_2142;
    float _2146 = fma(_2144, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2148 = _1619 * _1677;
    float _2150 = _2146 * _2054;
    float _2152 = _2150 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2154 = _2122 * _2011;
    float _2156 = -_2122;
    float _2158 = _2156 + 1.0;
    out.m_86.x = _2152;
    float _2160 = _2022 * _2154;
    float _2162 = _2032 * _2154;
    float _2164 = _2022 * _2158;
    float _2166 = fma(_2028, _2160, _2016);
    float _2168 = fma(_2030, _2160, _2018);
    float _2170 = fma(_2022, _2162, _2020);
    float _2172 = _2148 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2174 = _2016;
    float _2176 = _2148;
    float _2178 = _2134;
    float _2180 = _2134;
    if (!_2048)
    {
        _2174 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2182 = _2174;
    float _2184 = _2182;
    float _2186 = _2182;
    if (!_2048)
    {
        _2176 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2188 = _2176;
    out.m_88.x = _2166;
    out.m_88.y = _2168;
    out.m_88.z = _2170;
    out.m_88.w = _2164;
    bool _2190 = !_2048;
    float _2192 = _2188;
    float _2194 = _2188;
    if (!_2190)
    {
        bool _2196 = _1813 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2198 = isnan(_1813);
        bool _2200 = _2196 || _2198;
        bool _2202 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2204 = _2200 || _2202;
        if (!_2204)
        {
            float _2206 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2208 = _1813 + _2206;
            float _2210 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2212 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2210;
            float _2214 = 1.0 / _2212;
            float _2216 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2218 = _2216 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2220 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2222 = _2220 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2224 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2226 = _2224 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2228 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2230 = _2228 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2232 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2234 = _2232 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2236 = _2208 * _2214;
            float _2238 = precise::clamp(_2236, 0.0, 1.0);
            float _2240 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2242 = _2240 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2244 = fma(_2238, _2218, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2246 = fma(_2238, _2242, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2248 = fma(_2238, _2222, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2250 = fma(_2238, _2226, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2252 = fma(_2238, _2230, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2254 = fma(_2238, _2234, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2118 = _2246;
            _2180 = _2252;
            _2186 = _2244;
            _2132 = _2250;
            _2126 = _2248;
            _2194 = _2254;
            _2256 = true;
        }
        else
        {
            bool _2258 = _1813 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2260 = isnan(_1813);
            bool _2262 = _2258 || _2260;
            bool _2264 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2266 = _2262 || _2264;
            if (!_2266)
            {
                _2184 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2268 = _2184;
            _2186 = _2268;
            if (!_2266)
            {
                _2116 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2270 = _2116;
            _2118 = _2270;
            if (!_2266)
            {
                _2124 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2272 = _2124;
            _2126 = _2272;
            if (!_2266)
            {
                _2130 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2274 = _2130;
            _2132 = _2274;
            if (!_2266)
            {
                _2178 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2276 = _2178;
            _2180 = _2276;
            if (!_2266)
            {
                _2192 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2278 = _2192;
            bool _2280 = !_2266;
            _2194 = _2278;
            if (!_2280)
            {
                bool _2282 = _1813 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2284 = isnan(_1813);
                bool _2286 = _2282 || _2284;
                bool _2288 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2290 = _2286 || _2288;
                if (!_2290)
                {
                    float _2292 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2294 = _1813 + _2292;
                    float _2296 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2298 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2296;
                    float _2300 = 1.0 / _2298;
                    float _2302 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2304 = _2302 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2306 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2308 = _2306 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2310 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2312 = _2310 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2314 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2316 = _2314 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2318 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2320 = _2318 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2322 = _2294 * _2300;
                    float _2324 = precise::clamp(_2322, 0.0, 1.0);
                    float _2326 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2328 = _2326 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2330 = fma(_2324, _2304, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2332 = fma(_2324, _2328, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2334 = fma(_2324, _2308, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2336 = fma(_2324, _2312, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2338 = fma(_2324, _2316, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2340 = fma(_2324, _2320, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2118 = _2332;
                    _2180 = _2338;
                    _2186 = _2330;
                    _2132 = _2336;
                    _2126 = _2334;
                    _2194 = _2340;
                    _2256 = true;
                }
                else
                {
                    _2118 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2180 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2186 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2132 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2126 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2194 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2256 = false;
    float _2342 = _2118;
    float _2344 = _2180;
    float _2346 = _2186;
    float _2348 = _2132;
    float _2350 = _2126;
    float _2352 = _2194;
    float _2354 = fma(_1187, -0.5, 0.5);
    float _2356 = precise::clamp(_2354, 0.0, 1.0);
    float _2358 = -_2342;
    float _2360 = _2358 + _2344;
    float _2362 = _2172 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2364 = -_2346;
    float _2366 = _2364 + _2348;
    out.m_90.x = 0.0;
    float _2368 = fma(_2356, _2360, _2342);
    float _2370 = fma(_2356, _2366, _2346);
    out.m_53.x = _2362;
    float _2372 = -_2350;
    float _2374 = _2372 + _2352;
    float _2376 = _2368 * 0.586610972881317138671875;
    bool _2378 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2380 = fma(_2356, _2374, _2350);
    float _2382 = fma(_2370, 0.298911988735198974609375, _2376);
    bool _2384 = _1619 > 0.0;
    bool _2386 = isnan(_1619);
    bool _2388 = _2384 || _2386;
    bool _2390 = isnan(0.0);
    bool _2392 = _2388 || _2390;
    float _2394 = fma(_2380, 0.114477999508380889892578125, _2382);
    bool _2396 = _1677 <= 0.0;
    bool _2398 = !_2392;
    bool _2400 = _2396 || _2398;
    float _2402 = -_2394;
    float _2404 = _2370 + _2402;
    float _2406 = -_2394;
    float _2408 = _2368 + _2406;
    float _2410 = -_2394;
    float _2412 = _2380 + _2410;
    float _2414 = fma(_2404, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2394);
    float _2416 = fma(_2408, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2394);
    float _2418 = fma(_2412, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2394);
    bool _2420 = !_2378;
    if (!_2420)
    {
        float _2422 = -_1549;
        float _2424 = _2422 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2426 = -_1551;
        float _2428 = _2426 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2430 = -_1553;
        float _2432 = _2430 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2434 = _2424 * _2424;
        float _2436 = fma(_2428, _2428, _2434);
        float _2438 = fma(_2432, _2432, _2436);
        float _2440 = sqrt(_2438);
        float _2442 = rsqrt(_2438);
        float _2444 = -_2440;
        float _2446 = _2444 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2448 = _2446 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2450 = precise::clamp(_2448, 0.0, 1.0);
        float _2452 = _2428 * _2442;
        float _2454 = _2424 * _2442;
        float _2456 = abs(_2450);
        float _2458 = log2(_2456);
        float _2460 = _2432 * _2442;
        float _2462 = _2452 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2464 = _1187 * _2454;
        float _2466 = -_2454;
        float _2468 = -_2462;
        float _2470 = fma(_2466, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2468);
        float _2472 = fma(_1185, _2452, _2464);
        float _2474 = -_2460;
        float _2476 = fma(_2474, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2470);
        float _2478 = fma(_1189, _2460, _2472);
        float _2480 = precise::clamp(_2478, 0.0, 1.0);
        float _2482 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2484 = _2476 + _2482;
        float _2486 = _2458 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2488 = _2484 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2490 = precise::clamp(_2488, 0.0, 1.0);
        float _2492 = exp2(_2486);
        float _2494 = _2492 * _2490;
        float _2496 = _2480 * _2494;
        float _2498 = _2496 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2500 = _2496 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2502 = _2496 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_90.x = _2498;
        out.m_90.y = _2500;
        out.m_90.z = _2502;
    }
    out.m_92.x = _2414;
    out.m_92.y = _2416;
    out.m_92.z = _2418;
    if (!_2400)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_53.x = 0.0;
    float _2504 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2504;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

