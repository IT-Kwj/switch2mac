#pragma clang diagnostic ignored "-Wmissing-prototypes"

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

template <typename T>
static inline depth2d<T> spvDepthCast(texture2d<T> t)
{
    return reinterpret_cast<thread const depth2d<T> &>(t);
}

template <typename T>
static inline depth2d_array<T> spvDepthCast(texture2d_array<T> t)
{
    return reinterpret_cast<thread const depth2d_array<T> &>(t);
}

template <typename T>
static inline depthcube<T> spvDepthCast(texturecube<T> t)
{
    return reinterpret_cast<thread const depthcube<T> &>(t);
}

template <typename T>
static inline depthcube_array<T> spvDepthCast(texturecube_array<T> t)
{
    return reinterpret_cast<thread const depthcube_array<T> &>(t);
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
    constant _16* vp_c15 [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
    constant _16* vp_c9 [[id(3)]];
    constant _16* vp_c13 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture2d<float> vp_t_tcb_28 [[id(6)]];
    sampler vp_t_tcb_28Smplr [[id(7)]];
    texture2d<float> vp_t_tcb_24 [[id(8)]];
    sampler vp_t_tcb_24Smplr [[id(9)]];
    texture2d_array<float> vp_t_tcb_16 [[id(10)]];
    sampler vp_t_tcb_16Smplr [[id(11)]];
    texture2d_array<float> vp_t_tcb_14 [[id(12)]];
    sampler vp_t_tcb_14Smplr [[id(13)]];
    sampler vp_t_tcb_28Smplr_w [[id(14)]];
    sampler vp_t_tcb_24Smplr_w [[id(15)]];
    sampler vp_t_tcb_14Smplr_w [[id(16)]];
    constant dm_border_t* dm_border [[id(17)]];
};

struct main0_out
{
    float4 m_76 [[user(locn0)]];
    float4 m_86 [[user(locn2)]];
    float4 m_82 [[user(locn3)]];
    float4 m_96 [[user(locn4)]];
    float4 m_52 [[user(locn5)]];
    float4 m_84 [[user(locn6)]];
    float4 m_88 [[user(locn7)]];
    float4 m_90 [[user(locn8)]];
    float4 m_80 [[user(locn9)]];
    float4 m_94 [[user(locn10)]];
    float4 m_92 [[user(locn11)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_72 [[attribute(0)]];
    float4 m_58 [[attribute(1)]];
    float4 m_56 [[attribute(2)]];
    float4 m_60 [[attribute(3)]];
    float4 m_49 [[attribute(5)]];
    float4 m_54 [[attribute(6)]];
    float4 m_78 [[attribute(7)]];
    float4 m_66 [[attribute(8)]];
    float4 m_62 [[attribute(9)]];
    float4 m_70 [[attribute(10)]];
    float4 m_74 [[attribute(11)]];
    float4 m_68 [[attribute(12)]];
    float4 m_64 [[attribute(13)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2438 = false;
    bool _349 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _110 = in.m_49.w;
    float _112 = trunc(_110);
    int _115 = int(_112);
    bool _119 = _115 >= 1;
    float _121 = 0.0;
    float _123 = as_type<float>(_115);
    if (!_119)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _125 = _121;
    if (!_119)
    {
        out.m_52.x = 0.0;
    }
    int _127 = 0;
    if (!_119)
    {
        float _129 = _125 * 5.0;
        _127 = as_type<int>(_129);
    }
    int _131 = _127;
    int _133 = _131;
    if (!_119)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2724 = as_type<float>(_131);
        out.gl_Position.z = _2724;
    }
    if (!_119)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _135 = in.m_54.w;
    float _137 = float(_115);
    float _139 = -_135;
    float _141 = _139 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _143 = _135 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _145 = isnan(_135);
    bool _147 = _143 || _145;
    bool _149 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _151 = _147 || _149;
    bool _153 = _141 >= _137;
    bool _155 = !_151;
    bool _157 = _153 || _155;
    if (_157)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _159 = _123;
    if (_157)
    {
        out.m_52.x = 0.0;
    }
    if (_157)
    {
        float _161 = _159 * 5.0;
        _133 = as_type<int>(_161);
    }
    int _163 = _133;
    if (_157)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2787 = as_type<float>(_163);
        out.gl_Position.z = _2787;
    }
    if (_157)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _165 = in.m_56.x;
    float _167 = in.m_56.y;
    float _169 = in.m_56.z;
    float _171 = 1.0 / _137;
    float _173 = in.m_58.x;
    float _175 = in.m_58.y;
    float _177 = in.m_58.z;
    float _179 = in.m_60.x;
    float _181 = in.m_60.y;
    float _183 = in.m_60.z;
    float _185 = _141 * _171;
    float _187 = _165 * _165;
    float _189 = _167 * _167;
    float _191 = fma(_173, _173, _187);
    float _193 = fma(_175, _175, _189);
    float _195 = fma(_179, _179, _191);
    float _197 = _169 * _169;
    float _199 = fma(_181, _181, _193);
    float _201 = sqrt(_195);
    float _203 = fma(_177, _177, _197);
    float _205 = fma(_183, _183, _203);
    float _207 = sqrt(_199);
    float _209 = sqrt(_205);
    bool _211 = _201 > 0.0;
    bool _213 = _207 > 0.0;
    float _215 = 0.0;
    float _217 = _207;
    if (_211)
    {
        float _219 = rsqrt(_195);
        _215 = _219;
    }
    float _221 = _215;
    float _223 = 0.0;
    if (!_211)
    {
        _223 = 0.0;
    }
    float _225 = _223;
    bool _227 = _209 > 0.0;
    float _229 = _209;
    float _231 = _225;
    bool _233 = _227;
    if (!_211)
    {
        _217 = 0.0;
    }
    float _235 = _217;
    float _237 = 0.0;
    float _239 = _235;
    if (!_211)
    {
        _237 = 0.0;
    }
    float _241 = _237;
    float _243 = _201;
    float _245 = _241;
    if (_213)
    {
        float _247 = rsqrt(_199);
        _243 = _247;
    }
    float _249 = _243;
    if (!_213)
    {
        _229 = 0.0;
    }
    float _251 = _229;
    float _253 = 0.0;
    float _255 = _251;
    if (!_213)
    {
        _253 = 0.0;
    }
    float _257 = _253;
    float _259 = 0.0;
    float _261 = _257;
    if (!_213)
    {
        _259 = 0.0;
    }
    float _263 = _259;
    float _265 = 0.0;
    float _267 = _263;
    if (_227)
    {
        float _269 = rsqrt(_205);
        _265 = _269;
    }
    float _271 = _265;
    if (_211)
    {
        float _273 = _221 * _165;
        _231 = _273;
    }
    float _275 = _231;
    if (_211)
    {
        float _277 = _221 * _173;
        _239 = _277;
    }
    float _279 = _239;
    if (_211)
    {
        float _281 = _221 * _179;
        _245 = _281;
    }
    float _283 = _245;
    bool _285 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _287 = 0.0;
    if (!_227)
    {
        _287 = 0.0;
    }
    float _289 = _287;
    float _291 = 0.0;
    float _293 = _289;
    if (!_227)
    {
        _291 = 0.0;
    }
    float _295 = _291;
    float _297 = _295;
    if (_213)
    {
        float _299 = _249 * _167;
        _255 = _299;
    }
    float _301 = _255;
    float _303 = 0.0;
    if (!_227)
    {
        _303 = 0.0;
    }
    float _305 = _303;
    float _307 = _305;
    if (_213)
    {
        float _309 = _249 * _175;
        _261 = _309;
    }
    float _311 = _261;
    if (_213)
    {
        float _313 = _249 * _181;
        _267 = _313;
    }
    float _315 = _267;
    if (_227)
    {
        float _317 = _271 * _169;
        _293 = _317;
    }
    float _319 = _293;
    if (_227)
    {
        float _321 = _271 * _177;
        _297 = _321;
    }
    float _323 = _297;
    if (_227)
    {
        float _325 = _271 * _183;
        _307 = _325;
    }
    float _327 = _307;
    bool _329 = !_285;
    float _347;
    if (!_329)
    {
        float _331 = in.m_62.x;
        float _333 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _335 = _331 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _337 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[12].x, _141);
        float _339 = _337 * _333;
        float _341 = floor(_339);
        float _343 = -_341;
        float _345 = _339 + _343;
        _347 = _345;
        _349 = true;
    }
    else
    {
        _347 = _185;
    }
    _349 = false;
    float _351 = _347;
    float _353 = in.m_64.x;
    float _355 = in.m_64.y;
    float _357 = _141 * (*spvDescriptorSet0.vp_c9)._m0[193].y;
    float _359 = in.m_62.x;
    float _361 = in.m_49.x;
    float _363 = in.m_49.y;
    float _365 = in.m_49.z;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _369 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _367;
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _373 = _371 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _375 = in.m_62.y;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _377;
    float _381 = 1.0 / _369;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _385 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _383;
    float _387 = abs(_353);
    float _389 = log2(_387);
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _393 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _391;
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _397 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _395;
    float _399 = fma(_359, 6.283185482025146484375, _357);
    float _401 = fma((*spvDescriptorSet0.vp_c9)._m0[194].y, 0.01745329238474369049072265625, _399);
    float _403 = _175 * _363;
    float _405 = _181 * _363;
    float _407 = 1.0 / _379;
    float _409 = _375 * 628.31854248046875;
    float _411 = fma(_173, _361, _403);
    float _413 = _401 * 0.15915493667125701904296875;
    float _415 = _389 * (*spvDescriptorSet0.vp_c9)._m0[193].z;
    float _417 = _401 * 0.60000002384185791015625;
    float _419 = 1.0 / _373;
    float _421 = _417 * 0.15915493667125701904296875;
    float _423 = _401 * 1.2999999523162841796875;
    float _425 = _423 * 0.15915493667125701904296875;
    float _427 = fma(_179, _361, _405);
    float _429 = -(*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _431 = _429 + (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _433 = exp2(_415);
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _437 = _351 + _435;
    float _439 = _401 + 0.52359879016876220703125;
    float _441 = fma(_431, _359, (*spvDescriptorSet0.vp_c9)._m0[191].x);
    float _443 = _437 * _381;
    float _445 = _439 * 0.15915493667125701904296875;
    float _447 = fma(_141, _441, _409);
    float _449 = fma(_401, 0.60000002384185791015625, 0.31415927410125732421875);
    float _451 = _413 * 6.283185482025146484375;
    float _453 = sin(_451);
    float _455 = fma(_401, 1.2999999523162841796875, 0.680678427219390869140625);
    float _457 = (*spvDescriptorSet0.vp_c9)._m0[193].w * 3.1415927410125732421875;
    float _459 = _449 * 0.15915493667125701904296875;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _463 = _351 + _461;
    float _465 = fma(_457, _433, _357);
    float _467 = _421 * 6.283185482025146484375;
    float _469 = sin(_467);
    float _471 = in.m_66.x;
    float _473 = in.m_66.y;
    float _475 = in.m_66.z;
    float _477 = fma(_359, 6.283185482025146484375, _465);
    float _479 = _463 * _407;
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _483 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _481;
    float _485 = fma(_353, 0.261799395084381103515625, -0.261799395084381103515625);
    float _487 = _445 * 6.283185482025146484375;
    float _489 = sin(_487);
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _493 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _491;
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _497 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _495;
    float _499 = _447 + _485;
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _503 = _351 + _501;
    float _505 = _455 * 0.15915493667125701904296875;
    float _507 = fma(_483, _443, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _509 = fma(_493, _443, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _511 = _459 * 6.283185482025146484375;
    float _513 = sin(_511);
    float _515 = fma(_385, _443, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _517 = fma(_393, _479, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _519 = fma(_497, _479, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _521 = fma(_397, _479, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _523 = _499 * 1.10000002384185791015625;
    float _525 = fma(_469, 0.60000002384185791015625, _453);
    float _527 = _503 * _419;
    float _529 = _425 * 6.283185482025146484375;
    float _531 = sin(_529);
    bool _533 = _471 > 0.0;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _537 = _535 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _539 = _471 >= 0.0;
    bool _541 = isnan(_471);
    bool _543 = _539 || _541;
    bool _545 = isnan(0.0);
    bool _547 = _543 || _545;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _551 = _549 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _553 = _351 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _555 = isnan(_351);
    bool _557 = _553 || _555;
    bool _559 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _561 = _557 || _559;
    float _563 = float(_561);
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _567 = _565 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    int _569 = _547 ? 0 : 1;
    float _571 = _505 * 6.283185482025146484375;
    float _573 = sin(_571);
    float _575 = _523 * 0.15915493667125701904296875;
    float _577 = fma(_513, 0.60000002384185791015625, _489);
    int _579 = ~_569;
    int _581 = _579 + 1;
    int _583 = _581 + 1;
    float _585 = fma(_537, _527, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _587 = fma(_551, _527, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    int _589 = _583;
    if (!_533)
    {
        int _591 = ~_569;
        int _593 = _591 + 1;
        _589 = _593;
    }
    int _595 = _589;
    float _597 = _499 * 0.699999988079071044921875;
    bool _599 = _351 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _601 = isnan(_351);
    bool _603 = _599 || _601;
    bool _605 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _607 = _603 || _605;
    float _609 = float(_607);
    float _611 = _477 * 0.60000002384185791015625;
    float _613 = fma(_567, _527, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _615 = _597 * 0.15915493667125701904296875;
    float _617 = -_563;
    float _619 = _617 + 1.0;
    float _621 = _499 * 0.15915493667125701904296875;
    float _623 = _499 * 0.89999997615814208984375;
    float _625 = fma(_531, 0.300000011920928955078125, _525);
    float _627 = _575 * 6.283185482025146484375;
    float _629 = cos(_627);
    float _631 = _477 * 0.15915493667125701904296875;
    bool _633 = _351 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _635 = isnan(_351);
    bool _637 = _633 || _635;
    bool _639 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _641 = _637 || _639;
    float _643 = float(_641);
    float _645 = _609 * _619;
    bool _647 = _351 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _649 = isnan(_351);
    bool _651 = _647 || _649;
    bool _653 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _655 = _651 || _653;
    float _657 = float(_655);
    float _659 = -_353;
    float _661 = _659 + 1.0;
    float _663 = _623 * 0.15915493667125701904296875;
    float _665 = float(_595);
    float _667 = _631 * 6.283185482025146484375;
    float _669 = sin(_667);
    float _671 = _611 * 0.15915493667125701904296875;
    float _673 = -_609;
    float _675 = _673 + 1.0;
    float _677 = _477 * 1.2999999523162841796875;
    float _679 = _447 * 0.89999997615814208984375;
    float _681 = _447 * 0.15915493667125701904296875;
    float _683 = _643 * _675;
    float _685 = -_643;
    float _687 = _685 + 1.0;
    float _689 = _671 * 6.283185482025146484375;
    float _691 = sin(_689);
    float _693 = _677 * 0.15915493667125701904296875;
    float _695 = fma(_573, 0.300000011920928955078125, _577);
    float _697 = _625 * _661;
    float _699 = -_355;
    float _701 = _699 + 1.0;
    float _703 = _657 * _687;
    float _705 = -_657;
    float _707 = _705 + 1.0;
    float _709 = _697 * 0.52359879016876220703125;
    float _711 = _693 * 6.283185482025146484375;
    float _713 = sin(_711);
    float _715 = in.m_68.y;
    float _717 = _509 * _703;
    float _719 = _507 * _703;
    float _721 = _515 * _703;
    float _723 = abs(_695);
    float _725 = _701 * _723;
    float _727 = fma(_707, (*spvDescriptorSet0.vp_c9)._m0[143].y, _717);
    float _729 = fma(_707, (*spvDescriptorSet0.vp_c9)._m0[143].x, _719);
    float _731 = _663 * 6.283185482025146484375;
    float _733 = sin(_731);
    float _735 = fma(_707, (*spvDescriptorSet0.vp_c9)._m0[143].z, _721);
    float _737 = fma(_587, _683, _727);
    float _739 = fma(_691, 0.60000002384185791015625, _669);
    float _741 = _709 * 0.15915493667125701904296875;
    float _743 = fma(_585, _683, _729);
    float _745 = fma(_613, _683, _735);
    float _747 = _725 * (-20.0);
    float _749 = _621 * 6.283185482025146484375;
    float _751 = sin(_749);
    float _753 = fma(_519, _645, _737);
    float _755 = fma(_713, 0.300000011920928955078125, _739);
    float _757 = _725 * (-45.0);
    float _759 = in.m_70.x;
    float _761 = in.m_70.y;
    float _763 = in.m_70.z;
    float _765 = _665 * _747;
    float _767 = _757 * 0.01745329238474369049072265625;
    float _769 = _615 * 6.283185482025146484375;
    float _771 = cos(_769);
    float _773 = _733 * 0.89999997615814208984375;
    float _775 = _765 * 0.01745329238474369049072265625;
    float _777 = fma(_715, 0.5, 0.5);
    float _779 = _767 * 0.15915493667125701904296875;
    float _781 = fma(_517, _645, _743);
    float _783 = fma(_521, _645, _745);
    float _785 = _777 * _755;
    float _787 = _741 * 6.283185482025146484375;
    float _789 = sin(_787);
    float _791 = -_773;
    float _793 = fma(_751, -1.2000000476837158203125, _791);
    float _795 = _775 * 0.15915493667125701904296875;
    float _797 = fma(_563, (*spvDescriptorSet0.vp_c9)._m0[146].x, _781);
    float _799 = fma(_563, (*spvDescriptorSet0.vp_c9)._m0[146].y, _753);
    float _801 = _679 * 0.15915493667125701904296875;
    float _803 = abs(_793);
    bool _805 = _803 > 0.001000000047497451305389404296875;
    bool _807 = isnan(_803);
    bool _809 = _805 || _807;
    bool _811 = isnan(0.001000000047497451305389404296875);
    bool _813 = _809 || _811;
    float _815 = fma(_563, (*spvDescriptorSet0.vp_c9)._m0[146].z, _783);
    float _817 = _741 * 6.283185482025146484375;
    float _819 = cos(_817);
    float _821 = _771 * 0.699999988079071044921875;
    float _823 = _473 + (-0.0199999995529651641845703125);
    float _825 = _797 * _759;
    float _827 = fma(_629, 1.10000002384185791015625, _821);
    float _829 = _799 * _761;
    float _831 = _779 * 6.283185482025146484375;
    float _833 = sin(_831);
    float _835 = _789 * _471;
    float _837 = abs(_827);
    bool _839 = _837 != 0.0;
    bool _841 = isnan(_837);
    bool _843 = _839 || _841;
    bool _845 = isnan(0.0);
    bool _847 = _843 || _845;
    float _849 = _779 * 6.283185482025146484375;
    float _851 = cos(_849);
    float _853 = -_835;
    float _855 = fma(_819, _475, _853);
    float _857 = _819 * _471;
    float _859 = _815 * _763;
    float _861 = _855 + 0.02999999932944774627685546875;
    float _863 = fma(_789, _475, _857);
    float _865 = _447 * 0.699999988079071044921875;
    float _867 = _795 * 6.283185482025146484375;
    float _869 = sin(_867);
    float _871 = _785 * (*spvDescriptorSet0.vp_c9)._m0[193].x;
    float _873 = _813 ? _793 : 0.001000000047497451305389404296875;
    float _875 = _833 * _861;
    float _877 = fma(_665, -0.100000001490116119384765625, _863);
    float _879 = _871 * 0.01745329238474369049072265625;
    float _881 = abs(_873);
    bool _883 = _881 == 0.0;
    bool _885 = !_847;
    bool _887 = _883 && _885;
    float _889 = _795 * 6.283185482025146484375;
    float _891 = cos(_889);
    float _893 = _879 * 0.15915493667125701904296875;
    float _895 = abs(_873);
    bool _897 = _895 == 0.0;
    float _899 = -_875;
    float _901 = fma(_851, _823, _899);
    float _903 = _851 * _861;
    float _905 = _681 * 6.283185482025146484375;
    float _907 = cos(_905);
    float _909 = _901 * _869;
    int _911 = as_type<int>(_861);
    float _913 = _909;
    float _915 = _753;
    if (_887)
    {
        bool _917 = as_type<int>(_873) >= 0;
        _233 = _917;
    }
    bool _919 = _233;
    int _921 = _919 ? (-1) : 0;
    if (_887)
    {
        int _923 = _919 ? 0 : 1078530011;
        _911 = _923;
    }
    int _925 = _911;
    float _927 = _801 * 6.283185482025146484375;
    float _929 = cos(_927);
    float _931 = _901 * _891;
    float _933 = -_909;
    float _935 = fma(_891, _877, _933);
    int _937 = as_type<int>(_891);
    if (_887)
    {
        int _939 = int(0x80000000) & as_type<int>(_827);
        int _941 = _925 | _939;
        _913 = as_type<float>(_941);
    }
    float _943 = _913;
    float _945 = fma(_869, _877, _931);
    float _947 = _893 * 6.283185482025146484375;
    float _949 = sin(_947);
    float _951 = _893 * 6.283185482025146484375;
    float _953 = cos(_951);
    bool _955 = !_847;
    bool _957 = _955 && _897;
    float _959 = _943;
    float _961 = _943;
    if (!_957)
    {
        float _963 = abs(_827);
        bool _965 = _963 != as_type<float>(0x7f800000u /* inf */);
        bool _967 = isnan(_963);
        bool _969 = _965 || _967;
        bool _971 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _973 = _969 || _971;
        float _975 = abs(_873);
        bool _977 = _975 == as_type<float>(0x7f800000u /* inf */);
        float _979 = abs(_873);
        bool _981 = _979 == as_type<float>(0x7f800000u /* inf */);
        bool _983 = !_973;
        bool _985 = _981 && _983;
        if (_985)
        {
            bool _987 = as_type<int>(_873) >= 0;
            _921 = _987 ? (-1) : 0;
        }
        int _989 = _921;
        if (_985)
        {
            _937 = 1075235812;
        }
        int _991 = _937;
        int _993 = _991;
        if (_985)
        {
            int _995 = ~_989;
            int _997 = (_995 != 0) ? _991 : 1061752795;
            _993 = _997;
        }
        int _999 = _993;
        if (_985)
        {
            int _1001 = int(0x80000000) & as_type<int>(_827);
            int _1003 = _999 | _1001;
            _959 = as_type<float>(_1003);
        }
        float _1005 = _959;
        bool _1007 = !_973;
        bool _1009 = _1007 && _977;
        _961 = _1005;
        if (!_1009)
        {
            float _1011 = abs(_827);
            float _1013 = abs(_873);
            float _1015 = precise::max(_1011, _1013);
            float _1017 = abs(_827);
            float _1019 = abs(_873);
            float _1021 = precise::min(_1017, _1019);
            float _1023 = 1.0 / _1015;
            float _1025 = abs(_827);
            float _1027 = abs(_873);
            bool _1029 = _1025 > _1027;
            bool _1031 = as_type<int>(_873) >= 0;
            float _1033 = abs(_827);
            float _1035 = abs(_873);
            float _1037 = _1033 + _1035;
            int _1039 = as_type<int>(_827) & int(0x80000000);
            bool _1041 = _1037 > as_type<float>(0x7f800000u /* inf */);
            bool _1043 = isnan(_1037);
            bool _1045 = _1041 || _1043;
            bool _1047 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1049 = _1045 || _1047;
            float _1051 = _1021 * _1023;
            float _1053 = _1051 * _1051;
            float _1055 = _1053 + 11.33538818359375;
            float _1057 = fma(_1053, _1055, 28.84246826171875);
            float _1059 = fma(_1053, _1057, 19.6966705322265625);
            float _1061 = fma(_1053, -0.82336294651031494140625, -5.674867153167724609375);
            float _1063 = fma(_1053, _1061, -6.565555095672607421875);
            float _1065 = 1.0 / _1059;
            float _1067 = _1053 * _1063;
            float _1069 = _1051 * _1067;
            float _1071 = fma(_1069, _1065, _1051);
            float _1073 = _1071;
            _961 = _1037;
            if (_1029)
            {
                float _1075 = -_1071;
                float _1077 = _1075 + 1.57079637050628662109375;
                _1073 = _1077;
            }
            float _1079 = _1073;
            int _1081 = as_type<int>(_1079);
            if (!_1031)
            {
                float _1083 = -_1079;
                float _1085 = _1083 + 3.1415927410125732421875;
                _1081 = as_type<int>(_1085);
            }
            int _1087 = _1081;
            if (!_1049)
            {
                int _1089 = _1039 | _1087;
                _961 = as_type<float>(_1089);
            }
        }
    }
    float _1091 = _961;
    float _1093 = _945 + 0.0199999995529651641845703125;
    float _1095 = fma(_665, 0.100000001490116119384765625, _935);
    float _1097 = _1091 + 1.57079637050628662109375;
    float _1099 = in.m_62.z;
    float _1101 = _1093 * _949;
    float _1103 = fma(_833, _823, _903);
    float _1105 = _1093 * _953;
    float _1107 = _1097 * (-0.15915493667125701904296875);
    float _1109 = -_1101;
    float _1111 = fma(_1095, _953, _1109);
    float _1113 = _1103 + (-0.02999999932944774627685546875);
    float _1115 = fma(_1095, _949, _1105);
    float _1117 = _447 * 1.10000002384185791015625;
    float _1119 = fma(_625, (*spvDescriptorSet0.vp_c9)._m0[194].x, _1111);
    float _1121 = in.m_58.w;
    float _1123 = _859 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1125 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1113);
    float _1127 = _829 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1129 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1115);
    float _1131 = _825 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1133 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1119);
    float _1135 = in.m_60.w;
    float _1137 = _1107 * 6.283185482025146484375;
    float _1139 = cos(_1137);
    float _1141 = _1123 * _1125;
    float _1143 = _1127 * _1129;
    float _1145 = _1131 * _1133;
    float _1147 = _865 * 0.15915493667125701904296875;
    float _1149 = _1141 * _311;
    float _1151 = _1117 * 0.15915493667125701904296875;
    float _1153 = _1141 * _315;
    float _1155 = _1107 * 6.283185482025146484375;
    float _1157 = sin(_1155);
    float _1159 = fma(_1145, _279, _1149);
    float _1161 = _1099 * 6.283185482025146484375;
    float _1163 = fma(_1145, _283, _1153);
    float _1165 = fma(_177, _365, _411);
    float _1167 = -_1143;
    float _1169 = fma(_1167, _323, _1159);
    float _1171 = _1161 * 0.15915493667125701904296875;
    float _1173 = -_1143;
    float _1175 = fma(_1173, _327, _1163);
    float _1177 = _1147 * 6.283185482025146484375;
    float _1179 = sin(_1177);
    float _1181 = _1169 * _1139;
    float _1183 = fma(_183, _365, _427);
    float _1185 = _1165 + _1121;
    float _1187 = fma(_907, 1.2000000476837158203125, _929);
    float _1189 = _185 * 3.3333332538604736328125;
    float _1191 = _1183 + _1135;
    float _1193 = _1151 * 6.283185482025146484375;
    float _1195 = sin(_1193);
    float _1197 = _1169 * _1157;
    float _1199 = fma(_1175, _1157, _1181);
    float _1201 = -_1197;
    float _1203 = fma(_1175, _1139, _1201);
    float _1205 = _1185 + _1199;
    float _1207 = _1171 * 6.283185482025146484375;
    float _1209 = sin(_1207);
    float _1211 = _1191 + _1203;
    float _1213 = fma(_1187, (*spvDescriptorSet0.vp_c9)._m0[191].z, _1205);
    float _1215 = in.m_72.y;
    float _1217 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1219 = _1213 + _1217;
    float _1221 = _1171 * 6.283185482025146484375;
    float _1223 = cos(_1221);
    float _1225 = _1179 + _1195;
    float _1227 = fma(_1225, (*spvDescriptorSet0.vp_c9)._m0[191].z, _1211);
    float _1229 = _1209 * _1219;
    float _1231 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1233 = _1227 + _1231;
    float _1235 = _1223 * _1219;
    float _1237 = -_1229;
    float _1239 = fma(_1223, _1233, _1237);
    float _1241 = fma(_1209, _1233, _1235);
    float _1243 = _1239 + (*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1245 = _1241 + (*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1247 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1249 = _1243 + _1247;
    float _1251 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1253 = _1245 + _1251;
    float _1255 = _1249 * _1249;
    float _1257 = fma(_1253, _1253, _1255);
    float _1259 = sqrt(_1257);
    bool _1261 = _1259 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1263 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1265 = _1259 + _1263;
    float _1267 = 0.0 + _1189;
    float _1269 = precise::clamp(_1267, 0.0, 1.0);
    float _1271 = -_1189;
    float _1273 = _1271 + 3.3333332538604736328125;
    float _1275 = precise::clamp(_1273, 0.0, 1.0);
    float _1277 = precise::min(_1269, _1275);
    float _1279 = _517;
    if (_1261)
    {
        float _1281 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1279 = _1281;
    }
    float _1283 = _1279;
    float _1285 = _1283;
    if (_1261)
    {
        float _1287 = _1265 * _1283;
        _1285 = _1287;
    }
    float _1289 = _1285;
    float _1291 = _1141 * _301;
    float _1293 = _363 + _1215;
    float _1295 = -(*spvDescriptorSet0.vp_c9)._m0[192].w;
    float _1297 = _1295 + 1.0;
    float _1299 = _1289;
    float _1301 = _1297;
    float _1303 = _1215;
    if (_1261)
    {
        float _1305 = _1289 * 0.15915493667125701904296875;
        _1299 = _1305;
    }
    float _1307 = _1299;
    float _1309 = fma(_1145, _275, _1291);
    float _1311 = _1227;
    if (_1261)
    {
        float _1313 = _1307 * 6.283185482025146484375;
        float _1315 = sin(_1313);
        _1311 = _1315;
    }
    float _1317 = _1311;
    float _1319 = -_1143;
    float _1321 = fma(_1319, _319, _1309);
    float _1323 = fma(_1277, -5.0, 5.0);
    float _1325 = _1293 + _1321;
    float _1327 = 5.0;
    float _1329 = _1323;
    if (_1261)
    {
        float _1331 = rsqrt(_1257);
        _1327 = _1331;
    }
    float _1333 = _1327;
    float _1335 = -_1323;
    float _1337 = fma(_1335, _1297, _1325);
    float _1339 = _1337;
    if (!_1261)
    {
        _1329 = _1245;
    }
    float _1341 = _1329;
    float _1343 = _1341;
    if (_1261)
    {
        float _1345 = _1337 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1301 = _1345;
    }
    float _1347 = _1301;
    float _1349 = _1317;
    if (_1261)
    {
        float _1351 = fma(_1317, _1347, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1303 = _1351;
    }
    float _1353 = _1303;
    if (!_1261)
    {
        _1349 = _1243;
    }
    float _1355 = _1349;
    float _1357 = _1333;
    float _1359 = _1355;
    if (_1261)
    {
        float _1361 = _1333 * _1353;
        _1357 = _1361;
    }
    float _1363 = _1357;
    if (_1261)
    {
        float _1365 = fma(_1253, _1363, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1343 = _1365;
    }
    float _1367 = _1343;
    if (_1261)
    {
        float _1369 = fma(_1249, _1363, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1359 = _1369;
    }
    float _1371 = _1359;
    float _1373 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1375 = _1367 + _1373;
    float _1377 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1379 = _1371 + _1377;
    float _1381 = fma(_1375, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1383 = fma(_1379, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _4549 = float2(_1381, _1383);
    float _1385 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_4549, float2(0.0), isnan(_4549)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_4549, float2(0.0), isnan(_4549)), level(0.0)).x;
    float _1387 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _1389 = fma(_1385, 100.0, _1293);
    float _1391 = _1389 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1393 = fma(_1185, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1391);
    float _1395 = fma(_1191, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1393);
    float _1397 = _1389 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1399 = _1389 + _1387;
    float _1401 = _1395 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1403 = fma(_1185, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1397);
    float _1405 = 1.0 / _1401;
    float _1407 = fma(_1191, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1403);
    float _1409 = _1407 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1411 = _1409 + _1401;
    float _1413 = _1411 * _1405;
    float _1415 = _1413 * 0.5;
    float _1417 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1419 = fma(_1415, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1417);
    float _1421 = 1.0 / _1419;
    float _1423 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1425 = _1421 * _1423;
    bool _1427 = _1425 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1429 = _1425 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1431 = !_1427;
    int _1433 = _1431 ? 0 : 1;
    int _1435 = 2;
    if (!_1427)
    {
        _1435 = 1;
    }
    int _1437 = _1435;
    int _1439 = _1437;
    if (!_1429)
    {
        _1439 = _1433;
    }
    int _1441 = _1439;
    int _1443 = _1441 << 6;
    int _1445 = _1443 + 96;
    uint _1448 = uint(int(uint(_1445) >> uint(2)));
    uint _1450 = uint(int(uint(int(_1448)) >> uint(2)));
    int _1452 = int(_1448) & 3;
    float _1454 = (*spvDescriptorSet0.vp_c15)._m0[int(_1450)][_1452];
    int _1456 = int(_1448) + 1;
    uint _1458 = uint(int(uint(_1456) >> uint(2)));
    int _1460 = _1456 & 3;
    float _1462 = (*spvDescriptorSet0.vp_c15)._m0[int(_1458)][_1460];
    int _1464 = _1443 + 104;
    uint _1466 = uint(int(uint(_1464) >> uint(2)));
    uint _1468 = uint(int(uint(int(_1466)) >> uint(2)));
    int _1470 = int(_1466) & 3;
    float _1472 = (*spvDescriptorSet0.vp_c15)._m0[int(_1468)][_1470];
    int _1474 = int(_1466) + 1;
    uint _1476 = uint(int(uint(_1474) >> uint(2)));
    int _1478 = _1474 & 3;
    float _1480 = (*spvDescriptorSet0.vp_c15)._m0[int(_1476)][_1478];
    int _1482 = _1443 + 48;
    uint _1484 = uint(int(uint(_1482) >> uint(2)));
    uint _1486 = uint(int(uint(int(_1484)) >> uint(2)));
    int _1488 = int(_1484) & 3;
    float _1490 = (*spvDescriptorSet0.vp_c15)._m0[int(_1486)][_1488];
    int _1492 = int(_1484) + 1;
    uint _1494 = uint(int(uint(_1492) >> uint(2)));
    int _1496 = _1492 & 3;
    float _1498 = (*spvDescriptorSet0.vp_c15)._m0[int(_1494)][_1496];
    int _1500 = _1443 + 64;
    uint _1502 = uint(int(uint(_1500) >> uint(2)));
    uint _1504 = uint(int(uint(int(_1502)) >> uint(2)));
    int _1506 = int(_1502) & 3;
    float _1508 = (*spvDescriptorSet0.vp_c15)._m0[int(_1504)][_1506];
    int _1510 = int(_1502) + 1;
    uint _1512 = uint(int(uint(_1510) >> uint(2)));
    int _1514 = _1510 & 3;
    float _1516 = (*spvDescriptorSet0.vp_c15)._m0[int(_1512)][_1514];
    int _1518 = _1443 + 56;
    uint _1520 = uint(int(uint(_1518) >> uint(2)));
    uint _1522 = uint(int(uint(int(_1520)) >> uint(2)));
    int _1524 = int(_1520) & 3;
    float _1526 = (*spvDescriptorSet0.vp_c15)._m0[int(_1522)][_1524];
    int _1528 = int(_1520) + 1;
    uint _1530 = uint(int(uint(_1528) >> uint(2)));
    int _1532 = _1528 & 3;
    float _1534 = (*spvDescriptorSet0.vp_c15)._m0[int(_1530)][_1532];
    int _1536 = _1443 + 72;
    uint _1538 = uint(int(uint(_1536) >> uint(2)));
    uint _1540 = uint(int(uint(int(_1538)) >> uint(2)));
    int _1542 = int(_1538) & 3;
    float _1544 = (*spvDescriptorSet0.vp_c15)._m0[int(_1540)][_1542];
    int _1546 = int(_1538) + 1;
    uint _1548 = uint(int(uint(_1546) >> uint(2)));
    int _1550 = _1546 & 3;
    float _1552 = (*spvDescriptorSet0.vp_c15)._m0[int(_1548)][_1550];
    float _1554 = _1399 * _1462;
    float _1556 = fma(_1185, _1454, _1554);
    float _1558 = fma(_1191, _1472, _1556);
    float _1560 = _1558 + _1480;
    int _1562 = _1443 + 80;
    uint _1564 = uint(int(uint(_1562) >> uint(2)));
    uint _1566 = uint(int(uint(int(_1564)) >> uint(2)));
    int _1568 = int(_1564) & 3;
    float _1570 = (*spvDescriptorSet0.vp_c15)._m0[int(_1566)][_1568];
    int _1572 = int(_1564) + 1;
    uint _1574 = uint(int(uint(_1572) >> uint(2)));
    int _1576 = _1572 & 3;
    float _1578 = (*spvDescriptorSet0.vp_c15)._m0[int(_1574)][_1576];
    float _1580 = _1399 * _1498;
    float _1582 = 1.0 / _1560;
    float _1584 = fma(_1185, _1490, _1580);
    int _1586 = _1443 + 88;
    uint _1588 = uint(int(uint(_1586) >> uint(2)));
    uint _1590 = uint(int(uint(int(_1588)) >> uint(2)));
    int _1592 = int(_1588) & 3;
    float _1594 = (*spvDescriptorSet0.vp_c15)._m0[int(_1590)][_1592];
    int _1596 = int(_1588) + 1;
    uint _1598 = uint(int(uint(_1596) >> uint(2)));
    int _1600 = _1596 & 3;
    float _1602 = (*spvDescriptorSet0.vp_c15)._m0[int(_1598)][_1600];
    float _1604 = _1399 * _1516;
    float _1606 = fma(_1185, _1508, _1604);
    float _1608 = fma(_1191, _1526, _1584);
    float _1610 = _1608 + _1534;
    float _1612 = fma(_1191, _1544, _1606);
    float _1614 = _1610 * _1582;
    float _1616 = fma(_1185, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1618 = _1612 + _1552;
    bool _1620 = _1614 >= 0.0;
    float _1622 = fma(_1191, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1624 = _1618 * _1582;
    bool _1626 = _1614 <= 1.0;
    bool _1628 = _1626 && _1620;
    float _1630 = floor(_1622);
    bool _1632 = _1624 >= 0.0;
    bool _1634 = _1632 && _1628;
    bool _1636 = _1624 <= 1.0;
    bool _1638 = _1636 && _1634;
    float _1640 = floor(_1616);
    float _1642 = _1399 * _1578;
    float _1644 = fma(_1185, _1570, _1642);
    float _1646 = -_1630;
    float _1648 = _1622 + _1646;
    float _1650 = fma(_1191, _1594, _1644);
    float _1652 = _1584;
    if (_1638)
    {
        float _1654 = float(_1441);
        _1652 = _1654;
    }
    float _1656 = _1652;
    float _1658 = _1650 + _1602;
    float _1660 = -_1640;
    float _1662 = _1616 + _1660;
    float _1664 = _1656;
    if (_1638)
    {
        float _1666 = rint(_1656);
        float _1668 = precise::max(_1666, 0.0);
        uint _1670 = uint(_1668);
        uint _1672 = clamp(_1670, 0u, 65535u);
        _1664 = as_type<float>(_1672);
    }
    float _1674 = _1664;
    float _1676 = _1658 * _1582;
    float2 _5044 = float2(_1662, _1648);
    float _1678 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5044, float2(0.0), isnan(_5044)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5044, float2(0.0), isnan(_5044)), level(0.0)).x;
    float _1680 = _1624;
    if (_1638)
    {
        float3 _5059 = float3(_1614, _1624, float(as_type<int>(_1674)));
        float3 _5063 = select(_5059, float3(0.0), isnan(_5059));
        float _1682 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5063.xy, uint(rint(_5063.z)), _1676, level(0.0));
        _1680 = _1682;
    }
    float _1684 = _1680;
    float _1686 = in.m_62.w;
    bool _1688 = _1115 != 0.0;
    bool _1690 = isnan(_1115);
    bool _1692 = _1688 || _1690;
    bool _1694 = isnan(0.0);
    bool _1696 = _1692 || _1694;
    float _1698 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _1700 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1702 = _1700 != 0;
    float _1704 = in.m_68.x;
    bool _1706 = _1119 == 0.0;
    bool _1708 = !_1696;
    bool _1710 = _1706 && _1708;
    int _1712 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1714 = _1712 != 0;
    float _1716 = in.m_74.x;
    float _1718 = in.m_74.y;
    float _1720 = in.m_74.z;
    float _1722 = in.m_74.w;
    bool _1724 = _1103 == 0.02999999932944774627685546875;
    bool _1726 = _1724 && _1710;
    float _1728 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1730 = _1552;
    if (_1702)
    {
        float _1732 = in.m_62.z;
        _1730 = _1732;
    }
    float _1734 = _1730;
    float _1736 = -_715;
    float _1738 = _1736 + 1.0;
    float _1740 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1742 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1744 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1746 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _1748 = _1686 > 0.5;
    float _1750 = _1740 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1752 = _1742 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1754 = _1744 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1756 = _1704;
    float _1758 = _1752;
    if (_1702)
    {
        _915 = _1704;
    }
    float _1760 = _915;
    int _1762 = _1748 ? as_type<int>(_1738) : as_type<int>(_715);
    float _1764 = _315 * _1720;
    float _1766 = _301 * _1720;
    float _1768 = _1714 ? as_type<float>(_1762) : _715;
    float _1770 = _311 * _1720;
    float _1772 = fma(_283, _1716, _1764);
    float _1774 = fma(_275, _1716, _1766);
    out.m_76.x = _1750;
    out.m_76.y = _1752;
    out.m_76.z = _1754;
    out.m_76.w = _1746;
    float _1776 = fma(_279, _1716, _1770);
    bool _1778 = _1734 > 0.5;
    bool _1780 = _1778 && _1702;
    float _1782 = _1768 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1784 = in.m_78.x;
    float _1786 = in.m_78.y;
    float _1788 = in.m_78.z;
    float _1790 = -_1718;
    float _1792 = fma(_323, _1790, _1776);
    float _1794 = -_1718;
    float _1796 = fma(_319, _1794, _1774);
    float _1798 = -_1718;
    float _1800 = fma(_327, _1798, _1772);
    float _1802 = _1782 * _1728;
    out.m_80.x = _1792;
    out.m_80.y = _1796;
    out.m_80.z = _1800;
    float _1804 = _1760;
    float _1806 = _1764;
    float _1808 = _1768;
    float _1810 = _1722;
    if (_1780)
    {
        float _1812 = -_1760;
        float _1814 = _1812 + 1.0;
        _1804 = _1814;
    }
    float _1816 = _1804;
    if (_1702)
    {
        _1756 = _1816;
    }
    float _1818 = _1756;
    float _1820 = _1796;
    float _1822 = _1818;
    if (_1261)
    {
        float _1824 = _1307 * 6.283185482025146484375;
        float _1826 = cos(_1824);
        _1820 = _1826;
    }
    float _1828 = _1820;
    float _1830 = _1818 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1832 = _1784;
    if (_1726)
    {
        _1806 = _1784;
    }
    float _1834 = _1806;
    float _1836 = _1830 * _1698;
    float _1838 = _1834;
    if (_1726)
    {
        _1822 = _1786;
    }
    float _1840 = _1822;
    float _1842 = _1840;
    if (_1726)
    {
        _1808 = _1834;
    }
    float _1844 = _1808;
    float _1846 = _1844;
    if (!_1726)
    {
        _1838 = _1784;
    }
    float _1848 = _1838;
    out.m_82.z = _1836;
    out.m_82.w = _1802;
    if (_1726)
    {
        _1758 = _1840;
    }
    float _1850 = _1758;
    float _1852 = _1850;
    if (!_1726)
    {
        _1842 = _1786;
    }
    float _1854 = _1842;
    float _1856 = _1720 * _1848;
    if (_1726)
    {
        _1832 = _1788;
    }
    float _1858 = _1832;
    float _1860 = _1718 * _1788;
    float _1862 = _1858;
    if (!_1726)
    {
        float _1864 = fma(_1113, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1788);
        _1862 = _1864;
    }
    float _1866 = _1862;
    float _1868 = -_1856;
    float _1870 = fma(_1716, _1788, _1868);
    float _1872 = _1716 * _1854;
    if (!_1726)
    {
        float _1874 = fma(_1119, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1848);
        _1846 = _1874;
    }
    float _1876 = _1846;
    float _1878 = _311 * _1866;
    float _1880 = _301 * _1866;
    float _1882 = -_1872;
    float _1884 = fma(_1718, _1848, _1882);
    float _1886 = -_1860;
    float _1888 = fma(_1720, _1854, _1886);
    float _1890 = _315 * _1866;
    if (!_1726)
    {
        float _1892 = fma(_1115, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1854);
        _1852 = _1892;
    }
    float _1894 = _1852;
    float _1896 = _1884 * _1722;
    float _1898 = fma(_279, _1876, _1878);
    float _1900 = fma(_283, _1876, _1890);
    float _1902 = _1888 * _1722;
    float _1904 = _1896 * _311;
    float _1906 = _1870 * _1722;
    float _1908 = _1896 * _301;
    float _1910 = _1896 * _315;
    float _1912 = -_1894;
    float _1914 = fma(_323, _1912, _1898);
    float _1916 = _1914;
    if (_1261)
    {
        float _1918 = _1828 + (-1.0);
        _1810 = _1918;
    }
    float _1920 = _1810;
    float _1922 = fma(_275, _1876, _1880);
    float _1924 = fma(_1902, _279, _1904);
    float _1926 = fma(_1902, _275, _1908);
    float _1928 = fma(_1902, _283, _1910);
    float _1930 = -_1894;
    float _1932 = fma(_327, _1930, _1900);
    float _1934 = _1914 * _1139;
    float _1936 = _1914 * _1157;
    float _1938 = in.m_64.w;
    if (_1261)
    {
        float _1940 = _1920 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1916 = _1940;
    }
    float _1942 = _1916;
    float _1944 = -_1906;
    float _1946 = fma(_1944, _323, _1924);
    float _1948 = -_1906;
    float _1950 = fma(_1948, _327, _1928);
    float _1952 = fma(_1932, _1157, _1934);
    float _1954 = -_1906;
    float _1956 = fma(_1954, _319, _1926);
    if (_1261)
    {
        float _1958 = fma(_1337, _1828, _1942);
        _1339 = _1958;
    }
    float _1960 = _1339;
    float _1962 = -_1936;
    float _1964 = fma(_1932, _1139, _1962);
    float _1966 = _1209 * _1952;
    float _1968 = _1223 * _1952;
    out.m_84.x = _1946;
    out.m_84.y = _1956;
    out.m_84.z = _1950;
    float _1970 = fma(_1385, 100.0, _1960);
    float _1972 = _1399 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1974 = abs(_1425);
    float _1976 = log2(_1974);
    float _1978 = fma(_1209, _1964, _1968);
    float _1980 = _1970 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1982 = fma(_1185, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1972);
    float _1984 = -_1966;
    float _1986 = fma(_1223, _1964, _1984);
    float _1988 = _1970 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1990 = -_1894;
    float _1992 = fma(_319, _1990, _1922);
    float _1994 = _1970 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1996 = _1970 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1998 = _1399 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2000 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1980);
    float _2002 = fma(_1191, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1982);
    float _2004 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1988);
    float _2006 = fma(_1185, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1998);
    out.m_86.w = _1938;
    float _2008 = _2002 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _2010 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2004);
    float _2012 = fma(_1191, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2006);
    float _2014 = _1976 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2016 = trunc(_2008);
    int _2018 = int(_2016);
    float _2020 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1994);
    float _2022 = _2012 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _2024 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2000);
    float _2026 = _2010 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2028 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1996);
    float _2030 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2020);
    float _2032 = _2024 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2034 = trunc(_2022);
    int _2036 = int(_2034);
    float _2038 = _2026 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2040 = _2026 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2042 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2028);
    float _2044 = _2030 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2046 = _2026 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2048 = _2026 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2050 = fma(_2032, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2038);
    float _2052 = exp2(_2014);
    float _2054 = fma(_2032, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2040);
    float _2056 = fma(_2032, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2046);
    float _2058 = fma(_2032, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2048);
    float _2060 = _2042 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2062 = fma(_2044, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2050);
    float _2064 = fma(_2044, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2054);
    int _2066 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2068 = _2018 + _2066;
    int _2070 = _2068 + 1;
    float _2072 = fma(_2044, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2056);
    int _2074 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2076 = _2036 + _2074;
    int _2078 = _2076 + 1;
    float _2080 = fma(_2044, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2058);
    float _2082 = fma(_2060, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2062);
    float _2084 = fma(_2060, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2064);
    bool _2086 = _2070 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _2088 = fma(_2060, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2080);
    int _2090 = _2070 | _2078;
    float _2092 = fma(_2052, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2094 = precise::clamp(_2092, 0.0, 1.0);
    float _2096 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2098 = _1970 + _2096;
    bool _2100 = _2090 < 0;
    bool _2102 = _2100 || _2086;
    float _2104 = fma(_2060, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2072);
    bool _2106 = _1425 <= 8000.0;
    bool _2108 = isnan(_1425);
    bool _2110 = _2106 || _2108;
    bool _2112 = isnan(8000.0);
    bool _2114 = _2110 || _2112;
    float _2116 = float(_2114);
    float _2118 = fma(_2094, -2.0, 3.0);
    float _2120 = _2094 * _2094;
    bool _2122 = _2078 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2124 = _2122 || _2102;
    float _2126 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2128 = _1367 + _2126;
    float _2130 = _2098 * _2098;
    float _2132 = _2120 * _2118;
    out.gl_Position.x = _2104;
    out.gl_Position.y = _2082;
    out.gl_Position.z = _2084;
    out.gl_Position.w = _2088;
    float _2134 = fma(_2128, _2128, _2130);
    float _2136 = -_2132;
    float _2138 = _2136 + 1.0;
    float _2140 = fma(_2138, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2132);
    float _2142 = _2116 * _2140;
    float _2144 = _2104;
    float _2146 = _2082;
    float _2148 = _2088;
    float _2150 = _2142;
    float _2152 = _2022;
    if (_2124)
    {
        _2144 = 1.0;
    }
    float _2154 = _2144;
    float _2156 = _2154;
    if (!_2124)
    {
        int _2158 = _2078 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2160 = _2158 + _2070;
        float _2162 = floor(_2022);
        int _2164 = _2160 << 2;
        uint _2166 = uint(int(uint(_2160) >> uint(2)));
        int _2168 = 12 & _2164;
        int _2170 = int(_2166) << 4;
        int _2172 = _2170 + _2168;
        float _2174 = floor(_2008);
        float _2176 = -_2162;
        float _2178 = _2022 + _2176;
        int _2180 = _2172 + 400;
        uint _2182 = uint(int(uint(_2180) >> uint(2)));
        uint _2184 = uint(int(uint(int(_2182)) >> uint(2)));
        int _2186 = int(_2182) & 3;
        float _2188 = (*spvDescriptorSet0.vp_c15)._m0[int(_2184)][_2186];
        float _2190 = -_2174;
        float _2192 = _2008 + _2190;
        float _2194 = rint(_2188);
        float _2196 = precise::max(_2194, 0.0);
        uint _2198 = uint(_2196);
        uint _2200 = clamp(_2198, 0u, 65535u);
        float3 _5964 = float3(_2192, _2178, float(int(_2200)));
        float3 _5966 = select(_5964, float3(0.0), isnan(_5964));
        float _2202 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5966.xy, uint(rint(_5966.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5966.xy, uint(rint(_5966.z)), level(0.0)).x;
        int _2204 = _2160 << 4;
        int _2206 = _2204 + 2048;
        uint _2208 = uint(int(uint(_2206) >> uint(2)));
        uint _2210 = uint(int(uint(int(_2208)) >> uint(2)));
        int _2212 = int(_2208) & 3;
        float _2214 = (*spvDescriptorSet0.vp_c15)._m0[int(_2210)][_2212];
        int _2216 = int(_2208) + 1;
        uint _2218 = uint(int(uint(_2216) >> uint(2)));
        int _2220 = _2216 & 3;
        float _2222 = (*spvDescriptorSet0.vp_c15)._m0[int(_2218)][_2220];
        int _2224 = _2206 + 8;
        uint _2226 = uint(int(uint(_2224) >> uint(2)));
        uint _2228 = uint(int(uint(int(_2226)) >> uint(2)));
        int _2230 = int(_2226) & 3;
        float _2232 = (*spvDescriptorSet0.vp_c15)._m0[int(_2228)][_2230];
        int _2234 = int(_2226) + 1;
        uint _2236 = uint(int(uint(_2234) >> uint(2)));
        int _2238 = _2234 & 3;
        float _2240 = (*spvDescriptorSet0.vp_c15)._m0[int(_2236)][_2238];
        float _2242 = _1399 * _2222;
        float _2244 = fma(_1185, _2214, _2242);
        float _2246 = fma(_1191, _2232, _2244);
        float _2248 = _2246 + _2240;
        float _2250 = precise::clamp(_2248, 0.0, 1.0);
        float _2252 = -_2250;
        float _2254 = _2252 + _2202;
        float _2256 = fma(_2254, 500.0, 1.5);
        float _2258 = exp2(_2256);
        float _2260 = 0.0 + _2258;
        float _2262 = precise::clamp(_2260, 0.0, 1.0);
        _2146 = _2188;
        _2156 = _2262;
        _2148 = _2202;
    }
    float _2264 = _2146;
    float _2266 = _2156;
    float _2268 = _2148;
    float _2270 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2272 = _1371 + _2270;
    float _2274 = _2142 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2276 = -_1678;
    float _2278 = _2276 + 1.0;
    float _2280 = _2264;
    float _2282 = _2268;
    if (!_1638)
    {
        _2280 = 1.0;
    }
    float _2284 = _2280;
    float _2286 = fma(_2272, _2272, _2134);
    float _2288 = _2284;
    if (_1638)
    {
        bool _2290 = _1684 >= _1676;
        bool _2292 = isnan(_1684);
        bool _2294 = _2290 || _2292;
        bool _2296 = isnan(_1676);
        bool _2298 = _2294 || _2296;
        float _2300 = float(_2298);
        _2288 = _2300;
    }
    float _2302 = _2288;
    float _2304 = _2278 * _2274;
    float _2306 = precise::clamp(_2304, 0.0, 1.0);
    out.m_88.x = _1978;
    out.m_88.y = _1992;
    out.m_88.z = _1986;
    float _2308 = _2302 * _2266;
    float _2310 = sqrt(_2286);
    float _2312 = -_2306;
    float _2314 = fma(_2312, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_90.x = _1367;
    out.m_90.y = _1970;
    out.m_90.z = _1371;
    float _2316 = -_2308;
    float _2318 = fma(_2316, _2314, 1.0);
    float _2320 = precise::clamp(_2318, 0.0, 1.0);
    float _2322 = _2320 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_92.x = _2322;
    bool _2324 = _2310 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2326 = isnan(_2310);
    bool _2328 = _2324 || _2326;
    bool _2330 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2332 = _2328 || _2330;
    float _2334 = _2306;
    float _2336 = _2314;
    float _2338 = _2320;
    if (!_2332)
    {
        _2150 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2340 = _2150;
    float _2342 = _2340;
    float _2344 = _2340;
    if (!_2332)
    {
        _2152 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2346 = _2152;
    float _2348 = _2346;
    float _2350 = _2346;
    if (!_2332)
    {
        _2282 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2352 = _2282;
    float _2354 = _2352;
    float _2356 = _2352;
    if (!_2332)
    {
        _2334 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2358 = _2334;
    float _2360 = _2358;
    float _2362 = _2358;
    if (!_2332)
    {
        _2336 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2364 = _2336;
    float _2366 = _2364;
    float _2368 = _2364;
    if (!_2332)
    {
        _2338 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2370 = _2338;
    bool _2372 = !_2332;
    float _2374 = _2370;
    float _2376 = _2370;
    if (!_2372)
    {
        bool _2378 = _2310 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2380 = isnan(_2310);
        bool _2382 = _2378 || _2380;
        bool _2384 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2386 = _2382 || _2384;
        if (!_2386)
        {
            float _2388 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2390 = _2310 + _2388;
            float _2392 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2394 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2392;
            float _2396 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2398 = _2396 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2400 = 1.0 / _2394;
            float _2402 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2404 = _2402 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2406 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2408 = _2406 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2410 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2412 = _2410 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2414 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2416 = _2414 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2418 = _2390 * _2400;
            float _2420 = precise::clamp(_2418, 0.0, 1.0);
            float _2422 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2424 = _2422 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2426 = fma(_2420, _2398, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2428 = fma(_2420, _2424, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2430 = fma(_2420, _2404, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2432 = fma(_2420, _2408, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2434 = fma(_2420, _2412, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2436 = fma(_2420, _2416, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2350 = _2426;
            _2368 = _2434;
            _2344 = _2430;
            _2362 = _2432;
            _2356 = _2428;
            _2376 = _2436;
            _2438 = true;
        }
        else
        {
            bool _2440 = _2310 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2442 = isnan(_2310);
            bool _2444 = _2440 || _2442;
            bool _2446 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2448 = _2444 || _2446;
            if (!_2448)
            {
                _2342 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2450 = _2342;
            _2344 = _2450;
            if (!_2448)
            {
                _2348 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2452 = _2348;
            _2350 = _2452;
            if (!_2448)
            {
                _2354 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2454 = _2354;
            _2356 = _2454;
            if (!_2448)
            {
                _2360 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2456 = _2360;
            _2362 = _2456;
            if (!_2448)
            {
                _2366 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2458 = _2366;
            _2368 = _2458;
            if (!_2448)
            {
                _2374 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2460 = _2374;
            bool _2462 = !_2448;
            _2376 = _2460;
            if (!_2462)
            {
                bool _2464 = _2310 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2466 = isnan(_2310);
                bool _2468 = _2464 || _2466;
                bool _2470 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2472 = _2468 || _2470;
                if (!_2472)
                {
                    float _2474 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2476 = _2310 + _2474;
                    float _2478 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2480 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2478;
                    float _2482 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2484 = _2482 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2486 = 1.0 / _2480;
                    float _2488 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2490 = _2488 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2492 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2494 = _2492 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2496 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2498 = _2496 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2500 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2502 = _2500 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2504 = _2476 * _2486;
                    float _2506 = precise::clamp(_2504, 0.0, 1.0);
                    float _2508 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2510 = _2508 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2512 = fma(_2506, _2484, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2514 = fma(_2506, _2510, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2516 = fma(_2506, _2490, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2518 = fma(_2506, _2494, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2520 = fma(_2506, _2498, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2522 = fma(_2506, _2502, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2350 = _2512;
                    _2368 = _2520;
                    _2344 = _2516;
                    _2362 = _2518;
                    _2356 = _2514;
                    _2376 = _2522;
                    _2438 = true;
                }
                else
                {
                    _2350 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2368 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2344 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2362 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2356 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2376 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2438 = false;
    float _2524 = _2350;
    float _2526 = _2368;
    float _2528 = _2344;
    float _2530 = _2362;
    float _2532 = _2356;
    float _2534 = _2376;
    float _2536 = fma(_1992, -0.5, 0.5);
    float _2538 = precise::clamp(_2536, 0.0, 1.0);
    float _2540 = -_2524;
    float _2542 = _2540 + _2526;
    float _2544 = -_2528;
    float _2546 = _2544 + _2530;
    float _2548 = -_2532;
    float _2550 = _2548 + _2534;
    bool _2552 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2554 = fma(_2538, _2542, _2524);
    float _2556 = fma(_2538, _2546, _2528);
    float _2558 = fma(_2538, _2550, _2532);
    float _2560 = _2554 * 0.586610972881317138671875;
    out.m_52.x = 1.0;
    float _2562 = fma(_2556, 0.298911988735198974609375, _2560);
    float _2564 = fma(_2558, 0.114477999508380889892578125, _2562);
    out.m_94.x = 0.0;
    float _2566 = -_2564;
    float _2568 = _2556 + _2566;
    float _2570 = -_2564;
    float _2572 = _2554 + _2570;
    float _2574 = -_2564;
    float _2576 = _2558 + _2574;
    float _2578 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2580 = fma(_2568, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2564);
    float _2582 = fma(_2572, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2564);
    float _2584 = fma(_2576, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2564);
    out.m_92.w = _2578;
    out.m_96.x = _2580;
    out.m_96.y = _2582;
    out.m_96.z = _2584;
    if (!_2552)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2586 = -_1970;
    float _2588 = _2586 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2590 = -_1367;
    float _2592 = _2590 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2594 = -_1371;
    float _2596 = _2594 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2598 = _2588 * _2588;
    float _2600 = fma(_2592, _2592, _2598);
    float _2602 = fma(_2596, _2596, _2600);
    float _2604 = sqrt(_2602);
    float _2606 = rsqrt(_2602);
    float _2608 = -_2604;
    float _2610 = _2608 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2612 = _2610 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2614 = precise::clamp(_2612, 0.0, 1.0);
    float _2616 = _2592 * _2606;
    float _2618 = _2588 * _2606;
    float _2620 = abs(_2614);
    float _2622 = log2(_2620);
    float _2624 = _2596 * _2606;
    float _2626 = _2616 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2628 = _1992 * _2618;
    float _2630 = -_2618;
    float _2632 = -_2626;
    float _2634 = fma(_2630, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2632);
    float _2636 = fma(_1978, _2616, _2628);
    float _2638 = -_2624;
    float _2640 = fma(_2638, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2634);
    float _2642 = fma(_1986, _2624, _2636);
    float _2644 = precise::clamp(_2642, 0.0, 1.0);
    float _2646 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2648 = _2640 + _2646;
    float _2650 = _2622 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2652 = _2648 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2654 = precise::clamp(_2652, 0.0, 1.0);
    float _2656 = exp2(_2650);
    float _2658 = _2656 * _2654;
    float _2660 = _2644 * _2658;
    float _2662 = _2660 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2664 = _2660 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2666 = _2660 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_94.x = _2662;
    out.m_94.y = _2664;
    out.m_94.z = _2666;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2438 = false;
    bool _349 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _110 = in.m_49.w;
    float _112 = trunc(_110);
    int _115 = int(_112);
    bool _119 = _115 >= 1;
    float _121 = 0.0;
    float _123 = as_type<float>(_115);
    if (!_119)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _125 = _121;
    if (!_119)
    {
        out.m_52.x = 0.0;
    }
    int _127 = 0;
    if (!_119)
    {
        float _129 = _125 * 5.0;
        _127 = as_type<int>(_129);
    }
    int _131 = _127;
    int _133 = _131;
    if (!_119)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2724 = as_type<float>(_131);
        out.gl_Position.z = _2724;
    }
    if (!_119)
    {
        return out;
    }
    float _135 = in.m_54.w;
    float _137 = float(_115);
    float _139 = -_135;
    float _141 = _139 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _143 = _135 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _145 = isnan(_135);
    bool _147 = _143 || _145;
    bool _149 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _151 = _147 || _149;
    bool _153 = _141 >= _137;
    bool _155 = !_151;
    bool _157 = _153 || _155;
    if (_157)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _159 = _123;
    if (_157)
    {
        out.m_52.x = 0.0;
    }
    if (_157)
    {
        float _161 = _159 * 5.0;
        _133 = as_type<int>(_161);
    }
    int _163 = _133;
    if (_157)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2787 = as_type<float>(_163);
        out.gl_Position.z = _2787;
    }
    if (_157)
    {
        return out;
    }
    float _165 = in.m_56.x;
    float _167 = in.m_56.y;
    float _169 = in.m_56.z;
    float _171 = 1.0 / _137;
    float _173 = in.m_58.x;
    float _175 = in.m_58.y;
    float _177 = in.m_58.z;
    float _179 = in.m_60.x;
    float _181 = in.m_60.y;
    float _183 = in.m_60.z;
    float _185 = _141 * _171;
    float _187 = _165 * _165;
    float _189 = _167 * _167;
    float _191 = fma(_173, _173, _187);
    float _193 = fma(_175, _175, _189);
    float _195 = fma(_179, _179, _191);
    float _197 = _169 * _169;
    float _199 = fma(_181, _181, _193);
    float _201 = sqrt(_195);
    float _203 = fma(_177, _177, _197);
    float _205 = fma(_183, _183, _203);
    float _207 = sqrt(_199);
    float _209 = sqrt(_205);
    bool _211 = _201 > 0.0;
    bool _213 = _207 > 0.0;
    float _215 = 0.0;
    float _217 = _207;
    if (_211)
    {
        float _219 = rsqrt(_195);
        _215 = _219;
    }
    float _221 = _215;
    float _223 = 0.0;
    if (!_211)
    {
        _223 = 0.0;
    }
    float _225 = _223;
    bool _227 = _209 > 0.0;
    float _229 = _209;
    float _231 = _225;
    bool _233 = _227;
    if (!_211)
    {
        _217 = 0.0;
    }
    float _235 = _217;
    float _237 = 0.0;
    float _239 = _235;
    if (!_211)
    {
        _237 = 0.0;
    }
    float _241 = _237;
    float _243 = _201;
    float _245 = _241;
    if (_213)
    {
        float _247 = rsqrt(_199);
        _243 = _247;
    }
    float _249 = _243;
    if (!_213)
    {
        _229 = 0.0;
    }
    float _251 = _229;
    float _253 = 0.0;
    float _255 = _251;
    if (!_213)
    {
        _253 = 0.0;
    }
    float _257 = _253;
    float _259 = 0.0;
    float _261 = _257;
    if (!_213)
    {
        _259 = 0.0;
    }
    float _263 = _259;
    float _265 = 0.0;
    float _267 = _263;
    if (_227)
    {
        float _269 = rsqrt(_205);
        _265 = _269;
    }
    float _271 = _265;
    if (_211)
    {
        float _273 = _221 * _165;
        _231 = _273;
    }
    float _275 = _231;
    if (_211)
    {
        float _277 = _221 * _173;
        _239 = _277;
    }
    float _279 = _239;
    if (_211)
    {
        float _281 = _221 * _179;
        _245 = _281;
    }
    float _283 = _245;
    bool _285 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _287 = 0.0;
    if (!_227)
    {
        _287 = 0.0;
    }
    float _289 = _287;
    float _291 = 0.0;
    float _293 = _289;
    if (!_227)
    {
        _291 = 0.0;
    }
    float _295 = _291;
    float _297 = _295;
    if (_213)
    {
        float _299 = _249 * _167;
        _255 = _299;
    }
    float _301 = _255;
    float _303 = 0.0;
    if (!_227)
    {
        _303 = 0.0;
    }
    float _305 = _303;
    float _307 = _305;
    if (_213)
    {
        float _309 = _249 * _175;
        _261 = _309;
    }
    float _311 = _261;
    if (_213)
    {
        float _313 = _249 * _181;
        _267 = _313;
    }
    float _315 = _267;
    if (_227)
    {
        float _317 = _271 * _169;
        _293 = _317;
    }
    float _319 = _293;
    if (_227)
    {
        float _321 = _271 * _177;
        _297 = _321;
    }
    float _323 = _297;
    if (_227)
    {
        float _325 = _271 * _183;
        _307 = _325;
    }
    float _327 = _307;
    bool _329 = !_285;
    float _347;
    if (!_329)
    {
        float _331 = in.m_62.x;
        float _333 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _335 = _331 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _337 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[12].x, _141);
        float _339 = _337 * _333;
        float _341 = floor(_339);
        float _343 = -_341;
        float _345 = _339 + _343;
        _347 = _345;
        _349 = true;
    }
    else
    {
        _347 = _185;
    }
    _349 = false;
    float _351 = _347;
    float _353 = in.m_64.x;
    float _355 = in.m_64.y;
    float _357 = _141 * (*spvDescriptorSet0.vp_c9)._m0[193].y;
    float _359 = in.m_62.x;
    float _361 = in.m_49.x;
    float _363 = in.m_49.y;
    float _365 = in.m_49.z;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _369 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _367;
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _373 = _371 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _375 = in.m_62.y;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _377;
    float _381 = 1.0 / _369;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _385 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _383;
    float _387 = abs(_353);
    float _389 = log2(_387);
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _393 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _391;
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _397 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _395;
    float _399 = fma(_359, 6.283185482025146484375, _357);
    float _401 = fma((*spvDescriptorSet0.vp_c9)._m0[194].y, 0.01745329238474369049072265625, _399);
    float _403 = _175 * _363;
    float _405 = _181 * _363;
    float _407 = 1.0 / _379;
    float _409 = _375 * 628.31854248046875;
    float _411 = fma(_173, _361, _403);
    float _413 = _401 * 0.15915493667125701904296875;
    float _415 = _389 * (*spvDescriptorSet0.vp_c9)._m0[193].z;
    float _417 = _401 * 0.60000002384185791015625;
    float _419 = 1.0 / _373;
    float _421 = _417 * 0.15915493667125701904296875;
    float _423 = _401 * 1.2999999523162841796875;
    float _425 = _423 * 0.15915493667125701904296875;
    float _427 = fma(_179, _361, _405);
    float _429 = -(*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _431 = _429 + (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _433 = exp2(_415);
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _437 = _351 + _435;
    float _439 = _401 + 0.52359879016876220703125;
    float _441 = fma(_431, _359, (*spvDescriptorSet0.vp_c9)._m0[191].x);
    float _443 = _437 * _381;
    float _445 = _439 * 0.15915493667125701904296875;
    float _447 = fma(_141, _441, _409);
    float _449 = fma(_401, 0.60000002384185791015625, 0.31415927410125732421875);
    float _451 = _413 * 6.283185482025146484375;
    float _453 = sin(_451);
    float _455 = fma(_401, 1.2999999523162841796875, 0.680678427219390869140625);
    float _457 = (*spvDescriptorSet0.vp_c9)._m0[193].w * 3.1415927410125732421875;
    float _459 = _449 * 0.15915493667125701904296875;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _463 = _351 + _461;
    float _465 = fma(_457, _433, _357);
    float _467 = _421 * 6.283185482025146484375;
    float _469 = sin(_467);
    float _471 = in.m_66.x;
    float _473 = in.m_66.y;
    float _475 = in.m_66.z;
    float _477 = fma(_359, 6.283185482025146484375, _465);
    float _479 = _463 * _407;
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _483 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _481;
    float _485 = fma(_353, 0.261799395084381103515625, -0.261799395084381103515625);
    float _487 = _445 * 6.283185482025146484375;
    float _489 = sin(_487);
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _493 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _491;
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _497 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _495;
    float _499 = _447 + _485;
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _503 = _351 + _501;
    float _505 = _455 * 0.15915493667125701904296875;
    float _507 = fma(_483, _443, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _509 = fma(_493, _443, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _511 = _459 * 6.283185482025146484375;
    float _513 = sin(_511);
    float _515 = fma(_385, _443, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _517 = fma(_393, _479, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _519 = fma(_497, _479, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _521 = fma(_397, _479, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _523 = _499 * 1.10000002384185791015625;
    float _525 = fma(_469, 0.60000002384185791015625, _453);
    float _527 = _503 * _419;
    float _529 = _425 * 6.283185482025146484375;
    float _531 = sin(_529);
    bool _533 = _471 > 0.0;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _537 = _535 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _539 = _471 >= 0.0;
    bool _541 = isnan(_471);
    bool _543 = _539 || _541;
    bool _545 = isnan(0.0);
    bool _547 = _543 || _545;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _551 = _549 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _553 = _351 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _555 = isnan(_351);
    bool _557 = _553 || _555;
    bool _559 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _561 = _557 || _559;
    float _563 = float(_561);
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _567 = _565 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    int _569 = _547 ? 0 : 1;
    float _571 = _505 * 6.283185482025146484375;
    float _573 = sin(_571);
    float _575 = _523 * 0.15915493667125701904296875;
    float _577 = fma(_513, 0.60000002384185791015625, _489);
    int _579 = ~_569;
    int _581 = _579 + 1;
    int _583 = _581 + 1;
    float _585 = fma(_537, _527, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _587 = fma(_551, _527, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    int _589 = _583;
    if (!_533)
    {
        int _591 = ~_569;
        int _593 = _591 + 1;
        _589 = _593;
    }
    int _595 = _589;
    float _597 = _499 * 0.699999988079071044921875;
    bool _599 = _351 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _601 = isnan(_351);
    bool _603 = _599 || _601;
    bool _605 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _607 = _603 || _605;
    float _609 = float(_607);
    float _611 = _477 * 0.60000002384185791015625;
    float _613 = fma(_567, _527, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _615 = _597 * 0.15915493667125701904296875;
    float _617 = -_563;
    float _619 = _617 + 1.0;
    float _621 = _499 * 0.15915493667125701904296875;
    float _623 = _499 * 0.89999997615814208984375;
    float _625 = fma(_531, 0.300000011920928955078125, _525);
    float _627 = _575 * 6.283185482025146484375;
    float _629 = cos(_627);
    float _631 = _477 * 0.15915493667125701904296875;
    bool _633 = _351 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _635 = isnan(_351);
    bool _637 = _633 || _635;
    bool _639 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _641 = _637 || _639;
    float _643 = float(_641);
    float _645 = _609 * _619;
    bool _647 = _351 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _649 = isnan(_351);
    bool _651 = _647 || _649;
    bool _653 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _655 = _651 || _653;
    float _657 = float(_655);
    float _659 = -_353;
    float _661 = _659 + 1.0;
    float _663 = _623 * 0.15915493667125701904296875;
    float _665 = float(_595);
    float _667 = _631 * 6.283185482025146484375;
    float _669 = sin(_667);
    float _671 = _611 * 0.15915493667125701904296875;
    float _673 = -_609;
    float _675 = _673 + 1.0;
    float _677 = _477 * 1.2999999523162841796875;
    float _679 = _447 * 0.89999997615814208984375;
    float _681 = _447 * 0.15915493667125701904296875;
    float _683 = _643 * _675;
    float _685 = -_643;
    float _687 = _685 + 1.0;
    float _689 = _671 * 6.283185482025146484375;
    float _691 = sin(_689);
    float _693 = _677 * 0.15915493667125701904296875;
    float _695 = fma(_573, 0.300000011920928955078125, _577);
    float _697 = _625 * _661;
    float _699 = -_355;
    float _701 = _699 + 1.0;
    float _703 = _657 * _687;
    float _705 = -_657;
    float _707 = _705 + 1.0;
    float _709 = _697 * 0.52359879016876220703125;
    float _711 = _693 * 6.283185482025146484375;
    float _713 = sin(_711);
    float _715 = in.m_68.y;
    float _717 = _509 * _703;
    float _719 = _507 * _703;
    float _721 = _515 * _703;
    float _723 = abs(_695);
    float _725 = _701 * _723;
    float _727 = fma(_707, (*spvDescriptorSet0.vp_c9)._m0[143].y, _717);
    float _729 = fma(_707, (*spvDescriptorSet0.vp_c9)._m0[143].x, _719);
    float _731 = _663 * 6.283185482025146484375;
    float _733 = sin(_731);
    float _735 = fma(_707, (*spvDescriptorSet0.vp_c9)._m0[143].z, _721);
    float _737 = fma(_587, _683, _727);
    float _739 = fma(_691, 0.60000002384185791015625, _669);
    float _741 = _709 * 0.15915493667125701904296875;
    float _743 = fma(_585, _683, _729);
    float _745 = fma(_613, _683, _735);
    float _747 = _725 * (-20.0);
    float _749 = _621 * 6.283185482025146484375;
    float _751 = sin(_749);
    float _753 = fma(_519, _645, _737);
    float _755 = fma(_713, 0.300000011920928955078125, _739);
    float _757 = _725 * (-45.0);
    float _759 = in.m_70.x;
    float _761 = in.m_70.y;
    float _763 = in.m_70.z;
    float _765 = _665 * _747;
    float _767 = _757 * 0.01745329238474369049072265625;
    float _769 = _615 * 6.283185482025146484375;
    float _771 = cos(_769);
    float _773 = _733 * 0.89999997615814208984375;
    float _775 = _765 * 0.01745329238474369049072265625;
    float _777 = fma(_715, 0.5, 0.5);
    float _779 = _767 * 0.15915493667125701904296875;
    float _781 = fma(_517, _645, _743);
    float _783 = fma(_521, _645, _745);
    float _785 = _777 * _755;
    float _787 = _741 * 6.283185482025146484375;
    float _789 = sin(_787);
    float _791 = -_773;
    float _793 = fma(_751, -1.2000000476837158203125, _791);
    float _795 = _775 * 0.15915493667125701904296875;
    float _797 = fma(_563, (*spvDescriptorSet0.vp_c9)._m0[146].x, _781);
    float _799 = fma(_563, (*spvDescriptorSet0.vp_c9)._m0[146].y, _753);
    float _801 = _679 * 0.15915493667125701904296875;
    float _803 = abs(_793);
    bool _805 = _803 > 0.001000000047497451305389404296875;
    bool _807 = isnan(_803);
    bool _809 = _805 || _807;
    bool _811 = isnan(0.001000000047497451305389404296875);
    bool _813 = _809 || _811;
    float _815 = fma(_563, (*spvDescriptorSet0.vp_c9)._m0[146].z, _783);
    float _817 = _741 * 6.283185482025146484375;
    float _819 = cos(_817);
    float _821 = _771 * 0.699999988079071044921875;
    float _823 = _473 + (-0.0199999995529651641845703125);
    float _825 = _797 * _759;
    float _827 = fma(_629, 1.10000002384185791015625, _821);
    float _829 = _799 * _761;
    float _831 = _779 * 6.283185482025146484375;
    float _833 = sin(_831);
    float _835 = _789 * _471;
    float _837 = abs(_827);
    bool _839 = _837 != 0.0;
    bool _841 = isnan(_837);
    bool _843 = _839 || _841;
    bool _845 = isnan(0.0);
    bool _847 = _843 || _845;
    float _849 = _779 * 6.283185482025146484375;
    float _851 = cos(_849);
    float _853 = -_835;
    float _855 = fma(_819, _475, _853);
    float _857 = _819 * _471;
    float _859 = _815 * _763;
    float _861 = _855 + 0.02999999932944774627685546875;
    float _863 = fma(_789, _475, _857);
    float _865 = _447 * 0.699999988079071044921875;
    float _867 = _795 * 6.283185482025146484375;
    float _869 = sin(_867);
    float _871 = _785 * (*spvDescriptorSet0.vp_c9)._m0[193].x;
    float _873 = _813 ? _793 : 0.001000000047497451305389404296875;
    float _875 = _833 * _861;
    float _877 = fma(_665, -0.100000001490116119384765625, _863);
    float _879 = _871 * 0.01745329238474369049072265625;
    float _881 = abs(_873);
    bool _883 = _881 == 0.0;
    bool _885 = !_847;
    bool _887 = _883 && _885;
    float _889 = _795 * 6.283185482025146484375;
    float _891 = cos(_889);
    float _893 = _879 * 0.15915493667125701904296875;
    float _895 = abs(_873);
    bool _897 = _895 == 0.0;
    float _899 = -_875;
    float _901 = fma(_851, _823, _899);
    float _903 = _851 * _861;
    float _905 = _681 * 6.283185482025146484375;
    float _907 = cos(_905);
    float _909 = _901 * _869;
    int _911 = as_type<int>(_861);
    float _913 = _909;
    float _915 = _753;
    if (_887)
    {
        bool _917 = as_type<int>(_873) >= 0;
        _233 = _917;
    }
    bool _919 = _233;
    int _921 = _919 ? (-1) : 0;
    if (_887)
    {
        int _923 = _919 ? 0 : 1078530011;
        _911 = _923;
    }
    int _925 = _911;
    float _927 = _801 * 6.283185482025146484375;
    float _929 = cos(_927);
    float _931 = _901 * _891;
    float _933 = -_909;
    float _935 = fma(_891, _877, _933);
    int _937 = as_type<int>(_891);
    if (_887)
    {
        int _939 = int(0x80000000) & as_type<int>(_827);
        int _941 = _925 | _939;
        _913 = as_type<float>(_941);
    }
    float _943 = _913;
    float _945 = fma(_869, _877, _931);
    float _947 = _893 * 6.283185482025146484375;
    float _949 = sin(_947);
    float _951 = _893 * 6.283185482025146484375;
    float _953 = cos(_951);
    bool _955 = !_847;
    bool _957 = _955 && _897;
    float _959 = _943;
    float _961 = _943;
    if (!_957)
    {
        float _963 = abs(_827);
        bool _965 = _963 != as_type<float>(0x7f800000u /* inf */);
        bool _967 = isnan(_963);
        bool _969 = _965 || _967;
        bool _971 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _973 = _969 || _971;
        float _975 = abs(_873);
        bool _977 = _975 == as_type<float>(0x7f800000u /* inf */);
        float _979 = abs(_873);
        bool _981 = _979 == as_type<float>(0x7f800000u /* inf */);
        bool _983 = !_973;
        bool _985 = _981 && _983;
        if (_985)
        {
            bool _987 = as_type<int>(_873) >= 0;
            _921 = _987 ? (-1) : 0;
        }
        int _989 = _921;
        if (_985)
        {
            _937 = 1075235812;
        }
        int _991 = _937;
        int _993 = _991;
        if (_985)
        {
            int _995 = ~_989;
            int _997 = (_995 != 0) ? _991 : 1061752795;
            _993 = _997;
        }
        int _999 = _993;
        if (_985)
        {
            int _1001 = int(0x80000000) & as_type<int>(_827);
            int _1003 = _999 | _1001;
            _959 = as_type<float>(_1003);
        }
        float _1005 = _959;
        bool _1007 = !_973;
        bool _1009 = _1007 && _977;
        _961 = _1005;
        if (!_1009)
        {
            float _1011 = abs(_827);
            float _1013 = abs(_873);
            float _1015 = precise::max(_1011, _1013);
            float _1017 = abs(_827);
            float _1019 = abs(_873);
            float _1021 = precise::min(_1017, _1019);
            float _1023 = 1.0 / _1015;
            float _1025 = abs(_827);
            float _1027 = abs(_873);
            bool _1029 = _1025 > _1027;
            bool _1031 = as_type<int>(_873) >= 0;
            float _1033 = abs(_827);
            float _1035 = abs(_873);
            float _1037 = _1033 + _1035;
            int _1039 = as_type<int>(_827) & int(0x80000000);
            bool _1041 = _1037 > as_type<float>(0x7f800000u /* inf */);
            bool _1043 = isnan(_1037);
            bool _1045 = _1041 || _1043;
            bool _1047 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1049 = _1045 || _1047;
            float _1051 = _1021 * _1023;
            float _1053 = _1051 * _1051;
            float _1055 = _1053 + 11.33538818359375;
            float _1057 = fma(_1053, _1055, 28.84246826171875);
            float _1059 = fma(_1053, _1057, 19.6966705322265625);
            float _1061 = fma(_1053, -0.82336294651031494140625, -5.674867153167724609375);
            float _1063 = fma(_1053, _1061, -6.565555095672607421875);
            float _1065 = 1.0 / _1059;
            float _1067 = _1053 * _1063;
            float _1069 = _1051 * _1067;
            float _1071 = fma(_1069, _1065, _1051);
            float _1073 = _1071;
            _961 = _1037;
            if (_1029)
            {
                float _1075 = -_1071;
                float _1077 = _1075 + 1.57079637050628662109375;
                _1073 = _1077;
            }
            float _1079 = _1073;
            int _1081 = as_type<int>(_1079);
            if (!_1031)
            {
                float _1083 = -_1079;
                float _1085 = _1083 + 3.1415927410125732421875;
                _1081 = as_type<int>(_1085);
            }
            int _1087 = _1081;
            if (!_1049)
            {
                int _1089 = _1039 | _1087;
                _961 = as_type<float>(_1089);
            }
        }
    }
    float _1091 = _961;
    float _1093 = _945 + 0.0199999995529651641845703125;
    float _1095 = fma(_665, 0.100000001490116119384765625, _935);
    float _1097 = _1091 + 1.57079637050628662109375;
    float _1099 = in.m_62.z;
    float _1101 = _1093 * _949;
    float _1103 = fma(_833, _823, _903);
    float _1105 = _1093 * _953;
    float _1107 = _1097 * (-0.15915493667125701904296875);
    float _1109 = -_1101;
    float _1111 = fma(_1095, _953, _1109);
    float _1113 = _1103 + (-0.02999999932944774627685546875);
    float _1115 = fma(_1095, _949, _1105);
    float _1117 = _447 * 1.10000002384185791015625;
    float _1119 = fma(_625, (*spvDescriptorSet0.vp_c9)._m0[194].x, _1111);
    float _1121 = in.m_58.w;
    float _1123 = _859 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1125 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1113);
    float _1127 = _829 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1129 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1115);
    float _1131 = _825 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1133 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1119);
    float _1135 = in.m_60.w;
    float _1137 = _1107 * 6.283185482025146484375;
    float _1139 = cos(_1137);
    float _1141 = _1123 * _1125;
    float _1143 = _1127 * _1129;
    float _1145 = _1131 * _1133;
    float _1147 = _865 * 0.15915493667125701904296875;
    float _1149 = _1141 * _311;
    float _1151 = _1117 * 0.15915493667125701904296875;
    float _1153 = _1141 * _315;
    float _1155 = _1107 * 6.283185482025146484375;
    float _1157 = sin(_1155);
    float _1159 = fma(_1145, _279, _1149);
    float _1161 = _1099 * 6.283185482025146484375;
    float _1163 = fma(_1145, _283, _1153);
    float _1165 = fma(_177, _365, _411);
    float _1167 = -_1143;
    float _1169 = fma(_1167, _323, _1159);
    float _1171 = _1161 * 0.15915493667125701904296875;
    float _1173 = -_1143;
    float _1175 = fma(_1173, _327, _1163);
    float _1177 = _1147 * 6.283185482025146484375;
    float _1179 = sin(_1177);
    float _1181 = _1169 * _1139;
    float _1183 = fma(_183, _365, _427);
    float _1185 = _1165 + _1121;
    float _1187 = fma(_907, 1.2000000476837158203125, _929);
    float _1189 = _185 * 3.3333332538604736328125;
    float _1191 = _1183 + _1135;
    float _1193 = _1151 * 6.283185482025146484375;
    float _1195 = sin(_1193);
    float _1197 = _1169 * _1157;
    float _1199 = fma(_1175, _1157, _1181);
    float _1201 = -_1197;
    float _1203 = fma(_1175, _1139, _1201);
    float _1205 = _1185 + _1199;
    float _1207 = _1171 * 6.283185482025146484375;
    float _1209 = sin(_1207);
    float _1211 = _1191 + _1203;
    float _1213 = fma(_1187, (*spvDescriptorSet0.vp_c9)._m0[191].z, _1205);
    float _1215 = in.m_72.y;
    float _1217 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1219 = _1213 + _1217;
    float _1221 = _1171 * 6.283185482025146484375;
    float _1223 = cos(_1221);
    float _1225 = _1179 + _1195;
    float _1227 = fma(_1225, (*spvDescriptorSet0.vp_c9)._m0[191].z, _1211);
    float _1229 = _1209 * _1219;
    float _1231 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1233 = _1227 + _1231;
    float _1235 = _1223 * _1219;
    float _1237 = -_1229;
    float _1239 = fma(_1223, _1233, _1237);
    float _1241 = fma(_1209, _1233, _1235);
    float _1243 = _1239 + (*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1245 = _1241 + (*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1247 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1249 = _1243 + _1247;
    float _1251 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1253 = _1245 + _1251;
    float _1255 = _1249 * _1249;
    float _1257 = fma(_1253, _1253, _1255);
    float _1259 = sqrt(_1257);
    bool _1261 = _1259 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1263 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1265 = _1259 + _1263;
    float _1267 = 0.0 + _1189;
    float _1269 = precise::clamp(_1267, 0.0, 1.0);
    float _1271 = -_1189;
    float _1273 = _1271 + 3.3333332538604736328125;
    float _1275 = precise::clamp(_1273, 0.0, 1.0);
    float _1277 = precise::min(_1269, _1275);
    float _1279 = _517;
    if (_1261)
    {
        float _1281 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1279 = _1281;
    }
    float _1283 = _1279;
    float _1285 = _1283;
    if (_1261)
    {
        float _1287 = _1265 * _1283;
        _1285 = _1287;
    }
    float _1289 = _1285;
    float _1291 = _1141 * _301;
    float _1293 = _363 + _1215;
    float _1295 = -(*spvDescriptorSet0.vp_c9)._m0[192].w;
    float _1297 = _1295 + 1.0;
    float _1299 = _1289;
    float _1301 = _1297;
    float _1303 = _1215;
    if (_1261)
    {
        float _1305 = _1289 * 0.15915493667125701904296875;
        _1299 = _1305;
    }
    float _1307 = _1299;
    float _1309 = fma(_1145, _275, _1291);
    float _1311 = _1227;
    if (_1261)
    {
        float _1313 = _1307 * 6.283185482025146484375;
        float _1315 = sin(_1313);
        _1311 = _1315;
    }
    float _1317 = _1311;
    float _1319 = -_1143;
    float _1321 = fma(_1319, _319, _1309);
    float _1323 = fma(_1277, -5.0, 5.0);
    float _1325 = _1293 + _1321;
    float _1327 = 5.0;
    float _1329 = _1323;
    if (_1261)
    {
        float _1331 = rsqrt(_1257);
        _1327 = _1331;
    }
    float _1333 = _1327;
    float _1335 = -_1323;
    float _1337 = fma(_1335, _1297, _1325);
    float _1339 = _1337;
    if (!_1261)
    {
        _1329 = _1245;
    }
    float _1341 = _1329;
    float _1343 = _1341;
    if (_1261)
    {
        float _1345 = _1337 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1301 = _1345;
    }
    float _1347 = _1301;
    float _1349 = _1317;
    if (_1261)
    {
        float _1351 = fma(_1317, _1347, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1303 = _1351;
    }
    float _1353 = _1303;
    if (!_1261)
    {
        _1349 = _1243;
    }
    float _1355 = _1349;
    float _1357 = _1333;
    float _1359 = _1355;
    if (_1261)
    {
        float _1361 = _1333 * _1353;
        _1357 = _1361;
    }
    float _1363 = _1357;
    if (_1261)
    {
        float _1365 = fma(_1253, _1363, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1343 = _1365;
    }
    float _1367 = _1343;
    if (_1261)
    {
        float _1369 = fma(_1249, _1363, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1359 = _1369;
    }
    float _1371 = _1359;
    float _1373 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1375 = _1367 + _1373;
    float _1377 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1379 = _1371 + _1377;
    float _1381 = fma(_1375, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1383 = fma(_1379, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _4549 = float2(_1381, _1383);
    float _1385 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_4549, float2(0.0), isnan(_4549)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_4549, float2(0.0), isnan(_4549)), level(0.0)).x;
    float _1387 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _1389 = fma(_1385, 100.0, _1293);
    float _1391 = _1389 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1393 = fma(_1185, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1391);
    float _1395 = fma(_1191, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1393);
    float _1397 = _1389 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1399 = _1389 + _1387;
    float _1401 = _1395 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1403 = fma(_1185, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1397);
    float _1405 = 1.0 / _1401;
    float _1407 = fma(_1191, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1403);
    float _1409 = _1407 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1411 = _1409 + _1401;
    float _1413 = _1411 * _1405;
    float _1415 = _1413 * 0.5;
    float _1417 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1419 = fma(_1415, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1417);
    float _1421 = 1.0 / _1419;
    float _1423 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1425 = _1421 * _1423;
    bool _1427 = _1425 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1429 = _1425 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1431 = !_1427;
    int _1433 = _1431 ? 0 : 1;
    int _1435 = 2;
    if (!_1427)
    {
        _1435 = 1;
    }
    int _1437 = _1435;
    int _1439 = _1437;
    if (!_1429)
    {
        _1439 = _1433;
    }
    int _1441 = _1439;
    int _1443 = _1441 << 6;
    int _1445 = _1443 + 96;
    uint _1448 = uint(int(uint(_1445) >> uint(2)));
    uint _1450 = uint(int(uint(int(_1448)) >> uint(2)));
    int _1452 = int(_1448) & 3;
    float _1454 = (*spvDescriptorSet0.vp_c15)._m0[int(_1450)][_1452];
    int _1456 = int(_1448) + 1;
    uint _1458 = uint(int(uint(_1456) >> uint(2)));
    int _1460 = _1456 & 3;
    float _1462 = (*spvDescriptorSet0.vp_c15)._m0[int(_1458)][_1460];
    int _1464 = _1443 + 104;
    uint _1466 = uint(int(uint(_1464) >> uint(2)));
    uint _1468 = uint(int(uint(int(_1466)) >> uint(2)));
    int _1470 = int(_1466) & 3;
    float _1472 = (*spvDescriptorSet0.vp_c15)._m0[int(_1468)][_1470];
    int _1474 = int(_1466) + 1;
    uint _1476 = uint(int(uint(_1474) >> uint(2)));
    int _1478 = _1474 & 3;
    float _1480 = (*spvDescriptorSet0.vp_c15)._m0[int(_1476)][_1478];
    int _1482 = _1443 + 48;
    uint _1484 = uint(int(uint(_1482) >> uint(2)));
    uint _1486 = uint(int(uint(int(_1484)) >> uint(2)));
    int _1488 = int(_1484) & 3;
    float _1490 = (*spvDescriptorSet0.vp_c15)._m0[int(_1486)][_1488];
    int _1492 = int(_1484) + 1;
    uint _1494 = uint(int(uint(_1492) >> uint(2)));
    int _1496 = _1492 & 3;
    float _1498 = (*spvDescriptorSet0.vp_c15)._m0[int(_1494)][_1496];
    int _1500 = _1443 + 64;
    uint _1502 = uint(int(uint(_1500) >> uint(2)));
    uint _1504 = uint(int(uint(int(_1502)) >> uint(2)));
    int _1506 = int(_1502) & 3;
    float _1508 = (*spvDescriptorSet0.vp_c15)._m0[int(_1504)][_1506];
    int _1510 = int(_1502) + 1;
    uint _1512 = uint(int(uint(_1510) >> uint(2)));
    int _1514 = _1510 & 3;
    float _1516 = (*spvDescriptorSet0.vp_c15)._m0[int(_1512)][_1514];
    int _1518 = _1443 + 56;
    uint _1520 = uint(int(uint(_1518) >> uint(2)));
    uint _1522 = uint(int(uint(int(_1520)) >> uint(2)));
    int _1524 = int(_1520) & 3;
    float _1526 = (*spvDescriptorSet0.vp_c15)._m0[int(_1522)][_1524];
    int _1528 = int(_1520) + 1;
    uint _1530 = uint(int(uint(_1528) >> uint(2)));
    int _1532 = _1528 & 3;
    float _1534 = (*spvDescriptorSet0.vp_c15)._m0[int(_1530)][_1532];
    int _1536 = _1443 + 72;
    uint _1538 = uint(int(uint(_1536) >> uint(2)));
    uint _1540 = uint(int(uint(int(_1538)) >> uint(2)));
    int _1542 = int(_1538) & 3;
    float _1544 = (*spvDescriptorSet0.vp_c15)._m0[int(_1540)][_1542];
    int _1546 = int(_1538) + 1;
    uint _1548 = uint(int(uint(_1546) >> uint(2)));
    int _1550 = _1546 & 3;
    float _1552 = (*spvDescriptorSet0.vp_c15)._m0[int(_1548)][_1550];
    float _1554 = _1399 * _1462;
    float _1556 = fma(_1185, _1454, _1554);
    float _1558 = fma(_1191, _1472, _1556);
    float _1560 = _1558 + _1480;
    int _1562 = _1443 + 80;
    uint _1564 = uint(int(uint(_1562) >> uint(2)));
    uint _1566 = uint(int(uint(int(_1564)) >> uint(2)));
    int _1568 = int(_1564) & 3;
    float _1570 = (*spvDescriptorSet0.vp_c15)._m0[int(_1566)][_1568];
    int _1572 = int(_1564) + 1;
    uint _1574 = uint(int(uint(_1572) >> uint(2)));
    int _1576 = _1572 & 3;
    float _1578 = (*spvDescriptorSet0.vp_c15)._m0[int(_1574)][_1576];
    float _1580 = _1399 * _1498;
    float _1582 = 1.0 / _1560;
    float _1584 = fma(_1185, _1490, _1580);
    int _1586 = _1443 + 88;
    uint _1588 = uint(int(uint(_1586) >> uint(2)));
    uint _1590 = uint(int(uint(int(_1588)) >> uint(2)));
    int _1592 = int(_1588) & 3;
    float _1594 = (*spvDescriptorSet0.vp_c15)._m0[int(_1590)][_1592];
    int _1596 = int(_1588) + 1;
    uint _1598 = uint(int(uint(_1596) >> uint(2)));
    int _1600 = _1596 & 3;
    float _1602 = (*spvDescriptorSet0.vp_c15)._m0[int(_1598)][_1600];
    float _1604 = _1399 * _1516;
    float _1606 = fma(_1185, _1508, _1604);
    float _1608 = fma(_1191, _1526, _1584);
    float _1610 = _1608 + _1534;
    float _1612 = fma(_1191, _1544, _1606);
    float _1614 = _1610 * _1582;
    float _1616 = fma(_1185, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1618 = _1612 + _1552;
    bool _1620 = _1614 >= 0.0;
    float _1622 = fma(_1191, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1624 = _1618 * _1582;
    bool _1626 = _1614 <= 1.0;
    bool _1628 = _1626 && _1620;
    float _1630 = floor(_1622);
    bool _1632 = _1624 >= 0.0;
    bool _1634 = _1632 && _1628;
    bool _1636 = _1624 <= 1.0;
    bool _1638 = _1636 && _1634;
    float _1640 = floor(_1616);
    float _1642 = _1399 * _1578;
    float _1644 = fma(_1185, _1570, _1642);
    float _1646 = -_1630;
    float _1648 = _1622 + _1646;
    float _1650 = fma(_1191, _1594, _1644);
    float _1652 = _1584;
    if (_1638)
    {
        float _1654 = float(_1441);
        _1652 = _1654;
    }
    float _1656 = _1652;
    float _1658 = _1650 + _1602;
    float _1660 = -_1640;
    float _1662 = _1616 + _1660;
    float _1664 = _1656;
    if (_1638)
    {
        float _1666 = rint(_1656);
        float _1668 = precise::max(_1666, 0.0);
        uint _1670 = uint(_1668);
        uint _1672 = clamp(_1670, 0u, 65535u);
        _1664 = as_type<float>(_1672);
    }
    float _1674 = _1664;
    float _1676 = _1658 * _1582;
    float2 _5044 = float2(_1662, _1648);
    float _1678 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5044, float2(0.0), isnan(_5044)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5044, float2(0.0), isnan(_5044)), level(0.0)).x;
    float _1680 = _1624;
    if (_1638)
    {
        float3 _5059 = float3(_1614, _1624, float(as_type<int>(_1674)));
        float3 _5063 = select(_5059, float3(0.0), isnan(_5059));
        float _1682 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5063.xy, uint(rint(_5063.z)), _1676, level(0.0));
        _1680 = _1682;
    }
    float _1684 = _1680;
    float _1686 = in.m_62.w;
    bool _1688 = _1115 != 0.0;
    bool _1690 = isnan(_1115);
    bool _1692 = _1688 || _1690;
    bool _1694 = isnan(0.0);
    bool _1696 = _1692 || _1694;
    float _1698 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _1700 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1702 = _1700 != 0;
    float _1704 = in.m_68.x;
    bool _1706 = _1119 == 0.0;
    bool _1708 = !_1696;
    bool _1710 = _1706 && _1708;
    int _1712 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1714 = _1712 != 0;
    float _1716 = in.m_74.x;
    float _1718 = in.m_74.y;
    float _1720 = in.m_74.z;
    float _1722 = in.m_74.w;
    bool _1724 = _1103 == 0.02999999932944774627685546875;
    bool _1726 = _1724 && _1710;
    float _1728 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1730 = _1552;
    if (_1702)
    {
        float _1732 = in.m_62.z;
        _1730 = _1732;
    }
    float _1734 = _1730;
    float _1736 = -_715;
    float _1738 = _1736 + 1.0;
    float _1740 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1742 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1744 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1746 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _1748 = _1686 > 0.5;
    float _1750 = _1740 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1752 = _1742 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1754 = _1744 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1756 = _1704;
    float _1758 = _1752;
    if (_1702)
    {
        _915 = _1704;
    }
    float _1760 = _915;
    int _1762 = _1748 ? as_type<int>(_1738) : as_type<int>(_715);
    float _1764 = _315 * _1720;
    float _1766 = _301 * _1720;
    float _1768 = _1714 ? as_type<float>(_1762) : _715;
    float _1770 = _311 * _1720;
    float _1772 = fma(_283, _1716, _1764);
    float _1774 = fma(_275, _1716, _1766);
    out.m_76.x = _1750;
    out.m_76.y = _1752;
    out.m_76.z = _1754;
    out.m_76.w = _1746;
    float _1776 = fma(_279, _1716, _1770);
    bool _1778 = _1734 > 0.5;
    bool _1780 = _1778 && _1702;
    float _1782 = _1768 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1784 = in.m_78.x;
    float _1786 = in.m_78.y;
    float _1788 = in.m_78.z;
    float _1790 = -_1718;
    float _1792 = fma(_323, _1790, _1776);
    float _1794 = -_1718;
    float _1796 = fma(_319, _1794, _1774);
    float _1798 = -_1718;
    float _1800 = fma(_327, _1798, _1772);
    float _1802 = _1782 * _1728;
    out.m_80.x = _1792;
    out.m_80.y = _1796;
    out.m_80.z = _1800;
    float _1804 = _1760;
    float _1806 = _1764;
    float _1808 = _1768;
    float _1810 = _1722;
    if (_1780)
    {
        float _1812 = -_1760;
        float _1814 = _1812 + 1.0;
        _1804 = _1814;
    }
    float _1816 = _1804;
    if (_1702)
    {
        _1756 = _1816;
    }
    float _1818 = _1756;
    float _1820 = _1796;
    float _1822 = _1818;
    if (_1261)
    {
        float _1824 = _1307 * 6.283185482025146484375;
        float _1826 = cos(_1824);
        _1820 = _1826;
    }
    float _1828 = _1820;
    float _1830 = _1818 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1832 = _1784;
    if (_1726)
    {
        _1806 = _1784;
    }
    float _1834 = _1806;
    float _1836 = _1830 * _1698;
    float _1838 = _1834;
    if (_1726)
    {
        _1822 = _1786;
    }
    float _1840 = _1822;
    float _1842 = _1840;
    if (_1726)
    {
        _1808 = _1834;
    }
    float _1844 = _1808;
    float _1846 = _1844;
    if (!_1726)
    {
        _1838 = _1784;
    }
    float _1848 = _1838;
    out.m_82.z = _1836;
    out.m_82.w = _1802;
    if (_1726)
    {
        _1758 = _1840;
    }
    float _1850 = _1758;
    float _1852 = _1850;
    if (!_1726)
    {
        _1842 = _1786;
    }
    float _1854 = _1842;
    float _1856 = _1720 * _1848;
    if (_1726)
    {
        _1832 = _1788;
    }
    float _1858 = _1832;
    float _1860 = _1718 * _1788;
    float _1862 = _1858;
    if (!_1726)
    {
        float _1864 = fma(_1113, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1788);
        _1862 = _1864;
    }
    float _1866 = _1862;
    float _1868 = -_1856;
    float _1870 = fma(_1716, _1788, _1868);
    float _1872 = _1716 * _1854;
    if (!_1726)
    {
        float _1874 = fma(_1119, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1848);
        _1846 = _1874;
    }
    float _1876 = _1846;
    float _1878 = _311 * _1866;
    float _1880 = _301 * _1866;
    float _1882 = -_1872;
    float _1884 = fma(_1718, _1848, _1882);
    float _1886 = -_1860;
    float _1888 = fma(_1720, _1854, _1886);
    float _1890 = _315 * _1866;
    if (!_1726)
    {
        float _1892 = fma(_1115, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1854);
        _1852 = _1892;
    }
    float _1894 = _1852;
    float _1896 = _1884 * _1722;
    float _1898 = fma(_279, _1876, _1878);
    float _1900 = fma(_283, _1876, _1890);
    float _1902 = _1888 * _1722;
    float _1904 = _1896 * _311;
    float _1906 = _1870 * _1722;
    float _1908 = _1896 * _301;
    float _1910 = _1896 * _315;
    float _1912 = -_1894;
    float _1914 = fma(_323, _1912, _1898);
    float _1916 = _1914;
    if (_1261)
    {
        float _1918 = _1828 + (-1.0);
        _1810 = _1918;
    }
    float _1920 = _1810;
    float _1922 = fma(_275, _1876, _1880);
    float _1924 = fma(_1902, _279, _1904);
    float _1926 = fma(_1902, _275, _1908);
    float _1928 = fma(_1902, _283, _1910);
    float _1930 = -_1894;
    float _1932 = fma(_327, _1930, _1900);
    float _1934 = _1914 * _1139;
    float _1936 = _1914 * _1157;
    float _1938 = in.m_64.w;
    if (_1261)
    {
        float _1940 = _1920 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1916 = _1940;
    }
    float _1942 = _1916;
    float _1944 = -_1906;
    float _1946 = fma(_1944, _323, _1924);
    float _1948 = -_1906;
    float _1950 = fma(_1948, _327, _1928);
    float _1952 = fma(_1932, _1157, _1934);
    float _1954 = -_1906;
    float _1956 = fma(_1954, _319, _1926);
    if (_1261)
    {
        float _1958 = fma(_1337, _1828, _1942);
        _1339 = _1958;
    }
    float _1960 = _1339;
    float _1962 = -_1936;
    float _1964 = fma(_1932, _1139, _1962);
    float _1966 = _1209 * _1952;
    float _1968 = _1223 * _1952;
    out.m_84.x = _1946;
    out.m_84.y = _1956;
    out.m_84.z = _1950;
    float _1970 = fma(_1385, 100.0, _1960);
    float _1972 = _1399 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1974 = abs(_1425);
    float _1976 = log2(_1974);
    float _1978 = fma(_1209, _1964, _1968);
    float _1980 = _1970 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1982 = fma(_1185, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1972);
    float _1984 = -_1966;
    float _1986 = fma(_1223, _1964, _1984);
    float _1988 = _1970 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1990 = -_1894;
    float _1992 = fma(_319, _1990, _1922);
    float _1994 = _1970 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1996 = _1970 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1998 = _1399 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2000 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1980);
    float _2002 = fma(_1191, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1982);
    float _2004 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1988);
    float _2006 = fma(_1185, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1998);
    out.m_86.w = _1938;
    float _2008 = _2002 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _2010 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2004);
    float _2012 = fma(_1191, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2006);
    float _2014 = _1976 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2016 = trunc(_2008);
    int _2018 = int(_2016);
    float _2020 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1994);
    float _2022 = _2012 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _2024 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2000);
    float _2026 = _2010 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2028 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1996);
    float _2030 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2020);
    float _2032 = _2024 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2034 = trunc(_2022);
    int _2036 = int(_2034);
    float _2038 = _2026 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2040 = _2026 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2042 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2028);
    float _2044 = _2030 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2046 = _2026 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2048 = _2026 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2050 = fma(_2032, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2038);
    float _2052 = exp2(_2014);
    float _2054 = fma(_2032, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2040);
    float _2056 = fma(_2032, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2046);
    float _2058 = fma(_2032, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2048);
    float _2060 = _2042 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2062 = fma(_2044, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2050);
    float _2064 = fma(_2044, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2054);
    int _2066 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2068 = _2018 + _2066;
    int _2070 = _2068 + 1;
    float _2072 = fma(_2044, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2056);
    int _2074 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2076 = _2036 + _2074;
    int _2078 = _2076 + 1;
    float _2080 = fma(_2044, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2058);
    float _2082 = fma(_2060, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2062);
    float _2084 = fma(_2060, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2064);
    bool _2086 = _2070 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _2088 = fma(_2060, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2080);
    int _2090 = _2070 | _2078;
    float _2092 = fma(_2052, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2094 = precise::clamp(_2092, 0.0, 1.0);
    float _2096 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2098 = _1970 + _2096;
    bool _2100 = _2090 < 0;
    bool _2102 = _2100 || _2086;
    float _2104 = fma(_2060, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2072);
    bool _2106 = _1425 <= 8000.0;
    bool _2108 = isnan(_1425);
    bool _2110 = _2106 || _2108;
    bool _2112 = isnan(8000.0);
    bool _2114 = _2110 || _2112;
    float _2116 = float(_2114);
    float _2118 = fma(_2094, -2.0, 3.0);
    float _2120 = _2094 * _2094;
    bool _2122 = _2078 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2124 = _2122 || _2102;
    float _2126 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2128 = _1367 + _2126;
    float _2130 = _2098 * _2098;
    float _2132 = _2120 * _2118;
    out.gl_Position.x = _2104;
    out.gl_Position.y = _2082;
    out.gl_Position.z = _2084;
    out.gl_Position.w = _2088;
    float _2134 = fma(_2128, _2128, _2130);
    float _2136 = -_2132;
    float _2138 = _2136 + 1.0;
    float _2140 = fma(_2138, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2132);
    float _2142 = _2116 * _2140;
    float _2144 = _2104;
    float _2146 = _2082;
    float _2148 = _2088;
    float _2150 = _2142;
    float _2152 = _2022;
    if (_2124)
    {
        _2144 = 1.0;
    }
    float _2154 = _2144;
    float _2156 = _2154;
    if (!_2124)
    {
        int _2158 = _2078 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2160 = _2158 + _2070;
        float _2162 = floor(_2022);
        int _2164 = _2160 << 2;
        uint _2166 = uint(int(uint(_2160) >> uint(2)));
        int _2168 = 12 & _2164;
        int _2170 = int(_2166) << 4;
        int _2172 = _2170 + _2168;
        float _2174 = floor(_2008);
        float _2176 = -_2162;
        float _2178 = _2022 + _2176;
        int _2180 = _2172 + 400;
        uint _2182 = uint(int(uint(_2180) >> uint(2)));
        uint _2184 = uint(int(uint(int(_2182)) >> uint(2)));
        int _2186 = int(_2182) & 3;
        float _2188 = (*spvDescriptorSet0.vp_c15)._m0[int(_2184)][_2186];
        float _2190 = -_2174;
        float _2192 = _2008 + _2190;
        float _2194 = rint(_2188);
        float _2196 = precise::max(_2194, 0.0);
        uint _2198 = uint(_2196);
        uint _2200 = clamp(_2198, 0u, 65535u);
        float3 _5964 = float3(_2192, _2178, float(int(_2200)));
        float3 _5966 = select(_5964, float3(0.0), isnan(_5964));
        float _2202 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5966.xy, uint(rint(_5966.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5966.xy, uint(rint(_5966.z)), level(0.0)).x;
        int _2204 = _2160 << 4;
        int _2206 = _2204 + 2048;
        uint _2208 = uint(int(uint(_2206) >> uint(2)));
        uint _2210 = uint(int(uint(int(_2208)) >> uint(2)));
        int _2212 = int(_2208) & 3;
        float _2214 = (*spvDescriptorSet0.vp_c15)._m0[int(_2210)][_2212];
        int _2216 = int(_2208) + 1;
        uint _2218 = uint(int(uint(_2216) >> uint(2)));
        int _2220 = _2216 & 3;
        float _2222 = (*spvDescriptorSet0.vp_c15)._m0[int(_2218)][_2220];
        int _2224 = _2206 + 8;
        uint _2226 = uint(int(uint(_2224) >> uint(2)));
        uint _2228 = uint(int(uint(int(_2226)) >> uint(2)));
        int _2230 = int(_2226) & 3;
        float _2232 = (*spvDescriptorSet0.vp_c15)._m0[int(_2228)][_2230];
        int _2234 = int(_2226) + 1;
        uint _2236 = uint(int(uint(_2234) >> uint(2)));
        int _2238 = _2234 & 3;
        float _2240 = (*spvDescriptorSet0.vp_c15)._m0[int(_2236)][_2238];
        float _2242 = _1399 * _2222;
        float _2244 = fma(_1185, _2214, _2242);
        float _2246 = fma(_1191, _2232, _2244);
        float _2248 = _2246 + _2240;
        float _2250 = precise::clamp(_2248, 0.0, 1.0);
        float _2252 = -_2250;
        float _2254 = _2252 + _2202;
        float _2256 = fma(_2254, 500.0, 1.5);
        float _2258 = exp2(_2256);
        float _2260 = 0.0 + _2258;
        float _2262 = precise::clamp(_2260, 0.0, 1.0);
        _2146 = _2188;
        _2156 = _2262;
        _2148 = _2202;
    }
    float _2264 = _2146;
    float _2266 = _2156;
    float _2268 = _2148;
    float _2270 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2272 = _1371 + _2270;
    float _2274 = _2142 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2276 = -_1678;
    float _2278 = _2276 + 1.0;
    float _2280 = _2264;
    float _2282 = _2268;
    if (!_1638)
    {
        _2280 = 1.0;
    }
    float _2284 = _2280;
    float _2286 = fma(_2272, _2272, _2134);
    float _2288 = _2284;
    if (_1638)
    {
        bool _2290 = _1684 >= _1676;
        bool _2292 = isnan(_1684);
        bool _2294 = _2290 || _2292;
        bool _2296 = isnan(_1676);
        bool _2298 = _2294 || _2296;
        float _2300 = float(_2298);
        _2288 = _2300;
    }
    float _2302 = _2288;
    float _2304 = _2278 * _2274;
    float _2306 = precise::clamp(_2304, 0.0, 1.0);
    out.m_88.x = _1978;
    out.m_88.y = _1992;
    out.m_88.z = _1986;
    float _2308 = _2302 * _2266;
    float _2310 = sqrt(_2286);
    float _2312 = -_2306;
    float _2314 = fma(_2312, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_90.x = _1367;
    out.m_90.y = _1970;
    out.m_90.z = _1371;
    float _2316 = -_2308;
    float _2318 = fma(_2316, _2314, 1.0);
    float _2320 = precise::clamp(_2318, 0.0, 1.0);
    float _2322 = _2320 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_92.x = _2322;
    bool _2324 = _2310 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2326 = isnan(_2310);
    bool _2328 = _2324 || _2326;
    bool _2330 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2332 = _2328 || _2330;
    float _2334 = _2306;
    float _2336 = _2314;
    float _2338 = _2320;
    if (!_2332)
    {
        _2150 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2340 = _2150;
    float _2342 = _2340;
    float _2344 = _2340;
    if (!_2332)
    {
        _2152 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2346 = _2152;
    float _2348 = _2346;
    float _2350 = _2346;
    if (!_2332)
    {
        _2282 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2352 = _2282;
    float _2354 = _2352;
    float _2356 = _2352;
    if (!_2332)
    {
        _2334 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2358 = _2334;
    float _2360 = _2358;
    float _2362 = _2358;
    if (!_2332)
    {
        _2336 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2364 = _2336;
    float _2366 = _2364;
    float _2368 = _2364;
    if (!_2332)
    {
        _2338 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2370 = _2338;
    bool _2372 = !_2332;
    float _2374 = _2370;
    float _2376 = _2370;
    if (!_2372)
    {
        bool _2378 = _2310 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2380 = isnan(_2310);
        bool _2382 = _2378 || _2380;
        bool _2384 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2386 = _2382 || _2384;
        if (!_2386)
        {
            float _2388 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2390 = _2310 + _2388;
            float _2392 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2394 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2392;
            float _2396 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2398 = _2396 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2400 = 1.0 / _2394;
            float _2402 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2404 = _2402 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2406 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2408 = _2406 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2410 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2412 = _2410 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2414 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2416 = _2414 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2418 = _2390 * _2400;
            float _2420 = precise::clamp(_2418, 0.0, 1.0);
            float _2422 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2424 = _2422 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2426 = fma(_2420, _2398, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2428 = fma(_2420, _2424, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2430 = fma(_2420, _2404, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2432 = fma(_2420, _2408, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2434 = fma(_2420, _2412, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2436 = fma(_2420, _2416, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2350 = _2426;
            _2368 = _2434;
            _2344 = _2430;
            _2362 = _2432;
            _2356 = _2428;
            _2376 = _2436;
            _2438 = true;
        }
        else
        {
            bool _2440 = _2310 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2442 = isnan(_2310);
            bool _2444 = _2440 || _2442;
            bool _2446 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2448 = _2444 || _2446;
            if (!_2448)
            {
                _2342 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2450 = _2342;
            _2344 = _2450;
            if (!_2448)
            {
                _2348 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2452 = _2348;
            _2350 = _2452;
            if (!_2448)
            {
                _2354 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2454 = _2354;
            _2356 = _2454;
            if (!_2448)
            {
                _2360 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2456 = _2360;
            _2362 = _2456;
            if (!_2448)
            {
                _2366 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2458 = _2366;
            _2368 = _2458;
            if (!_2448)
            {
                _2374 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2460 = _2374;
            bool _2462 = !_2448;
            _2376 = _2460;
            if (!_2462)
            {
                bool _2464 = _2310 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2466 = isnan(_2310);
                bool _2468 = _2464 || _2466;
                bool _2470 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2472 = _2468 || _2470;
                if (!_2472)
                {
                    float _2474 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2476 = _2310 + _2474;
                    float _2478 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2480 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2478;
                    float _2482 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2484 = _2482 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2486 = 1.0 / _2480;
                    float _2488 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2490 = _2488 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2492 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2494 = _2492 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2496 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2498 = _2496 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2500 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2502 = _2500 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2504 = _2476 * _2486;
                    float _2506 = precise::clamp(_2504, 0.0, 1.0);
                    float _2508 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2510 = _2508 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2512 = fma(_2506, _2484, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2514 = fma(_2506, _2510, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2516 = fma(_2506, _2490, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2518 = fma(_2506, _2494, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2520 = fma(_2506, _2498, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2522 = fma(_2506, _2502, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2350 = _2512;
                    _2368 = _2520;
                    _2344 = _2516;
                    _2362 = _2518;
                    _2356 = _2514;
                    _2376 = _2522;
                    _2438 = true;
                }
                else
                {
                    _2350 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2368 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2344 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2362 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2356 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2376 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2438 = false;
    float _2524 = _2350;
    float _2526 = _2368;
    float _2528 = _2344;
    float _2530 = _2362;
    float _2532 = _2356;
    float _2534 = _2376;
    float _2536 = fma(_1992, -0.5, 0.5);
    float _2538 = precise::clamp(_2536, 0.0, 1.0);
    float _2540 = -_2524;
    float _2542 = _2540 + _2526;
    float _2544 = -_2528;
    float _2546 = _2544 + _2530;
    float _2548 = -_2532;
    float _2550 = _2548 + _2534;
    bool _2552 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2554 = fma(_2538, _2542, _2524);
    float _2556 = fma(_2538, _2546, _2528);
    float _2558 = fma(_2538, _2550, _2532);
    float _2560 = _2554 * 0.586610972881317138671875;
    out.m_52.x = 1.0;
    float _2562 = fma(_2556, 0.298911988735198974609375, _2560);
    float _2564 = fma(_2558, 0.114477999508380889892578125, _2562);
    out.m_94.x = 0.0;
    float _2566 = -_2564;
    float _2568 = _2556 + _2566;
    float _2570 = -_2564;
    float _2572 = _2554 + _2570;
    float _2574 = -_2564;
    float _2576 = _2558 + _2574;
    float _2578 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2580 = fma(_2568, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2564);
    float _2582 = fma(_2572, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2564);
    float _2584 = fma(_2576, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2564);
    out.m_92.w = _2578;
    out.m_96.x = _2580;
    out.m_96.y = _2582;
    out.m_96.z = _2584;
    if (!_2552)
    {
        return out;
    }
    float _2586 = -_1970;
    float _2588 = _2586 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2590 = -_1367;
    float _2592 = _2590 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2594 = -_1371;
    float _2596 = _2594 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2598 = _2588 * _2588;
    float _2600 = fma(_2592, _2592, _2598);
    float _2602 = fma(_2596, _2596, _2600);
    float _2604 = sqrt(_2602);
    float _2606 = rsqrt(_2602);
    float _2608 = -_2604;
    float _2610 = _2608 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2612 = _2610 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2614 = precise::clamp(_2612, 0.0, 1.0);
    float _2616 = _2592 * _2606;
    float _2618 = _2588 * _2606;
    float _2620 = abs(_2614);
    float _2622 = log2(_2620);
    float _2624 = _2596 * _2606;
    float _2626 = _2616 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2628 = _1992 * _2618;
    float _2630 = -_2618;
    float _2632 = -_2626;
    float _2634 = fma(_2630, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2632);
    float _2636 = fma(_1978, _2616, _2628);
    float _2638 = -_2624;
    float _2640 = fma(_2638, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2634);
    float _2642 = fma(_1986, _2624, _2636);
    float _2644 = precise::clamp(_2642, 0.0, 1.0);
    float _2646 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2648 = _2640 + _2646;
    float _2650 = _2622 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2652 = _2648 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2654 = precise::clamp(_2652, 0.0, 1.0);
    float _2656 = exp2(_2650);
    float _2658 = _2656 * _2654;
    float _2660 = _2644 * _2658;
    float _2662 = _2660 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2664 = _2660 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2666 = _2660 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_94.x = _2662;
    out.m_94.y = _2664;
    out.m_94.z = _2666;
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
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2438 = false;
    bool _349 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _110 = in.m_49.w;
    float _112 = trunc(_110);
    int _115 = int(_112);
    bool _119 = _115 >= 1;
    float _121 = 0.0;
    float _123 = as_type<float>(_115);
    if (!_119)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _125 = _121;
    if (!_119)
    {
        out.m_52.x = 0.0;
    }
    int _127 = 0;
    if (!_119)
    {
        float _129 = _125 * 5.0;
        _127 = as_type<int>(_129);
    }
    int _131 = _127;
    int _133 = _131;
    if (!_119)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2724 = as_type<float>(_131);
        out.gl_Position.z = _2724;
    }
    if (!_119)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _135 = in.m_54.w;
    float _137 = float(_115);
    float _139 = -_135;
    float _141 = _139 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _143 = _135 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _145 = isnan(_135);
    bool _147 = _143 || _145;
    bool _149 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _151 = _147 || _149;
    bool _153 = _141 >= _137;
    bool _155 = !_151;
    bool _157 = _153 || _155;
    if (_157)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _159 = _123;
    if (_157)
    {
        out.m_52.x = 0.0;
    }
    if (_157)
    {
        float _161 = _159 * 5.0;
        _133 = as_type<int>(_161);
    }
    int _163 = _133;
    if (_157)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2787 = as_type<float>(_163);
        out.gl_Position.z = _2787;
    }
    if (_157)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _165 = in.m_56.x;
    float _167 = in.m_56.y;
    float _169 = in.m_56.z;
    float _171 = 1.0 / _137;
    float _173 = in.m_58.x;
    float _175 = in.m_58.y;
    float _177 = in.m_58.z;
    float _179 = in.m_60.x;
    float _181 = in.m_60.y;
    float _183 = in.m_60.z;
    float _185 = _141 * _171;
    float _187 = _165 * _165;
    float _189 = _167 * _167;
    float _191 = fma(_173, _173, _187);
    float _193 = fma(_175, _175, _189);
    float _195 = fma(_179, _179, _191);
    float _197 = _169 * _169;
    float _199 = fma(_181, _181, _193);
    float _201 = sqrt(_195);
    float _203 = fma(_177, _177, _197);
    float _205 = fma(_183, _183, _203);
    float _207 = sqrt(_199);
    float _209 = sqrt(_205);
    bool _211 = _201 > 0.0;
    bool _213 = _207 > 0.0;
    float _215 = 0.0;
    float _217 = _207;
    if (_211)
    {
        float _219 = rsqrt(_195);
        _215 = _219;
    }
    float _221 = _215;
    float _223 = 0.0;
    if (!_211)
    {
        _223 = 0.0;
    }
    float _225 = _223;
    bool _227 = _209 > 0.0;
    float _229 = _209;
    float _231 = _225;
    bool _233 = _227;
    if (!_211)
    {
        _217 = 0.0;
    }
    float _235 = _217;
    float _237 = 0.0;
    float _239 = _235;
    if (!_211)
    {
        _237 = 0.0;
    }
    float _241 = _237;
    float _243 = _201;
    float _245 = _241;
    if (_213)
    {
        float _247 = rsqrt(_199);
        _243 = _247;
    }
    float _249 = _243;
    if (!_213)
    {
        _229 = 0.0;
    }
    float _251 = _229;
    float _253 = 0.0;
    float _255 = _251;
    if (!_213)
    {
        _253 = 0.0;
    }
    float _257 = _253;
    float _259 = 0.0;
    float _261 = _257;
    if (!_213)
    {
        _259 = 0.0;
    }
    float _263 = _259;
    float _265 = 0.0;
    float _267 = _263;
    if (_227)
    {
        float _269 = rsqrt(_205);
        _265 = _269;
    }
    float _271 = _265;
    if (_211)
    {
        float _273 = _221 * _165;
        _231 = _273;
    }
    float _275 = _231;
    if (_211)
    {
        float _277 = _221 * _173;
        _239 = _277;
    }
    float _279 = _239;
    if (_211)
    {
        float _281 = _221 * _179;
        _245 = _281;
    }
    float _283 = _245;
    bool _285 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _287 = 0.0;
    if (!_227)
    {
        _287 = 0.0;
    }
    float _289 = _287;
    float _291 = 0.0;
    float _293 = _289;
    if (!_227)
    {
        _291 = 0.0;
    }
    float _295 = _291;
    float _297 = _295;
    if (_213)
    {
        float _299 = _249 * _167;
        _255 = _299;
    }
    float _301 = _255;
    float _303 = 0.0;
    if (!_227)
    {
        _303 = 0.0;
    }
    float _305 = _303;
    float _307 = _305;
    if (_213)
    {
        float _309 = _249 * _175;
        _261 = _309;
    }
    float _311 = _261;
    if (_213)
    {
        float _313 = _249 * _181;
        _267 = _313;
    }
    float _315 = _267;
    if (_227)
    {
        float _317 = _271 * _169;
        _293 = _317;
    }
    float _319 = _293;
    if (_227)
    {
        float _321 = _271 * _177;
        _297 = _321;
    }
    float _323 = _297;
    if (_227)
    {
        float _325 = _271 * _183;
        _307 = _325;
    }
    float _327 = _307;
    bool _329 = !_285;
    float _347;
    if (!_329)
    {
        float _331 = in.m_62.x;
        float _333 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _335 = _331 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _337 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[12].x, _141);
        float _339 = _337 * _333;
        float _341 = floor(_339);
        float _343 = -_341;
        float _345 = _339 + _343;
        _347 = _345;
        _349 = true;
    }
    else
    {
        _347 = _185;
    }
    _349 = false;
    float _351 = _347;
    float _353 = in.m_64.x;
    float _355 = in.m_64.y;
    float _357 = _141 * (*spvDescriptorSet0.vp_c9)._m0[193].y;
    float _359 = in.m_62.x;
    float _361 = in.m_49.x;
    float _363 = in.m_49.y;
    float _365 = in.m_49.z;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _369 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _367;
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _373 = _371 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _375 = in.m_62.y;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _377;
    float _381 = 1.0 / _369;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _385 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _383;
    float _387 = abs(_353);
    float _389 = log2(_387);
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _393 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _391;
    float _395 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _397 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _395;
    float _399 = fma(_359, 6.283185482025146484375, _357);
    float _401 = fma((*spvDescriptorSet0.vp_c9)._m0[194].y, 0.01745329238474369049072265625, _399);
    float _403 = _175 * _363;
    float _405 = _181 * _363;
    float _407 = 1.0 / _379;
    float _409 = _375 * 628.31854248046875;
    float _411 = fma(_173, _361, _403);
    float _413 = _401 * 0.15915493667125701904296875;
    float _415 = _389 * (*spvDescriptorSet0.vp_c9)._m0[193].z;
    float _417 = _401 * 0.60000002384185791015625;
    float _419 = 1.0 / _373;
    float _421 = _417 * 0.15915493667125701904296875;
    float _423 = _401 * 1.2999999523162841796875;
    float _425 = _423 * 0.15915493667125701904296875;
    float _427 = fma(_179, _361, _405);
    float _429 = -(*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _431 = _429 + (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _433 = exp2(_415);
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _437 = _351 + _435;
    float _439 = _401 + 0.52359879016876220703125;
    float _441 = fma(_431, _359, (*spvDescriptorSet0.vp_c9)._m0[191].x);
    float _443 = _437 * _381;
    float _445 = _439 * 0.15915493667125701904296875;
    float _447 = fma(_141, _441, _409);
    float _449 = fma(_401, 0.60000002384185791015625, 0.31415927410125732421875);
    float _451 = _413 * 6.283185482025146484375;
    float _453 = sin(_451);
    float _455 = fma(_401, 1.2999999523162841796875, 0.680678427219390869140625);
    float _457 = (*spvDescriptorSet0.vp_c9)._m0[193].w * 3.1415927410125732421875;
    float _459 = _449 * 0.15915493667125701904296875;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _463 = _351 + _461;
    float _465 = fma(_457, _433, _357);
    float _467 = _421 * 6.283185482025146484375;
    float _469 = sin(_467);
    float _471 = in.m_66.x;
    float _473 = in.m_66.y;
    float _475 = in.m_66.z;
    float _477 = fma(_359, 6.283185482025146484375, _465);
    float _479 = _463 * _407;
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _483 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _481;
    float _485 = fma(_353, 0.261799395084381103515625, -0.261799395084381103515625);
    float _487 = _445 * 6.283185482025146484375;
    float _489 = sin(_487);
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _493 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _491;
    float _495 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _497 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _495;
    float _499 = _447 + _485;
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _503 = _351 + _501;
    float _505 = _455 * 0.15915493667125701904296875;
    float _507 = fma(_483, _443, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _509 = fma(_493, _443, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _511 = _459 * 6.283185482025146484375;
    float _513 = sin(_511);
    float _515 = fma(_385, _443, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _517 = fma(_393, _479, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _519 = fma(_497, _479, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _521 = fma(_397, _479, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _523 = _499 * 1.10000002384185791015625;
    float _525 = fma(_469, 0.60000002384185791015625, _453);
    float _527 = _503 * _419;
    float _529 = _425 * 6.283185482025146484375;
    float _531 = sin(_529);
    bool _533 = _471 > 0.0;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _537 = _535 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _539 = _471 >= 0.0;
    bool _541 = isnan(_471);
    bool _543 = _539 || _541;
    bool _545 = isnan(0.0);
    bool _547 = _543 || _545;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _551 = _549 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _553 = _351 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _555 = isnan(_351);
    bool _557 = _553 || _555;
    bool _559 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _561 = _557 || _559;
    float _563 = float(_561);
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _567 = _565 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    int _569 = _547 ? 0 : 1;
    float _571 = _505 * 6.283185482025146484375;
    float _573 = sin(_571);
    float _575 = _523 * 0.15915493667125701904296875;
    float _577 = fma(_513, 0.60000002384185791015625, _489);
    int _579 = ~_569;
    int _581 = _579 + 1;
    int _583 = _581 + 1;
    float _585 = fma(_537, _527, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _587 = fma(_551, _527, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    int _589 = _583;
    if (!_533)
    {
        int _591 = ~_569;
        int _593 = _591 + 1;
        _589 = _593;
    }
    int _595 = _589;
    float _597 = _499 * 0.699999988079071044921875;
    bool _599 = _351 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _601 = isnan(_351);
    bool _603 = _599 || _601;
    bool _605 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _607 = _603 || _605;
    float _609 = float(_607);
    float _611 = _477 * 0.60000002384185791015625;
    float _613 = fma(_567, _527, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _615 = _597 * 0.15915493667125701904296875;
    float _617 = -_563;
    float _619 = _617 + 1.0;
    float _621 = _499 * 0.15915493667125701904296875;
    float _623 = _499 * 0.89999997615814208984375;
    float _625 = fma(_531, 0.300000011920928955078125, _525);
    float _627 = _575 * 6.283185482025146484375;
    float _629 = cos(_627);
    float _631 = _477 * 0.15915493667125701904296875;
    bool _633 = _351 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _635 = isnan(_351);
    bool _637 = _633 || _635;
    bool _639 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _641 = _637 || _639;
    float _643 = float(_641);
    float _645 = _609 * _619;
    bool _647 = _351 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _649 = isnan(_351);
    bool _651 = _647 || _649;
    bool _653 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _655 = _651 || _653;
    float _657 = float(_655);
    float _659 = -_353;
    float _661 = _659 + 1.0;
    float _663 = _623 * 0.15915493667125701904296875;
    float _665 = float(_595);
    float _667 = _631 * 6.283185482025146484375;
    float _669 = sin(_667);
    float _671 = _611 * 0.15915493667125701904296875;
    float _673 = -_609;
    float _675 = _673 + 1.0;
    float _677 = _477 * 1.2999999523162841796875;
    float _679 = _447 * 0.89999997615814208984375;
    float _681 = _447 * 0.15915493667125701904296875;
    float _683 = _643 * _675;
    float _685 = -_643;
    float _687 = _685 + 1.0;
    float _689 = _671 * 6.283185482025146484375;
    float _691 = sin(_689);
    float _693 = _677 * 0.15915493667125701904296875;
    float _695 = fma(_573, 0.300000011920928955078125, _577);
    float _697 = _625 * _661;
    float _699 = -_355;
    float _701 = _699 + 1.0;
    float _703 = _657 * _687;
    float _705 = -_657;
    float _707 = _705 + 1.0;
    float _709 = _697 * 0.52359879016876220703125;
    float _711 = _693 * 6.283185482025146484375;
    float _713 = sin(_711);
    float _715 = in.m_68.y;
    float _717 = _509 * _703;
    float _719 = _507 * _703;
    float _721 = _515 * _703;
    float _723 = abs(_695);
    float _725 = _701 * _723;
    float _727 = fma(_707, (*spvDescriptorSet0.vp_c9)._m0[143].y, _717);
    float _729 = fma(_707, (*spvDescriptorSet0.vp_c9)._m0[143].x, _719);
    float _731 = _663 * 6.283185482025146484375;
    float _733 = sin(_731);
    float _735 = fma(_707, (*spvDescriptorSet0.vp_c9)._m0[143].z, _721);
    float _737 = fma(_587, _683, _727);
    float _739 = fma(_691, 0.60000002384185791015625, _669);
    float _741 = _709 * 0.15915493667125701904296875;
    float _743 = fma(_585, _683, _729);
    float _745 = fma(_613, _683, _735);
    float _747 = _725 * (-20.0);
    float _749 = _621 * 6.283185482025146484375;
    float _751 = sin(_749);
    float _753 = fma(_519, _645, _737);
    float _755 = fma(_713, 0.300000011920928955078125, _739);
    float _757 = _725 * (-45.0);
    float _759 = in.m_70.x;
    float _761 = in.m_70.y;
    float _763 = in.m_70.z;
    float _765 = _665 * _747;
    float _767 = _757 * 0.01745329238474369049072265625;
    float _769 = _615 * 6.283185482025146484375;
    float _771 = cos(_769);
    float _773 = _733 * 0.89999997615814208984375;
    float _775 = _765 * 0.01745329238474369049072265625;
    float _777 = fma(_715, 0.5, 0.5);
    float _779 = _767 * 0.15915493667125701904296875;
    float _781 = fma(_517, _645, _743);
    float _783 = fma(_521, _645, _745);
    float _785 = _777 * _755;
    float _787 = _741 * 6.283185482025146484375;
    float _789 = sin(_787);
    float _791 = -_773;
    float _793 = fma(_751, -1.2000000476837158203125, _791);
    float _795 = _775 * 0.15915493667125701904296875;
    float _797 = fma(_563, (*spvDescriptorSet0.vp_c9)._m0[146].x, _781);
    float _799 = fma(_563, (*spvDescriptorSet0.vp_c9)._m0[146].y, _753);
    float _801 = _679 * 0.15915493667125701904296875;
    float _803 = abs(_793);
    bool _805 = _803 > 0.001000000047497451305389404296875;
    bool _807 = isnan(_803);
    bool _809 = _805 || _807;
    bool _811 = isnan(0.001000000047497451305389404296875);
    bool _813 = _809 || _811;
    float _815 = fma(_563, (*spvDescriptorSet0.vp_c9)._m0[146].z, _783);
    float _817 = _741 * 6.283185482025146484375;
    float _819 = cos(_817);
    float _821 = _771 * 0.699999988079071044921875;
    float _823 = _473 + (-0.0199999995529651641845703125);
    float _825 = _797 * _759;
    float _827 = fma(_629, 1.10000002384185791015625, _821);
    float _829 = _799 * _761;
    float _831 = _779 * 6.283185482025146484375;
    float _833 = sin(_831);
    float _835 = _789 * _471;
    float _837 = abs(_827);
    bool _839 = _837 != 0.0;
    bool _841 = isnan(_837);
    bool _843 = _839 || _841;
    bool _845 = isnan(0.0);
    bool _847 = _843 || _845;
    float _849 = _779 * 6.283185482025146484375;
    float _851 = cos(_849);
    float _853 = -_835;
    float _855 = fma(_819, _475, _853);
    float _857 = _819 * _471;
    float _859 = _815 * _763;
    float _861 = _855 + 0.02999999932944774627685546875;
    float _863 = fma(_789, _475, _857);
    float _865 = _447 * 0.699999988079071044921875;
    float _867 = _795 * 6.283185482025146484375;
    float _869 = sin(_867);
    float _871 = _785 * (*spvDescriptorSet0.vp_c9)._m0[193].x;
    float _873 = _813 ? _793 : 0.001000000047497451305389404296875;
    float _875 = _833 * _861;
    float _877 = fma(_665, -0.100000001490116119384765625, _863);
    float _879 = _871 * 0.01745329238474369049072265625;
    float _881 = abs(_873);
    bool _883 = _881 == 0.0;
    bool _885 = !_847;
    bool _887 = _883 && _885;
    float _889 = _795 * 6.283185482025146484375;
    float _891 = cos(_889);
    float _893 = _879 * 0.15915493667125701904296875;
    float _895 = abs(_873);
    bool _897 = _895 == 0.0;
    float _899 = -_875;
    float _901 = fma(_851, _823, _899);
    float _903 = _851 * _861;
    float _905 = _681 * 6.283185482025146484375;
    float _907 = cos(_905);
    float _909 = _901 * _869;
    int _911 = as_type<int>(_861);
    float _913 = _909;
    float _915 = _753;
    if (_887)
    {
        bool _917 = as_type<int>(_873) >= 0;
        _233 = _917;
    }
    bool _919 = _233;
    int _921 = _919 ? (-1) : 0;
    if (_887)
    {
        int _923 = _919 ? 0 : 1078530011;
        _911 = _923;
    }
    int _925 = _911;
    float _927 = _801 * 6.283185482025146484375;
    float _929 = cos(_927);
    float _931 = _901 * _891;
    float _933 = -_909;
    float _935 = fma(_891, _877, _933);
    int _937 = as_type<int>(_891);
    if (_887)
    {
        int _939 = int(0x80000000) & as_type<int>(_827);
        int _941 = _925 | _939;
        _913 = as_type<float>(_941);
    }
    float _943 = _913;
    float _945 = fma(_869, _877, _931);
    float _947 = _893 * 6.283185482025146484375;
    float _949 = sin(_947);
    float _951 = _893 * 6.283185482025146484375;
    float _953 = cos(_951);
    bool _955 = !_847;
    bool _957 = _955 && _897;
    float _959 = _943;
    float _961 = _943;
    if (!_957)
    {
        float _963 = abs(_827);
        bool _965 = _963 != as_type<float>(0x7f800000u /* inf */);
        bool _967 = isnan(_963);
        bool _969 = _965 || _967;
        bool _971 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _973 = _969 || _971;
        float _975 = abs(_873);
        bool _977 = _975 == as_type<float>(0x7f800000u /* inf */);
        float _979 = abs(_873);
        bool _981 = _979 == as_type<float>(0x7f800000u /* inf */);
        bool _983 = !_973;
        bool _985 = _981 && _983;
        if (_985)
        {
            bool _987 = as_type<int>(_873) >= 0;
            _921 = _987 ? (-1) : 0;
        }
        int _989 = _921;
        if (_985)
        {
            _937 = 1075235812;
        }
        int _991 = _937;
        int _993 = _991;
        if (_985)
        {
            int _995 = ~_989;
            int _997 = (_995 != 0) ? _991 : 1061752795;
            _993 = _997;
        }
        int _999 = _993;
        if (_985)
        {
            int _1001 = int(0x80000000) & as_type<int>(_827);
            int _1003 = _999 | _1001;
            _959 = as_type<float>(_1003);
        }
        float _1005 = _959;
        bool _1007 = !_973;
        bool _1009 = _1007 && _977;
        _961 = _1005;
        if (!_1009)
        {
            float _1011 = abs(_827);
            float _1013 = abs(_873);
            float _1015 = precise::max(_1011, _1013);
            float _1017 = abs(_827);
            float _1019 = abs(_873);
            float _1021 = precise::min(_1017, _1019);
            float _1023 = 1.0 / _1015;
            float _1025 = abs(_827);
            float _1027 = abs(_873);
            bool _1029 = _1025 > _1027;
            bool _1031 = as_type<int>(_873) >= 0;
            float _1033 = abs(_827);
            float _1035 = abs(_873);
            float _1037 = _1033 + _1035;
            int _1039 = as_type<int>(_827) & int(0x80000000);
            bool _1041 = _1037 > as_type<float>(0x7f800000u /* inf */);
            bool _1043 = isnan(_1037);
            bool _1045 = _1041 || _1043;
            bool _1047 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1049 = _1045 || _1047;
            float _1051 = _1021 * _1023;
            float _1053 = _1051 * _1051;
            float _1055 = _1053 + 11.33538818359375;
            float _1057 = fma(_1053, _1055, 28.84246826171875);
            float _1059 = fma(_1053, _1057, 19.6966705322265625);
            float _1061 = fma(_1053, -0.82336294651031494140625, -5.674867153167724609375);
            float _1063 = fma(_1053, _1061, -6.565555095672607421875);
            float _1065 = 1.0 / _1059;
            float _1067 = _1053 * _1063;
            float _1069 = _1051 * _1067;
            float _1071 = fma(_1069, _1065, _1051);
            float _1073 = _1071;
            _961 = _1037;
            if (_1029)
            {
                float _1075 = -_1071;
                float _1077 = _1075 + 1.57079637050628662109375;
                _1073 = _1077;
            }
            float _1079 = _1073;
            int _1081 = as_type<int>(_1079);
            if (!_1031)
            {
                float _1083 = -_1079;
                float _1085 = _1083 + 3.1415927410125732421875;
                _1081 = as_type<int>(_1085);
            }
            int _1087 = _1081;
            if (!_1049)
            {
                int _1089 = _1039 | _1087;
                _961 = as_type<float>(_1089);
            }
        }
    }
    float _1091 = _961;
    float _1093 = _945 + 0.0199999995529651641845703125;
    float _1095 = fma(_665, 0.100000001490116119384765625, _935);
    float _1097 = _1091 + 1.57079637050628662109375;
    float _1099 = in.m_62.z;
    float _1101 = _1093 * _949;
    float _1103 = fma(_833, _823, _903);
    float _1105 = _1093 * _953;
    float _1107 = _1097 * (-0.15915493667125701904296875);
    float _1109 = -_1101;
    float _1111 = fma(_1095, _953, _1109);
    float _1113 = _1103 + (-0.02999999932944774627685546875);
    float _1115 = fma(_1095, _949, _1105);
    float _1117 = _447 * 1.10000002384185791015625;
    float _1119 = fma(_625, (*spvDescriptorSet0.vp_c9)._m0[194].x, _1111);
    float _1121 = in.m_58.w;
    float _1123 = _859 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1125 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1113);
    float _1127 = _829 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1129 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1115);
    float _1131 = _825 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1133 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1119);
    float _1135 = in.m_60.w;
    float _1137 = _1107 * 6.283185482025146484375;
    float _1139 = cos(_1137);
    float _1141 = _1123 * _1125;
    float _1143 = _1127 * _1129;
    float _1145 = _1131 * _1133;
    float _1147 = _865 * 0.15915493667125701904296875;
    float _1149 = _1141 * _311;
    float _1151 = _1117 * 0.15915493667125701904296875;
    float _1153 = _1141 * _315;
    float _1155 = _1107 * 6.283185482025146484375;
    float _1157 = sin(_1155);
    float _1159 = fma(_1145, _279, _1149);
    float _1161 = _1099 * 6.283185482025146484375;
    float _1163 = fma(_1145, _283, _1153);
    float _1165 = fma(_177, _365, _411);
    float _1167 = -_1143;
    float _1169 = fma(_1167, _323, _1159);
    float _1171 = _1161 * 0.15915493667125701904296875;
    float _1173 = -_1143;
    float _1175 = fma(_1173, _327, _1163);
    float _1177 = _1147 * 6.283185482025146484375;
    float _1179 = sin(_1177);
    float _1181 = _1169 * _1139;
    float _1183 = fma(_183, _365, _427);
    float _1185 = _1165 + _1121;
    float _1187 = fma(_907, 1.2000000476837158203125, _929);
    float _1189 = _185 * 3.3333332538604736328125;
    float _1191 = _1183 + _1135;
    float _1193 = _1151 * 6.283185482025146484375;
    float _1195 = sin(_1193);
    float _1197 = _1169 * _1157;
    float _1199 = fma(_1175, _1157, _1181);
    float _1201 = -_1197;
    float _1203 = fma(_1175, _1139, _1201);
    float _1205 = _1185 + _1199;
    float _1207 = _1171 * 6.283185482025146484375;
    float _1209 = sin(_1207);
    float _1211 = _1191 + _1203;
    float _1213 = fma(_1187, (*spvDescriptorSet0.vp_c9)._m0[191].z, _1205);
    float _1215 = in.m_72.y;
    float _1217 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1219 = _1213 + _1217;
    float _1221 = _1171 * 6.283185482025146484375;
    float _1223 = cos(_1221);
    float _1225 = _1179 + _1195;
    float _1227 = fma(_1225, (*spvDescriptorSet0.vp_c9)._m0[191].z, _1211);
    float _1229 = _1209 * _1219;
    float _1231 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1233 = _1227 + _1231;
    float _1235 = _1223 * _1219;
    float _1237 = -_1229;
    float _1239 = fma(_1223, _1233, _1237);
    float _1241 = fma(_1209, _1233, _1235);
    float _1243 = _1239 + (*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1245 = _1241 + (*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1247 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1249 = _1243 + _1247;
    float _1251 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1253 = _1245 + _1251;
    float _1255 = _1249 * _1249;
    float _1257 = fma(_1253, _1253, _1255);
    float _1259 = sqrt(_1257);
    bool _1261 = _1259 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1263 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1265 = _1259 + _1263;
    float _1267 = 0.0 + _1189;
    float _1269 = precise::clamp(_1267, 0.0, 1.0);
    float _1271 = -_1189;
    float _1273 = _1271 + 3.3333332538604736328125;
    float _1275 = precise::clamp(_1273, 0.0, 1.0);
    float _1277 = precise::min(_1269, _1275);
    float _1279 = _517;
    if (_1261)
    {
        float _1281 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1279 = _1281;
    }
    float _1283 = _1279;
    float _1285 = _1283;
    if (_1261)
    {
        float _1287 = _1265 * _1283;
        _1285 = _1287;
    }
    float _1289 = _1285;
    float _1291 = _1141 * _301;
    float _1293 = _363 + _1215;
    float _1295 = -(*spvDescriptorSet0.vp_c9)._m0[192].w;
    float _1297 = _1295 + 1.0;
    float _1299 = _1289;
    float _1301 = _1297;
    float _1303 = _1215;
    if (_1261)
    {
        float _1305 = _1289 * 0.15915493667125701904296875;
        _1299 = _1305;
    }
    float _1307 = _1299;
    float _1309 = fma(_1145, _275, _1291);
    float _1311 = _1227;
    if (_1261)
    {
        float _1313 = _1307 * 6.283185482025146484375;
        float _1315 = sin(_1313);
        _1311 = _1315;
    }
    float _1317 = _1311;
    float _1319 = -_1143;
    float _1321 = fma(_1319, _319, _1309);
    float _1323 = fma(_1277, -5.0, 5.0);
    float _1325 = _1293 + _1321;
    float _1327 = 5.0;
    float _1329 = _1323;
    if (_1261)
    {
        float _1331 = rsqrt(_1257);
        _1327 = _1331;
    }
    float _1333 = _1327;
    float _1335 = -_1323;
    float _1337 = fma(_1335, _1297, _1325);
    float _1339 = _1337;
    if (!_1261)
    {
        _1329 = _1245;
    }
    float _1341 = _1329;
    float _1343 = _1341;
    if (_1261)
    {
        float _1345 = _1337 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1301 = _1345;
    }
    float _1347 = _1301;
    float _1349 = _1317;
    if (_1261)
    {
        float _1351 = fma(_1317, _1347, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1303 = _1351;
    }
    float _1353 = _1303;
    if (!_1261)
    {
        _1349 = _1243;
    }
    float _1355 = _1349;
    float _1357 = _1333;
    float _1359 = _1355;
    if (_1261)
    {
        float _1361 = _1333 * _1353;
        _1357 = _1361;
    }
    float _1363 = _1357;
    if (_1261)
    {
        float _1365 = fma(_1253, _1363, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1343 = _1365;
    }
    float _1367 = _1343;
    if (_1261)
    {
        float _1369 = fma(_1249, _1363, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1359 = _1369;
    }
    float _1371 = _1359;
    float _1373 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1375 = _1367 + _1373;
    float _1377 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1379 = _1371 + _1377;
    float _1381 = fma(_1375, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1383 = fma(_1379, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _4549 = float2(_1381, _1383);
    float _1385 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_4549, float2(0.0), isnan(_4549)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_4549, float2(0.0), isnan(_4549)), level(0.0)).x;
    float _1387 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _1389 = fma(_1385, 100.0, _1293);
    float _1391 = _1389 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1393 = fma(_1185, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1391);
    float _1395 = fma(_1191, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1393);
    float _1397 = _1389 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1399 = _1389 + _1387;
    float _1401 = _1395 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1403 = fma(_1185, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1397);
    float _1405 = 1.0 / _1401;
    float _1407 = fma(_1191, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1403);
    float _1409 = _1407 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1411 = _1409 + _1401;
    float _1413 = _1411 * _1405;
    float _1415 = _1413 * 0.5;
    float _1417 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1419 = fma(_1415, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1417);
    float _1421 = 1.0 / _1419;
    float _1423 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1425 = _1421 * _1423;
    bool _1427 = _1425 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1429 = _1425 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1431 = !_1427;
    int _1433 = _1431 ? 0 : 1;
    int _1435 = 2;
    if (!_1427)
    {
        _1435 = 1;
    }
    int _1437 = _1435;
    int _1439 = _1437;
    if (!_1429)
    {
        _1439 = _1433;
    }
    int _1441 = _1439;
    int _1443 = _1441 << 6;
    int _1445 = _1443 + 96;
    uint _1448 = uint(int(uint(_1445) >> uint(2)));
    uint _1450 = uint(int(uint(int(_1448)) >> uint(2)));
    int _1452 = int(_1448) & 3;
    float _1454 = (*spvDescriptorSet0.vp_c15)._m0[int(_1450)][_1452];
    int _1456 = int(_1448) + 1;
    uint _1458 = uint(int(uint(_1456) >> uint(2)));
    int _1460 = _1456 & 3;
    float _1462 = (*spvDescriptorSet0.vp_c15)._m0[int(_1458)][_1460];
    int _1464 = _1443 + 104;
    uint _1466 = uint(int(uint(_1464) >> uint(2)));
    uint _1468 = uint(int(uint(int(_1466)) >> uint(2)));
    int _1470 = int(_1466) & 3;
    float _1472 = (*spvDescriptorSet0.vp_c15)._m0[int(_1468)][_1470];
    int _1474 = int(_1466) + 1;
    uint _1476 = uint(int(uint(_1474) >> uint(2)));
    int _1478 = _1474 & 3;
    float _1480 = (*spvDescriptorSet0.vp_c15)._m0[int(_1476)][_1478];
    int _1482 = _1443 + 48;
    uint _1484 = uint(int(uint(_1482) >> uint(2)));
    uint _1486 = uint(int(uint(int(_1484)) >> uint(2)));
    int _1488 = int(_1484) & 3;
    float _1490 = (*spvDescriptorSet0.vp_c15)._m0[int(_1486)][_1488];
    int _1492 = int(_1484) + 1;
    uint _1494 = uint(int(uint(_1492) >> uint(2)));
    int _1496 = _1492 & 3;
    float _1498 = (*spvDescriptorSet0.vp_c15)._m0[int(_1494)][_1496];
    int _1500 = _1443 + 64;
    uint _1502 = uint(int(uint(_1500) >> uint(2)));
    uint _1504 = uint(int(uint(int(_1502)) >> uint(2)));
    int _1506 = int(_1502) & 3;
    float _1508 = (*spvDescriptorSet0.vp_c15)._m0[int(_1504)][_1506];
    int _1510 = int(_1502) + 1;
    uint _1512 = uint(int(uint(_1510) >> uint(2)));
    int _1514 = _1510 & 3;
    float _1516 = (*spvDescriptorSet0.vp_c15)._m0[int(_1512)][_1514];
    int _1518 = _1443 + 56;
    uint _1520 = uint(int(uint(_1518) >> uint(2)));
    uint _1522 = uint(int(uint(int(_1520)) >> uint(2)));
    int _1524 = int(_1520) & 3;
    float _1526 = (*spvDescriptorSet0.vp_c15)._m0[int(_1522)][_1524];
    int _1528 = int(_1520) + 1;
    uint _1530 = uint(int(uint(_1528) >> uint(2)));
    int _1532 = _1528 & 3;
    float _1534 = (*spvDescriptorSet0.vp_c15)._m0[int(_1530)][_1532];
    int _1536 = _1443 + 72;
    uint _1538 = uint(int(uint(_1536) >> uint(2)));
    uint _1540 = uint(int(uint(int(_1538)) >> uint(2)));
    int _1542 = int(_1538) & 3;
    float _1544 = (*spvDescriptorSet0.vp_c15)._m0[int(_1540)][_1542];
    int _1546 = int(_1538) + 1;
    uint _1548 = uint(int(uint(_1546) >> uint(2)));
    int _1550 = _1546 & 3;
    float _1552 = (*spvDescriptorSet0.vp_c15)._m0[int(_1548)][_1550];
    float _1554 = _1399 * _1462;
    float _1556 = fma(_1185, _1454, _1554);
    float _1558 = fma(_1191, _1472, _1556);
    float _1560 = _1558 + _1480;
    int _1562 = _1443 + 80;
    uint _1564 = uint(int(uint(_1562) >> uint(2)));
    uint _1566 = uint(int(uint(int(_1564)) >> uint(2)));
    int _1568 = int(_1564) & 3;
    float _1570 = (*spvDescriptorSet0.vp_c15)._m0[int(_1566)][_1568];
    int _1572 = int(_1564) + 1;
    uint _1574 = uint(int(uint(_1572) >> uint(2)));
    int _1576 = _1572 & 3;
    float _1578 = (*spvDescriptorSet0.vp_c15)._m0[int(_1574)][_1576];
    float _1580 = _1399 * _1498;
    float _1582 = 1.0 / _1560;
    float _1584 = fma(_1185, _1490, _1580);
    int _1586 = _1443 + 88;
    uint _1588 = uint(int(uint(_1586) >> uint(2)));
    uint _1590 = uint(int(uint(int(_1588)) >> uint(2)));
    int _1592 = int(_1588) & 3;
    float _1594 = (*spvDescriptorSet0.vp_c15)._m0[int(_1590)][_1592];
    int _1596 = int(_1588) + 1;
    uint _1598 = uint(int(uint(_1596) >> uint(2)));
    int _1600 = _1596 & 3;
    float _1602 = (*spvDescriptorSet0.vp_c15)._m0[int(_1598)][_1600];
    float _1604 = _1399 * _1516;
    float _1606 = fma(_1185, _1508, _1604);
    float _1608 = fma(_1191, _1526, _1584);
    float _1610 = _1608 + _1534;
    float _1612 = fma(_1191, _1544, _1606);
    float _1614 = _1610 * _1582;
    float _1616 = fma(_1185, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1618 = _1612 + _1552;
    bool _1620 = _1614 >= 0.0;
    float _1622 = fma(_1191, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1624 = _1618 * _1582;
    bool _1626 = _1614 <= 1.0;
    bool _1628 = _1626 && _1620;
    float _1630 = floor(_1622);
    bool _1632 = _1624 >= 0.0;
    bool _1634 = _1632 && _1628;
    bool _1636 = _1624 <= 1.0;
    bool _1638 = _1636 && _1634;
    float _1640 = floor(_1616);
    float _1642 = _1399 * _1578;
    float _1644 = fma(_1185, _1570, _1642);
    float _1646 = -_1630;
    float _1648 = _1622 + _1646;
    float _1650 = fma(_1191, _1594, _1644);
    float _1652 = _1584;
    if (_1638)
    {
        float _1654 = float(_1441);
        _1652 = _1654;
    }
    float _1656 = _1652;
    float _1658 = _1650 + _1602;
    float _1660 = -_1640;
    float _1662 = _1616 + _1660;
    float _1664 = _1656;
    if (_1638)
    {
        float _1666 = rint(_1656);
        float _1668 = precise::max(_1666, 0.0);
        uint _1670 = uint(_1668);
        uint _1672 = clamp(_1670, 0u, 65535u);
        _1664 = as_type<float>(_1672);
    }
    float _1674 = _1664;
    float _1676 = _1658 * _1582;
    float2 _5044 = float2(_1662, _1648);
    float _1678 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5044, float2(0.0), isnan(_5044)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5044, float2(0.0), isnan(_5044)), level(0.0)).x;
    float _1680 = _1624;
    if (_1638)
    {
        float3 _5059 = float3(_1614, _1624, float(as_type<int>(_1674)));
        float3 _5063 = select(_5059, float3(0.0), isnan(_5059));
        float _1682 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5063.xy, uint(rint(_5063.z)), _1676, level(0.0));
        _1680 = _1682;
    }
    float _1684 = _1680;
    float _1686 = in.m_62.w;
    bool _1688 = _1115 != 0.0;
    bool _1690 = isnan(_1115);
    bool _1692 = _1688 || _1690;
    bool _1694 = isnan(0.0);
    bool _1696 = _1692 || _1694;
    float _1698 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _1700 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1702 = _1700 != 0;
    float _1704 = in.m_68.x;
    bool _1706 = _1119 == 0.0;
    bool _1708 = !_1696;
    bool _1710 = _1706 && _1708;
    int _1712 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1714 = _1712 != 0;
    float _1716 = in.m_74.x;
    float _1718 = in.m_74.y;
    float _1720 = in.m_74.z;
    float _1722 = in.m_74.w;
    bool _1724 = _1103 == 0.02999999932944774627685546875;
    bool _1726 = _1724 && _1710;
    float _1728 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1730 = _1552;
    if (_1702)
    {
        float _1732 = in.m_62.z;
        _1730 = _1732;
    }
    float _1734 = _1730;
    float _1736 = -_715;
    float _1738 = _1736 + 1.0;
    float _1740 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1742 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1744 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1746 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _1748 = _1686 > 0.5;
    float _1750 = _1740 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1752 = _1742 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1754 = _1744 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1756 = _1704;
    float _1758 = _1752;
    if (_1702)
    {
        _915 = _1704;
    }
    float _1760 = _915;
    int _1762 = _1748 ? as_type<int>(_1738) : as_type<int>(_715);
    float _1764 = _315 * _1720;
    float _1766 = _301 * _1720;
    float _1768 = _1714 ? as_type<float>(_1762) : _715;
    float _1770 = _311 * _1720;
    float _1772 = fma(_283, _1716, _1764);
    float _1774 = fma(_275, _1716, _1766);
    out.m_76.x = _1750;
    out.m_76.y = _1752;
    out.m_76.z = _1754;
    out.m_76.w = _1746;
    float _1776 = fma(_279, _1716, _1770);
    bool _1778 = _1734 > 0.5;
    bool _1780 = _1778 && _1702;
    float _1782 = _1768 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1784 = in.m_78.x;
    float _1786 = in.m_78.y;
    float _1788 = in.m_78.z;
    float _1790 = -_1718;
    float _1792 = fma(_323, _1790, _1776);
    float _1794 = -_1718;
    float _1796 = fma(_319, _1794, _1774);
    float _1798 = -_1718;
    float _1800 = fma(_327, _1798, _1772);
    float _1802 = _1782 * _1728;
    out.m_80.x = _1792;
    out.m_80.y = _1796;
    out.m_80.z = _1800;
    float _1804 = _1760;
    float _1806 = _1764;
    float _1808 = _1768;
    float _1810 = _1722;
    if (_1780)
    {
        float _1812 = -_1760;
        float _1814 = _1812 + 1.0;
        _1804 = _1814;
    }
    float _1816 = _1804;
    if (_1702)
    {
        _1756 = _1816;
    }
    float _1818 = _1756;
    float _1820 = _1796;
    float _1822 = _1818;
    if (_1261)
    {
        float _1824 = _1307 * 6.283185482025146484375;
        float _1826 = cos(_1824);
        _1820 = _1826;
    }
    float _1828 = _1820;
    float _1830 = _1818 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1832 = _1784;
    if (_1726)
    {
        _1806 = _1784;
    }
    float _1834 = _1806;
    float _1836 = _1830 * _1698;
    float _1838 = _1834;
    if (_1726)
    {
        _1822 = _1786;
    }
    float _1840 = _1822;
    float _1842 = _1840;
    if (_1726)
    {
        _1808 = _1834;
    }
    float _1844 = _1808;
    float _1846 = _1844;
    if (!_1726)
    {
        _1838 = _1784;
    }
    float _1848 = _1838;
    out.m_82.z = _1836;
    out.m_82.w = _1802;
    if (_1726)
    {
        _1758 = _1840;
    }
    float _1850 = _1758;
    float _1852 = _1850;
    if (!_1726)
    {
        _1842 = _1786;
    }
    float _1854 = _1842;
    float _1856 = _1720 * _1848;
    if (_1726)
    {
        _1832 = _1788;
    }
    float _1858 = _1832;
    float _1860 = _1718 * _1788;
    float _1862 = _1858;
    if (!_1726)
    {
        float _1864 = fma(_1113, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1788);
        _1862 = _1864;
    }
    float _1866 = _1862;
    float _1868 = -_1856;
    float _1870 = fma(_1716, _1788, _1868);
    float _1872 = _1716 * _1854;
    if (!_1726)
    {
        float _1874 = fma(_1119, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1848);
        _1846 = _1874;
    }
    float _1876 = _1846;
    float _1878 = _311 * _1866;
    float _1880 = _301 * _1866;
    float _1882 = -_1872;
    float _1884 = fma(_1718, _1848, _1882);
    float _1886 = -_1860;
    float _1888 = fma(_1720, _1854, _1886);
    float _1890 = _315 * _1866;
    if (!_1726)
    {
        float _1892 = fma(_1115, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1854);
        _1852 = _1892;
    }
    float _1894 = _1852;
    float _1896 = _1884 * _1722;
    float _1898 = fma(_279, _1876, _1878);
    float _1900 = fma(_283, _1876, _1890);
    float _1902 = _1888 * _1722;
    float _1904 = _1896 * _311;
    float _1906 = _1870 * _1722;
    float _1908 = _1896 * _301;
    float _1910 = _1896 * _315;
    float _1912 = -_1894;
    float _1914 = fma(_323, _1912, _1898);
    float _1916 = _1914;
    if (_1261)
    {
        float _1918 = _1828 + (-1.0);
        _1810 = _1918;
    }
    float _1920 = _1810;
    float _1922 = fma(_275, _1876, _1880);
    float _1924 = fma(_1902, _279, _1904);
    float _1926 = fma(_1902, _275, _1908);
    float _1928 = fma(_1902, _283, _1910);
    float _1930 = -_1894;
    float _1932 = fma(_327, _1930, _1900);
    float _1934 = _1914 * _1139;
    float _1936 = _1914 * _1157;
    float _1938 = in.m_64.w;
    if (_1261)
    {
        float _1940 = _1920 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1916 = _1940;
    }
    float _1942 = _1916;
    float _1944 = -_1906;
    float _1946 = fma(_1944, _323, _1924);
    float _1948 = -_1906;
    float _1950 = fma(_1948, _327, _1928);
    float _1952 = fma(_1932, _1157, _1934);
    float _1954 = -_1906;
    float _1956 = fma(_1954, _319, _1926);
    if (_1261)
    {
        float _1958 = fma(_1337, _1828, _1942);
        _1339 = _1958;
    }
    float _1960 = _1339;
    float _1962 = -_1936;
    float _1964 = fma(_1932, _1139, _1962);
    float _1966 = _1209 * _1952;
    float _1968 = _1223 * _1952;
    out.m_84.x = _1946;
    out.m_84.y = _1956;
    out.m_84.z = _1950;
    float _1970 = fma(_1385, 100.0, _1960);
    float _1972 = _1399 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1974 = abs(_1425);
    float _1976 = log2(_1974);
    float _1978 = fma(_1209, _1964, _1968);
    float _1980 = _1970 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1982 = fma(_1185, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1972);
    float _1984 = -_1966;
    float _1986 = fma(_1223, _1964, _1984);
    float _1988 = _1970 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1990 = -_1894;
    float _1992 = fma(_319, _1990, _1922);
    float _1994 = _1970 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1996 = _1970 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1998 = _1399 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2000 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1980);
    float _2002 = fma(_1191, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1982);
    float _2004 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1988);
    float _2006 = fma(_1185, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1998);
    out.m_86.w = _1938;
    float _2008 = _2002 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _2010 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2004);
    float _2012 = fma(_1191, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2006);
    float _2014 = _1976 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2016 = trunc(_2008);
    int _2018 = int(_2016);
    float _2020 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1994);
    float _2022 = _2012 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _2024 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2000);
    float _2026 = _2010 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2028 = fma(_1367, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1996);
    float _2030 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2020);
    float _2032 = _2024 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2034 = trunc(_2022);
    int _2036 = int(_2034);
    float _2038 = _2026 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2040 = _2026 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2042 = fma(_1371, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2028);
    float _2044 = _2030 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2046 = _2026 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2048 = _2026 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2050 = fma(_2032, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2038);
    float _2052 = exp2(_2014);
    float _2054 = fma(_2032, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2040);
    float _2056 = fma(_2032, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2046);
    float _2058 = fma(_2032, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2048);
    float _2060 = _2042 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2062 = fma(_2044, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2050);
    float _2064 = fma(_2044, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2054);
    int _2066 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2068 = _2018 + _2066;
    int _2070 = _2068 + 1;
    float _2072 = fma(_2044, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2056);
    int _2074 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2076 = _2036 + _2074;
    int _2078 = _2076 + 1;
    float _2080 = fma(_2044, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2058);
    float _2082 = fma(_2060, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2062);
    float _2084 = fma(_2060, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2064);
    bool _2086 = _2070 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _2088 = fma(_2060, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2080);
    int _2090 = _2070 | _2078;
    float _2092 = fma(_2052, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2094 = precise::clamp(_2092, 0.0, 1.0);
    float _2096 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2098 = _1970 + _2096;
    bool _2100 = _2090 < 0;
    bool _2102 = _2100 || _2086;
    float _2104 = fma(_2060, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2072);
    bool _2106 = _1425 <= 8000.0;
    bool _2108 = isnan(_1425);
    bool _2110 = _2106 || _2108;
    bool _2112 = isnan(8000.0);
    bool _2114 = _2110 || _2112;
    float _2116 = float(_2114);
    float _2118 = fma(_2094, -2.0, 3.0);
    float _2120 = _2094 * _2094;
    bool _2122 = _2078 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2124 = _2122 || _2102;
    float _2126 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2128 = _1367 + _2126;
    float _2130 = _2098 * _2098;
    float _2132 = _2120 * _2118;
    out.gl_Position.x = _2104;
    out.gl_Position.y = _2082;
    out.gl_Position.z = _2084;
    out.gl_Position.w = _2088;
    float _2134 = fma(_2128, _2128, _2130);
    float _2136 = -_2132;
    float _2138 = _2136 + 1.0;
    float _2140 = fma(_2138, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2132);
    float _2142 = _2116 * _2140;
    float _2144 = _2104;
    float _2146 = _2082;
    float _2148 = _2088;
    float _2150 = _2142;
    float _2152 = _2022;
    if (_2124)
    {
        _2144 = 1.0;
    }
    float _2154 = _2144;
    float _2156 = _2154;
    if (!_2124)
    {
        int _2158 = _2078 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2160 = _2158 + _2070;
        float _2162 = floor(_2022);
        int _2164 = _2160 << 2;
        uint _2166 = uint(int(uint(_2160) >> uint(2)));
        int _2168 = 12 & _2164;
        int _2170 = int(_2166) << 4;
        int _2172 = _2170 + _2168;
        float _2174 = floor(_2008);
        float _2176 = -_2162;
        float _2178 = _2022 + _2176;
        int _2180 = _2172 + 400;
        uint _2182 = uint(int(uint(_2180) >> uint(2)));
        uint _2184 = uint(int(uint(int(_2182)) >> uint(2)));
        int _2186 = int(_2182) & 3;
        float _2188 = (*spvDescriptorSet0.vp_c15)._m0[int(_2184)][_2186];
        float _2190 = -_2174;
        float _2192 = _2008 + _2190;
        float _2194 = rint(_2188);
        float _2196 = precise::max(_2194, 0.0);
        uint _2198 = uint(_2196);
        uint _2200 = clamp(_2198, 0u, 65535u);
        float3 _5964 = float3(_2192, _2178, float(int(_2200)));
        float3 _5966 = select(_5964, float3(0.0), isnan(_5964));
        float _2202 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5966.xy, uint(rint(_5966.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5966.xy, uint(rint(_5966.z)), level(0.0)).x;
        int _2204 = _2160 << 4;
        int _2206 = _2204 + 2048;
        uint _2208 = uint(int(uint(_2206) >> uint(2)));
        uint _2210 = uint(int(uint(int(_2208)) >> uint(2)));
        int _2212 = int(_2208) & 3;
        float _2214 = (*spvDescriptorSet0.vp_c15)._m0[int(_2210)][_2212];
        int _2216 = int(_2208) + 1;
        uint _2218 = uint(int(uint(_2216) >> uint(2)));
        int _2220 = _2216 & 3;
        float _2222 = (*spvDescriptorSet0.vp_c15)._m0[int(_2218)][_2220];
        int _2224 = _2206 + 8;
        uint _2226 = uint(int(uint(_2224) >> uint(2)));
        uint _2228 = uint(int(uint(int(_2226)) >> uint(2)));
        int _2230 = int(_2226) & 3;
        float _2232 = (*spvDescriptorSet0.vp_c15)._m0[int(_2228)][_2230];
        int _2234 = int(_2226) + 1;
        uint _2236 = uint(int(uint(_2234) >> uint(2)));
        int _2238 = _2234 & 3;
        float _2240 = (*spvDescriptorSet0.vp_c15)._m0[int(_2236)][_2238];
        float _2242 = _1399 * _2222;
        float _2244 = fma(_1185, _2214, _2242);
        float _2246 = fma(_1191, _2232, _2244);
        float _2248 = _2246 + _2240;
        float _2250 = precise::clamp(_2248, 0.0, 1.0);
        float _2252 = -_2250;
        float _2254 = _2252 + _2202;
        float _2256 = fma(_2254, 500.0, 1.5);
        float _2258 = exp2(_2256);
        float _2260 = 0.0 + _2258;
        float _2262 = precise::clamp(_2260, 0.0, 1.0);
        _2146 = _2188;
        _2156 = _2262;
        _2148 = _2202;
    }
    float _2264 = _2146;
    float _2266 = _2156;
    float _2268 = _2148;
    float _2270 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2272 = _1371 + _2270;
    float _2274 = _2142 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2276 = -_1678;
    float _2278 = _2276 + 1.0;
    float _2280 = _2264;
    float _2282 = _2268;
    if (!_1638)
    {
        _2280 = 1.0;
    }
    float _2284 = _2280;
    float _2286 = fma(_2272, _2272, _2134);
    float _2288 = _2284;
    if (_1638)
    {
        bool _2290 = _1684 >= _1676;
        bool _2292 = isnan(_1684);
        bool _2294 = _2290 || _2292;
        bool _2296 = isnan(_1676);
        bool _2298 = _2294 || _2296;
        float _2300 = float(_2298);
        _2288 = _2300;
    }
    float _2302 = _2288;
    float _2304 = _2278 * _2274;
    float _2306 = precise::clamp(_2304, 0.0, 1.0);
    out.m_88.x = _1978;
    out.m_88.y = _1992;
    out.m_88.z = _1986;
    float _2308 = _2302 * _2266;
    float _2310 = sqrt(_2286);
    float _2312 = -_2306;
    float _2314 = fma(_2312, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_90.x = _1367;
    out.m_90.y = _1970;
    out.m_90.z = _1371;
    float _2316 = -_2308;
    float _2318 = fma(_2316, _2314, 1.0);
    float _2320 = precise::clamp(_2318, 0.0, 1.0);
    float _2322 = _2320 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_92.x = _2322;
    bool _2324 = _2310 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2326 = isnan(_2310);
    bool _2328 = _2324 || _2326;
    bool _2330 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2332 = _2328 || _2330;
    float _2334 = _2306;
    float _2336 = _2314;
    float _2338 = _2320;
    if (!_2332)
    {
        _2150 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2340 = _2150;
    float _2342 = _2340;
    float _2344 = _2340;
    if (!_2332)
    {
        _2152 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2346 = _2152;
    float _2348 = _2346;
    float _2350 = _2346;
    if (!_2332)
    {
        _2282 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2352 = _2282;
    float _2354 = _2352;
    float _2356 = _2352;
    if (!_2332)
    {
        _2334 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2358 = _2334;
    float _2360 = _2358;
    float _2362 = _2358;
    if (!_2332)
    {
        _2336 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2364 = _2336;
    float _2366 = _2364;
    float _2368 = _2364;
    if (!_2332)
    {
        _2338 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2370 = _2338;
    bool _2372 = !_2332;
    float _2374 = _2370;
    float _2376 = _2370;
    if (!_2372)
    {
        bool _2378 = _2310 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2380 = isnan(_2310);
        bool _2382 = _2378 || _2380;
        bool _2384 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2386 = _2382 || _2384;
        if (!_2386)
        {
            float _2388 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2390 = _2310 + _2388;
            float _2392 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2394 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2392;
            float _2396 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2398 = _2396 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2400 = 1.0 / _2394;
            float _2402 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2404 = _2402 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2406 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2408 = _2406 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2410 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2412 = _2410 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2414 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2416 = _2414 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2418 = _2390 * _2400;
            float _2420 = precise::clamp(_2418, 0.0, 1.0);
            float _2422 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2424 = _2422 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2426 = fma(_2420, _2398, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2428 = fma(_2420, _2424, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2430 = fma(_2420, _2404, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2432 = fma(_2420, _2408, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2434 = fma(_2420, _2412, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2436 = fma(_2420, _2416, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2350 = _2426;
            _2368 = _2434;
            _2344 = _2430;
            _2362 = _2432;
            _2356 = _2428;
            _2376 = _2436;
            _2438 = true;
        }
        else
        {
            bool _2440 = _2310 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2442 = isnan(_2310);
            bool _2444 = _2440 || _2442;
            bool _2446 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2448 = _2444 || _2446;
            if (!_2448)
            {
                _2342 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2450 = _2342;
            _2344 = _2450;
            if (!_2448)
            {
                _2348 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2452 = _2348;
            _2350 = _2452;
            if (!_2448)
            {
                _2354 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2454 = _2354;
            _2356 = _2454;
            if (!_2448)
            {
                _2360 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2456 = _2360;
            _2362 = _2456;
            if (!_2448)
            {
                _2366 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2458 = _2366;
            _2368 = _2458;
            if (!_2448)
            {
                _2374 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2460 = _2374;
            bool _2462 = !_2448;
            _2376 = _2460;
            if (!_2462)
            {
                bool _2464 = _2310 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2466 = isnan(_2310);
                bool _2468 = _2464 || _2466;
                bool _2470 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2472 = _2468 || _2470;
                if (!_2472)
                {
                    float _2474 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2476 = _2310 + _2474;
                    float _2478 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2480 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2478;
                    float _2482 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2484 = _2482 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2486 = 1.0 / _2480;
                    float _2488 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2490 = _2488 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2492 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2494 = _2492 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2496 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2498 = _2496 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2500 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2502 = _2500 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2504 = _2476 * _2486;
                    float _2506 = precise::clamp(_2504, 0.0, 1.0);
                    float _2508 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2510 = _2508 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2512 = fma(_2506, _2484, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2514 = fma(_2506, _2510, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2516 = fma(_2506, _2490, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2518 = fma(_2506, _2494, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2520 = fma(_2506, _2498, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2522 = fma(_2506, _2502, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2350 = _2512;
                    _2368 = _2520;
                    _2344 = _2516;
                    _2362 = _2518;
                    _2356 = _2514;
                    _2376 = _2522;
                    _2438 = true;
                }
                else
                {
                    _2350 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2368 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2344 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2362 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2356 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2376 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2438 = false;
    float _2524 = _2350;
    float _2526 = _2368;
    float _2528 = _2344;
    float _2530 = _2362;
    float _2532 = _2356;
    float _2534 = _2376;
    float _2536 = fma(_1992, -0.5, 0.5);
    float _2538 = precise::clamp(_2536, 0.0, 1.0);
    float _2540 = -_2524;
    float _2542 = _2540 + _2526;
    float _2544 = -_2528;
    float _2546 = _2544 + _2530;
    float _2548 = -_2532;
    float _2550 = _2548 + _2534;
    bool _2552 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2554 = fma(_2538, _2542, _2524);
    float _2556 = fma(_2538, _2546, _2528);
    float _2558 = fma(_2538, _2550, _2532);
    float _2560 = _2554 * 0.586610972881317138671875;
    out.m_52.x = 1.0;
    float _2562 = fma(_2556, 0.298911988735198974609375, _2560);
    float _2564 = fma(_2558, 0.114477999508380889892578125, _2562);
    out.m_94.x = 0.0;
    float _2566 = -_2564;
    float _2568 = _2556 + _2566;
    float _2570 = -_2564;
    float _2572 = _2554 + _2570;
    float _2574 = -_2564;
    float _2576 = _2558 + _2574;
    float _2578 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2580 = fma(_2568, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2564);
    float _2582 = fma(_2572, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2564);
    float _2584 = fma(_2576, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2564);
    out.m_92.w = _2578;
    out.m_96.x = _2580;
    out.m_96.y = _2582;
    out.m_96.z = _2584;
    if (!_2552)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2586 = -_1970;
    float _2588 = _2586 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2590 = -_1367;
    float _2592 = _2590 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2594 = -_1371;
    float _2596 = _2594 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2598 = _2588 * _2588;
    float _2600 = fma(_2592, _2592, _2598);
    float _2602 = fma(_2596, _2596, _2600);
    float _2604 = sqrt(_2602);
    float _2606 = rsqrt(_2602);
    float _2608 = -_2604;
    float _2610 = _2608 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2612 = _2610 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2614 = precise::clamp(_2612, 0.0, 1.0);
    float _2616 = _2592 * _2606;
    float _2618 = _2588 * _2606;
    float _2620 = abs(_2614);
    float _2622 = log2(_2620);
    float _2624 = _2596 * _2606;
    float _2626 = _2616 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2628 = _1992 * _2618;
    float _2630 = -_2618;
    float _2632 = -_2626;
    float _2634 = fma(_2630, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2632);
    float _2636 = fma(_1978, _2616, _2628);
    float _2638 = -_2624;
    float _2640 = fma(_2638, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2634);
    float _2642 = fma(_1986, _2624, _2636);
    float _2644 = precise::clamp(_2642, 0.0, 1.0);
    float _2646 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2648 = _2640 + _2646;
    float _2650 = _2622 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2652 = _2648 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2654 = precise::clamp(_2652, 0.0, 1.0);
    float _2656 = exp2(_2650);
    float _2658 = _2656 * _2654;
    float _2660 = _2644 * _2658;
    float _2662 = _2660 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2664 = _2660 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2666 = _2660 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_94.x = _2662;
    out.m_94.y = _2664;
    out.m_94.z = _2666;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

