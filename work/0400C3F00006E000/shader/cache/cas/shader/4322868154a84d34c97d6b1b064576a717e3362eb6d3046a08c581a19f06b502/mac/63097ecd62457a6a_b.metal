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
    constant _16* vp_c9 [[id(1)]];
    constant _16* vp_c8 [[id(2)]];
    constant _16* vp_c10 [[id(3)]];
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
    float4 m_80 [[user(locn0)]];
    float4 m_86 [[user(locn2)]];
    float4 m_82 [[user(locn3)]];
    float4 m_96 [[user(locn4)]];
    float4 m_52 [[user(locn5)]];
    float4 m_84 [[user(locn6)]];
    float4 m_88 [[user(locn7)]];
    float4 m_90 [[user(locn8)]];
    float4 m_76 [[user(locn9)]];
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
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2556 = false;
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
        float _2842 = as_type<float>(_131);
        out.gl_Position.z = _2842;
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
    float _159 = _141;
    if (_157)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _123;
    if (_157)
    {
        out.m_52.x = 0.0;
    }
    if (_157)
    {
        float _163 = _161 * 5.0;
        _133 = as_type<int>(_163);
    }
    int _165 = _133;
    if (_157)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2906 = as_type<float>(_165);
        out.gl_Position.z = _2906;
    }
    if (_157)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _167 = in.m_56.x;
    float _169 = in.m_56.y;
    float _171 = in.m_56.z;
    float _173 = 1.0 / _137;
    float _175 = in.m_58.x;
    float _177 = in.m_58.y;
    float _179 = in.m_58.z;
    float _181 = in.m_60.x;
    float _183 = in.m_60.y;
    float _185 = in.m_60.z;
    float _187 = _141 * _173;
    float _189 = _167 * _167;
    float _191 = _169 * _169;
    float _193 = fma(_175, _175, _189);
    float _195 = fma(_177, _177, _191);
    float _197 = fma(_181, _181, _193);
    float _199 = _171 * _171;
    float _201 = fma(_183, _183, _195);
    float _203 = sqrt(_197);
    float _205 = fma(_179, _179, _199);
    float _207 = fma(_185, _185, _205);
    float _209 = sqrt(_201);
    float _211 = sqrt(_207);
    bool _213 = _203 > 0.0;
    bool _215 = _209 > 0.0;
    float _217 = 0.0;
    float _219 = _209;
    float _221 = _197;
    float _223 = _207;
    float _225 = _203;
    float _227 = _201;
    if (_213)
    {
        float _229 = rsqrt(_197);
        _217 = _229;
    }
    float _231 = _217;
    float _233 = 0.0;
    if (!_213)
    {
        _233 = 0.0;
    }
    float _235 = _233;
    bool _237 = _211 > 0.0;
    float _239 = _211;
    float _241 = _235;
    if (!_213)
    {
        _239 = 0.0;
    }
    float _243 = _239;
    float _245 = 0.0;
    float _247 = _243;
    if (!_213)
    {
        _245 = 0.0;
    }
    float _249 = _245;
    float _251 = 0.0;
    float _253 = _249;
    if (_215)
    {
        float _255 = rsqrt(_201);
        _251 = _255;
    }
    float _257 = _251;
    if (!_215)
    {
        _219 = 0.0;
    }
    float _259 = _219;
    float _261 = 0.0;
    float _263 = _259;
    if (_237)
    {
        float _265 = rsqrt(_207);
        _261 = _265;
    }
    float _267 = _261;
    float _269 = _231;
    if (_213)
    {
        float _271 = _231 * _167;
        _247 = _271;
    }
    float _273 = _247;
    if (_213)
    {
        float _275 = _231 * _175;
        _241 = _275;
    }
    float _277 = _241;
    if (_213)
    {
        float _279 = _231 * _181;
        _253 = _279;
    }
    float _281 = _253;
    bool _283 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    if (!_215)
    {
        _269 = 0.0;
    }
    float _285 = _269;
    float _287 = _285;
    if (!_237)
    {
        _221 = 0.0;
    }
    float _289 = _221;
    float _291 = _289;
    if (_215)
    {
        float _293 = _257 * _169;
        _263 = _293;
    }
    float _295 = _263;
    if (!_215)
    {
        _223 = 0.0;
    }
    float _297 = _223;
    float _299 = _297;
    if (_215)
    {
        float _301 = _257 * _177;
        _287 = _301;
    }
    float _303 = _287;
    if (!_237)
    {
        _225 = 0.0;
    }
    float _305 = _225;
    float _307 = _305;
    if (_215)
    {
        float _309 = _257 * _183;
        _299 = _309;
    }
    float _311 = _299;
    if (!_237)
    {
        _227 = 0.0;
    }
    float _313 = _227;
    float _315 = _313;
    if (_237)
    {
        float _317 = _267 * _171;
        _291 = _317;
    }
    float _319 = _291;
    if (_237)
    {
        float _321 = _267 * _179;
        _307 = _321;
    }
    float _323 = _307;
    if (_237)
    {
        float _325 = _267 * _185;
        _315 = _325;
    }
    float _327 = _315;
    bool _329 = !_283;
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
        _347 = _187;
    }
    _349 = false;
    float _351 = _347;
    float _353 = in.m_64.x;
    float _355 = in.m_64.y;
    float _357 = _141 * (*spvDescriptorSet0.vp_c9)._m0[193].y;
    float _359 = in.m_62.x;
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _363 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _361;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _367 = _365 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _369 = in.m_49.x;
    float _371 = in.m_49.y;
    float _373 = in.m_49.z;
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _377 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _375;
    float _379 = 1.0 / _363;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _383 = _351 + _381;
    float _385 = in.m_62.y;
    bool _387 = _351 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _389 = isnan(_351);
    bool _391 = _387 || _389;
    bool _393 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _395 = _391 || _393;
    float _397 = float(_395);
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _401 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _399;
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _405 = _403 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _407 = 1.0 / _377;
    float _409 = -_353;
    float _411 = _409 + 1.0;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _415 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _413;
    float _417 = abs(_353);
    float _419 = log2(_417);
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _423 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _421;
    float _425 = fma(_359, 6.283185482025146484375, _357);
    float _427 = fma((*spvDescriptorSet0.vp_c9)._m0[194].y, 0.01745329238474369049072265625, _425);
    float _429 = _183 * _371;
    float _431 = _177 * _371;
    float _433 = _427 * 0.60000002384185791015625;
    float _435 = fma(_181, _369, _429);
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _439 = _351 + _437;
    float _441 = 1.0 / _367;
    float _443 = _433 * 0.15915493667125701904296875;
    float _445 = fma(_175, _369, _431);
    float _447 = _419 * (*spvDescriptorSet0.vp_c9)._m0[193].z;
    float _449 = _427 * 0.15915493667125701904296875;
    int _451 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _453 = _451 != 0;
    float _455 = _427 * 1.2999999523162841796875;
    float _457 = exp2(_447);
    float _459 = _455 * 0.15915493667125701904296875;
    float _461 = _443 * 6.283185482025146484375;
    float _463 = sin(_461);
    float _465 = _439 * _379;
    float _467 = _427 + 0.52359879016876220703125;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _471 = _351 + _469;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _475 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _473;
    float _477 = fma(_401, _465, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _479 = _467 * 0.15915493667125701904296875;
    float _481 = fma(_427, 0.60000002384185791015625, 0.31415927410125732421875);
    float _483 = fma(_427, 1.2999999523162841796875, 0.680678427219390869140625);
    float _485 = _471 * _407;
    float _487 = fma(_475, _465, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _489 = _483 * 0.15915493667125701904296875;
    float _491 = _383 * _441;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _495 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _493;
    float _497 = _449 * 6.283185482025146484375;
    float _499 = sin(_497);
    float _501 = _481 * 0.15915493667125701904296875;
    float _503 = fma(_495, _465, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _505 = fma(_415, _485, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _507 = in.m_66.x;
    float _509 = in.m_66.y;
    float _511 = in.m_66.z;
    float _513 = (*spvDescriptorSet0.vp_c9)._m0[193].w * 3.1415927410125732421875;
    float _515 = _459 * 6.283185482025146484375;
    float _517 = sin(_515);
    float _519 = fma(_513, _457, _357);
    float _521 = -(*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _523 = _521 + (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _525 = fma(_359, 6.283185482025146484375, _519);
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _529 = _527 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _533 = _531 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _535 = fma(_523, _359, (*spvDescriptorSet0.vp_c9)._m0[191].x);
    float _537 = _479 * 6.283185482025146484375;
    float _539 = sin(_537);
    float _541 = fma(_529, _491, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _543 = fma(_533, _491, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _545 = fma(_405, _491, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _547 = _385 * 628.31854248046875;
    float _549 = fma(_463, 0.60000002384185791015625, _499);
    bool _551 = _351 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _553 = isnan(_351);
    bool _555 = _551 || _553;
    bool _557 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _559 = _555 || _557;
    float _561 = float(_559);
    float _563 = _501 * 6.283185482025146484375;
    float _565 = sin(_563);
    float _567 = fma(_141, _535, _547);
    float _569 = fma(_353, 0.261799395084381103515625, -0.261799395084381103515625);
    bool _571 = _507 > 0.0;
    float _573 = fma(_517, 0.300000011920928955078125, _549);
    bool _575 = _507 >= 0.0;
    bool _577 = isnan(_507);
    bool _579 = _575 || _577;
    bool _581 = isnan(0.0);
    bool _583 = _579 || _581;
    float _585 = _567 + _569;
    float _587 = -_561;
    float _589 = _587 + 1.0;
    float _591 = _489 * 6.283185482025146484375;
    float _593 = sin(_591);
    int _595 = _583 ? 0 : 1;
    float _597 = _585 * 1.10000002384185791015625;
    float _599 = _525 * 0.15915493667125701904296875;
    float _601 = _525 * 0.60000002384185791015625;
    int _603 = ~_595;
    int _605 = _603 + 1;
    int _607 = _605 + 1;
    float _609 = _525 * 1.2999999523162841796875;
    float _611 = _573 * _411;
    int _613 = _607;
    float _615 = _459;
    if (!_571)
    {
        int _617 = ~_595;
        int _619 = _617 + 1;
        _613 = _619;
    }
    int _621 = _613;
    float _623 = _585 * 0.89999997615814208984375;
    float _625 = fma(_565, 0.60000002384185791015625, _539);
    bool _627 = _351 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _629 = isnan(_351);
    bool _631 = _627 || _629;
    bool _633 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _635 = _631 || _633;
    float _637 = float(_635);
    float _639 = _609 * 0.15915493667125701904296875;
    float _641 = _623 * 0.15915493667125701904296875;
    bool _643 = _351 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _645 = isnan(_351);
    bool _647 = _643 || _645;
    bool _649 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _651 = _647 || _649;
    float _653 = float(_651);
    float _655 = _597 * 0.15915493667125701904296875;
    float _657 = -_397;
    float _659 = _657 + 1.0;
    float _661 = fma(_593, 0.300000011920928955078125, _625);
    float _663 = _653 * _589;
    float _665 = -_653;
    float _667 = _665 + 1.0;
    float _669 = _637 * _659;
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _673 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _671;
    float _675 = -_637;
    float _677 = _675 + 1.0;
    float _679 = _397 * _667;
    float _681 = -_355;
    float _683 = _681 + 1.0;
    float _685 = _503 * _669;
    float _687 = _477 * _669;
    float _689 = _487 * _669;
    float _691 = abs(_661);
    float _693 = _683 * _691;
    float _695 = fma(_673, _485, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _697 = _601 * 0.15915493667125701904296875;
    float _699 = fma(_423, _485, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _701 = fma(_677, (*spvDescriptorSet0.vp_c9)._m0[143].x, _685);
    float _703 = fma(_677, (*spvDescriptorSet0.vp_c9)._m0[143].y, _689);
    float _705 = _693 * (-45.0);
    float _707 = _585 * 0.15915493667125701904296875;
    float _709 = in.m_68.y;
    float _711 = _585 * 0.699999988079071044921875;
    float _713 = _599 * 6.283185482025146484375;
    float _715 = sin(_713);
    float _717 = fma(_541, _679, _701);
    float _719 = _705 * 0.01745329238474369049072265625;
    float _721 = fma(_543, _679, _703);
    float _723 = _711 * 0.15915493667125701904296875;
    float _725 = in.m_70.x;
    float _727 = in.m_70.y;
    float _729 = in.m_70.z;
    float _731 = _611 * 0.52359879016876220703125;
    float _733 = fma(_677, (*spvDescriptorSet0.vp_c9)._m0[143].z, _687);
    float _735 = _697 * 6.283185482025146484375;
    float _737 = sin(_735);
    float _739 = float(_621);
    float _741 = _731 * 0.15915493667125701904296875;
    float _743 = _693 * (-20.0);
    float _745 = fma(_545, _679, _733);
    float _747 = fma(_695, _663, _721);
    float _749 = _719 * 0.15915493667125701904296875;
    float _751 = _641 * 6.283185482025146484375;
    float _753 = sin(_751);
    float _755 = fma(_505, _663, _717);
    float _757 = fma(_699, _663, _745);
    float _759 = _739 * _743;
    float _761 = _567 * 0.89999997615814208984375;
    float _763 = fma(_561, (*spvDescriptorSet0.vp_c9)._m0[146].x, _755);
    float _765 = fma(_561, (*spvDescriptorSet0.vp_c9)._m0[146].y, _747);
    float _767 = _759 * 0.01745329238474369049072265625;
    float _769 = _639 * 6.283185482025146484375;
    float _771 = sin(_769);
    float _773 = fma(_737, 0.60000002384185791015625, _715);
    float _775 = _567 * 0.15915493667125701904296875;
    float _777 = _767 * 0.15915493667125701904296875;
    float _779 = _761 * 0.15915493667125701904296875;
    float _781 = _509 + (-0.0199999995529651641845703125);
    float _783 = fma(_561, (*spvDescriptorSet0.vp_c9)._m0[146].z, _757);
    if (!_453)
    {
        _615 = _385;
    }
    float _785 = _615;
    float _787 = _707 * 6.283185482025146484375;
    float _789 = sin(_787);
    float _791 = _753 * 0.89999997615814208984375;
    float _793 = _783 * _729;
    float _795 = _567 * 0.699999988079071044921875;
    float _797 = _723 * 6.283185482025146484375;
    float _799 = cos(_797);
    float _801 = fma(_771, 0.300000011920928955078125, _773);
    float _803 = fma(_709, 0.5, 0.5);
    float _805 = _803 * _801;
    float _807 = _763 * _725;
    float _809 = _655 * 6.283185482025146484375;
    float _811 = cos(_809);
    float _813 = -_791;
    float _815 = fma(_789, -1.2000000476837158203125, _813);
    float _817 = _805 * (*spvDescriptorSet0.vp_c9)._m0[193].x;
    float _819 = abs(_815);
    bool _821 = _819 > 0.001000000047497451305389404296875;
    bool _823 = isnan(_819);
    bool _825 = _821 || _823;
    bool _827 = isnan(0.001000000047497451305389404296875);
    bool _829 = _825 || _827;
    float _831 = _817 * 0.01745329238474369049072265625;
    float _833 = _741 * 6.283185482025146484375;
    float _835 = sin(_833);
    float _837 = _799 * 0.699999988079071044921875;
    float _839 = _831 * 0.15915493667125701904296875;
    float _841 = _741 * 6.283185482025146484375;
    float _843 = cos(_841);
    float _845 = fma(_811, 1.10000002384185791015625, _837);
    float _847 = abs(_845);
    bool _849 = _847 != 0.0;
    bool _851 = isnan(_847);
    bool _853 = _849 || _851;
    bool _855 = isnan(0.0);
    bool _857 = _853 || _855;
    float _859 = _749 * 6.283185482025146484375;
    float _861 = sin(_859);
    float _863 = _835 * _507;
    float _865 = _749 * 6.283185482025146484375;
    float _867 = cos(_865);
    float _869 = _843 * _507;
    float _871 = -_863;
    float _873 = fma(_843, _511, _871);
    float _875 = _829 ? _815 : 0.001000000047497451305389404296875;
    float _877 = _765 * _727;
    float _879 = fma(_835, _511, _869);
    float _881 = _873 + 0.02999999932944774627685546875;
    float _883 = abs(_875);
    bool _885 = _883 == 0.0;
    bool _887 = !_857;
    bool _889 = _885 && _887;
    float _891 = _777 * 6.283185482025146484375;
    float _893 = sin(_891);
    float _895 = abs(_875);
    bool _897 = _895 == 0.0;
    float _899 = _861 * _881;
    float _901 = fma(_739, -0.100000001490116119384765625, _879);
    float _903 = _795 * 0.15915493667125701904296875;
    float _905 = _777 * 6.283185482025146484375;
    float _907 = cos(_905);
    float _909 = -_899;
    float _911 = fma(_867, _781, _909);
    float _913 = _867 * _881;
    bool _915 = false;
    int _917 = as_type<int>(_901);
    float _919 = _845;
    float _921 = _785;
    if (_889)
    {
        bool _923 = as_type<int>(_875) >= 0;
        _915 = _923;
    }
    bool _925 = _915;
    float _927 = _775 * 6.283185482025146484375;
    float _929 = cos(_927);
    float _931 = _911 * _893;
    float _933 = _779 * 6.283185482025146484375;
    float _935 = cos(_933);
    float _937 = _911 * _907;
    float _939 = -_931;
    float _941 = fma(_907, _901, _939);
    float _943 = fma(_893, _901, _937);
    float _945 = _893;
    int _947 = _925 ? (-1) : 0;
    int _949 = as_type<int>(_941);
    if (_889)
    {
        int _951 = _925 ? 0 : 1078530011;
        _917 = _951;
    }
    int _953 = _917;
    float _955 = fma(_739, 0.100000001490116119384765625, _941);
    float _957 = _839 * 6.283185482025146484375;
    float _959 = sin(_957);
    float _961 = _943 + 0.0199999995529651641845703125;
    if (_889)
    {
        int _963 = int(0x80000000) & as_type<int>(_845);
        int _965 = _953 | _963;
        _945 = as_type<float>(_965);
    }
    float _967 = _945;
    float _969 = _839 * 6.283185482025146484375;
    float _971 = cos(_969);
    bool _973 = !_857;
    bool _975 = _973 && _897;
    float _977 = _967;
    float _979 = _967;
    if (!_975)
    {
        float _981 = abs(_845);
        bool _983 = _981 != as_type<float>(0x7f800000u /* inf */);
        bool _985 = isnan(_981);
        bool _987 = _983 || _985;
        bool _989 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _991 = _987 || _989;
        float _993 = abs(_875);
        bool _995 = _993 == as_type<float>(0x7f800000u /* inf */);
        float _997 = abs(_875);
        bool _999 = _997 == as_type<float>(0x7f800000u /* inf */);
        bool _1001 = !_991;
        bool _1003 = _999 && _1001;
        if (_1003)
        {
            bool _1005 = as_type<int>(_875) >= 0;
            _947 = _1005 ? (-1) : 0;
        }
        int _1007 = _947;
        if (_1003)
        {
            _949 = 1075235812;
        }
        int _1009 = _949;
        int _1011 = _1009;
        if (_1003)
        {
            int _1013 = ~_1007;
            int _1015 = (_1013 != 0) ? _1009 : 1061752795;
            _1011 = _1015;
        }
        int _1017 = _1011;
        if (_1003)
        {
            int _1019 = int(0x80000000) & as_type<int>(_845);
            int _1021 = _1017 | _1019;
            _977 = as_type<float>(_1021);
        }
        float _1023 = _977;
        bool _1025 = !_991;
        bool _1027 = _1025 && _995;
        _979 = _1023;
        if (!_1027)
        {
            float _1029 = abs(_845);
            float _1031 = abs(_875);
            float _1033 = precise::max(_1029, _1031);
            float _1035 = abs(_845);
            float _1037 = abs(_875);
            float _1039 = precise::min(_1035, _1037);
            float _1041 = 1.0 / _1033;
            float _1043 = abs(_845);
            float _1045 = abs(_875);
            bool _1047 = _1043 > _1045;
            bool _1049 = as_type<int>(_875) >= 0;
            float _1051 = _1039 * _1041;
            float _1053 = _1051 * _1051;
            float _1055 = _1053 + 11.33538818359375;
            float _1057 = fma(_1053, _1055, 28.84246826171875);
            float _1059 = fma(_1053, _1057, 19.6966705322265625);
            float _1061 = fma(_1053, -0.82336294651031494140625, -5.674867153167724609375);
            float _1063 = fma(_1053, _1061, -6.565555095672607421875);
            float _1065 = 1.0 / _1059;
            float _1067 = _1053 * _1063;
            float _1069 = abs(_845);
            float _1071 = abs(_875);
            float _1073 = _1069 + _1071;
            int _1075 = as_type<int>(_845) & int(0x80000000);
            float _1077 = _1051 * _1067;
            bool _1079 = _1073 > as_type<float>(0x7f800000u /* inf */);
            bool _1081 = isnan(_1073);
            bool _1083 = _1079 || _1081;
            bool _1085 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1087 = _1083 || _1085;
            float _1089 = fma(_1077, _1065, _1051);
            float _1091 = _1089;
            _979 = _1073;
            _919 = as_type<float>(_1075);
            if (_1047)
            {
                float _1093 = -_1089;
                float _1095 = _1093 + 1.57079637050628662109375;
                _1091 = _1095;
            }
            float _1097 = _1091;
            int _1099 = as_type<int>(_1097);
            if (!_1049)
            {
                float _1101 = -_1097;
                float _1103 = _1101 + 3.1415927410125732421875;
                _1099 = as_type<int>(_1103);
            }
            int _1105 = _1099;
            if (!_1087)
            {
                int _1107 = _1075 | _1105;
                _979 = as_type<float>(_1107);
            }
        }
    }
    float _1109 = _979;
    float _1111 = _919;
    float _1113 = _961 * _959;
    float _1115 = _961 * _971;
    float _1117 = _1109 + 1.57079637050628662109375;
    float _1119 = in.m_62.z;
    float _1121 = -_1113;
    float _1123 = fma(_955, _971, _1121);
    float _1125 = fma(_861, _781, _913);
    float _1127 = fma(_955, _959, _1115);
    float _1129 = _1117 * (-0.15915493667125701904296875);
    float _1131 = fma(_573, (*spvDescriptorSet0.vp_c9)._m0[194].x, _1123);
    float _1133 = _1125 + (-0.02999999932944774627685546875);
    float _1135 = in.m_60.w;
    float _1137 = _807 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1139 = _793 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1141 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1133);
    float _1143 = in.m_58.w;
    float _1145 = _877 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1147 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1127);
    float _1149 = _567 * 1.10000002384185791015625;
    float _1151 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1131);
    float _1153 = _1129 * 6.283185482025146484375;
    float _1155 = cos(_1153);
    float _1157 = _1139 * _1141;
    float _1159 = _1145 * _1147;
    float _1161 = _1137 * _1151;
    float _1163 = _1149 * 0.15915493667125701904296875;
    float _1165 = _1157 * _303;
    float _1167 = _1157 * _311;
    float _1169 = fma(_179, _373, _445);
    float _1171 = _1129 * 6.283185482025146484375;
    float _1173 = sin(_1171);
    float _1175 = fma(_1161, _277, _1165);
    float _1177 = fma(_1161, _281, _1167);
    float _1179 = _1119 * 6.283185482025146484375;
    float _1181 = fma(_185, _373, _435);
    float _1183 = -_1159;
    float _1185 = fma(_1183, _323, _1175);
    float _1187 = -_1159;
    float _1189 = fma(_1187, _327, _1177);
    float _1191 = _1179 * 0.15915493667125701904296875;
    float _1193 = _903 * 6.283185482025146484375;
    float _1195 = sin(_1193);
    float _1197 = _1185 * _1155;
    float _1199 = _1181 + _1135;
    float _1201 = _1169 + _1143;
    float _1203 = fma(_929, 1.2000000476837158203125, _935);
    float _1205 = _187 * 3.3333332538604736328125;
    float _1207 = _1163 * 6.283185482025146484375;
    float _1209 = sin(_1207);
    float _1211 = _1185 * _1173;
    float _1213 = fma(_1189, _1173, _1197);
    float _1215 = -_1211;
    float _1217 = fma(_1189, _1155, _1215);
    float _1219 = _1201 + _1213;
    float _1221 = _1191 * 6.283185482025146484375;
    float _1223 = sin(_1221);
    float _1225 = _1199 + _1217;
    float _1227 = fma(_1203, (*spvDescriptorSet0.vp_c9)._m0[191].z, _1219);
    float _1229 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1231 = _1227 + _1229;
    float _1233 = _1191 * 6.283185482025146484375;
    float _1235 = cos(_1233);
    float _1237 = _1195 + _1209;
    float _1239 = in.m_72.y;
    float _1241 = fma(_1237, (*spvDescriptorSet0.vp_c9)._m0[191].z, _1225);
    float _1243 = _1223 * _1231;
    float _1245 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1247 = _1241 + _1245;
    float _1249 = -(*spvDescriptorSet0.vp_c9)._m0[192].w;
    float _1251 = _1249 + 1.0;
    float _1253 = _1235 * _1231;
    float _1255 = -_1243;
    float _1257 = fma(_1235, _1247, _1255);
    float _1259 = fma(_1223, _1247, _1253);
    float _1261 = _1257 + (*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1263 = _1259 + (*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1265 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1267 = _1261 + _1265;
    float _1269 = _371 + _1239;
    float _1271 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1273 = _1263 + _1271;
    float _1275 = _1267 * _1267;
    float _1277 = fma(_1273, _1273, _1275);
    float _1279 = -_1205;
    float _1281 = _1279 + 3.3333332538604736328125;
    float _1283 = precise::clamp(_1281, 0.0, 1.0);
    float _1285 = sqrt(_1277);
    bool _1287 = _1285 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1289 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1291 = _1285 + _1289;
    float _1293 = 0.0 + _1205;
    float _1295 = precise::clamp(_1293, 0.0, 1.0);
    float _1297 = _1157 * _295;
    float _1299 = fma(_1161, _273, _1297);
    float _1301 = precise::min(_1295, _1283);
    float _1303 = -_1159;
    float _1305 = fma(_1303, _319, _1299);
    float _1307 = _1111;
    float _1309 = _1157;
    if (_1287)
    {
        float _1311 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1307 = _1311;
    }
    float _1313 = _1307;
    float _1315 = fma(_1301, -5.0, 5.0);
    float _1317 = _1269 + _1305;
    float _1319 = -_1315;
    float _1321 = fma(_1319, _1251, _1317);
    float _1323 = _1315;
    float _1325 = _1317;
    float _1327 = _1321;
    if (_1287)
    {
        float _1329 = rsqrt(_1277);
        _1309 = _1329;
    }
    float _1331 = _1309;
    float _1333 = _1331;
    if (!_1287)
    {
        _1323 = _1263;
    }
    float _1335 = _1323;
    float _1337 = _1335;
    if (_1287)
    {
        float _1339 = _1321 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1325 = _1339;
    }
    float _1341 = _1325;
    float _1343 = _1313;
    float _1345 = _1341;
    if (_1287)
    {
        float _1347 = _1291 * _1313;
        _1343 = _1347;
    }
    float _1349 = _1343;
    float _1351 = _1349;
    if (_1287)
    {
        float _1353 = _1349 * 0.15915493667125701904296875;
        _1351 = _1353;
    }
    float _1355 = _1351;
    float _1357 = _1291;
    if (_1287)
    {
        float _1359 = _1355 * 6.283185482025146484375;
        float _1361 = sin(_1359);
        _1357 = _1361;
    }
    float _1363 = _1357;
    float _1365 = _1363;
    if (_1287)
    {
        float _1367 = fma(_1363, _1341, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1345 = _1367;
    }
    float _1369 = _1345;
    if (!_1287)
    {
        _1365 = _1261;
    }
    float _1371 = _1365;
    float _1373 = _1371;
    if (_1287)
    {
        float _1375 = _1331 * _1369;
        _1333 = _1375;
    }
    float _1377 = _1333;
    if (_1287)
    {
        float _1379 = fma(_1273, _1377, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1337 = _1379;
    }
    float _1381 = _1337;
    if (_1287)
    {
        float _1383 = fma(_1267, _1377, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1373 = _1383;
    }
    float _1385 = _1373;
    float _1387 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1389 = _1381 + _1387;
    float _1391 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1393 = _1385 + _1391;
    float _1395 = fma(_1389, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1397 = fma(_1393, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _4690 = float2(_1395, _1397);
    float _1399 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_4690, float2(0.0), isnan(_4690)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_4690, float2(0.0), isnan(_4690)), level(0.0)).x;
    float _1401 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _1403 = fma(_1399, 100.0, _1269);
    float _1405 = _1403 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1407 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1405);
    float _1409 = fma(_1199, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1407);
    float _1411 = _1403 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1413 = _1403 + _1401;
    float _1415 = _1409 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1417 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1411);
    float _1419 = 1.0 / _1415;
    float _1421 = fma(_1199, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1417);
    float _1423 = _1421 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1425 = _1423 + _1415;
    float _1427 = _1425 * _1419;
    float _1429 = _1427 * 0.5;
    float _1431 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1433 = fma(_1429, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1431);
    float _1435 = 1.0 / _1433;
    float _1437 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1439 = _1435 * _1437;
    bool _1441 = _1439 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1443 = _1439 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1445 = !_1441;
    int _1447 = _1445 ? 0 : 1;
    int _1449 = 2;
    if (!_1441)
    {
        _1449 = 1;
    }
    int _1451 = _1449;
    int _1453 = _1451;
    if (!_1443)
    {
        _1453 = _1447;
    }
    int _1455 = _1453;
    int _1457 = _1455 << 6;
    int _1459 = _1457 + 96;
    uint _1462 = uint(int(uint(_1459) >> uint(2)));
    uint _1464 = uint(int(uint(int(_1462)) >> uint(2)));
    int _1466 = int(_1462) & 3;
    float _1468 = (*spvDescriptorSet0.vp_c15)._m0[int(_1464)][_1466];
    int _1470 = int(_1462) + 1;
    uint _1472 = uint(int(uint(_1470) >> uint(2)));
    int _1474 = _1470 & 3;
    float _1476 = (*spvDescriptorSet0.vp_c15)._m0[int(_1472)][_1474];
    int _1478 = _1457 + 104;
    uint _1480 = uint(int(uint(_1478) >> uint(2)));
    uint _1482 = uint(int(uint(int(_1480)) >> uint(2)));
    int _1484 = int(_1480) & 3;
    float _1486 = (*spvDescriptorSet0.vp_c15)._m0[int(_1482)][_1484];
    int _1488 = int(_1480) + 1;
    uint _1490 = uint(int(uint(_1488) >> uint(2)));
    int _1492 = _1488 & 3;
    float _1494 = (*spvDescriptorSet0.vp_c15)._m0[int(_1490)][_1492];
    int _1496 = _1457 + 48;
    uint _1498 = uint(int(uint(_1496) >> uint(2)));
    uint _1500 = uint(int(uint(int(_1498)) >> uint(2)));
    int _1502 = int(_1498) & 3;
    float _1504 = (*spvDescriptorSet0.vp_c15)._m0[int(_1500)][_1502];
    int _1506 = int(_1498) + 1;
    uint _1508 = uint(int(uint(_1506) >> uint(2)));
    int _1510 = _1506 & 3;
    float _1512 = (*spvDescriptorSet0.vp_c15)._m0[int(_1508)][_1510];
    int _1514 = _1457 + 64;
    uint _1516 = uint(int(uint(_1514) >> uint(2)));
    uint _1518 = uint(int(uint(int(_1516)) >> uint(2)));
    int _1520 = int(_1516) & 3;
    float _1522 = (*spvDescriptorSet0.vp_c15)._m0[int(_1518)][_1520];
    int _1524 = int(_1516) + 1;
    uint _1526 = uint(int(uint(_1524) >> uint(2)));
    int _1528 = _1524 & 3;
    float _1530 = (*spvDescriptorSet0.vp_c15)._m0[int(_1526)][_1528];
    int _1532 = _1457 + 56;
    uint _1534 = uint(int(uint(_1532) >> uint(2)));
    uint _1536 = uint(int(uint(int(_1534)) >> uint(2)));
    int _1538 = int(_1534) & 3;
    float _1540 = (*spvDescriptorSet0.vp_c15)._m0[int(_1536)][_1538];
    int _1542 = int(_1534) + 1;
    uint _1544 = uint(int(uint(_1542) >> uint(2)));
    int _1546 = _1542 & 3;
    float _1548 = (*spvDescriptorSet0.vp_c15)._m0[int(_1544)][_1546];
    int _1550 = _1457 + 72;
    uint _1552 = uint(int(uint(_1550) >> uint(2)));
    uint _1554 = uint(int(uint(int(_1552)) >> uint(2)));
    int _1556 = int(_1552) & 3;
    float _1558 = (*spvDescriptorSet0.vp_c15)._m0[int(_1554)][_1556];
    int _1560 = int(_1552) + 1;
    uint _1562 = uint(int(uint(_1560) >> uint(2)));
    int _1564 = _1560 & 3;
    float _1566 = (*spvDescriptorSet0.vp_c15)._m0[int(_1562)][_1564];
    float _1568 = _1413 * _1476;
    float _1570 = fma(_1201, _1468, _1568);
    float _1572 = fma(_1199, _1486, _1570);
    float _1574 = _1572 + _1494;
    int _1576 = _1457 + 80;
    uint _1578 = uint(int(uint(_1576) >> uint(2)));
    uint _1580 = uint(int(uint(int(_1578)) >> uint(2)));
    int _1582 = int(_1578) & 3;
    float _1584 = (*spvDescriptorSet0.vp_c15)._m0[int(_1580)][_1582];
    int _1586 = int(_1578) + 1;
    uint _1588 = uint(int(uint(_1586) >> uint(2)));
    int _1590 = _1586 & 3;
    float _1592 = (*spvDescriptorSet0.vp_c15)._m0[int(_1588)][_1590];
    float _1594 = _1413 * _1512;
    float _1596 = 1.0 / _1574;
    float _1598 = fma(_1201, _1504, _1594);
    int _1600 = _1457 + 88;
    uint _1602 = uint(int(uint(_1600) >> uint(2)));
    uint _1604 = uint(int(uint(int(_1602)) >> uint(2)));
    int _1606 = int(_1602) & 3;
    float _1608 = (*spvDescriptorSet0.vp_c15)._m0[int(_1604)][_1606];
    int _1610 = int(_1602) + 1;
    uint _1612 = uint(int(uint(_1610) >> uint(2)));
    int _1614 = _1610 & 3;
    float _1616 = (*spvDescriptorSet0.vp_c15)._m0[int(_1612)][_1614];
    float _1618 = _1413 * _1530;
    float _1620 = fma(_1201, _1522, _1618);
    float _1622 = fma(_1199, _1540, _1598);
    float _1624 = _1622 + _1548;
    float _1626 = fma(_1199, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1628 = fma(_1199, _1558, _1620);
    float _1630 = _1624 * _1596;
    float _1632 = _1628 + _1566;
    bool _1634 = _1630 >= 0.0;
    float _1636 = fma(_1201, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1638 = _1632 * _1596;
    bool _1640 = _1630 <= 1.0;
    bool _1642 = _1640 && _1634;
    float _1644 = floor(_1636);
    bool _1646 = _1638 >= 0.0;
    bool _1648 = _1646 && _1642;
    bool _1650 = _1638 <= 1.0;
    bool _1652 = _1650 && _1648;
    float _1654 = floor(_1626);
    float _1656 = _1413 * _1592;
    float _1658 = fma(_1201, _1584, _1656);
    float _1660 = -_1644;
    float _1662 = _1636 + _1660;
    float _1664 = fma(_1199, _1608, _1658);
    float _1666 = as_type<float>(_1455);
    if (_1652)
    {
        float _1668 = float(_1455);
        _1666 = _1668;
    }
    float _1670 = _1666;
    float _1672 = _1664 + _1616;
    float _1674 = _1656;
    if (_1652)
    {
        float _1676 = rint(_1670);
        float _1678 = precise::max(_1676, 0.0);
        uint _1680 = uint(_1678);
        uint _1682 = clamp(_1680, 0u, 65535u);
        _1674 = as_type<float>(_1682);
    }
    float _1684 = _1674;
    float _1686 = -_1654;
    float _1688 = _1626 + _1686;
    float _1690 = _1672 * _1596;
    float2 _5186 = float2(_1662, _1688);
    float _1692 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5186, float2(0.0), isnan(_5186)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5186, float2(0.0), isnan(_5186)), level(0.0)).x;
    float _1694 = _1638;
    if (_1652)
    {
        float3 _5201 = float3(_1630, _1638, float(as_type<int>(_1684)));
        float3 _5205 = select(_5201, float3(0.0), isnan(_5201));
        float _1696 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5205.xy, uint(rint(_5205.z)), _1690, level(0.0));
        _1694 = _1696;
    }
    float _1698 = _1694;
    float _1700 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _1702 = in.m_62.w;
    float _1704 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    if (_453)
    {
        _921 = _359;
    }
    float _1706 = _921;
    float _1708 = _1700 * _359;
    int _1710 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1712 = _1710 != 0;
    float _1714 = in.m_74.x;
    float _1716 = in.m_74.y;
    float _1718 = in.m_74.z;
    float _1720 = in.m_74.w;
    int _1722 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1724 = _1722 != 0;
    float _1726 = trunc(_1708);
    int _1728 = int(_1726);
    float _1730 = in.m_68.x;
    float _1732 = _907;
    if (_1712)
    {
        float _1734 = in.m_62.z;
        _1732 = _1734;
    }
    float _1736 = _1732;
    float _1738 = _1662;
    if (!_453)
    {
        float _1740 = in.m_62.z;
        _1738 = _1740;
    }
    float _1742 = _1738;
    bool _1744 = _1702 > 0.5;
    int _1746 = _1728 << 4;
    int _1748 = _1746 + 1712;
    uint _1750 = uint(int(uint(_1748) >> uint(2)));
    uint _1752 = uint(int(uint(int(_1750)) >> uint(2)));
    int _1754 = int(_1750) & 3;
    float _1756 = (*spvDescriptorSet0.vp_c9)._m0[int(_1752)][_1754];
    int _1758 = int(_1750) + 1;
    uint _1760 = uint(int(uint(_1758) >> uint(2)));
    int _1762 = _1758 & 3;
    float _1764 = (*spvDescriptorSet0.vp_c9)._m0[int(_1760)][_1762];
    float _1766 = _311 * _1718;
    float _1768 = -_709;
    float _1770 = _1768 + 1.0;
    float _1772 = _303 * _1718;
    float _1774 = _295 * _1718;
    float _1776 = fma(_281, _1714, _1766);
    float _1778 = _1766;
    float _1780 = _1730;
    if (_1712)
    {
        _1778 = _1730;
    }
    float _1782 = _1778;
    float _1784 = fma(_277, _1714, _1772);
    int _1786 = _1748 + 8;
    uint _1788 = uint(int(uint(_1786) >> uint(2)));
    uint _1790 = uint(int(uint(int(_1788)) >> uint(2)));
    int _1792 = int(_1788) & 3;
    float _1794 = (*spvDescriptorSet0.vp_c9)._m0[int(_1790)][_1792];
    int _1796 = _1744 ? as_type<int>(_1770) : as_type<int>(_709);
    float _1798 = -_1716;
    float _1800 = fma(_323, _1798, _1784);
    bool _1802 = _1736 > 0.5;
    bool _1804 = _1802 && _1712;
    float _1806 = fma(_273, _1714, _1774);
    float _1808 = -_1716;
    float _1810 = fma(_327, _1808, _1776);
    float _1812 = _1724 ? as_type<float>(_1796) : _709;
    float _1814 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1816 = -_1716;
    float _1818 = fma(_319, _1816, _1806);
    float _1820 = _1704 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1822 = _1806;
    float _1824 = _1782;
    if (!_1712)
    {
        _1822 = _1730;
    }
    float _1826 = _1822;
    float _1828 = _1742;
    float _1830 = _1826;
    if (!_453)
    {
        _1780 = _1742;
    }
    float _1832 = _1780;
    out.m_76.x = _1800;
    out.m_76.y = _1818;
    out.m_76.z = _1810;
    float _1834 = fma(_1820, _1812, -0.5);
    float _1836 = _1832;
    float _1838 = _1834;
    if (_1804)
    {
        float _1840 = -_1782;
        float _1842 = _1840 + 1.0;
        _1824 = _1842;
    }
    float _1844 = _1824;
    float _1846 = in.m_78.x;
    float _1848 = in.m_78.y;
    float _1850 = in.m_78.z;
    if (_453)
    {
        _1836 = _385;
    }
    float _1852 = _1836;
    float _1854 = _1852;
    if (_453)
    {
        _1828 = _385;
    }
    float _1856 = _1828;
    float _1858 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _1860 = _1127 != 0.0;
    bool _1862 = isnan(_1127);
    bool _1864 = _1860 || _1862;
    bool _1866 = isnan(0.0);
    bool _1868 = _1864 || _1866;
    float _1870 = _1814 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1872 = fma(_1706, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1858);
    bool _1874 = _1131 == 0.0;
    bool _1876 = !_1868;
    bool _1878 = _1874 && _1876;
    float _1880 = _1706 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_1712)
    {
        _1830 = _1844;
    }
    float _1882 = _1830;
    float _1884 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1886 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1872);
    float _1888 = fma(_1870, _1882, -0.5);
    bool _1890 = _1125 == 0.02999999932944774627685546875;
    bool _1892 = _1890 && _1878;
    float _1894 = -_1884;
    float _1896 = fma(_1880, 2.0, _1894);
    float _1898 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1900 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1902 = _1852 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1904 = _1756 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1906 = fma(_1856, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1898);
    float _1908 = fma(_1902, -2.0, _1900);
    float _1910 = -_141;
    float _1912 = fma(_1910, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1896);
    float _1914 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1906);
    float _1916 = _1764 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1918 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1908);
    float _1920 = _1794 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1922 = _1914;
    float _1924 = _1888;
    if (_1892)
    {
        _1854 = _1846;
    }
    float _1926 = _1854;
    float _1928 = fma(_1886, _1888, _1912);
    float _1930 = -_1918;
    float _1932 = fma(_1914, _1834, _1930);
    float _1934 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1936 = _1904 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1938 = _1916 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1940 = _1920 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1942 = _1926;
    if (_1892)
    {
        _1838 = _1926;
    }
    float _1944 = _1838;
    float _1946 = _1928 + 0.5;
    float _1948 = _1944;
    if (!_1892)
    {
        _1942 = _1846;
    }
    float _1950 = _1942;
    float _1952 = _1932 + 0.5;
    if (_1892)
    {
        _1922 = _1848;
    }
    float _1954 = _1922;
    out.m_80.x = _1936;
    out.m_80.y = _1938;
    out.m_80.z = _1940;
    out.m_80.w = _1934;
    float _1956 = _1954;
    if (_1892)
    {
        _159 = _1850;
    }
    float _1958 = _159;
    float _1960 = _1958;
    if (!_1892)
    {
        float _1962 = fma(_1133, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1850);
        _1960 = _1962;
    }
    float _1964 = _1960;
    if (_1892)
    {
        _1924 = _1954;
    }
    float _1966 = _1924;
    float _1968 = _1966;
    if (!_1892)
    {
        float _1970 = fma(_1131, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1950);
        _1948 = _1970;
    }
    float _1972 = _1948;
    if (!_1892)
    {
        _1956 = _1848;
    }
    float _1974 = _1956;
    float _1976 = _1716 * _1850;
    out.m_82.z = _1946;
    out.m_82.w = _1952;
    if (!_1892)
    {
        float _1978 = fma(_1127, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1974);
        _1968 = _1978;
    }
    float _1980 = _1968;
    float _1982 = _1718 * _1950;
    float _1984 = -_1976;
    float _1986 = fma(_1718, _1974, _1984);
    float _1988 = _295 * _1964;
    float _1990 = -_1982;
    float _1992 = fma(_1714, _1850, _1990);
    float _1994 = _1714 * _1974;
    float _1996 = _303 * _1964;
    float _1998 = _311 * _1964;
    float _2000 = fma(_273, _1972, _1988);
    float _2002 = -_1994;
    float _2004 = fma(_1716, _1950, _2002);
    float _2006 = fma(_277, _1972, _1996);
    float _2008 = fma(_281, _1972, _1998);
    float _2010 = _1996;
    if (_1287)
    {
        float _2012 = _1355 * 6.283185482025146484375;
        float _2014 = cos(_2012);
        _2010 = _2014;
    }
    float _2016 = _2010;
    float _2018 = _2004 * _1720;
    float _2020 = _1986 * _1720;
    float _2022 = _1992 * _1720;
    float _2024 = -_1980;
    float _2026 = fma(_323, _2024, _2006);
    float _2028 = _2018 * _303;
    float _2030 = _2018 * _311;
    float _2032 = _2018 * _295;
    float _2034 = -_1980;
    float _2036 = fma(_327, _2034, _2008);
    float _2038 = fma(_2020, _277, _2028);
    float _2040 = fma(_2020, _281, _2030);
    float _2042 = fma(_2020, _273, _2032);
    float _2044 = _2026 * _1173;
    float _2046 = -_2022;
    float _2048 = fma(_2046, _323, _2038);
    float _2050 = -_2022;
    float _2052 = fma(_2050, _327, _2040);
    float _2054 = -_2022;
    float _2056 = fma(_2054, _319, _2042);
    float _2058 = _2042;
    float _2060 = _2044;
    if (_1287)
    {
        float _2062 = _2016 + (-1.0);
        _2058 = _2062;
    }
    float _2064 = _2058;
    float _2066 = _2026 * _1155;
    float _2068 = -_2044;
    float _2070 = fma(_2036, _1155, _2068);
    float _2072 = in.m_64.w;
    if (_1287)
    {
        float _2074 = _2064 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2060 = _2074;
    }
    float _2076 = _2060;
    float _2078 = fma(_2036, _1173, _2066);
    float _2080 = _1413 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    out.m_84.x = _2048;
    out.m_84.y = _2056;
    out.m_84.z = _2052;
    if (_1287)
    {
        float _2082 = fma(_1321, _2016, _2076);
        _1327 = _2082;
    }
    float _2084 = _1327;
    float _2086 = _1223 * _2078;
    float _2088 = _1235 * _2078;
    float _2090 = -_1980;
    float _2092 = fma(_319, _2090, _2000);
    float _2094 = fma(_1399, 100.0, _2084);
    float _2096 = _1413 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2098 = -_2086;
    float _2100 = fma(_1235, _2070, _2098);
    float _2102 = fma(_1201, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2080);
    float _2104 = _2094 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2106 = fma(_1201, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2096);
    float _2108 = fma(_1223, _2070, _2088);
    float _2110 = abs(_1439);
    float _2112 = log2(_2110);
    float _2114 = _2094 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2116 = fma(_1381, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2104);
    float _2118 = fma(_1199, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2102);
    float _2120 = fma(_1199, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2106);
    float _2122 = fma(_1381, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2114);
    float _2124 = _2094 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2126 = _2118 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _2128 = _2120 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    out.m_86.w = _2072;
    float _2130 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2122);
    float _2132 = trunc(_2126);
    int _2134 = int(_2132);
    float _2136 = _2094 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2138 = fma(_1381, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2124);
    float _2140 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2116);
    float _2142 = _2130 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2144 = fma(_1381, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2136);
    float _2146 = _2112 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2148 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2138);
    float _2150 = trunc(_2128);
    int _2152 = int(_2150);
    float _2154 = _2140 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2156 = _2142 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2158 = _2142 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2160 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2144);
    float _2162 = _2148 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2164 = _2142 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2166 = _2142 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2168 = exp2(_2146);
    float _2170 = fma(_2154, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2156);
    float _2172 = fma(_2154, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2158);
    float _2174 = fma(_2154, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2164);
    float _2176 = fma(_2154, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2166);
    float _2178 = _2160 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2180 = fma(_2162, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2170);
    float _2182 = fma(_2162, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2172);
    int _2184 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2186 = _2134 + _2184;
    int _2188 = _2186 + 1;
    float _2190 = fma(_2162, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2174);
    int _2192 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2194 = _2152 + _2192;
    int _2196 = _2194 + 1;
    float _2198 = fma(_2162, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2176);
    float _2200 = fma(_2178, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2180);
    float _2202 = fma(_2178, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2182);
    bool _2204 = _2188 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _2206 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2208 = _2094 + _2206;
    int _2210 = _2188 | _2196;
    float _2212 = fma(_2168, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2214 = precise::clamp(_2212, 0.0, 1.0);
    float _2216 = fma(_2178, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2190);
    bool _2218 = _2210 < 0;
    bool _2220 = _2218 || _2204;
    float _2222 = fma(_2178, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2198);
    bool _2224 = _1439 <= 8000.0;
    bool _2226 = isnan(_1439);
    bool _2228 = _2224 || _2226;
    bool _2230 = isnan(8000.0);
    bool _2232 = _2228 || _2230;
    float _2234 = float(_2232);
    float _2236 = fma(_2214, -2.0, 3.0);
    float _2238 = _2214 * _2214;
    bool _2240 = _2196 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2242 = _2240 || _2220;
    float _2244 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2246 = _1381 + _2244;
    float _2248 = _2208 * _2208;
    float _2250 = _2238 * _2236;
    out.gl_Position.x = _2216;
    out.gl_Position.y = _2200;
    out.gl_Position.z = _2202;
    out.gl_Position.w = _2222;
    float _2252 = fma(_2246, _2246, _2248);
    float _2254 = -_2250;
    float _2256 = _2254 + 1.0;
    float _2258 = fma(_2256, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2250);
    float _2260 = _2234 * _2258;
    float _2262 = _2216;
    float _2264 = _2200;
    float _2266 = _2222;
    float _2268 = _2260;
    float _2270 = _2128;
    if (_2242)
    {
        _2262 = 1.0;
    }
    float _2272 = _2262;
    float _2274 = _2272;
    if (!_2242)
    {
        int _2276 = _2196 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2278 = _2276 + _2188;
        float _2280 = floor(_2128);
        int _2282 = _2278 << 2;
        uint _2284 = uint(int(uint(_2278) >> uint(2)));
        int _2286 = 12 & _2282;
        int _2288 = int(_2284) << 4;
        int _2290 = _2288 + _2286;
        float _2292 = floor(_2126);
        float _2294 = -_2280;
        float _2296 = _2128 + _2294;
        int _2298 = _2290 + 400;
        uint _2300 = uint(int(uint(_2298) >> uint(2)));
        uint _2302 = uint(int(uint(int(_2300)) >> uint(2)));
        int _2304 = int(_2300) & 3;
        float _2306 = (*spvDescriptorSet0.vp_c15)._m0[int(_2302)][_2304];
        float _2308 = -_2292;
        float _2310 = _2126 + _2308;
        float _2312 = rint(_2306);
        float _2314 = precise::max(_2312, 0.0);
        uint _2316 = uint(_2314);
        uint _2318 = clamp(_2316, 0u, 65535u);
        float3 _6289 = float3(_2310, _2296, float(int(_2318)));
        float3 _6291 = select(_6289, float3(0.0), isnan(_6289));
        float _2320 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6291.xy, uint(rint(_6291.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6291.xy, uint(rint(_6291.z)), level(0.0)).x;
        int _2322 = _2278 << 4;
        int _2324 = _2322 + 2048;
        uint _2326 = uint(int(uint(_2324) >> uint(2)));
        uint _2328 = uint(int(uint(int(_2326)) >> uint(2)));
        int _2330 = int(_2326) & 3;
        float _2332 = (*spvDescriptorSet0.vp_c15)._m0[int(_2328)][_2330];
        int _2334 = int(_2326) + 1;
        uint _2336 = uint(int(uint(_2334) >> uint(2)));
        int _2338 = _2334 & 3;
        float _2340 = (*spvDescriptorSet0.vp_c15)._m0[int(_2336)][_2338];
        int _2342 = _2324 + 8;
        uint _2344 = uint(int(uint(_2342) >> uint(2)));
        uint _2346 = uint(int(uint(int(_2344)) >> uint(2)));
        int _2348 = int(_2344) & 3;
        float _2350 = (*spvDescriptorSet0.vp_c15)._m0[int(_2346)][_2348];
        int _2352 = int(_2344) + 1;
        uint _2354 = uint(int(uint(_2352) >> uint(2)));
        int _2356 = _2352 & 3;
        float _2358 = (*spvDescriptorSet0.vp_c15)._m0[int(_2354)][_2356];
        float _2360 = _1413 * _2340;
        float _2362 = fma(_1201, _2332, _2360);
        float _2364 = fma(_1199, _2350, _2362);
        float _2366 = _2364 + _2358;
        float _2368 = precise::clamp(_2366, 0.0, 1.0);
        float _2370 = -_2368;
        float _2372 = _2370 + _2320;
        float _2374 = fma(_2372, 500.0, 1.5);
        float _2376 = exp2(_2374);
        float _2378 = 0.0 + _2376;
        float _2380 = precise::clamp(_2378, 0.0, 1.0);
        _2264 = _2306;
        _2274 = _2380;
        _2266 = _2320;
    }
    float _2382 = _2264;
    float _2384 = _2274;
    float _2386 = _2266;
    float _2388 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2390 = _1385 + _2388;
    float _2392 = _2260 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2394 = -_1692;
    float _2396 = _2394 + 1.0;
    float _2398 = _2382;
    float _2400 = _2386;
    if (!_1652)
    {
        _2398 = 1.0;
    }
    float _2402 = _2398;
    float _2404 = fma(_2390, _2390, _2252);
    float _2406 = _2402;
    if (_1652)
    {
        bool _2408 = _1698 >= _1690;
        bool _2410 = isnan(_1698);
        bool _2412 = _2408 || _2410;
        bool _2414 = isnan(_1690);
        bool _2416 = _2412 || _2414;
        float _2418 = float(_2416);
        _2406 = _2418;
    }
    float _2420 = _2406;
    float _2422 = _2396 * _2392;
    float _2424 = precise::clamp(_2422, 0.0, 1.0);
    out.m_88.x = _2108;
    out.m_88.y = _2092;
    out.m_88.z = _2100;
    float _2426 = _2420 * _2384;
    float _2428 = sqrt(_2404);
    float _2430 = -_2424;
    float _2432 = fma(_2430, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_90.x = _1381;
    out.m_90.y = _2094;
    out.m_90.z = _1385;
    float _2434 = -_2426;
    float _2436 = fma(_2434, _2432, 1.0);
    float _2438 = precise::clamp(_2436, 0.0, 1.0);
    float _2440 = _2438 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_92.x = _2440;
    bool _2442 = _2428 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2444 = isnan(_2428);
    bool _2446 = _2442 || _2444;
    bool _2448 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2450 = _2446 || _2448;
    float _2452 = _2424;
    float _2454 = _2432;
    float _2456 = _2438;
    if (!_2450)
    {
        _2268 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2458 = _2268;
    float _2460 = _2458;
    float _2462 = _2458;
    if (!_2450)
    {
        _2270 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2464 = _2270;
    float _2466 = _2464;
    float _2468 = _2464;
    if (!_2450)
    {
        _2400 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2470 = _2400;
    float _2472 = _2470;
    float _2474 = _2470;
    if (!_2450)
    {
        _2452 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2476 = _2452;
    float _2478 = _2476;
    float _2480 = _2476;
    if (!_2450)
    {
        _2454 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2482 = _2454;
    float _2484 = _2482;
    float _2486 = _2482;
    if (!_2450)
    {
        _2456 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2488 = _2456;
    bool _2490 = !_2450;
    float _2492 = _2488;
    float _2494 = _2488;
    if (!_2490)
    {
        bool _2496 = _2428 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2498 = isnan(_2428);
        bool _2500 = _2496 || _2498;
        bool _2502 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2504 = _2500 || _2502;
        if (!_2504)
        {
            float _2506 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2508 = _2428 + _2506;
            float _2510 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2512 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2510;
            float _2514 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2516 = _2514 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2518 = 1.0 / _2512;
            float _2520 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2522 = _2520 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2524 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2526 = _2524 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2528 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2530 = _2528 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2532 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2534 = _2532 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2536 = _2508 * _2518;
            float _2538 = precise::clamp(_2536, 0.0, 1.0);
            float _2540 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2542 = _2540 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2544 = fma(_2538, _2516, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2546 = fma(_2538, _2542, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2548 = fma(_2538, _2522, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2550 = fma(_2538, _2526, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2552 = fma(_2538, _2530, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2554 = fma(_2538, _2534, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2468 = _2544;
            _2486 = _2552;
            _2462 = _2548;
            _2480 = _2550;
            _2474 = _2546;
            _2494 = _2554;
            _2556 = true;
        }
        else
        {
            bool _2558 = _2428 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2560 = isnan(_2428);
            bool _2562 = _2558 || _2560;
            bool _2564 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2566 = _2562 || _2564;
            if (!_2566)
            {
                _2460 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2568 = _2460;
            _2462 = _2568;
            if (!_2566)
            {
                _2466 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2570 = _2466;
            _2468 = _2570;
            if (!_2566)
            {
                _2472 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2572 = _2472;
            _2474 = _2572;
            if (!_2566)
            {
                _2478 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2574 = _2478;
            _2480 = _2574;
            if (!_2566)
            {
                _2484 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2576 = _2484;
            _2486 = _2576;
            if (!_2566)
            {
                _2492 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2578 = _2492;
            bool _2580 = !_2566;
            _2494 = _2578;
            if (!_2580)
            {
                bool _2582 = _2428 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2584 = isnan(_2428);
                bool _2586 = _2582 || _2584;
                bool _2588 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2590 = _2586 || _2588;
                if (!_2590)
                {
                    float _2592 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2594 = _2428 + _2592;
                    float _2596 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2598 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2596;
                    float _2600 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2602 = _2600 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2604 = 1.0 / _2598;
                    float _2606 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2608 = _2606 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2610 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2612 = _2610 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2614 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2616 = _2614 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2618 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2620 = _2618 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2622 = _2594 * _2604;
                    float _2624 = precise::clamp(_2622, 0.0, 1.0);
                    float _2626 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2628 = _2626 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2630 = fma(_2624, _2602, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2632 = fma(_2624, _2628, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2634 = fma(_2624, _2608, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2636 = fma(_2624, _2612, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2638 = fma(_2624, _2616, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2640 = fma(_2624, _2620, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2468 = _2630;
                    _2486 = _2638;
                    _2462 = _2634;
                    _2480 = _2636;
                    _2474 = _2632;
                    _2494 = _2640;
                    _2556 = true;
                }
                else
                {
                    _2468 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2486 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2462 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2480 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2474 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2494 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2556 = false;
    float _2642 = _2468;
    float _2644 = _2486;
    float _2646 = _2462;
    float _2648 = _2480;
    float _2650 = _2474;
    float _2652 = _2494;
    float _2654 = fma(_2092, -0.5, 0.5);
    float _2656 = precise::clamp(_2654, 0.0, 1.0);
    float _2658 = -_2642;
    float _2660 = _2658 + _2644;
    float _2662 = -_2646;
    float _2664 = _2662 + _2648;
    float _2666 = -_2650;
    float _2668 = _2666 + _2652;
    bool _2670 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2672 = fma(_2656, _2660, _2642);
    float _2674 = fma(_2656, _2664, _2646);
    float _2676 = fma(_2656, _2668, _2650);
    float _2678 = _2672 * 0.586610972881317138671875;
    out.m_52.x = 1.0;
    float _2680 = fma(_2674, 0.298911988735198974609375, _2678);
    float _2682 = fma(_2676, 0.114477999508380889892578125, _2680);
    out.m_94.x = 0.0;
    float _2684 = -_2682;
    float _2686 = _2674 + _2684;
    float _2688 = -_2682;
    float _2690 = _2672 + _2688;
    float _2692 = -_2682;
    float _2694 = _2676 + _2692;
    float _2696 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2698 = fma(_2686, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2682);
    float _2700 = fma(_2690, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2682);
    float _2702 = fma(_2694, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2682);
    out.m_92.w = _2696;
    out.m_96.x = _2698;
    out.m_96.y = _2700;
    out.m_96.z = _2702;
    if (!_2670)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2704 = -_2094;
    float _2706 = _2704 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2708 = -_1381;
    float _2710 = _2708 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2712 = -_1385;
    float _2714 = _2712 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2716 = _2706 * _2706;
    float _2718 = fma(_2710, _2710, _2716);
    float _2720 = fma(_2714, _2714, _2718);
    float _2722 = sqrt(_2720);
    float _2724 = rsqrt(_2720);
    float _2726 = -_2722;
    float _2728 = _2726 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2730 = _2728 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2732 = precise::clamp(_2730, 0.0, 1.0);
    float _2734 = _2710 * _2724;
    float _2736 = _2706 * _2724;
    float _2738 = abs(_2732);
    float _2740 = log2(_2738);
    float _2742 = _2714 * _2724;
    float _2744 = _2734 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2746 = _2092 * _2736;
    float _2748 = -_2736;
    float _2750 = -_2744;
    float _2752 = fma(_2748, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2750);
    float _2754 = fma(_2108, _2734, _2746);
    float _2756 = -_2742;
    float _2758 = fma(_2756, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2752);
    float _2760 = fma(_2100, _2742, _2754);
    float _2762 = precise::clamp(_2760, 0.0, 1.0);
    float _2764 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2766 = _2758 + _2764;
    float _2768 = _2740 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2770 = _2766 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2772 = precise::clamp(_2770, 0.0, 1.0);
    float _2774 = exp2(_2768);
    float _2776 = _2774 * _2772;
    float _2778 = _2762 * _2776;
    float _2780 = _2778 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2782 = _2778 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2784 = _2778 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_94.x = _2780;
    out.m_94.y = _2782;
    out.m_94.z = _2784;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2556 = false;
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
        float _2842 = as_type<float>(_131);
        out.gl_Position.z = _2842;
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
    float _159 = _141;
    if (_157)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _123;
    if (_157)
    {
        out.m_52.x = 0.0;
    }
    if (_157)
    {
        float _163 = _161 * 5.0;
        _133 = as_type<int>(_163);
    }
    int _165 = _133;
    if (_157)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2906 = as_type<float>(_165);
        out.gl_Position.z = _2906;
    }
    if (_157)
    {
        return out;
    }
    float _167 = in.m_56.x;
    float _169 = in.m_56.y;
    float _171 = in.m_56.z;
    float _173 = 1.0 / _137;
    float _175 = in.m_58.x;
    float _177 = in.m_58.y;
    float _179 = in.m_58.z;
    float _181 = in.m_60.x;
    float _183 = in.m_60.y;
    float _185 = in.m_60.z;
    float _187 = _141 * _173;
    float _189 = _167 * _167;
    float _191 = _169 * _169;
    float _193 = fma(_175, _175, _189);
    float _195 = fma(_177, _177, _191);
    float _197 = fma(_181, _181, _193);
    float _199 = _171 * _171;
    float _201 = fma(_183, _183, _195);
    float _203 = sqrt(_197);
    float _205 = fma(_179, _179, _199);
    float _207 = fma(_185, _185, _205);
    float _209 = sqrt(_201);
    float _211 = sqrt(_207);
    bool _213 = _203 > 0.0;
    bool _215 = _209 > 0.0;
    float _217 = 0.0;
    float _219 = _209;
    float _221 = _197;
    float _223 = _207;
    float _225 = _203;
    float _227 = _201;
    if (_213)
    {
        float _229 = rsqrt(_197);
        _217 = _229;
    }
    float _231 = _217;
    float _233 = 0.0;
    if (!_213)
    {
        _233 = 0.0;
    }
    float _235 = _233;
    bool _237 = _211 > 0.0;
    float _239 = _211;
    float _241 = _235;
    if (!_213)
    {
        _239 = 0.0;
    }
    float _243 = _239;
    float _245 = 0.0;
    float _247 = _243;
    if (!_213)
    {
        _245 = 0.0;
    }
    float _249 = _245;
    float _251 = 0.0;
    float _253 = _249;
    if (_215)
    {
        float _255 = rsqrt(_201);
        _251 = _255;
    }
    float _257 = _251;
    if (!_215)
    {
        _219 = 0.0;
    }
    float _259 = _219;
    float _261 = 0.0;
    float _263 = _259;
    if (_237)
    {
        float _265 = rsqrt(_207);
        _261 = _265;
    }
    float _267 = _261;
    float _269 = _231;
    if (_213)
    {
        float _271 = _231 * _167;
        _247 = _271;
    }
    float _273 = _247;
    if (_213)
    {
        float _275 = _231 * _175;
        _241 = _275;
    }
    float _277 = _241;
    if (_213)
    {
        float _279 = _231 * _181;
        _253 = _279;
    }
    float _281 = _253;
    bool _283 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    if (!_215)
    {
        _269 = 0.0;
    }
    float _285 = _269;
    float _287 = _285;
    if (!_237)
    {
        _221 = 0.0;
    }
    float _289 = _221;
    float _291 = _289;
    if (_215)
    {
        float _293 = _257 * _169;
        _263 = _293;
    }
    float _295 = _263;
    if (!_215)
    {
        _223 = 0.0;
    }
    float _297 = _223;
    float _299 = _297;
    if (_215)
    {
        float _301 = _257 * _177;
        _287 = _301;
    }
    float _303 = _287;
    if (!_237)
    {
        _225 = 0.0;
    }
    float _305 = _225;
    float _307 = _305;
    if (_215)
    {
        float _309 = _257 * _183;
        _299 = _309;
    }
    float _311 = _299;
    if (!_237)
    {
        _227 = 0.0;
    }
    float _313 = _227;
    float _315 = _313;
    if (_237)
    {
        float _317 = _267 * _171;
        _291 = _317;
    }
    float _319 = _291;
    if (_237)
    {
        float _321 = _267 * _179;
        _307 = _321;
    }
    float _323 = _307;
    if (_237)
    {
        float _325 = _267 * _185;
        _315 = _325;
    }
    float _327 = _315;
    bool _329 = !_283;
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
        _347 = _187;
    }
    _349 = false;
    float _351 = _347;
    float _353 = in.m_64.x;
    float _355 = in.m_64.y;
    float _357 = _141 * (*spvDescriptorSet0.vp_c9)._m0[193].y;
    float _359 = in.m_62.x;
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _363 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _361;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _367 = _365 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _369 = in.m_49.x;
    float _371 = in.m_49.y;
    float _373 = in.m_49.z;
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _377 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _375;
    float _379 = 1.0 / _363;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _383 = _351 + _381;
    float _385 = in.m_62.y;
    bool _387 = _351 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _389 = isnan(_351);
    bool _391 = _387 || _389;
    bool _393 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _395 = _391 || _393;
    float _397 = float(_395);
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _401 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _399;
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _405 = _403 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _407 = 1.0 / _377;
    float _409 = -_353;
    float _411 = _409 + 1.0;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _415 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _413;
    float _417 = abs(_353);
    float _419 = log2(_417);
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _423 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _421;
    float _425 = fma(_359, 6.283185482025146484375, _357);
    float _427 = fma((*spvDescriptorSet0.vp_c9)._m0[194].y, 0.01745329238474369049072265625, _425);
    float _429 = _183 * _371;
    float _431 = _177 * _371;
    float _433 = _427 * 0.60000002384185791015625;
    float _435 = fma(_181, _369, _429);
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _439 = _351 + _437;
    float _441 = 1.0 / _367;
    float _443 = _433 * 0.15915493667125701904296875;
    float _445 = fma(_175, _369, _431);
    float _447 = _419 * (*spvDescriptorSet0.vp_c9)._m0[193].z;
    float _449 = _427 * 0.15915493667125701904296875;
    int _451 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _453 = _451 != 0;
    float _455 = _427 * 1.2999999523162841796875;
    float _457 = exp2(_447);
    float _459 = _455 * 0.15915493667125701904296875;
    float _461 = _443 * 6.283185482025146484375;
    float _463 = sin(_461);
    float _465 = _439 * _379;
    float _467 = _427 + 0.52359879016876220703125;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _471 = _351 + _469;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _475 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _473;
    float _477 = fma(_401, _465, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _479 = _467 * 0.15915493667125701904296875;
    float _481 = fma(_427, 0.60000002384185791015625, 0.31415927410125732421875);
    float _483 = fma(_427, 1.2999999523162841796875, 0.680678427219390869140625);
    float _485 = _471 * _407;
    float _487 = fma(_475, _465, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _489 = _483 * 0.15915493667125701904296875;
    float _491 = _383 * _441;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _495 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _493;
    float _497 = _449 * 6.283185482025146484375;
    float _499 = sin(_497);
    float _501 = _481 * 0.15915493667125701904296875;
    float _503 = fma(_495, _465, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _505 = fma(_415, _485, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _507 = in.m_66.x;
    float _509 = in.m_66.y;
    float _511 = in.m_66.z;
    float _513 = (*spvDescriptorSet0.vp_c9)._m0[193].w * 3.1415927410125732421875;
    float _515 = _459 * 6.283185482025146484375;
    float _517 = sin(_515);
    float _519 = fma(_513, _457, _357);
    float _521 = -(*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _523 = _521 + (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _525 = fma(_359, 6.283185482025146484375, _519);
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _529 = _527 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _533 = _531 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _535 = fma(_523, _359, (*spvDescriptorSet0.vp_c9)._m0[191].x);
    float _537 = _479 * 6.283185482025146484375;
    float _539 = sin(_537);
    float _541 = fma(_529, _491, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _543 = fma(_533, _491, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _545 = fma(_405, _491, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _547 = _385 * 628.31854248046875;
    float _549 = fma(_463, 0.60000002384185791015625, _499);
    bool _551 = _351 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _553 = isnan(_351);
    bool _555 = _551 || _553;
    bool _557 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _559 = _555 || _557;
    float _561 = float(_559);
    float _563 = _501 * 6.283185482025146484375;
    float _565 = sin(_563);
    float _567 = fma(_141, _535, _547);
    float _569 = fma(_353, 0.261799395084381103515625, -0.261799395084381103515625);
    bool _571 = _507 > 0.0;
    float _573 = fma(_517, 0.300000011920928955078125, _549);
    bool _575 = _507 >= 0.0;
    bool _577 = isnan(_507);
    bool _579 = _575 || _577;
    bool _581 = isnan(0.0);
    bool _583 = _579 || _581;
    float _585 = _567 + _569;
    float _587 = -_561;
    float _589 = _587 + 1.0;
    float _591 = _489 * 6.283185482025146484375;
    float _593 = sin(_591);
    int _595 = _583 ? 0 : 1;
    float _597 = _585 * 1.10000002384185791015625;
    float _599 = _525 * 0.15915493667125701904296875;
    float _601 = _525 * 0.60000002384185791015625;
    int _603 = ~_595;
    int _605 = _603 + 1;
    int _607 = _605 + 1;
    float _609 = _525 * 1.2999999523162841796875;
    float _611 = _573 * _411;
    int _613 = _607;
    float _615 = _459;
    if (!_571)
    {
        int _617 = ~_595;
        int _619 = _617 + 1;
        _613 = _619;
    }
    int _621 = _613;
    float _623 = _585 * 0.89999997615814208984375;
    float _625 = fma(_565, 0.60000002384185791015625, _539);
    bool _627 = _351 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _629 = isnan(_351);
    bool _631 = _627 || _629;
    bool _633 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _635 = _631 || _633;
    float _637 = float(_635);
    float _639 = _609 * 0.15915493667125701904296875;
    float _641 = _623 * 0.15915493667125701904296875;
    bool _643 = _351 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _645 = isnan(_351);
    bool _647 = _643 || _645;
    bool _649 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _651 = _647 || _649;
    float _653 = float(_651);
    float _655 = _597 * 0.15915493667125701904296875;
    float _657 = -_397;
    float _659 = _657 + 1.0;
    float _661 = fma(_593, 0.300000011920928955078125, _625);
    float _663 = _653 * _589;
    float _665 = -_653;
    float _667 = _665 + 1.0;
    float _669 = _637 * _659;
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _673 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _671;
    float _675 = -_637;
    float _677 = _675 + 1.0;
    float _679 = _397 * _667;
    float _681 = -_355;
    float _683 = _681 + 1.0;
    float _685 = _503 * _669;
    float _687 = _477 * _669;
    float _689 = _487 * _669;
    float _691 = abs(_661);
    float _693 = _683 * _691;
    float _695 = fma(_673, _485, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _697 = _601 * 0.15915493667125701904296875;
    float _699 = fma(_423, _485, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _701 = fma(_677, (*spvDescriptorSet0.vp_c9)._m0[143].x, _685);
    float _703 = fma(_677, (*spvDescriptorSet0.vp_c9)._m0[143].y, _689);
    float _705 = _693 * (-45.0);
    float _707 = _585 * 0.15915493667125701904296875;
    float _709 = in.m_68.y;
    float _711 = _585 * 0.699999988079071044921875;
    float _713 = _599 * 6.283185482025146484375;
    float _715 = sin(_713);
    float _717 = fma(_541, _679, _701);
    float _719 = _705 * 0.01745329238474369049072265625;
    float _721 = fma(_543, _679, _703);
    float _723 = _711 * 0.15915493667125701904296875;
    float _725 = in.m_70.x;
    float _727 = in.m_70.y;
    float _729 = in.m_70.z;
    float _731 = _611 * 0.52359879016876220703125;
    float _733 = fma(_677, (*spvDescriptorSet0.vp_c9)._m0[143].z, _687);
    float _735 = _697 * 6.283185482025146484375;
    float _737 = sin(_735);
    float _739 = float(_621);
    float _741 = _731 * 0.15915493667125701904296875;
    float _743 = _693 * (-20.0);
    float _745 = fma(_545, _679, _733);
    float _747 = fma(_695, _663, _721);
    float _749 = _719 * 0.15915493667125701904296875;
    float _751 = _641 * 6.283185482025146484375;
    float _753 = sin(_751);
    float _755 = fma(_505, _663, _717);
    float _757 = fma(_699, _663, _745);
    float _759 = _739 * _743;
    float _761 = _567 * 0.89999997615814208984375;
    float _763 = fma(_561, (*spvDescriptorSet0.vp_c9)._m0[146].x, _755);
    float _765 = fma(_561, (*spvDescriptorSet0.vp_c9)._m0[146].y, _747);
    float _767 = _759 * 0.01745329238474369049072265625;
    float _769 = _639 * 6.283185482025146484375;
    float _771 = sin(_769);
    float _773 = fma(_737, 0.60000002384185791015625, _715);
    float _775 = _567 * 0.15915493667125701904296875;
    float _777 = _767 * 0.15915493667125701904296875;
    float _779 = _761 * 0.15915493667125701904296875;
    float _781 = _509 + (-0.0199999995529651641845703125);
    float _783 = fma(_561, (*spvDescriptorSet0.vp_c9)._m0[146].z, _757);
    if (!_453)
    {
        _615 = _385;
    }
    float _785 = _615;
    float _787 = _707 * 6.283185482025146484375;
    float _789 = sin(_787);
    float _791 = _753 * 0.89999997615814208984375;
    float _793 = _783 * _729;
    float _795 = _567 * 0.699999988079071044921875;
    float _797 = _723 * 6.283185482025146484375;
    float _799 = cos(_797);
    float _801 = fma(_771, 0.300000011920928955078125, _773);
    float _803 = fma(_709, 0.5, 0.5);
    float _805 = _803 * _801;
    float _807 = _763 * _725;
    float _809 = _655 * 6.283185482025146484375;
    float _811 = cos(_809);
    float _813 = -_791;
    float _815 = fma(_789, -1.2000000476837158203125, _813);
    float _817 = _805 * (*spvDescriptorSet0.vp_c9)._m0[193].x;
    float _819 = abs(_815);
    bool _821 = _819 > 0.001000000047497451305389404296875;
    bool _823 = isnan(_819);
    bool _825 = _821 || _823;
    bool _827 = isnan(0.001000000047497451305389404296875);
    bool _829 = _825 || _827;
    float _831 = _817 * 0.01745329238474369049072265625;
    float _833 = _741 * 6.283185482025146484375;
    float _835 = sin(_833);
    float _837 = _799 * 0.699999988079071044921875;
    float _839 = _831 * 0.15915493667125701904296875;
    float _841 = _741 * 6.283185482025146484375;
    float _843 = cos(_841);
    float _845 = fma(_811, 1.10000002384185791015625, _837);
    float _847 = abs(_845);
    bool _849 = _847 != 0.0;
    bool _851 = isnan(_847);
    bool _853 = _849 || _851;
    bool _855 = isnan(0.0);
    bool _857 = _853 || _855;
    float _859 = _749 * 6.283185482025146484375;
    float _861 = sin(_859);
    float _863 = _835 * _507;
    float _865 = _749 * 6.283185482025146484375;
    float _867 = cos(_865);
    float _869 = _843 * _507;
    float _871 = -_863;
    float _873 = fma(_843, _511, _871);
    float _875 = _829 ? _815 : 0.001000000047497451305389404296875;
    float _877 = _765 * _727;
    float _879 = fma(_835, _511, _869);
    float _881 = _873 + 0.02999999932944774627685546875;
    float _883 = abs(_875);
    bool _885 = _883 == 0.0;
    bool _887 = !_857;
    bool _889 = _885 && _887;
    float _891 = _777 * 6.283185482025146484375;
    float _893 = sin(_891);
    float _895 = abs(_875);
    bool _897 = _895 == 0.0;
    float _899 = _861 * _881;
    float _901 = fma(_739, -0.100000001490116119384765625, _879);
    float _903 = _795 * 0.15915493667125701904296875;
    float _905 = _777 * 6.283185482025146484375;
    float _907 = cos(_905);
    float _909 = -_899;
    float _911 = fma(_867, _781, _909);
    float _913 = _867 * _881;
    bool _915 = false;
    int _917 = as_type<int>(_901);
    float _919 = _845;
    float _921 = _785;
    if (_889)
    {
        bool _923 = as_type<int>(_875) >= 0;
        _915 = _923;
    }
    bool _925 = _915;
    float _927 = _775 * 6.283185482025146484375;
    float _929 = cos(_927);
    float _931 = _911 * _893;
    float _933 = _779 * 6.283185482025146484375;
    float _935 = cos(_933);
    float _937 = _911 * _907;
    float _939 = -_931;
    float _941 = fma(_907, _901, _939);
    float _943 = fma(_893, _901, _937);
    float _945 = _893;
    int _947 = _925 ? (-1) : 0;
    int _949 = as_type<int>(_941);
    if (_889)
    {
        int _951 = _925 ? 0 : 1078530011;
        _917 = _951;
    }
    int _953 = _917;
    float _955 = fma(_739, 0.100000001490116119384765625, _941);
    float _957 = _839 * 6.283185482025146484375;
    float _959 = sin(_957);
    float _961 = _943 + 0.0199999995529651641845703125;
    if (_889)
    {
        int _963 = int(0x80000000) & as_type<int>(_845);
        int _965 = _953 | _963;
        _945 = as_type<float>(_965);
    }
    float _967 = _945;
    float _969 = _839 * 6.283185482025146484375;
    float _971 = cos(_969);
    bool _973 = !_857;
    bool _975 = _973 && _897;
    float _977 = _967;
    float _979 = _967;
    if (!_975)
    {
        float _981 = abs(_845);
        bool _983 = _981 != as_type<float>(0x7f800000u /* inf */);
        bool _985 = isnan(_981);
        bool _987 = _983 || _985;
        bool _989 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _991 = _987 || _989;
        float _993 = abs(_875);
        bool _995 = _993 == as_type<float>(0x7f800000u /* inf */);
        float _997 = abs(_875);
        bool _999 = _997 == as_type<float>(0x7f800000u /* inf */);
        bool _1001 = !_991;
        bool _1003 = _999 && _1001;
        if (_1003)
        {
            bool _1005 = as_type<int>(_875) >= 0;
            _947 = _1005 ? (-1) : 0;
        }
        int _1007 = _947;
        if (_1003)
        {
            _949 = 1075235812;
        }
        int _1009 = _949;
        int _1011 = _1009;
        if (_1003)
        {
            int _1013 = ~_1007;
            int _1015 = (_1013 != 0) ? _1009 : 1061752795;
            _1011 = _1015;
        }
        int _1017 = _1011;
        if (_1003)
        {
            int _1019 = int(0x80000000) & as_type<int>(_845);
            int _1021 = _1017 | _1019;
            _977 = as_type<float>(_1021);
        }
        float _1023 = _977;
        bool _1025 = !_991;
        bool _1027 = _1025 && _995;
        _979 = _1023;
        if (!_1027)
        {
            float _1029 = abs(_845);
            float _1031 = abs(_875);
            float _1033 = precise::max(_1029, _1031);
            float _1035 = abs(_845);
            float _1037 = abs(_875);
            float _1039 = precise::min(_1035, _1037);
            float _1041 = 1.0 / _1033;
            float _1043 = abs(_845);
            float _1045 = abs(_875);
            bool _1047 = _1043 > _1045;
            bool _1049 = as_type<int>(_875) >= 0;
            float _1051 = _1039 * _1041;
            float _1053 = _1051 * _1051;
            float _1055 = _1053 + 11.33538818359375;
            float _1057 = fma(_1053, _1055, 28.84246826171875);
            float _1059 = fma(_1053, _1057, 19.6966705322265625);
            float _1061 = fma(_1053, -0.82336294651031494140625, -5.674867153167724609375);
            float _1063 = fma(_1053, _1061, -6.565555095672607421875);
            float _1065 = 1.0 / _1059;
            float _1067 = _1053 * _1063;
            float _1069 = abs(_845);
            float _1071 = abs(_875);
            float _1073 = _1069 + _1071;
            int _1075 = as_type<int>(_845) & int(0x80000000);
            float _1077 = _1051 * _1067;
            bool _1079 = _1073 > as_type<float>(0x7f800000u /* inf */);
            bool _1081 = isnan(_1073);
            bool _1083 = _1079 || _1081;
            bool _1085 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1087 = _1083 || _1085;
            float _1089 = fma(_1077, _1065, _1051);
            float _1091 = _1089;
            _979 = _1073;
            _919 = as_type<float>(_1075);
            if (_1047)
            {
                float _1093 = -_1089;
                float _1095 = _1093 + 1.57079637050628662109375;
                _1091 = _1095;
            }
            float _1097 = _1091;
            int _1099 = as_type<int>(_1097);
            if (!_1049)
            {
                float _1101 = -_1097;
                float _1103 = _1101 + 3.1415927410125732421875;
                _1099 = as_type<int>(_1103);
            }
            int _1105 = _1099;
            if (!_1087)
            {
                int _1107 = _1075 | _1105;
                _979 = as_type<float>(_1107);
            }
        }
    }
    float _1109 = _979;
    float _1111 = _919;
    float _1113 = _961 * _959;
    float _1115 = _961 * _971;
    float _1117 = _1109 + 1.57079637050628662109375;
    float _1119 = in.m_62.z;
    float _1121 = -_1113;
    float _1123 = fma(_955, _971, _1121);
    float _1125 = fma(_861, _781, _913);
    float _1127 = fma(_955, _959, _1115);
    float _1129 = _1117 * (-0.15915493667125701904296875);
    float _1131 = fma(_573, (*spvDescriptorSet0.vp_c9)._m0[194].x, _1123);
    float _1133 = _1125 + (-0.02999999932944774627685546875);
    float _1135 = in.m_60.w;
    float _1137 = _807 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1139 = _793 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1141 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1133);
    float _1143 = in.m_58.w;
    float _1145 = _877 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1147 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1127);
    float _1149 = _567 * 1.10000002384185791015625;
    float _1151 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1131);
    float _1153 = _1129 * 6.283185482025146484375;
    float _1155 = cos(_1153);
    float _1157 = _1139 * _1141;
    float _1159 = _1145 * _1147;
    float _1161 = _1137 * _1151;
    float _1163 = _1149 * 0.15915493667125701904296875;
    float _1165 = _1157 * _303;
    float _1167 = _1157 * _311;
    float _1169 = fma(_179, _373, _445);
    float _1171 = _1129 * 6.283185482025146484375;
    float _1173 = sin(_1171);
    float _1175 = fma(_1161, _277, _1165);
    float _1177 = fma(_1161, _281, _1167);
    float _1179 = _1119 * 6.283185482025146484375;
    float _1181 = fma(_185, _373, _435);
    float _1183 = -_1159;
    float _1185 = fma(_1183, _323, _1175);
    float _1187 = -_1159;
    float _1189 = fma(_1187, _327, _1177);
    float _1191 = _1179 * 0.15915493667125701904296875;
    float _1193 = _903 * 6.283185482025146484375;
    float _1195 = sin(_1193);
    float _1197 = _1185 * _1155;
    float _1199 = _1181 + _1135;
    float _1201 = _1169 + _1143;
    float _1203 = fma(_929, 1.2000000476837158203125, _935);
    float _1205 = _187 * 3.3333332538604736328125;
    float _1207 = _1163 * 6.283185482025146484375;
    float _1209 = sin(_1207);
    float _1211 = _1185 * _1173;
    float _1213 = fma(_1189, _1173, _1197);
    float _1215 = -_1211;
    float _1217 = fma(_1189, _1155, _1215);
    float _1219 = _1201 + _1213;
    float _1221 = _1191 * 6.283185482025146484375;
    float _1223 = sin(_1221);
    float _1225 = _1199 + _1217;
    float _1227 = fma(_1203, (*spvDescriptorSet0.vp_c9)._m0[191].z, _1219);
    float _1229 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1231 = _1227 + _1229;
    float _1233 = _1191 * 6.283185482025146484375;
    float _1235 = cos(_1233);
    float _1237 = _1195 + _1209;
    float _1239 = in.m_72.y;
    float _1241 = fma(_1237, (*spvDescriptorSet0.vp_c9)._m0[191].z, _1225);
    float _1243 = _1223 * _1231;
    float _1245 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1247 = _1241 + _1245;
    float _1249 = -(*spvDescriptorSet0.vp_c9)._m0[192].w;
    float _1251 = _1249 + 1.0;
    float _1253 = _1235 * _1231;
    float _1255 = -_1243;
    float _1257 = fma(_1235, _1247, _1255);
    float _1259 = fma(_1223, _1247, _1253);
    float _1261 = _1257 + (*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1263 = _1259 + (*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1265 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1267 = _1261 + _1265;
    float _1269 = _371 + _1239;
    float _1271 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1273 = _1263 + _1271;
    float _1275 = _1267 * _1267;
    float _1277 = fma(_1273, _1273, _1275);
    float _1279 = -_1205;
    float _1281 = _1279 + 3.3333332538604736328125;
    float _1283 = precise::clamp(_1281, 0.0, 1.0);
    float _1285 = sqrt(_1277);
    bool _1287 = _1285 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1289 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1291 = _1285 + _1289;
    float _1293 = 0.0 + _1205;
    float _1295 = precise::clamp(_1293, 0.0, 1.0);
    float _1297 = _1157 * _295;
    float _1299 = fma(_1161, _273, _1297);
    float _1301 = precise::min(_1295, _1283);
    float _1303 = -_1159;
    float _1305 = fma(_1303, _319, _1299);
    float _1307 = _1111;
    float _1309 = _1157;
    if (_1287)
    {
        float _1311 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1307 = _1311;
    }
    float _1313 = _1307;
    float _1315 = fma(_1301, -5.0, 5.0);
    float _1317 = _1269 + _1305;
    float _1319 = -_1315;
    float _1321 = fma(_1319, _1251, _1317);
    float _1323 = _1315;
    float _1325 = _1317;
    float _1327 = _1321;
    if (_1287)
    {
        float _1329 = rsqrt(_1277);
        _1309 = _1329;
    }
    float _1331 = _1309;
    float _1333 = _1331;
    if (!_1287)
    {
        _1323 = _1263;
    }
    float _1335 = _1323;
    float _1337 = _1335;
    if (_1287)
    {
        float _1339 = _1321 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1325 = _1339;
    }
    float _1341 = _1325;
    float _1343 = _1313;
    float _1345 = _1341;
    if (_1287)
    {
        float _1347 = _1291 * _1313;
        _1343 = _1347;
    }
    float _1349 = _1343;
    float _1351 = _1349;
    if (_1287)
    {
        float _1353 = _1349 * 0.15915493667125701904296875;
        _1351 = _1353;
    }
    float _1355 = _1351;
    float _1357 = _1291;
    if (_1287)
    {
        float _1359 = _1355 * 6.283185482025146484375;
        float _1361 = sin(_1359);
        _1357 = _1361;
    }
    float _1363 = _1357;
    float _1365 = _1363;
    if (_1287)
    {
        float _1367 = fma(_1363, _1341, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1345 = _1367;
    }
    float _1369 = _1345;
    if (!_1287)
    {
        _1365 = _1261;
    }
    float _1371 = _1365;
    float _1373 = _1371;
    if (_1287)
    {
        float _1375 = _1331 * _1369;
        _1333 = _1375;
    }
    float _1377 = _1333;
    if (_1287)
    {
        float _1379 = fma(_1273, _1377, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1337 = _1379;
    }
    float _1381 = _1337;
    if (_1287)
    {
        float _1383 = fma(_1267, _1377, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1373 = _1383;
    }
    float _1385 = _1373;
    float _1387 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1389 = _1381 + _1387;
    float _1391 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1393 = _1385 + _1391;
    float _1395 = fma(_1389, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1397 = fma(_1393, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _4690 = float2(_1395, _1397);
    float _1399 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_4690, float2(0.0), isnan(_4690)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_4690, float2(0.0), isnan(_4690)), level(0.0)).x;
    float _1401 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _1403 = fma(_1399, 100.0, _1269);
    float _1405 = _1403 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1407 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1405);
    float _1409 = fma(_1199, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1407);
    float _1411 = _1403 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1413 = _1403 + _1401;
    float _1415 = _1409 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1417 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1411);
    float _1419 = 1.0 / _1415;
    float _1421 = fma(_1199, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1417);
    float _1423 = _1421 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1425 = _1423 + _1415;
    float _1427 = _1425 * _1419;
    float _1429 = _1427 * 0.5;
    float _1431 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1433 = fma(_1429, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1431);
    float _1435 = 1.0 / _1433;
    float _1437 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1439 = _1435 * _1437;
    bool _1441 = _1439 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1443 = _1439 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1445 = !_1441;
    int _1447 = _1445 ? 0 : 1;
    int _1449 = 2;
    if (!_1441)
    {
        _1449 = 1;
    }
    int _1451 = _1449;
    int _1453 = _1451;
    if (!_1443)
    {
        _1453 = _1447;
    }
    int _1455 = _1453;
    int _1457 = _1455 << 6;
    int _1459 = _1457 + 96;
    uint _1462 = uint(int(uint(_1459) >> uint(2)));
    uint _1464 = uint(int(uint(int(_1462)) >> uint(2)));
    int _1466 = int(_1462) & 3;
    float _1468 = (*spvDescriptorSet0.vp_c15)._m0[int(_1464)][_1466];
    int _1470 = int(_1462) + 1;
    uint _1472 = uint(int(uint(_1470) >> uint(2)));
    int _1474 = _1470 & 3;
    float _1476 = (*spvDescriptorSet0.vp_c15)._m0[int(_1472)][_1474];
    int _1478 = _1457 + 104;
    uint _1480 = uint(int(uint(_1478) >> uint(2)));
    uint _1482 = uint(int(uint(int(_1480)) >> uint(2)));
    int _1484 = int(_1480) & 3;
    float _1486 = (*spvDescriptorSet0.vp_c15)._m0[int(_1482)][_1484];
    int _1488 = int(_1480) + 1;
    uint _1490 = uint(int(uint(_1488) >> uint(2)));
    int _1492 = _1488 & 3;
    float _1494 = (*spvDescriptorSet0.vp_c15)._m0[int(_1490)][_1492];
    int _1496 = _1457 + 48;
    uint _1498 = uint(int(uint(_1496) >> uint(2)));
    uint _1500 = uint(int(uint(int(_1498)) >> uint(2)));
    int _1502 = int(_1498) & 3;
    float _1504 = (*spvDescriptorSet0.vp_c15)._m0[int(_1500)][_1502];
    int _1506 = int(_1498) + 1;
    uint _1508 = uint(int(uint(_1506) >> uint(2)));
    int _1510 = _1506 & 3;
    float _1512 = (*spvDescriptorSet0.vp_c15)._m0[int(_1508)][_1510];
    int _1514 = _1457 + 64;
    uint _1516 = uint(int(uint(_1514) >> uint(2)));
    uint _1518 = uint(int(uint(int(_1516)) >> uint(2)));
    int _1520 = int(_1516) & 3;
    float _1522 = (*spvDescriptorSet0.vp_c15)._m0[int(_1518)][_1520];
    int _1524 = int(_1516) + 1;
    uint _1526 = uint(int(uint(_1524) >> uint(2)));
    int _1528 = _1524 & 3;
    float _1530 = (*spvDescriptorSet0.vp_c15)._m0[int(_1526)][_1528];
    int _1532 = _1457 + 56;
    uint _1534 = uint(int(uint(_1532) >> uint(2)));
    uint _1536 = uint(int(uint(int(_1534)) >> uint(2)));
    int _1538 = int(_1534) & 3;
    float _1540 = (*spvDescriptorSet0.vp_c15)._m0[int(_1536)][_1538];
    int _1542 = int(_1534) + 1;
    uint _1544 = uint(int(uint(_1542) >> uint(2)));
    int _1546 = _1542 & 3;
    float _1548 = (*spvDescriptorSet0.vp_c15)._m0[int(_1544)][_1546];
    int _1550 = _1457 + 72;
    uint _1552 = uint(int(uint(_1550) >> uint(2)));
    uint _1554 = uint(int(uint(int(_1552)) >> uint(2)));
    int _1556 = int(_1552) & 3;
    float _1558 = (*spvDescriptorSet0.vp_c15)._m0[int(_1554)][_1556];
    int _1560 = int(_1552) + 1;
    uint _1562 = uint(int(uint(_1560) >> uint(2)));
    int _1564 = _1560 & 3;
    float _1566 = (*spvDescriptorSet0.vp_c15)._m0[int(_1562)][_1564];
    float _1568 = _1413 * _1476;
    float _1570 = fma(_1201, _1468, _1568);
    float _1572 = fma(_1199, _1486, _1570);
    float _1574 = _1572 + _1494;
    int _1576 = _1457 + 80;
    uint _1578 = uint(int(uint(_1576) >> uint(2)));
    uint _1580 = uint(int(uint(int(_1578)) >> uint(2)));
    int _1582 = int(_1578) & 3;
    float _1584 = (*spvDescriptorSet0.vp_c15)._m0[int(_1580)][_1582];
    int _1586 = int(_1578) + 1;
    uint _1588 = uint(int(uint(_1586) >> uint(2)));
    int _1590 = _1586 & 3;
    float _1592 = (*spvDescriptorSet0.vp_c15)._m0[int(_1588)][_1590];
    float _1594 = _1413 * _1512;
    float _1596 = 1.0 / _1574;
    float _1598 = fma(_1201, _1504, _1594);
    int _1600 = _1457 + 88;
    uint _1602 = uint(int(uint(_1600) >> uint(2)));
    uint _1604 = uint(int(uint(int(_1602)) >> uint(2)));
    int _1606 = int(_1602) & 3;
    float _1608 = (*spvDescriptorSet0.vp_c15)._m0[int(_1604)][_1606];
    int _1610 = int(_1602) + 1;
    uint _1612 = uint(int(uint(_1610) >> uint(2)));
    int _1614 = _1610 & 3;
    float _1616 = (*spvDescriptorSet0.vp_c15)._m0[int(_1612)][_1614];
    float _1618 = _1413 * _1530;
    float _1620 = fma(_1201, _1522, _1618);
    float _1622 = fma(_1199, _1540, _1598);
    float _1624 = _1622 + _1548;
    float _1626 = fma(_1199, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1628 = fma(_1199, _1558, _1620);
    float _1630 = _1624 * _1596;
    float _1632 = _1628 + _1566;
    bool _1634 = _1630 >= 0.0;
    float _1636 = fma(_1201, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1638 = _1632 * _1596;
    bool _1640 = _1630 <= 1.0;
    bool _1642 = _1640 && _1634;
    float _1644 = floor(_1636);
    bool _1646 = _1638 >= 0.0;
    bool _1648 = _1646 && _1642;
    bool _1650 = _1638 <= 1.0;
    bool _1652 = _1650 && _1648;
    float _1654 = floor(_1626);
    float _1656 = _1413 * _1592;
    float _1658 = fma(_1201, _1584, _1656);
    float _1660 = -_1644;
    float _1662 = _1636 + _1660;
    float _1664 = fma(_1199, _1608, _1658);
    float _1666 = as_type<float>(_1455);
    if (_1652)
    {
        float _1668 = float(_1455);
        _1666 = _1668;
    }
    float _1670 = _1666;
    float _1672 = _1664 + _1616;
    float _1674 = _1656;
    if (_1652)
    {
        float _1676 = rint(_1670);
        float _1678 = precise::max(_1676, 0.0);
        uint _1680 = uint(_1678);
        uint _1682 = clamp(_1680, 0u, 65535u);
        _1674 = as_type<float>(_1682);
    }
    float _1684 = _1674;
    float _1686 = -_1654;
    float _1688 = _1626 + _1686;
    float _1690 = _1672 * _1596;
    float2 _5186 = float2(_1662, _1688);
    float _1692 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5186, float2(0.0), isnan(_5186)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5186, float2(0.0), isnan(_5186)), level(0.0)).x;
    float _1694 = _1638;
    if (_1652)
    {
        float3 _5201 = float3(_1630, _1638, float(as_type<int>(_1684)));
        float3 _5205 = select(_5201, float3(0.0), isnan(_5201));
        float _1696 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5205.xy, uint(rint(_5205.z)), _1690, level(0.0));
        _1694 = _1696;
    }
    float _1698 = _1694;
    float _1700 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _1702 = in.m_62.w;
    float _1704 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    if (_453)
    {
        _921 = _359;
    }
    float _1706 = _921;
    float _1708 = _1700 * _359;
    int _1710 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1712 = _1710 != 0;
    float _1714 = in.m_74.x;
    float _1716 = in.m_74.y;
    float _1718 = in.m_74.z;
    float _1720 = in.m_74.w;
    int _1722 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1724 = _1722 != 0;
    float _1726 = trunc(_1708);
    int _1728 = int(_1726);
    float _1730 = in.m_68.x;
    float _1732 = _907;
    if (_1712)
    {
        float _1734 = in.m_62.z;
        _1732 = _1734;
    }
    float _1736 = _1732;
    float _1738 = _1662;
    if (!_453)
    {
        float _1740 = in.m_62.z;
        _1738 = _1740;
    }
    float _1742 = _1738;
    bool _1744 = _1702 > 0.5;
    int _1746 = _1728 << 4;
    int _1748 = _1746 + 1712;
    uint _1750 = uint(int(uint(_1748) >> uint(2)));
    uint _1752 = uint(int(uint(int(_1750)) >> uint(2)));
    int _1754 = int(_1750) & 3;
    float _1756 = (*spvDescriptorSet0.vp_c9)._m0[int(_1752)][_1754];
    int _1758 = int(_1750) + 1;
    uint _1760 = uint(int(uint(_1758) >> uint(2)));
    int _1762 = _1758 & 3;
    float _1764 = (*spvDescriptorSet0.vp_c9)._m0[int(_1760)][_1762];
    float _1766 = _311 * _1718;
    float _1768 = -_709;
    float _1770 = _1768 + 1.0;
    float _1772 = _303 * _1718;
    float _1774 = _295 * _1718;
    float _1776 = fma(_281, _1714, _1766);
    float _1778 = _1766;
    float _1780 = _1730;
    if (_1712)
    {
        _1778 = _1730;
    }
    float _1782 = _1778;
    float _1784 = fma(_277, _1714, _1772);
    int _1786 = _1748 + 8;
    uint _1788 = uint(int(uint(_1786) >> uint(2)));
    uint _1790 = uint(int(uint(int(_1788)) >> uint(2)));
    int _1792 = int(_1788) & 3;
    float _1794 = (*spvDescriptorSet0.vp_c9)._m0[int(_1790)][_1792];
    int _1796 = _1744 ? as_type<int>(_1770) : as_type<int>(_709);
    float _1798 = -_1716;
    float _1800 = fma(_323, _1798, _1784);
    bool _1802 = _1736 > 0.5;
    bool _1804 = _1802 && _1712;
    float _1806 = fma(_273, _1714, _1774);
    float _1808 = -_1716;
    float _1810 = fma(_327, _1808, _1776);
    float _1812 = _1724 ? as_type<float>(_1796) : _709;
    float _1814 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1816 = -_1716;
    float _1818 = fma(_319, _1816, _1806);
    float _1820 = _1704 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1822 = _1806;
    float _1824 = _1782;
    if (!_1712)
    {
        _1822 = _1730;
    }
    float _1826 = _1822;
    float _1828 = _1742;
    float _1830 = _1826;
    if (!_453)
    {
        _1780 = _1742;
    }
    float _1832 = _1780;
    out.m_76.x = _1800;
    out.m_76.y = _1818;
    out.m_76.z = _1810;
    float _1834 = fma(_1820, _1812, -0.5);
    float _1836 = _1832;
    float _1838 = _1834;
    if (_1804)
    {
        float _1840 = -_1782;
        float _1842 = _1840 + 1.0;
        _1824 = _1842;
    }
    float _1844 = _1824;
    float _1846 = in.m_78.x;
    float _1848 = in.m_78.y;
    float _1850 = in.m_78.z;
    if (_453)
    {
        _1836 = _385;
    }
    float _1852 = _1836;
    float _1854 = _1852;
    if (_453)
    {
        _1828 = _385;
    }
    float _1856 = _1828;
    float _1858 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _1860 = _1127 != 0.0;
    bool _1862 = isnan(_1127);
    bool _1864 = _1860 || _1862;
    bool _1866 = isnan(0.0);
    bool _1868 = _1864 || _1866;
    float _1870 = _1814 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1872 = fma(_1706, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1858);
    bool _1874 = _1131 == 0.0;
    bool _1876 = !_1868;
    bool _1878 = _1874 && _1876;
    float _1880 = _1706 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_1712)
    {
        _1830 = _1844;
    }
    float _1882 = _1830;
    float _1884 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1886 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1872);
    float _1888 = fma(_1870, _1882, -0.5);
    bool _1890 = _1125 == 0.02999999932944774627685546875;
    bool _1892 = _1890 && _1878;
    float _1894 = -_1884;
    float _1896 = fma(_1880, 2.0, _1894);
    float _1898 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1900 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1902 = _1852 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1904 = _1756 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1906 = fma(_1856, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1898);
    float _1908 = fma(_1902, -2.0, _1900);
    float _1910 = -_141;
    float _1912 = fma(_1910, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1896);
    float _1914 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1906);
    float _1916 = _1764 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1918 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1908);
    float _1920 = _1794 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1922 = _1914;
    float _1924 = _1888;
    if (_1892)
    {
        _1854 = _1846;
    }
    float _1926 = _1854;
    float _1928 = fma(_1886, _1888, _1912);
    float _1930 = -_1918;
    float _1932 = fma(_1914, _1834, _1930);
    float _1934 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1936 = _1904 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1938 = _1916 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1940 = _1920 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1942 = _1926;
    if (_1892)
    {
        _1838 = _1926;
    }
    float _1944 = _1838;
    float _1946 = _1928 + 0.5;
    float _1948 = _1944;
    if (!_1892)
    {
        _1942 = _1846;
    }
    float _1950 = _1942;
    float _1952 = _1932 + 0.5;
    if (_1892)
    {
        _1922 = _1848;
    }
    float _1954 = _1922;
    out.m_80.x = _1936;
    out.m_80.y = _1938;
    out.m_80.z = _1940;
    out.m_80.w = _1934;
    float _1956 = _1954;
    if (_1892)
    {
        _159 = _1850;
    }
    float _1958 = _159;
    float _1960 = _1958;
    if (!_1892)
    {
        float _1962 = fma(_1133, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1850);
        _1960 = _1962;
    }
    float _1964 = _1960;
    if (_1892)
    {
        _1924 = _1954;
    }
    float _1966 = _1924;
    float _1968 = _1966;
    if (!_1892)
    {
        float _1970 = fma(_1131, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1950);
        _1948 = _1970;
    }
    float _1972 = _1948;
    if (!_1892)
    {
        _1956 = _1848;
    }
    float _1974 = _1956;
    float _1976 = _1716 * _1850;
    out.m_82.z = _1946;
    out.m_82.w = _1952;
    if (!_1892)
    {
        float _1978 = fma(_1127, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1974);
        _1968 = _1978;
    }
    float _1980 = _1968;
    float _1982 = _1718 * _1950;
    float _1984 = -_1976;
    float _1986 = fma(_1718, _1974, _1984);
    float _1988 = _295 * _1964;
    float _1990 = -_1982;
    float _1992 = fma(_1714, _1850, _1990);
    float _1994 = _1714 * _1974;
    float _1996 = _303 * _1964;
    float _1998 = _311 * _1964;
    float _2000 = fma(_273, _1972, _1988);
    float _2002 = -_1994;
    float _2004 = fma(_1716, _1950, _2002);
    float _2006 = fma(_277, _1972, _1996);
    float _2008 = fma(_281, _1972, _1998);
    float _2010 = _1996;
    if (_1287)
    {
        float _2012 = _1355 * 6.283185482025146484375;
        float _2014 = cos(_2012);
        _2010 = _2014;
    }
    float _2016 = _2010;
    float _2018 = _2004 * _1720;
    float _2020 = _1986 * _1720;
    float _2022 = _1992 * _1720;
    float _2024 = -_1980;
    float _2026 = fma(_323, _2024, _2006);
    float _2028 = _2018 * _303;
    float _2030 = _2018 * _311;
    float _2032 = _2018 * _295;
    float _2034 = -_1980;
    float _2036 = fma(_327, _2034, _2008);
    float _2038 = fma(_2020, _277, _2028);
    float _2040 = fma(_2020, _281, _2030);
    float _2042 = fma(_2020, _273, _2032);
    float _2044 = _2026 * _1173;
    float _2046 = -_2022;
    float _2048 = fma(_2046, _323, _2038);
    float _2050 = -_2022;
    float _2052 = fma(_2050, _327, _2040);
    float _2054 = -_2022;
    float _2056 = fma(_2054, _319, _2042);
    float _2058 = _2042;
    float _2060 = _2044;
    if (_1287)
    {
        float _2062 = _2016 + (-1.0);
        _2058 = _2062;
    }
    float _2064 = _2058;
    float _2066 = _2026 * _1155;
    float _2068 = -_2044;
    float _2070 = fma(_2036, _1155, _2068);
    float _2072 = in.m_64.w;
    if (_1287)
    {
        float _2074 = _2064 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2060 = _2074;
    }
    float _2076 = _2060;
    float _2078 = fma(_2036, _1173, _2066);
    float _2080 = _1413 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    out.m_84.x = _2048;
    out.m_84.y = _2056;
    out.m_84.z = _2052;
    if (_1287)
    {
        float _2082 = fma(_1321, _2016, _2076);
        _1327 = _2082;
    }
    float _2084 = _1327;
    float _2086 = _1223 * _2078;
    float _2088 = _1235 * _2078;
    float _2090 = -_1980;
    float _2092 = fma(_319, _2090, _2000);
    float _2094 = fma(_1399, 100.0, _2084);
    float _2096 = _1413 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2098 = -_2086;
    float _2100 = fma(_1235, _2070, _2098);
    float _2102 = fma(_1201, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2080);
    float _2104 = _2094 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2106 = fma(_1201, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2096);
    float _2108 = fma(_1223, _2070, _2088);
    float _2110 = abs(_1439);
    float _2112 = log2(_2110);
    float _2114 = _2094 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2116 = fma(_1381, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2104);
    float _2118 = fma(_1199, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2102);
    float _2120 = fma(_1199, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2106);
    float _2122 = fma(_1381, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2114);
    float _2124 = _2094 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2126 = _2118 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _2128 = _2120 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    out.m_86.w = _2072;
    float _2130 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2122);
    float _2132 = trunc(_2126);
    int _2134 = int(_2132);
    float _2136 = _2094 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2138 = fma(_1381, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2124);
    float _2140 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2116);
    float _2142 = _2130 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2144 = fma(_1381, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2136);
    float _2146 = _2112 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2148 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2138);
    float _2150 = trunc(_2128);
    int _2152 = int(_2150);
    float _2154 = _2140 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2156 = _2142 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2158 = _2142 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2160 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2144);
    float _2162 = _2148 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2164 = _2142 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2166 = _2142 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2168 = exp2(_2146);
    float _2170 = fma(_2154, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2156);
    float _2172 = fma(_2154, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2158);
    float _2174 = fma(_2154, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2164);
    float _2176 = fma(_2154, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2166);
    float _2178 = _2160 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2180 = fma(_2162, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2170);
    float _2182 = fma(_2162, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2172);
    int _2184 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2186 = _2134 + _2184;
    int _2188 = _2186 + 1;
    float _2190 = fma(_2162, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2174);
    int _2192 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2194 = _2152 + _2192;
    int _2196 = _2194 + 1;
    float _2198 = fma(_2162, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2176);
    float _2200 = fma(_2178, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2180);
    float _2202 = fma(_2178, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2182);
    bool _2204 = _2188 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _2206 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2208 = _2094 + _2206;
    int _2210 = _2188 | _2196;
    float _2212 = fma(_2168, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2214 = precise::clamp(_2212, 0.0, 1.0);
    float _2216 = fma(_2178, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2190);
    bool _2218 = _2210 < 0;
    bool _2220 = _2218 || _2204;
    float _2222 = fma(_2178, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2198);
    bool _2224 = _1439 <= 8000.0;
    bool _2226 = isnan(_1439);
    bool _2228 = _2224 || _2226;
    bool _2230 = isnan(8000.0);
    bool _2232 = _2228 || _2230;
    float _2234 = float(_2232);
    float _2236 = fma(_2214, -2.0, 3.0);
    float _2238 = _2214 * _2214;
    bool _2240 = _2196 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2242 = _2240 || _2220;
    float _2244 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2246 = _1381 + _2244;
    float _2248 = _2208 * _2208;
    float _2250 = _2238 * _2236;
    out.gl_Position.x = _2216;
    out.gl_Position.y = _2200;
    out.gl_Position.z = _2202;
    out.gl_Position.w = _2222;
    float _2252 = fma(_2246, _2246, _2248);
    float _2254 = -_2250;
    float _2256 = _2254 + 1.0;
    float _2258 = fma(_2256, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2250);
    float _2260 = _2234 * _2258;
    float _2262 = _2216;
    float _2264 = _2200;
    float _2266 = _2222;
    float _2268 = _2260;
    float _2270 = _2128;
    if (_2242)
    {
        _2262 = 1.0;
    }
    float _2272 = _2262;
    float _2274 = _2272;
    if (!_2242)
    {
        int _2276 = _2196 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2278 = _2276 + _2188;
        float _2280 = floor(_2128);
        int _2282 = _2278 << 2;
        uint _2284 = uint(int(uint(_2278) >> uint(2)));
        int _2286 = 12 & _2282;
        int _2288 = int(_2284) << 4;
        int _2290 = _2288 + _2286;
        float _2292 = floor(_2126);
        float _2294 = -_2280;
        float _2296 = _2128 + _2294;
        int _2298 = _2290 + 400;
        uint _2300 = uint(int(uint(_2298) >> uint(2)));
        uint _2302 = uint(int(uint(int(_2300)) >> uint(2)));
        int _2304 = int(_2300) & 3;
        float _2306 = (*spvDescriptorSet0.vp_c15)._m0[int(_2302)][_2304];
        float _2308 = -_2292;
        float _2310 = _2126 + _2308;
        float _2312 = rint(_2306);
        float _2314 = precise::max(_2312, 0.0);
        uint _2316 = uint(_2314);
        uint _2318 = clamp(_2316, 0u, 65535u);
        float3 _6289 = float3(_2310, _2296, float(int(_2318)));
        float3 _6291 = select(_6289, float3(0.0), isnan(_6289));
        float _2320 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6291.xy, uint(rint(_6291.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6291.xy, uint(rint(_6291.z)), level(0.0)).x;
        int _2322 = _2278 << 4;
        int _2324 = _2322 + 2048;
        uint _2326 = uint(int(uint(_2324) >> uint(2)));
        uint _2328 = uint(int(uint(int(_2326)) >> uint(2)));
        int _2330 = int(_2326) & 3;
        float _2332 = (*spvDescriptorSet0.vp_c15)._m0[int(_2328)][_2330];
        int _2334 = int(_2326) + 1;
        uint _2336 = uint(int(uint(_2334) >> uint(2)));
        int _2338 = _2334 & 3;
        float _2340 = (*spvDescriptorSet0.vp_c15)._m0[int(_2336)][_2338];
        int _2342 = _2324 + 8;
        uint _2344 = uint(int(uint(_2342) >> uint(2)));
        uint _2346 = uint(int(uint(int(_2344)) >> uint(2)));
        int _2348 = int(_2344) & 3;
        float _2350 = (*spvDescriptorSet0.vp_c15)._m0[int(_2346)][_2348];
        int _2352 = int(_2344) + 1;
        uint _2354 = uint(int(uint(_2352) >> uint(2)));
        int _2356 = _2352 & 3;
        float _2358 = (*spvDescriptorSet0.vp_c15)._m0[int(_2354)][_2356];
        float _2360 = _1413 * _2340;
        float _2362 = fma(_1201, _2332, _2360);
        float _2364 = fma(_1199, _2350, _2362);
        float _2366 = _2364 + _2358;
        float _2368 = precise::clamp(_2366, 0.0, 1.0);
        float _2370 = -_2368;
        float _2372 = _2370 + _2320;
        float _2374 = fma(_2372, 500.0, 1.5);
        float _2376 = exp2(_2374);
        float _2378 = 0.0 + _2376;
        float _2380 = precise::clamp(_2378, 0.0, 1.0);
        _2264 = _2306;
        _2274 = _2380;
        _2266 = _2320;
    }
    float _2382 = _2264;
    float _2384 = _2274;
    float _2386 = _2266;
    float _2388 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2390 = _1385 + _2388;
    float _2392 = _2260 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2394 = -_1692;
    float _2396 = _2394 + 1.0;
    float _2398 = _2382;
    float _2400 = _2386;
    if (!_1652)
    {
        _2398 = 1.0;
    }
    float _2402 = _2398;
    float _2404 = fma(_2390, _2390, _2252);
    float _2406 = _2402;
    if (_1652)
    {
        bool _2408 = _1698 >= _1690;
        bool _2410 = isnan(_1698);
        bool _2412 = _2408 || _2410;
        bool _2414 = isnan(_1690);
        bool _2416 = _2412 || _2414;
        float _2418 = float(_2416);
        _2406 = _2418;
    }
    float _2420 = _2406;
    float _2422 = _2396 * _2392;
    float _2424 = precise::clamp(_2422, 0.0, 1.0);
    out.m_88.x = _2108;
    out.m_88.y = _2092;
    out.m_88.z = _2100;
    float _2426 = _2420 * _2384;
    float _2428 = sqrt(_2404);
    float _2430 = -_2424;
    float _2432 = fma(_2430, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_90.x = _1381;
    out.m_90.y = _2094;
    out.m_90.z = _1385;
    float _2434 = -_2426;
    float _2436 = fma(_2434, _2432, 1.0);
    float _2438 = precise::clamp(_2436, 0.0, 1.0);
    float _2440 = _2438 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_92.x = _2440;
    bool _2442 = _2428 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2444 = isnan(_2428);
    bool _2446 = _2442 || _2444;
    bool _2448 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2450 = _2446 || _2448;
    float _2452 = _2424;
    float _2454 = _2432;
    float _2456 = _2438;
    if (!_2450)
    {
        _2268 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2458 = _2268;
    float _2460 = _2458;
    float _2462 = _2458;
    if (!_2450)
    {
        _2270 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2464 = _2270;
    float _2466 = _2464;
    float _2468 = _2464;
    if (!_2450)
    {
        _2400 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2470 = _2400;
    float _2472 = _2470;
    float _2474 = _2470;
    if (!_2450)
    {
        _2452 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2476 = _2452;
    float _2478 = _2476;
    float _2480 = _2476;
    if (!_2450)
    {
        _2454 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2482 = _2454;
    float _2484 = _2482;
    float _2486 = _2482;
    if (!_2450)
    {
        _2456 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2488 = _2456;
    bool _2490 = !_2450;
    float _2492 = _2488;
    float _2494 = _2488;
    if (!_2490)
    {
        bool _2496 = _2428 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2498 = isnan(_2428);
        bool _2500 = _2496 || _2498;
        bool _2502 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2504 = _2500 || _2502;
        if (!_2504)
        {
            float _2506 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2508 = _2428 + _2506;
            float _2510 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2512 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2510;
            float _2514 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2516 = _2514 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2518 = 1.0 / _2512;
            float _2520 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2522 = _2520 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2524 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2526 = _2524 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2528 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2530 = _2528 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2532 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2534 = _2532 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2536 = _2508 * _2518;
            float _2538 = precise::clamp(_2536, 0.0, 1.0);
            float _2540 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2542 = _2540 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2544 = fma(_2538, _2516, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2546 = fma(_2538, _2542, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2548 = fma(_2538, _2522, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2550 = fma(_2538, _2526, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2552 = fma(_2538, _2530, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2554 = fma(_2538, _2534, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2468 = _2544;
            _2486 = _2552;
            _2462 = _2548;
            _2480 = _2550;
            _2474 = _2546;
            _2494 = _2554;
            _2556 = true;
        }
        else
        {
            bool _2558 = _2428 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2560 = isnan(_2428);
            bool _2562 = _2558 || _2560;
            bool _2564 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2566 = _2562 || _2564;
            if (!_2566)
            {
                _2460 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2568 = _2460;
            _2462 = _2568;
            if (!_2566)
            {
                _2466 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2570 = _2466;
            _2468 = _2570;
            if (!_2566)
            {
                _2472 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2572 = _2472;
            _2474 = _2572;
            if (!_2566)
            {
                _2478 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2574 = _2478;
            _2480 = _2574;
            if (!_2566)
            {
                _2484 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2576 = _2484;
            _2486 = _2576;
            if (!_2566)
            {
                _2492 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2578 = _2492;
            bool _2580 = !_2566;
            _2494 = _2578;
            if (!_2580)
            {
                bool _2582 = _2428 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2584 = isnan(_2428);
                bool _2586 = _2582 || _2584;
                bool _2588 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2590 = _2586 || _2588;
                if (!_2590)
                {
                    float _2592 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2594 = _2428 + _2592;
                    float _2596 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2598 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2596;
                    float _2600 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2602 = _2600 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2604 = 1.0 / _2598;
                    float _2606 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2608 = _2606 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2610 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2612 = _2610 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2614 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2616 = _2614 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2618 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2620 = _2618 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2622 = _2594 * _2604;
                    float _2624 = precise::clamp(_2622, 0.0, 1.0);
                    float _2626 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2628 = _2626 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2630 = fma(_2624, _2602, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2632 = fma(_2624, _2628, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2634 = fma(_2624, _2608, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2636 = fma(_2624, _2612, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2638 = fma(_2624, _2616, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2640 = fma(_2624, _2620, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2468 = _2630;
                    _2486 = _2638;
                    _2462 = _2634;
                    _2480 = _2636;
                    _2474 = _2632;
                    _2494 = _2640;
                    _2556 = true;
                }
                else
                {
                    _2468 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2486 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2462 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2480 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2474 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2494 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2556 = false;
    float _2642 = _2468;
    float _2644 = _2486;
    float _2646 = _2462;
    float _2648 = _2480;
    float _2650 = _2474;
    float _2652 = _2494;
    float _2654 = fma(_2092, -0.5, 0.5);
    float _2656 = precise::clamp(_2654, 0.0, 1.0);
    float _2658 = -_2642;
    float _2660 = _2658 + _2644;
    float _2662 = -_2646;
    float _2664 = _2662 + _2648;
    float _2666 = -_2650;
    float _2668 = _2666 + _2652;
    bool _2670 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2672 = fma(_2656, _2660, _2642);
    float _2674 = fma(_2656, _2664, _2646);
    float _2676 = fma(_2656, _2668, _2650);
    float _2678 = _2672 * 0.586610972881317138671875;
    out.m_52.x = 1.0;
    float _2680 = fma(_2674, 0.298911988735198974609375, _2678);
    float _2682 = fma(_2676, 0.114477999508380889892578125, _2680);
    out.m_94.x = 0.0;
    float _2684 = -_2682;
    float _2686 = _2674 + _2684;
    float _2688 = -_2682;
    float _2690 = _2672 + _2688;
    float _2692 = -_2682;
    float _2694 = _2676 + _2692;
    float _2696 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2698 = fma(_2686, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2682);
    float _2700 = fma(_2690, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2682);
    float _2702 = fma(_2694, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2682);
    out.m_92.w = _2696;
    out.m_96.x = _2698;
    out.m_96.y = _2700;
    out.m_96.z = _2702;
    if (!_2670)
    {
        return out;
    }
    float _2704 = -_2094;
    float _2706 = _2704 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2708 = -_1381;
    float _2710 = _2708 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2712 = -_1385;
    float _2714 = _2712 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2716 = _2706 * _2706;
    float _2718 = fma(_2710, _2710, _2716);
    float _2720 = fma(_2714, _2714, _2718);
    float _2722 = sqrt(_2720);
    float _2724 = rsqrt(_2720);
    float _2726 = -_2722;
    float _2728 = _2726 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2730 = _2728 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2732 = precise::clamp(_2730, 0.0, 1.0);
    float _2734 = _2710 * _2724;
    float _2736 = _2706 * _2724;
    float _2738 = abs(_2732);
    float _2740 = log2(_2738);
    float _2742 = _2714 * _2724;
    float _2744 = _2734 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2746 = _2092 * _2736;
    float _2748 = -_2736;
    float _2750 = -_2744;
    float _2752 = fma(_2748, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2750);
    float _2754 = fma(_2108, _2734, _2746);
    float _2756 = -_2742;
    float _2758 = fma(_2756, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2752);
    float _2760 = fma(_2100, _2742, _2754);
    float _2762 = precise::clamp(_2760, 0.0, 1.0);
    float _2764 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2766 = _2758 + _2764;
    float _2768 = _2740 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2770 = _2766 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2772 = precise::clamp(_2770, 0.0, 1.0);
    float _2774 = exp2(_2768);
    float _2776 = _2774 * _2772;
    float _2778 = _2762 * _2776;
    float _2780 = _2778 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2782 = _2778 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2784 = _2778 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_94.x = _2780;
    out.m_94.y = _2782;
    out.m_94.z = _2784;
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
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2556 = false;
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
        float _2842 = as_type<float>(_131);
        out.gl_Position.z = _2842;
    }
    if (!_119)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _159 = _141;
    if (_157)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _123;
    if (_157)
    {
        out.m_52.x = 0.0;
    }
    if (_157)
    {
        float _163 = _161 * 5.0;
        _133 = as_type<int>(_163);
    }
    int _165 = _133;
    if (_157)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2906 = as_type<float>(_165);
        out.gl_Position.z = _2906;
    }
    if (_157)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _167 = in.m_56.x;
    float _169 = in.m_56.y;
    float _171 = in.m_56.z;
    float _173 = 1.0 / _137;
    float _175 = in.m_58.x;
    float _177 = in.m_58.y;
    float _179 = in.m_58.z;
    float _181 = in.m_60.x;
    float _183 = in.m_60.y;
    float _185 = in.m_60.z;
    float _187 = _141 * _173;
    float _189 = _167 * _167;
    float _191 = _169 * _169;
    float _193 = fma(_175, _175, _189);
    float _195 = fma(_177, _177, _191);
    float _197 = fma(_181, _181, _193);
    float _199 = _171 * _171;
    float _201 = fma(_183, _183, _195);
    float _203 = sqrt(_197);
    float _205 = fma(_179, _179, _199);
    float _207 = fma(_185, _185, _205);
    float _209 = sqrt(_201);
    float _211 = sqrt(_207);
    bool _213 = _203 > 0.0;
    bool _215 = _209 > 0.0;
    float _217 = 0.0;
    float _219 = _209;
    float _221 = _197;
    float _223 = _207;
    float _225 = _203;
    float _227 = _201;
    if (_213)
    {
        float _229 = rsqrt(_197);
        _217 = _229;
    }
    float _231 = _217;
    float _233 = 0.0;
    if (!_213)
    {
        _233 = 0.0;
    }
    float _235 = _233;
    bool _237 = _211 > 0.0;
    float _239 = _211;
    float _241 = _235;
    if (!_213)
    {
        _239 = 0.0;
    }
    float _243 = _239;
    float _245 = 0.0;
    float _247 = _243;
    if (!_213)
    {
        _245 = 0.0;
    }
    float _249 = _245;
    float _251 = 0.0;
    float _253 = _249;
    if (_215)
    {
        float _255 = rsqrt(_201);
        _251 = _255;
    }
    float _257 = _251;
    if (!_215)
    {
        _219 = 0.0;
    }
    float _259 = _219;
    float _261 = 0.0;
    float _263 = _259;
    if (_237)
    {
        float _265 = rsqrt(_207);
        _261 = _265;
    }
    float _267 = _261;
    float _269 = _231;
    if (_213)
    {
        float _271 = _231 * _167;
        _247 = _271;
    }
    float _273 = _247;
    if (_213)
    {
        float _275 = _231 * _175;
        _241 = _275;
    }
    float _277 = _241;
    if (_213)
    {
        float _279 = _231 * _181;
        _253 = _279;
    }
    float _281 = _253;
    bool _283 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    if (!_215)
    {
        _269 = 0.0;
    }
    float _285 = _269;
    float _287 = _285;
    if (!_237)
    {
        _221 = 0.0;
    }
    float _289 = _221;
    float _291 = _289;
    if (_215)
    {
        float _293 = _257 * _169;
        _263 = _293;
    }
    float _295 = _263;
    if (!_215)
    {
        _223 = 0.0;
    }
    float _297 = _223;
    float _299 = _297;
    if (_215)
    {
        float _301 = _257 * _177;
        _287 = _301;
    }
    float _303 = _287;
    if (!_237)
    {
        _225 = 0.0;
    }
    float _305 = _225;
    float _307 = _305;
    if (_215)
    {
        float _309 = _257 * _183;
        _299 = _309;
    }
    float _311 = _299;
    if (!_237)
    {
        _227 = 0.0;
    }
    float _313 = _227;
    float _315 = _313;
    if (_237)
    {
        float _317 = _267 * _171;
        _291 = _317;
    }
    float _319 = _291;
    if (_237)
    {
        float _321 = _267 * _179;
        _307 = _321;
    }
    float _323 = _307;
    if (_237)
    {
        float _325 = _267 * _185;
        _315 = _325;
    }
    float _327 = _315;
    bool _329 = !_283;
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
        _347 = _187;
    }
    _349 = false;
    float _351 = _347;
    float _353 = in.m_64.x;
    float _355 = in.m_64.y;
    float _357 = _141 * (*spvDescriptorSet0.vp_c9)._m0[193].y;
    float _359 = in.m_62.x;
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _363 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _361;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _367 = _365 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _369 = in.m_49.x;
    float _371 = in.m_49.y;
    float _373 = in.m_49.z;
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _377 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _375;
    float _379 = 1.0 / _363;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _383 = _351 + _381;
    float _385 = in.m_62.y;
    bool _387 = _351 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _389 = isnan(_351);
    bool _391 = _387 || _389;
    bool _393 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _395 = _391 || _393;
    float _397 = float(_395);
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _401 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _399;
    float _403 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _405 = _403 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _407 = 1.0 / _377;
    float _409 = -_353;
    float _411 = _409 + 1.0;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _415 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _413;
    float _417 = abs(_353);
    float _419 = log2(_417);
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _423 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _421;
    float _425 = fma(_359, 6.283185482025146484375, _357);
    float _427 = fma((*spvDescriptorSet0.vp_c9)._m0[194].y, 0.01745329238474369049072265625, _425);
    float _429 = _183 * _371;
    float _431 = _177 * _371;
    float _433 = _427 * 0.60000002384185791015625;
    float _435 = fma(_181, _369, _429);
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _439 = _351 + _437;
    float _441 = 1.0 / _367;
    float _443 = _433 * 0.15915493667125701904296875;
    float _445 = fma(_175, _369, _431);
    float _447 = _419 * (*spvDescriptorSet0.vp_c9)._m0[193].z;
    float _449 = _427 * 0.15915493667125701904296875;
    int _451 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _453 = _451 != 0;
    float _455 = _427 * 1.2999999523162841796875;
    float _457 = exp2(_447);
    float _459 = _455 * 0.15915493667125701904296875;
    float _461 = _443 * 6.283185482025146484375;
    float _463 = sin(_461);
    float _465 = _439 * _379;
    float _467 = _427 + 0.52359879016876220703125;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _471 = _351 + _469;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _475 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _473;
    float _477 = fma(_401, _465, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _479 = _467 * 0.15915493667125701904296875;
    float _481 = fma(_427, 0.60000002384185791015625, 0.31415927410125732421875);
    float _483 = fma(_427, 1.2999999523162841796875, 0.680678427219390869140625);
    float _485 = _471 * _407;
    float _487 = fma(_475, _465, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _489 = _483 * 0.15915493667125701904296875;
    float _491 = _383 * _441;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _495 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _493;
    float _497 = _449 * 6.283185482025146484375;
    float _499 = sin(_497);
    float _501 = _481 * 0.15915493667125701904296875;
    float _503 = fma(_495, _465, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _505 = fma(_415, _485, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _507 = in.m_66.x;
    float _509 = in.m_66.y;
    float _511 = in.m_66.z;
    float _513 = (*spvDescriptorSet0.vp_c9)._m0[193].w * 3.1415927410125732421875;
    float _515 = _459 * 6.283185482025146484375;
    float _517 = sin(_515);
    float _519 = fma(_513, _457, _357);
    float _521 = -(*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _523 = _521 + (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _525 = fma(_359, 6.283185482025146484375, _519);
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _529 = _527 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _533 = _531 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _535 = fma(_523, _359, (*spvDescriptorSet0.vp_c9)._m0[191].x);
    float _537 = _479 * 6.283185482025146484375;
    float _539 = sin(_537);
    float _541 = fma(_529, _491, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _543 = fma(_533, _491, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _545 = fma(_405, _491, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _547 = _385 * 628.31854248046875;
    float _549 = fma(_463, 0.60000002384185791015625, _499);
    bool _551 = _351 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _553 = isnan(_351);
    bool _555 = _551 || _553;
    bool _557 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _559 = _555 || _557;
    float _561 = float(_559);
    float _563 = _501 * 6.283185482025146484375;
    float _565 = sin(_563);
    float _567 = fma(_141, _535, _547);
    float _569 = fma(_353, 0.261799395084381103515625, -0.261799395084381103515625);
    bool _571 = _507 > 0.0;
    float _573 = fma(_517, 0.300000011920928955078125, _549);
    bool _575 = _507 >= 0.0;
    bool _577 = isnan(_507);
    bool _579 = _575 || _577;
    bool _581 = isnan(0.0);
    bool _583 = _579 || _581;
    float _585 = _567 + _569;
    float _587 = -_561;
    float _589 = _587 + 1.0;
    float _591 = _489 * 6.283185482025146484375;
    float _593 = sin(_591);
    int _595 = _583 ? 0 : 1;
    float _597 = _585 * 1.10000002384185791015625;
    float _599 = _525 * 0.15915493667125701904296875;
    float _601 = _525 * 0.60000002384185791015625;
    int _603 = ~_595;
    int _605 = _603 + 1;
    int _607 = _605 + 1;
    float _609 = _525 * 1.2999999523162841796875;
    float _611 = _573 * _411;
    int _613 = _607;
    float _615 = _459;
    if (!_571)
    {
        int _617 = ~_595;
        int _619 = _617 + 1;
        _613 = _619;
    }
    int _621 = _613;
    float _623 = _585 * 0.89999997615814208984375;
    float _625 = fma(_565, 0.60000002384185791015625, _539);
    bool _627 = _351 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _629 = isnan(_351);
    bool _631 = _627 || _629;
    bool _633 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _635 = _631 || _633;
    float _637 = float(_635);
    float _639 = _609 * 0.15915493667125701904296875;
    float _641 = _623 * 0.15915493667125701904296875;
    bool _643 = _351 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _645 = isnan(_351);
    bool _647 = _643 || _645;
    bool _649 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _651 = _647 || _649;
    float _653 = float(_651);
    float _655 = _597 * 0.15915493667125701904296875;
    float _657 = -_397;
    float _659 = _657 + 1.0;
    float _661 = fma(_593, 0.300000011920928955078125, _625);
    float _663 = _653 * _589;
    float _665 = -_653;
    float _667 = _665 + 1.0;
    float _669 = _637 * _659;
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _673 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _671;
    float _675 = -_637;
    float _677 = _675 + 1.0;
    float _679 = _397 * _667;
    float _681 = -_355;
    float _683 = _681 + 1.0;
    float _685 = _503 * _669;
    float _687 = _477 * _669;
    float _689 = _487 * _669;
    float _691 = abs(_661);
    float _693 = _683 * _691;
    float _695 = fma(_673, _485, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _697 = _601 * 0.15915493667125701904296875;
    float _699 = fma(_423, _485, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _701 = fma(_677, (*spvDescriptorSet0.vp_c9)._m0[143].x, _685);
    float _703 = fma(_677, (*spvDescriptorSet0.vp_c9)._m0[143].y, _689);
    float _705 = _693 * (-45.0);
    float _707 = _585 * 0.15915493667125701904296875;
    float _709 = in.m_68.y;
    float _711 = _585 * 0.699999988079071044921875;
    float _713 = _599 * 6.283185482025146484375;
    float _715 = sin(_713);
    float _717 = fma(_541, _679, _701);
    float _719 = _705 * 0.01745329238474369049072265625;
    float _721 = fma(_543, _679, _703);
    float _723 = _711 * 0.15915493667125701904296875;
    float _725 = in.m_70.x;
    float _727 = in.m_70.y;
    float _729 = in.m_70.z;
    float _731 = _611 * 0.52359879016876220703125;
    float _733 = fma(_677, (*spvDescriptorSet0.vp_c9)._m0[143].z, _687);
    float _735 = _697 * 6.283185482025146484375;
    float _737 = sin(_735);
    float _739 = float(_621);
    float _741 = _731 * 0.15915493667125701904296875;
    float _743 = _693 * (-20.0);
    float _745 = fma(_545, _679, _733);
    float _747 = fma(_695, _663, _721);
    float _749 = _719 * 0.15915493667125701904296875;
    float _751 = _641 * 6.283185482025146484375;
    float _753 = sin(_751);
    float _755 = fma(_505, _663, _717);
    float _757 = fma(_699, _663, _745);
    float _759 = _739 * _743;
    float _761 = _567 * 0.89999997615814208984375;
    float _763 = fma(_561, (*spvDescriptorSet0.vp_c9)._m0[146].x, _755);
    float _765 = fma(_561, (*spvDescriptorSet0.vp_c9)._m0[146].y, _747);
    float _767 = _759 * 0.01745329238474369049072265625;
    float _769 = _639 * 6.283185482025146484375;
    float _771 = sin(_769);
    float _773 = fma(_737, 0.60000002384185791015625, _715);
    float _775 = _567 * 0.15915493667125701904296875;
    float _777 = _767 * 0.15915493667125701904296875;
    float _779 = _761 * 0.15915493667125701904296875;
    float _781 = _509 + (-0.0199999995529651641845703125);
    float _783 = fma(_561, (*spvDescriptorSet0.vp_c9)._m0[146].z, _757);
    if (!_453)
    {
        _615 = _385;
    }
    float _785 = _615;
    float _787 = _707 * 6.283185482025146484375;
    float _789 = sin(_787);
    float _791 = _753 * 0.89999997615814208984375;
    float _793 = _783 * _729;
    float _795 = _567 * 0.699999988079071044921875;
    float _797 = _723 * 6.283185482025146484375;
    float _799 = cos(_797);
    float _801 = fma(_771, 0.300000011920928955078125, _773);
    float _803 = fma(_709, 0.5, 0.5);
    float _805 = _803 * _801;
    float _807 = _763 * _725;
    float _809 = _655 * 6.283185482025146484375;
    float _811 = cos(_809);
    float _813 = -_791;
    float _815 = fma(_789, -1.2000000476837158203125, _813);
    float _817 = _805 * (*spvDescriptorSet0.vp_c9)._m0[193].x;
    float _819 = abs(_815);
    bool _821 = _819 > 0.001000000047497451305389404296875;
    bool _823 = isnan(_819);
    bool _825 = _821 || _823;
    bool _827 = isnan(0.001000000047497451305389404296875);
    bool _829 = _825 || _827;
    float _831 = _817 * 0.01745329238474369049072265625;
    float _833 = _741 * 6.283185482025146484375;
    float _835 = sin(_833);
    float _837 = _799 * 0.699999988079071044921875;
    float _839 = _831 * 0.15915493667125701904296875;
    float _841 = _741 * 6.283185482025146484375;
    float _843 = cos(_841);
    float _845 = fma(_811, 1.10000002384185791015625, _837);
    float _847 = abs(_845);
    bool _849 = _847 != 0.0;
    bool _851 = isnan(_847);
    bool _853 = _849 || _851;
    bool _855 = isnan(0.0);
    bool _857 = _853 || _855;
    float _859 = _749 * 6.283185482025146484375;
    float _861 = sin(_859);
    float _863 = _835 * _507;
    float _865 = _749 * 6.283185482025146484375;
    float _867 = cos(_865);
    float _869 = _843 * _507;
    float _871 = -_863;
    float _873 = fma(_843, _511, _871);
    float _875 = _829 ? _815 : 0.001000000047497451305389404296875;
    float _877 = _765 * _727;
    float _879 = fma(_835, _511, _869);
    float _881 = _873 + 0.02999999932944774627685546875;
    float _883 = abs(_875);
    bool _885 = _883 == 0.0;
    bool _887 = !_857;
    bool _889 = _885 && _887;
    float _891 = _777 * 6.283185482025146484375;
    float _893 = sin(_891);
    float _895 = abs(_875);
    bool _897 = _895 == 0.0;
    float _899 = _861 * _881;
    float _901 = fma(_739, -0.100000001490116119384765625, _879);
    float _903 = _795 * 0.15915493667125701904296875;
    float _905 = _777 * 6.283185482025146484375;
    float _907 = cos(_905);
    float _909 = -_899;
    float _911 = fma(_867, _781, _909);
    float _913 = _867 * _881;
    bool _915 = false;
    int _917 = as_type<int>(_901);
    float _919 = _845;
    float _921 = _785;
    if (_889)
    {
        bool _923 = as_type<int>(_875) >= 0;
        _915 = _923;
    }
    bool _925 = _915;
    float _927 = _775 * 6.283185482025146484375;
    float _929 = cos(_927);
    float _931 = _911 * _893;
    float _933 = _779 * 6.283185482025146484375;
    float _935 = cos(_933);
    float _937 = _911 * _907;
    float _939 = -_931;
    float _941 = fma(_907, _901, _939);
    float _943 = fma(_893, _901, _937);
    float _945 = _893;
    int _947 = _925 ? (-1) : 0;
    int _949 = as_type<int>(_941);
    if (_889)
    {
        int _951 = _925 ? 0 : 1078530011;
        _917 = _951;
    }
    int _953 = _917;
    float _955 = fma(_739, 0.100000001490116119384765625, _941);
    float _957 = _839 * 6.283185482025146484375;
    float _959 = sin(_957);
    float _961 = _943 + 0.0199999995529651641845703125;
    if (_889)
    {
        int _963 = int(0x80000000) & as_type<int>(_845);
        int _965 = _953 | _963;
        _945 = as_type<float>(_965);
    }
    float _967 = _945;
    float _969 = _839 * 6.283185482025146484375;
    float _971 = cos(_969);
    bool _973 = !_857;
    bool _975 = _973 && _897;
    float _977 = _967;
    float _979 = _967;
    if (!_975)
    {
        float _981 = abs(_845);
        bool _983 = _981 != as_type<float>(0x7f800000u /* inf */);
        bool _985 = isnan(_981);
        bool _987 = _983 || _985;
        bool _989 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _991 = _987 || _989;
        float _993 = abs(_875);
        bool _995 = _993 == as_type<float>(0x7f800000u /* inf */);
        float _997 = abs(_875);
        bool _999 = _997 == as_type<float>(0x7f800000u /* inf */);
        bool _1001 = !_991;
        bool _1003 = _999 && _1001;
        if (_1003)
        {
            bool _1005 = as_type<int>(_875) >= 0;
            _947 = _1005 ? (-1) : 0;
        }
        int _1007 = _947;
        if (_1003)
        {
            _949 = 1075235812;
        }
        int _1009 = _949;
        int _1011 = _1009;
        if (_1003)
        {
            int _1013 = ~_1007;
            int _1015 = (_1013 != 0) ? _1009 : 1061752795;
            _1011 = _1015;
        }
        int _1017 = _1011;
        if (_1003)
        {
            int _1019 = int(0x80000000) & as_type<int>(_845);
            int _1021 = _1017 | _1019;
            _977 = as_type<float>(_1021);
        }
        float _1023 = _977;
        bool _1025 = !_991;
        bool _1027 = _1025 && _995;
        _979 = _1023;
        if (!_1027)
        {
            float _1029 = abs(_845);
            float _1031 = abs(_875);
            float _1033 = precise::max(_1029, _1031);
            float _1035 = abs(_845);
            float _1037 = abs(_875);
            float _1039 = precise::min(_1035, _1037);
            float _1041 = 1.0 / _1033;
            float _1043 = abs(_845);
            float _1045 = abs(_875);
            bool _1047 = _1043 > _1045;
            bool _1049 = as_type<int>(_875) >= 0;
            float _1051 = _1039 * _1041;
            float _1053 = _1051 * _1051;
            float _1055 = _1053 + 11.33538818359375;
            float _1057 = fma(_1053, _1055, 28.84246826171875);
            float _1059 = fma(_1053, _1057, 19.6966705322265625);
            float _1061 = fma(_1053, -0.82336294651031494140625, -5.674867153167724609375);
            float _1063 = fma(_1053, _1061, -6.565555095672607421875);
            float _1065 = 1.0 / _1059;
            float _1067 = _1053 * _1063;
            float _1069 = abs(_845);
            float _1071 = abs(_875);
            float _1073 = _1069 + _1071;
            int _1075 = as_type<int>(_845) & int(0x80000000);
            float _1077 = _1051 * _1067;
            bool _1079 = _1073 > as_type<float>(0x7f800000u /* inf */);
            bool _1081 = isnan(_1073);
            bool _1083 = _1079 || _1081;
            bool _1085 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1087 = _1083 || _1085;
            float _1089 = fma(_1077, _1065, _1051);
            float _1091 = _1089;
            _979 = _1073;
            _919 = as_type<float>(_1075);
            if (_1047)
            {
                float _1093 = -_1089;
                float _1095 = _1093 + 1.57079637050628662109375;
                _1091 = _1095;
            }
            float _1097 = _1091;
            int _1099 = as_type<int>(_1097);
            if (!_1049)
            {
                float _1101 = -_1097;
                float _1103 = _1101 + 3.1415927410125732421875;
                _1099 = as_type<int>(_1103);
            }
            int _1105 = _1099;
            if (!_1087)
            {
                int _1107 = _1075 | _1105;
                _979 = as_type<float>(_1107);
            }
        }
    }
    float _1109 = _979;
    float _1111 = _919;
    float _1113 = _961 * _959;
    float _1115 = _961 * _971;
    float _1117 = _1109 + 1.57079637050628662109375;
    float _1119 = in.m_62.z;
    float _1121 = -_1113;
    float _1123 = fma(_955, _971, _1121);
    float _1125 = fma(_861, _781, _913);
    float _1127 = fma(_955, _959, _1115);
    float _1129 = _1117 * (-0.15915493667125701904296875);
    float _1131 = fma(_573, (*spvDescriptorSet0.vp_c9)._m0[194].x, _1123);
    float _1133 = _1125 + (-0.02999999932944774627685546875);
    float _1135 = in.m_60.w;
    float _1137 = _807 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1139 = _793 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1141 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1133);
    float _1143 = in.m_58.w;
    float _1145 = _877 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1147 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1127);
    float _1149 = _567 * 1.10000002384185791015625;
    float _1151 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1131);
    float _1153 = _1129 * 6.283185482025146484375;
    float _1155 = cos(_1153);
    float _1157 = _1139 * _1141;
    float _1159 = _1145 * _1147;
    float _1161 = _1137 * _1151;
    float _1163 = _1149 * 0.15915493667125701904296875;
    float _1165 = _1157 * _303;
    float _1167 = _1157 * _311;
    float _1169 = fma(_179, _373, _445);
    float _1171 = _1129 * 6.283185482025146484375;
    float _1173 = sin(_1171);
    float _1175 = fma(_1161, _277, _1165);
    float _1177 = fma(_1161, _281, _1167);
    float _1179 = _1119 * 6.283185482025146484375;
    float _1181 = fma(_185, _373, _435);
    float _1183 = -_1159;
    float _1185 = fma(_1183, _323, _1175);
    float _1187 = -_1159;
    float _1189 = fma(_1187, _327, _1177);
    float _1191 = _1179 * 0.15915493667125701904296875;
    float _1193 = _903 * 6.283185482025146484375;
    float _1195 = sin(_1193);
    float _1197 = _1185 * _1155;
    float _1199 = _1181 + _1135;
    float _1201 = _1169 + _1143;
    float _1203 = fma(_929, 1.2000000476837158203125, _935);
    float _1205 = _187 * 3.3333332538604736328125;
    float _1207 = _1163 * 6.283185482025146484375;
    float _1209 = sin(_1207);
    float _1211 = _1185 * _1173;
    float _1213 = fma(_1189, _1173, _1197);
    float _1215 = -_1211;
    float _1217 = fma(_1189, _1155, _1215);
    float _1219 = _1201 + _1213;
    float _1221 = _1191 * 6.283185482025146484375;
    float _1223 = sin(_1221);
    float _1225 = _1199 + _1217;
    float _1227 = fma(_1203, (*spvDescriptorSet0.vp_c9)._m0[191].z, _1219);
    float _1229 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1231 = _1227 + _1229;
    float _1233 = _1191 * 6.283185482025146484375;
    float _1235 = cos(_1233);
    float _1237 = _1195 + _1209;
    float _1239 = in.m_72.y;
    float _1241 = fma(_1237, (*spvDescriptorSet0.vp_c9)._m0[191].z, _1225);
    float _1243 = _1223 * _1231;
    float _1245 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1247 = _1241 + _1245;
    float _1249 = -(*spvDescriptorSet0.vp_c9)._m0[192].w;
    float _1251 = _1249 + 1.0;
    float _1253 = _1235 * _1231;
    float _1255 = -_1243;
    float _1257 = fma(_1235, _1247, _1255);
    float _1259 = fma(_1223, _1247, _1253);
    float _1261 = _1257 + (*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1263 = _1259 + (*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1265 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1267 = _1261 + _1265;
    float _1269 = _371 + _1239;
    float _1271 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1273 = _1263 + _1271;
    float _1275 = _1267 * _1267;
    float _1277 = fma(_1273, _1273, _1275);
    float _1279 = -_1205;
    float _1281 = _1279 + 3.3333332538604736328125;
    float _1283 = precise::clamp(_1281, 0.0, 1.0);
    float _1285 = sqrt(_1277);
    bool _1287 = _1285 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1289 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1291 = _1285 + _1289;
    float _1293 = 0.0 + _1205;
    float _1295 = precise::clamp(_1293, 0.0, 1.0);
    float _1297 = _1157 * _295;
    float _1299 = fma(_1161, _273, _1297);
    float _1301 = precise::min(_1295, _1283);
    float _1303 = -_1159;
    float _1305 = fma(_1303, _319, _1299);
    float _1307 = _1111;
    float _1309 = _1157;
    if (_1287)
    {
        float _1311 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1307 = _1311;
    }
    float _1313 = _1307;
    float _1315 = fma(_1301, -5.0, 5.0);
    float _1317 = _1269 + _1305;
    float _1319 = -_1315;
    float _1321 = fma(_1319, _1251, _1317);
    float _1323 = _1315;
    float _1325 = _1317;
    float _1327 = _1321;
    if (_1287)
    {
        float _1329 = rsqrt(_1277);
        _1309 = _1329;
    }
    float _1331 = _1309;
    float _1333 = _1331;
    if (!_1287)
    {
        _1323 = _1263;
    }
    float _1335 = _1323;
    float _1337 = _1335;
    if (_1287)
    {
        float _1339 = _1321 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1325 = _1339;
    }
    float _1341 = _1325;
    float _1343 = _1313;
    float _1345 = _1341;
    if (_1287)
    {
        float _1347 = _1291 * _1313;
        _1343 = _1347;
    }
    float _1349 = _1343;
    float _1351 = _1349;
    if (_1287)
    {
        float _1353 = _1349 * 0.15915493667125701904296875;
        _1351 = _1353;
    }
    float _1355 = _1351;
    float _1357 = _1291;
    if (_1287)
    {
        float _1359 = _1355 * 6.283185482025146484375;
        float _1361 = sin(_1359);
        _1357 = _1361;
    }
    float _1363 = _1357;
    float _1365 = _1363;
    if (_1287)
    {
        float _1367 = fma(_1363, _1341, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1345 = _1367;
    }
    float _1369 = _1345;
    if (!_1287)
    {
        _1365 = _1261;
    }
    float _1371 = _1365;
    float _1373 = _1371;
    if (_1287)
    {
        float _1375 = _1331 * _1369;
        _1333 = _1375;
    }
    float _1377 = _1333;
    if (_1287)
    {
        float _1379 = fma(_1273, _1377, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1337 = _1379;
    }
    float _1381 = _1337;
    if (_1287)
    {
        float _1383 = fma(_1267, _1377, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1373 = _1383;
    }
    float _1385 = _1373;
    float _1387 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1389 = _1381 + _1387;
    float _1391 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1393 = _1385 + _1391;
    float _1395 = fma(_1389, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1397 = fma(_1393, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _4690 = float2(_1395, _1397);
    float _1399 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_4690, float2(0.0), isnan(_4690)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_4690, float2(0.0), isnan(_4690)), level(0.0)).x;
    float _1401 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _1403 = fma(_1399, 100.0, _1269);
    float _1405 = _1403 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1407 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1405);
    float _1409 = fma(_1199, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1407);
    float _1411 = _1403 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1413 = _1403 + _1401;
    float _1415 = _1409 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1417 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1411);
    float _1419 = 1.0 / _1415;
    float _1421 = fma(_1199, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1417);
    float _1423 = _1421 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1425 = _1423 + _1415;
    float _1427 = _1425 * _1419;
    float _1429 = _1427 * 0.5;
    float _1431 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1433 = fma(_1429, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1431);
    float _1435 = 1.0 / _1433;
    float _1437 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1439 = _1435 * _1437;
    bool _1441 = _1439 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1443 = _1439 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1445 = !_1441;
    int _1447 = _1445 ? 0 : 1;
    int _1449 = 2;
    if (!_1441)
    {
        _1449 = 1;
    }
    int _1451 = _1449;
    int _1453 = _1451;
    if (!_1443)
    {
        _1453 = _1447;
    }
    int _1455 = _1453;
    int _1457 = _1455 << 6;
    int _1459 = _1457 + 96;
    uint _1462 = uint(int(uint(_1459) >> uint(2)));
    uint _1464 = uint(int(uint(int(_1462)) >> uint(2)));
    int _1466 = int(_1462) & 3;
    float _1468 = (*spvDescriptorSet0.vp_c15)._m0[int(_1464)][_1466];
    int _1470 = int(_1462) + 1;
    uint _1472 = uint(int(uint(_1470) >> uint(2)));
    int _1474 = _1470 & 3;
    float _1476 = (*spvDescriptorSet0.vp_c15)._m0[int(_1472)][_1474];
    int _1478 = _1457 + 104;
    uint _1480 = uint(int(uint(_1478) >> uint(2)));
    uint _1482 = uint(int(uint(int(_1480)) >> uint(2)));
    int _1484 = int(_1480) & 3;
    float _1486 = (*spvDescriptorSet0.vp_c15)._m0[int(_1482)][_1484];
    int _1488 = int(_1480) + 1;
    uint _1490 = uint(int(uint(_1488) >> uint(2)));
    int _1492 = _1488 & 3;
    float _1494 = (*spvDescriptorSet0.vp_c15)._m0[int(_1490)][_1492];
    int _1496 = _1457 + 48;
    uint _1498 = uint(int(uint(_1496) >> uint(2)));
    uint _1500 = uint(int(uint(int(_1498)) >> uint(2)));
    int _1502 = int(_1498) & 3;
    float _1504 = (*spvDescriptorSet0.vp_c15)._m0[int(_1500)][_1502];
    int _1506 = int(_1498) + 1;
    uint _1508 = uint(int(uint(_1506) >> uint(2)));
    int _1510 = _1506 & 3;
    float _1512 = (*spvDescriptorSet0.vp_c15)._m0[int(_1508)][_1510];
    int _1514 = _1457 + 64;
    uint _1516 = uint(int(uint(_1514) >> uint(2)));
    uint _1518 = uint(int(uint(int(_1516)) >> uint(2)));
    int _1520 = int(_1516) & 3;
    float _1522 = (*spvDescriptorSet0.vp_c15)._m0[int(_1518)][_1520];
    int _1524 = int(_1516) + 1;
    uint _1526 = uint(int(uint(_1524) >> uint(2)));
    int _1528 = _1524 & 3;
    float _1530 = (*spvDescriptorSet0.vp_c15)._m0[int(_1526)][_1528];
    int _1532 = _1457 + 56;
    uint _1534 = uint(int(uint(_1532) >> uint(2)));
    uint _1536 = uint(int(uint(int(_1534)) >> uint(2)));
    int _1538 = int(_1534) & 3;
    float _1540 = (*spvDescriptorSet0.vp_c15)._m0[int(_1536)][_1538];
    int _1542 = int(_1534) + 1;
    uint _1544 = uint(int(uint(_1542) >> uint(2)));
    int _1546 = _1542 & 3;
    float _1548 = (*spvDescriptorSet0.vp_c15)._m0[int(_1544)][_1546];
    int _1550 = _1457 + 72;
    uint _1552 = uint(int(uint(_1550) >> uint(2)));
    uint _1554 = uint(int(uint(int(_1552)) >> uint(2)));
    int _1556 = int(_1552) & 3;
    float _1558 = (*spvDescriptorSet0.vp_c15)._m0[int(_1554)][_1556];
    int _1560 = int(_1552) + 1;
    uint _1562 = uint(int(uint(_1560) >> uint(2)));
    int _1564 = _1560 & 3;
    float _1566 = (*spvDescriptorSet0.vp_c15)._m0[int(_1562)][_1564];
    float _1568 = _1413 * _1476;
    float _1570 = fma(_1201, _1468, _1568);
    float _1572 = fma(_1199, _1486, _1570);
    float _1574 = _1572 + _1494;
    int _1576 = _1457 + 80;
    uint _1578 = uint(int(uint(_1576) >> uint(2)));
    uint _1580 = uint(int(uint(int(_1578)) >> uint(2)));
    int _1582 = int(_1578) & 3;
    float _1584 = (*spvDescriptorSet0.vp_c15)._m0[int(_1580)][_1582];
    int _1586 = int(_1578) + 1;
    uint _1588 = uint(int(uint(_1586) >> uint(2)));
    int _1590 = _1586 & 3;
    float _1592 = (*spvDescriptorSet0.vp_c15)._m0[int(_1588)][_1590];
    float _1594 = _1413 * _1512;
    float _1596 = 1.0 / _1574;
    float _1598 = fma(_1201, _1504, _1594);
    int _1600 = _1457 + 88;
    uint _1602 = uint(int(uint(_1600) >> uint(2)));
    uint _1604 = uint(int(uint(int(_1602)) >> uint(2)));
    int _1606 = int(_1602) & 3;
    float _1608 = (*spvDescriptorSet0.vp_c15)._m0[int(_1604)][_1606];
    int _1610 = int(_1602) + 1;
    uint _1612 = uint(int(uint(_1610) >> uint(2)));
    int _1614 = _1610 & 3;
    float _1616 = (*spvDescriptorSet0.vp_c15)._m0[int(_1612)][_1614];
    float _1618 = _1413 * _1530;
    float _1620 = fma(_1201, _1522, _1618);
    float _1622 = fma(_1199, _1540, _1598);
    float _1624 = _1622 + _1548;
    float _1626 = fma(_1199, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1628 = fma(_1199, _1558, _1620);
    float _1630 = _1624 * _1596;
    float _1632 = _1628 + _1566;
    bool _1634 = _1630 >= 0.0;
    float _1636 = fma(_1201, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1638 = _1632 * _1596;
    bool _1640 = _1630 <= 1.0;
    bool _1642 = _1640 && _1634;
    float _1644 = floor(_1636);
    bool _1646 = _1638 >= 0.0;
    bool _1648 = _1646 && _1642;
    bool _1650 = _1638 <= 1.0;
    bool _1652 = _1650 && _1648;
    float _1654 = floor(_1626);
    float _1656 = _1413 * _1592;
    float _1658 = fma(_1201, _1584, _1656);
    float _1660 = -_1644;
    float _1662 = _1636 + _1660;
    float _1664 = fma(_1199, _1608, _1658);
    float _1666 = as_type<float>(_1455);
    if (_1652)
    {
        float _1668 = float(_1455);
        _1666 = _1668;
    }
    float _1670 = _1666;
    float _1672 = _1664 + _1616;
    float _1674 = _1656;
    if (_1652)
    {
        float _1676 = rint(_1670);
        float _1678 = precise::max(_1676, 0.0);
        uint _1680 = uint(_1678);
        uint _1682 = clamp(_1680, 0u, 65535u);
        _1674 = as_type<float>(_1682);
    }
    float _1684 = _1674;
    float _1686 = -_1654;
    float _1688 = _1626 + _1686;
    float _1690 = _1672 * _1596;
    float2 _5186 = float2(_1662, _1688);
    float _1692 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5186, float2(0.0), isnan(_5186)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5186, float2(0.0), isnan(_5186)), level(0.0)).x;
    float _1694 = _1638;
    if (_1652)
    {
        float3 _5201 = float3(_1630, _1638, float(as_type<int>(_1684)));
        float3 _5205 = select(_5201, float3(0.0), isnan(_5201));
        float _1696 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5205.xy, uint(rint(_5205.z)), _1690, level(0.0));
        _1694 = _1696;
    }
    float _1698 = _1694;
    float _1700 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _1702 = in.m_62.w;
    float _1704 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    if (_453)
    {
        _921 = _359;
    }
    float _1706 = _921;
    float _1708 = _1700 * _359;
    int _1710 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1712 = _1710 != 0;
    float _1714 = in.m_74.x;
    float _1716 = in.m_74.y;
    float _1718 = in.m_74.z;
    float _1720 = in.m_74.w;
    int _1722 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1724 = _1722 != 0;
    float _1726 = trunc(_1708);
    int _1728 = int(_1726);
    float _1730 = in.m_68.x;
    float _1732 = _907;
    if (_1712)
    {
        float _1734 = in.m_62.z;
        _1732 = _1734;
    }
    float _1736 = _1732;
    float _1738 = _1662;
    if (!_453)
    {
        float _1740 = in.m_62.z;
        _1738 = _1740;
    }
    float _1742 = _1738;
    bool _1744 = _1702 > 0.5;
    int _1746 = _1728 << 4;
    int _1748 = _1746 + 1712;
    uint _1750 = uint(int(uint(_1748) >> uint(2)));
    uint _1752 = uint(int(uint(int(_1750)) >> uint(2)));
    int _1754 = int(_1750) & 3;
    float _1756 = (*spvDescriptorSet0.vp_c9)._m0[int(_1752)][_1754];
    int _1758 = int(_1750) + 1;
    uint _1760 = uint(int(uint(_1758) >> uint(2)));
    int _1762 = _1758 & 3;
    float _1764 = (*spvDescriptorSet0.vp_c9)._m0[int(_1760)][_1762];
    float _1766 = _311 * _1718;
    float _1768 = -_709;
    float _1770 = _1768 + 1.0;
    float _1772 = _303 * _1718;
    float _1774 = _295 * _1718;
    float _1776 = fma(_281, _1714, _1766);
    float _1778 = _1766;
    float _1780 = _1730;
    if (_1712)
    {
        _1778 = _1730;
    }
    float _1782 = _1778;
    float _1784 = fma(_277, _1714, _1772);
    int _1786 = _1748 + 8;
    uint _1788 = uint(int(uint(_1786) >> uint(2)));
    uint _1790 = uint(int(uint(int(_1788)) >> uint(2)));
    int _1792 = int(_1788) & 3;
    float _1794 = (*spvDescriptorSet0.vp_c9)._m0[int(_1790)][_1792];
    int _1796 = _1744 ? as_type<int>(_1770) : as_type<int>(_709);
    float _1798 = -_1716;
    float _1800 = fma(_323, _1798, _1784);
    bool _1802 = _1736 > 0.5;
    bool _1804 = _1802 && _1712;
    float _1806 = fma(_273, _1714, _1774);
    float _1808 = -_1716;
    float _1810 = fma(_327, _1808, _1776);
    float _1812 = _1724 ? as_type<float>(_1796) : _709;
    float _1814 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1816 = -_1716;
    float _1818 = fma(_319, _1816, _1806);
    float _1820 = _1704 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1822 = _1806;
    float _1824 = _1782;
    if (!_1712)
    {
        _1822 = _1730;
    }
    float _1826 = _1822;
    float _1828 = _1742;
    float _1830 = _1826;
    if (!_453)
    {
        _1780 = _1742;
    }
    float _1832 = _1780;
    out.m_76.x = _1800;
    out.m_76.y = _1818;
    out.m_76.z = _1810;
    float _1834 = fma(_1820, _1812, -0.5);
    float _1836 = _1832;
    float _1838 = _1834;
    if (_1804)
    {
        float _1840 = -_1782;
        float _1842 = _1840 + 1.0;
        _1824 = _1842;
    }
    float _1844 = _1824;
    float _1846 = in.m_78.x;
    float _1848 = in.m_78.y;
    float _1850 = in.m_78.z;
    if (_453)
    {
        _1836 = _385;
    }
    float _1852 = _1836;
    float _1854 = _1852;
    if (_453)
    {
        _1828 = _385;
    }
    float _1856 = _1828;
    float _1858 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _1860 = _1127 != 0.0;
    bool _1862 = isnan(_1127);
    bool _1864 = _1860 || _1862;
    bool _1866 = isnan(0.0);
    bool _1868 = _1864 || _1866;
    float _1870 = _1814 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1872 = fma(_1706, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1858);
    bool _1874 = _1131 == 0.0;
    bool _1876 = !_1868;
    bool _1878 = _1874 && _1876;
    float _1880 = _1706 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_1712)
    {
        _1830 = _1844;
    }
    float _1882 = _1830;
    float _1884 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1886 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1872);
    float _1888 = fma(_1870, _1882, -0.5);
    bool _1890 = _1125 == 0.02999999932944774627685546875;
    bool _1892 = _1890 && _1878;
    float _1894 = -_1884;
    float _1896 = fma(_1880, 2.0, _1894);
    float _1898 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1900 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1902 = _1852 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1904 = _1756 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1906 = fma(_1856, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1898);
    float _1908 = fma(_1902, -2.0, _1900);
    float _1910 = -_141;
    float _1912 = fma(_1910, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1896);
    float _1914 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1906);
    float _1916 = _1764 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1918 = fma(_141, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1908);
    float _1920 = _1794 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1922 = _1914;
    float _1924 = _1888;
    if (_1892)
    {
        _1854 = _1846;
    }
    float _1926 = _1854;
    float _1928 = fma(_1886, _1888, _1912);
    float _1930 = -_1918;
    float _1932 = fma(_1914, _1834, _1930);
    float _1934 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1936 = _1904 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1938 = _1916 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1940 = _1920 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1942 = _1926;
    if (_1892)
    {
        _1838 = _1926;
    }
    float _1944 = _1838;
    float _1946 = _1928 + 0.5;
    float _1948 = _1944;
    if (!_1892)
    {
        _1942 = _1846;
    }
    float _1950 = _1942;
    float _1952 = _1932 + 0.5;
    if (_1892)
    {
        _1922 = _1848;
    }
    float _1954 = _1922;
    out.m_80.x = _1936;
    out.m_80.y = _1938;
    out.m_80.z = _1940;
    out.m_80.w = _1934;
    float _1956 = _1954;
    if (_1892)
    {
        _159 = _1850;
    }
    float _1958 = _159;
    float _1960 = _1958;
    if (!_1892)
    {
        float _1962 = fma(_1133, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1850);
        _1960 = _1962;
    }
    float _1964 = _1960;
    if (_1892)
    {
        _1924 = _1954;
    }
    float _1966 = _1924;
    float _1968 = _1966;
    if (!_1892)
    {
        float _1970 = fma(_1131, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1950);
        _1948 = _1970;
    }
    float _1972 = _1948;
    if (!_1892)
    {
        _1956 = _1848;
    }
    float _1974 = _1956;
    float _1976 = _1716 * _1850;
    out.m_82.z = _1946;
    out.m_82.w = _1952;
    if (!_1892)
    {
        float _1978 = fma(_1127, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1974);
        _1968 = _1978;
    }
    float _1980 = _1968;
    float _1982 = _1718 * _1950;
    float _1984 = -_1976;
    float _1986 = fma(_1718, _1974, _1984);
    float _1988 = _295 * _1964;
    float _1990 = -_1982;
    float _1992 = fma(_1714, _1850, _1990);
    float _1994 = _1714 * _1974;
    float _1996 = _303 * _1964;
    float _1998 = _311 * _1964;
    float _2000 = fma(_273, _1972, _1988);
    float _2002 = -_1994;
    float _2004 = fma(_1716, _1950, _2002);
    float _2006 = fma(_277, _1972, _1996);
    float _2008 = fma(_281, _1972, _1998);
    float _2010 = _1996;
    if (_1287)
    {
        float _2012 = _1355 * 6.283185482025146484375;
        float _2014 = cos(_2012);
        _2010 = _2014;
    }
    float _2016 = _2010;
    float _2018 = _2004 * _1720;
    float _2020 = _1986 * _1720;
    float _2022 = _1992 * _1720;
    float _2024 = -_1980;
    float _2026 = fma(_323, _2024, _2006);
    float _2028 = _2018 * _303;
    float _2030 = _2018 * _311;
    float _2032 = _2018 * _295;
    float _2034 = -_1980;
    float _2036 = fma(_327, _2034, _2008);
    float _2038 = fma(_2020, _277, _2028);
    float _2040 = fma(_2020, _281, _2030);
    float _2042 = fma(_2020, _273, _2032);
    float _2044 = _2026 * _1173;
    float _2046 = -_2022;
    float _2048 = fma(_2046, _323, _2038);
    float _2050 = -_2022;
    float _2052 = fma(_2050, _327, _2040);
    float _2054 = -_2022;
    float _2056 = fma(_2054, _319, _2042);
    float _2058 = _2042;
    float _2060 = _2044;
    if (_1287)
    {
        float _2062 = _2016 + (-1.0);
        _2058 = _2062;
    }
    float _2064 = _2058;
    float _2066 = _2026 * _1155;
    float _2068 = -_2044;
    float _2070 = fma(_2036, _1155, _2068);
    float _2072 = in.m_64.w;
    if (_1287)
    {
        float _2074 = _2064 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2060 = _2074;
    }
    float _2076 = _2060;
    float _2078 = fma(_2036, _1173, _2066);
    float _2080 = _1413 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    out.m_84.x = _2048;
    out.m_84.y = _2056;
    out.m_84.z = _2052;
    if (_1287)
    {
        float _2082 = fma(_1321, _2016, _2076);
        _1327 = _2082;
    }
    float _2084 = _1327;
    float _2086 = _1223 * _2078;
    float _2088 = _1235 * _2078;
    float _2090 = -_1980;
    float _2092 = fma(_319, _2090, _2000);
    float _2094 = fma(_1399, 100.0, _2084);
    float _2096 = _1413 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2098 = -_2086;
    float _2100 = fma(_1235, _2070, _2098);
    float _2102 = fma(_1201, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2080);
    float _2104 = _2094 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2106 = fma(_1201, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2096);
    float _2108 = fma(_1223, _2070, _2088);
    float _2110 = abs(_1439);
    float _2112 = log2(_2110);
    float _2114 = _2094 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2116 = fma(_1381, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2104);
    float _2118 = fma(_1199, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2102);
    float _2120 = fma(_1199, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2106);
    float _2122 = fma(_1381, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2114);
    float _2124 = _2094 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2126 = _2118 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _2128 = _2120 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    out.m_86.w = _2072;
    float _2130 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2122);
    float _2132 = trunc(_2126);
    int _2134 = int(_2132);
    float _2136 = _2094 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2138 = fma(_1381, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2124);
    float _2140 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2116);
    float _2142 = _2130 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2144 = fma(_1381, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2136);
    float _2146 = _2112 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2148 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2138);
    float _2150 = trunc(_2128);
    int _2152 = int(_2150);
    float _2154 = _2140 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2156 = _2142 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2158 = _2142 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2160 = fma(_1385, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2144);
    float _2162 = _2148 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2164 = _2142 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2166 = _2142 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2168 = exp2(_2146);
    float _2170 = fma(_2154, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2156);
    float _2172 = fma(_2154, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2158);
    float _2174 = fma(_2154, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2164);
    float _2176 = fma(_2154, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2166);
    float _2178 = _2160 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2180 = fma(_2162, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2170);
    float _2182 = fma(_2162, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2172);
    int _2184 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2186 = _2134 + _2184;
    int _2188 = _2186 + 1;
    float _2190 = fma(_2162, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2174);
    int _2192 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2194 = _2152 + _2192;
    int _2196 = _2194 + 1;
    float _2198 = fma(_2162, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2176);
    float _2200 = fma(_2178, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2180);
    float _2202 = fma(_2178, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2182);
    bool _2204 = _2188 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _2206 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2208 = _2094 + _2206;
    int _2210 = _2188 | _2196;
    float _2212 = fma(_2168, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2214 = precise::clamp(_2212, 0.0, 1.0);
    float _2216 = fma(_2178, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2190);
    bool _2218 = _2210 < 0;
    bool _2220 = _2218 || _2204;
    float _2222 = fma(_2178, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2198);
    bool _2224 = _1439 <= 8000.0;
    bool _2226 = isnan(_1439);
    bool _2228 = _2224 || _2226;
    bool _2230 = isnan(8000.0);
    bool _2232 = _2228 || _2230;
    float _2234 = float(_2232);
    float _2236 = fma(_2214, -2.0, 3.0);
    float _2238 = _2214 * _2214;
    bool _2240 = _2196 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2242 = _2240 || _2220;
    float _2244 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2246 = _1381 + _2244;
    float _2248 = _2208 * _2208;
    float _2250 = _2238 * _2236;
    out.gl_Position.x = _2216;
    out.gl_Position.y = _2200;
    out.gl_Position.z = _2202;
    out.gl_Position.w = _2222;
    float _2252 = fma(_2246, _2246, _2248);
    float _2254 = -_2250;
    float _2256 = _2254 + 1.0;
    float _2258 = fma(_2256, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2250);
    float _2260 = _2234 * _2258;
    float _2262 = _2216;
    float _2264 = _2200;
    float _2266 = _2222;
    float _2268 = _2260;
    float _2270 = _2128;
    if (_2242)
    {
        _2262 = 1.0;
    }
    float _2272 = _2262;
    float _2274 = _2272;
    if (!_2242)
    {
        int _2276 = _2196 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2278 = _2276 + _2188;
        float _2280 = floor(_2128);
        int _2282 = _2278 << 2;
        uint _2284 = uint(int(uint(_2278) >> uint(2)));
        int _2286 = 12 & _2282;
        int _2288 = int(_2284) << 4;
        int _2290 = _2288 + _2286;
        float _2292 = floor(_2126);
        float _2294 = -_2280;
        float _2296 = _2128 + _2294;
        int _2298 = _2290 + 400;
        uint _2300 = uint(int(uint(_2298) >> uint(2)));
        uint _2302 = uint(int(uint(int(_2300)) >> uint(2)));
        int _2304 = int(_2300) & 3;
        float _2306 = (*spvDescriptorSet0.vp_c15)._m0[int(_2302)][_2304];
        float _2308 = -_2292;
        float _2310 = _2126 + _2308;
        float _2312 = rint(_2306);
        float _2314 = precise::max(_2312, 0.0);
        uint _2316 = uint(_2314);
        uint _2318 = clamp(_2316, 0u, 65535u);
        float3 _6289 = float3(_2310, _2296, float(int(_2318)));
        float3 _6291 = select(_6289, float3(0.0), isnan(_6289));
        float _2320 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6291.xy, uint(rint(_6291.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6291.xy, uint(rint(_6291.z)), level(0.0)).x;
        int _2322 = _2278 << 4;
        int _2324 = _2322 + 2048;
        uint _2326 = uint(int(uint(_2324) >> uint(2)));
        uint _2328 = uint(int(uint(int(_2326)) >> uint(2)));
        int _2330 = int(_2326) & 3;
        float _2332 = (*spvDescriptorSet0.vp_c15)._m0[int(_2328)][_2330];
        int _2334 = int(_2326) + 1;
        uint _2336 = uint(int(uint(_2334) >> uint(2)));
        int _2338 = _2334 & 3;
        float _2340 = (*spvDescriptorSet0.vp_c15)._m0[int(_2336)][_2338];
        int _2342 = _2324 + 8;
        uint _2344 = uint(int(uint(_2342) >> uint(2)));
        uint _2346 = uint(int(uint(int(_2344)) >> uint(2)));
        int _2348 = int(_2344) & 3;
        float _2350 = (*spvDescriptorSet0.vp_c15)._m0[int(_2346)][_2348];
        int _2352 = int(_2344) + 1;
        uint _2354 = uint(int(uint(_2352) >> uint(2)));
        int _2356 = _2352 & 3;
        float _2358 = (*spvDescriptorSet0.vp_c15)._m0[int(_2354)][_2356];
        float _2360 = _1413 * _2340;
        float _2362 = fma(_1201, _2332, _2360);
        float _2364 = fma(_1199, _2350, _2362);
        float _2366 = _2364 + _2358;
        float _2368 = precise::clamp(_2366, 0.0, 1.0);
        float _2370 = -_2368;
        float _2372 = _2370 + _2320;
        float _2374 = fma(_2372, 500.0, 1.5);
        float _2376 = exp2(_2374);
        float _2378 = 0.0 + _2376;
        float _2380 = precise::clamp(_2378, 0.0, 1.0);
        _2264 = _2306;
        _2274 = _2380;
        _2266 = _2320;
    }
    float _2382 = _2264;
    float _2384 = _2274;
    float _2386 = _2266;
    float _2388 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2390 = _1385 + _2388;
    float _2392 = _2260 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2394 = -_1692;
    float _2396 = _2394 + 1.0;
    float _2398 = _2382;
    float _2400 = _2386;
    if (!_1652)
    {
        _2398 = 1.0;
    }
    float _2402 = _2398;
    float _2404 = fma(_2390, _2390, _2252);
    float _2406 = _2402;
    if (_1652)
    {
        bool _2408 = _1698 >= _1690;
        bool _2410 = isnan(_1698);
        bool _2412 = _2408 || _2410;
        bool _2414 = isnan(_1690);
        bool _2416 = _2412 || _2414;
        float _2418 = float(_2416);
        _2406 = _2418;
    }
    float _2420 = _2406;
    float _2422 = _2396 * _2392;
    float _2424 = precise::clamp(_2422, 0.0, 1.0);
    out.m_88.x = _2108;
    out.m_88.y = _2092;
    out.m_88.z = _2100;
    float _2426 = _2420 * _2384;
    float _2428 = sqrt(_2404);
    float _2430 = -_2424;
    float _2432 = fma(_2430, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_90.x = _1381;
    out.m_90.y = _2094;
    out.m_90.z = _1385;
    float _2434 = -_2426;
    float _2436 = fma(_2434, _2432, 1.0);
    float _2438 = precise::clamp(_2436, 0.0, 1.0);
    float _2440 = _2438 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_92.x = _2440;
    bool _2442 = _2428 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2444 = isnan(_2428);
    bool _2446 = _2442 || _2444;
    bool _2448 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2450 = _2446 || _2448;
    float _2452 = _2424;
    float _2454 = _2432;
    float _2456 = _2438;
    if (!_2450)
    {
        _2268 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2458 = _2268;
    float _2460 = _2458;
    float _2462 = _2458;
    if (!_2450)
    {
        _2270 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2464 = _2270;
    float _2466 = _2464;
    float _2468 = _2464;
    if (!_2450)
    {
        _2400 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2470 = _2400;
    float _2472 = _2470;
    float _2474 = _2470;
    if (!_2450)
    {
        _2452 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2476 = _2452;
    float _2478 = _2476;
    float _2480 = _2476;
    if (!_2450)
    {
        _2454 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2482 = _2454;
    float _2484 = _2482;
    float _2486 = _2482;
    if (!_2450)
    {
        _2456 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2488 = _2456;
    bool _2490 = !_2450;
    float _2492 = _2488;
    float _2494 = _2488;
    if (!_2490)
    {
        bool _2496 = _2428 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2498 = isnan(_2428);
        bool _2500 = _2496 || _2498;
        bool _2502 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2504 = _2500 || _2502;
        if (!_2504)
        {
            float _2506 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2508 = _2428 + _2506;
            float _2510 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2512 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2510;
            float _2514 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2516 = _2514 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2518 = 1.0 / _2512;
            float _2520 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2522 = _2520 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2524 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2526 = _2524 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2528 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2530 = _2528 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2532 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2534 = _2532 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2536 = _2508 * _2518;
            float _2538 = precise::clamp(_2536, 0.0, 1.0);
            float _2540 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2542 = _2540 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2544 = fma(_2538, _2516, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2546 = fma(_2538, _2542, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2548 = fma(_2538, _2522, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2550 = fma(_2538, _2526, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2552 = fma(_2538, _2530, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2554 = fma(_2538, _2534, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2468 = _2544;
            _2486 = _2552;
            _2462 = _2548;
            _2480 = _2550;
            _2474 = _2546;
            _2494 = _2554;
            _2556 = true;
        }
        else
        {
            bool _2558 = _2428 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2560 = isnan(_2428);
            bool _2562 = _2558 || _2560;
            bool _2564 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2566 = _2562 || _2564;
            if (!_2566)
            {
                _2460 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2568 = _2460;
            _2462 = _2568;
            if (!_2566)
            {
                _2466 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2570 = _2466;
            _2468 = _2570;
            if (!_2566)
            {
                _2472 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2572 = _2472;
            _2474 = _2572;
            if (!_2566)
            {
                _2478 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2574 = _2478;
            _2480 = _2574;
            if (!_2566)
            {
                _2484 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2576 = _2484;
            _2486 = _2576;
            if (!_2566)
            {
                _2492 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2578 = _2492;
            bool _2580 = !_2566;
            _2494 = _2578;
            if (!_2580)
            {
                bool _2582 = _2428 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2584 = isnan(_2428);
                bool _2586 = _2582 || _2584;
                bool _2588 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2590 = _2586 || _2588;
                if (!_2590)
                {
                    float _2592 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2594 = _2428 + _2592;
                    float _2596 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2598 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2596;
                    float _2600 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2602 = _2600 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2604 = 1.0 / _2598;
                    float _2606 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2608 = _2606 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2610 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2612 = _2610 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2614 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2616 = _2614 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2618 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2620 = _2618 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2622 = _2594 * _2604;
                    float _2624 = precise::clamp(_2622, 0.0, 1.0);
                    float _2626 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2628 = _2626 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2630 = fma(_2624, _2602, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2632 = fma(_2624, _2628, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2634 = fma(_2624, _2608, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2636 = fma(_2624, _2612, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2638 = fma(_2624, _2616, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2640 = fma(_2624, _2620, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2468 = _2630;
                    _2486 = _2638;
                    _2462 = _2634;
                    _2480 = _2636;
                    _2474 = _2632;
                    _2494 = _2640;
                    _2556 = true;
                }
                else
                {
                    _2468 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2486 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2462 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2480 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2474 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2494 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2556 = false;
    float _2642 = _2468;
    float _2644 = _2486;
    float _2646 = _2462;
    float _2648 = _2480;
    float _2650 = _2474;
    float _2652 = _2494;
    float _2654 = fma(_2092, -0.5, 0.5);
    float _2656 = precise::clamp(_2654, 0.0, 1.0);
    float _2658 = -_2642;
    float _2660 = _2658 + _2644;
    float _2662 = -_2646;
    float _2664 = _2662 + _2648;
    float _2666 = -_2650;
    float _2668 = _2666 + _2652;
    bool _2670 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2672 = fma(_2656, _2660, _2642);
    float _2674 = fma(_2656, _2664, _2646);
    float _2676 = fma(_2656, _2668, _2650);
    float _2678 = _2672 * 0.586610972881317138671875;
    out.m_52.x = 1.0;
    float _2680 = fma(_2674, 0.298911988735198974609375, _2678);
    float _2682 = fma(_2676, 0.114477999508380889892578125, _2680);
    out.m_94.x = 0.0;
    float _2684 = -_2682;
    float _2686 = _2674 + _2684;
    float _2688 = -_2682;
    float _2690 = _2672 + _2688;
    float _2692 = -_2682;
    float _2694 = _2676 + _2692;
    float _2696 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2698 = fma(_2686, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2682);
    float _2700 = fma(_2690, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2682);
    float _2702 = fma(_2694, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2682);
    out.m_92.w = _2696;
    out.m_96.x = _2698;
    out.m_96.y = _2700;
    out.m_96.z = _2702;
    if (!_2670)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2704 = -_2094;
    float _2706 = _2704 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2708 = -_1381;
    float _2710 = _2708 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2712 = -_1385;
    float _2714 = _2712 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2716 = _2706 * _2706;
    float _2718 = fma(_2710, _2710, _2716);
    float _2720 = fma(_2714, _2714, _2718);
    float _2722 = sqrt(_2720);
    float _2724 = rsqrt(_2720);
    float _2726 = -_2722;
    float _2728 = _2726 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2730 = _2728 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2732 = precise::clamp(_2730, 0.0, 1.0);
    float _2734 = _2710 * _2724;
    float _2736 = _2706 * _2724;
    float _2738 = abs(_2732);
    float _2740 = log2(_2738);
    float _2742 = _2714 * _2724;
    float _2744 = _2734 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2746 = _2092 * _2736;
    float _2748 = -_2736;
    float _2750 = -_2744;
    float _2752 = fma(_2748, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2750);
    float _2754 = fma(_2108, _2734, _2746);
    float _2756 = -_2742;
    float _2758 = fma(_2756, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2752);
    float _2760 = fma(_2100, _2742, _2754);
    float _2762 = precise::clamp(_2760, 0.0, 1.0);
    float _2764 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2766 = _2758 + _2764;
    float _2768 = _2740 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2770 = _2766 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2772 = precise::clamp(_2770, 0.0, 1.0);
    float _2774 = exp2(_2768);
    float _2776 = _2774 * _2772;
    float _2778 = _2762 * _2776;
    float _2780 = _2778 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2782 = _2778 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2784 = _2778 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_94.x = _2780;
    out.m_94.y = _2782;
    out.m_94.z = _2784;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

