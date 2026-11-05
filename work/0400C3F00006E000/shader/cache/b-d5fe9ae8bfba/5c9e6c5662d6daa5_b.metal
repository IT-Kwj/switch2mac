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
    constant _16* vp_c13 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture2d<float> vp_t_tcb_28 [[id(6)]];
    sampler vp_t_tcb_28Smplr [[id(7)]];
    texture2d<float> vp_t_tcb_24 [[id(8)]];
    sampler vp_t_tcb_24Smplr [[id(9)]];
    sampler vp_t_tcb_28Smplr_w [[id(10)]];
    sampler vp_t_tcb_24Smplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_66 [[user(locn0)]];
    float4 m_68 [[user(locn1)]];
    float4 m_64 [[user(locn2)]];
    float4 m_78 [[user(locn3)]];
    float4 m_88 [[user(locn4)]];
    float4 m_42 [[user(locn5)]];
    float4 m_76 [[user(locn6)]];
    float4 m_80 [[user(locn7)]];
    float4 m_82 [[user(locn8)]];
    float4 m_74 [[user(locn9)]];
    float4 m_86 [[user(locn10)]];
    float4 m_84 [[user(locn11)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_62 [[attribute(0)]];
    float4 m_48 [[attribute(1)]];
    float4 m_46 [[attribute(2)]];
    float4 m_50 [[attribute(3)]];
    float4 m_39 [[attribute(5)]];
    float4 m_44 [[attribute(6)]];
    float4 m_72 [[attribute(7)]];
    float4 m_56 [[attribute(8)]];
    float4 m_52 [[attribute(9)]];
    float4 m_60 [[attribute(10)]];
    float4 m_70 [[attribute(11)]];
    float4 m_58 [[attribute(12)]];
    float4 m_54 [[attribute(13)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2752 = false;
    bool _339 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _102 = in.m_39.w;
    float _104 = trunc(_102);
    int _107 = int(_104);
    bool _111 = _107 >= 1;
    float _113 = 0.0;
    float _115 = as_type<float>(_107);
    if (!_111)
    {
        _113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _113;
    if (!_111)
    {
        out.m_42.x = 0.0;
    }
    int _119 = 0;
    if (!_111)
    {
        float _121 = _117 * 5.0;
        _119 = as_type<int>(_121);
    }
    int _123 = _119;
    int _125 = _123;
    if (!_111)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3038 = as_type<float>(_123);
        out.gl_Position.z = _3038;
    }
    if (!_111)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _127 = in.m_44.w;
    float _129 = float(_107);
    float _131 = -_127;
    float _133 = _131 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = _127 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = isnan(_127);
    bool _139 = _135 || _137;
    bool _141 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _143 = _139 || _141;
    bool _145 = _133 >= _129;
    bool _147 = !_143;
    bool _149 = _145 || _147;
    if (_149)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _151 = _115;
    if (_149)
    {
        out.m_42.x = 0.0;
    }
    if (_149)
    {
        float _153 = _151 * 5.0;
        _125 = as_type<int>(_153);
    }
    int _155 = _125;
    if (_149)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3101 = as_type<float>(_155);
        out.gl_Position.z = _3101;
    }
    if (_149)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _157 = in.m_46.x;
    float _159 = in.m_46.y;
    float _161 = in.m_46.z;
    float _163 = 1.0 / _129;
    float _165 = in.m_48.x;
    float _167 = in.m_48.y;
    float _169 = in.m_48.z;
    float _171 = in.m_50.x;
    float _173 = in.m_50.y;
    float _175 = in.m_50.z;
    float _177 = _133 * _163;
    float _179 = _157 * _157;
    float _181 = _159 * _159;
    float _183 = _161 * _161;
    float _185 = fma(_165, _165, _179);
    float _187 = fma(_167, _167, _181);
    float _189 = fma(_169, _169, _183);
    float _191 = fma(_171, _171, _185);
    float _193 = fma(_173, _173, _187);
    float _195 = fma(_175, _175, _189);
    float _197 = sqrt(_191);
    float _199 = sqrt(_193);
    float _201 = sqrt(_195);
    bool _203 = _197 > 0.0;
    bool _205 = _199 > 0.0;
    float _207 = _199;
    float _209 = _197;
    if (_203)
    {
        float _211 = rsqrt(_191);
        _207 = _211;
    }
    float _213 = _207;
    float _215 = 0.0;
    if (!_203)
    {
        _215 = 0.0;
    }
    float _217 = _215;
    bool _219 = _201 > 0.0;
    float _221 = 0.0;
    float _223 = _217;
    if (!_203)
    {
        _221 = 0.0;
    }
    float _225 = _221;
    float _227 = 0.0;
    float _229 = _225;
    if (!_203)
    {
        _227 = 0.0;
    }
    float _231 = _227;
    float _233 = _201;
    float _235 = _231;
    if (_205)
    {
        float _237 = rsqrt(_193);
        _233 = _237;
    }
    float _239 = _233;
    float _241 = 0.0;
    if (!_205)
    {
        _241 = 0.0;
    }
    float _243 = _241;
    float _245 = _243;
    if (!_205)
    {
        _209 = 0.0;
    }
    float _247 = _209;
    float _249 = 0.0;
    float _251 = _247;
    if (_219)
    {
        float _253 = rsqrt(_195);
        _249 = _253;
    }
    float _255 = _249;
    float _257 = _213;
    if (_203)
    {
        float _259 = _213 * _157;
        _223 = _259;
    }
    float _261 = _223;
    if (_203)
    {
        float _263 = _213 * _165;
        _229 = _263;
    }
    float _265 = _229;
    if (_203)
    {
        float _267 = _213 * _171;
        _235 = _267;
    }
    float _269 = _235;
    bool _271 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    if (!_205)
    {
        _257 = 0.0;
    }
    float _273 = _257;
    float _275 = 0.0;
    float _277 = _273;
    if (!_219)
    {
        _275 = 0.0;
    }
    float _279 = _275;
    float _281 = _279;
    if (_205)
    {
        float _283 = _239 * _159;
        _245 = _283;
    }
    float _285 = _245;
    float _287 = 0.0;
    if (!_219)
    {
        _287 = 0.0;
    }
    float _289 = _287;
    float _291 = _289;
    if (_205)
    {
        float _293 = _239 * _167;
        _251 = _293;
    }
    float _295 = _251;
    float _297 = 0.0;
    if (!_219)
    {
        _297 = 0.0;
    }
    float _299 = _297;
    float _301 = _299;
    if (_205)
    {
        float _303 = _239 * _173;
        _277 = _303;
    }
    float _305 = _277;
    if (_219)
    {
        float _307 = _255 * _161;
        _281 = _307;
    }
    float _309 = _281;
    if (_219)
    {
        float _311 = _255 * _169;
        _291 = _311;
    }
    float _313 = _291;
    if (_219)
    {
        float _315 = _255 * _175;
        _301 = _315;
    }
    float _317 = _301;
    bool _319 = !_271;
    float _337;
    if (!_319)
    {
        float _321 = in.m_52.x;
        float _323 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _325 = _321 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _327 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[12].x, _133);
        float _329 = _327 * _323;
        float _331 = floor(_329);
        float _333 = -_331;
        float _335 = _329 + _333;
        _337 = _335;
        _339 = true;
    }
    else
    {
        _337 = _177;
    }
    _339 = false;
    float _341 = _337;
    float _343 = in.m_54.x;
    float _345 = in.m_54.y;
    float _347 = _133 * (*spvDescriptorSet0.vp_c9)._m0[193].y;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _351 = _341 + _349;
    float _353 = in.m_52.x;
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _357 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _355;
    float _359 = in.m_39.x;
    float _361 = in.m_39.y;
    float _363 = in.m_39.z;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _367 = _365 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _369 = 1.0 / _357;
    float _371 = in.m_52.y;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _375 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _373;
    float _377 = 1.0 / _367;
    bool _379 = _341 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _381 = isnan(_341);
    bool _383 = _379 || _381;
    bool _385 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _387 = _383 || _385;
    float _389 = float(_387);
    bool _391 = _341 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _393 = isnan(_341);
    bool _395 = _391 || _393;
    bool _397 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _399 = _395 || _397;
    float _401 = float(_399);
    float _403 = abs(_343);
    float _405 = log2(_403);
    float _407 = fma(_353, 6.283185482025146484375, _347);
    float _409 = _351 * _369;
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _413 = _341 + _411;
    float _415 = fma((*spvDescriptorSet0.vp_c9)._m0[194].y, 0.01745329238474369049072265625, _407);
    float _417 = _167 * _361;
    float _419 = _173 * _361;
    float _421 = 1.0 / _375;
    float _423 = _415 * 0.60000002384185791015625;
    float _425 = _415 * 1.2999999523162841796875;
    float _427 = fma(_165, _359, _417);
    float _429 = _423 * 0.15915493667125701904296875;
    float _431 = _425 * 0.15915493667125701904296875;
    float _433 = fma(_171, _359, _419);
    float _435 = _405 * (*spvDescriptorSet0.vp_c9)._m0[193].z;
    float _437 = _429 * 6.283185482025146484375;
    float _439 = sin(_437);
    float _441 = _415 + 0.52359879016876220703125;
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _445 = _443 + (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _447 = _415 * 0.15915493667125701904296875;
    float _449 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _451 = _341 + _449;
    float _453 = _441 * 0.15915493667125701904296875;
    float _455 = fma(_415, 0.60000002384185791015625, 0.31415927410125732421875);
    float _457 = _371 * 628.31854248046875;
    float _459 = exp2(_435);
    float _461 = fma(_445, _353, (*spvDescriptorSet0.vp_c9)._m0[191].x);
    float _463 = _451 * _377;
    float _465 = _413 * _421;
    float _467 = fma(_415, 1.2999999523162841796875, 0.680678427219390869140625);
    float _469 = fma(_133, _461, _457);
    float _471 = _431 * 6.283185482025146484375;
    float _473 = sin(_471);
    float _475 = _467 * 0.15915493667125701904296875;
    float _477 = _455 * 0.15915493667125701904296875;
    float _479 = _447 * 6.283185482025146484375;
    float _481 = sin(_479);
    float _483 = (*spvDescriptorSet0.vp_c9)._m0[193].w * 3.1415927410125732421875;
    float _485 = _475 * 6.283185482025146484375;
    float _487 = sin(_485);
    float _489 = fma(_483, _459, _347);
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _493 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _491;
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _497 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _495;
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _501 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _499;
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _505 = _503 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _507 = fma(_493, _409, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _509 = fma(_497, _409, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _511 = in.m_56.x;
    float _513 = in.m_56.y;
    float _515 = in.m_56.z;
    float _517 = fma(_501, _409, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _521 = _519 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _525 = _523 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _527 = fma(_505, _463, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _529 = fma(_439, 0.60000002384185791015625, _481);
    float _531 = fma(_343, 0.261799395084381103515625, -0.261799395084381103515625);
    float _533 = fma(_521, _463, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _535 = fma(_525, _463, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _537 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _539 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _537;
    float _541 = _469 + _531;
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _545 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _543;
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _549 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _547;
    bool _551 = _341 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _553 = isnan(_341);
    bool _555 = _551 || _553;
    bool _557 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _559 = _555 || _557;
    float _561 = float(_559);
    float _563 = _541 * 0.89999997615814208984375;
    float _565 = fma(_539, _465, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _567 = fma(_545, _465, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _569 = fma(_549, _465, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _571 = _563 * 0.15915493667125701904296875;
    float _573 = _541 * 1.10000002384185791015625;
    bool _575 = _341 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _577 = isnan(_341);
    bool _579 = _575 || _577;
    bool _581 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _583 = _579 || _581;
    float _585 = float(_583);
    float _587 = -_561;
    float _589 = _587 + 1.0;
    float _591 = _453 * 6.283185482025146484375;
    float _593 = sin(_591);
    bool _595 = _511 > 0.0;
    float _597 = _573 * 0.15915493667125701904296875;
    float _599 = _585 * _589;
    float _601 = _541 * 0.699999988079071044921875;
    float _603 = -_585;
    float _605 = _603 + 1.0;
    bool _607 = _511 >= 0.0;
    bool _609 = isnan(_511);
    bool _611 = _607 || _609;
    bool _613 = isnan(0.0);
    bool _615 = _611 || _613;
    float _617 = fma(_353, 6.283185482025146484375, _489);
    float _619 = _477 * 6.283185482025146484375;
    float _621 = sin(_619);
    float _623 = _601 * 0.15915493667125701904296875;
    float _625 = _389 * _605;
    float _627 = -_389;
    float _629 = _627 + 1.0;
    int _631 = _615 ? 0 : 1;
    float _633 = _617 * 0.60000002384185791015625;
    float _635 = fma(_473, 0.300000011920928955078125, _529);
    float _637 = _401 * _629;
    int _639 = ~_631;
    int _641 = _639 + 1;
    int _643 = _641 + 1;
    float _645 = _617 * 0.15915493667125701904296875;
    int _647 = _643;
    if (!_595)
    {
        int _649 = ~_631;
        int _651 = _649 + 1;
        _647 = _651;
    }
    int _653 = _647;
    float _655 = _633 * 0.15915493667125701904296875;
    float _657 = _617 * 1.2999999523162841796875;
    float _659 = _509 * _637;
    float _661 = _507 * _637;
    float _663 = -_401;
    float _665 = _663 + 1.0;
    float _667 = fma(_621, 0.60000002384185791015625, _593);
    float _669 = _517 * _637;
    float _671 = -_343;
    float _673 = _671 + 1.0;
    float _675 = fma(_665, (*spvDescriptorSet0.vp_c9)._m0[143].x, _659);
    float _677 = fma(_487, 0.300000011920928955078125, _667);
    float _679 = fma(_665, (*spvDescriptorSet0.vp_c9)._m0[143].y, _661);
    float _681 = _645 * 6.283185482025146484375;
    float _683 = sin(_681);
    float _685 = _657 * 0.15915493667125701904296875;
    float _687 = fma(_665, (*spvDescriptorSet0.vp_c9)._m0[143].z, _669);
    float _689 = fma(_533, _625, _679);
    float _691 = -_345;
    float _693 = _691 + 1.0;
    float _695 = in.m_58.y;
    float _697 = _635 * _673;
    float _699 = _541 * 0.15915493667125701904296875;
    float _701 = _655 * 6.283185482025146484375;
    float _703 = sin(_701);
    float _705 = fma(_527, _625, _675);
    float _707 = fma(_535, _625, _687);
    float _709 = abs(_677);
    float _711 = _693 * _709;
    float _713 = in.m_60.x;
    float _715 = in.m_60.y;
    float _717 = in.m_60.z;
    float _719 = _697 * 0.52359879016876220703125;
    float _721 = fma(_565, _599, _705);
    float _723 = fma(_569, _599, _707);
    float _725 = _685 * 6.283185482025146484375;
    float _727 = sin(_725);
    float _729 = float(_653);
    float _731 = _719 * 0.15915493667125701904296875;
    float _733 = _711 * (-45.0);
    float _735 = _469 * 0.89999997615814208984375;
    float _737 = _469 * 0.15915493667125701904296875;
    float _739 = _571 * 6.283185482025146484375;
    float _741 = sin(_739);
    float _743 = fma(_567, _599, _689);
    float _745 = _711 * (-20.0);
    float _747 = fma(_703, 0.60000002384185791015625, _683);
    float _749 = _733 * 0.01745329238474369049072265625;
    float _751 = fma(_561, (*spvDescriptorSet0.vp_c9)._m0[146].x, _721);
    float _753 = _729 * _745;
    float _755 = fma(_561, (*spvDescriptorSet0.vp_c9)._m0[146].y, _743);
    float _757 = _699 * 6.283185482025146484375;
    float _759 = sin(_757);
    float _761 = fma(_727, 0.300000011920928955078125, _747);
    float _763 = _753 * 0.01745329238474369049072265625;
    float _765 = _749 * 0.15915493667125701904296875;
    float _767 = fma(_561, (*spvDescriptorSet0.vp_c9)._m0[146].z, _723);
    float _769 = _751 * _713;
    float _771 = _763 * 0.15915493667125701904296875;
    float _773 = fma(_695, 0.5, 0.5);
    float _775 = _623 * 6.283185482025146484375;
    float _777 = cos(_775);
    float _779 = _741 * 0.89999997615814208984375;
    float _781 = _735 * 0.15915493667125701904296875;
    float _783 = _773 * _761;
    float _785 = _755 * _715;
    float _787 = _783 * (*spvDescriptorSet0.vp_c9)._m0[193].x;
    float _789 = _597 * 6.283185482025146484375;
    float _791 = cos(_789);
    float _793 = -_779;
    float _795 = fma(_759, -1.2000000476837158203125, _793);
    float _797 = _767 * _717;
    float _799 = _787 * 0.01745329238474369049072265625;
    float _801 = abs(_795);
    bool _803 = _801 > 0.001000000047497451305389404296875;
    bool _805 = isnan(_801);
    bool _807 = _803 || _805;
    bool _809 = isnan(0.001000000047497451305389404296875);
    bool _811 = _807 || _809;
    float _813 = _799 * 0.15915493667125701904296875;
    float _815 = _731 * 6.283185482025146484375;
    float _817 = sin(_815);
    float _819 = _777 * 0.699999988079071044921875;
    float _821 = _811 ? _795 : 0.001000000047497451305389404296875;
    float _823 = _731 * 6.283185482025146484375;
    float _825 = cos(_823);
    float _827 = fma(_791, 1.10000002384185791015625, _819);
    float _829 = _513 + (-0.0199999995529651641845703125);
    float _831 = abs(_827);
    bool _833 = _831 != 0.0;
    bool _835 = isnan(_831);
    bool _837 = _833 || _835;
    bool _839 = isnan(0.0);
    bool _841 = _837 || _839;
    float _843 = _765 * 6.283185482025146484375;
    float _845 = sin(_843);
    float _847 = _817 * _511;
    float _849 = abs(_821);
    bool _851 = _849 == 0.0;
    bool _853 = !_841;
    bool _855 = _851 && _853;
    float _857 = _765 * 6.283185482025146484375;
    float _859 = cos(_857);
    float _861 = -_847;
    float _863 = fma(_825, _515, _861);
    float _865 = _825 * _511;
    float _867 = _863 + 0.02999999932944774627685546875;
    float _869 = fma(_817, _515, _865);
    float _871 = _771 * 6.283185482025146484375;
    float _873 = sin(_871);
    float _875 = _845 * _867;
    int _877 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _879 = _877 != 0;
    int _881 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _883 = _881 != 0;
    int _885 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _887 = _885 != 0;
    float _889 = abs(_821);
    bool _891 = _889 == 0.0;
    bool _893 = _219;
    int _895 = as_type<int>(_869);
    float _897 = _813;
    if (_855)
    {
        bool _899 = as_type<int>(_821) >= 0;
        _893 = _899;
    }
    bool _901 = _893;
    float _903 = _771 * 6.283185482025146484375;
    float _905 = cos(_903);
    float _907 = -_875;
    float _909 = fma(_859, _829, _907);
    float _911 = _859 * _867;
    bool _913 = !_883;
    int _915 = _913 ? 0 : 1;
    float _917 = _737 * 6.283185482025146484375;
    float _919 = cos(_917);
    float _921 = fma(_729, -0.100000001490116119384765625, _869);
    float _923 = _909 * _873;
    int _925 = _901 ? (-1) : 0;
    if (_855)
    {
        int _927 = _901 ? 0 : 1078530011;
        _895 = _927;
    }
    int _929 = _895;
    float _931 = _781 * 6.283185482025146484375;
    float _933 = cos(_931);
    float _935 = _909 * _905;
    float _937 = -_923;
    float _939 = fma(_905, _921, _937);
    bool _941 = !_879;
    int _943 = _941 ? 0 : 1;
    float _945 = fma(_873, _921, _935);
    bool _947 = !_887;
    int _949 = _947 ? 0 : 1;
    float _951 = _469 * 0.699999988079071044921875;
    float _953 = _813 * 6.283185482025146484375;
    float _955 = sin(_953);
    float _957 = _813 * 6.283185482025146484375;
    float _959 = cos(_957);
    int _961 = _929;
    if (_855)
    {
        int _963 = int(0x80000000) & as_type<int>(_827);
        int _965 = _929 | _963;
        _897 = as_type<float>(_965);
    }
    float _967 = _897;
    bool _969 = !_841;
    bool _971 = _969 && _891;
    float _973 = _967;
    float _975 = _967;
    if (!_971)
    {
        float _977 = abs(_827);
        bool _979 = _977 != as_type<float>(0x7f800000u /* inf */);
        bool _981 = isnan(_977);
        bool _983 = _979 || _981;
        bool _985 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _987 = _983 || _985;
        float _989 = abs(_821);
        bool _991 = _989 == as_type<float>(0x7f800000u /* inf */);
        float _993 = abs(_821);
        bool _995 = _993 == as_type<float>(0x7f800000u /* inf */);
        bool _997 = !_987;
        bool _999 = _995 && _997;
        if (_999)
        {
            bool _1001 = as_type<int>(_821) >= 0;
            _925 = _1001 ? (-1) : 0;
        }
        int _1003 = _925;
        if (_999)
        {
            _961 = 1075235812;
        }
        int _1005 = _961;
        int _1007 = _1005;
        if (_999)
        {
            int _1009 = ~_1003;
            int _1011 = (_1009 != 0) ? _1005 : 1061752795;
            _1007 = _1011;
        }
        int _1013 = _1007;
        if (_999)
        {
            int _1015 = int(0x80000000) & as_type<int>(_827);
            int _1017 = _1013 | _1015;
            _973 = as_type<float>(_1017);
        }
        float _1019 = _973;
        bool _1021 = !_987;
        bool _1023 = _1021 && _991;
        _975 = _1019;
        if (!_1023)
        {
            float _1025 = abs(_827);
            float _1027 = abs(_821);
            float _1029 = precise::max(_1025, _1027);
            float _1031 = abs(_827);
            float _1033 = abs(_821);
            float _1035 = precise::min(_1031, _1033);
            float _1037 = 1.0 / _1029;
            float _1039 = abs(_827);
            float _1041 = abs(_821);
            bool _1043 = _1039 > _1041;
            bool _1045 = as_type<int>(_821) >= 0;
            float _1047 = _1035 * _1037;
            float _1049 = abs(_827);
            float _1051 = abs(_821);
            float _1053 = _1049 + _1051;
            int _1055 = as_type<int>(_827) & int(0x80000000);
            float _1057 = _1047 * _1047;
            bool _1059 = _1053 > as_type<float>(0x7f800000u /* inf */);
            bool _1061 = isnan(_1053);
            bool _1063 = _1059 || _1061;
            bool _1065 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1067 = _1063 || _1065;
            float _1069 = _1057 + 11.33538818359375;
            float _1071 = fma(_1057, _1069, 28.84246826171875);
            float _1073 = fma(_1057, _1071, 19.6966705322265625);
            float _1075 = fma(_1057, -0.82336294651031494140625, -5.674867153167724609375);
            float _1077 = fma(_1057, _1075, -6.565555095672607421875);
            float _1079 = 1.0 / _1073;
            float _1081 = _1057 * _1077;
            float _1083 = _1047 * _1081;
            float _1085 = fma(_1083, _1079, _1047);
            float _1087 = _1085;
            _975 = _1053;
            if (_1043)
            {
                float _1089 = -_1085;
                float _1091 = _1089 + 1.57079637050628662109375;
                _1087 = _1091;
            }
            float _1093 = _1087;
            int _1095 = as_type<int>(_1093);
            if (!_1045)
            {
                float _1097 = -_1093;
                float _1099 = _1097 + 3.1415927410125732421875;
                _1095 = as_type<int>(_1099);
            }
            int _1101 = _1095;
            if (!_1067)
            {
                int _1103 = _1055 | _1101;
                _975 = as_type<float>(_1103);
            }
        }
    }
    float _1105 = _975;
    float _1107 = _945 + 0.0199999995529651641845703125;
    float _1109 = fma(_729, 0.100000001490116119384765625, _939);
    float _1111 = _951 * 0.15915493667125701904296875;
    float _1113 = in.m_52.z;
    float _1115 = _1107 * _955;
    float _1117 = _1107 * _959;
    float _1119 = _1105 + 1.57079637050628662109375;
    float _1121 = in.m_48.w;
    float _1123 = -_1115;
    float _1125 = fma(_1109, _959, _1123);
    float _1127 = fma(_845, _829, _911);
    float _1129 = fma(_1109, _955, _1117);
    float _1131 = _1119 * (-0.15915493667125701904296875);
    float _1133 = fma(_635, (*spvDescriptorSet0.vp_c9)._m0[194].x, _1125);
    float _1135 = _1127 + (-0.02999999932944774627685546875);
    float _1137 = _469 * 1.10000002384185791015625;
    float _1139 = _797 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1141 = in.m_50.w;
    float _1143 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1135);
    float _1145 = _769 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1147 = _1131 * 6.283185482025146484375;
    float _1149 = cos(_1147);
    float _1151 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1133);
    float _1153 = _1139 * _1143;
    float _1155 = _785 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1157 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1129);
    float _1159 = _1137 * 0.15915493667125701904296875;
    float _1161 = _1145 * _1151;
    float _1163 = _1153 * _295;
    float _1165 = _1131 * 6.283185482025146484375;
    float _1167 = sin(_1165);
    float _1169 = _1155 * _1157;
    float _1171 = _1153 * _305;
    float _1173 = fma(_1161, _265, _1163);
    float _1175 = fma(_169, _363, _427);
    float _1177 = _1113 * 6.283185482025146484375;
    float _1179 = fma(_1161, _269, _1171);
    float _1181 = -_1169;
    float _1183 = fma(_1181, _313, _1173);
    float _1185 = _1111 * 6.283185482025146484375;
    float _1187 = sin(_1185);
    float _1189 = fma(_175, _363, _433);
    float _1191 = _1177 * 0.15915493667125701904296875;
    float _1193 = -_1169;
    float _1195 = fma(_1193, _317, _1179);
    float _1197 = _1183 * _1149;
    float _1199 = _1175 + _1121;
    float _1201 = fma(_919, 1.2000000476837158203125, _933);
    float _1203 = _1189 + _1141;
    float _1205 = _1159 * 6.283185482025146484375;
    float _1207 = sin(_1205);
    float _1209 = _1183 * _1167;
    float _1211 = fma(_1195, _1167, _1197);
    float _1213 = _177 * 3.3333332538604736328125;
    float _1215 = -_1209;
    float _1217 = fma(_1195, _1149, _1215);
    float _1219 = _1199 + _1211;
    float _1221 = _1191 * 6.283185482025146484375;
    float _1223 = sin(_1221);
    float _1225 = _1203 + _1217;
    float _1227 = fma(_1201, (*spvDescriptorSet0.vp_c9)._m0[191].z, _1219);
    float _1229 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1231 = _1227 + _1229;
    float _1233 = _1191 * 6.283185482025146484375;
    float _1235 = cos(_1233);
    float _1237 = _1187 + _1207;
    float _1239 = fma(_1237, (*spvDescriptorSet0.vp_c9)._m0[191].z, _1225);
    float _1241 = _1223 * _1231;
    float _1243 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1245 = _1239 + _1243;
    float _1247 = in.m_62.y;
    float _1249 = _1235 * _1231;
    float _1251 = -_1241;
    float _1253 = fma(_1235, _1245, _1251);
    float _1255 = fma(_1223, _1245, _1249);
    float _1257 = _1253 + (*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1259 = _1255 + (*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1261 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1263 = _1257 + _1261;
    float _1265 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1267 = _1259 + _1265;
    float _1269 = _1263 * _1263;
    float _1271 = fma(_1267, _1267, _1269);
    float _1273 = sqrt(_1271);
    bool _1275 = _1273 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1277 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1279 = _1273 + _1277;
    float _1281 = 0.0 + _1213;
    float _1283 = precise::clamp(_1281, 0.0, 1.0);
    float _1285 = _1237;
    float _1287 = _1259;
    float _1289 = _1257;
    if (_1275)
    {
        float _1291 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1285 = _1291;
    }
    float _1293 = _1285;
    float _1295 = _1293;
    if (_1275)
    {
        float _1297 = _1279 * _1293;
        _1295 = _1297;
    }
    float _1299 = _1295;
    float _1301 = -_1213;
    float _1303 = _1301 + 3.3333332538604736328125;
    float _1305 = precise::clamp(_1303, 0.0, 1.0);
    float _1307 = _1153 * _285;
    float _1309 = _1299;
    if (_1275)
    {
        float _1311 = _1299 * 0.15915493667125701904296875;
        _1309 = _1311;
    }
    float _1313 = _1309;
    float _1315 = fma(_1161, _261, _1307);
    float _1317 = precise::min(_1283, _1305);
    float _1319 = _1153;
    if (_1275)
    {
        float _1321 = _1313 * 6.283185482025146484375;
        float _1323 = sin(_1321);
        _1319 = _1323;
    }
    float _1325 = _1319;
    float _1327 = _361 + _1247;
    float _1329 = -_1169;
    float _1331 = fma(_1329, _309, _1315);
    float _1333 = fma(_1317, -5.0, 5.0);
    float _1335 = -(*spvDescriptorSet0.vp_c9)._m0[192].w;
    float _1337 = _1335 + 1.0;
    float _1339 = _1327 + _1331;
    float _1341 = 5.0;
    float _1343 = _1337;
    if (_1275)
    {
        float _1345 = rsqrt(_1271);
        _1341 = _1345;
    }
    float _1347 = _1341;
    float _1349 = fma(_1199, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1351 = -_1333;
    float _1353 = fma(_1351, _1337, _1339);
    float _1355 = _1353;
    if (_1275)
    {
        float _1357 = _1353 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1343 = _1357;
    }
    float _1359 = _1343;
    float _1361 = floor(_1349);
    float _1363 = fma(_1203, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1365 = _1325;
    if (_1275)
    {
        float _1367 = fma(_1325, _1359, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1365 = _1367;
    }
    float _1369 = _1365;
    float _1371 = floor(_1363);
    float _1373 = _1369;
    if (_1275)
    {
        float _1375 = _1347 * _1369;
        _1373 = _1375;
    }
    float _1377 = _1373;
    if (_1275)
    {
        float _1379 = fma(_1267, _1377, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1287 = _1379;
    }
    float _1381 = _1287;
    if (_1275)
    {
        float _1383 = fma(_1263, _1377, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1289 = _1383;
    }
    float _1385 = _1289;
    float _1387 = -_1361;
    float _1389 = _1349 + _1387;
    float _1391 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1393 = _1381 + _1391;
    float _1395 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1397 = _1385 + _1395;
    float _1399 = fma(_1393, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1401 = fma(_1397, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1403 = -_1371;
    float _1405 = _1363 + _1403;
    float2 _4909 = float2(_1399, _1401);
    float _1407 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_4909, float2(0.0), isnan(_4909)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_4909, float2(0.0), isnan(_4909)), level(0.0)).x;
    float2 _4919 = float2(_1389, _1405);
    float _1409 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4919, float2(0.0), isnan(_4919)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4919, float2(0.0), isnan(_4919)), level(0.0)).x;
    float _1411 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1413 = int(_1411);
    int _1415 = abs(_915);
    out.m_64.x = _343;
    out.m_64.y = _345;
    int _1417 = abs(_943);
    float _1419 = -_695;
    float _1421 = _1419 + 1.0;
    int _1423 = abs(_949);
    float _1425 = _371 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1427 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1429 = int(_1427);
    float _1431 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1433 = float(_1413);
    float _1435 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1437 = fma(_353, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1435);
    float _1439 = 1.0 / _1433;
    float _1441 = float(uint(_1429));
    float _1443 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1437);
    float _1445 = 1.0 / _1441;
    float _1447 = _133 * _1439;
    float _1449 = trunc(_1447);
    int _1451 = int(_1449);
    int _1453 = as_type<int>(_1445) + (-2);
    float _1455 = float(uint(_1451));
    int _1457 = ~_1429;
    int _1459 = _1457 + 1;
    float _1461 = float(_1451);
    float _1463 = as_type<float>(_1453) * _1455;
    float _1465 = trunc(_1463);
    float _1467 = precise::max(_1465, 0.0);
    uint _1470 = uint(_1467);
    int _1472 = ~_1429;
    int _1474 = _1472 + 1;
    int _1476 = _1459 * int(_1470);
    int _1478 = _1476 + _1451;
    float _1480 = float(uint(_1478));
    float _1482 = as_type<float>(_1453) * _1480;
    int _1484 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1486 = _1484 != 0;
    float _1488 = trunc(_1482);
    float _1490 = precise::max(_1488, 0.0);
    uint _1492 = uint(_1490);
    bool _1494 = !_1486;
    float _1496 = _1494 ? 7.345489978790283203125 : 1.0;
    float _1498 = _1496 * _353;
    float _1500 = floor(_1498);
    int _1502 = int(_1470) + int(_1492);
    float _1504 = float(_1429);
    int _1506 = _1474 * _1502;
    int _1508 = _1506 + _1451;
    bool _1510 = _1461 >= _1504;
    bool _1512 = isnan(_1461);
    bool _1514 = _1510 || _1512;
    bool _1516 = isnan(_1504);
    bool _1518 = _1514 || _1516;
    float _1520 = float(_1518);
    bool _1522 = uint(_1508) >= uint(_1429);
    float _1524 = trunc(_1520);
    int _1526 = int(_1524);
    bool _1528 = !_1522;
    int _1530 = _1528 ? 0 : (-1);
    float _1532 = -_1500;
    float _1534 = _1498 + _1532;
    bool _1536 = _1429 == 0;
    int _1538 = ~_1502;
    int _1540 = _1538 + _1530;
    int _1542 = _1540 + 1;
    float _1544 = _1534 * _1504;
    float _1546 = _133 * _1504;
    int _1548 = _1429 * _1542;
    int _1550 = _1548 + _1451;
    float _1552 = _1546 * _163;
    float _1554 = trunc(_1544);
    int _1556 = int(_1554);
    int _1558 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1560 = _1558 != 0;
    int _1562 = ~_1526;
    int _1564 = _1562 + 1;
    int _1566 = _1564 + 1;
    bool _1568 = !_1536;
    int _1570 = _1568 ? _1550 : (-1);
    int _1572 = _1429 + (-1);
    float _1574 = trunc(_1552);
    int _1576 = int(_1574);
    bool _1578 = !_1560;
    int _1580 = _1578 ? 0 : 1;
    int _1582 = _1570 * _1566;
    int _1584 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1586 = _1584 != 0;
    int _1588 = abs(_1580);
    int _1590 = _1526 * _1572;
    int _1592 = _1590 + _1582;
    bool _1594 = !_1586;
    int _1596 = _1594 ? 0 : 1;
    int _1598 = _1592 * _1415;
    int _1600 = ~_1429;
    int _1602 = _1600 + 1;
    int _1604 = _1556 * _1588;
    int _1606 = _1604 + _1451;
    int _1608 = abs(_1596);
    float _1610 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1612 = _1576 * _1417;
    int _1614 = _1612 + _1598;
    int _1616 = ~_1429;
    int _1618 = _1616 + 1;
    float _1620 = float(uint(_1606));
    int _1622 = _1606 * _1423;
    int _1624 = _1622 + _1614;
    int _1626 = _1556 * _1608;
    int _1628 = _1626 + _1624;
    float _1630 = as_type<float>(_1453) * _1620;
    float _1632 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1634 = float(uint(_1628));
    float _1636 = trunc(_1630);
    float _1638 = precise::max(_1636, 0.0);
    uint _1640 = uint(_1638);
    float _1642 = fma(_1425, -2.0, _1632);
    float _1644 = as_type<float>(_1453) * _1634;
    float _1646 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1642);
    float _1648 = trunc(_1644);
    float _1650 = precise::max(_1648, 0.0);
    uint _1652 = uint(_1650);
    float _1654 = in.m_54.w;
    int _1656 = _1602 * int(_1640);
    int _1658 = _1656 + _1606;
    int _1660 = ~_1429;
    int _1662 = _1660 + 1;
    float _1664 = float(uint(_1658));
    int _1666 = _1618 * int(_1652);
    int _1668 = _1666 + _1628;
    float _1670 = as_type<float>(_1453) * _1664;
    float _1672 = float(uint(_1668));
    float _1674 = trunc(_1670);
    float _1676 = precise::max(_1674, 0.0);
    uint _1678 = uint(_1676);
    out.m_64.w = _1654;
    float _1680 = as_type<float>(_1453) * _1672;
    float _1682 = trunc(_1680);
    float _1684 = precise::max(_1682, 0.0);
    uint _1686 = uint(_1684);
    int _1688 = int(_1640) + int(_1678);
    int _1690 = int(_1652) + int(_1686);
    float _1692 = in.m_54.z;
    int _1694 = _1662 * _1690;
    int _1696 = _1694 + _1628;
    bool _1698 = uint(_1696) >= uint(_1429);
    bool _1700 = !_1698;
    int _1702 = _1700 ? 0 : (-1);
    int _1704 = ~_1690;
    int _1706 = _1704 + _1702;
    int _1708 = _1706 + 1;
    int _1710 = ~_1429;
    int _1712 = _1710 + 1;
    int _1714 = _1429 * _1708;
    int _1716 = _1714 + _1628;
    int _1718 = _1712 * _1688;
    int _1720 = _1718 + _1606;
    float _1722 = in.m_52.w;
    bool _1724 = !_1536;
    int _1726 = _1724 ? _1716 : (-1);
    out.m_64.z = _1692;
    int _1728 = _1726 & 3;
    bool _1730 = _1728 != 0;
    int _1732 = _1726 & 3;
    bool _1734 = _1732 != 0;
    int _1736 = _1730 ? 0 : 1;
    bool _1738 = uint(_1732) > 1u;
    bool _1740 = _1732 != 3;
    bool _1742 = uint(_1732) >= 2u;
    bool _1744 = _1732 != 3;
    int _1746 = _1726 >> 31;
    int _1748 = _1742 ? 0 : 1;
    int _1750 = _1746 & 3;
    int _1752 = ~_1736;
    int _1754 = _1752 + 1;
    int _1756 = _1754 + 1;
    int _1758 = _1726 + _1750;
    bool _1760 = uint(_1720) >= uint(_1429);
    int _1762 = _1758 >> 2;
    int _1764 = _1756;
    if (!_1738)
    {
        int _1766 = ~_1736;
        int _1768 = _1766 + 1;
        _1764 = _1768;
    }
    int _1770 = _1764;
    float _1772 = _353 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1774 = _1762 << 4;
    int _1776 = _1774 + 368;
    float _1778 = fma(_1407, 100.0, _1327);
    int _1780 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1782 = _1780 != 0;
    float _1784 = -_1610;
    float _1786 = fma(_1772, 2.0, _1784);
    uint _1788 = uint(int(uint(_1776) >> uint(2)));
    uint _1790 = uint(int(uint(int(_1788)) >> uint(2)));
    int _1792 = int(_1788) & 3;
    float _1794 = (*spvDescriptorSet0.vp_c9)._m0[int(_1790)][_1792];
    int _1796 = int(_1788) + 1;
    uint _1798 = uint(int(uint(_1796) >> uint(2)));
    int _1800 = _1796 & 3;
    float _1802 = (*spvDescriptorSet0.vp_c9)._m0[int(_1798)][_1800];
    int _1804 = ~_1748;
    int _1806 = _1804 + 1;
    int _1808 = _1806 + 1;
    float _1810 = -_1409;
    float _1812 = _1810 + 1.0;
    int _1814 = _1808;
    int _1816 = _1776;
    if (_1740)
    {
        int _1818 = ~_1748;
        int _1820 = _1818 + 1;
        _1814 = _1820;
    }
    int _1822 = _1814;
    float _1824 = -_133;
    float _1826 = fma(_1824, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1786);
    int _1828 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1830 = _1828 != 0;
    bool _1832 = !_1734;
    int _1834 = _1832 ? 0 : 1;
    int _1836 = _1776 + 8;
    uint _1838 = uint(int(uint(_1836) >> uint(2)));
    uint _1840 = uint(int(uint(int(_1838)) >> uint(2)));
    int _1842 = int(_1838) & 3;
    float _1844 = (*spvDescriptorSet0.vp_c9)._m0[int(_1840)][_1842];
    int _1846 = int(_1838) + 1;
    uint _1848 = uint(int(uint(_1846) >> uint(2)));
    int _1850 = _1846 & 3;
    float _1852 = (*spvDescriptorSet0.vp_c9)._m0[int(_1848)][_1850];
    int _1854 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1856 = _1854 != 0;
    float _1858 = _743;
    if (_1782)
    {
        float _1860 = in.m_52.z;
        _1858 = _1860;
    }
    float _1862 = _1858;
    bool _1864 = !_1830;
    int _1866 = _1864 ? 0 : 1;
    bool _1868 = _1722 > 0.5;
    bool _1870 = !_1744;
    int _1872 = _1870 ? 0 : (-1);
    bool _1874 = !_1760;
    int _1876 = _1874 ? 0 : (-1);
    int _1878 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1880 = _1878 != 0;
    int _1882 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1884 = _1882 != 0;
    int _1886 = _1868 ? as_type<int>(_1421) : as_type<int>(_695);
    float _1888 = _1880 ? as_type<float>(_1886) : _695;
    float _1890 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _1892 = _1868;
    if (_1856)
    {
        bool _1894 = _353 > 0.5;
        _1892 = _1894;
    }
    bool _1896 = _1892;
    float _1898 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _1900 = _371 > 0.5;
    float _1902 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1904 = _1890 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1906 = _1900 ? as_type<int>(_1421) : as_type<int>(_695);
    float _1908 = _1898 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1910 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1912 = _1902 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1914 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _1916 = _1900;
    if (_1782)
    {
        bool _1918 = _1862 > 0.5;
        _1916 = _1918;
    }
    bool _1920 = _1916;
    float _1922 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _1924 = abs(_1770);
    float _1926 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1928 = _1884 ? as_type<float>(_1906) : _695;
    out.m_66.x = _1904;
    out.m_66.y = _1908;
    out.m_66.z = _1912;
    out.m_66.w = _1910;
    int _1930 = abs(_1834);
    float _1932 = _1914 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1934 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1936 = int(_1934);
    float _1938 = _1922 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1940 = _1926 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1942 = abs(_1822);
    float _1944 = in.m_58.x;
    int _1946 = abs(_1866);
    float _1948 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1431);
    int _1950 = ~_1688;
    int _1952 = _1950 + _1876;
    int _1954 = _1952 + 1;
    out.m_68.x = _1932;
    out.m_68.y = _1938;
    out.m_68.z = _1940;
    float _1956 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1948);
    int _1958 = ~_1924;
    int _1960 = _1958 + 1;
    int _1962 = _1960 + 1;
    int _1964 = _1429 * _1954;
    int _1966 = _1964 + _1606;
    int _1968 = ~_1930;
    int _1970 = _1968 + 1;
    int _1972 = _1970 + 1;
    int _1974 = _1962 * as_type<int>(_1802);
    int _1976 = abs(_1936);
    bool _1978 = !_1536;
    int _1980 = _1978 ? _1966 : (-1);
    int _1982 = _1972 * as_type<int>(_1794);
    int _1984 = _1982 + _1974;
    float _1986 = in.m_70.x;
    float _1988 = in.m_70.y;
    float _1990 = in.m_70.z;
    float _1992 = in.m_70.w;
    int _1994 = abs(_1872);
    int _1996 = ~_1942;
    int _1998 = _1996 + 1;
    int _2000 = _1998 + 1;
    int _2002 = ~_1994;
    int _2004 = _2002 + 1;
    int _2006 = _2004 + 1;
    float _2008 = float(uint(_1936));
    int _2010 = _2000 * as_type<int>(_1844);
    int _2012 = _2010 + _1984;
    float _2014 = float(uint(_1976));
    float _2016 = 1.0 / _2008;
    int _2018 = _2006 * as_type<int>(_1852);
    int _2020 = _2018 + _2012;
    int _2022 = ~_1946;
    int _2024 = _2022 + 1;
    int _2026 = _2024 + 1;
    bool _2028 = _1129 != 0.0;
    bool _2030 = isnan(_1129);
    bool _2032 = _2028 || _2030;
    bool _2034 = isnan(0.0);
    bool _2036 = _2032 || _2034;
    float _2038 = as_type<float>(_1942);
    float _2040 = as_type<float>(_1984);
    if (!_1856)
    {
        _2038 = _1944;
    }
    float _2042 = _2038;
    int _2044 = _2020 * _2026;
    float _2046 = 1.0 / _2014;
    bool _2048 = _1133 == 0.0;
    bool _2050 = !_2036;
    bool _2052 = _2048 && _2050;
    int _2054 = _1980 * _1946;
    int _2056 = _2054 + _2044;
    float _2058 = _305 * _1990;
    bool _2060 = _1127 == 0.02999999932944774627685546875;
    bool _2062 = _2060 && _2052;
    float _2064 = _285 * _1990;
    float _2066 = in.m_72.x;
    float _2068 = in.m_72.y;
    float _2070 = in.m_72.z;
    int _2072 = as_type<int>(_2016) + (-2);
    float _2074 = fma(_269, _1986, _2058);
    float _2076 = float(uint(_2056));
    float _2078 = fma(_261, _1986, _2064);
    int _2080 = abs(_2056);
    float _2082 = _295 * _1990;
    float _2084 = _2042;
    if (!_1856)
    {
        _2040 = _2042;
    }
    float _2086 = _2040;
    float _2088 = as_type<float>(_2072) * _2076;
    int _2090 = as_type<int>(_2046) + (-2);
    float _2092 = fma(_265, _1986, _2082);
    float _2094 = float(uint(_2080));
    float _2096 = trunc(_2088);
    float _2098 = precise::max(_2096, 0.0);
    uint _2100 = uint(_2098);
    int _2102 = as_type<int>(_2088);
    float _2104 = _2086;
    if (_1856)
    {
        _2084 = _1944;
    }
    float _2106 = _2084;
    float _2108 = -_1988;
    float _2110 = fma(_313, _2108, _2092);
    int _2112 = ~_1936;
    int _2114 = _2112 + 1;
    float _2116 = as_type<float>(_2090) * _2094;
    float _2118 = -_1988;
    float _2120 = fma(_309, _2118, _2078);
    int _2122 = ~_1976;
    int _2124 = _2122 + 1;
    float _2126 = -_1988;
    float _2128 = fma(_317, _2126, _2074);
    float _2130 = _2106;
    float _2132 = _2128;
    float _2134 = _2110;
    if (_1782)
    {
        float _2136 = -_2106;
        float _2138 = _2136 + 1.0;
        _1816 = as_type<int>(_2138);
    }
    int _2140 = _1816;
    if (_1856)
    {
        float _2142 = -_2106;
        float _2144 = _2142 + 1.0;
        _2102 = as_type<int>(_2144);
    }
    int _2146 = _2102;
    float _2148 = trunc(_2116);
    float _2150 = precise::max(_2148, 0.0);
    uint _2152 = uint(_2150);
    out.m_74.x = _2110;
    out.m_74.y = _2120;
    out.m_74.z = _2128;
    if (_1856)
    {
        float _2154 = _1896 ? as_type<float>(_2146) : _2106;
        _2104 = _2154;
    }
    float _2156 = _2104;
    int _2158 = _2114 * int(_2100);
    int _2160 = _2158 + _2056;
    float _2162 = as_type<float>(_2160);
    if (_1782)
    {
        float _2164 = _1920 ? as_type<float>(_2140) : _2106;
        _2130 = _2164;
    }
    float _2166 = _2130;
    float _2168 = float(uint(_2160));
    float _2170 = _2168;
    if (_2062)
    {
        _2132 = _2068;
    }
    float _2172 = _2132;
    float _2174 = _2166 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _2176 = _2124 * int(_2152);
    int _2178 = _2176 + _2080;
    float _2180 = as_type<float>(_2072) * _2168;
    float _2182 = _2172;
    if (_2062)
    {
        _2162 = _2172;
    }
    float _2184 = _2162;
    float _2186 = _2184;
    if (!_2062)
    {
        _2182 = _2068;
    }
    float _2188 = _2182;
    float _2190 = float(uint(_2178));
    float _2192 = trunc(_2180);
    float _2194 = precise::max(_2192, 0.0);
    uint _2196 = uint(_2194);
    if (_2062)
    {
        _2134 = _2066;
    }
    float _2198 = _2134;
    float _2200 = _2198;
    if (!_2062)
    {
        float _2202 = fma(_1133, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2066);
        _2200 = _2202;
    }
    float _2204 = _2200;
    if (!_2062)
    {
        float _2206 = fma(_1129, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2188);
        _2186 = _2206;
    }
    float _2208 = _2186;
    float _2210 = as_type<float>(_2090) * _2190;
    float _2212 = _1990 * _2066;
    if (_2062)
    {
        _2170 = _2070;
    }
    float _2214 = _2170;
    float _2216 = _1988 * _2070;
    float _2218 = _2214;
    if (!_2062)
    {
        float _2220 = fma(_1135, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2070);
        _2218 = _2220;
    }
    float _2222 = _2218;
    float _2224 = -_2212;
    float _2226 = fma(_1986, _2070, _2224);
    float _2228 = trunc(_2210);
    float _2230 = precise::max(_2228, 0.0);
    uint _2232 = uint(_2230);
    float _2234 = _1986 * _2188;
    float _2236 = -_2216;
    float _2238 = fma(_1990, _2188, _2236);
    float _2240 = _295 * _2222;
    float _2242 = _285 * _2222;
    float _2244 = _305 * _2222;
    float _2246 = -_2234;
    float _2248 = fma(_1988, _2066, _2246);
    float _2250 = fma(_265, _2204, _2240);
    float _2252 = fma(_261, _2204, _2242);
    float _2254 = fma(_269, _2204, _2244);
    int _2256 = int(_2100) + int(_2196);
    float _2258 = _2248 * _1992;
    int _2260 = ~_1936;
    int _2262 = _2260 + 1;
    float _2264 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _2266 = ~_1976;
    int _2268 = _2266 + 1;
    float _2270 = _2258 * _295;
    int _2272 = int(_2152) + int(_2232);
    float _2274 = _2226 * _1992;
    float _2276 = _2238 * _1992;
    int _2278 = _2262 * _2256;
    int _2280 = _2278 + _2056;
    float _2282 = _2258 * _285;
    int _2284 = _2268 * _2272;
    int _2286 = _2284 + _2080;
    float _2288 = _2258 * _305;
    float _2290 = fma(_2276, _265, _2270);
    bool _2292 = uint(_2280) >= uint(_1936);
    float _2294 = fma(_2276, _261, _2282);
    bool _2296 = uint(_2286) >= uint(_1976);
    float _2298 = -_2208;
    float _2300 = fma(_313, _2298, _2250);
    bool _2302 = !_2292;
    int _2304 = _2302 ? 0 : (-1);
    float _2306 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2308 = _2056 ^ _1936;
    float _2310 = -_2208;
    float _2312 = fma(_317, _2310, _2254);
    bool _2314 = !_2296;
    int _2316 = _2314 ? 0 : (-1);
    float _2318 = fma(_2276, _269, _2288);
    int _2320 = ~_2256;
    int _2322 = _2320 + _2304;
    int _2324 = _2322 + 1;
    float _2326 = _2264 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    uint _2328 = uint(int(uint(_2308) >> uint(31)));
    float _2330 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2332 = ~_2316;
    int _2334 = _2272 + _2332;
    int _2336 = _2334 + 1;
    int _2338 = _1936 * _2324;
    int _2340 = _2338 + _2056;
    int _2342 = ~int(_2328);
    int _2344 = _2342 + 1;
    float _2346 = _2300 * _1167;
    bool _2348 = _1936 == 0;
    float _2350 = fma(_2326, _2156, -0.5);
    int _2352 = _2336 ^ _2344;
    float _2354 = _265;
    float _2356 = _2326;
    if (_1275)
    {
        float _2358 = _1313 * 6.283185482025146484375;
        float _2360 = cos(_2358);
        _2354 = _2360;
    }
    float _2362 = _2354;
    bool _2364 = !_2348;
    int _2366 = _2364 ? _2340 : (-1);
    float _2368 = _2306 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _2370 = ~_2344;
    int _2372 = _2370 + _2352;
    int _2374 = _2372 + 1;
    float _2376 = -_2346;
    float _2378 = fma(_2312, _1149, _2376);
    bool _2380 = _1936 == 0;
    float _2382 = fma(_2368, _1928, -0.5);
    float _2384 = float(_2366);
    float _2386 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _2388 = !_2380;
    int _2390 = _2388 ? _2374 : (-1);
    float _2392 = _1888 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2394 = -_2274;
    float _2396 = fma(_2394, _313, _2290);
    float _2398 = fma(_2326, _2384, _1826);
    float _2400 = float(_2390);
    float _2402 = _2300 * _1149;
    float _2404 = fma(_1443, _2350, _2398);
    float _2406 = _1778 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2408 = -_1646;
    float _2410 = fma(_2368, _2400, _2408);
    float _2412 = -_2208;
    float _2414 = fma(_309, _2412, _2252);
    float _2416 = _2392 * _2330;
    float _2418 = fma(_1199, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2406);
    float _2420 = _2330;
    if (_1275)
    {
        float _2422 = _2362 + (-1.0);
        _2420 = _2422;
    }
    float _2424 = _2420;
    float _2426 = -_2274;
    float _2428 = fma(_2426, _317, _2318);
    float _2430 = fma(_1956, _2382, _2410);
    float _2432 = -_2274;
    float _2434 = fma(_2432, _309, _2294);
    float _2436 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2418);
    if (_1275)
    {
        float _2438 = _2424 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2356 = _2438;
    }
    float _2440 = _2356;
    float _2442 = _2174 * _2386;
    float _2444 = _2404 + 0.5;
    float _2446 = _2430 + 0.5;
    out.m_76.x = _2396;
    out.m_76.y = _2434;
    out.m_76.z = _2428;
    if (_1275)
    {
        float _2448 = fma(_1353, _2362, _2440);
        _1355 = _2448;
    }
    float _2450 = _1355;
    float _2452 = fma(_2312, _1167, _2402);
    out.m_78.x = _2444;
    out.m_78.y = _2446;
    out.m_78.z = _2442;
    out.m_78.w = _2416;
    float _2454 = _1223 * _2452;
    float _2456 = _1235 * _2452;
    float _2458 = in.m_62.x;
    float _2460 = -_2454;
    float _2462 = fma(_1235, _2378, _2460);
    float _2464 = fma(_1223, _2378, _2456);
    float _2466 = _1778 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2468 = _2436 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2470 = fma(_1199, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2466);
    out.m_80.x = _2464;
    out.m_80.y = _2414;
    out.m_80.z = _2462;
    float _2472 = 1.0 / _2468;
    float _2474 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2470);
    float _2476 = _2474 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2478 = _2476 + _2468;
    float _2480 = _2478 * _2472;
    float _2482 = _2480 * 0.5;
    float _2484 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2486 = fma(_2482, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2484);
    float _2488 = 1.0 / _2486;
    float _2490 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2492 = _2488 * _2490;
    float _2494 = abs(_2492);
    float _2496 = log2(_2494);
    bool _2498 = _2492 <= 8000.0;
    bool _2500 = isnan(_2492);
    bool _2502 = _2498 || _2500;
    bool _2504 = isnan(8000.0);
    bool _2506 = _2502 || _2504;
    float _2508 = float(_2506);
    float _2510 = _2496 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2512 = exp2(_2510);
    float _2514 = fma(_2512, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2516 = precise::clamp(_2514, 0.0, 1.0);
    float _2518 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2520 = _1381 + _2518;
    float _2522 = fma(_2516, -2.0, 3.0);
    float _2524 = _2516 * _2516;
    float _2526 = _2524 * _2522;
    float _2528 = fma(_1407, 100.0, _2450);
    float _2530 = -_2526;
    float _2532 = _2530 + 1.0;
    float _2534 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2536 = _2528 + _2534;
    float _2538 = _2528 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    out.m_82.x = _1381;
    out.m_82.y = _2528;
    out.m_82.z = _1385;
    float _2540 = fma(_2532, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2526);
    float _2542 = _2536 * _2536;
    float _2544 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2546 = _1385 + _2544;
    float _2548 = fma(_1381, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2538);
    float _2550 = _2508 * _2540;
    float _2552 = fma(_2520, _2520, _2542);
    float _2554 = _2528 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2556 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2548);
    float _2558 = _2550 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2560 = fma(_2546, _2546, _2552);
    float _2562 = _2528 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2564 = _2528 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2566 = fma(_1381, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2554);
    float _2568 = _1812 * _2558;
    float _2570 = precise::clamp(_2568, 0.0, 1.0);
    float _2572 = fma(_1381, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2562);
    float _2574 = fma(_1381, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2564);
    float _2576 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2566);
    float _2578 = -_2570;
    float _2580 = fma(_2578, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2582 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2572);
    float _2584 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2574);
    float _2586 = _2576 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2588 = sqrt(_2560);
    float _2590 = _2582 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2592 = _2584 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2594 = _2556 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2596 = _2580 * _2458;
    float _2598 = _2590 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2600 = _2590 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2602 = _2590 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2604 = _2590 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2606 = fma(_2592, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2598);
    float _2608 = fma(_2592, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2600);
    float _2610 = fma(_2592, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2602);
    float _2612 = fma(_2592, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2604);
    float _2614 = fma(_2586, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2606);
    float _2616 = fma(_2586, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2608);
    float _2618 = fma(_2586, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2610);
    float _2620 = fma(_2586, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2612);
    float _2622 = fma(_2594, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2614);
    float _2624 = fma(_2594, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2616);
    float _2626 = fma(_2594, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2618);
    float _2628 = fma(_2594, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2620);
    float _2630 = _2596 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    bool _2632 = _2588 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2634 = isnan(_2588);
    bool _2636 = _2632 || _2634;
    bool _2638 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2640 = _2636 || _2638;
    out.gl_Position.x = _2622;
    out.gl_Position.y = _2624;
    out.gl_Position.z = _2626;
    out.gl_Position.w = _2628;
    out.m_84.x = _2630;
    float _2642 = _2618;
    float _2644 = _2586;
    float _2646 = _2616;
    float _2648 = _2590;
    float _2650 = _2614;
    float _2652 = _2592;
    if (!_2640)
    {
        _2642 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2654 = _2642;
    float _2656 = _2654;
    float _2658 = _2654;
    if (!_2640)
    {
        _2644 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2660 = _2644;
    float _2662 = _2660;
    float _2664 = _2660;
    if (!_2640)
    {
        _2646 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2666 = _2646;
    float _2668 = _2666;
    float _2670 = _2666;
    if (!_2640)
    {
        _2648 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2672 = _2648;
    float _2674 = _2672;
    float _2676 = _2672;
    if (!_2640)
    {
        _2650 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2678 = _2650;
    float _2680 = _2678;
    float _2682 = _2678;
    if (!_2640)
    {
        _2652 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2684 = _2652;
    bool _2686 = !_2640;
    float _2688 = _2684;
    float _2690 = _2684;
    if (!_2686)
    {
        bool _2692 = _2588 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2694 = isnan(_2588);
        bool _2696 = _2692 || _2694;
        bool _2698 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2700 = _2696 || _2698;
        if (!_2700)
        {
            float _2702 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2704 = _2588 + _2702;
            float _2706 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2708 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2706;
            float _2710 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2712 = _2710 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2714 = 1.0 / _2708;
            float _2716 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2718 = _2716 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2720 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2722 = _2720 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2724 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2726 = _2724 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2728 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2730 = _2728 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2732 = _2704 * _2714;
            float _2734 = precise::clamp(_2732, 0.0, 1.0);
            float _2736 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2738 = _2736 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2740 = fma(_2734, _2712, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2742 = fma(_2734, _2738, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2744 = fma(_2734, _2718, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2746 = fma(_2734, _2722, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2748 = fma(_2734, _2726, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2750 = fma(_2734, _2730, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2664 = _2740;
            _2682 = _2748;
            _2658 = _2744;
            _2676 = _2746;
            _2670 = _2742;
            _2690 = _2750;
            _2752 = true;
        }
        else
        {
            bool _2754 = _2588 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2756 = isnan(_2588);
            bool _2758 = _2754 || _2756;
            bool _2760 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2762 = _2758 || _2760;
            if (!_2762)
            {
                _2656 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2764 = _2656;
            _2658 = _2764;
            if (!_2762)
            {
                _2662 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2766 = _2662;
            _2664 = _2766;
            if (!_2762)
            {
                _2668 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2768 = _2668;
            _2670 = _2768;
            if (!_2762)
            {
                _2674 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2770 = _2674;
            _2676 = _2770;
            if (!_2762)
            {
                _2680 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2772 = _2680;
            _2682 = _2772;
            if (!_2762)
            {
                _2688 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2774 = _2688;
            bool _2776 = !_2762;
            _2690 = _2774;
            if (!_2776)
            {
                bool _2778 = _2588 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2780 = isnan(_2588);
                bool _2782 = _2778 || _2780;
                bool _2784 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2786 = _2782 || _2784;
                if (!_2786)
                {
                    float _2788 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2790 = _2588 + _2788;
                    float _2792 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2794 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2792;
                    float _2796 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2798 = _2796 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2800 = 1.0 / _2794;
                    float _2802 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2804 = _2802 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2806 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2808 = _2806 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2810 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2812 = _2810 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2814 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2816 = _2814 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2818 = _2790 * _2800;
                    float _2820 = precise::clamp(_2818, 0.0, 1.0);
                    float _2822 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2824 = _2822 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2826 = fma(_2820, _2798, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2828 = fma(_2820, _2824, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2830 = fma(_2820, _2804, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2832 = fma(_2820, _2808, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2834 = fma(_2820, _2812, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2836 = fma(_2820, _2816, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2664 = _2826;
                    _2682 = _2834;
                    _2658 = _2830;
                    _2676 = _2832;
                    _2670 = _2828;
                    _2690 = _2836;
                    _2752 = true;
                }
                else
                {
                    _2664 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2682 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2658 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2676 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2670 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2690 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2752 = false;
    float _2838 = _2664;
    float _2840 = _2682;
    float _2842 = _2658;
    float _2844 = _2676;
    float _2846 = _2670;
    float _2848 = _2690;
    float _2850 = fma(_2414, -0.5, 0.5);
    float _2852 = precise::clamp(_2850, 0.0, 1.0);
    float _2854 = -_2838;
    float _2856 = _2854 + _2840;
    float _2858 = -_2842;
    float _2860 = _2858 + _2844;
    float _2862 = -_2846;
    float _2864 = _2862 + _2848;
    bool _2866 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2868 = fma(_2852, _2856, _2838);
    float _2870 = fma(_2852, _2860, _2842);
    float _2872 = fma(_2852, _2864, _2846);
    float _2874 = _2868 * 0.586610972881317138671875;
    out.m_86.x = 0.0;
    float _2876 = fma(_2870, 0.298911988735198974609375, _2874);
    float _2878 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_42.x = 1.0;
    float _2880 = fma(_2872, 0.114477999508380889892578125, _2876);
    float _2882 = -_2880;
    float _2884 = _2870 + _2882;
    float _2886 = -_2880;
    float _2888 = _2868 + _2886;
    float _2890 = -_2880;
    float _2892 = _2872 + _2890;
    out.m_84.w = _2878;
    float _2894 = fma(_2884, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2880);
    float _2896 = fma(_2888, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2880);
    float _2898 = fma(_2892, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2880);
    out.m_88.x = _2894;
    out.m_88.y = _2896;
    out.m_88.z = _2898;
    if (!_2866)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2900 = -_2528;
    float _2902 = _2900 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2904 = -_1381;
    float _2906 = _2904 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2908 = -_1385;
    float _2910 = _2908 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2912 = _2902 * _2902;
    float _2914 = fma(_2906, _2906, _2912);
    float _2916 = fma(_2910, _2910, _2914);
    float _2918 = sqrt(_2916);
    float _2920 = rsqrt(_2916);
    float _2922 = -_2918;
    float _2924 = _2922 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2926 = _2924 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2928 = precise::clamp(_2926, 0.0, 1.0);
    float _2930 = _2906 * _2920;
    float _2932 = _2902 * _2920;
    float _2934 = abs(_2928);
    float _2936 = log2(_2934);
    float _2938 = _2910 * _2920;
    float _2940 = _2930 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2942 = _2414 * _2932;
    float _2944 = -_2932;
    float _2946 = -_2940;
    float _2948 = fma(_2944, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2946);
    float _2950 = fma(_2464, _2930, _2942);
    float _2952 = -_2938;
    float _2954 = fma(_2952, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2948);
    float _2956 = fma(_2462, _2938, _2950);
    float _2958 = precise::clamp(_2956, 0.0, 1.0);
    float _2960 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2962 = _2954 + _2960;
    float _2964 = _2936 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2966 = _2962 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2968 = precise::clamp(_2966, 0.0, 1.0);
    float _2970 = exp2(_2964);
    float _2972 = _2970 * _2968;
    float _2974 = _2958 * _2972;
    float _2976 = _2974 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2978 = _2974 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2980 = _2974 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_86.x = _2976;
    out.m_86.y = _2978;
    out.m_86.z = _2980;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2752 = false;
    bool _339 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _102 = in.m_39.w;
    float _104 = trunc(_102);
    int _107 = int(_104);
    bool _111 = _107 >= 1;
    float _113 = 0.0;
    float _115 = as_type<float>(_107);
    if (!_111)
    {
        _113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _113;
    if (!_111)
    {
        out.m_42.x = 0.0;
    }
    int _119 = 0;
    if (!_111)
    {
        float _121 = _117 * 5.0;
        _119 = as_type<int>(_121);
    }
    int _123 = _119;
    int _125 = _123;
    if (!_111)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3038 = as_type<float>(_123);
        out.gl_Position.z = _3038;
    }
    if (!_111)
    {
        return out;
    }
    float _127 = in.m_44.w;
    float _129 = float(_107);
    float _131 = -_127;
    float _133 = _131 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = _127 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = isnan(_127);
    bool _139 = _135 || _137;
    bool _141 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _143 = _139 || _141;
    bool _145 = _133 >= _129;
    bool _147 = !_143;
    bool _149 = _145 || _147;
    if (_149)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _151 = _115;
    if (_149)
    {
        out.m_42.x = 0.0;
    }
    if (_149)
    {
        float _153 = _151 * 5.0;
        _125 = as_type<int>(_153);
    }
    int _155 = _125;
    if (_149)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3101 = as_type<float>(_155);
        out.gl_Position.z = _3101;
    }
    if (_149)
    {
        return out;
    }
    float _157 = in.m_46.x;
    float _159 = in.m_46.y;
    float _161 = in.m_46.z;
    float _163 = 1.0 / _129;
    float _165 = in.m_48.x;
    float _167 = in.m_48.y;
    float _169 = in.m_48.z;
    float _171 = in.m_50.x;
    float _173 = in.m_50.y;
    float _175 = in.m_50.z;
    float _177 = _133 * _163;
    float _179 = _157 * _157;
    float _181 = _159 * _159;
    float _183 = _161 * _161;
    float _185 = fma(_165, _165, _179);
    float _187 = fma(_167, _167, _181);
    float _189 = fma(_169, _169, _183);
    float _191 = fma(_171, _171, _185);
    float _193 = fma(_173, _173, _187);
    float _195 = fma(_175, _175, _189);
    float _197 = sqrt(_191);
    float _199 = sqrt(_193);
    float _201 = sqrt(_195);
    bool _203 = _197 > 0.0;
    bool _205 = _199 > 0.0;
    float _207 = _199;
    float _209 = _197;
    if (_203)
    {
        float _211 = rsqrt(_191);
        _207 = _211;
    }
    float _213 = _207;
    float _215 = 0.0;
    if (!_203)
    {
        _215 = 0.0;
    }
    float _217 = _215;
    bool _219 = _201 > 0.0;
    float _221 = 0.0;
    float _223 = _217;
    if (!_203)
    {
        _221 = 0.0;
    }
    float _225 = _221;
    float _227 = 0.0;
    float _229 = _225;
    if (!_203)
    {
        _227 = 0.0;
    }
    float _231 = _227;
    float _233 = _201;
    float _235 = _231;
    if (_205)
    {
        float _237 = rsqrt(_193);
        _233 = _237;
    }
    float _239 = _233;
    float _241 = 0.0;
    if (!_205)
    {
        _241 = 0.0;
    }
    float _243 = _241;
    float _245 = _243;
    if (!_205)
    {
        _209 = 0.0;
    }
    float _247 = _209;
    float _249 = 0.0;
    float _251 = _247;
    if (_219)
    {
        float _253 = rsqrt(_195);
        _249 = _253;
    }
    float _255 = _249;
    float _257 = _213;
    if (_203)
    {
        float _259 = _213 * _157;
        _223 = _259;
    }
    float _261 = _223;
    if (_203)
    {
        float _263 = _213 * _165;
        _229 = _263;
    }
    float _265 = _229;
    if (_203)
    {
        float _267 = _213 * _171;
        _235 = _267;
    }
    float _269 = _235;
    bool _271 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    if (!_205)
    {
        _257 = 0.0;
    }
    float _273 = _257;
    float _275 = 0.0;
    float _277 = _273;
    if (!_219)
    {
        _275 = 0.0;
    }
    float _279 = _275;
    float _281 = _279;
    if (_205)
    {
        float _283 = _239 * _159;
        _245 = _283;
    }
    float _285 = _245;
    float _287 = 0.0;
    if (!_219)
    {
        _287 = 0.0;
    }
    float _289 = _287;
    float _291 = _289;
    if (_205)
    {
        float _293 = _239 * _167;
        _251 = _293;
    }
    float _295 = _251;
    float _297 = 0.0;
    if (!_219)
    {
        _297 = 0.0;
    }
    float _299 = _297;
    float _301 = _299;
    if (_205)
    {
        float _303 = _239 * _173;
        _277 = _303;
    }
    float _305 = _277;
    if (_219)
    {
        float _307 = _255 * _161;
        _281 = _307;
    }
    float _309 = _281;
    if (_219)
    {
        float _311 = _255 * _169;
        _291 = _311;
    }
    float _313 = _291;
    if (_219)
    {
        float _315 = _255 * _175;
        _301 = _315;
    }
    float _317 = _301;
    bool _319 = !_271;
    float _337;
    if (!_319)
    {
        float _321 = in.m_52.x;
        float _323 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _325 = _321 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _327 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[12].x, _133);
        float _329 = _327 * _323;
        float _331 = floor(_329);
        float _333 = -_331;
        float _335 = _329 + _333;
        _337 = _335;
        _339 = true;
    }
    else
    {
        _337 = _177;
    }
    _339 = false;
    float _341 = _337;
    float _343 = in.m_54.x;
    float _345 = in.m_54.y;
    float _347 = _133 * (*spvDescriptorSet0.vp_c9)._m0[193].y;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _351 = _341 + _349;
    float _353 = in.m_52.x;
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _357 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _355;
    float _359 = in.m_39.x;
    float _361 = in.m_39.y;
    float _363 = in.m_39.z;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _367 = _365 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _369 = 1.0 / _357;
    float _371 = in.m_52.y;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _375 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _373;
    float _377 = 1.0 / _367;
    bool _379 = _341 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _381 = isnan(_341);
    bool _383 = _379 || _381;
    bool _385 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _387 = _383 || _385;
    float _389 = float(_387);
    bool _391 = _341 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _393 = isnan(_341);
    bool _395 = _391 || _393;
    bool _397 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _399 = _395 || _397;
    float _401 = float(_399);
    float _403 = abs(_343);
    float _405 = log2(_403);
    float _407 = fma(_353, 6.283185482025146484375, _347);
    float _409 = _351 * _369;
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _413 = _341 + _411;
    float _415 = fma((*spvDescriptorSet0.vp_c9)._m0[194].y, 0.01745329238474369049072265625, _407);
    float _417 = _167 * _361;
    float _419 = _173 * _361;
    float _421 = 1.0 / _375;
    float _423 = _415 * 0.60000002384185791015625;
    float _425 = _415 * 1.2999999523162841796875;
    float _427 = fma(_165, _359, _417);
    float _429 = _423 * 0.15915493667125701904296875;
    float _431 = _425 * 0.15915493667125701904296875;
    float _433 = fma(_171, _359, _419);
    float _435 = _405 * (*spvDescriptorSet0.vp_c9)._m0[193].z;
    float _437 = _429 * 6.283185482025146484375;
    float _439 = sin(_437);
    float _441 = _415 + 0.52359879016876220703125;
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _445 = _443 + (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _447 = _415 * 0.15915493667125701904296875;
    float _449 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _451 = _341 + _449;
    float _453 = _441 * 0.15915493667125701904296875;
    float _455 = fma(_415, 0.60000002384185791015625, 0.31415927410125732421875);
    float _457 = _371 * 628.31854248046875;
    float _459 = exp2(_435);
    float _461 = fma(_445, _353, (*spvDescriptorSet0.vp_c9)._m0[191].x);
    float _463 = _451 * _377;
    float _465 = _413 * _421;
    float _467 = fma(_415, 1.2999999523162841796875, 0.680678427219390869140625);
    float _469 = fma(_133, _461, _457);
    float _471 = _431 * 6.283185482025146484375;
    float _473 = sin(_471);
    float _475 = _467 * 0.15915493667125701904296875;
    float _477 = _455 * 0.15915493667125701904296875;
    float _479 = _447 * 6.283185482025146484375;
    float _481 = sin(_479);
    float _483 = (*spvDescriptorSet0.vp_c9)._m0[193].w * 3.1415927410125732421875;
    float _485 = _475 * 6.283185482025146484375;
    float _487 = sin(_485);
    float _489 = fma(_483, _459, _347);
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _493 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _491;
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _497 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _495;
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _501 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _499;
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _505 = _503 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _507 = fma(_493, _409, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _509 = fma(_497, _409, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _511 = in.m_56.x;
    float _513 = in.m_56.y;
    float _515 = in.m_56.z;
    float _517 = fma(_501, _409, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _521 = _519 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _525 = _523 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _527 = fma(_505, _463, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _529 = fma(_439, 0.60000002384185791015625, _481);
    float _531 = fma(_343, 0.261799395084381103515625, -0.261799395084381103515625);
    float _533 = fma(_521, _463, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _535 = fma(_525, _463, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _537 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _539 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _537;
    float _541 = _469 + _531;
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _545 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _543;
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _549 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _547;
    bool _551 = _341 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _553 = isnan(_341);
    bool _555 = _551 || _553;
    bool _557 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _559 = _555 || _557;
    float _561 = float(_559);
    float _563 = _541 * 0.89999997615814208984375;
    float _565 = fma(_539, _465, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _567 = fma(_545, _465, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _569 = fma(_549, _465, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _571 = _563 * 0.15915493667125701904296875;
    float _573 = _541 * 1.10000002384185791015625;
    bool _575 = _341 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _577 = isnan(_341);
    bool _579 = _575 || _577;
    bool _581 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _583 = _579 || _581;
    float _585 = float(_583);
    float _587 = -_561;
    float _589 = _587 + 1.0;
    float _591 = _453 * 6.283185482025146484375;
    float _593 = sin(_591);
    bool _595 = _511 > 0.0;
    float _597 = _573 * 0.15915493667125701904296875;
    float _599 = _585 * _589;
    float _601 = _541 * 0.699999988079071044921875;
    float _603 = -_585;
    float _605 = _603 + 1.0;
    bool _607 = _511 >= 0.0;
    bool _609 = isnan(_511);
    bool _611 = _607 || _609;
    bool _613 = isnan(0.0);
    bool _615 = _611 || _613;
    float _617 = fma(_353, 6.283185482025146484375, _489);
    float _619 = _477 * 6.283185482025146484375;
    float _621 = sin(_619);
    float _623 = _601 * 0.15915493667125701904296875;
    float _625 = _389 * _605;
    float _627 = -_389;
    float _629 = _627 + 1.0;
    int _631 = _615 ? 0 : 1;
    float _633 = _617 * 0.60000002384185791015625;
    float _635 = fma(_473, 0.300000011920928955078125, _529);
    float _637 = _401 * _629;
    int _639 = ~_631;
    int _641 = _639 + 1;
    int _643 = _641 + 1;
    float _645 = _617 * 0.15915493667125701904296875;
    int _647 = _643;
    if (!_595)
    {
        int _649 = ~_631;
        int _651 = _649 + 1;
        _647 = _651;
    }
    int _653 = _647;
    float _655 = _633 * 0.15915493667125701904296875;
    float _657 = _617 * 1.2999999523162841796875;
    float _659 = _509 * _637;
    float _661 = _507 * _637;
    float _663 = -_401;
    float _665 = _663 + 1.0;
    float _667 = fma(_621, 0.60000002384185791015625, _593);
    float _669 = _517 * _637;
    float _671 = -_343;
    float _673 = _671 + 1.0;
    float _675 = fma(_665, (*spvDescriptorSet0.vp_c9)._m0[143].x, _659);
    float _677 = fma(_487, 0.300000011920928955078125, _667);
    float _679 = fma(_665, (*spvDescriptorSet0.vp_c9)._m0[143].y, _661);
    float _681 = _645 * 6.283185482025146484375;
    float _683 = sin(_681);
    float _685 = _657 * 0.15915493667125701904296875;
    float _687 = fma(_665, (*spvDescriptorSet0.vp_c9)._m0[143].z, _669);
    float _689 = fma(_533, _625, _679);
    float _691 = -_345;
    float _693 = _691 + 1.0;
    float _695 = in.m_58.y;
    float _697 = _635 * _673;
    float _699 = _541 * 0.15915493667125701904296875;
    float _701 = _655 * 6.283185482025146484375;
    float _703 = sin(_701);
    float _705 = fma(_527, _625, _675);
    float _707 = fma(_535, _625, _687);
    float _709 = abs(_677);
    float _711 = _693 * _709;
    float _713 = in.m_60.x;
    float _715 = in.m_60.y;
    float _717 = in.m_60.z;
    float _719 = _697 * 0.52359879016876220703125;
    float _721 = fma(_565, _599, _705);
    float _723 = fma(_569, _599, _707);
    float _725 = _685 * 6.283185482025146484375;
    float _727 = sin(_725);
    float _729 = float(_653);
    float _731 = _719 * 0.15915493667125701904296875;
    float _733 = _711 * (-45.0);
    float _735 = _469 * 0.89999997615814208984375;
    float _737 = _469 * 0.15915493667125701904296875;
    float _739 = _571 * 6.283185482025146484375;
    float _741 = sin(_739);
    float _743 = fma(_567, _599, _689);
    float _745 = _711 * (-20.0);
    float _747 = fma(_703, 0.60000002384185791015625, _683);
    float _749 = _733 * 0.01745329238474369049072265625;
    float _751 = fma(_561, (*spvDescriptorSet0.vp_c9)._m0[146].x, _721);
    float _753 = _729 * _745;
    float _755 = fma(_561, (*spvDescriptorSet0.vp_c9)._m0[146].y, _743);
    float _757 = _699 * 6.283185482025146484375;
    float _759 = sin(_757);
    float _761 = fma(_727, 0.300000011920928955078125, _747);
    float _763 = _753 * 0.01745329238474369049072265625;
    float _765 = _749 * 0.15915493667125701904296875;
    float _767 = fma(_561, (*spvDescriptorSet0.vp_c9)._m0[146].z, _723);
    float _769 = _751 * _713;
    float _771 = _763 * 0.15915493667125701904296875;
    float _773 = fma(_695, 0.5, 0.5);
    float _775 = _623 * 6.283185482025146484375;
    float _777 = cos(_775);
    float _779 = _741 * 0.89999997615814208984375;
    float _781 = _735 * 0.15915493667125701904296875;
    float _783 = _773 * _761;
    float _785 = _755 * _715;
    float _787 = _783 * (*spvDescriptorSet0.vp_c9)._m0[193].x;
    float _789 = _597 * 6.283185482025146484375;
    float _791 = cos(_789);
    float _793 = -_779;
    float _795 = fma(_759, -1.2000000476837158203125, _793);
    float _797 = _767 * _717;
    float _799 = _787 * 0.01745329238474369049072265625;
    float _801 = abs(_795);
    bool _803 = _801 > 0.001000000047497451305389404296875;
    bool _805 = isnan(_801);
    bool _807 = _803 || _805;
    bool _809 = isnan(0.001000000047497451305389404296875);
    bool _811 = _807 || _809;
    float _813 = _799 * 0.15915493667125701904296875;
    float _815 = _731 * 6.283185482025146484375;
    float _817 = sin(_815);
    float _819 = _777 * 0.699999988079071044921875;
    float _821 = _811 ? _795 : 0.001000000047497451305389404296875;
    float _823 = _731 * 6.283185482025146484375;
    float _825 = cos(_823);
    float _827 = fma(_791, 1.10000002384185791015625, _819);
    float _829 = _513 + (-0.0199999995529651641845703125);
    float _831 = abs(_827);
    bool _833 = _831 != 0.0;
    bool _835 = isnan(_831);
    bool _837 = _833 || _835;
    bool _839 = isnan(0.0);
    bool _841 = _837 || _839;
    float _843 = _765 * 6.283185482025146484375;
    float _845 = sin(_843);
    float _847 = _817 * _511;
    float _849 = abs(_821);
    bool _851 = _849 == 0.0;
    bool _853 = !_841;
    bool _855 = _851 && _853;
    float _857 = _765 * 6.283185482025146484375;
    float _859 = cos(_857);
    float _861 = -_847;
    float _863 = fma(_825, _515, _861);
    float _865 = _825 * _511;
    float _867 = _863 + 0.02999999932944774627685546875;
    float _869 = fma(_817, _515, _865);
    float _871 = _771 * 6.283185482025146484375;
    float _873 = sin(_871);
    float _875 = _845 * _867;
    int _877 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _879 = _877 != 0;
    int _881 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _883 = _881 != 0;
    int _885 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _887 = _885 != 0;
    float _889 = abs(_821);
    bool _891 = _889 == 0.0;
    bool _893 = _219;
    int _895 = as_type<int>(_869);
    float _897 = _813;
    if (_855)
    {
        bool _899 = as_type<int>(_821) >= 0;
        _893 = _899;
    }
    bool _901 = _893;
    float _903 = _771 * 6.283185482025146484375;
    float _905 = cos(_903);
    float _907 = -_875;
    float _909 = fma(_859, _829, _907);
    float _911 = _859 * _867;
    bool _913 = !_883;
    int _915 = _913 ? 0 : 1;
    float _917 = _737 * 6.283185482025146484375;
    float _919 = cos(_917);
    float _921 = fma(_729, -0.100000001490116119384765625, _869);
    float _923 = _909 * _873;
    int _925 = _901 ? (-1) : 0;
    if (_855)
    {
        int _927 = _901 ? 0 : 1078530011;
        _895 = _927;
    }
    int _929 = _895;
    float _931 = _781 * 6.283185482025146484375;
    float _933 = cos(_931);
    float _935 = _909 * _905;
    float _937 = -_923;
    float _939 = fma(_905, _921, _937);
    bool _941 = !_879;
    int _943 = _941 ? 0 : 1;
    float _945 = fma(_873, _921, _935);
    bool _947 = !_887;
    int _949 = _947 ? 0 : 1;
    float _951 = _469 * 0.699999988079071044921875;
    float _953 = _813 * 6.283185482025146484375;
    float _955 = sin(_953);
    float _957 = _813 * 6.283185482025146484375;
    float _959 = cos(_957);
    int _961 = _929;
    if (_855)
    {
        int _963 = int(0x80000000) & as_type<int>(_827);
        int _965 = _929 | _963;
        _897 = as_type<float>(_965);
    }
    float _967 = _897;
    bool _969 = !_841;
    bool _971 = _969 && _891;
    float _973 = _967;
    float _975 = _967;
    if (!_971)
    {
        float _977 = abs(_827);
        bool _979 = _977 != as_type<float>(0x7f800000u /* inf */);
        bool _981 = isnan(_977);
        bool _983 = _979 || _981;
        bool _985 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _987 = _983 || _985;
        float _989 = abs(_821);
        bool _991 = _989 == as_type<float>(0x7f800000u /* inf */);
        float _993 = abs(_821);
        bool _995 = _993 == as_type<float>(0x7f800000u /* inf */);
        bool _997 = !_987;
        bool _999 = _995 && _997;
        if (_999)
        {
            bool _1001 = as_type<int>(_821) >= 0;
            _925 = _1001 ? (-1) : 0;
        }
        int _1003 = _925;
        if (_999)
        {
            _961 = 1075235812;
        }
        int _1005 = _961;
        int _1007 = _1005;
        if (_999)
        {
            int _1009 = ~_1003;
            int _1011 = (_1009 != 0) ? _1005 : 1061752795;
            _1007 = _1011;
        }
        int _1013 = _1007;
        if (_999)
        {
            int _1015 = int(0x80000000) & as_type<int>(_827);
            int _1017 = _1013 | _1015;
            _973 = as_type<float>(_1017);
        }
        float _1019 = _973;
        bool _1021 = !_987;
        bool _1023 = _1021 && _991;
        _975 = _1019;
        if (!_1023)
        {
            float _1025 = abs(_827);
            float _1027 = abs(_821);
            float _1029 = precise::max(_1025, _1027);
            float _1031 = abs(_827);
            float _1033 = abs(_821);
            float _1035 = precise::min(_1031, _1033);
            float _1037 = 1.0 / _1029;
            float _1039 = abs(_827);
            float _1041 = abs(_821);
            bool _1043 = _1039 > _1041;
            bool _1045 = as_type<int>(_821) >= 0;
            float _1047 = _1035 * _1037;
            float _1049 = abs(_827);
            float _1051 = abs(_821);
            float _1053 = _1049 + _1051;
            int _1055 = as_type<int>(_827) & int(0x80000000);
            float _1057 = _1047 * _1047;
            bool _1059 = _1053 > as_type<float>(0x7f800000u /* inf */);
            bool _1061 = isnan(_1053);
            bool _1063 = _1059 || _1061;
            bool _1065 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1067 = _1063 || _1065;
            float _1069 = _1057 + 11.33538818359375;
            float _1071 = fma(_1057, _1069, 28.84246826171875);
            float _1073 = fma(_1057, _1071, 19.6966705322265625);
            float _1075 = fma(_1057, -0.82336294651031494140625, -5.674867153167724609375);
            float _1077 = fma(_1057, _1075, -6.565555095672607421875);
            float _1079 = 1.0 / _1073;
            float _1081 = _1057 * _1077;
            float _1083 = _1047 * _1081;
            float _1085 = fma(_1083, _1079, _1047);
            float _1087 = _1085;
            _975 = _1053;
            if (_1043)
            {
                float _1089 = -_1085;
                float _1091 = _1089 + 1.57079637050628662109375;
                _1087 = _1091;
            }
            float _1093 = _1087;
            int _1095 = as_type<int>(_1093);
            if (!_1045)
            {
                float _1097 = -_1093;
                float _1099 = _1097 + 3.1415927410125732421875;
                _1095 = as_type<int>(_1099);
            }
            int _1101 = _1095;
            if (!_1067)
            {
                int _1103 = _1055 | _1101;
                _975 = as_type<float>(_1103);
            }
        }
    }
    float _1105 = _975;
    float _1107 = _945 + 0.0199999995529651641845703125;
    float _1109 = fma(_729, 0.100000001490116119384765625, _939);
    float _1111 = _951 * 0.15915493667125701904296875;
    float _1113 = in.m_52.z;
    float _1115 = _1107 * _955;
    float _1117 = _1107 * _959;
    float _1119 = _1105 + 1.57079637050628662109375;
    float _1121 = in.m_48.w;
    float _1123 = -_1115;
    float _1125 = fma(_1109, _959, _1123);
    float _1127 = fma(_845, _829, _911);
    float _1129 = fma(_1109, _955, _1117);
    float _1131 = _1119 * (-0.15915493667125701904296875);
    float _1133 = fma(_635, (*spvDescriptorSet0.vp_c9)._m0[194].x, _1125);
    float _1135 = _1127 + (-0.02999999932944774627685546875);
    float _1137 = _469 * 1.10000002384185791015625;
    float _1139 = _797 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1141 = in.m_50.w;
    float _1143 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1135);
    float _1145 = _769 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1147 = _1131 * 6.283185482025146484375;
    float _1149 = cos(_1147);
    float _1151 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1133);
    float _1153 = _1139 * _1143;
    float _1155 = _785 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1157 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1129);
    float _1159 = _1137 * 0.15915493667125701904296875;
    float _1161 = _1145 * _1151;
    float _1163 = _1153 * _295;
    float _1165 = _1131 * 6.283185482025146484375;
    float _1167 = sin(_1165);
    float _1169 = _1155 * _1157;
    float _1171 = _1153 * _305;
    float _1173 = fma(_1161, _265, _1163);
    float _1175 = fma(_169, _363, _427);
    float _1177 = _1113 * 6.283185482025146484375;
    float _1179 = fma(_1161, _269, _1171);
    float _1181 = -_1169;
    float _1183 = fma(_1181, _313, _1173);
    float _1185 = _1111 * 6.283185482025146484375;
    float _1187 = sin(_1185);
    float _1189 = fma(_175, _363, _433);
    float _1191 = _1177 * 0.15915493667125701904296875;
    float _1193 = -_1169;
    float _1195 = fma(_1193, _317, _1179);
    float _1197 = _1183 * _1149;
    float _1199 = _1175 + _1121;
    float _1201 = fma(_919, 1.2000000476837158203125, _933);
    float _1203 = _1189 + _1141;
    float _1205 = _1159 * 6.283185482025146484375;
    float _1207 = sin(_1205);
    float _1209 = _1183 * _1167;
    float _1211 = fma(_1195, _1167, _1197);
    float _1213 = _177 * 3.3333332538604736328125;
    float _1215 = -_1209;
    float _1217 = fma(_1195, _1149, _1215);
    float _1219 = _1199 + _1211;
    float _1221 = _1191 * 6.283185482025146484375;
    float _1223 = sin(_1221);
    float _1225 = _1203 + _1217;
    float _1227 = fma(_1201, (*spvDescriptorSet0.vp_c9)._m0[191].z, _1219);
    float _1229 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1231 = _1227 + _1229;
    float _1233 = _1191 * 6.283185482025146484375;
    float _1235 = cos(_1233);
    float _1237 = _1187 + _1207;
    float _1239 = fma(_1237, (*spvDescriptorSet0.vp_c9)._m0[191].z, _1225);
    float _1241 = _1223 * _1231;
    float _1243 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1245 = _1239 + _1243;
    float _1247 = in.m_62.y;
    float _1249 = _1235 * _1231;
    float _1251 = -_1241;
    float _1253 = fma(_1235, _1245, _1251);
    float _1255 = fma(_1223, _1245, _1249);
    float _1257 = _1253 + (*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1259 = _1255 + (*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1261 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1263 = _1257 + _1261;
    float _1265 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1267 = _1259 + _1265;
    float _1269 = _1263 * _1263;
    float _1271 = fma(_1267, _1267, _1269);
    float _1273 = sqrt(_1271);
    bool _1275 = _1273 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1277 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1279 = _1273 + _1277;
    float _1281 = 0.0 + _1213;
    float _1283 = precise::clamp(_1281, 0.0, 1.0);
    float _1285 = _1237;
    float _1287 = _1259;
    float _1289 = _1257;
    if (_1275)
    {
        float _1291 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1285 = _1291;
    }
    float _1293 = _1285;
    float _1295 = _1293;
    if (_1275)
    {
        float _1297 = _1279 * _1293;
        _1295 = _1297;
    }
    float _1299 = _1295;
    float _1301 = -_1213;
    float _1303 = _1301 + 3.3333332538604736328125;
    float _1305 = precise::clamp(_1303, 0.0, 1.0);
    float _1307 = _1153 * _285;
    float _1309 = _1299;
    if (_1275)
    {
        float _1311 = _1299 * 0.15915493667125701904296875;
        _1309 = _1311;
    }
    float _1313 = _1309;
    float _1315 = fma(_1161, _261, _1307);
    float _1317 = precise::min(_1283, _1305);
    float _1319 = _1153;
    if (_1275)
    {
        float _1321 = _1313 * 6.283185482025146484375;
        float _1323 = sin(_1321);
        _1319 = _1323;
    }
    float _1325 = _1319;
    float _1327 = _361 + _1247;
    float _1329 = -_1169;
    float _1331 = fma(_1329, _309, _1315);
    float _1333 = fma(_1317, -5.0, 5.0);
    float _1335 = -(*spvDescriptorSet0.vp_c9)._m0[192].w;
    float _1337 = _1335 + 1.0;
    float _1339 = _1327 + _1331;
    float _1341 = 5.0;
    float _1343 = _1337;
    if (_1275)
    {
        float _1345 = rsqrt(_1271);
        _1341 = _1345;
    }
    float _1347 = _1341;
    float _1349 = fma(_1199, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1351 = -_1333;
    float _1353 = fma(_1351, _1337, _1339);
    float _1355 = _1353;
    if (_1275)
    {
        float _1357 = _1353 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1343 = _1357;
    }
    float _1359 = _1343;
    float _1361 = floor(_1349);
    float _1363 = fma(_1203, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1365 = _1325;
    if (_1275)
    {
        float _1367 = fma(_1325, _1359, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1365 = _1367;
    }
    float _1369 = _1365;
    float _1371 = floor(_1363);
    float _1373 = _1369;
    if (_1275)
    {
        float _1375 = _1347 * _1369;
        _1373 = _1375;
    }
    float _1377 = _1373;
    if (_1275)
    {
        float _1379 = fma(_1267, _1377, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1287 = _1379;
    }
    float _1381 = _1287;
    if (_1275)
    {
        float _1383 = fma(_1263, _1377, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1289 = _1383;
    }
    float _1385 = _1289;
    float _1387 = -_1361;
    float _1389 = _1349 + _1387;
    float _1391 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1393 = _1381 + _1391;
    float _1395 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1397 = _1385 + _1395;
    float _1399 = fma(_1393, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1401 = fma(_1397, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1403 = -_1371;
    float _1405 = _1363 + _1403;
    float2 _4909 = float2(_1399, _1401);
    float _1407 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_4909, float2(0.0), isnan(_4909)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_4909, float2(0.0), isnan(_4909)), level(0.0)).x;
    float2 _4919 = float2(_1389, _1405);
    float _1409 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4919, float2(0.0), isnan(_4919)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4919, float2(0.0), isnan(_4919)), level(0.0)).x;
    float _1411 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1413 = int(_1411);
    int _1415 = abs(_915);
    out.m_64.x = _343;
    out.m_64.y = _345;
    int _1417 = abs(_943);
    float _1419 = -_695;
    float _1421 = _1419 + 1.0;
    int _1423 = abs(_949);
    float _1425 = _371 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1427 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1429 = int(_1427);
    float _1431 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1433 = float(_1413);
    float _1435 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1437 = fma(_353, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1435);
    float _1439 = 1.0 / _1433;
    float _1441 = float(uint(_1429));
    float _1443 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1437);
    float _1445 = 1.0 / _1441;
    float _1447 = _133 * _1439;
    float _1449 = trunc(_1447);
    int _1451 = int(_1449);
    int _1453 = as_type<int>(_1445) + (-2);
    float _1455 = float(uint(_1451));
    int _1457 = ~_1429;
    int _1459 = _1457 + 1;
    float _1461 = float(_1451);
    float _1463 = as_type<float>(_1453) * _1455;
    float _1465 = trunc(_1463);
    float _1467 = precise::max(_1465, 0.0);
    uint _1470 = uint(_1467);
    int _1472 = ~_1429;
    int _1474 = _1472 + 1;
    int _1476 = _1459 * int(_1470);
    int _1478 = _1476 + _1451;
    float _1480 = float(uint(_1478));
    float _1482 = as_type<float>(_1453) * _1480;
    int _1484 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1486 = _1484 != 0;
    float _1488 = trunc(_1482);
    float _1490 = precise::max(_1488, 0.0);
    uint _1492 = uint(_1490);
    bool _1494 = !_1486;
    float _1496 = _1494 ? 7.345489978790283203125 : 1.0;
    float _1498 = _1496 * _353;
    float _1500 = floor(_1498);
    int _1502 = int(_1470) + int(_1492);
    float _1504 = float(_1429);
    int _1506 = _1474 * _1502;
    int _1508 = _1506 + _1451;
    bool _1510 = _1461 >= _1504;
    bool _1512 = isnan(_1461);
    bool _1514 = _1510 || _1512;
    bool _1516 = isnan(_1504);
    bool _1518 = _1514 || _1516;
    float _1520 = float(_1518);
    bool _1522 = uint(_1508) >= uint(_1429);
    float _1524 = trunc(_1520);
    int _1526 = int(_1524);
    bool _1528 = !_1522;
    int _1530 = _1528 ? 0 : (-1);
    float _1532 = -_1500;
    float _1534 = _1498 + _1532;
    bool _1536 = _1429 == 0;
    int _1538 = ~_1502;
    int _1540 = _1538 + _1530;
    int _1542 = _1540 + 1;
    float _1544 = _1534 * _1504;
    float _1546 = _133 * _1504;
    int _1548 = _1429 * _1542;
    int _1550 = _1548 + _1451;
    float _1552 = _1546 * _163;
    float _1554 = trunc(_1544);
    int _1556 = int(_1554);
    int _1558 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1560 = _1558 != 0;
    int _1562 = ~_1526;
    int _1564 = _1562 + 1;
    int _1566 = _1564 + 1;
    bool _1568 = !_1536;
    int _1570 = _1568 ? _1550 : (-1);
    int _1572 = _1429 + (-1);
    float _1574 = trunc(_1552);
    int _1576 = int(_1574);
    bool _1578 = !_1560;
    int _1580 = _1578 ? 0 : 1;
    int _1582 = _1570 * _1566;
    int _1584 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1586 = _1584 != 0;
    int _1588 = abs(_1580);
    int _1590 = _1526 * _1572;
    int _1592 = _1590 + _1582;
    bool _1594 = !_1586;
    int _1596 = _1594 ? 0 : 1;
    int _1598 = _1592 * _1415;
    int _1600 = ~_1429;
    int _1602 = _1600 + 1;
    int _1604 = _1556 * _1588;
    int _1606 = _1604 + _1451;
    int _1608 = abs(_1596);
    float _1610 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1612 = _1576 * _1417;
    int _1614 = _1612 + _1598;
    int _1616 = ~_1429;
    int _1618 = _1616 + 1;
    float _1620 = float(uint(_1606));
    int _1622 = _1606 * _1423;
    int _1624 = _1622 + _1614;
    int _1626 = _1556 * _1608;
    int _1628 = _1626 + _1624;
    float _1630 = as_type<float>(_1453) * _1620;
    float _1632 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1634 = float(uint(_1628));
    float _1636 = trunc(_1630);
    float _1638 = precise::max(_1636, 0.0);
    uint _1640 = uint(_1638);
    float _1642 = fma(_1425, -2.0, _1632);
    float _1644 = as_type<float>(_1453) * _1634;
    float _1646 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1642);
    float _1648 = trunc(_1644);
    float _1650 = precise::max(_1648, 0.0);
    uint _1652 = uint(_1650);
    float _1654 = in.m_54.w;
    int _1656 = _1602 * int(_1640);
    int _1658 = _1656 + _1606;
    int _1660 = ~_1429;
    int _1662 = _1660 + 1;
    float _1664 = float(uint(_1658));
    int _1666 = _1618 * int(_1652);
    int _1668 = _1666 + _1628;
    float _1670 = as_type<float>(_1453) * _1664;
    float _1672 = float(uint(_1668));
    float _1674 = trunc(_1670);
    float _1676 = precise::max(_1674, 0.0);
    uint _1678 = uint(_1676);
    out.m_64.w = _1654;
    float _1680 = as_type<float>(_1453) * _1672;
    float _1682 = trunc(_1680);
    float _1684 = precise::max(_1682, 0.0);
    uint _1686 = uint(_1684);
    int _1688 = int(_1640) + int(_1678);
    int _1690 = int(_1652) + int(_1686);
    float _1692 = in.m_54.z;
    int _1694 = _1662 * _1690;
    int _1696 = _1694 + _1628;
    bool _1698 = uint(_1696) >= uint(_1429);
    bool _1700 = !_1698;
    int _1702 = _1700 ? 0 : (-1);
    int _1704 = ~_1690;
    int _1706 = _1704 + _1702;
    int _1708 = _1706 + 1;
    int _1710 = ~_1429;
    int _1712 = _1710 + 1;
    int _1714 = _1429 * _1708;
    int _1716 = _1714 + _1628;
    int _1718 = _1712 * _1688;
    int _1720 = _1718 + _1606;
    float _1722 = in.m_52.w;
    bool _1724 = !_1536;
    int _1726 = _1724 ? _1716 : (-1);
    out.m_64.z = _1692;
    int _1728 = _1726 & 3;
    bool _1730 = _1728 != 0;
    int _1732 = _1726 & 3;
    bool _1734 = _1732 != 0;
    int _1736 = _1730 ? 0 : 1;
    bool _1738 = uint(_1732) > 1u;
    bool _1740 = _1732 != 3;
    bool _1742 = uint(_1732) >= 2u;
    bool _1744 = _1732 != 3;
    int _1746 = _1726 >> 31;
    int _1748 = _1742 ? 0 : 1;
    int _1750 = _1746 & 3;
    int _1752 = ~_1736;
    int _1754 = _1752 + 1;
    int _1756 = _1754 + 1;
    int _1758 = _1726 + _1750;
    bool _1760 = uint(_1720) >= uint(_1429);
    int _1762 = _1758 >> 2;
    int _1764 = _1756;
    if (!_1738)
    {
        int _1766 = ~_1736;
        int _1768 = _1766 + 1;
        _1764 = _1768;
    }
    int _1770 = _1764;
    float _1772 = _353 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1774 = _1762 << 4;
    int _1776 = _1774 + 368;
    float _1778 = fma(_1407, 100.0, _1327);
    int _1780 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1782 = _1780 != 0;
    float _1784 = -_1610;
    float _1786 = fma(_1772, 2.0, _1784);
    uint _1788 = uint(int(uint(_1776) >> uint(2)));
    uint _1790 = uint(int(uint(int(_1788)) >> uint(2)));
    int _1792 = int(_1788) & 3;
    float _1794 = (*spvDescriptorSet0.vp_c9)._m0[int(_1790)][_1792];
    int _1796 = int(_1788) + 1;
    uint _1798 = uint(int(uint(_1796) >> uint(2)));
    int _1800 = _1796 & 3;
    float _1802 = (*spvDescriptorSet0.vp_c9)._m0[int(_1798)][_1800];
    int _1804 = ~_1748;
    int _1806 = _1804 + 1;
    int _1808 = _1806 + 1;
    float _1810 = -_1409;
    float _1812 = _1810 + 1.0;
    int _1814 = _1808;
    int _1816 = _1776;
    if (_1740)
    {
        int _1818 = ~_1748;
        int _1820 = _1818 + 1;
        _1814 = _1820;
    }
    int _1822 = _1814;
    float _1824 = -_133;
    float _1826 = fma(_1824, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1786);
    int _1828 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1830 = _1828 != 0;
    bool _1832 = !_1734;
    int _1834 = _1832 ? 0 : 1;
    int _1836 = _1776 + 8;
    uint _1838 = uint(int(uint(_1836) >> uint(2)));
    uint _1840 = uint(int(uint(int(_1838)) >> uint(2)));
    int _1842 = int(_1838) & 3;
    float _1844 = (*spvDescriptorSet0.vp_c9)._m0[int(_1840)][_1842];
    int _1846 = int(_1838) + 1;
    uint _1848 = uint(int(uint(_1846) >> uint(2)));
    int _1850 = _1846 & 3;
    float _1852 = (*spvDescriptorSet0.vp_c9)._m0[int(_1848)][_1850];
    int _1854 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1856 = _1854 != 0;
    float _1858 = _743;
    if (_1782)
    {
        float _1860 = in.m_52.z;
        _1858 = _1860;
    }
    float _1862 = _1858;
    bool _1864 = !_1830;
    int _1866 = _1864 ? 0 : 1;
    bool _1868 = _1722 > 0.5;
    bool _1870 = !_1744;
    int _1872 = _1870 ? 0 : (-1);
    bool _1874 = !_1760;
    int _1876 = _1874 ? 0 : (-1);
    int _1878 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1880 = _1878 != 0;
    int _1882 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1884 = _1882 != 0;
    int _1886 = _1868 ? as_type<int>(_1421) : as_type<int>(_695);
    float _1888 = _1880 ? as_type<float>(_1886) : _695;
    float _1890 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _1892 = _1868;
    if (_1856)
    {
        bool _1894 = _353 > 0.5;
        _1892 = _1894;
    }
    bool _1896 = _1892;
    float _1898 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _1900 = _371 > 0.5;
    float _1902 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1904 = _1890 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1906 = _1900 ? as_type<int>(_1421) : as_type<int>(_695);
    float _1908 = _1898 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1910 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1912 = _1902 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1914 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _1916 = _1900;
    if (_1782)
    {
        bool _1918 = _1862 > 0.5;
        _1916 = _1918;
    }
    bool _1920 = _1916;
    float _1922 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _1924 = abs(_1770);
    float _1926 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1928 = _1884 ? as_type<float>(_1906) : _695;
    out.m_66.x = _1904;
    out.m_66.y = _1908;
    out.m_66.z = _1912;
    out.m_66.w = _1910;
    int _1930 = abs(_1834);
    float _1932 = _1914 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1934 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1936 = int(_1934);
    float _1938 = _1922 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1940 = _1926 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1942 = abs(_1822);
    float _1944 = in.m_58.x;
    int _1946 = abs(_1866);
    float _1948 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1431);
    int _1950 = ~_1688;
    int _1952 = _1950 + _1876;
    int _1954 = _1952 + 1;
    out.m_68.x = _1932;
    out.m_68.y = _1938;
    out.m_68.z = _1940;
    float _1956 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1948);
    int _1958 = ~_1924;
    int _1960 = _1958 + 1;
    int _1962 = _1960 + 1;
    int _1964 = _1429 * _1954;
    int _1966 = _1964 + _1606;
    int _1968 = ~_1930;
    int _1970 = _1968 + 1;
    int _1972 = _1970 + 1;
    int _1974 = _1962 * as_type<int>(_1802);
    int _1976 = abs(_1936);
    bool _1978 = !_1536;
    int _1980 = _1978 ? _1966 : (-1);
    int _1982 = _1972 * as_type<int>(_1794);
    int _1984 = _1982 + _1974;
    float _1986 = in.m_70.x;
    float _1988 = in.m_70.y;
    float _1990 = in.m_70.z;
    float _1992 = in.m_70.w;
    int _1994 = abs(_1872);
    int _1996 = ~_1942;
    int _1998 = _1996 + 1;
    int _2000 = _1998 + 1;
    int _2002 = ~_1994;
    int _2004 = _2002 + 1;
    int _2006 = _2004 + 1;
    float _2008 = float(uint(_1936));
    int _2010 = _2000 * as_type<int>(_1844);
    int _2012 = _2010 + _1984;
    float _2014 = float(uint(_1976));
    float _2016 = 1.0 / _2008;
    int _2018 = _2006 * as_type<int>(_1852);
    int _2020 = _2018 + _2012;
    int _2022 = ~_1946;
    int _2024 = _2022 + 1;
    int _2026 = _2024 + 1;
    bool _2028 = _1129 != 0.0;
    bool _2030 = isnan(_1129);
    bool _2032 = _2028 || _2030;
    bool _2034 = isnan(0.0);
    bool _2036 = _2032 || _2034;
    float _2038 = as_type<float>(_1942);
    float _2040 = as_type<float>(_1984);
    if (!_1856)
    {
        _2038 = _1944;
    }
    float _2042 = _2038;
    int _2044 = _2020 * _2026;
    float _2046 = 1.0 / _2014;
    bool _2048 = _1133 == 0.0;
    bool _2050 = !_2036;
    bool _2052 = _2048 && _2050;
    int _2054 = _1980 * _1946;
    int _2056 = _2054 + _2044;
    float _2058 = _305 * _1990;
    bool _2060 = _1127 == 0.02999999932944774627685546875;
    bool _2062 = _2060 && _2052;
    float _2064 = _285 * _1990;
    float _2066 = in.m_72.x;
    float _2068 = in.m_72.y;
    float _2070 = in.m_72.z;
    int _2072 = as_type<int>(_2016) + (-2);
    float _2074 = fma(_269, _1986, _2058);
    float _2076 = float(uint(_2056));
    float _2078 = fma(_261, _1986, _2064);
    int _2080 = abs(_2056);
    float _2082 = _295 * _1990;
    float _2084 = _2042;
    if (!_1856)
    {
        _2040 = _2042;
    }
    float _2086 = _2040;
    float _2088 = as_type<float>(_2072) * _2076;
    int _2090 = as_type<int>(_2046) + (-2);
    float _2092 = fma(_265, _1986, _2082);
    float _2094 = float(uint(_2080));
    float _2096 = trunc(_2088);
    float _2098 = precise::max(_2096, 0.0);
    uint _2100 = uint(_2098);
    int _2102 = as_type<int>(_2088);
    float _2104 = _2086;
    if (_1856)
    {
        _2084 = _1944;
    }
    float _2106 = _2084;
    float _2108 = -_1988;
    float _2110 = fma(_313, _2108, _2092);
    int _2112 = ~_1936;
    int _2114 = _2112 + 1;
    float _2116 = as_type<float>(_2090) * _2094;
    float _2118 = -_1988;
    float _2120 = fma(_309, _2118, _2078);
    int _2122 = ~_1976;
    int _2124 = _2122 + 1;
    float _2126 = -_1988;
    float _2128 = fma(_317, _2126, _2074);
    float _2130 = _2106;
    float _2132 = _2128;
    float _2134 = _2110;
    if (_1782)
    {
        float _2136 = -_2106;
        float _2138 = _2136 + 1.0;
        _1816 = as_type<int>(_2138);
    }
    int _2140 = _1816;
    if (_1856)
    {
        float _2142 = -_2106;
        float _2144 = _2142 + 1.0;
        _2102 = as_type<int>(_2144);
    }
    int _2146 = _2102;
    float _2148 = trunc(_2116);
    float _2150 = precise::max(_2148, 0.0);
    uint _2152 = uint(_2150);
    out.m_74.x = _2110;
    out.m_74.y = _2120;
    out.m_74.z = _2128;
    if (_1856)
    {
        float _2154 = _1896 ? as_type<float>(_2146) : _2106;
        _2104 = _2154;
    }
    float _2156 = _2104;
    int _2158 = _2114 * int(_2100);
    int _2160 = _2158 + _2056;
    float _2162 = as_type<float>(_2160);
    if (_1782)
    {
        float _2164 = _1920 ? as_type<float>(_2140) : _2106;
        _2130 = _2164;
    }
    float _2166 = _2130;
    float _2168 = float(uint(_2160));
    float _2170 = _2168;
    if (_2062)
    {
        _2132 = _2068;
    }
    float _2172 = _2132;
    float _2174 = _2166 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _2176 = _2124 * int(_2152);
    int _2178 = _2176 + _2080;
    float _2180 = as_type<float>(_2072) * _2168;
    float _2182 = _2172;
    if (_2062)
    {
        _2162 = _2172;
    }
    float _2184 = _2162;
    float _2186 = _2184;
    if (!_2062)
    {
        _2182 = _2068;
    }
    float _2188 = _2182;
    float _2190 = float(uint(_2178));
    float _2192 = trunc(_2180);
    float _2194 = precise::max(_2192, 0.0);
    uint _2196 = uint(_2194);
    if (_2062)
    {
        _2134 = _2066;
    }
    float _2198 = _2134;
    float _2200 = _2198;
    if (!_2062)
    {
        float _2202 = fma(_1133, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2066);
        _2200 = _2202;
    }
    float _2204 = _2200;
    if (!_2062)
    {
        float _2206 = fma(_1129, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2188);
        _2186 = _2206;
    }
    float _2208 = _2186;
    float _2210 = as_type<float>(_2090) * _2190;
    float _2212 = _1990 * _2066;
    if (_2062)
    {
        _2170 = _2070;
    }
    float _2214 = _2170;
    float _2216 = _1988 * _2070;
    float _2218 = _2214;
    if (!_2062)
    {
        float _2220 = fma(_1135, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2070);
        _2218 = _2220;
    }
    float _2222 = _2218;
    float _2224 = -_2212;
    float _2226 = fma(_1986, _2070, _2224);
    float _2228 = trunc(_2210);
    float _2230 = precise::max(_2228, 0.0);
    uint _2232 = uint(_2230);
    float _2234 = _1986 * _2188;
    float _2236 = -_2216;
    float _2238 = fma(_1990, _2188, _2236);
    float _2240 = _295 * _2222;
    float _2242 = _285 * _2222;
    float _2244 = _305 * _2222;
    float _2246 = -_2234;
    float _2248 = fma(_1988, _2066, _2246);
    float _2250 = fma(_265, _2204, _2240);
    float _2252 = fma(_261, _2204, _2242);
    float _2254 = fma(_269, _2204, _2244);
    int _2256 = int(_2100) + int(_2196);
    float _2258 = _2248 * _1992;
    int _2260 = ~_1936;
    int _2262 = _2260 + 1;
    float _2264 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _2266 = ~_1976;
    int _2268 = _2266 + 1;
    float _2270 = _2258 * _295;
    int _2272 = int(_2152) + int(_2232);
    float _2274 = _2226 * _1992;
    float _2276 = _2238 * _1992;
    int _2278 = _2262 * _2256;
    int _2280 = _2278 + _2056;
    float _2282 = _2258 * _285;
    int _2284 = _2268 * _2272;
    int _2286 = _2284 + _2080;
    float _2288 = _2258 * _305;
    float _2290 = fma(_2276, _265, _2270);
    bool _2292 = uint(_2280) >= uint(_1936);
    float _2294 = fma(_2276, _261, _2282);
    bool _2296 = uint(_2286) >= uint(_1976);
    float _2298 = -_2208;
    float _2300 = fma(_313, _2298, _2250);
    bool _2302 = !_2292;
    int _2304 = _2302 ? 0 : (-1);
    float _2306 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2308 = _2056 ^ _1936;
    float _2310 = -_2208;
    float _2312 = fma(_317, _2310, _2254);
    bool _2314 = !_2296;
    int _2316 = _2314 ? 0 : (-1);
    float _2318 = fma(_2276, _269, _2288);
    int _2320 = ~_2256;
    int _2322 = _2320 + _2304;
    int _2324 = _2322 + 1;
    float _2326 = _2264 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    uint _2328 = uint(int(uint(_2308) >> uint(31)));
    float _2330 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2332 = ~_2316;
    int _2334 = _2272 + _2332;
    int _2336 = _2334 + 1;
    int _2338 = _1936 * _2324;
    int _2340 = _2338 + _2056;
    int _2342 = ~int(_2328);
    int _2344 = _2342 + 1;
    float _2346 = _2300 * _1167;
    bool _2348 = _1936 == 0;
    float _2350 = fma(_2326, _2156, -0.5);
    int _2352 = _2336 ^ _2344;
    float _2354 = _265;
    float _2356 = _2326;
    if (_1275)
    {
        float _2358 = _1313 * 6.283185482025146484375;
        float _2360 = cos(_2358);
        _2354 = _2360;
    }
    float _2362 = _2354;
    bool _2364 = !_2348;
    int _2366 = _2364 ? _2340 : (-1);
    float _2368 = _2306 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _2370 = ~_2344;
    int _2372 = _2370 + _2352;
    int _2374 = _2372 + 1;
    float _2376 = -_2346;
    float _2378 = fma(_2312, _1149, _2376);
    bool _2380 = _1936 == 0;
    float _2382 = fma(_2368, _1928, -0.5);
    float _2384 = float(_2366);
    float _2386 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _2388 = !_2380;
    int _2390 = _2388 ? _2374 : (-1);
    float _2392 = _1888 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2394 = -_2274;
    float _2396 = fma(_2394, _313, _2290);
    float _2398 = fma(_2326, _2384, _1826);
    float _2400 = float(_2390);
    float _2402 = _2300 * _1149;
    float _2404 = fma(_1443, _2350, _2398);
    float _2406 = _1778 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2408 = -_1646;
    float _2410 = fma(_2368, _2400, _2408);
    float _2412 = -_2208;
    float _2414 = fma(_309, _2412, _2252);
    float _2416 = _2392 * _2330;
    float _2418 = fma(_1199, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2406);
    float _2420 = _2330;
    if (_1275)
    {
        float _2422 = _2362 + (-1.0);
        _2420 = _2422;
    }
    float _2424 = _2420;
    float _2426 = -_2274;
    float _2428 = fma(_2426, _317, _2318);
    float _2430 = fma(_1956, _2382, _2410);
    float _2432 = -_2274;
    float _2434 = fma(_2432, _309, _2294);
    float _2436 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2418);
    if (_1275)
    {
        float _2438 = _2424 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2356 = _2438;
    }
    float _2440 = _2356;
    float _2442 = _2174 * _2386;
    float _2444 = _2404 + 0.5;
    float _2446 = _2430 + 0.5;
    out.m_76.x = _2396;
    out.m_76.y = _2434;
    out.m_76.z = _2428;
    if (_1275)
    {
        float _2448 = fma(_1353, _2362, _2440);
        _1355 = _2448;
    }
    float _2450 = _1355;
    float _2452 = fma(_2312, _1167, _2402);
    out.m_78.x = _2444;
    out.m_78.y = _2446;
    out.m_78.z = _2442;
    out.m_78.w = _2416;
    float _2454 = _1223 * _2452;
    float _2456 = _1235 * _2452;
    float _2458 = in.m_62.x;
    float _2460 = -_2454;
    float _2462 = fma(_1235, _2378, _2460);
    float _2464 = fma(_1223, _2378, _2456);
    float _2466 = _1778 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2468 = _2436 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2470 = fma(_1199, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2466);
    out.m_80.x = _2464;
    out.m_80.y = _2414;
    out.m_80.z = _2462;
    float _2472 = 1.0 / _2468;
    float _2474 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2470);
    float _2476 = _2474 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2478 = _2476 + _2468;
    float _2480 = _2478 * _2472;
    float _2482 = _2480 * 0.5;
    float _2484 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2486 = fma(_2482, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2484);
    float _2488 = 1.0 / _2486;
    float _2490 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2492 = _2488 * _2490;
    float _2494 = abs(_2492);
    float _2496 = log2(_2494);
    bool _2498 = _2492 <= 8000.0;
    bool _2500 = isnan(_2492);
    bool _2502 = _2498 || _2500;
    bool _2504 = isnan(8000.0);
    bool _2506 = _2502 || _2504;
    float _2508 = float(_2506);
    float _2510 = _2496 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2512 = exp2(_2510);
    float _2514 = fma(_2512, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2516 = precise::clamp(_2514, 0.0, 1.0);
    float _2518 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2520 = _1381 + _2518;
    float _2522 = fma(_2516, -2.0, 3.0);
    float _2524 = _2516 * _2516;
    float _2526 = _2524 * _2522;
    float _2528 = fma(_1407, 100.0, _2450);
    float _2530 = -_2526;
    float _2532 = _2530 + 1.0;
    float _2534 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2536 = _2528 + _2534;
    float _2538 = _2528 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    out.m_82.x = _1381;
    out.m_82.y = _2528;
    out.m_82.z = _1385;
    float _2540 = fma(_2532, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2526);
    float _2542 = _2536 * _2536;
    float _2544 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2546 = _1385 + _2544;
    float _2548 = fma(_1381, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2538);
    float _2550 = _2508 * _2540;
    float _2552 = fma(_2520, _2520, _2542);
    float _2554 = _2528 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2556 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2548);
    float _2558 = _2550 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2560 = fma(_2546, _2546, _2552);
    float _2562 = _2528 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2564 = _2528 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2566 = fma(_1381, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2554);
    float _2568 = _1812 * _2558;
    float _2570 = precise::clamp(_2568, 0.0, 1.0);
    float _2572 = fma(_1381, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2562);
    float _2574 = fma(_1381, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2564);
    float _2576 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2566);
    float _2578 = -_2570;
    float _2580 = fma(_2578, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2582 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2572);
    float _2584 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2574);
    float _2586 = _2576 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2588 = sqrt(_2560);
    float _2590 = _2582 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2592 = _2584 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2594 = _2556 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2596 = _2580 * _2458;
    float _2598 = _2590 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2600 = _2590 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2602 = _2590 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2604 = _2590 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2606 = fma(_2592, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2598);
    float _2608 = fma(_2592, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2600);
    float _2610 = fma(_2592, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2602);
    float _2612 = fma(_2592, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2604);
    float _2614 = fma(_2586, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2606);
    float _2616 = fma(_2586, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2608);
    float _2618 = fma(_2586, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2610);
    float _2620 = fma(_2586, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2612);
    float _2622 = fma(_2594, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2614);
    float _2624 = fma(_2594, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2616);
    float _2626 = fma(_2594, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2618);
    float _2628 = fma(_2594, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2620);
    float _2630 = _2596 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    bool _2632 = _2588 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2634 = isnan(_2588);
    bool _2636 = _2632 || _2634;
    bool _2638 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2640 = _2636 || _2638;
    out.gl_Position.x = _2622;
    out.gl_Position.y = _2624;
    out.gl_Position.z = _2626;
    out.gl_Position.w = _2628;
    out.m_84.x = _2630;
    float _2642 = _2618;
    float _2644 = _2586;
    float _2646 = _2616;
    float _2648 = _2590;
    float _2650 = _2614;
    float _2652 = _2592;
    if (!_2640)
    {
        _2642 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2654 = _2642;
    float _2656 = _2654;
    float _2658 = _2654;
    if (!_2640)
    {
        _2644 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2660 = _2644;
    float _2662 = _2660;
    float _2664 = _2660;
    if (!_2640)
    {
        _2646 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2666 = _2646;
    float _2668 = _2666;
    float _2670 = _2666;
    if (!_2640)
    {
        _2648 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2672 = _2648;
    float _2674 = _2672;
    float _2676 = _2672;
    if (!_2640)
    {
        _2650 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2678 = _2650;
    float _2680 = _2678;
    float _2682 = _2678;
    if (!_2640)
    {
        _2652 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2684 = _2652;
    bool _2686 = !_2640;
    float _2688 = _2684;
    float _2690 = _2684;
    if (!_2686)
    {
        bool _2692 = _2588 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2694 = isnan(_2588);
        bool _2696 = _2692 || _2694;
        bool _2698 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2700 = _2696 || _2698;
        if (!_2700)
        {
            float _2702 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2704 = _2588 + _2702;
            float _2706 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2708 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2706;
            float _2710 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2712 = _2710 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2714 = 1.0 / _2708;
            float _2716 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2718 = _2716 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2720 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2722 = _2720 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2724 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2726 = _2724 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2728 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2730 = _2728 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2732 = _2704 * _2714;
            float _2734 = precise::clamp(_2732, 0.0, 1.0);
            float _2736 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2738 = _2736 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2740 = fma(_2734, _2712, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2742 = fma(_2734, _2738, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2744 = fma(_2734, _2718, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2746 = fma(_2734, _2722, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2748 = fma(_2734, _2726, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2750 = fma(_2734, _2730, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2664 = _2740;
            _2682 = _2748;
            _2658 = _2744;
            _2676 = _2746;
            _2670 = _2742;
            _2690 = _2750;
            _2752 = true;
        }
        else
        {
            bool _2754 = _2588 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2756 = isnan(_2588);
            bool _2758 = _2754 || _2756;
            bool _2760 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2762 = _2758 || _2760;
            if (!_2762)
            {
                _2656 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2764 = _2656;
            _2658 = _2764;
            if (!_2762)
            {
                _2662 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2766 = _2662;
            _2664 = _2766;
            if (!_2762)
            {
                _2668 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2768 = _2668;
            _2670 = _2768;
            if (!_2762)
            {
                _2674 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2770 = _2674;
            _2676 = _2770;
            if (!_2762)
            {
                _2680 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2772 = _2680;
            _2682 = _2772;
            if (!_2762)
            {
                _2688 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2774 = _2688;
            bool _2776 = !_2762;
            _2690 = _2774;
            if (!_2776)
            {
                bool _2778 = _2588 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2780 = isnan(_2588);
                bool _2782 = _2778 || _2780;
                bool _2784 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2786 = _2782 || _2784;
                if (!_2786)
                {
                    float _2788 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2790 = _2588 + _2788;
                    float _2792 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2794 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2792;
                    float _2796 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2798 = _2796 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2800 = 1.0 / _2794;
                    float _2802 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2804 = _2802 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2806 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2808 = _2806 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2810 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2812 = _2810 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2814 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2816 = _2814 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2818 = _2790 * _2800;
                    float _2820 = precise::clamp(_2818, 0.0, 1.0);
                    float _2822 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2824 = _2822 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2826 = fma(_2820, _2798, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2828 = fma(_2820, _2824, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2830 = fma(_2820, _2804, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2832 = fma(_2820, _2808, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2834 = fma(_2820, _2812, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2836 = fma(_2820, _2816, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2664 = _2826;
                    _2682 = _2834;
                    _2658 = _2830;
                    _2676 = _2832;
                    _2670 = _2828;
                    _2690 = _2836;
                    _2752 = true;
                }
                else
                {
                    _2664 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2682 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2658 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2676 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2670 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2690 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2752 = false;
    float _2838 = _2664;
    float _2840 = _2682;
    float _2842 = _2658;
    float _2844 = _2676;
    float _2846 = _2670;
    float _2848 = _2690;
    float _2850 = fma(_2414, -0.5, 0.5);
    float _2852 = precise::clamp(_2850, 0.0, 1.0);
    float _2854 = -_2838;
    float _2856 = _2854 + _2840;
    float _2858 = -_2842;
    float _2860 = _2858 + _2844;
    float _2862 = -_2846;
    float _2864 = _2862 + _2848;
    bool _2866 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2868 = fma(_2852, _2856, _2838);
    float _2870 = fma(_2852, _2860, _2842);
    float _2872 = fma(_2852, _2864, _2846);
    float _2874 = _2868 * 0.586610972881317138671875;
    out.m_86.x = 0.0;
    float _2876 = fma(_2870, 0.298911988735198974609375, _2874);
    float _2878 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_42.x = 1.0;
    float _2880 = fma(_2872, 0.114477999508380889892578125, _2876);
    float _2882 = -_2880;
    float _2884 = _2870 + _2882;
    float _2886 = -_2880;
    float _2888 = _2868 + _2886;
    float _2890 = -_2880;
    float _2892 = _2872 + _2890;
    out.m_84.w = _2878;
    float _2894 = fma(_2884, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2880);
    float _2896 = fma(_2888, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2880);
    float _2898 = fma(_2892, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2880);
    out.m_88.x = _2894;
    out.m_88.y = _2896;
    out.m_88.z = _2898;
    if (!_2866)
    {
        return out;
    }
    float _2900 = -_2528;
    float _2902 = _2900 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2904 = -_1381;
    float _2906 = _2904 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2908 = -_1385;
    float _2910 = _2908 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2912 = _2902 * _2902;
    float _2914 = fma(_2906, _2906, _2912);
    float _2916 = fma(_2910, _2910, _2914);
    float _2918 = sqrt(_2916);
    float _2920 = rsqrt(_2916);
    float _2922 = -_2918;
    float _2924 = _2922 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2926 = _2924 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2928 = precise::clamp(_2926, 0.0, 1.0);
    float _2930 = _2906 * _2920;
    float _2932 = _2902 * _2920;
    float _2934 = abs(_2928);
    float _2936 = log2(_2934);
    float _2938 = _2910 * _2920;
    float _2940 = _2930 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2942 = _2414 * _2932;
    float _2944 = -_2932;
    float _2946 = -_2940;
    float _2948 = fma(_2944, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2946);
    float _2950 = fma(_2464, _2930, _2942);
    float _2952 = -_2938;
    float _2954 = fma(_2952, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2948);
    float _2956 = fma(_2462, _2938, _2950);
    float _2958 = precise::clamp(_2956, 0.0, 1.0);
    float _2960 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2962 = _2954 + _2960;
    float _2964 = _2936 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2966 = _2962 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2968 = precise::clamp(_2966, 0.0, 1.0);
    float _2970 = exp2(_2964);
    float _2972 = _2970 * _2968;
    float _2974 = _2958 * _2972;
    float _2976 = _2974 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2978 = _2974 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2980 = _2974 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_86.x = _2976;
    out.m_86.y = _2978;
    out.m_86.z = _2980;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint dm_vid [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_42 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2752 = false;
    bool _339 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _102 = in.m_39.w;
    float _104 = trunc(_102);
    int _107 = int(_104);
    bool _111 = _107 >= 1;
    float _113 = 0.0;
    float _115 = as_type<float>(_107);
    if (!_111)
    {
        _113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _113;
    if (!_111)
    {
        out.m_42.x = 0.0;
    }
    int _119 = 0;
    if (!_111)
    {
        float _121 = _117 * 5.0;
        _119 = as_type<int>(_121);
    }
    int _123 = _119;
    int _125 = _123;
    if (!_111)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3038 = as_type<float>(_123);
        out.gl_Position.z = _3038;
    }
    if (!_111)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _127 = in.m_44.w;
    float _129 = float(_107);
    float _131 = -_127;
    float _133 = _131 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = _127 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = isnan(_127);
    bool _139 = _135 || _137;
    bool _141 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _143 = _139 || _141;
    bool _145 = _133 >= _129;
    bool _147 = !_143;
    bool _149 = _145 || _147;
    if (_149)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _151 = _115;
    if (_149)
    {
        out.m_42.x = 0.0;
    }
    if (_149)
    {
        float _153 = _151 * 5.0;
        _125 = as_type<int>(_153);
    }
    int _155 = _125;
    if (_149)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3101 = as_type<float>(_155);
        out.gl_Position.z = _3101;
    }
    if (_149)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _157 = in.m_46.x;
    float _159 = in.m_46.y;
    float _161 = in.m_46.z;
    float _163 = 1.0 / _129;
    float _165 = in.m_48.x;
    float _167 = in.m_48.y;
    float _169 = in.m_48.z;
    float _171 = in.m_50.x;
    float _173 = in.m_50.y;
    float _175 = in.m_50.z;
    float _177 = _133 * _163;
    float _179 = _157 * _157;
    float _181 = _159 * _159;
    float _183 = _161 * _161;
    float _185 = fma(_165, _165, _179);
    float _187 = fma(_167, _167, _181);
    float _189 = fma(_169, _169, _183);
    float _191 = fma(_171, _171, _185);
    float _193 = fma(_173, _173, _187);
    float _195 = fma(_175, _175, _189);
    float _197 = sqrt(_191);
    float _199 = sqrt(_193);
    float _201 = sqrt(_195);
    bool _203 = _197 > 0.0;
    bool _205 = _199 > 0.0;
    float _207 = _199;
    float _209 = _197;
    if (_203)
    {
        float _211 = rsqrt(_191);
        _207 = _211;
    }
    float _213 = _207;
    float _215 = 0.0;
    if (!_203)
    {
        _215 = 0.0;
    }
    float _217 = _215;
    bool _219 = _201 > 0.0;
    float _221 = 0.0;
    float _223 = _217;
    if (!_203)
    {
        _221 = 0.0;
    }
    float _225 = _221;
    float _227 = 0.0;
    float _229 = _225;
    if (!_203)
    {
        _227 = 0.0;
    }
    float _231 = _227;
    float _233 = _201;
    float _235 = _231;
    if (_205)
    {
        float _237 = rsqrt(_193);
        _233 = _237;
    }
    float _239 = _233;
    float _241 = 0.0;
    if (!_205)
    {
        _241 = 0.0;
    }
    float _243 = _241;
    float _245 = _243;
    if (!_205)
    {
        _209 = 0.0;
    }
    float _247 = _209;
    float _249 = 0.0;
    float _251 = _247;
    if (_219)
    {
        float _253 = rsqrt(_195);
        _249 = _253;
    }
    float _255 = _249;
    float _257 = _213;
    if (_203)
    {
        float _259 = _213 * _157;
        _223 = _259;
    }
    float _261 = _223;
    if (_203)
    {
        float _263 = _213 * _165;
        _229 = _263;
    }
    float _265 = _229;
    if (_203)
    {
        float _267 = _213 * _171;
        _235 = _267;
    }
    float _269 = _235;
    bool _271 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    if (!_205)
    {
        _257 = 0.0;
    }
    float _273 = _257;
    float _275 = 0.0;
    float _277 = _273;
    if (!_219)
    {
        _275 = 0.0;
    }
    float _279 = _275;
    float _281 = _279;
    if (_205)
    {
        float _283 = _239 * _159;
        _245 = _283;
    }
    float _285 = _245;
    float _287 = 0.0;
    if (!_219)
    {
        _287 = 0.0;
    }
    float _289 = _287;
    float _291 = _289;
    if (_205)
    {
        float _293 = _239 * _167;
        _251 = _293;
    }
    float _295 = _251;
    float _297 = 0.0;
    if (!_219)
    {
        _297 = 0.0;
    }
    float _299 = _297;
    float _301 = _299;
    if (_205)
    {
        float _303 = _239 * _173;
        _277 = _303;
    }
    float _305 = _277;
    if (_219)
    {
        float _307 = _255 * _161;
        _281 = _307;
    }
    float _309 = _281;
    if (_219)
    {
        float _311 = _255 * _169;
        _291 = _311;
    }
    float _313 = _291;
    if (_219)
    {
        float _315 = _255 * _175;
        _301 = _315;
    }
    float _317 = _301;
    bool _319 = !_271;
    float _337;
    if (!_319)
    {
        float _321 = in.m_52.x;
        float _323 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _325 = _321 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _327 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[12].x, _133);
        float _329 = _327 * _323;
        float _331 = floor(_329);
        float _333 = -_331;
        float _335 = _329 + _333;
        _337 = _335;
        _339 = true;
    }
    else
    {
        _337 = _177;
    }
    _339 = false;
    float _341 = _337;
    float _343 = in.m_54.x;
    float _345 = in.m_54.y;
    float _347 = _133 * (*spvDescriptorSet0.vp_c9)._m0[193].y;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _351 = _341 + _349;
    float _353 = in.m_52.x;
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _357 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _355;
    float _359 = in.m_39.x;
    float _361 = in.m_39.y;
    float _363 = in.m_39.z;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _367 = _365 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _369 = 1.0 / _357;
    float _371 = in.m_52.y;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _375 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _373;
    float _377 = 1.0 / _367;
    bool _379 = _341 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _381 = isnan(_341);
    bool _383 = _379 || _381;
    bool _385 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _387 = _383 || _385;
    float _389 = float(_387);
    bool _391 = _341 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _393 = isnan(_341);
    bool _395 = _391 || _393;
    bool _397 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _399 = _395 || _397;
    float _401 = float(_399);
    float _403 = abs(_343);
    float _405 = log2(_403);
    float _407 = fma(_353, 6.283185482025146484375, _347);
    float _409 = _351 * _369;
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _413 = _341 + _411;
    float _415 = fma((*spvDescriptorSet0.vp_c9)._m0[194].y, 0.01745329238474369049072265625, _407);
    float _417 = _167 * _361;
    float _419 = _173 * _361;
    float _421 = 1.0 / _375;
    float _423 = _415 * 0.60000002384185791015625;
    float _425 = _415 * 1.2999999523162841796875;
    float _427 = fma(_165, _359, _417);
    float _429 = _423 * 0.15915493667125701904296875;
    float _431 = _425 * 0.15915493667125701904296875;
    float _433 = fma(_171, _359, _419);
    float _435 = _405 * (*spvDescriptorSet0.vp_c9)._m0[193].z;
    float _437 = _429 * 6.283185482025146484375;
    float _439 = sin(_437);
    float _441 = _415 + 0.52359879016876220703125;
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _445 = _443 + (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _447 = _415 * 0.15915493667125701904296875;
    float _449 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _451 = _341 + _449;
    float _453 = _441 * 0.15915493667125701904296875;
    float _455 = fma(_415, 0.60000002384185791015625, 0.31415927410125732421875);
    float _457 = _371 * 628.31854248046875;
    float _459 = exp2(_435);
    float _461 = fma(_445, _353, (*spvDescriptorSet0.vp_c9)._m0[191].x);
    float _463 = _451 * _377;
    float _465 = _413 * _421;
    float _467 = fma(_415, 1.2999999523162841796875, 0.680678427219390869140625);
    float _469 = fma(_133, _461, _457);
    float _471 = _431 * 6.283185482025146484375;
    float _473 = sin(_471);
    float _475 = _467 * 0.15915493667125701904296875;
    float _477 = _455 * 0.15915493667125701904296875;
    float _479 = _447 * 6.283185482025146484375;
    float _481 = sin(_479);
    float _483 = (*spvDescriptorSet0.vp_c9)._m0[193].w * 3.1415927410125732421875;
    float _485 = _475 * 6.283185482025146484375;
    float _487 = sin(_485);
    float _489 = fma(_483, _459, _347);
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _493 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _491;
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _497 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _495;
    float _499 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _501 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _499;
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _505 = _503 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _507 = fma(_493, _409, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _509 = fma(_497, _409, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _511 = in.m_56.x;
    float _513 = in.m_56.y;
    float _515 = in.m_56.z;
    float _517 = fma(_501, _409, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _521 = _519 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _525 = _523 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _527 = fma(_505, _463, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _529 = fma(_439, 0.60000002384185791015625, _481);
    float _531 = fma(_343, 0.261799395084381103515625, -0.261799395084381103515625);
    float _533 = fma(_521, _463, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _535 = fma(_525, _463, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _537 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _539 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _537;
    float _541 = _469 + _531;
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _545 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _543;
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _549 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _547;
    bool _551 = _341 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _553 = isnan(_341);
    bool _555 = _551 || _553;
    bool _557 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _559 = _555 || _557;
    float _561 = float(_559);
    float _563 = _541 * 0.89999997615814208984375;
    float _565 = fma(_539, _465, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _567 = fma(_545, _465, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _569 = fma(_549, _465, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _571 = _563 * 0.15915493667125701904296875;
    float _573 = _541 * 1.10000002384185791015625;
    bool _575 = _341 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _577 = isnan(_341);
    bool _579 = _575 || _577;
    bool _581 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _583 = _579 || _581;
    float _585 = float(_583);
    float _587 = -_561;
    float _589 = _587 + 1.0;
    float _591 = _453 * 6.283185482025146484375;
    float _593 = sin(_591);
    bool _595 = _511 > 0.0;
    float _597 = _573 * 0.15915493667125701904296875;
    float _599 = _585 * _589;
    float _601 = _541 * 0.699999988079071044921875;
    float _603 = -_585;
    float _605 = _603 + 1.0;
    bool _607 = _511 >= 0.0;
    bool _609 = isnan(_511);
    bool _611 = _607 || _609;
    bool _613 = isnan(0.0);
    bool _615 = _611 || _613;
    float _617 = fma(_353, 6.283185482025146484375, _489);
    float _619 = _477 * 6.283185482025146484375;
    float _621 = sin(_619);
    float _623 = _601 * 0.15915493667125701904296875;
    float _625 = _389 * _605;
    float _627 = -_389;
    float _629 = _627 + 1.0;
    int _631 = _615 ? 0 : 1;
    float _633 = _617 * 0.60000002384185791015625;
    float _635 = fma(_473, 0.300000011920928955078125, _529);
    float _637 = _401 * _629;
    int _639 = ~_631;
    int _641 = _639 + 1;
    int _643 = _641 + 1;
    float _645 = _617 * 0.15915493667125701904296875;
    int _647 = _643;
    if (!_595)
    {
        int _649 = ~_631;
        int _651 = _649 + 1;
        _647 = _651;
    }
    int _653 = _647;
    float _655 = _633 * 0.15915493667125701904296875;
    float _657 = _617 * 1.2999999523162841796875;
    float _659 = _509 * _637;
    float _661 = _507 * _637;
    float _663 = -_401;
    float _665 = _663 + 1.0;
    float _667 = fma(_621, 0.60000002384185791015625, _593);
    float _669 = _517 * _637;
    float _671 = -_343;
    float _673 = _671 + 1.0;
    float _675 = fma(_665, (*spvDescriptorSet0.vp_c9)._m0[143].x, _659);
    float _677 = fma(_487, 0.300000011920928955078125, _667);
    float _679 = fma(_665, (*spvDescriptorSet0.vp_c9)._m0[143].y, _661);
    float _681 = _645 * 6.283185482025146484375;
    float _683 = sin(_681);
    float _685 = _657 * 0.15915493667125701904296875;
    float _687 = fma(_665, (*spvDescriptorSet0.vp_c9)._m0[143].z, _669);
    float _689 = fma(_533, _625, _679);
    float _691 = -_345;
    float _693 = _691 + 1.0;
    float _695 = in.m_58.y;
    float _697 = _635 * _673;
    float _699 = _541 * 0.15915493667125701904296875;
    float _701 = _655 * 6.283185482025146484375;
    float _703 = sin(_701);
    float _705 = fma(_527, _625, _675);
    float _707 = fma(_535, _625, _687);
    float _709 = abs(_677);
    float _711 = _693 * _709;
    float _713 = in.m_60.x;
    float _715 = in.m_60.y;
    float _717 = in.m_60.z;
    float _719 = _697 * 0.52359879016876220703125;
    float _721 = fma(_565, _599, _705);
    float _723 = fma(_569, _599, _707);
    float _725 = _685 * 6.283185482025146484375;
    float _727 = sin(_725);
    float _729 = float(_653);
    float _731 = _719 * 0.15915493667125701904296875;
    float _733 = _711 * (-45.0);
    float _735 = _469 * 0.89999997615814208984375;
    float _737 = _469 * 0.15915493667125701904296875;
    float _739 = _571 * 6.283185482025146484375;
    float _741 = sin(_739);
    float _743 = fma(_567, _599, _689);
    float _745 = _711 * (-20.0);
    float _747 = fma(_703, 0.60000002384185791015625, _683);
    float _749 = _733 * 0.01745329238474369049072265625;
    float _751 = fma(_561, (*spvDescriptorSet0.vp_c9)._m0[146].x, _721);
    float _753 = _729 * _745;
    float _755 = fma(_561, (*spvDescriptorSet0.vp_c9)._m0[146].y, _743);
    float _757 = _699 * 6.283185482025146484375;
    float _759 = sin(_757);
    float _761 = fma(_727, 0.300000011920928955078125, _747);
    float _763 = _753 * 0.01745329238474369049072265625;
    float _765 = _749 * 0.15915493667125701904296875;
    float _767 = fma(_561, (*spvDescriptorSet0.vp_c9)._m0[146].z, _723);
    float _769 = _751 * _713;
    float _771 = _763 * 0.15915493667125701904296875;
    float _773 = fma(_695, 0.5, 0.5);
    float _775 = _623 * 6.283185482025146484375;
    float _777 = cos(_775);
    float _779 = _741 * 0.89999997615814208984375;
    float _781 = _735 * 0.15915493667125701904296875;
    float _783 = _773 * _761;
    float _785 = _755 * _715;
    float _787 = _783 * (*spvDescriptorSet0.vp_c9)._m0[193].x;
    float _789 = _597 * 6.283185482025146484375;
    float _791 = cos(_789);
    float _793 = -_779;
    float _795 = fma(_759, -1.2000000476837158203125, _793);
    float _797 = _767 * _717;
    float _799 = _787 * 0.01745329238474369049072265625;
    float _801 = abs(_795);
    bool _803 = _801 > 0.001000000047497451305389404296875;
    bool _805 = isnan(_801);
    bool _807 = _803 || _805;
    bool _809 = isnan(0.001000000047497451305389404296875);
    bool _811 = _807 || _809;
    float _813 = _799 * 0.15915493667125701904296875;
    float _815 = _731 * 6.283185482025146484375;
    float _817 = sin(_815);
    float _819 = _777 * 0.699999988079071044921875;
    float _821 = _811 ? _795 : 0.001000000047497451305389404296875;
    float _823 = _731 * 6.283185482025146484375;
    float _825 = cos(_823);
    float _827 = fma(_791, 1.10000002384185791015625, _819);
    float _829 = _513 + (-0.0199999995529651641845703125);
    float _831 = abs(_827);
    bool _833 = _831 != 0.0;
    bool _835 = isnan(_831);
    bool _837 = _833 || _835;
    bool _839 = isnan(0.0);
    bool _841 = _837 || _839;
    float _843 = _765 * 6.283185482025146484375;
    float _845 = sin(_843);
    float _847 = _817 * _511;
    float _849 = abs(_821);
    bool _851 = _849 == 0.0;
    bool _853 = !_841;
    bool _855 = _851 && _853;
    float _857 = _765 * 6.283185482025146484375;
    float _859 = cos(_857);
    float _861 = -_847;
    float _863 = fma(_825, _515, _861);
    float _865 = _825 * _511;
    float _867 = _863 + 0.02999999932944774627685546875;
    float _869 = fma(_817, _515, _865);
    float _871 = _771 * 6.283185482025146484375;
    float _873 = sin(_871);
    float _875 = _845 * _867;
    int _877 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _879 = _877 != 0;
    int _881 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _883 = _881 != 0;
    int _885 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _887 = _885 != 0;
    float _889 = abs(_821);
    bool _891 = _889 == 0.0;
    bool _893 = _219;
    int _895 = as_type<int>(_869);
    float _897 = _813;
    if (_855)
    {
        bool _899 = as_type<int>(_821) >= 0;
        _893 = _899;
    }
    bool _901 = _893;
    float _903 = _771 * 6.283185482025146484375;
    float _905 = cos(_903);
    float _907 = -_875;
    float _909 = fma(_859, _829, _907);
    float _911 = _859 * _867;
    bool _913 = !_883;
    int _915 = _913 ? 0 : 1;
    float _917 = _737 * 6.283185482025146484375;
    float _919 = cos(_917);
    float _921 = fma(_729, -0.100000001490116119384765625, _869);
    float _923 = _909 * _873;
    int _925 = _901 ? (-1) : 0;
    if (_855)
    {
        int _927 = _901 ? 0 : 1078530011;
        _895 = _927;
    }
    int _929 = _895;
    float _931 = _781 * 6.283185482025146484375;
    float _933 = cos(_931);
    float _935 = _909 * _905;
    float _937 = -_923;
    float _939 = fma(_905, _921, _937);
    bool _941 = !_879;
    int _943 = _941 ? 0 : 1;
    float _945 = fma(_873, _921, _935);
    bool _947 = !_887;
    int _949 = _947 ? 0 : 1;
    float _951 = _469 * 0.699999988079071044921875;
    float _953 = _813 * 6.283185482025146484375;
    float _955 = sin(_953);
    float _957 = _813 * 6.283185482025146484375;
    float _959 = cos(_957);
    int _961 = _929;
    if (_855)
    {
        int _963 = int(0x80000000) & as_type<int>(_827);
        int _965 = _929 | _963;
        _897 = as_type<float>(_965);
    }
    float _967 = _897;
    bool _969 = !_841;
    bool _971 = _969 && _891;
    float _973 = _967;
    float _975 = _967;
    if (!_971)
    {
        float _977 = abs(_827);
        bool _979 = _977 != as_type<float>(0x7f800000u /* inf */);
        bool _981 = isnan(_977);
        bool _983 = _979 || _981;
        bool _985 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _987 = _983 || _985;
        float _989 = abs(_821);
        bool _991 = _989 == as_type<float>(0x7f800000u /* inf */);
        float _993 = abs(_821);
        bool _995 = _993 == as_type<float>(0x7f800000u /* inf */);
        bool _997 = !_987;
        bool _999 = _995 && _997;
        if (_999)
        {
            bool _1001 = as_type<int>(_821) >= 0;
            _925 = _1001 ? (-1) : 0;
        }
        int _1003 = _925;
        if (_999)
        {
            _961 = 1075235812;
        }
        int _1005 = _961;
        int _1007 = _1005;
        if (_999)
        {
            int _1009 = ~_1003;
            int _1011 = (_1009 != 0) ? _1005 : 1061752795;
            _1007 = _1011;
        }
        int _1013 = _1007;
        if (_999)
        {
            int _1015 = int(0x80000000) & as_type<int>(_827);
            int _1017 = _1013 | _1015;
            _973 = as_type<float>(_1017);
        }
        float _1019 = _973;
        bool _1021 = !_987;
        bool _1023 = _1021 && _991;
        _975 = _1019;
        if (!_1023)
        {
            float _1025 = abs(_827);
            float _1027 = abs(_821);
            float _1029 = precise::max(_1025, _1027);
            float _1031 = abs(_827);
            float _1033 = abs(_821);
            float _1035 = precise::min(_1031, _1033);
            float _1037 = 1.0 / _1029;
            float _1039 = abs(_827);
            float _1041 = abs(_821);
            bool _1043 = _1039 > _1041;
            bool _1045 = as_type<int>(_821) >= 0;
            float _1047 = _1035 * _1037;
            float _1049 = abs(_827);
            float _1051 = abs(_821);
            float _1053 = _1049 + _1051;
            int _1055 = as_type<int>(_827) & int(0x80000000);
            float _1057 = _1047 * _1047;
            bool _1059 = _1053 > as_type<float>(0x7f800000u /* inf */);
            bool _1061 = isnan(_1053);
            bool _1063 = _1059 || _1061;
            bool _1065 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1067 = _1063 || _1065;
            float _1069 = _1057 + 11.33538818359375;
            float _1071 = fma(_1057, _1069, 28.84246826171875);
            float _1073 = fma(_1057, _1071, 19.6966705322265625);
            float _1075 = fma(_1057, -0.82336294651031494140625, -5.674867153167724609375);
            float _1077 = fma(_1057, _1075, -6.565555095672607421875);
            float _1079 = 1.0 / _1073;
            float _1081 = _1057 * _1077;
            float _1083 = _1047 * _1081;
            float _1085 = fma(_1083, _1079, _1047);
            float _1087 = _1085;
            _975 = _1053;
            if (_1043)
            {
                float _1089 = -_1085;
                float _1091 = _1089 + 1.57079637050628662109375;
                _1087 = _1091;
            }
            float _1093 = _1087;
            int _1095 = as_type<int>(_1093);
            if (!_1045)
            {
                float _1097 = -_1093;
                float _1099 = _1097 + 3.1415927410125732421875;
                _1095 = as_type<int>(_1099);
            }
            int _1101 = _1095;
            if (!_1067)
            {
                int _1103 = _1055 | _1101;
                _975 = as_type<float>(_1103);
            }
        }
    }
    float _1105 = _975;
    float _1107 = _945 + 0.0199999995529651641845703125;
    float _1109 = fma(_729, 0.100000001490116119384765625, _939);
    float _1111 = _951 * 0.15915493667125701904296875;
    float _1113 = in.m_52.z;
    float _1115 = _1107 * _955;
    float _1117 = _1107 * _959;
    float _1119 = _1105 + 1.57079637050628662109375;
    float _1121 = in.m_48.w;
    float _1123 = -_1115;
    float _1125 = fma(_1109, _959, _1123);
    float _1127 = fma(_845, _829, _911);
    float _1129 = fma(_1109, _955, _1117);
    float _1131 = _1119 * (-0.15915493667125701904296875);
    float _1133 = fma(_635, (*spvDescriptorSet0.vp_c9)._m0[194].x, _1125);
    float _1135 = _1127 + (-0.02999999932944774627685546875);
    float _1137 = _469 * 1.10000002384185791015625;
    float _1139 = _797 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1141 = in.m_50.w;
    float _1143 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1135);
    float _1145 = _769 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1147 = _1131 * 6.283185482025146484375;
    float _1149 = cos(_1147);
    float _1151 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1133);
    float _1153 = _1139 * _1143;
    float _1155 = _785 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1157 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1129);
    float _1159 = _1137 * 0.15915493667125701904296875;
    float _1161 = _1145 * _1151;
    float _1163 = _1153 * _295;
    float _1165 = _1131 * 6.283185482025146484375;
    float _1167 = sin(_1165);
    float _1169 = _1155 * _1157;
    float _1171 = _1153 * _305;
    float _1173 = fma(_1161, _265, _1163);
    float _1175 = fma(_169, _363, _427);
    float _1177 = _1113 * 6.283185482025146484375;
    float _1179 = fma(_1161, _269, _1171);
    float _1181 = -_1169;
    float _1183 = fma(_1181, _313, _1173);
    float _1185 = _1111 * 6.283185482025146484375;
    float _1187 = sin(_1185);
    float _1189 = fma(_175, _363, _433);
    float _1191 = _1177 * 0.15915493667125701904296875;
    float _1193 = -_1169;
    float _1195 = fma(_1193, _317, _1179);
    float _1197 = _1183 * _1149;
    float _1199 = _1175 + _1121;
    float _1201 = fma(_919, 1.2000000476837158203125, _933);
    float _1203 = _1189 + _1141;
    float _1205 = _1159 * 6.283185482025146484375;
    float _1207 = sin(_1205);
    float _1209 = _1183 * _1167;
    float _1211 = fma(_1195, _1167, _1197);
    float _1213 = _177 * 3.3333332538604736328125;
    float _1215 = -_1209;
    float _1217 = fma(_1195, _1149, _1215);
    float _1219 = _1199 + _1211;
    float _1221 = _1191 * 6.283185482025146484375;
    float _1223 = sin(_1221);
    float _1225 = _1203 + _1217;
    float _1227 = fma(_1201, (*spvDescriptorSet0.vp_c9)._m0[191].z, _1219);
    float _1229 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1231 = _1227 + _1229;
    float _1233 = _1191 * 6.283185482025146484375;
    float _1235 = cos(_1233);
    float _1237 = _1187 + _1207;
    float _1239 = fma(_1237, (*spvDescriptorSet0.vp_c9)._m0[191].z, _1225);
    float _1241 = _1223 * _1231;
    float _1243 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1245 = _1239 + _1243;
    float _1247 = in.m_62.y;
    float _1249 = _1235 * _1231;
    float _1251 = -_1241;
    float _1253 = fma(_1235, _1245, _1251);
    float _1255 = fma(_1223, _1245, _1249);
    float _1257 = _1253 + (*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1259 = _1255 + (*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1261 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1263 = _1257 + _1261;
    float _1265 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1267 = _1259 + _1265;
    float _1269 = _1263 * _1263;
    float _1271 = fma(_1267, _1267, _1269);
    float _1273 = sqrt(_1271);
    bool _1275 = _1273 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1277 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1279 = _1273 + _1277;
    float _1281 = 0.0 + _1213;
    float _1283 = precise::clamp(_1281, 0.0, 1.0);
    float _1285 = _1237;
    float _1287 = _1259;
    float _1289 = _1257;
    if (_1275)
    {
        float _1291 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1285 = _1291;
    }
    float _1293 = _1285;
    float _1295 = _1293;
    if (_1275)
    {
        float _1297 = _1279 * _1293;
        _1295 = _1297;
    }
    float _1299 = _1295;
    float _1301 = -_1213;
    float _1303 = _1301 + 3.3333332538604736328125;
    float _1305 = precise::clamp(_1303, 0.0, 1.0);
    float _1307 = _1153 * _285;
    float _1309 = _1299;
    if (_1275)
    {
        float _1311 = _1299 * 0.15915493667125701904296875;
        _1309 = _1311;
    }
    float _1313 = _1309;
    float _1315 = fma(_1161, _261, _1307);
    float _1317 = precise::min(_1283, _1305);
    float _1319 = _1153;
    if (_1275)
    {
        float _1321 = _1313 * 6.283185482025146484375;
        float _1323 = sin(_1321);
        _1319 = _1323;
    }
    float _1325 = _1319;
    float _1327 = _361 + _1247;
    float _1329 = -_1169;
    float _1331 = fma(_1329, _309, _1315);
    float _1333 = fma(_1317, -5.0, 5.0);
    float _1335 = -(*spvDescriptorSet0.vp_c9)._m0[192].w;
    float _1337 = _1335 + 1.0;
    float _1339 = _1327 + _1331;
    float _1341 = 5.0;
    float _1343 = _1337;
    if (_1275)
    {
        float _1345 = rsqrt(_1271);
        _1341 = _1345;
    }
    float _1347 = _1341;
    float _1349 = fma(_1199, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1351 = -_1333;
    float _1353 = fma(_1351, _1337, _1339);
    float _1355 = _1353;
    if (_1275)
    {
        float _1357 = _1353 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1343 = _1357;
    }
    float _1359 = _1343;
    float _1361 = floor(_1349);
    float _1363 = fma(_1203, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1365 = _1325;
    if (_1275)
    {
        float _1367 = fma(_1325, _1359, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1365 = _1367;
    }
    float _1369 = _1365;
    float _1371 = floor(_1363);
    float _1373 = _1369;
    if (_1275)
    {
        float _1375 = _1347 * _1369;
        _1373 = _1375;
    }
    float _1377 = _1373;
    if (_1275)
    {
        float _1379 = fma(_1267, _1377, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1287 = _1379;
    }
    float _1381 = _1287;
    if (_1275)
    {
        float _1383 = fma(_1263, _1377, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1289 = _1383;
    }
    float _1385 = _1289;
    float _1387 = -_1361;
    float _1389 = _1349 + _1387;
    float _1391 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1393 = _1381 + _1391;
    float _1395 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1397 = _1385 + _1395;
    float _1399 = fma(_1393, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1401 = fma(_1397, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1403 = -_1371;
    float _1405 = _1363 + _1403;
    float2 _4909 = float2(_1399, _1401);
    float _1407 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_4909, float2(0.0), isnan(_4909)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_4909, float2(0.0), isnan(_4909)), level(0.0)).x;
    float2 _4919 = float2(_1389, _1405);
    float _1409 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4919, float2(0.0), isnan(_4919)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4919, float2(0.0), isnan(_4919)), level(0.0)).x;
    float _1411 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1413 = int(_1411);
    int _1415 = abs(_915);
    out.m_64.x = _343;
    out.m_64.y = _345;
    int _1417 = abs(_943);
    float _1419 = -_695;
    float _1421 = _1419 + 1.0;
    int _1423 = abs(_949);
    float _1425 = _371 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1427 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1429 = int(_1427);
    float _1431 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1433 = float(_1413);
    float _1435 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1437 = fma(_353, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1435);
    float _1439 = 1.0 / _1433;
    float _1441 = float(uint(_1429));
    float _1443 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1437);
    float _1445 = 1.0 / _1441;
    float _1447 = _133 * _1439;
    float _1449 = trunc(_1447);
    int _1451 = int(_1449);
    int _1453 = as_type<int>(_1445) + (-2);
    float _1455 = float(uint(_1451));
    int _1457 = ~_1429;
    int _1459 = _1457 + 1;
    float _1461 = float(_1451);
    float _1463 = as_type<float>(_1453) * _1455;
    float _1465 = trunc(_1463);
    float _1467 = precise::max(_1465, 0.0);
    uint _1470 = uint(_1467);
    int _1472 = ~_1429;
    int _1474 = _1472 + 1;
    int _1476 = _1459 * int(_1470);
    int _1478 = _1476 + _1451;
    float _1480 = float(uint(_1478));
    float _1482 = as_type<float>(_1453) * _1480;
    int _1484 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1486 = _1484 != 0;
    float _1488 = trunc(_1482);
    float _1490 = precise::max(_1488, 0.0);
    uint _1492 = uint(_1490);
    bool _1494 = !_1486;
    float _1496 = _1494 ? 7.345489978790283203125 : 1.0;
    float _1498 = _1496 * _353;
    float _1500 = floor(_1498);
    int _1502 = int(_1470) + int(_1492);
    float _1504 = float(_1429);
    int _1506 = _1474 * _1502;
    int _1508 = _1506 + _1451;
    bool _1510 = _1461 >= _1504;
    bool _1512 = isnan(_1461);
    bool _1514 = _1510 || _1512;
    bool _1516 = isnan(_1504);
    bool _1518 = _1514 || _1516;
    float _1520 = float(_1518);
    bool _1522 = uint(_1508) >= uint(_1429);
    float _1524 = trunc(_1520);
    int _1526 = int(_1524);
    bool _1528 = !_1522;
    int _1530 = _1528 ? 0 : (-1);
    float _1532 = -_1500;
    float _1534 = _1498 + _1532;
    bool _1536 = _1429 == 0;
    int _1538 = ~_1502;
    int _1540 = _1538 + _1530;
    int _1542 = _1540 + 1;
    float _1544 = _1534 * _1504;
    float _1546 = _133 * _1504;
    int _1548 = _1429 * _1542;
    int _1550 = _1548 + _1451;
    float _1552 = _1546 * _163;
    float _1554 = trunc(_1544);
    int _1556 = int(_1554);
    int _1558 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1560 = _1558 != 0;
    int _1562 = ~_1526;
    int _1564 = _1562 + 1;
    int _1566 = _1564 + 1;
    bool _1568 = !_1536;
    int _1570 = _1568 ? _1550 : (-1);
    int _1572 = _1429 + (-1);
    float _1574 = trunc(_1552);
    int _1576 = int(_1574);
    bool _1578 = !_1560;
    int _1580 = _1578 ? 0 : 1;
    int _1582 = _1570 * _1566;
    int _1584 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1586 = _1584 != 0;
    int _1588 = abs(_1580);
    int _1590 = _1526 * _1572;
    int _1592 = _1590 + _1582;
    bool _1594 = !_1586;
    int _1596 = _1594 ? 0 : 1;
    int _1598 = _1592 * _1415;
    int _1600 = ~_1429;
    int _1602 = _1600 + 1;
    int _1604 = _1556 * _1588;
    int _1606 = _1604 + _1451;
    int _1608 = abs(_1596);
    float _1610 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1612 = _1576 * _1417;
    int _1614 = _1612 + _1598;
    int _1616 = ~_1429;
    int _1618 = _1616 + 1;
    float _1620 = float(uint(_1606));
    int _1622 = _1606 * _1423;
    int _1624 = _1622 + _1614;
    int _1626 = _1556 * _1608;
    int _1628 = _1626 + _1624;
    float _1630 = as_type<float>(_1453) * _1620;
    float _1632 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1634 = float(uint(_1628));
    float _1636 = trunc(_1630);
    float _1638 = precise::max(_1636, 0.0);
    uint _1640 = uint(_1638);
    float _1642 = fma(_1425, -2.0, _1632);
    float _1644 = as_type<float>(_1453) * _1634;
    float _1646 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1642);
    float _1648 = trunc(_1644);
    float _1650 = precise::max(_1648, 0.0);
    uint _1652 = uint(_1650);
    float _1654 = in.m_54.w;
    int _1656 = _1602 * int(_1640);
    int _1658 = _1656 + _1606;
    int _1660 = ~_1429;
    int _1662 = _1660 + 1;
    float _1664 = float(uint(_1658));
    int _1666 = _1618 * int(_1652);
    int _1668 = _1666 + _1628;
    float _1670 = as_type<float>(_1453) * _1664;
    float _1672 = float(uint(_1668));
    float _1674 = trunc(_1670);
    float _1676 = precise::max(_1674, 0.0);
    uint _1678 = uint(_1676);
    out.m_64.w = _1654;
    float _1680 = as_type<float>(_1453) * _1672;
    float _1682 = trunc(_1680);
    float _1684 = precise::max(_1682, 0.0);
    uint _1686 = uint(_1684);
    int _1688 = int(_1640) + int(_1678);
    int _1690 = int(_1652) + int(_1686);
    float _1692 = in.m_54.z;
    int _1694 = _1662 * _1690;
    int _1696 = _1694 + _1628;
    bool _1698 = uint(_1696) >= uint(_1429);
    bool _1700 = !_1698;
    int _1702 = _1700 ? 0 : (-1);
    int _1704 = ~_1690;
    int _1706 = _1704 + _1702;
    int _1708 = _1706 + 1;
    int _1710 = ~_1429;
    int _1712 = _1710 + 1;
    int _1714 = _1429 * _1708;
    int _1716 = _1714 + _1628;
    int _1718 = _1712 * _1688;
    int _1720 = _1718 + _1606;
    float _1722 = in.m_52.w;
    bool _1724 = !_1536;
    int _1726 = _1724 ? _1716 : (-1);
    out.m_64.z = _1692;
    int _1728 = _1726 & 3;
    bool _1730 = _1728 != 0;
    int _1732 = _1726 & 3;
    bool _1734 = _1732 != 0;
    int _1736 = _1730 ? 0 : 1;
    bool _1738 = uint(_1732) > 1u;
    bool _1740 = _1732 != 3;
    bool _1742 = uint(_1732) >= 2u;
    bool _1744 = _1732 != 3;
    int _1746 = _1726 >> 31;
    int _1748 = _1742 ? 0 : 1;
    int _1750 = _1746 & 3;
    int _1752 = ~_1736;
    int _1754 = _1752 + 1;
    int _1756 = _1754 + 1;
    int _1758 = _1726 + _1750;
    bool _1760 = uint(_1720) >= uint(_1429);
    int _1762 = _1758 >> 2;
    int _1764 = _1756;
    if (!_1738)
    {
        int _1766 = ~_1736;
        int _1768 = _1766 + 1;
        _1764 = _1768;
    }
    int _1770 = _1764;
    float _1772 = _353 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1774 = _1762 << 4;
    int _1776 = _1774 + 368;
    float _1778 = fma(_1407, 100.0, _1327);
    int _1780 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1782 = _1780 != 0;
    float _1784 = -_1610;
    float _1786 = fma(_1772, 2.0, _1784);
    uint _1788 = uint(int(uint(_1776) >> uint(2)));
    uint _1790 = uint(int(uint(int(_1788)) >> uint(2)));
    int _1792 = int(_1788) & 3;
    float _1794 = (*spvDescriptorSet0.vp_c9)._m0[int(_1790)][_1792];
    int _1796 = int(_1788) + 1;
    uint _1798 = uint(int(uint(_1796) >> uint(2)));
    int _1800 = _1796 & 3;
    float _1802 = (*spvDescriptorSet0.vp_c9)._m0[int(_1798)][_1800];
    int _1804 = ~_1748;
    int _1806 = _1804 + 1;
    int _1808 = _1806 + 1;
    float _1810 = -_1409;
    float _1812 = _1810 + 1.0;
    int _1814 = _1808;
    int _1816 = _1776;
    if (_1740)
    {
        int _1818 = ~_1748;
        int _1820 = _1818 + 1;
        _1814 = _1820;
    }
    int _1822 = _1814;
    float _1824 = -_133;
    float _1826 = fma(_1824, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1786);
    int _1828 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1830 = _1828 != 0;
    bool _1832 = !_1734;
    int _1834 = _1832 ? 0 : 1;
    int _1836 = _1776 + 8;
    uint _1838 = uint(int(uint(_1836) >> uint(2)));
    uint _1840 = uint(int(uint(int(_1838)) >> uint(2)));
    int _1842 = int(_1838) & 3;
    float _1844 = (*spvDescriptorSet0.vp_c9)._m0[int(_1840)][_1842];
    int _1846 = int(_1838) + 1;
    uint _1848 = uint(int(uint(_1846) >> uint(2)));
    int _1850 = _1846 & 3;
    float _1852 = (*spvDescriptorSet0.vp_c9)._m0[int(_1848)][_1850];
    int _1854 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1856 = _1854 != 0;
    float _1858 = _743;
    if (_1782)
    {
        float _1860 = in.m_52.z;
        _1858 = _1860;
    }
    float _1862 = _1858;
    bool _1864 = !_1830;
    int _1866 = _1864 ? 0 : 1;
    bool _1868 = _1722 > 0.5;
    bool _1870 = !_1744;
    int _1872 = _1870 ? 0 : (-1);
    bool _1874 = !_1760;
    int _1876 = _1874 ? 0 : (-1);
    int _1878 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1880 = _1878 != 0;
    int _1882 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1884 = _1882 != 0;
    int _1886 = _1868 ? as_type<int>(_1421) : as_type<int>(_695);
    float _1888 = _1880 ? as_type<float>(_1886) : _695;
    float _1890 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _1892 = _1868;
    if (_1856)
    {
        bool _1894 = _353 > 0.5;
        _1892 = _1894;
    }
    bool _1896 = _1892;
    float _1898 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _1900 = _371 > 0.5;
    float _1902 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1904 = _1890 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1906 = _1900 ? as_type<int>(_1421) : as_type<int>(_695);
    float _1908 = _1898 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1910 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1912 = _1902 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1914 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _1916 = _1900;
    if (_1782)
    {
        bool _1918 = _1862 > 0.5;
        _1916 = _1918;
    }
    bool _1920 = _1916;
    float _1922 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _1924 = abs(_1770);
    float _1926 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1928 = _1884 ? as_type<float>(_1906) : _695;
    out.m_66.x = _1904;
    out.m_66.y = _1908;
    out.m_66.z = _1912;
    out.m_66.w = _1910;
    int _1930 = abs(_1834);
    float _1932 = _1914 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1934 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1936 = int(_1934);
    float _1938 = _1922 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1940 = _1926 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1942 = abs(_1822);
    float _1944 = in.m_58.x;
    int _1946 = abs(_1866);
    float _1948 = fma(_371, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1431);
    int _1950 = ~_1688;
    int _1952 = _1950 + _1876;
    int _1954 = _1952 + 1;
    out.m_68.x = _1932;
    out.m_68.y = _1938;
    out.m_68.z = _1940;
    float _1956 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1948);
    int _1958 = ~_1924;
    int _1960 = _1958 + 1;
    int _1962 = _1960 + 1;
    int _1964 = _1429 * _1954;
    int _1966 = _1964 + _1606;
    int _1968 = ~_1930;
    int _1970 = _1968 + 1;
    int _1972 = _1970 + 1;
    int _1974 = _1962 * as_type<int>(_1802);
    int _1976 = abs(_1936);
    bool _1978 = !_1536;
    int _1980 = _1978 ? _1966 : (-1);
    int _1982 = _1972 * as_type<int>(_1794);
    int _1984 = _1982 + _1974;
    float _1986 = in.m_70.x;
    float _1988 = in.m_70.y;
    float _1990 = in.m_70.z;
    float _1992 = in.m_70.w;
    int _1994 = abs(_1872);
    int _1996 = ~_1942;
    int _1998 = _1996 + 1;
    int _2000 = _1998 + 1;
    int _2002 = ~_1994;
    int _2004 = _2002 + 1;
    int _2006 = _2004 + 1;
    float _2008 = float(uint(_1936));
    int _2010 = _2000 * as_type<int>(_1844);
    int _2012 = _2010 + _1984;
    float _2014 = float(uint(_1976));
    float _2016 = 1.0 / _2008;
    int _2018 = _2006 * as_type<int>(_1852);
    int _2020 = _2018 + _2012;
    int _2022 = ~_1946;
    int _2024 = _2022 + 1;
    int _2026 = _2024 + 1;
    bool _2028 = _1129 != 0.0;
    bool _2030 = isnan(_1129);
    bool _2032 = _2028 || _2030;
    bool _2034 = isnan(0.0);
    bool _2036 = _2032 || _2034;
    float _2038 = as_type<float>(_1942);
    float _2040 = as_type<float>(_1984);
    if (!_1856)
    {
        _2038 = _1944;
    }
    float _2042 = _2038;
    int _2044 = _2020 * _2026;
    float _2046 = 1.0 / _2014;
    bool _2048 = _1133 == 0.0;
    bool _2050 = !_2036;
    bool _2052 = _2048 && _2050;
    int _2054 = _1980 * _1946;
    int _2056 = _2054 + _2044;
    float _2058 = _305 * _1990;
    bool _2060 = _1127 == 0.02999999932944774627685546875;
    bool _2062 = _2060 && _2052;
    float _2064 = _285 * _1990;
    float _2066 = in.m_72.x;
    float _2068 = in.m_72.y;
    float _2070 = in.m_72.z;
    int _2072 = as_type<int>(_2016) + (-2);
    float _2074 = fma(_269, _1986, _2058);
    float _2076 = float(uint(_2056));
    float _2078 = fma(_261, _1986, _2064);
    int _2080 = abs(_2056);
    float _2082 = _295 * _1990;
    float _2084 = _2042;
    if (!_1856)
    {
        _2040 = _2042;
    }
    float _2086 = _2040;
    float _2088 = as_type<float>(_2072) * _2076;
    int _2090 = as_type<int>(_2046) + (-2);
    float _2092 = fma(_265, _1986, _2082);
    float _2094 = float(uint(_2080));
    float _2096 = trunc(_2088);
    float _2098 = precise::max(_2096, 0.0);
    uint _2100 = uint(_2098);
    int _2102 = as_type<int>(_2088);
    float _2104 = _2086;
    if (_1856)
    {
        _2084 = _1944;
    }
    float _2106 = _2084;
    float _2108 = -_1988;
    float _2110 = fma(_313, _2108, _2092);
    int _2112 = ~_1936;
    int _2114 = _2112 + 1;
    float _2116 = as_type<float>(_2090) * _2094;
    float _2118 = -_1988;
    float _2120 = fma(_309, _2118, _2078);
    int _2122 = ~_1976;
    int _2124 = _2122 + 1;
    float _2126 = -_1988;
    float _2128 = fma(_317, _2126, _2074);
    float _2130 = _2106;
    float _2132 = _2128;
    float _2134 = _2110;
    if (_1782)
    {
        float _2136 = -_2106;
        float _2138 = _2136 + 1.0;
        _1816 = as_type<int>(_2138);
    }
    int _2140 = _1816;
    if (_1856)
    {
        float _2142 = -_2106;
        float _2144 = _2142 + 1.0;
        _2102 = as_type<int>(_2144);
    }
    int _2146 = _2102;
    float _2148 = trunc(_2116);
    float _2150 = precise::max(_2148, 0.0);
    uint _2152 = uint(_2150);
    out.m_74.x = _2110;
    out.m_74.y = _2120;
    out.m_74.z = _2128;
    if (_1856)
    {
        float _2154 = _1896 ? as_type<float>(_2146) : _2106;
        _2104 = _2154;
    }
    float _2156 = _2104;
    int _2158 = _2114 * int(_2100);
    int _2160 = _2158 + _2056;
    float _2162 = as_type<float>(_2160);
    if (_1782)
    {
        float _2164 = _1920 ? as_type<float>(_2140) : _2106;
        _2130 = _2164;
    }
    float _2166 = _2130;
    float _2168 = float(uint(_2160));
    float _2170 = _2168;
    if (_2062)
    {
        _2132 = _2068;
    }
    float _2172 = _2132;
    float _2174 = _2166 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _2176 = _2124 * int(_2152);
    int _2178 = _2176 + _2080;
    float _2180 = as_type<float>(_2072) * _2168;
    float _2182 = _2172;
    if (_2062)
    {
        _2162 = _2172;
    }
    float _2184 = _2162;
    float _2186 = _2184;
    if (!_2062)
    {
        _2182 = _2068;
    }
    float _2188 = _2182;
    float _2190 = float(uint(_2178));
    float _2192 = trunc(_2180);
    float _2194 = precise::max(_2192, 0.0);
    uint _2196 = uint(_2194);
    if (_2062)
    {
        _2134 = _2066;
    }
    float _2198 = _2134;
    float _2200 = _2198;
    if (!_2062)
    {
        float _2202 = fma(_1133, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2066);
        _2200 = _2202;
    }
    float _2204 = _2200;
    if (!_2062)
    {
        float _2206 = fma(_1129, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2188);
        _2186 = _2206;
    }
    float _2208 = _2186;
    float _2210 = as_type<float>(_2090) * _2190;
    float _2212 = _1990 * _2066;
    if (_2062)
    {
        _2170 = _2070;
    }
    float _2214 = _2170;
    float _2216 = _1988 * _2070;
    float _2218 = _2214;
    if (!_2062)
    {
        float _2220 = fma(_1135, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2070);
        _2218 = _2220;
    }
    float _2222 = _2218;
    float _2224 = -_2212;
    float _2226 = fma(_1986, _2070, _2224);
    float _2228 = trunc(_2210);
    float _2230 = precise::max(_2228, 0.0);
    uint _2232 = uint(_2230);
    float _2234 = _1986 * _2188;
    float _2236 = -_2216;
    float _2238 = fma(_1990, _2188, _2236);
    float _2240 = _295 * _2222;
    float _2242 = _285 * _2222;
    float _2244 = _305 * _2222;
    float _2246 = -_2234;
    float _2248 = fma(_1988, _2066, _2246);
    float _2250 = fma(_265, _2204, _2240);
    float _2252 = fma(_261, _2204, _2242);
    float _2254 = fma(_269, _2204, _2244);
    int _2256 = int(_2100) + int(_2196);
    float _2258 = _2248 * _1992;
    int _2260 = ~_1936;
    int _2262 = _2260 + 1;
    float _2264 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _2266 = ~_1976;
    int _2268 = _2266 + 1;
    float _2270 = _2258 * _295;
    int _2272 = int(_2152) + int(_2232);
    float _2274 = _2226 * _1992;
    float _2276 = _2238 * _1992;
    int _2278 = _2262 * _2256;
    int _2280 = _2278 + _2056;
    float _2282 = _2258 * _285;
    int _2284 = _2268 * _2272;
    int _2286 = _2284 + _2080;
    float _2288 = _2258 * _305;
    float _2290 = fma(_2276, _265, _2270);
    bool _2292 = uint(_2280) >= uint(_1936);
    float _2294 = fma(_2276, _261, _2282);
    bool _2296 = uint(_2286) >= uint(_1976);
    float _2298 = -_2208;
    float _2300 = fma(_313, _2298, _2250);
    bool _2302 = !_2292;
    int _2304 = _2302 ? 0 : (-1);
    float _2306 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2308 = _2056 ^ _1936;
    float _2310 = -_2208;
    float _2312 = fma(_317, _2310, _2254);
    bool _2314 = !_2296;
    int _2316 = _2314 ? 0 : (-1);
    float _2318 = fma(_2276, _269, _2288);
    int _2320 = ~_2256;
    int _2322 = _2320 + _2304;
    int _2324 = _2322 + 1;
    float _2326 = _2264 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    uint _2328 = uint(int(uint(_2308) >> uint(31)));
    float _2330 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2332 = ~_2316;
    int _2334 = _2272 + _2332;
    int _2336 = _2334 + 1;
    int _2338 = _1936 * _2324;
    int _2340 = _2338 + _2056;
    int _2342 = ~int(_2328);
    int _2344 = _2342 + 1;
    float _2346 = _2300 * _1167;
    bool _2348 = _1936 == 0;
    float _2350 = fma(_2326, _2156, -0.5);
    int _2352 = _2336 ^ _2344;
    float _2354 = _265;
    float _2356 = _2326;
    if (_1275)
    {
        float _2358 = _1313 * 6.283185482025146484375;
        float _2360 = cos(_2358);
        _2354 = _2360;
    }
    float _2362 = _2354;
    bool _2364 = !_2348;
    int _2366 = _2364 ? _2340 : (-1);
    float _2368 = _2306 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _2370 = ~_2344;
    int _2372 = _2370 + _2352;
    int _2374 = _2372 + 1;
    float _2376 = -_2346;
    float _2378 = fma(_2312, _1149, _2376);
    bool _2380 = _1936 == 0;
    float _2382 = fma(_2368, _1928, -0.5);
    float _2384 = float(_2366);
    float _2386 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _2388 = !_2380;
    int _2390 = _2388 ? _2374 : (-1);
    float _2392 = _1888 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2394 = -_2274;
    float _2396 = fma(_2394, _313, _2290);
    float _2398 = fma(_2326, _2384, _1826);
    float _2400 = float(_2390);
    float _2402 = _2300 * _1149;
    float _2404 = fma(_1443, _2350, _2398);
    float _2406 = _1778 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2408 = -_1646;
    float _2410 = fma(_2368, _2400, _2408);
    float _2412 = -_2208;
    float _2414 = fma(_309, _2412, _2252);
    float _2416 = _2392 * _2330;
    float _2418 = fma(_1199, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2406);
    float _2420 = _2330;
    if (_1275)
    {
        float _2422 = _2362 + (-1.0);
        _2420 = _2422;
    }
    float _2424 = _2420;
    float _2426 = -_2274;
    float _2428 = fma(_2426, _317, _2318);
    float _2430 = fma(_1956, _2382, _2410);
    float _2432 = -_2274;
    float _2434 = fma(_2432, _309, _2294);
    float _2436 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2418);
    if (_1275)
    {
        float _2438 = _2424 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2356 = _2438;
    }
    float _2440 = _2356;
    float _2442 = _2174 * _2386;
    float _2444 = _2404 + 0.5;
    float _2446 = _2430 + 0.5;
    out.m_76.x = _2396;
    out.m_76.y = _2434;
    out.m_76.z = _2428;
    if (_1275)
    {
        float _2448 = fma(_1353, _2362, _2440);
        _1355 = _2448;
    }
    float _2450 = _1355;
    float _2452 = fma(_2312, _1167, _2402);
    out.m_78.x = _2444;
    out.m_78.y = _2446;
    out.m_78.z = _2442;
    out.m_78.w = _2416;
    float _2454 = _1223 * _2452;
    float _2456 = _1235 * _2452;
    float _2458 = in.m_62.x;
    float _2460 = -_2454;
    float _2462 = fma(_1235, _2378, _2460);
    float _2464 = fma(_1223, _2378, _2456);
    float _2466 = _1778 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2468 = _2436 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2470 = fma(_1199, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2466);
    out.m_80.x = _2464;
    out.m_80.y = _2414;
    out.m_80.z = _2462;
    float _2472 = 1.0 / _2468;
    float _2474 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2470);
    float _2476 = _2474 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2478 = _2476 + _2468;
    float _2480 = _2478 * _2472;
    float _2482 = _2480 * 0.5;
    float _2484 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2486 = fma(_2482, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2484);
    float _2488 = 1.0 / _2486;
    float _2490 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2492 = _2488 * _2490;
    float _2494 = abs(_2492);
    float _2496 = log2(_2494);
    bool _2498 = _2492 <= 8000.0;
    bool _2500 = isnan(_2492);
    bool _2502 = _2498 || _2500;
    bool _2504 = isnan(8000.0);
    bool _2506 = _2502 || _2504;
    float _2508 = float(_2506);
    float _2510 = _2496 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2512 = exp2(_2510);
    float _2514 = fma(_2512, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2516 = precise::clamp(_2514, 0.0, 1.0);
    float _2518 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2520 = _1381 + _2518;
    float _2522 = fma(_2516, -2.0, 3.0);
    float _2524 = _2516 * _2516;
    float _2526 = _2524 * _2522;
    float _2528 = fma(_1407, 100.0, _2450);
    float _2530 = -_2526;
    float _2532 = _2530 + 1.0;
    float _2534 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2536 = _2528 + _2534;
    float _2538 = _2528 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    out.m_82.x = _1381;
    out.m_82.y = _2528;
    out.m_82.z = _1385;
    float _2540 = fma(_2532, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2526);
    float _2542 = _2536 * _2536;
    float _2544 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2546 = _1385 + _2544;
    float _2548 = fma(_1381, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2538);
    float _2550 = _2508 * _2540;
    float _2552 = fma(_2520, _2520, _2542);
    float _2554 = _2528 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2556 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2548);
    float _2558 = _2550 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2560 = fma(_2546, _2546, _2552);
    float _2562 = _2528 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2564 = _2528 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2566 = fma(_1381, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2554);
    float _2568 = _1812 * _2558;
    float _2570 = precise::clamp(_2568, 0.0, 1.0);
    float _2572 = fma(_1381, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2562);
    float _2574 = fma(_1381, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2564);
    float _2576 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2566);
    float _2578 = -_2570;
    float _2580 = fma(_2578, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2582 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2572);
    float _2584 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2574);
    float _2586 = _2576 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2588 = sqrt(_2560);
    float _2590 = _2582 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2592 = _2584 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2594 = _2556 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2596 = _2580 * _2458;
    float _2598 = _2590 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2600 = _2590 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2602 = _2590 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2604 = _2590 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2606 = fma(_2592, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2598);
    float _2608 = fma(_2592, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2600);
    float _2610 = fma(_2592, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2602);
    float _2612 = fma(_2592, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2604);
    float _2614 = fma(_2586, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2606);
    float _2616 = fma(_2586, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2608);
    float _2618 = fma(_2586, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2610);
    float _2620 = fma(_2586, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2612);
    float _2622 = fma(_2594, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2614);
    float _2624 = fma(_2594, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2616);
    float _2626 = fma(_2594, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2618);
    float _2628 = fma(_2594, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2620);
    float _2630 = _2596 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    bool _2632 = _2588 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2634 = isnan(_2588);
    bool _2636 = _2632 || _2634;
    bool _2638 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2640 = _2636 || _2638;
    out.gl_Position.x = _2622;
    out.gl_Position.y = _2624;
    out.gl_Position.z = _2626;
    out.gl_Position.w = _2628;
    out.m_84.x = _2630;
    float _2642 = _2618;
    float _2644 = _2586;
    float _2646 = _2616;
    float _2648 = _2590;
    float _2650 = _2614;
    float _2652 = _2592;
    if (!_2640)
    {
        _2642 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2654 = _2642;
    float _2656 = _2654;
    float _2658 = _2654;
    if (!_2640)
    {
        _2644 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2660 = _2644;
    float _2662 = _2660;
    float _2664 = _2660;
    if (!_2640)
    {
        _2646 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2666 = _2646;
    float _2668 = _2666;
    float _2670 = _2666;
    if (!_2640)
    {
        _2648 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2672 = _2648;
    float _2674 = _2672;
    float _2676 = _2672;
    if (!_2640)
    {
        _2650 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2678 = _2650;
    float _2680 = _2678;
    float _2682 = _2678;
    if (!_2640)
    {
        _2652 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2684 = _2652;
    bool _2686 = !_2640;
    float _2688 = _2684;
    float _2690 = _2684;
    if (!_2686)
    {
        bool _2692 = _2588 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2694 = isnan(_2588);
        bool _2696 = _2692 || _2694;
        bool _2698 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2700 = _2696 || _2698;
        if (!_2700)
        {
            float _2702 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2704 = _2588 + _2702;
            float _2706 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2708 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2706;
            float _2710 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2712 = _2710 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2714 = 1.0 / _2708;
            float _2716 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2718 = _2716 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2720 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2722 = _2720 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2724 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2726 = _2724 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2728 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2730 = _2728 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2732 = _2704 * _2714;
            float _2734 = precise::clamp(_2732, 0.0, 1.0);
            float _2736 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2738 = _2736 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2740 = fma(_2734, _2712, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2742 = fma(_2734, _2738, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2744 = fma(_2734, _2718, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2746 = fma(_2734, _2722, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2748 = fma(_2734, _2726, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2750 = fma(_2734, _2730, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2664 = _2740;
            _2682 = _2748;
            _2658 = _2744;
            _2676 = _2746;
            _2670 = _2742;
            _2690 = _2750;
            _2752 = true;
        }
        else
        {
            bool _2754 = _2588 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2756 = isnan(_2588);
            bool _2758 = _2754 || _2756;
            bool _2760 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2762 = _2758 || _2760;
            if (!_2762)
            {
                _2656 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2764 = _2656;
            _2658 = _2764;
            if (!_2762)
            {
                _2662 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2766 = _2662;
            _2664 = _2766;
            if (!_2762)
            {
                _2668 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2768 = _2668;
            _2670 = _2768;
            if (!_2762)
            {
                _2674 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2770 = _2674;
            _2676 = _2770;
            if (!_2762)
            {
                _2680 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2772 = _2680;
            _2682 = _2772;
            if (!_2762)
            {
                _2688 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2774 = _2688;
            bool _2776 = !_2762;
            _2690 = _2774;
            if (!_2776)
            {
                bool _2778 = _2588 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2780 = isnan(_2588);
                bool _2782 = _2778 || _2780;
                bool _2784 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2786 = _2782 || _2784;
                if (!_2786)
                {
                    float _2788 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2790 = _2588 + _2788;
                    float _2792 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2794 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2792;
                    float _2796 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2798 = _2796 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2800 = 1.0 / _2794;
                    float _2802 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2804 = _2802 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2806 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2808 = _2806 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2810 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2812 = _2810 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2814 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2816 = _2814 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2818 = _2790 * _2800;
                    float _2820 = precise::clamp(_2818, 0.0, 1.0);
                    float _2822 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2824 = _2822 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2826 = fma(_2820, _2798, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2828 = fma(_2820, _2824, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2830 = fma(_2820, _2804, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2832 = fma(_2820, _2808, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2834 = fma(_2820, _2812, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2836 = fma(_2820, _2816, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2664 = _2826;
                    _2682 = _2834;
                    _2658 = _2830;
                    _2676 = _2832;
                    _2670 = _2828;
                    _2690 = _2836;
                    _2752 = true;
                }
                else
                {
                    _2664 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2682 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2658 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2676 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2670 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2690 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2752 = false;
    float _2838 = _2664;
    float _2840 = _2682;
    float _2842 = _2658;
    float _2844 = _2676;
    float _2846 = _2670;
    float _2848 = _2690;
    float _2850 = fma(_2414, -0.5, 0.5);
    float _2852 = precise::clamp(_2850, 0.0, 1.0);
    float _2854 = -_2838;
    float _2856 = _2854 + _2840;
    float _2858 = -_2842;
    float _2860 = _2858 + _2844;
    float _2862 = -_2846;
    float _2864 = _2862 + _2848;
    bool _2866 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2868 = fma(_2852, _2856, _2838);
    float _2870 = fma(_2852, _2860, _2842);
    float _2872 = fma(_2852, _2864, _2846);
    float _2874 = _2868 * 0.586610972881317138671875;
    out.m_86.x = 0.0;
    float _2876 = fma(_2870, 0.298911988735198974609375, _2874);
    float _2878 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_42.x = 1.0;
    float _2880 = fma(_2872, 0.114477999508380889892578125, _2876);
    float _2882 = -_2880;
    float _2884 = _2870 + _2882;
    float _2886 = -_2880;
    float _2888 = _2868 + _2886;
    float _2890 = -_2880;
    float _2892 = _2872 + _2890;
    out.m_84.w = _2878;
    float _2894 = fma(_2884, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2880);
    float _2896 = fma(_2888, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2880);
    float _2898 = fma(_2892, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2880);
    out.m_88.x = _2894;
    out.m_88.y = _2896;
    out.m_88.z = _2898;
    if (!_2866)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2900 = -_2528;
    float _2902 = _2900 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2904 = -_1381;
    float _2906 = _2904 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2908 = -_1385;
    float _2910 = _2908 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2912 = _2902 * _2902;
    float _2914 = fma(_2906, _2906, _2912);
    float _2916 = fma(_2910, _2910, _2914);
    float _2918 = sqrt(_2916);
    float _2920 = rsqrt(_2916);
    float _2922 = -_2918;
    float _2924 = _2922 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2926 = _2924 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2928 = precise::clamp(_2926, 0.0, 1.0);
    float _2930 = _2906 * _2920;
    float _2932 = _2902 * _2920;
    float _2934 = abs(_2928);
    float _2936 = log2(_2934);
    float _2938 = _2910 * _2920;
    float _2940 = _2930 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2942 = _2414 * _2932;
    float _2944 = -_2932;
    float _2946 = -_2940;
    float _2948 = fma(_2944, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2946);
    float _2950 = fma(_2464, _2930, _2942);
    float _2952 = -_2938;
    float _2954 = fma(_2952, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2948);
    float _2956 = fma(_2462, _2938, _2950);
    float _2958 = precise::clamp(_2956, 0.0, 1.0);
    float _2960 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2962 = _2954 + _2960;
    float _2964 = _2936 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2966 = _2962 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2968 = precise::clamp(_2966, 0.0, 1.0);
    float _2970 = exp2(_2964);
    float _2972 = _2970 * _2968;
    float _2974 = _2958 * _2972;
    float _2976 = _2974 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2978 = _2974 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2980 = _2974 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_86.x = _2976;
    out.m_86.y = _2978;
    out.m_86.z = _2980;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_42.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_42.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_42.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_42.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

