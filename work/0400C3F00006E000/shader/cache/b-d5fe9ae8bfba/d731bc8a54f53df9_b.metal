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
    float4 m_78 [[user(locn1)]];
    float4 m_74 [[user(locn2)]];
    float4 m_88 [[user(locn3)]];
    float4 m_96 [[user(locn4)]];
    float4 m_52 [[user(locn5)]];
    float4 m_86 [[user(locn6)]];
    float4 m_90 [[user(locn7)]];
    float4 m_84 [[user(locn8)]];
    float4 m_94 [[user(locn9)]];
    float4 m_92 [[user(locn10)]];
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
    float4 m_82 [[attribute(7)]];
    float4 m_66 [[attribute(8)]];
    float4 m_62 [[attribute(9)]];
    float4 m_70 [[attribute(10)]];
    float4 m_76 [[attribute(11)]];
    float4 m_68 [[attribute(12)]];
    float4 m_64 [[attribute(13)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3186 = false;
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
    if (!_119)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3471 = as_type<float>(_131);
        out.gl_Position.z = _3471;
    }
    if (!_119)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _133 = in.m_54.w;
    float _135 = float(_115);
    float _137 = -_133;
    float _139 = _137 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _141 = _133 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _143 = isnan(_133);
    bool _145 = _141 || _143;
    bool _147 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _149 = _145 || _147;
    bool _151 = _139 >= _135;
    bool _153 = !_149;
    bool _155 = _151 || _153;
    if (_155)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _157 = _123;
    if (_155)
    {
        out.m_52.x = 0.0;
    }
    int _159 = 0;
    if (_155)
    {
        float _161 = _157 * 5.0;
        _159 = as_type<int>(_161);
    }
    int _163 = _159;
    if (_155)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3534 = as_type<float>(_163);
        out.gl_Position.z = _3534;
    }
    if (_155)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _165 = in.m_56.x;
    float _167 = in.m_56.y;
    float _169 = in.m_56.z;
    float _171 = 1.0 / _135;
    float _173 = in.m_58.x;
    float _175 = in.m_58.y;
    float _177 = in.m_58.z;
    float _179 = in.m_60.x;
    float _181 = in.m_60.y;
    float _183 = in.m_60.z;
    float _185 = _139 * _171;
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
    float _219 = _167;
    float _221 = _195;
    float _223 = _205;
    float _225 = _199;
    if (_211)
    {
        float _227 = rsqrt(_195);
        _215 = _227;
    }
    float _229 = _215;
    if (!_211)
    {
        _217 = 0.0;
    }
    float _231 = _217;
    bool _233 = _209 > 0.0;
    float _235 = 0.0;
    float _237 = _209;
    float _239 = _231;
    if (!_211)
    {
        _235 = 0.0;
    }
    float _241 = _235;
    float _243 = _241;
    if (!_211)
    {
        _237 = 0.0;
    }
    float _245 = _237;
    float _247 = _201;
    float _249 = _245;
    if (_213)
    {
        float _251 = rsqrt(_199);
        _247 = _251;
    }
    float _253 = _247;
    float _255 = 0.0;
    if (!_213)
    {
        _255 = 0.0;
    }
    float _257 = _255;
    float _259 = 0.0;
    float _261 = _257;
    if (_233)
    {
        float _263 = rsqrt(_205);
        _259 = _263;
    }
    float _265 = _259;
    float _267 = _229;
    if (_211)
    {
        float _269 = _229 * _165;
        _239 = _269;
    }
    float _271 = _239;
    if (_211)
    {
        float _273 = _229 * _173;
        _243 = _273;
    }
    float _275 = _243;
    if (_211)
    {
        float _277 = _229 * _179;
        _249 = _277;
    }
    float _279 = _249;
    bool _281 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    if (!_213)
    {
        _267 = 0.0;
    }
    float _283 = _267;
    float _285 = _283;
    if (_213)
    {
        float _287 = _253 * _167;
        _261 = _287;
    }
    float _289 = _261;
    if (!_213)
    {
        _219 = 0.0;
    }
    float _291 = _219;
    float _293 = _291;
    if (_213)
    {
        float _295 = _253 * _175;
        _293 = _295;
    }
    float _297 = _293;
    if (!_233)
    {
        _221 = 0.0;
    }
    float _299 = _221;
    float _301 = _299;
    if (_213)
    {
        float _303 = _253 * _181;
        _285 = _303;
    }
    float _305 = _285;
    if (!_233)
    {
        _223 = 0.0;
    }
    float _307 = _223;
    float _309 = _307;
    if (!_233)
    {
        _225 = 0.0;
    }
    float _311 = _225;
    float _313 = _311;
    if (_233)
    {
        float _315 = _265 * _169;
        _301 = _315;
    }
    float _317 = _301;
    if (_233)
    {
        float _319 = _265 * _177;
        _309 = _319;
    }
    float _321 = _309;
    float _323 = _321;
    if (_233)
    {
        float _325 = _265 * _183;
        _313 = _325;
    }
    float _327 = _313;
    bool _329 = !_281;
    float _347;
    if (!_329)
    {
        float _331 = in.m_62.x;
        float _333 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _335 = _331 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _337 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[12].x, _139);
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
    float _357 = _139 * (*spvDescriptorSet0.vp_c9)._m0[193].y;
    float _359 = in.m_62.x;
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _363 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _361;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _367 = _351 + _365;
    float _369 = in.m_49.x;
    float _371 = in.m_49.y;
    float _373 = in.m_49.z;
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _377 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _375;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _381 = _379 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _385 = _351 + _383;
    float _387 = in.m_62.y;
    float _389 = 1.0 / _363;
    bool _391 = _351 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _393 = isnan(_351);
    bool _395 = _391 || _393;
    bool _397 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _399 = _395 || _397;
    float _401 = float(_399);
    float _403 = 1.0 / _377;
    float _405 = fma(_359, 6.283185482025146484375, _357);
    float _407 = abs(_353);
    float _409 = log2(_407);
    float _411 = fma((*spvDescriptorSet0.vp_c9)._m0[194].y, 0.01745329238474369049072265625, _405);
    float _413 = _181 * _371;
    float _415 = _411 * 0.15915493667125701904296875;
    float _417 = 1.0 / _381;
    float _419 = fma(_179, _369, _413);
    float _421 = _367 * _403;
    float _423 = _387 * 628.31854248046875;
    float _425 = fma(_353, 0.261799395084381103515625, -0.261799395084381103515625);
    float _427 = _409 * (*spvDescriptorSet0.vp_c9)._m0[193].z;
    float _429 = _411 * 0.60000002384185791015625;
    float _431 = _175 * _371;
    float _433 = exp2(_427);
    float _435 = _429 * 0.15915493667125701904296875;
    float _437 = _411 * 1.2999999523162841796875;
    float _439 = fma(_173, _369, _431);
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _443 = _351 + _441;
    float _445 = _437 * 0.15915493667125701904296875;
    float _447 = _411 + 0.52359879016876220703125;
    float _449 = _443 * _389;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _453 = _451 + (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _455 = _447 * 0.15915493667125701904296875;
    float _457 = _385 * _417;
    float _459 = fma(_411, 0.60000002384185791015625, 0.31415927410125732421875);
    float _461 = fma(_453, _359, (*spvDescriptorSet0.vp_c9)._m0[191].x);
    float _463 = _415 * 6.283185482025146484375;
    float _465 = sin(_463);
    float _467 = _459 * 0.15915493667125701904296875;
    float _469 = fma(_411, 1.2999999523162841796875, 0.680678427219390869140625);
    float _471 = fma(_139, _461, _423);
    float _473 = (*spvDescriptorSet0.vp_c9)._m0[193].w * 3.1415927410125732421875;
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _477 = _475 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _479 = _435 * 6.283185482025146484375;
    float _481 = sin(_479);
    float _483 = fma(_473, _433, _357);
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _487 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _485;
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _491 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _489;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _495 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _493;
    float _497 = in.m_66.x;
    float _499 = in.m_66.y;
    float _501 = in.m_66.z;
    float _503 = fma(_487, _421, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _505 = fma(_491, _421, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _507 = fma(_495, _421, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _509 = _471 + _425;
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _513 = _511 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _515 = _445 * 6.283185482025146484375;
    float _517 = sin(_515);
    float _519 = _469 * 0.15915493667125701904296875;
    float _521 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _523 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _521;
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _527 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _525;
    float _529 = fma(_481, 0.60000002384185791015625, _465);
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _531;
    bool _535 = _351 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _537 = isnan(_351);
    bool _539 = _535 || _537;
    bool _541 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _543 = _539 || _541;
    float _545 = float(_543);
    float _547 = fma(_523, _449, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _549 = _509 * 0.89999997615814208984375;
    float _551 = fma(_527, _449, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _553 = fma(_533, _449, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    bool _555 = _351 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _557 = isnan(_351);
    bool _559 = _555 || _557;
    bool _561 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _563 = _559 || _561;
    float _565 = float(_563);
    float _567 = -_545;
    float _569 = _567 + 1.0;
    float _571 = _549 * 0.15915493667125701904296875;
    float _573 = _509 * 1.10000002384185791015625;
    float _575 = _455 * 6.283185482025146484375;
    float _577 = sin(_575);
    float _579 = _565 * _569;
    float _581 = _509 * 0.699999988079071044921875;
    float _583 = -_565;
    float _585 = _583 + 1.0;
    float _587 = _573 * 0.15915493667125701904296875;
    bool _589 = _351 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _591 = isnan(_351);
    bool _593 = _589 || _591;
    bool _595 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _597 = _593 || _595;
    float _599 = float(_597);
    float _601 = _581 * 0.15915493667125701904296875;
    float _603 = _401 * _585;
    float _605 = _467 * 6.283185482025146484375;
    float _607 = sin(_605);
    float _609 = -_401;
    float _611 = _609 + 1.0;
    float _613 = _471 * 0.89999997615814208984375;
    float _615 = fma(_359, 6.283185482025146484375, _483);
    bool _617 = _497 > 0.0;
    float _619 = _599 * _611;
    float _621 = fma(_517, 0.300000011920928955078125, _529);
    float _623 = _615 * 0.60000002384185791015625;
    float _625 = _519 * 6.283185482025146484375;
    float _627 = sin(_625);
    bool _629 = _497 >= 0.0;
    bool _631 = isnan(_497);
    bool _633 = _629 || _631;
    bool _635 = isnan(0.0);
    bool _637 = _633 || _635;
    float _639 = _503 * _619;
    float _641 = _505 * _619;
    float _643 = _507 * _619;
    float _645 = fma(_513, _457, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _647 = fma(_477, _457, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    int _649 = _637 ? 0 : 1;
    float _651 = fma(_607, 0.60000002384185791015625, _577);
    float _653 = _613 * 0.15915493667125701904296875;
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _657 = _655 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _659 = _509 * 0.15915493667125701904296875;
    float _661 = -_599;
    float _663 = _661 + 1.0;
    float _665 = _587 * 6.283185482025146484375;
    float _667 = cos(_665);
    float _669 = fma(_657, _457, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _671 = _615 * 0.15915493667125701904296875;
    float _673 = fma(_627, 0.300000011920928955078125, _651);
    int _675 = ~_649;
    int _677 = _675 + 1;
    int _679 = _677 + 1;
    float _681 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[143].x, _639);
    float _683 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[143].z, _643);
    int _685 = _679;
    if (!_617)
    {
        int _687 = ~_649;
        int _689 = _687 + 1;
        _685 = _689;
    }
    int _691 = _685;
    float _693 = -_353;
    float _695 = _693 + 1.0;
    float _697 = _623 * 0.15915493667125701904296875;
    float _699 = _615 * 1.2999999523162841796875;
    float _701 = _671 * 6.283185482025146484375;
    float _703 = sin(_701);
    float _705 = _621 * _695;
    float _707 = -_355;
    float _709 = _707 + 1.0;
    float _711 = _699 * 0.15915493667125701904296875;
    float _713 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[143].y, _641);
    float _715 = fma(_645, _603, _681);
    float _717 = in.m_68.y;
    float _719 = _705 * 0.52359879016876220703125;
    float _721 = _697 * 6.283185482025146484375;
    float _723 = sin(_721);
    float _725 = fma(_647, _603, _713);
    float _727 = fma(_669, _603, _683);
    float _729 = abs(_673);
    float _731 = _709 * _729;
    float _733 = in.m_70.x;
    float _735 = in.m_70.y;
    float _737 = in.m_70.z;
    float _739 = _719 * 0.15915493667125701904296875;
    float _741 = fma(_547, _579, _715);
    float _743 = _731 * (-45.0);
    float _745 = _571 * 6.283185482025146484375;
    float _747 = sin(_745);
    float _749 = fma(_551, _579, _725);
    float _751 = float(_691);
    float _753 = _743 * 0.01745329238474369049072265625;
    float _755 = fma(_553, _579, _727);
    float _757 = _731 * (-20.0);
    float _759 = fma(_545, (*spvDescriptorSet0.vp_c9)._m0[146].y, _749);
    float _761 = _753 * 0.15915493667125701904296875;
    float _763 = _659 * 6.283185482025146484375;
    float _765 = sin(_763);
    float _767 = fma(_723, 0.60000002384185791015625, _703);
    float _769 = _751 * _757;
    float _771 = fma(_545, (*spvDescriptorSet0.vp_c9)._m0[146].x, _741);
    float _773 = fma(_545, (*spvDescriptorSet0.vp_c9)._m0[146].z, _755);
    float _775 = _471 * 0.15915493667125701904296875;
    float _777 = _769 * 0.01745329238474369049072265625;
    float _779 = _711 * 6.283185482025146484375;
    float _781 = sin(_779);
    float _783 = _747 * 0.89999997615814208984375;
    float _785 = _499 + (-0.0199999995529651641845703125);
    float _787 = _759 * _735;
    float _789 = _771 * _733;
    float _791 = _773 * _737;
    float _793 = _601 * 6.283185482025146484375;
    float _795 = cos(_793);
    float _797 = -_783;
    float _799 = fma(_765, -1.2000000476837158203125, _797);
    float _801 = fma(_717, 0.5, 0.5);
    float _803 = abs(_799);
    bool _805 = _803 > 0.001000000047497451305389404296875;
    bool _807 = isnan(_803);
    bool _809 = _805 || _807;
    bool _811 = isnan(0.001000000047497451305389404296875);
    bool _813 = _809 || _811;
    float _815 = _739 * 6.283185482025146484375;
    float _817 = sin(_815);
    float _819 = fma(_781, 0.300000011920928955078125, _767);
    float _821 = _777 * 0.15915493667125701904296875;
    float _823 = _801 * _819;
    float _825 = _739 * 6.283185482025146484375;
    float _827 = cos(_825);
    float _829 = _795 * 0.699999988079071044921875;
    float _831 = _823 * (*spvDescriptorSet0.vp_c9)._m0[193].x;
    float _833 = fma(_667, 1.10000002384185791015625, _829);
    float _835 = _831 * 0.01745329238474369049072265625;
    float _837 = _761 * 6.283185482025146484375;
    float _839 = sin(_837);
    float _841 = _817 * _497;
    float _843 = abs(_833);
    bool _845 = _843 != 0.0;
    bool _847 = isnan(_843);
    bool _849 = _845 || _847;
    bool _851 = isnan(0.0);
    bool _853 = _849 || _851;
    float _855 = _835 * 0.15915493667125701904296875;
    float _857 = _761 * 6.283185482025146484375;
    float _859 = cos(_857);
    float _861 = _827 * _497;
    float _863 = _813 ? _799 : 0.001000000047497451305389404296875;
    float _865 = -_841;
    float _867 = fma(_827, _501, _865);
    float _869 = fma(_817, _501, _861);
    float _871 = abs(_863);
    bool _873 = _871 == 0.0;
    bool _875 = !_853;
    bool _877 = _873 && _875;
    float _879 = _867 + 0.02999999932944774627685546875;
    float _881 = _821 * 6.283185482025146484375;
    float _883 = sin(_881);
    float _885 = fma(_751, -0.100000001490116119384765625, _869);
    int _887 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _889 = _887 != 0;
    int _891 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _893 = _891 != 0;
    int _895 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _897 = _895 != 0;
    float _899 = _839 * _879;
    float _901 = abs(_863);
    bool _903 = _901 == 0.0;
    float _905 = _821 * 6.283185482025146484375;
    float _907 = cos(_905);
    float _909 = _859 * _879;
    float _911 = -_899;
    float _913 = fma(_859, _785, _911);
    bool _915 = _233;
    int _917 = as_type<int>(_819);
    if (_877)
    {
        bool _919 = as_type<int>(_863) >= 0;
        _915 = _919;
    }
    bool _921 = _915;
    int _923 = _921 ? (-1) : 0;
    if (_877)
    {
        int _925 = _921 ? 0 : 1078530011;
        _917 = _925;
    }
    int _927 = _917;
    float _929 = _775 * 6.283185482025146484375;
    float _931 = cos(_929);
    float _933 = _913 * _883;
    int _935 = _927;
    if (_877)
    {
        int _937 = int(0x80000000) & as_type<int>(_833);
        int _939 = _927 | _937;
        _935 = _939;
    }
    int _941 = _935;
    float _943 = _653 * 6.283185482025146484375;
    float _945 = cos(_943);
    float _947 = _913 * _907;
    float _949 = -_933;
    float _951 = fma(_907, _885, _949);
    float _953 = _471 * 0.699999988079071044921875;
    float _955 = fma(_883, _885, _947);
    bool _957 = !_893;
    int _959 = _957 ? 0 : 1;
    float _961 = _855 * 6.283185482025146484375;
    float _963 = sin(_961);
    bool _965 = !_889;
    int _967 = _965 ? 0 : 1;
    bool _969 = !_897;
    int _971 = _969 ? 0 : 1;
    float _973 = _855 * 6.283185482025146484375;
    float _975 = cos(_973);
    bool _977 = !_853;
    bool _979 = _977 && _903;
    int _981 = _941;
    float _983 = as_type<float>(_941);
    if (!_979)
    {
        float _985 = abs(_833);
        bool _987 = _985 != as_type<float>(0x7f800000u /* inf */);
        bool _989 = isnan(_985);
        bool _991 = _987 || _989;
        bool _993 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _995 = _991 || _993;
        float _997 = abs(_863);
        bool _999 = _997 == as_type<float>(0x7f800000u /* inf */);
        float _1001 = abs(_863);
        bool _1003 = _1001 == as_type<float>(0x7f800000u /* inf */);
        bool _1005 = !_995;
        bool _1007 = _1003 && _1005;
        if (_1007)
        {
            bool _1009 = as_type<int>(_863) >= 0;
            _923 = _1009 ? (-1) : 0;
        }
        int _1011 = _923;
        if (_1007)
        {
            _981 = 1075235812;
        }
        int _1013 = _981;
        int _1015 = _1013;
        if (_1007)
        {
            int _1017 = ~_1011;
            int _1019 = (_1017 != 0) ? _1013 : 1061752795;
            _1015 = _1019;
        }
        int _1021 = _1015;
        float _1023 = as_type<float>(_1021);
        if (_1007)
        {
            int _1025 = int(0x80000000) & as_type<int>(_833);
            int _1027 = _1021 | _1025;
            _1023 = as_type<float>(_1027);
        }
        float _1029 = _1023;
        bool _1031 = !_995;
        bool _1033 = _1031 && _999;
        _983 = _1029;
        if (!_1033)
        {
            float _1035 = abs(_833);
            float _1037 = abs(_863);
            float _1039 = precise::max(_1035, _1037);
            float _1041 = abs(_833);
            float _1043 = abs(_863);
            float _1045 = precise::min(_1041, _1043);
            float _1047 = 1.0 / _1039;
            float _1049 = abs(_833);
            float _1051 = abs(_863);
            bool _1053 = _1049 > _1051;
            bool _1055 = as_type<int>(_863) >= 0;
            float _1057 = _1045 * _1047;
            float _1059 = abs(_833);
            float _1061 = abs(_863);
            float _1063 = _1059 + _1061;
            int _1065 = as_type<int>(_833) & int(0x80000000);
            float _1067 = _1057 * _1057;
            bool _1069 = _1063 > as_type<float>(0x7f800000u /* inf */);
            bool _1071 = isnan(_1063);
            bool _1073 = _1069 || _1071;
            bool _1075 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1077 = _1073 || _1075;
            float _1079 = _1067 + 11.33538818359375;
            float _1081 = fma(_1067, _1079, 28.84246826171875);
            float _1083 = fma(_1067, _1081, 19.6966705322265625);
            float _1085 = fma(_1067, -0.82336294651031494140625, -5.674867153167724609375);
            float _1087 = fma(_1067, _1085, -6.565555095672607421875);
            float _1089 = 1.0 / _1083;
            float _1091 = _1067 * _1087;
            float _1093 = _1057 * _1091;
            float _1095 = fma(_1093, _1089, _1057);
            float _1097 = _1095;
            _983 = _1063;
            if (_1053)
            {
                float _1099 = -_1095;
                float _1101 = _1099 + 1.57079637050628662109375;
                _1097 = _1101;
            }
            float _1103 = _1097;
            int _1105 = as_type<int>(_1103);
            if (!_1055)
            {
                float _1107 = -_1103;
                float _1109 = _1107 + 3.1415927410125732421875;
                _1105 = as_type<int>(_1109);
            }
            int _1111 = _1105;
            if (!_1077)
            {
                int _1113 = _1065 | _1111;
                _983 = as_type<float>(_1113);
            }
        }
    }
    float _1115 = _983;
    float _1117 = _955 + 0.0199999995529651641845703125;
    float _1119 = _953 * 0.15915493667125701904296875;
    float _1121 = fma(_751, 0.100000001490116119384765625, _951);
    float _1123 = in.m_62.z;
    float _1125 = _1117 * _963;
    float _1127 = fma(_839, _785, _909);
    float _1129 = _1117 * _975;
    float _1131 = _1119 * 6.283185482025146484375;
    float _1133 = sin(_1131);
    float _1135 = -_1125;
    float _1137 = fma(_1121, _975, _1135);
    float _1139 = _1115 + 1.57079637050628662109375;
    float _1141 = in.m_58.w;
    float _1143 = _787 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1145 = fma(_621, (*spvDescriptorSet0.vp_c9)._m0[194].x, _1137);
    float _1147 = _1139 * (-0.15915493667125701904296875);
    float _1149 = _791 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1151 = fma(_1121, _963, _1129);
    float _1153 = _1127 + (-0.02999999932944774627685546875);
    float _1155 = in.m_60.w;
    float _1157 = _789 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1159 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1145);
    float _1161 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1153);
    float _1163 = _1147 * 6.283185482025146484375;
    float _1165 = cos(_1163);
    float _1167 = _471 * 1.10000002384185791015625;
    float _1169 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1151);
    float _1171 = _1149 * _1161;
    float _1173 = _1157 * _1159;
    float _1175 = _1167 * 0.15915493667125701904296875;
    float _1177 = _1143 * _1169;
    float _1179 = _1171 * _297;
    float _1181 = _1147 * 6.283185482025146484375;
    float _1183 = sin(_1181);
    float _1185 = _1171 * _305;
    float _1187 = _1123 * 6.283185482025146484375;
    float _1189 = fma(_1173, _275, _1179);
    float _1191 = fma(_177, _373, _439);
    float _1193 = fma(_1173, _279, _1185);
    float _1195 = _1187 * 0.15915493667125701904296875;
    float _1197 = -_1177;
    float _1199 = fma(_1197, _321, _1189);
    float _1201 = _1175 * 6.283185482025146484375;
    float _1203 = sin(_1201);
    float _1205 = -_1177;
    float _1207 = fma(_1205, _327, _1193);
    float _1209 = fma(_183, _373, _419);
    float _1211 = _1199 * _1165;
    float _1213 = _1191 + _1141;
    float _1215 = fma(_931, 1.2000000476837158203125, _945);
    float _1217 = _1209 + _1155;
    float _1219 = in.m_72.y;
    float _1221 = _1195 * 6.283185482025146484375;
    float _1223 = sin(_1221);
    float _1225 = _1199 * _1183;
    float _1227 = fma(_1207, _1183, _1211);
    float _1229 = _185 * 3.3333332538604736328125;
    float _1231 = -_1225;
    float _1233 = fma(_1207, _1165, _1231);
    float _1235 = _1213 + _1227;
    float _1237 = -_1229;
    float _1239 = _1237 + 3.3333332538604736328125;
    float _1241 = precise::clamp(_1239, 0.0, 1.0);
    float _1243 = _1195 * 6.283185482025146484375;
    float _1245 = cos(_1243);
    float _1247 = _1133 + _1203;
    float _1249 = _1217 + _1233;
    float _1251 = fma(_1215, (*spvDescriptorSet0.vp_c9)._m0[191].z, _1235);
    float _1253 = fma(_1247, (*spvDescriptorSet0.vp_c9)._m0[191].z, _1249);
    float _1255 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1257 = _1251 + _1255;
    float _1259 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1261 = _1253 + _1259;
    float _1263 = _1223 * _1257;
    float _1265 = _371 + _1219;
    float _1267 = _1245 * _1257;
    float _1269 = -_1263;
    float _1271 = fma(_1245, _1261, _1269);
    float _1273 = fma(_1223, _1261, _1267);
    float _1275 = _1271 + (*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1277 = _1273 + (*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1279 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1281 = _1275 + _1279;
    float _1283 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1285 = _1277 + _1283;
    float _1287 = _1281 * _1281;
    float _1289 = fma(_1285, _1285, _1287);
    float _1291 = sqrt(_1289);
    bool _1293 = _1291 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1295 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1297 = _1291 + _1295;
    float _1299 = 0.0 + _1229;
    float _1301 = precise::clamp(_1299, 0.0, 1.0);
    float _1303 = precise::min(_1301, _1241);
    float _1305 = _1147;
    float _1307 = _1219;
    float _1309 = _1275;
    if (_1293)
    {
        float _1311 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1305 = _1311;
    }
    float _1313 = _1305;
    float _1315 = -(*spvDescriptorSet0.vp_c9)._m0[192].w;
    float _1317 = _1315 + 1.0;
    if (_1293)
    {
        float _1319 = rsqrt(_1289);
        _1307 = _1319;
    }
    float _1321 = _1307;
    float _1323 = _1313;
    if (_1293)
    {
        float _1325 = _1297 * _1313;
        _1323 = _1325;
    }
    float _1327 = _1323;
    float _1329 = _1171 * _289;
    float _1331 = _1327;
    if (_1293)
    {
        float _1333 = _1327 * 0.15915493667125701904296875;
        _1331 = _1333;
    }
    float _1335 = _1331;
    float _1337 = fma(_1173, _271, _1329);
    float _1339 = _1229;
    float _1341 = _1335;
    if (_1293)
    {
        float _1343 = _1335 * 6.283185482025146484375;
        float _1345 = sin(_1343);
        _1339 = _1345;
    }
    float _1347 = _1339;
    float _1349 = -_1177;
    float _1351 = fma(_1349, _317, _1337);
    float _1353 = fma(_1303, -5.0, 5.0);
    float _1355 = _1265 + _1351;
    float _1357 = -_1353;
    float _1359 = fma(_1357, _1317, _1355);
    float _1361 = _1355;
    float _1363 = _1359;
    if (_1293)
    {
        float _1365 = _1359 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1361 = _1365;
    }
    float _1367 = _1361;
    float _1369 = _1367;
    float _1371 = _1347;
    if (_1293)
    {
        float _1373 = fma(_1347, _1367, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1369 = _1373;
    }
    float _1375 = _1369;
    float _1377 = _1375;
    if (!_1293)
    {
        _1371 = _1277;
    }
    float _1379 = _1371;
    float _1381 = _1379;
    if (_1293)
    {
        float _1383 = _1321 * _1375;
        _1377 = _1383;
    }
    float _1385 = _1377;
    if (_1293)
    {
        float _1387 = fma(_1285, _1385, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1381 = _1387;
    }
    float _1389 = _1381;
    if (_1293)
    {
        float _1391 = fma(_1281, _1385, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1309 = _1391;
    }
    float _1393 = _1309;
    float _1395 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1397 = _1389 + _1395;
    float _1399 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1401 = _1393 + _1399;
    float _1403 = fma(_1397, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1405 = fma(_1401, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _5330 = float2(_1403, _1405);
    float _1407 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_5330, float2(0.0), isnan(_5330)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_5330, float2(0.0), isnan(_5330)), level(0.0)).x;
    float _1409 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1411 = int(_1409);
    int _1413 = abs(_971);
    float _1415 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1417 = int(_1415);
    float _1419 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _1421 = float(_1411);
    float _1423 = 1.0 / _1421;
    float _1425 = float(uint(_1417));
    bool _1427 = _1417 == 0;
    float _1429 = 1.0 / _1425;
    float _1431 = _139 * _1423;
    float _1433 = trunc(_1431);
    int _1435 = int(_1433);
    int _1437 = as_type<int>(_1429) + (-2);
    float _1439 = float(uint(_1435));
    float _1441 = as_type<float>(_1437) * _1439;
    float _1443 = trunc(_1441);
    float _1445 = precise::max(_1443, 0.0);
    uint _1448 = uint(_1445);
    int _1450 = ~_1417;
    int _1452 = _1450 + 1;
    int _1454 = ~_1417;
    int _1456 = _1454 + 1;
    int _1458 = _1452 * int(_1448);
    int _1460 = _1458 + _1435;
    float _1462 = float(_1417);
    float _1464 = float(uint(_1460));
    float _1466 = as_type<float>(_1437) * _1464;
    int _1468 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1470 = _1468 != 0;
    float _1472 = trunc(_1466);
    float _1474 = precise::max(_1472, 0.0);
    uint _1476 = uint(_1474);
    bool _1478 = !_1470;
    float _1480 = _1478 ? 7.345489978790283203125 : 1.0;
    float _1482 = _1480 * _359;
    float _1484 = floor(_1482);
    int _1486 = int(_1448) + int(_1476);
    float _1488 = float(_1435);
    int _1490 = _1456 * _1486;
    int _1492 = _1490 + _1435;
    bool _1494 = _1488 >= _1462;
    bool _1496 = isnan(_1488);
    bool _1498 = _1494 || _1496;
    bool _1500 = isnan(_1462);
    bool _1502 = _1498 || _1500;
    float _1504 = float(_1502);
    bool _1506 = uint(_1492) >= uint(_1417);
    float _1508 = trunc(_1504);
    int _1510 = int(_1508);
    bool _1512 = !_1506;
    int _1514 = _1512 ? 0 : (-1);
    float _1516 = -_1484;
    float _1518 = _1482 + _1516;
    int _1520 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1522 = _1520 != 0;
    int _1524 = ~_1486;
    int _1526 = _1524 + _1514;
    int _1528 = _1526 + 1;
    float _1530 = _1518 * _1462;
    float _1532 = _139 * _1462;
    bool _1534 = !_1522;
    int _1536 = _1534 ? 0 : 1;
    int _1538 = _1417 * _1528;
    int _1540 = _1538 + _1435;
    float _1542 = _1532 * _171;
    float _1544 = trunc(_1530);
    int _1546 = int(_1544);
    int _1548 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1550 = _1548 != 0;
    int _1552 = ~_1510;
    int _1554 = _1552 + 1;
    int _1556 = _1554 + 1;
    bool _1558 = !_1427;
    int _1560 = _1558 ? _1540 : (-1);
    int _1562 = _1417 + (-1);
    float _1564 = trunc(_1542);
    int _1566 = int(_1564);
    int _1568 = abs(_959);
    int _1570 = _1560 * _1556;
    int _1572 = abs(_1536);
    int _1574 = abs(_967);
    int _1576 = _1510 * _1562;
    int _1578 = _1576 + _1570;
    bool _1580 = !_1550;
    int _1582 = _1580 ? 0 : 1;
    int _1584 = _1578 * _1568;
    int _1586 = _1546 * _1572;
    int _1588 = _1586 + _1435;
    int _1590 = abs(_1582);
    int _1592 = _1566 * _1574;
    int _1594 = _1592 + _1584;
    float _1596 = float(uint(_1588));
    int _1598 = _1588 * _1413;
    int _1600 = _1598 + _1594;
    int _1602 = ~_1417;
    int _1604 = _1602 + 1;
    float _1606 = as_type<float>(_1437) * _1596;
    int _1608 = _1546 * _1590;
    int _1610 = _1608 + _1600;
    int _1612 = ~_1417;
    int _1614 = _1612 + 1;
    float _1616 = trunc(_1606);
    float _1618 = precise::max(_1616, 0.0);
    uint _1620 = uint(_1618);
    float _1622 = float(uint(_1610));
    float _1624 = as_type<float>(_1437) * _1622;
    float _1626 = trunc(_1624);
    float _1628 = precise::max(_1626, 0.0);
    uint _1630 = uint(_1628);
    int _1632 = _1604 * int(_1630);
    int _1634 = _1632 + _1610;
    float _1636 = float(uint(_1634));
    float _1638 = as_type<float>(_1437) * _1636;
    int _1640 = _1614 * int(_1620);
    int _1642 = _1640 + _1588;
    float _1644 = trunc(_1638);
    float _1646 = precise::max(_1644, 0.0);
    uint _1648 = uint(_1646);
    float _1650 = float(uint(_1642));
    float _1652 = as_type<float>(_1437) * _1650;
    int _1654 = ~_1417;
    int _1656 = _1654 + 1;
    float _1658 = trunc(_1652);
    float _1660 = precise::max(_1658, 0.0);
    uint _1662 = uint(_1660);
    int _1664 = int(_1630) + int(_1648);
    int _1666 = ~_1417;
    int _1668 = _1666 + 1;
    int _1670 = _1656 * _1664;
    int _1672 = _1670 + _1610;
    bool _1674 = uint(_1672) >= uint(_1417);
    int _1676 = int(_1620) + int(_1662);
    bool _1678 = !_1674;
    int _1680 = _1678 ? 0 : (-1);
    int _1682 = _1668 * _1676;
    int _1684 = _1682 + _1588;
    int _1686 = ~_1664;
    int _1688 = _1686 + _1680;
    int _1690 = _1688 + 1;
    bool _1692 = uint(_1684) >= uint(_1417);
    int _1694 = _1417 * _1690;
    int _1696 = _1694 + _1610;
    bool _1698 = !_1427;
    int _1700 = _1698 ? _1696 : (-1);
    int _1702 = _1700 & 3;
    bool _1704 = _1702 != 0;
    float _1706 = fma(_1407, 100.0, _1265);
    float _1708 = _1706 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1710 = fma(_1213, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1708);
    float _1712 = fma(_1217, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1710);
    float _1714 = _1706 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1716 = _1706 + _1419;
    float _1718 = _1712 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1720 = fma(_1213, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1714);
    float _1722 = 1.0 / _1718;
    float _1724 = fma(_1217, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1720);
    float _1726 = _1724 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1728 = _1726 + _1718;
    float _1730 = _1728 * _1722;
    float _1732 = _1730 * 0.5;
    float _1734 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1736 = fma(_1732, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1734);
    float _1738 = 1.0 / _1736;
    float _1740 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1742 = _1738 * _1740;
    bool _1744 = _1742 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1746 = _1742 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1748 = !_1744;
    int _1750 = _1748 ? 0 : 1;
    int _1752 = 2;
    float _1754 = _1716;
    if (!_1744)
    {
        _1752 = 1;
    }
    int _1756 = _1752;
    int _1758 = _1756;
    if (!_1746)
    {
        _1758 = _1750;
    }
    int _1760 = _1758;
    int _1762 = _1760 << 6;
    int _1764 = _1762 + 96;
    uint _1766 = uint(int(uint(_1764) >> uint(2)));
    uint _1768 = uint(int(uint(int(_1766)) >> uint(2)));
    int _1770 = int(_1766) & 3;
    float _1772 = (*spvDescriptorSet0.vp_c15)._m0[int(_1768)][_1770];
    int _1774 = int(_1766) + 1;
    uint _1776 = uint(int(uint(_1774) >> uint(2)));
    int _1778 = _1774 & 3;
    float _1780 = (*spvDescriptorSet0.vp_c15)._m0[int(_1776)][_1778];
    int _1782 = _1762 + 104;
    uint _1784 = uint(int(uint(_1782) >> uint(2)));
    uint _1786 = uint(int(uint(int(_1784)) >> uint(2)));
    int _1788 = int(_1784) & 3;
    float _1790 = (*spvDescriptorSet0.vp_c15)._m0[int(_1786)][_1788];
    int _1792 = int(_1784) + 1;
    uint _1794 = uint(int(uint(_1792) >> uint(2)));
    int _1796 = _1792 & 3;
    float _1798 = (*spvDescriptorSet0.vp_c15)._m0[int(_1794)][_1796];
    int _1800 = _1762 + 48;
    uint _1802 = uint(int(uint(_1800) >> uint(2)));
    uint _1804 = uint(int(uint(int(_1802)) >> uint(2)));
    int _1806 = int(_1802) & 3;
    float _1808 = (*spvDescriptorSet0.vp_c15)._m0[int(_1804)][_1806];
    int _1810 = int(_1802) + 1;
    uint _1812 = uint(int(uint(_1810) >> uint(2)));
    int _1814 = _1810 & 3;
    float _1816 = (*spvDescriptorSet0.vp_c15)._m0[int(_1812)][_1814];
    int _1818 = _1762 + 64;
    uint _1820 = uint(int(uint(_1818) >> uint(2)));
    uint _1822 = uint(int(uint(int(_1820)) >> uint(2)));
    int _1824 = int(_1820) & 3;
    float _1826 = (*spvDescriptorSet0.vp_c15)._m0[int(_1822)][_1824];
    int _1828 = int(_1820) + 1;
    uint _1830 = uint(int(uint(_1828) >> uint(2)));
    int _1832 = _1828 & 3;
    float _1834 = (*spvDescriptorSet0.vp_c15)._m0[int(_1830)][_1832];
    int _1836 = _1762 + 56;
    uint _1838 = uint(int(uint(_1836) >> uint(2)));
    uint _1840 = uint(int(uint(int(_1838)) >> uint(2)));
    int _1842 = int(_1838) & 3;
    float _1844 = (*spvDescriptorSet0.vp_c15)._m0[int(_1840)][_1842];
    int _1846 = int(_1838) + 1;
    uint _1848 = uint(int(uint(_1846) >> uint(2)));
    int _1850 = _1846 & 3;
    float _1852 = (*spvDescriptorSet0.vp_c15)._m0[int(_1848)][_1850];
    int _1854 = _1762 + 72;
    uint _1856 = uint(int(uint(_1854) >> uint(2)));
    uint _1858 = uint(int(uint(int(_1856)) >> uint(2)));
    int _1860 = int(_1856) & 3;
    float _1862 = (*spvDescriptorSet0.vp_c15)._m0[int(_1858)][_1860];
    int _1864 = int(_1856) + 1;
    uint _1866 = uint(int(uint(_1864) >> uint(2)));
    int _1868 = _1864 & 3;
    float _1870 = (*spvDescriptorSet0.vp_c15)._m0[int(_1866)][_1868];
    float _1872 = _1716 * _1780;
    float _1874 = fma(_1213, _1772, _1872);
    int _1876 = _1762 + 80;
    uint _1878 = uint(int(uint(_1876) >> uint(2)));
    uint _1880 = uint(int(uint(int(_1878)) >> uint(2)));
    int _1882 = int(_1878) & 3;
    float _1884 = (*spvDescriptorSet0.vp_c15)._m0[int(_1880)][_1882];
    int _1886 = int(_1878) + 1;
    uint _1888 = uint(int(uint(_1886) >> uint(2)));
    int _1890 = _1886 & 3;
    float _1892 = (*spvDescriptorSet0.vp_c15)._m0[int(_1888)][_1890];
    float _1894 = fma(_1217, _1790, _1874);
    float _1896 = _1894 + _1798;
    int _1898 = _1762 + 88;
    uint _1900 = uint(int(uint(_1898) >> uint(2)));
    uint _1902 = uint(int(uint(int(_1900)) >> uint(2)));
    int _1904 = int(_1900) & 3;
    float _1906 = (*spvDescriptorSet0.vp_c15)._m0[int(_1902)][_1904];
    int _1908 = int(_1900) + 1;
    uint _1910 = uint(int(uint(_1908) >> uint(2)));
    int _1912 = _1908 & 3;
    float _1914 = (*spvDescriptorSet0.vp_c15)._m0[int(_1910)][_1912];
    float _1916 = _1716 * _1816;
    float _1918 = 1.0 / _1896;
    float _1920 = fma(_1213, _1808, _1916);
    float _1922 = _1716 * _1834;
    float _1924 = fma(_1213, _1826, _1922);
    float _1926 = fma(_1217, _1844, _1920);
    float _1928 = _1926 + _1852;
    float _1930 = fma(_1217, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1932 = fma(_1217, _1862, _1924);
    float _1934 = _1928 * _1918;
    float _1936 = fma(_1213, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1938 = floor(_1930);
    float _1940 = _1932 + _1870;
    bool _1942 = _1934 >= 0.0;
    float _1944 = _1940 * _1918;
    bool _1946 = _1934 <= 1.0;
    bool _1948 = _1946 && _1942;
    float _1950 = floor(_1936);
    bool _1952 = _1944 >= 0.0;
    bool _1954 = _1952 && _1948;
    float _1956 = _1716 * _1892;
    int _1958 = _1700 >> 31;
    bool _1960 = _1944 <= 1.0;
    bool _1962 = _1960 && _1954;
    float _1964 = fma(_1213, _1884, _1956);
    int _1966 = _1958 & 3;
    float _1968 = -_1938;
    float _1970 = _1930 + _1968;
    bool _1972 = !_1692;
    int _1974 = _1972 ? 0 : (-1);
    float _1976 = fma(_1217, _1906, _1964);
    int _1978 = _1700 + _1966;
    float _1980 = in.m_62.w;
    float _1982 = _1976 + _1914;
    int _1984 = _1978 >> 2;
    int _1986 = _1700 & 3;
    bool _1988 = _1986 != 0;
    float _1990 = _1982 * _1918;
    float _1992 = _1956;
    if (_1962)
    {
        float _1994 = float(_1760);
        _1992 = _1994;
    }
    float _1996 = _1992;
    float _1998 = -_1950;
    float _2000 = _1936 + _1998;
    int _2002 = _1984 << 4;
    int _2004 = _2002 + 368;
    bool _2006 = _1986 != 3;
    float _2008 = _1996;
    if (_1962)
    {
        float _2010 = rint(_1996);
        float _2012 = precise::max(_2010, 0.0);
        uint _2014 = uint(_2012);
        uint _2016 = clamp(_2014, 0u, 65535u);
        _2008 = as_type<float>(_2016);
    }
    float _2018 = _2008;
    uint _2020 = uint(int(uint(_2004) >> uint(2)));
    uint _2022 = uint(int(uint(int(_2020)) >> uint(2)));
    int _2024 = int(_2020) & 3;
    float _2026 = (*spvDescriptorSet0.vp_c9)._m0[int(_2022)][_2024];
    int _2028 = int(_2020) + 1;
    uint _2030 = uint(int(uint(_2028) >> uint(2)));
    int _2032 = _2028 & 3;
    float _2034 = (*spvDescriptorSet0.vp_c9)._m0[int(_2030)][_2032];
    float2 _6270 = float2(_2000, _1970);
    float _2036 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6270, float2(0.0), isnan(_6270)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6270, float2(0.0), isnan(_6270)), level(0.0)).x;
    bool _2038 = uint(_1986) > 1u;
    int _2040 = _1704 ? 0 : 1;
    bool _2042 = uint(_1986) >= 2u;
    float _2044 = _1944;
    if (_1962)
    {
        float3 _6295 = float3(_1934, _1944, float(as_type<int>(_2018)));
        float3 _6299 = select(_6295, float3(0.0), isnan(_6295));
        float _2046 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6299.xy, uint(rint(_6299.z)), _1990, level(0.0));
        _2044 = _2046;
    }
    float _2048 = _2044;
    int _2050 = ~_1676;
    int _2052 = _2050 + _1974;
    int _2054 = _2052 + 1;
    float _2056 = -_717;
    float _2058 = _2056 + 1.0;
    int _2060 = _2004 + 8;
    uint _2062 = uint(int(uint(_2060) >> uint(2)));
    uint _2064 = uint(int(uint(int(_2062)) >> uint(2)));
    int _2066 = int(_2062) & 3;
    float _2068 = (*spvDescriptorSet0.vp_c9)._m0[int(_2064)][_2066];
    int _2070 = int(_2062) + 1;
    uint _2072 = uint(int(uint(_2070) >> uint(2)));
    int _2074 = _2070 & 3;
    float _2076 = (*spvDescriptorSet0.vp_c9)._m0[int(_2072)][_2074];
    int _2078 = _2042 ? 0 : 1;
    out.m_74.x = _353;
    out.m_74.y = _355;
    bool _2080 = _1980 > 0.5;
    int _2082 = _1417 * _2054;
    int _2084 = _2082 + _1588;
    int _2086 = ~_2078;
    int _2088 = _2086 + 1;
    int _2090 = _2088 + 1;
    int _2092 = _2090;
    bool _2094 = _2080;
    if (_1293)
    {
        float _2096 = _1335 * 6.283185482025146484375;
        float _2098 = cos(_2096);
        _1341 = _2098;
    }
    float _2100 = _1341;
    int _2102 = ~_2040;
    int _2104 = _2102 + 1;
    int _2106 = _2104 + 1;
    int _2108 = _2106;
    if (_2006)
    {
        int _2110 = ~_2078;
        int _2112 = _2110 + 1;
        _2092 = _2112;
    }
    int _2114 = _2092;
    if (!_2038)
    {
        int _2116 = ~_2040;
        int _2118 = _2116 + 1;
        _2108 = _2118;
    }
    int _2120 = _2108;
    float _2122 = _359 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _2124 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2126 = _2124 != 0;
    float _2128 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _2130 = _1986 != 3;
    bool _2132 = !_1988;
    int _2134 = _2132 ? 0 : 1;
    float _2136 = -_2128;
    float _2138 = fma(_2122, 2.0, _2136);
    int _2140 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2142 = _2140 != 0;
    float _2144 = in.m_68.x;
    int _2146 = abs(_2120);
    float _2148 = -_139;
    float _2150 = fma(_2148, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2138);
    float _2152 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _2154 = abs(_2114);
    bool _2156 = !_1427;
    int _2158 = _2156 ? _2084 : (-1);
    float _2160 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _2162 = abs(_2134);
    int _2164 = ~_2146;
    int _2166 = _2164 + 1;
    int _2168 = _2166 + 1;
    float _2170 = fma(_387, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2160);
    int _2172 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2174 = _2172 != 0;
    int _2176 = _2080 ? as_type<int>(_2058) : as_type<int>(_717);
    int _2178 = _2168 * as_type<int>(_2034);
    float _2180 = _2144;
    if (_2126)
    {
        bool _2182 = _359 > 0.5;
        _2094 = _2182;
    }
    bool _2184 = _2094;
    float _2186 = fma(_359, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2152);
    int _2188 = ~_2162;
    int _2190 = _2188 + 1;
    int _2192 = _2190 + 1;
    float _2194 = _387 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2196 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2186);
    float _2198 = _2174 ? as_type<float>(_2176) : _717;
    int _2200 = _2192 * as_type<int>(_2026);
    int _2202 = _2200 + _2178;
    bool _2204 = !_2130;
    int _2206 = _2204 ? 0 : (-1);
    float _2208 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2170);
    bool _2210 = _387 > 0.5;
    int _2212 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2214 = _2212 != 0;
    float _2216 = _387;
    bool _2218 = _2210;
    if (_2142)
    {
        float _2220 = in.m_62.z;
        _2216 = _2220;
    }
    float _2222 = _2216;
    int _2224 = ~_2154;
    int _2226 = _2224 + 1;
    int _2228 = _2226 + 1;
    bool _2230 = !_2214;
    int _2232 = _2230 ? 0 : 1;
    int _2234 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2236 = _2234 != 0;
    int _2238 = _2228 * as_type<int>(_2068);
    int _2240 = _2238 + _2202;
    float _2242 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2244 = int(_2242);
    int _2246 = abs(_2206);
    float _2248 = in.m_76.x;
    float _2250 = in.m_76.y;
    float _2252 = in.m_76.z;
    float _2254 = in.m_76.w;
    int _2256 = abs(_2232);
    float _2258 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _2260 = _2210 ? as_type<int>(_2058) : as_type<int>(_717);
    int _2262 = ~_2256;
    int _2264 = _2262 + 1;
    int _2266 = _2264 + 1;
    float _2268 = _2258 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2270 = ~_2246;
    int _2272 = _2270 + 1;
    int _2274 = _2272 + 1;
    int _2276 = _2274 * as_type<int>(_2076);
    int _2278 = _2276 + _2240;
    float _2280 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2282 = float(uint(_2244));
    float _2284 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _2286 = _2256;
    if (_2142)
    {
        bool _2288 = _2222 > 0.5;
        _2218 = _2288;
    }
    bool _2290 = _2218;
    int _2292 = _2278 * _2266;
    float _2294 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _2296 = abs(_2244);
    float _2298 = 1.0 / _2282;
    float _2300 = _2236 ? as_type<float>(_2260) : _717;
    float _2302 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2304 = float(uint(_2296));
    float _2306 = _2280 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2308 = _1151 != 0.0;
    bool _2310 = isnan(_1151);
    bool _2312 = _2308 || _2310;
    bool _2314 = isnan(0.0);
    bool _2316 = _2312 || _2314;
    float _2318 = _2284 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2320 = _2158 * _2256;
    int _2322 = _2320 + _2292;
    float _2324 = _2294 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2326 = _2302 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2328 = 1.0 / _2304;
    bool _2330 = _1145 == 0.0;
    bool _2332 = !_2316;
    bool _2334 = _2330 && _2332;
    if (_2142)
    {
        float _2336 = -_2144;
        float _2338 = _2336 + 1.0;
        _2286 = as_type<int>(_2338);
    }
    int _2340 = _2286;
    out.m_78.x = _2268;
    out.m_78.y = _2324;
    out.m_78.z = _2326;
    bool _2342 = _1127 == 0.02999999932944774627685546875;
    bool _2344 = _2342 && _2334;
    float _2346 = _305 * _2252;
    float _2348 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _2350 = as_type<int>(_2298) + (-2);
    float _2352 = fma(_279, _2248, _2346);
    int _2354 = abs(_2322);
    float _2356 = fma(_2194, -2.0, _2348);
    float _2358 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2360 = float(uint(_2354));
    float _2362 = _289 * _2252;
    float _2364 = _297 * _2252;
    int _2366 = as_type<int>(_2328) + (-2);
    float _2368 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2370 = fma(_271, _2248, _2362);
    float _2372 = float(uint(_2322));
    float _2374 = fma(_275, _2248, _2364);
    float _2376 = _2358 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2378 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2356);
    int _2380 = ~_2244;
    int _2382 = _2380 + 1;
    float _2384 = as_type<float>(_2350) * _2372;
    float _2386 = -_2250;
    float _2388 = fma(_321, _2386, _2374);
    float _2390 = -_2250;
    float _2392 = fma(_317, _2390, _2370);
    float _2394 = as_type<float>(_2366) * _2360;
    out.m_80.x = _2376;
    out.m_80.y = _2306;
    out.m_80.z = _2318;
    out.m_80.w = _2368;
    int _2396 = as_type<int>(_2360);
    float _2398 = _2368;
    float _2400 = _2388;
    if (_2126)
    {
        float _2402 = -_2144;
        float _2404 = _2402 + 1.0;
        _2396 = as_type<int>(_2404);
    }
    int _2406 = _2396;
    float _2408 = trunc(_2384);
    float _2410 = precise::max(_2408, 0.0);
    uint _2412 = uint(_2410);
    float _2414 = -_2250;
    float _2416 = fma(_327, _2414, _2352);
    float _2418 = in.m_82.x;
    float _2420 = in.m_82.y;
    float _2422 = in.m_82.z;
    out.m_84.x = _2388;
    out.m_84.y = _2392;
    out.m_84.z = _2416;
    float _2424 = trunc(_2394);
    float _2426 = precise::max(_2424, 0.0);
    uint _2428 = uint(_2426);
    if (!_2126)
    {
        _2398 = _2144;
    }
    float _2430 = _2398;
    float _2432 = _2430;
    if (_2126)
    {
        float _2434 = _2184 ? as_type<float>(_2406) : _2144;
        _2432 = _2434;
    }
    float _2436 = _2432;
    int _2438 = ~_2296;
    int _2440 = _2438 + 1;
    int _2442 = _2382 * int(_2412);
    int _2444 = _2442 + _2322;
    float _2446 = as_type<float>(_2444);
    if (_2142)
    {
        float _2448 = _2290 ? as_type<float>(_2340) : _2144;
        _2180 = _2448;
    }
    float _2450 = _2180;
    float _2452 = float(uint(_2444));
    float _2454 = _2450 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _2456 = _2440 * int(_2428);
    int _2458 = _2456 + _2354;
    float _2460 = _2452;
    if (_2344)
    {
        _2446 = _2420;
    }
    float _2462 = _2446;
    float _2464 = as_type<float>(_2350) * _2452;
    float _2466 = _2462;
    if (!_2344)
    {
        float _2468 = fma(_1151, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2420);
        _2466 = _2468;
    }
    float _2470 = _2466;
    float _2472 = _2252 * _2418;
    float _2474 = float(uint(_2458));
    float _2476 = _2250 * _2422;
    if (_2344)
    {
        _2460 = _2422;
    }
    float _2478 = _2460;
    float _2480 = trunc(_2464);
    float _2482 = precise::max(_2480, 0.0);
    uint _2484 = uint(_2482);
    float _2486 = _2478;
    if (!_2344)
    {
        float _2488 = fma(_1153, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2422);
        _2486 = _2488;
    }
    float _2490 = _2486;
    float _2492 = as_type<float>(_2366) * _2474;
    float _2494 = -_2472;
    float _2496 = fma(_2248, _2422, _2494);
    float _2498 = _2248 * _2420;
    float _2500 = -_2476;
    float _2502 = fma(_2252, _2420, _2500);
    if (_2344)
    {
        _2400 = _2418;
    }
    float _2504 = _2400;
    float _2506 = _2504;
    if (!_2344)
    {
        float _2508 = fma(_1145, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2418);
        _2506 = _2508;
    }
    float _2510 = _2506;
    float _2512 = trunc(_2492);
    float _2514 = precise::max(_2512, 0.0);
    uint _2516 = uint(_2514);
    float _2518 = -_2498;
    float _2520 = fma(_2250, _2418, _2518);
    float _2522 = _297 * _2490;
    float _2524 = _289 * _2490;
    float _2526 = _305 * _2490;
    float _2528 = _2496 * _2254;
    float _2530 = _2502 * _2254;
    float _2532 = _2520 * _2254;
    int _2534 = ~_2244;
    int _2536 = _2534 + 1;
    float _2538 = fma(_275, _2510, _2522);
    int _2540 = int(_2412) + int(_2484);
    float _2542 = fma(_271, _2510, _2524);
    float _2544 = fma(_279, _2510, _2526);
    int _2546 = ~_2296;
    int _2548 = _2546 + 1;
    float _2550 = _2532 * _297;
    float _2552 = _2532 * _305;
    int _2554 = int(_2428) + int(_2516);
    float _2556 = _2532 * _289;
    int _2558 = _2536 * _2540;
    int _2560 = _2558 + _2322;
    float _2562 = fma(_2530, _275, _2550);
    int _2564 = _2322 ^ _2244;
    int _2566 = _2548 * _2554;
    int _2568 = _2566 + _2354;
    float _2570 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2572 = uint(_2560) >= uint(_2244);
    float _2574 = fma(_2530, _271, _2556);
    uint _2576 = uint(int(uint(_2564) >> uint(31)));
    float _2578 = fma(_2530, _279, _2552);
    bool _2580 = uint(_2568) >= uint(_2296);
    float _2582 = -_2470;
    float _2584 = fma(_321, _2582, _2538);
    bool _2586 = !_2572;
    int _2588 = _2586 ? 0 : (-1);
    float _2590 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2592 = !_2580;
    int _2594 = _2592 ? 0 : (-1);
    float _2596 = -_2528;
    float _2598 = fma(_2596, _321, _2562);
    int _2600 = ~_2540;
    int _2602 = _2600 + _2588;
    int _2604 = _2602 + 1;
    if (_1293)
    {
        float _2606 = _2100 + (-1.0);
        _323 = _2606;
    }
    float _2608 = _323;
    int _2610 = ~_2594;
    int _2612 = _2554 + _2610;
    int _2614 = _2612 + 1;
    float _2616 = -_2470;
    float _2618 = fma(_327, _2616, _2544);
    int _2620 = ~int(_2576);
    int _2622 = _2620 + 1;
    int _2624 = _2244 * _2604;
    int _2626 = _2624 + _2322;
    bool _2628 = _2244 == 0;
    float _2630 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2632 = _2614 ^ _2622;
    float _2634 = _2570 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2636 = !_2628;
    int _2638 = _2636 ? _2626 : (-1);
    float _2640 = _2608;
    if (_1293)
    {
        float _2642 = _2608 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2640 = _2642;
    }
    float _2644 = _2640;
    bool _2646 = _2244 == 0;
    float _2648 = fma(_2634, _2436, -0.5);
    int _2650 = ~_2622;
    int _2652 = _2650 + _2632;
    int _2654 = _2652 + 1;
    float _2656 = _2584 * _1183;
    float _2658 = float(_2638);
    float _2660 = _2590 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _2662 = !_2646;
    int _2664 = _2662 ? _2654 : (-1);
    float _2666 = _2584 * _1165;
    float _2668 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2670 = fma(_2634, _2658, _2150);
    float _2672 = float(_2664);
    float _2674 = _2198 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    if (_1293)
    {
        float _2676 = fma(_1359, _2100, _2644);
        _1363 = _2676;
    }
    float _2678 = _1363;
    float _2680 = fma(_2196, _2648, _2670);
    float _2682 = fma(_2660, _2300, -0.5);
    float _2684 = -_2378;
    float _2686 = fma(_2660, _2672, _2684);
    float _2688 = -_2528;
    float _2690 = fma(_2688, _327, _2578);
    float _2692 = fma(_2618, _1183, _2666);
    float _2694 = -_2528;
    float _2696 = fma(_2694, _317, _2574);
    float _2698 = -_2470;
    float _2700 = fma(_317, _2698, _2542);
    float _2702 = _2674 * _2630;
    float _2704 = fma(_1407, 100.0, _2678);
    float _2706 = _1716 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2708 = _2680 + 0.5;
    float _2710 = _1716 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2712 = abs(_1742);
    float _2714 = log2(_2712);
    float _2716 = -_2656;
    float _2718 = fma(_2618, _1165, _2716);
    float _2720 = _1223 * _2692;
    float _2722 = _2704 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2724 = fma(_1213, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2706);
    float _2726 = _2704 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2728 = _1245 * _2692;
    float _2730 = fma(_1213, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2710);
    float _2732 = -_2720;
    float _2734 = fma(_1245, _2718, _2732);
    float _2736 = fma(_2208, _2682, _2686);
    float _2738 = _2704 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2740 = fma(_1217, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2724);
    float _2742 = fma(_1389, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2722);
    float _2744 = fma(_1389, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2726);
    float _2746 = fma(_1217, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2730);
    float _2748 = _2454 * _2668;
    float _2750 = _2736 + 0.5;
    float _2752 = fma(_1389, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2738);
    float _2754 = _2740 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _2756 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2742);
    float _2758 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2744);
    float _2760 = _2746 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _2762 = fma(_1223, _2718, _2728);
    float _2764 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2752);
    float _2766 = _2756 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2768 = in.m_64.z;
    float _2770 = _2704 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2772 = _2764 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2774 = _2766 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2776 = in.m_64.w;
    float _2778 = fma(_1389, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2770);
    float _2780 = _2758 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _2782 = _1742 <= 8000.0;
    bool _2784 = isnan(_1742);
    bool _2786 = _2782 || _2784;
    bool _2788 = isnan(8000.0);
    bool _2790 = _2786 || _2788;
    float _2792 = float(_2790);
    out.m_86.x = _2598;
    out.m_86.y = _2696;
    out.m_86.z = _2690;
    float _2794 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2778);
    out.m_88.x = _2708;
    out.m_88.y = _2750;
    out.m_88.z = _2748;
    out.m_88.w = _2702;
    float _2796 = _2794 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2798 = _2714 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2800 = _2766 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    out.m_74.z = _2768;
    float _2802 = trunc(_2754);
    int _2804 = int(_2802);
    float _2806 = _2766 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2808 = _2766 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2810 = fma(_2772, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2774);
    out.m_74.w = _2776;
    float _2812 = fma(_2772, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2806);
    float _2814 = fma(_2772, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2808);
    float _2816 = fma(_2772, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2800);
    float _2818 = trunc(_2760);
    int _2820 = int(_2818);
    float _2822 = fma(_2780, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2810);
    float _2824 = fma(_2780, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2812);
    float _2826 = fma(_2780, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2816);
    float _2828 = fma(_2780, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2814);
    float _2830 = fma(_2796, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2822);
    float _2832 = fma(_2796, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2824);
    float _2834 = fma(_2796, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2826);
    float _2836 = exp2(_2798);
    int _2838 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2840 = _2804 + _2838;
    int _2842 = _2840 + 1;
    float _2844 = fma(_2796, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2828);
    float _2846 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2848 = _2704 + _2846;
    bool _2850 = _2842 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _2852 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2854 = _1389 + _2852;
    out.gl_Position.x = _2830;
    out.gl_Position.y = _2832;
    out.gl_Position.z = _2844;
    out.gl_Position.w = _2834;
    int _2856 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2858 = _2820 + _2856;
    int _2860 = _2858 + 1;
    float _2862 = _2848 * _2848;
    int _2864 = _2842 | _2860;
    float _2866 = fma(_2854, _2854, _2862);
    float _2868 = fma(_2836, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2870 = precise::clamp(_2868, 0.0, 1.0);
    bool _2872 = _2864 < 0;
    bool _2874 = _2872 || _2850;
    float _2876 = fma(_2870, -2.0, 3.0);
    float _2878 = _2870 * _2870;
    bool _2880 = _2860 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2882 = _2880 || _2874;
    float _2884 = _2878 * _2876;
    float _2886 = -_2884;
    float _2888 = _2886 + 1.0;
    float _2890 = fma(_2888, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2884);
    float _2892 = _2832;
    float _2894 = _2844;
    float _2896 = _2760;
    float _2898 = _2754;
    float _2900 = _2834;
    if (_2882)
    {
        _2892 = 1.0;
    }
    float _2902 = _2892;
    float _2904 = _2792 * _2890;
    float _2906 = _2902;
    if (!_2882)
    {
        int _2908 = _2860 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2910 = _2908 + _2842;
        float _2912 = floor(_2760);
        int _2914 = _2910 << 2;
        uint _2916 = uint(int(uint(_2910) >> uint(2)));
        int _2918 = 12 & _2914;
        int _2920 = int(_2916) << 4;
        int _2922 = _2920 + _2918;
        float _2924 = floor(_2754);
        float _2926 = -_2912;
        float _2928 = _2760 + _2926;
        int _2930 = _2922 + 400;
        uint _2932 = uint(int(uint(_2930) >> uint(2)));
        uint _2934 = uint(int(uint(int(_2932)) >> uint(2)));
        int _2936 = int(_2932) & 3;
        float _2938 = (*spvDescriptorSet0.vp_c15)._m0[int(_2934)][_2936];
        float _2940 = -_2924;
        float _2942 = _2754 + _2940;
        float _2944 = rint(_2938);
        float _2946 = precise::max(_2944, 0.0);
        uint _2948 = uint(_2946);
        uint _2950 = clamp(_2948, 0u, 65535u);
        float3 _7781 = float3(_2942, _2928, float(int(_2950)));
        float3 _7783 = select(_7781, float3(0.0), isnan(_7781));
        float _2952 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _7783.xy, uint(rint(_7783.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _7783.xy, uint(rint(_7783.z)), level(0.0)).x;
        int _2954 = _2910 << 4;
        int _2956 = _2954 + 2048;
        uint _2958 = uint(int(uint(_2956) >> uint(2)));
        uint _2960 = uint(int(uint(int(_2958)) >> uint(2)));
        int _2962 = int(_2958) & 3;
        float _2964 = (*spvDescriptorSet0.vp_c15)._m0[int(_2960)][_2962];
        int _2966 = int(_2958) + 1;
        uint _2968 = uint(int(uint(_2966) >> uint(2)));
        int _2970 = _2966 & 3;
        float _2972 = (*spvDescriptorSet0.vp_c15)._m0[int(_2968)][_2970];
        int _2974 = _2956 + 8;
        uint _2976 = uint(int(uint(_2974) >> uint(2)));
        uint _2978 = uint(int(uint(int(_2976)) >> uint(2)));
        int _2980 = int(_2976) & 3;
        float _2982 = (*spvDescriptorSet0.vp_c15)._m0[int(_2978)][_2980];
        int _2984 = int(_2976) + 1;
        uint _2986 = uint(int(uint(_2984) >> uint(2)));
        int _2988 = _2984 & 3;
        float _2990 = (*spvDescriptorSet0.vp_c15)._m0[int(_2986)][_2988];
        float _2992 = _1716 * _2972;
        float _2994 = fma(_1213, _2964, _2992);
        float _2996 = fma(_1217, _2982, _2994);
        float _2998 = _2996 + _2990;
        float _3000 = precise::clamp(_2998, 0.0, 1.0);
        float _3002 = -_3000;
        float _3004 = _3002 + _2952;
        float _3006 = fma(_3004, 500.0, 1.5);
        float _3008 = exp2(_3006);
        float _3010 = 0.0 + _3008;
        float _3012 = precise::clamp(_3010, 0.0, 1.0);
        _2894 = _2938;
        _2906 = _3012;
        _1754 = _3008;
    }
    float _3014 = _2894;
    float _3016 = _2906;
    float _3018 = _1754;
    float _3020 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3022 = _1393 + _3020;
    float _3024 = _2904 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3026 = -_2036;
    float _3028 = _3026 + 1.0;
    float _3030 = _3014;
    float _3032 = _3018;
    if (!_1962)
    {
        _3030 = 1.0;
    }
    float _3034 = _3030;
    float _3036 = fma(_3022, _3022, _2866);
    float _3038 = _3034;
    if (_1962)
    {
        bool _3040 = _2048 >= _1990;
        bool _3042 = isnan(_2048);
        bool _3044 = _3040 || _3042;
        bool _3046 = isnan(_1990);
        bool _3048 = _3044 || _3046;
        float _3050 = float(_3048);
        _3038 = _3050;
    }
    float _3052 = _3038;
    float _3054 = _3028 * _3024;
    float _3056 = precise::clamp(_3054, 0.0, 1.0);
    out.m_90.x = _2762;
    out.m_90.y = _2700;
    out.m_90.z = _2734;
    float _3058 = _3052 * _3016;
    float _3060 = sqrt(_3036);
    float _3062 = -_3056;
    float _3064 = fma(_3062, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3066 = -_3058;
    float _3068 = fma(_3066, _3064, 1.0);
    float _3070 = precise::clamp(_3068, 0.0, 1.0);
    float _3072 = _3070 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_92.x = _3072;
    bool _3074 = _3060 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3076 = isnan(_3060);
    bool _3078 = _3074 || _3076;
    bool _3080 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3082 = _3078 || _3080;
    float _3084 = _3064;
    float _3086 = _3070;
    if (!_3082)
    {
        _3032 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3088 = _3032;
    float _3090 = _3088;
    float _3092 = _3088;
    if (!_3082)
    {
        _2896 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3094 = _2896;
    float _3096 = _3094;
    float _3098 = _3094;
    if (!_3082)
    {
        _2898 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3100 = _2898;
    float _3102 = _3100;
    float _3104 = _3100;
    if (!_3082)
    {
        _2900 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3106 = _2900;
    float _3108 = _3106;
    float _3110 = _3106;
    if (!_3082)
    {
        _3084 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3112 = _3084;
    float _3114 = _3112;
    float _3116 = _3112;
    if (!_3082)
    {
        _3086 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3118 = _3086;
    bool _3120 = !_3082;
    float _3122 = _3118;
    float _3124 = _3118;
    if (!_3120)
    {
        bool _3126 = _3060 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3128 = isnan(_3060);
        bool _3130 = _3126 || _3128;
        bool _3132 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3134 = _3130 || _3132;
        if (!_3134)
        {
            float _3136 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3138 = _3060 + _3136;
            float _3140 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3142 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3140;
            float _3144 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3146 = _3144 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3148 = 1.0 / _3142;
            float _3150 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3152 = _3150 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3154 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3156 = _3154 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3158 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3160 = _3158 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3162 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3164 = _3162 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3166 = _3138 * _3148;
            float _3168 = precise::clamp(_3166, 0.0, 1.0);
            float _3170 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3172 = _3170 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3174 = fma(_3168, _3146, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3176 = fma(_3168, _3172, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3178 = fma(_3168, _3152, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3180 = fma(_3168, _3156, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3182 = fma(_3168, _3160, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3184 = fma(_3168, _3164, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3098 = _3174;
            _3116 = _3182;
            _3092 = _3178;
            _3110 = _3180;
            _3104 = _3176;
            _3124 = _3184;
            _3186 = true;
        }
        else
        {
            bool _3188 = _3060 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3190 = isnan(_3060);
            bool _3192 = _3188 || _3190;
            bool _3194 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3196 = _3192 || _3194;
            if (!_3196)
            {
                _3090 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3198 = _3090;
            _3092 = _3198;
            if (!_3196)
            {
                _3096 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3200 = _3096;
            _3098 = _3200;
            if (!_3196)
            {
                _3102 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3202 = _3102;
            _3104 = _3202;
            if (!_3196)
            {
                _3108 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3204 = _3108;
            _3110 = _3204;
            if (!_3196)
            {
                _3114 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3206 = _3114;
            _3116 = _3206;
            if (!_3196)
            {
                _3122 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3208 = _3122;
            bool _3210 = !_3196;
            _3124 = _3208;
            if (!_3210)
            {
                bool _3212 = _3060 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3214 = isnan(_3060);
                bool _3216 = _3212 || _3214;
                bool _3218 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3220 = _3216 || _3218;
                if (!_3220)
                {
                    float _3222 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3224 = _3060 + _3222;
                    float _3226 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3228 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3226;
                    float _3230 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3232 = _3230 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3234 = 1.0 / _3228;
                    float _3236 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3238 = _3236 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3240 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3242 = _3240 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3244 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3246 = _3244 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3248 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3250 = _3248 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3252 = _3224 * _3234;
                    float _3254 = precise::clamp(_3252, 0.0, 1.0);
                    float _3256 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3258 = _3256 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3260 = fma(_3254, _3232, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3262 = fma(_3254, _3258, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3264 = fma(_3254, _3238, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3266 = fma(_3254, _3242, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3268 = fma(_3254, _3246, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3270 = fma(_3254, _3250, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3098 = _3260;
                    _3116 = _3268;
                    _3092 = _3264;
                    _3110 = _3266;
                    _3104 = _3262;
                    _3124 = _3270;
                    _3186 = true;
                }
                else
                {
                    _3098 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3116 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3092 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3110 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3104 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3124 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3186 = false;
    float _3272 = _3098;
    float _3274 = _3116;
    float _3276 = _3092;
    float _3278 = _3110;
    float _3280 = _3104;
    float _3282 = _3124;
    float _3284 = fma(_2700, -0.5, 0.5);
    float _3286 = precise::clamp(_3284, 0.0, 1.0);
    float _3288 = -_3272;
    float _3290 = _3288 + _3274;
    float _3292 = -_3276;
    float _3294 = _3292 + _3278;
    float _3296 = -_3280;
    float _3298 = _3296 + _3282;
    bool _3300 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3302 = fma(_3286, _3290, _3272);
    float _3304 = fma(_3286, _3294, _3276);
    float _3306 = fma(_3286, _3298, _3280);
    float _3308 = _3302 * 0.586610972881317138671875;
    out.m_52.x = 1.0;
    float _3310 = fma(_3304, 0.298911988735198974609375, _3308);
    float _3312 = fma(_3306, 0.114477999508380889892578125, _3310);
    out.m_94.x = 0.0;
    float _3314 = -_3312;
    float _3316 = _3304 + _3314;
    float _3318 = -_3312;
    float _3320 = _3302 + _3318;
    float _3322 = -_3312;
    float _3324 = _3306 + _3322;
    float _3326 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3328 = fma(_3316, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3312);
    float _3330 = fma(_3320, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3312);
    float _3332 = fma(_3324, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3312);
    out.m_92.w = _3326;
    out.m_96.x = _3328;
    out.m_96.y = _3330;
    out.m_96.z = _3332;
    if (!_3300)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3334 = -_2704;
    float _3336 = _3334 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3338 = -_1389;
    float _3340 = _3338 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3342 = -_1393;
    float _3344 = _3342 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3346 = _3336 * _3336;
    float _3348 = fma(_3340, _3340, _3346);
    float _3350 = fma(_3344, _3344, _3348);
    float _3352 = sqrt(_3350);
    float _3354 = rsqrt(_3350);
    float _3356 = -_3352;
    float _3358 = _3356 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3360 = _3358 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3362 = precise::clamp(_3360, 0.0, 1.0);
    float _3364 = _3340 * _3354;
    float _3366 = _3336 * _3354;
    float _3368 = abs(_3362);
    float _3370 = log2(_3368);
    float _3372 = _3344 * _3354;
    float _3374 = _3364 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3376 = _2700 * _3366;
    float _3378 = -_3366;
    float _3380 = -_3374;
    float _3382 = fma(_3378, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3380);
    float _3384 = fma(_2762, _3364, _3376);
    float _3386 = -_3372;
    float _3388 = fma(_3386, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3382);
    float _3390 = fma(_2734, _3372, _3384);
    float _3392 = precise::clamp(_3390, 0.0, 1.0);
    float _3394 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3396 = _3388 + _3394;
    float _3398 = _3370 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3400 = _3396 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3402 = precise::clamp(_3400, 0.0, 1.0);
    float _3404 = exp2(_3398);
    float _3406 = _3404 * _3402;
    float _3408 = _3392 * _3406;
    float _3410 = _3408 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3412 = _3408 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3414 = _3408 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_94.x = _3410;
    out.m_94.y = _3412;
    out.m_94.z = _3414;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3186 = false;
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
    if (!_119)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3471 = as_type<float>(_131);
        out.gl_Position.z = _3471;
    }
    if (!_119)
    {
        return out;
    }
    float _133 = in.m_54.w;
    float _135 = float(_115);
    float _137 = -_133;
    float _139 = _137 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _141 = _133 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _143 = isnan(_133);
    bool _145 = _141 || _143;
    bool _147 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _149 = _145 || _147;
    bool _151 = _139 >= _135;
    bool _153 = !_149;
    bool _155 = _151 || _153;
    if (_155)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _157 = _123;
    if (_155)
    {
        out.m_52.x = 0.0;
    }
    int _159 = 0;
    if (_155)
    {
        float _161 = _157 * 5.0;
        _159 = as_type<int>(_161);
    }
    int _163 = _159;
    if (_155)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3534 = as_type<float>(_163);
        out.gl_Position.z = _3534;
    }
    if (_155)
    {
        return out;
    }
    float _165 = in.m_56.x;
    float _167 = in.m_56.y;
    float _169 = in.m_56.z;
    float _171 = 1.0 / _135;
    float _173 = in.m_58.x;
    float _175 = in.m_58.y;
    float _177 = in.m_58.z;
    float _179 = in.m_60.x;
    float _181 = in.m_60.y;
    float _183 = in.m_60.z;
    float _185 = _139 * _171;
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
    float _219 = _167;
    float _221 = _195;
    float _223 = _205;
    float _225 = _199;
    if (_211)
    {
        float _227 = rsqrt(_195);
        _215 = _227;
    }
    float _229 = _215;
    if (!_211)
    {
        _217 = 0.0;
    }
    float _231 = _217;
    bool _233 = _209 > 0.0;
    float _235 = 0.0;
    float _237 = _209;
    float _239 = _231;
    if (!_211)
    {
        _235 = 0.0;
    }
    float _241 = _235;
    float _243 = _241;
    if (!_211)
    {
        _237 = 0.0;
    }
    float _245 = _237;
    float _247 = _201;
    float _249 = _245;
    if (_213)
    {
        float _251 = rsqrt(_199);
        _247 = _251;
    }
    float _253 = _247;
    float _255 = 0.0;
    if (!_213)
    {
        _255 = 0.0;
    }
    float _257 = _255;
    float _259 = 0.0;
    float _261 = _257;
    if (_233)
    {
        float _263 = rsqrt(_205);
        _259 = _263;
    }
    float _265 = _259;
    float _267 = _229;
    if (_211)
    {
        float _269 = _229 * _165;
        _239 = _269;
    }
    float _271 = _239;
    if (_211)
    {
        float _273 = _229 * _173;
        _243 = _273;
    }
    float _275 = _243;
    if (_211)
    {
        float _277 = _229 * _179;
        _249 = _277;
    }
    float _279 = _249;
    bool _281 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    if (!_213)
    {
        _267 = 0.0;
    }
    float _283 = _267;
    float _285 = _283;
    if (_213)
    {
        float _287 = _253 * _167;
        _261 = _287;
    }
    float _289 = _261;
    if (!_213)
    {
        _219 = 0.0;
    }
    float _291 = _219;
    float _293 = _291;
    if (_213)
    {
        float _295 = _253 * _175;
        _293 = _295;
    }
    float _297 = _293;
    if (!_233)
    {
        _221 = 0.0;
    }
    float _299 = _221;
    float _301 = _299;
    if (_213)
    {
        float _303 = _253 * _181;
        _285 = _303;
    }
    float _305 = _285;
    if (!_233)
    {
        _223 = 0.0;
    }
    float _307 = _223;
    float _309 = _307;
    if (!_233)
    {
        _225 = 0.0;
    }
    float _311 = _225;
    float _313 = _311;
    if (_233)
    {
        float _315 = _265 * _169;
        _301 = _315;
    }
    float _317 = _301;
    if (_233)
    {
        float _319 = _265 * _177;
        _309 = _319;
    }
    float _321 = _309;
    float _323 = _321;
    if (_233)
    {
        float _325 = _265 * _183;
        _313 = _325;
    }
    float _327 = _313;
    bool _329 = !_281;
    float _347;
    if (!_329)
    {
        float _331 = in.m_62.x;
        float _333 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _335 = _331 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _337 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[12].x, _139);
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
    float _357 = _139 * (*spvDescriptorSet0.vp_c9)._m0[193].y;
    float _359 = in.m_62.x;
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _363 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _361;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _367 = _351 + _365;
    float _369 = in.m_49.x;
    float _371 = in.m_49.y;
    float _373 = in.m_49.z;
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _377 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _375;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _381 = _379 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _385 = _351 + _383;
    float _387 = in.m_62.y;
    float _389 = 1.0 / _363;
    bool _391 = _351 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _393 = isnan(_351);
    bool _395 = _391 || _393;
    bool _397 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _399 = _395 || _397;
    float _401 = float(_399);
    float _403 = 1.0 / _377;
    float _405 = fma(_359, 6.283185482025146484375, _357);
    float _407 = abs(_353);
    float _409 = log2(_407);
    float _411 = fma((*spvDescriptorSet0.vp_c9)._m0[194].y, 0.01745329238474369049072265625, _405);
    float _413 = _181 * _371;
    float _415 = _411 * 0.15915493667125701904296875;
    float _417 = 1.0 / _381;
    float _419 = fma(_179, _369, _413);
    float _421 = _367 * _403;
    float _423 = _387 * 628.31854248046875;
    float _425 = fma(_353, 0.261799395084381103515625, -0.261799395084381103515625);
    float _427 = _409 * (*spvDescriptorSet0.vp_c9)._m0[193].z;
    float _429 = _411 * 0.60000002384185791015625;
    float _431 = _175 * _371;
    float _433 = exp2(_427);
    float _435 = _429 * 0.15915493667125701904296875;
    float _437 = _411 * 1.2999999523162841796875;
    float _439 = fma(_173, _369, _431);
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _443 = _351 + _441;
    float _445 = _437 * 0.15915493667125701904296875;
    float _447 = _411 + 0.52359879016876220703125;
    float _449 = _443 * _389;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _453 = _451 + (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _455 = _447 * 0.15915493667125701904296875;
    float _457 = _385 * _417;
    float _459 = fma(_411, 0.60000002384185791015625, 0.31415927410125732421875);
    float _461 = fma(_453, _359, (*spvDescriptorSet0.vp_c9)._m0[191].x);
    float _463 = _415 * 6.283185482025146484375;
    float _465 = sin(_463);
    float _467 = _459 * 0.15915493667125701904296875;
    float _469 = fma(_411, 1.2999999523162841796875, 0.680678427219390869140625);
    float _471 = fma(_139, _461, _423);
    float _473 = (*spvDescriptorSet0.vp_c9)._m0[193].w * 3.1415927410125732421875;
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _477 = _475 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _479 = _435 * 6.283185482025146484375;
    float _481 = sin(_479);
    float _483 = fma(_473, _433, _357);
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _487 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _485;
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _491 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _489;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _495 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _493;
    float _497 = in.m_66.x;
    float _499 = in.m_66.y;
    float _501 = in.m_66.z;
    float _503 = fma(_487, _421, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _505 = fma(_491, _421, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _507 = fma(_495, _421, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _509 = _471 + _425;
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _513 = _511 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _515 = _445 * 6.283185482025146484375;
    float _517 = sin(_515);
    float _519 = _469 * 0.15915493667125701904296875;
    float _521 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _523 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _521;
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _527 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _525;
    float _529 = fma(_481, 0.60000002384185791015625, _465);
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _531;
    bool _535 = _351 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _537 = isnan(_351);
    bool _539 = _535 || _537;
    bool _541 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _543 = _539 || _541;
    float _545 = float(_543);
    float _547 = fma(_523, _449, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _549 = _509 * 0.89999997615814208984375;
    float _551 = fma(_527, _449, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _553 = fma(_533, _449, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    bool _555 = _351 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _557 = isnan(_351);
    bool _559 = _555 || _557;
    bool _561 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _563 = _559 || _561;
    float _565 = float(_563);
    float _567 = -_545;
    float _569 = _567 + 1.0;
    float _571 = _549 * 0.15915493667125701904296875;
    float _573 = _509 * 1.10000002384185791015625;
    float _575 = _455 * 6.283185482025146484375;
    float _577 = sin(_575);
    float _579 = _565 * _569;
    float _581 = _509 * 0.699999988079071044921875;
    float _583 = -_565;
    float _585 = _583 + 1.0;
    float _587 = _573 * 0.15915493667125701904296875;
    bool _589 = _351 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _591 = isnan(_351);
    bool _593 = _589 || _591;
    bool _595 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _597 = _593 || _595;
    float _599 = float(_597);
    float _601 = _581 * 0.15915493667125701904296875;
    float _603 = _401 * _585;
    float _605 = _467 * 6.283185482025146484375;
    float _607 = sin(_605);
    float _609 = -_401;
    float _611 = _609 + 1.0;
    float _613 = _471 * 0.89999997615814208984375;
    float _615 = fma(_359, 6.283185482025146484375, _483);
    bool _617 = _497 > 0.0;
    float _619 = _599 * _611;
    float _621 = fma(_517, 0.300000011920928955078125, _529);
    float _623 = _615 * 0.60000002384185791015625;
    float _625 = _519 * 6.283185482025146484375;
    float _627 = sin(_625);
    bool _629 = _497 >= 0.0;
    bool _631 = isnan(_497);
    bool _633 = _629 || _631;
    bool _635 = isnan(0.0);
    bool _637 = _633 || _635;
    float _639 = _503 * _619;
    float _641 = _505 * _619;
    float _643 = _507 * _619;
    float _645 = fma(_513, _457, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _647 = fma(_477, _457, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    int _649 = _637 ? 0 : 1;
    float _651 = fma(_607, 0.60000002384185791015625, _577);
    float _653 = _613 * 0.15915493667125701904296875;
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _657 = _655 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _659 = _509 * 0.15915493667125701904296875;
    float _661 = -_599;
    float _663 = _661 + 1.0;
    float _665 = _587 * 6.283185482025146484375;
    float _667 = cos(_665);
    float _669 = fma(_657, _457, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _671 = _615 * 0.15915493667125701904296875;
    float _673 = fma(_627, 0.300000011920928955078125, _651);
    int _675 = ~_649;
    int _677 = _675 + 1;
    int _679 = _677 + 1;
    float _681 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[143].x, _639);
    float _683 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[143].z, _643);
    int _685 = _679;
    if (!_617)
    {
        int _687 = ~_649;
        int _689 = _687 + 1;
        _685 = _689;
    }
    int _691 = _685;
    float _693 = -_353;
    float _695 = _693 + 1.0;
    float _697 = _623 * 0.15915493667125701904296875;
    float _699 = _615 * 1.2999999523162841796875;
    float _701 = _671 * 6.283185482025146484375;
    float _703 = sin(_701);
    float _705 = _621 * _695;
    float _707 = -_355;
    float _709 = _707 + 1.0;
    float _711 = _699 * 0.15915493667125701904296875;
    float _713 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[143].y, _641);
    float _715 = fma(_645, _603, _681);
    float _717 = in.m_68.y;
    float _719 = _705 * 0.52359879016876220703125;
    float _721 = _697 * 6.283185482025146484375;
    float _723 = sin(_721);
    float _725 = fma(_647, _603, _713);
    float _727 = fma(_669, _603, _683);
    float _729 = abs(_673);
    float _731 = _709 * _729;
    float _733 = in.m_70.x;
    float _735 = in.m_70.y;
    float _737 = in.m_70.z;
    float _739 = _719 * 0.15915493667125701904296875;
    float _741 = fma(_547, _579, _715);
    float _743 = _731 * (-45.0);
    float _745 = _571 * 6.283185482025146484375;
    float _747 = sin(_745);
    float _749 = fma(_551, _579, _725);
    float _751 = float(_691);
    float _753 = _743 * 0.01745329238474369049072265625;
    float _755 = fma(_553, _579, _727);
    float _757 = _731 * (-20.0);
    float _759 = fma(_545, (*spvDescriptorSet0.vp_c9)._m0[146].y, _749);
    float _761 = _753 * 0.15915493667125701904296875;
    float _763 = _659 * 6.283185482025146484375;
    float _765 = sin(_763);
    float _767 = fma(_723, 0.60000002384185791015625, _703);
    float _769 = _751 * _757;
    float _771 = fma(_545, (*spvDescriptorSet0.vp_c9)._m0[146].x, _741);
    float _773 = fma(_545, (*spvDescriptorSet0.vp_c9)._m0[146].z, _755);
    float _775 = _471 * 0.15915493667125701904296875;
    float _777 = _769 * 0.01745329238474369049072265625;
    float _779 = _711 * 6.283185482025146484375;
    float _781 = sin(_779);
    float _783 = _747 * 0.89999997615814208984375;
    float _785 = _499 + (-0.0199999995529651641845703125);
    float _787 = _759 * _735;
    float _789 = _771 * _733;
    float _791 = _773 * _737;
    float _793 = _601 * 6.283185482025146484375;
    float _795 = cos(_793);
    float _797 = -_783;
    float _799 = fma(_765, -1.2000000476837158203125, _797);
    float _801 = fma(_717, 0.5, 0.5);
    float _803 = abs(_799);
    bool _805 = _803 > 0.001000000047497451305389404296875;
    bool _807 = isnan(_803);
    bool _809 = _805 || _807;
    bool _811 = isnan(0.001000000047497451305389404296875);
    bool _813 = _809 || _811;
    float _815 = _739 * 6.283185482025146484375;
    float _817 = sin(_815);
    float _819 = fma(_781, 0.300000011920928955078125, _767);
    float _821 = _777 * 0.15915493667125701904296875;
    float _823 = _801 * _819;
    float _825 = _739 * 6.283185482025146484375;
    float _827 = cos(_825);
    float _829 = _795 * 0.699999988079071044921875;
    float _831 = _823 * (*spvDescriptorSet0.vp_c9)._m0[193].x;
    float _833 = fma(_667, 1.10000002384185791015625, _829);
    float _835 = _831 * 0.01745329238474369049072265625;
    float _837 = _761 * 6.283185482025146484375;
    float _839 = sin(_837);
    float _841 = _817 * _497;
    float _843 = abs(_833);
    bool _845 = _843 != 0.0;
    bool _847 = isnan(_843);
    bool _849 = _845 || _847;
    bool _851 = isnan(0.0);
    bool _853 = _849 || _851;
    float _855 = _835 * 0.15915493667125701904296875;
    float _857 = _761 * 6.283185482025146484375;
    float _859 = cos(_857);
    float _861 = _827 * _497;
    float _863 = _813 ? _799 : 0.001000000047497451305389404296875;
    float _865 = -_841;
    float _867 = fma(_827, _501, _865);
    float _869 = fma(_817, _501, _861);
    float _871 = abs(_863);
    bool _873 = _871 == 0.0;
    bool _875 = !_853;
    bool _877 = _873 && _875;
    float _879 = _867 + 0.02999999932944774627685546875;
    float _881 = _821 * 6.283185482025146484375;
    float _883 = sin(_881);
    float _885 = fma(_751, -0.100000001490116119384765625, _869);
    int _887 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _889 = _887 != 0;
    int _891 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _893 = _891 != 0;
    int _895 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _897 = _895 != 0;
    float _899 = _839 * _879;
    float _901 = abs(_863);
    bool _903 = _901 == 0.0;
    float _905 = _821 * 6.283185482025146484375;
    float _907 = cos(_905);
    float _909 = _859 * _879;
    float _911 = -_899;
    float _913 = fma(_859, _785, _911);
    bool _915 = _233;
    int _917 = as_type<int>(_819);
    if (_877)
    {
        bool _919 = as_type<int>(_863) >= 0;
        _915 = _919;
    }
    bool _921 = _915;
    int _923 = _921 ? (-1) : 0;
    if (_877)
    {
        int _925 = _921 ? 0 : 1078530011;
        _917 = _925;
    }
    int _927 = _917;
    float _929 = _775 * 6.283185482025146484375;
    float _931 = cos(_929);
    float _933 = _913 * _883;
    int _935 = _927;
    if (_877)
    {
        int _937 = int(0x80000000) & as_type<int>(_833);
        int _939 = _927 | _937;
        _935 = _939;
    }
    int _941 = _935;
    float _943 = _653 * 6.283185482025146484375;
    float _945 = cos(_943);
    float _947 = _913 * _907;
    float _949 = -_933;
    float _951 = fma(_907, _885, _949);
    float _953 = _471 * 0.699999988079071044921875;
    float _955 = fma(_883, _885, _947);
    bool _957 = !_893;
    int _959 = _957 ? 0 : 1;
    float _961 = _855 * 6.283185482025146484375;
    float _963 = sin(_961);
    bool _965 = !_889;
    int _967 = _965 ? 0 : 1;
    bool _969 = !_897;
    int _971 = _969 ? 0 : 1;
    float _973 = _855 * 6.283185482025146484375;
    float _975 = cos(_973);
    bool _977 = !_853;
    bool _979 = _977 && _903;
    int _981 = _941;
    float _983 = as_type<float>(_941);
    if (!_979)
    {
        float _985 = abs(_833);
        bool _987 = _985 != as_type<float>(0x7f800000u /* inf */);
        bool _989 = isnan(_985);
        bool _991 = _987 || _989;
        bool _993 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _995 = _991 || _993;
        float _997 = abs(_863);
        bool _999 = _997 == as_type<float>(0x7f800000u /* inf */);
        float _1001 = abs(_863);
        bool _1003 = _1001 == as_type<float>(0x7f800000u /* inf */);
        bool _1005 = !_995;
        bool _1007 = _1003 && _1005;
        if (_1007)
        {
            bool _1009 = as_type<int>(_863) >= 0;
            _923 = _1009 ? (-1) : 0;
        }
        int _1011 = _923;
        if (_1007)
        {
            _981 = 1075235812;
        }
        int _1013 = _981;
        int _1015 = _1013;
        if (_1007)
        {
            int _1017 = ~_1011;
            int _1019 = (_1017 != 0) ? _1013 : 1061752795;
            _1015 = _1019;
        }
        int _1021 = _1015;
        float _1023 = as_type<float>(_1021);
        if (_1007)
        {
            int _1025 = int(0x80000000) & as_type<int>(_833);
            int _1027 = _1021 | _1025;
            _1023 = as_type<float>(_1027);
        }
        float _1029 = _1023;
        bool _1031 = !_995;
        bool _1033 = _1031 && _999;
        _983 = _1029;
        if (!_1033)
        {
            float _1035 = abs(_833);
            float _1037 = abs(_863);
            float _1039 = precise::max(_1035, _1037);
            float _1041 = abs(_833);
            float _1043 = abs(_863);
            float _1045 = precise::min(_1041, _1043);
            float _1047 = 1.0 / _1039;
            float _1049 = abs(_833);
            float _1051 = abs(_863);
            bool _1053 = _1049 > _1051;
            bool _1055 = as_type<int>(_863) >= 0;
            float _1057 = _1045 * _1047;
            float _1059 = abs(_833);
            float _1061 = abs(_863);
            float _1063 = _1059 + _1061;
            int _1065 = as_type<int>(_833) & int(0x80000000);
            float _1067 = _1057 * _1057;
            bool _1069 = _1063 > as_type<float>(0x7f800000u /* inf */);
            bool _1071 = isnan(_1063);
            bool _1073 = _1069 || _1071;
            bool _1075 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1077 = _1073 || _1075;
            float _1079 = _1067 + 11.33538818359375;
            float _1081 = fma(_1067, _1079, 28.84246826171875);
            float _1083 = fma(_1067, _1081, 19.6966705322265625);
            float _1085 = fma(_1067, -0.82336294651031494140625, -5.674867153167724609375);
            float _1087 = fma(_1067, _1085, -6.565555095672607421875);
            float _1089 = 1.0 / _1083;
            float _1091 = _1067 * _1087;
            float _1093 = _1057 * _1091;
            float _1095 = fma(_1093, _1089, _1057);
            float _1097 = _1095;
            _983 = _1063;
            if (_1053)
            {
                float _1099 = -_1095;
                float _1101 = _1099 + 1.57079637050628662109375;
                _1097 = _1101;
            }
            float _1103 = _1097;
            int _1105 = as_type<int>(_1103);
            if (!_1055)
            {
                float _1107 = -_1103;
                float _1109 = _1107 + 3.1415927410125732421875;
                _1105 = as_type<int>(_1109);
            }
            int _1111 = _1105;
            if (!_1077)
            {
                int _1113 = _1065 | _1111;
                _983 = as_type<float>(_1113);
            }
        }
    }
    float _1115 = _983;
    float _1117 = _955 + 0.0199999995529651641845703125;
    float _1119 = _953 * 0.15915493667125701904296875;
    float _1121 = fma(_751, 0.100000001490116119384765625, _951);
    float _1123 = in.m_62.z;
    float _1125 = _1117 * _963;
    float _1127 = fma(_839, _785, _909);
    float _1129 = _1117 * _975;
    float _1131 = _1119 * 6.283185482025146484375;
    float _1133 = sin(_1131);
    float _1135 = -_1125;
    float _1137 = fma(_1121, _975, _1135);
    float _1139 = _1115 + 1.57079637050628662109375;
    float _1141 = in.m_58.w;
    float _1143 = _787 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1145 = fma(_621, (*spvDescriptorSet0.vp_c9)._m0[194].x, _1137);
    float _1147 = _1139 * (-0.15915493667125701904296875);
    float _1149 = _791 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1151 = fma(_1121, _963, _1129);
    float _1153 = _1127 + (-0.02999999932944774627685546875);
    float _1155 = in.m_60.w;
    float _1157 = _789 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1159 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1145);
    float _1161 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1153);
    float _1163 = _1147 * 6.283185482025146484375;
    float _1165 = cos(_1163);
    float _1167 = _471 * 1.10000002384185791015625;
    float _1169 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1151);
    float _1171 = _1149 * _1161;
    float _1173 = _1157 * _1159;
    float _1175 = _1167 * 0.15915493667125701904296875;
    float _1177 = _1143 * _1169;
    float _1179 = _1171 * _297;
    float _1181 = _1147 * 6.283185482025146484375;
    float _1183 = sin(_1181);
    float _1185 = _1171 * _305;
    float _1187 = _1123 * 6.283185482025146484375;
    float _1189 = fma(_1173, _275, _1179);
    float _1191 = fma(_177, _373, _439);
    float _1193 = fma(_1173, _279, _1185);
    float _1195 = _1187 * 0.15915493667125701904296875;
    float _1197 = -_1177;
    float _1199 = fma(_1197, _321, _1189);
    float _1201 = _1175 * 6.283185482025146484375;
    float _1203 = sin(_1201);
    float _1205 = -_1177;
    float _1207 = fma(_1205, _327, _1193);
    float _1209 = fma(_183, _373, _419);
    float _1211 = _1199 * _1165;
    float _1213 = _1191 + _1141;
    float _1215 = fma(_931, 1.2000000476837158203125, _945);
    float _1217 = _1209 + _1155;
    float _1219 = in.m_72.y;
    float _1221 = _1195 * 6.283185482025146484375;
    float _1223 = sin(_1221);
    float _1225 = _1199 * _1183;
    float _1227 = fma(_1207, _1183, _1211);
    float _1229 = _185 * 3.3333332538604736328125;
    float _1231 = -_1225;
    float _1233 = fma(_1207, _1165, _1231);
    float _1235 = _1213 + _1227;
    float _1237 = -_1229;
    float _1239 = _1237 + 3.3333332538604736328125;
    float _1241 = precise::clamp(_1239, 0.0, 1.0);
    float _1243 = _1195 * 6.283185482025146484375;
    float _1245 = cos(_1243);
    float _1247 = _1133 + _1203;
    float _1249 = _1217 + _1233;
    float _1251 = fma(_1215, (*spvDescriptorSet0.vp_c9)._m0[191].z, _1235);
    float _1253 = fma(_1247, (*spvDescriptorSet0.vp_c9)._m0[191].z, _1249);
    float _1255 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1257 = _1251 + _1255;
    float _1259 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1261 = _1253 + _1259;
    float _1263 = _1223 * _1257;
    float _1265 = _371 + _1219;
    float _1267 = _1245 * _1257;
    float _1269 = -_1263;
    float _1271 = fma(_1245, _1261, _1269);
    float _1273 = fma(_1223, _1261, _1267);
    float _1275 = _1271 + (*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1277 = _1273 + (*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1279 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1281 = _1275 + _1279;
    float _1283 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1285 = _1277 + _1283;
    float _1287 = _1281 * _1281;
    float _1289 = fma(_1285, _1285, _1287);
    float _1291 = sqrt(_1289);
    bool _1293 = _1291 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1295 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1297 = _1291 + _1295;
    float _1299 = 0.0 + _1229;
    float _1301 = precise::clamp(_1299, 0.0, 1.0);
    float _1303 = precise::min(_1301, _1241);
    float _1305 = _1147;
    float _1307 = _1219;
    float _1309 = _1275;
    if (_1293)
    {
        float _1311 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1305 = _1311;
    }
    float _1313 = _1305;
    float _1315 = -(*spvDescriptorSet0.vp_c9)._m0[192].w;
    float _1317 = _1315 + 1.0;
    if (_1293)
    {
        float _1319 = rsqrt(_1289);
        _1307 = _1319;
    }
    float _1321 = _1307;
    float _1323 = _1313;
    if (_1293)
    {
        float _1325 = _1297 * _1313;
        _1323 = _1325;
    }
    float _1327 = _1323;
    float _1329 = _1171 * _289;
    float _1331 = _1327;
    if (_1293)
    {
        float _1333 = _1327 * 0.15915493667125701904296875;
        _1331 = _1333;
    }
    float _1335 = _1331;
    float _1337 = fma(_1173, _271, _1329);
    float _1339 = _1229;
    float _1341 = _1335;
    if (_1293)
    {
        float _1343 = _1335 * 6.283185482025146484375;
        float _1345 = sin(_1343);
        _1339 = _1345;
    }
    float _1347 = _1339;
    float _1349 = -_1177;
    float _1351 = fma(_1349, _317, _1337);
    float _1353 = fma(_1303, -5.0, 5.0);
    float _1355 = _1265 + _1351;
    float _1357 = -_1353;
    float _1359 = fma(_1357, _1317, _1355);
    float _1361 = _1355;
    float _1363 = _1359;
    if (_1293)
    {
        float _1365 = _1359 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1361 = _1365;
    }
    float _1367 = _1361;
    float _1369 = _1367;
    float _1371 = _1347;
    if (_1293)
    {
        float _1373 = fma(_1347, _1367, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1369 = _1373;
    }
    float _1375 = _1369;
    float _1377 = _1375;
    if (!_1293)
    {
        _1371 = _1277;
    }
    float _1379 = _1371;
    float _1381 = _1379;
    if (_1293)
    {
        float _1383 = _1321 * _1375;
        _1377 = _1383;
    }
    float _1385 = _1377;
    if (_1293)
    {
        float _1387 = fma(_1285, _1385, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1381 = _1387;
    }
    float _1389 = _1381;
    if (_1293)
    {
        float _1391 = fma(_1281, _1385, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1309 = _1391;
    }
    float _1393 = _1309;
    float _1395 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1397 = _1389 + _1395;
    float _1399 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1401 = _1393 + _1399;
    float _1403 = fma(_1397, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1405 = fma(_1401, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _5330 = float2(_1403, _1405);
    float _1407 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_5330, float2(0.0), isnan(_5330)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_5330, float2(0.0), isnan(_5330)), level(0.0)).x;
    float _1409 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1411 = int(_1409);
    int _1413 = abs(_971);
    float _1415 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1417 = int(_1415);
    float _1419 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _1421 = float(_1411);
    float _1423 = 1.0 / _1421;
    float _1425 = float(uint(_1417));
    bool _1427 = _1417 == 0;
    float _1429 = 1.0 / _1425;
    float _1431 = _139 * _1423;
    float _1433 = trunc(_1431);
    int _1435 = int(_1433);
    int _1437 = as_type<int>(_1429) + (-2);
    float _1439 = float(uint(_1435));
    float _1441 = as_type<float>(_1437) * _1439;
    float _1443 = trunc(_1441);
    float _1445 = precise::max(_1443, 0.0);
    uint _1448 = uint(_1445);
    int _1450 = ~_1417;
    int _1452 = _1450 + 1;
    int _1454 = ~_1417;
    int _1456 = _1454 + 1;
    int _1458 = _1452 * int(_1448);
    int _1460 = _1458 + _1435;
    float _1462 = float(_1417);
    float _1464 = float(uint(_1460));
    float _1466 = as_type<float>(_1437) * _1464;
    int _1468 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1470 = _1468 != 0;
    float _1472 = trunc(_1466);
    float _1474 = precise::max(_1472, 0.0);
    uint _1476 = uint(_1474);
    bool _1478 = !_1470;
    float _1480 = _1478 ? 7.345489978790283203125 : 1.0;
    float _1482 = _1480 * _359;
    float _1484 = floor(_1482);
    int _1486 = int(_1448) + int(_1476);
    float _1488 = float(_1435);
    int _1490 = _1456 * _1486;
    int _1492 = _1490 + _1435;
    bool _1494 = _1488 >= _1462;
    bool _1496 = isnan(_1488);
    bool _1498 = _1494 || _1496;
    bool _1500 = isnan(_1462);
    bool _1502 = _1498 || _1500;
    float _1504 = float(_1502);
    bool _1506 = uint(_1492) >= uint(_1417);
    float _1508 = trunc(_1504);
    int _1510 = int(_1508);
    bool _1512 = !_1506;
    int _1514 = _1512 ? 0 : (-1);
    float _1516 = -_1484;
    float _1518 = _1482 + _1516;
    int _1520 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1522 = _1520 != 0;
    int _1524 = ~_1486;
    int _1526 = _1524 + _1514;
    int _1528 = _1526 + 1;
    float _1530 = _1518 * _1462;
    float _1532 = _139 * _1462;
    bool _1534 = !_1522;
    int _1536 = _1534 ? 0 : 1;
    int _1538 = _1417 * _1528;
    int _1540 = _1538 + _1435;
    float _1542 = _1532 * _171;
    float _1544 = trunc(_1530);
    int _1546 = int(_1544);
    int _1548 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1550 = _1548 != 0;
    int _1552 = ~_1510;
    int _1554 = _1552 + 1;
    int _1556 = _1554 + 1;
    bool _1558 = !_1427;
    int _1560 = _1558 ? _1540 : (-1);
    int _1562 = _1417 + (-1);
    float _1564 = trunc(_1542);
    int _1566 = int(_1564);
    int _1568 = abs(_959);
    int _1570 = _1560 * _1556;
    int _1572 = abs(_1536);
    int _1574 = abs(_967);
    int _1576 = _1510 * _1562;
    int _1578 = _1576 + _1570;
    bool _1580 = !_1550;
    int _1582 = _1580 ? 0 : 1;
    int _1584 = _1578 * _1568;
    int _1586 = _1546 * _1572;
    int _1588 = _1586 + _1435;
    int _1590 = abs(_1582);
    int _1592 = _1566 * _1574;
    int _1594 = _1592 + _1584;
    float _1596 = float(uint(_1588));
    int _1598 = _1588 * _1413;
    int _1600 = _1598 + _1594;
    int _1602 = ~_1417;
    int _1604 = _1602 + 1;
    float _1606 = as_type<float>(_1437) * _1596;
    int _1608 = _1546 * _1590;
    int _1610 = _1608 + _1600;
    int _1612 = ~_1417;
    int _1614 = _1612 + 1;
    float _1616 = trunc(_1606);
    float _1618 = precise::max(_1616, 0.0);
    uint _1620 = uint(_1618);
    float _1622 = float(uint(_1610));
    float _1624 = as_type<float>(_1437) * _1622;
    float _1626 = trunc(_1624);
    float _1628 = precise::max(_1626, 0.0);
    uint _1630 = uint(_1628);
    int _1632 = _1604 * int(_1630);
    int _1634 = _1632 + _1610;
    float _1636 = float(uint(_1634));
    float _1638 = as_type<float>(_1437) * _1636;
    int _1640 = _1614 * int(_1620);
    int _1642 = _1640 + _1588;
    float _1644 = trunc(_1638);
    float _1646 = precise::max(_1644, 0.0);
    uint _1648 = uint(_1646);
    float _1650 = float(uint(_1642));
    float _1652 = as_type<float>(_1437) * _1650;
    int _1654 = ~_1417;
    int _1656 = _1654 + 1;
    float _1658 = trunc(_1652);
    float _1660 = precise::max(_1658, 0.0);
    uint _1662 = uint(_1660);
    int _1664 = int(_1630) + int(_1648);
    int _1666 = ~_1417;
    int _1668 = _1666 + 1;
    int _1670 = _1656 * _1664;
    int _1672 = _1670 + _1610;
    bool _1674 = uint(_1672) >= uint(_1417);
    int _1676 = int(_1620) + int(_1662);
    bool _1678 = !_1674;
    int _1680 = _1678 ? 0 : (-1);
    int _1682 = _1668 * _1676;
    int _1684 = _1682 + _1588;
    int _1686 = ~_1664;
    int _1688 = _1686 + _1680;
    int _1690 = _1688 + 1;
    bool _1692 = uint(_1684) >= uint(_1417);
    int _1694 = _1417 * _1690;
    int _1696 = _1694 + _1610;
    bool _1698 = !_1427;
    int _1700 = _1698 ? _1696 : (-1);
    int _1702 = _1700 & 3;
    bool _1704 = _1702 != 0;
    float _1706 = fma(_1407, 100.0, _1265);
    float _1708 = _1706 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1710 = fma(_1213, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1708);
    float _1712 = fma(_1217, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1710);
    float _1714 = _1706 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1716 = _1706 + _1419;
    float _1718 = _1712 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1720 = fma(_1213, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1714);
    float _1722 = 1.0 / _1718;
    float _1724 = fma(_1217, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1720);
    float _1726 = _1724 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1728 = _1726 + _1718;
    float _1730 = _1728 * _1722;
    float _1732 = _1730 * 0.5;
    float _1734 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1736 = fma(_1732, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1734);
    float _1738 = 1.0 / _1736;
    float _1740 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1742 = _1738 * _1740;
    bool _1744 = _1742 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1746 = _1742 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1748 = !_1744;
    int _1750 = _1748 ? 0 : 1;
    int _1752 = 2;
    float _1754 = _1716;
    if (!_1744)
    {
        _1752 = 1;
    }
    int _1756 = _1752;
    int _1758 = _1756;
    if (!_1746)
    {
        _1758 = _1750;
    }
    int _1760 = _1758;
    int _1762 = _1760 << 6;
    int _1764 = _1762 + 96;
    uint _1766 = uint(int(uint(_1764) >> uint(2)));
    uint _1768 = uint(int(uint(int(_1766)) >> uint(2)));
    int _1770 = int(_1766) & 3;
    float _1772 = (*spvDescriptorSet0.vp_c15)._m0[int(_1768)][_1770];
    int _1774 = int(_1766) + 1;
    uint _1776 = uint(int(uint(_1774) >> uint(2)));
    int _1778 = _1774 & 3;
    float _1780 = (*spvDescriptorSet0.vp_c15)._m0[int(_1776)][_1778];
    int _1782 = _1762 + 104;
    uint _1784 = uint(int(uint(_1782) >> uint(2)));
    uint _1786 = uint(int(uint(int(_1784)) >> uint(2)));
    int _1788 = int(_1784) & 3;
    float _1790 = (*spvDescriptorSet0.vp_c15)._m0[int(_1786)][_1788];
    int _1792 = int(_1784) + 1;
    uint _1794 = uint(int(uint(_1792) >> uint(2)));
    int _1796 = _1792 & 3;
    float _1798 = (*spvDescriptorSet0.vp_c15)._m0[int(_1794)][_1796];
    int _1800 = _1762 + 48;
    uint _1802 = uint(int(uint(_1800) >> uint(2)));
    uint _1804 = uint(int(uint(int(_1802)) >> uint(2)));
    int _1806 = int(_1802) & 3;
    float _1808 = (*spvDescriptorSet0.vp_c15)._m0[int(_1804)][_1806];
    int _1810 = int(_1802) + 1;
    uint _1812 = uint(int(uint(_1810) >> uint(2)));
    int _1814 = _1810 & 3;
    float _1816 = (*spvDescriptorSet0.vp_c15)._m0[int(_1812)][_1814];
    int _1818 = _1762 + 64;
    uint _1820 = uint(int(uint(_1818) >> uint(2)));
    uint _1822 = uint(int(uint(int(_1820)) >> uint(2)));
    int _1824 = int(_1820) & 3;
    float _1826 = (*spvDescriptorSet0.vp_c15)._m0[int(_1822)][_1824];
    int _1828 = int(_1820) + 1;
    uint _1830 = uint(int(uint(_1828) >> uint(2)));
    int _1832 = _1828 & 3;
    float _1834 = (*spvDescriptorSet0.vp_c15)._m0[int(_1830)][_1832];
    int _1836 = _1762 + 56;
    uint _1838 = uint(int(uint(_1836) >> uint(2)));
    uint _1840 = uint(int(uint(int(_1838)) >> uint(2)));
    int _1842 = int(_1838) & 3;
    float _1844 = (*spvDescriptorSet0.vp_c15)._m0[int(_1840)][_1842];
    int _1846 = int(_1838) + 1;
    uint _1848 = uint(int(uint(_1846) >> uint(2)));
    int _1850 = _1846 & 3;
    float _1852 = (*spvDescriptorSet0.vp_c15)._m0[int(_1848)][_1850];
    int _1854 = _1762 + 72;
    uint _1856 = uint(int(uint(_1854) >> uint(2)));
    uint _1858 = uint(int(uint(int(_1856)) >> uint(2)));
    int _1860 = int(_1856) & 3;
    float _1862 = (*spvDescriptorSet0.vp_c15)._m0[int(_1858)][_1860];
    int _1864 = int(_1856) + 1;
    uint _1866 = uint(int(uint(_1864) >> uint(2)));
    int _1868 = _1864 & 3;
    float _1870 = (*spvDescriptorSet0.vp_c15)._m0[int(_1866)][_1868];
    float _1872 = _1716 * _1780;
    float _1874 = fma(_1213, _1772, _1872);
    int _1876 = _1762 + 80;
    uint _1878 = uint(int(uint(_1876) >> uint(2)));
    uint _1880 = uint(int(uint(int(_1878)) >> uint(2)));
    int _1882 = int(_1878) & 3;
    float _1884 = (*spvDescriptorSet0.vp_c15)._m0[int(_1880)][_1882];
    int _1886 = int(_1878) + 1;
    uint _1888 = uint(int(uint(_1886) >> uint(2)));
    int _1890 = _1886 & 3;
    float _1892 = (*spvDescriptorSet0.vp_c15)._m0[int(_1888)][_1890];
    float _1894 = fma(_1217, _1790, _1874);
    float _1896 = _1894 + _1798;
    int _1898 = _1762 + 88;
    uint _1900 = uint(int(uint(_1898) >> uint(2)));
    uint _1902 = uint(int(uint(int(_1900)) >> uint(2)));
    int _1904 = int(_1900) & 3;
    float _1906 = (*spvDescriptorSet0.vp_c15)._m0[int(_1902)][_1904];
    int _1908 = int(_1900) + 1;
    uint _1910 = uint(int(uint(_1908) >> uint(2)));
    int _1912 = _1908 & 3;
    float _1914 = (*spvDescriptorSet0.vp_c15)._m0[int(_1910)][_1912];
    float _1916 = _1716 * _1816;
    float _1918 = 1.0 / _1896;
    float _1920 = fma(_1213, _1808, _1916);
    float _1922 = _1716 * _1834;
    float _1924 = fma(_1213, _1826, _1922);
    float _1926 = fma(_1217, _1844, _1920);
    float _1928 = _1926 + _1852;
    float _1930 = fma(_1217, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1932 = fma(_1217, _1862, _1924);
    float _1934 = _1928 * _1918;
    float _1936 = fma(_1213, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1938 = floor(_1930);
    float _1940 = _1932 + _1870;
    bool _1942 = _1934 >= 0.0;
    float _1944 = _1940 * _1918;
    bool _1946 = _1934 <= 1.0;
    bool _1948 = _1946 && _1942;
    float _1950 = floor(_1936);
    bool _1952 = _1944 >= 0.0;
    bool _1954 = _1952 && _1948;
    float _1956 = _1716 * _1892;
    int _1958 = _1700 >> 31;
    bool _1960 = _1944 <= 1.0;
    bool _1962 = _1960 && _1954;
    float _1964 = fma(_1213, _1884, _1956);
    int _1966 = _1958 & 3;
    float _1968 = -_1938;
    float _1970 = _1930 + _1968;
    bool _1972 = !_1692;
    int _1974 = _1972 ? 0 : (-1);
    float _1976 = fma(_1217, _1906, _1964);
    int _1978 = _1700 + _1966;
    float _1980 = in.m_62.w;
    float _1982 = _1976 + _1914;
    int _1984 = _1978 >> 2;
    int _1986 = _1700 & 3;
    bool _1988 = _1986 != 0;
    float _1990 = _1982 * _1918;
    float _1992 = _1956;
    if (_1962)
    {
        float _1994 = float(_1760);
        _1992 = _1994;
    }
    float _1996 = _1992;
    float _1998 = -_1950;
    float _2000 = _1936 + _1998;
    int _2002 = _1984 << 4;
    int _2004 = _2002 + 368;
    bool _2006 = _1986 != 3;
    float _2008 = _1996;
    if (_1962)
    {
        float _2010 = rint(_1996);
        float _2012 = precise::max(_2010, 0.0);
        uint _2014 = uint(_2012);
        uint _2016 = clamp(_2014, 0u, 65535u);
        _2008 = as_type<float>(_2016);
    }
    float _2018 = _2008;
    uint _2020 = uint(int(uint(_2004) >> uint(2)));
    uint _2022 = uint(int(uint(int(_2020)) >> uint(2)));
    int _2024 = int(_2020) & 3;
    float _2026 = (*spvDescriptorSet0.vp_c9)._m0[int(_2022)][_2024];
    int _2028 = int(_2020) + 1;
    uint _2030 = uint(int(uint(_2028) >> uint(2)));
    int _2032 = _2028 & 3;
    float _2034 = (*spvDescriptorSet0.vp_c9)._m0[int(_2030)][_2032];
    float2 _6270 = float2(_2000, _1970);
    float _2036 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6270, float2(0.0), isnan(_6270)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6270, float2(0.0), isnan(_6270)), level(0.0)).x;
    bool _2038 = uint(_1986) > 1u;
    int _2040 = _1704 ? 0 : 1;
    bool _2042 = uint(_1986) >= 2u;
    float _2044 = _1944;
    if (_1962)
    {
        float3 _6295 = float3(_1934, _1944, float(as_type<int>(_2018)));
        float3 _6299 = select(_6295, float3(0.0), isnan(_6295));
        float _2046 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6299.xy, uint(rint(_6299.z)), _1990, level(0.0));
        _2044 = _2046;
    }
    float _2048 = _2044;
    int _2050 = ~_1676;
    int _2052 = _2050 + _1974;
    int _2054 = _2052 + 1;
    float _2056 = -_717;
    float _2058 = _2056 + 1.0;
    int _2060 = _2004 + 8;
    uint _2062 = uint(int(uint(_2060) >> uint(2)));
    uint _2064 = uint(int(uint(int(_2062)) >> uint(2)));
    int _2066 = int(_2062) & 3;
    float _2068 = (*spvDescriptorSet0.vp_c9)._m0[int(_2064)][_2066];
    int _2070 = int(_2062) + 1;
    uint _2072 = uint(int(uint(_2070) >> uint(2)));
    int _2074 = _2070 & 3;
    float _2076 = (*spvDescriptorSet0.vp_c9)._m0[int(_2072)][_2074];
    int _2078 = _2042 ? 0 : 1;
    out.m_74.x = _353;
    out.m_74.y = _355;
    bool _2080 = _1980 > 0.5;
    int _2082 = _1417 * _2054;
    int _2084 = _2082 + _1588;
    int _2086 = ~_2078;
    int _2088 = _2086 + 1;
    int _2090 = _2088 + 1;
    int _2092 = _2090;
    bool _2094 = _2080;
    if (_1293)
    {
        float _2096 = _1335 * 6.283185482025146484375;
        float _2098 = cos(_2096);
        _1341 = _2098;
    }
    float _2100 = _1341;
    int _2102 = ~_2040;
    int _2104 = _2102 + 1;
    int _2106 = _2104 + 1;
    int _2108 = _2106;
    if (_2006)
    {
        int _2110 = ~_2078;
        int _2112 = _2110 + 1;
        _2092 = _2112;
    }
    int _2114 = _2092;
    if (!_2038)
    {
        int _2116 = ~_2040;
        int _2118 = _2116 + 1;
        _2108 = _2118;
    }
    int _2120 = _2108;
    float _2122 = _359 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _2124 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2126 = _2124 != 0;
    float _2128 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _2130 = _1986 != 3;
    bool _2132 = !_1988;
    int _2134 = _2132 ? 0 : 1;
    float _2136 = -_2128;
    float _2138 = fma(_2122, 2.0, _2136);
    int _2140 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2142 = _2140 != 0;
    float _2144 = in.m_68.x;
    int _2146 = abs(_2120);
    float _2148 = -_139;
    float _2150 = fma(_2148, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2138);
    float _2152 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _2154 = abs(_2114);
    bool _2156 = !_1427;
    int _2158 = _2156 ? _2084 : (-1);
    float _2160 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _2162 = abs(_2134);
    int _2164 = ~_2146;
    int _2166 = _2164 + 1;
    int _2168 = _2166 + 1;
    float _2170 = fma(_387, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2160);
    int _2172 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2174 = _2172 != 0;
    int _2176 = _2080 ? as_type<int>(_2058) : as_type<int>(_717);
    int _2178 = _2168 * as_type<int>(_2034);
    float _2180 = _2144;
    if (_2126)
    {
        bool _2182 = _359 > 0.5;
        _2094 = _2182;
    }
    bool _2184 = _2094;
    float _2186 = fma(_359, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2152);
    int _2188 = ~_2162;
    int _2190 = _2188 + 1;
    int _2192 = _2190 + 1;
    float _2194 = _387 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2196 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2186);
    float _2198 = _2174 ? as_type<float>(_2176) : _717;
    int _2200 = _2192 * as_type<int>(_2026);
    int _2202 = _2200 + _2178;
    bool _2204 = !_2130;
    int _2206 = _2204 ? 0 : (-1);
    float _2208 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2170);
    bool _2210 = _387 > 0.5;
    int _2212 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2214 = _2212 != 0;
    float _2216 = _387;
    bool _2218 = _2210;
    if (_2142)
    {
        float _2220 = in.m_62.z;
        _2216 = _2220;
    }
    float _2222 = _2216;
    int _2224 = ~_2154;
    int _2226 = _2224 + 1;
    int _2228 = _2226 + 1;
    bool _2230 = !_2214;
    int _2232 = _2230 ? 0 : 1;
    int _2234 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2236 = _2234 != 0;
    int _2238 = _2228 * as_type<int>(_2068);
    int _2240 = _2238 + _2202;
    float _2242 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2244 = int(_2242);
    int _2246 = abs(_2206);
    float _2248 = in.m_76.x;
    float _2250 = in.m_76.y;
    float _2252 = in.m_76.z;
    float _2254 = in.m_76.w;
    int _2256 = abs(_2232);
    float _2258 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _2260 = _2210 ? as_type<int>(_2058) : as_type<int>(_717);
    int _2262 = ~_2256;
    int _2264 = _2262 + 1;
    int _2266 = _2264 + 1;
    float _2268 = _2258 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2270 = ~_2246;
    int _2272 = _2270 + 1;
    int _2274 = _2272 + 1;
    int _2276 = _2274 * as_type<int>(_2076);
    int _2278 = _2276 + _2240;
    float _2280 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2282 = float(uint(_2244));
    float _2284 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _2286 = _2256;
    if (_2142)
    {
        bool _2288 = _2222 > 0.5;
        _2218 = _2288;
    }
    bool _2290 = _2218;
    int _2292 = _2278 * _2266;
    float _2294 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _2296 = abs(_2244);
    float _2298 = 1.0 / _2282;
    float _2300 = _2236 ? as_type<float>(_2260) : _717;
    float _2302 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2304 = float(uint(_2296));
    float _2306 = _2280 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2308 = _1151 != 0.0;
    bool _2310 = isnan(_1151);
    bool _2312 = _2308 || _2310;
    bool _2314 = isnan(0.0);
    bool _2316 = _2312 || _2314;
    float _2318 = _2284 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2320 = _2158 * _2256;
    int _2322 = _2320 + _2292;
    float _2324 = _2294 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2326 = _2302 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2328 = 1.0 / _2304;
    bool _2330 = _1145 == 0.0;
    bool _2332 = !_2316;
    bool _2334 = _2330 && _2332;
    if (_2142)
    {
        float _2336 = -_2144;
        float _2338 = _2336 + 1.0;
        _2286 = as_type<int>(_2338);
    }
    int _2340 = _2286;
    out.m_78.x = _2268;
    out.m_78.y = _2324;
    out.m_78.z = _2326;
    bool _2342 = _1127 == 0.02999999932944774627685546875;
    bool _2344 = _2342 && _2334;
    float _2346 = _305 * _2252;
    float _2348 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _2350 = as_type<int>(_2298) + (-2);
    float _2352 = fma(_279, _2248, _2346);
    int _2354 = abs(_2322);
    float _2356 = fma(_2194, -2.0, _2348);
    float _2358 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2360 = float(uint(_2354));
    float _2362 = _289 * _2252;
    float _2364 = _297 * _2252;
    int _2366 = as_type<int>(_2328) + (-2);
    float _2368 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2370 = fma(_271, _2248, _2362);
    float _2372 = float(uint(_2322));
    float _2374 = fma(_275, _2248, _2364);
    float _2376 = _2358 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2378 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2356);
    int _2380 = ~_2244;
    int _2382 = _2380 + 1;
    float _2384 = as_type<float>(_2350) * _2372;
    float _2386 = -_2250;
    float _2388 = fma(_321, _2386, _2374);
    float _2390 = -_2250;
    float _2392 = fma(_317, _2390, _2370);
    float _2394 = as_type<float>(_2366) * _2360;
    out.m_80.x = _2376;
    out.m_80.y = _2306;
    out.m_80.z = _2318;
    out.m_80.w = _2368;
    int _2396 = as_type<int>(_2360);
    float _2398 = _2368;
    float _2400 = _2388;
    if (_2126)
    {
        float _2402 = -_2144;
        float _2404 = _2402 + 1.0;
        _2396 = as_type<int>(_2404);
    }
    int _2406 = _2396;
    float _2408 = trunc(_2384);
    float _2410 = precise::max(_2408, 0.0);
    uint _2412 = uint(_2410);
    float _2414 = -_2250;
    float _2416 = fma(_327, _2414, _2352);
    float _2418 = in.m_82.x;
    float _2420 = in.m_82.y;
    float _2422 = in.m_82.z;
    out.m_84.x = _2388;
    out.m_84.y = _2392;
    out.m_84.z = _2416;
    float _2424 = trunc(_2394);
    float _2426 = precise::max(_2424, 0.0);
    uint _2428 = uint(_2426);
    if (!_2126)
    {
        _2398 = _2144;
    }
    float _2430 = _2398;
    float _2432 = _2430;
    if (_2126)
    {
        float _2434 = _2184 ? as_type<float>(_2406) : _2144;
        _2432 = _2434;
    }
    float _2436 = _2432;
    int _2438 = ~_2296;
    int _2440 = _2438 + 1;
    int _2442 = _2382 * int(_2412);
    int _2444 = _2442 + _2322;
    float _2446 = as_type<float>(_2444);
    if (_2142)
    {
        float _2448 = _2290 ? as_type<float>(_2340) : _2144;
        _2180 = _2448;
    }
    float _2450 = _2180;
    float _2452 = float(uint(_2444));
    float _2454 = _2450 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _2456 = _2440 * int(_2428);
    int _2458 = _2456 + _2354;
    float _2460 = _2452;
    if (_2344)
    {
        _2446 = _2420;
    }
    float _2462 = _2446;
    float _2464 = as_type<float>(_2350) * _2452;
    float _2466 = _2462;
    if (!_2344)
    {
        float _2468 = fma(_1151, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2420);
        _2466 = _2468;
    }
    float _2470 = _2466;
    float _2472 = _2252 * _2418;
    float _2474 = float(uint(_2458));
    float _2476 = _2250 * _2422;
    if (_2344)
    {
        _2460 = _2422;
    }
    float _2478 = _2460;
    float _2480 = trunc(_2464);
    float _2482 = precise::max(_2480, 0.0);
    uint _2484 = uint(_2482);
    float _2486 = _2478;
    if (!_2344)
    {
        float _2488 = fma(_1153, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2422);
        _2486 = _2488;
    }
    float _2490 = _2486;
    float _2492 = as_type<float>(_2366) * _2474;
    float _2494 = -_2472;
    float _2496 = fma(_2248, _2422, _2494);
    float _2498 = _2248 * _2420;
    float _2500 = -_2476;
    float _2502 = fma(_2252, _2420, _2500);
    if (_2344)
    {
        _2400 = _2418;
    }
    float _2504 = _2400;
    float _2506 = _2504;
    if (!_2344)
    {
        float _2508 = fma(_1145, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2418);
        _2506 = _2508;
    }
    float _2510 = _2506;
    float _2512 = trunc(_2492);
    float _2514 = precise::max(_2512, 0.0);
    uint _2516 = uint(_2514);
    float _2518 = -_2498;
    float _2520 = fma(_2250, _2418, _2518);
    float _2522 = _297 * _2490;
    float _2524 = _289 * _2490;
    float _2526 = _305 * _2490;
    float _2528 = _2496 * _2254;
    float _2530 = _2502 * _2254;
    float _2532 = _2520 * _2254;
    int _2534 = ~_2244;
    int _2536 = _2534 + 1;
    float _2538 = fma(_275, _2510, _2522);
    int _2540 = int(_2412) + int(_2484);
    float _2542 = fma(_271, _2510, _2524);
    float _2544 = fma(_279, _2510, _2526);
    int _2546 = ~_2296;
    int _2548 = _2546 + 1;
    float _2550 = _2532 * _297;
    float _2552 = _2532 * _305;
    int _2554 = int(_2428) + int(_2516);
    float _2556 = _2532 * _289;
    int _2558 = _2536 * _2540;
    int _2560 = _2558 + _2322;
    float _2562 = fma(_2530, _275, _2550);
    int _2564 = _2322 ^ _2244;
    int _2566 = _2548 * _2554;
    int _2568 = _2566 + _2354;
    float _2570 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2572 = uint(_2560) >= uint(_2244);
    float _2574 = fma(_2530, _271, _2556);
    uint _2576 = uint(int(uint(_2564) >> uint(31)));
    float _2578 = fma(_2530, _279, _2552);
    bool _2580 = uint(_2568) >= uint(_2296);
    float _2582 = -_2470;
    float _2584 = fma(_321, _2582, _2538);
    bool _2586 = !_2572;
    int _2588 = _2586 ? 0 : (-1);
    float _2590 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2592 = !_2580;
    int _2594 = _2592 ? 0 : (-1);
    float _2596 = -_2528;
    float _2598 = fma(_2596, _321, _2562);
    int _2600 = ~_2540;
    int _2602 = _2600 + _2588;
    int _2604 = _2602 + 1;
    if (_1293)
    {
        float _2606 = _2100 + (-1.0);
        _323 = _2606;
    }
    float _2608 = _323;
    int _2610 = ~_2594;
    int _2612 = _2554 + _2610;
    int _2614 = _2612 + 1;
    float _2616 = -_2470;
    float _2618 = fma(_327, _2616, _2544);
    int _2620 = ~int(_2576);
    int _2622 = _2620 + 1;
    int _2624 = _2244 * _2604;
    int _2626 = _2624 + _2322;
    bool _2628 = _2244 == 0;
    float _2630 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2632 = _2614 ^ _2622;
    float _2634 = _2570 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2636 = !_2628;
    int _2638 = _2636 ? _2626 : (-1);
    float _2640 = _2608;
    if (_1293)
    {
        float _2642 = _2608 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2640 = _2642;
    }
    float _2644 = _2640;
    bool _2646 = _2244 == 0;
    float _2648 = fma(_2634, _2436, -0.5);
    int _2650 = ~_2622;
    int _2652 = _2650 + _2632;
    int _2654 = _2652 + 1;
    float _2656 = _2584 * _1183;
    float _2658 = float(_2638);
    float _2660 = _2590 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _2662 = !_2646;
    int _2664 = _2662 ? _2654 : (-1);
    float _2666 = _2584 * _1165;
    float _2668 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2670 = fma(_2634, _2658, _2150);
    float _2672 = float(_2664);
    float _2674 = _2198 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    if (_1293)
    {
        float _2676 = fma(_1359, _2100, _2644);
        _1363 = _2676;
    }
    float _2678 = _1363;
    float _2680 = fma(_2196, _2648, _2670);
    float _2682 = fma(_2660, _2300, -0.5);
    float _2684 = -_2378;
    float _2686 = fma(_2660, _2672, _2684);
    float _2688 = -_2528;
    float _2690 = fma(_2688, _327, _2578);
    float _2692 = fma(_2618, _1183, _2666);
    float _2694 = -_2528;
    float _2696 = fma(_2694, _317, _2574);
    float _2698 = -_2470;
    float _2700 = fma(_317, _2698, _2542);
    float _2702 = _2674 * _2630;
    float _2704 = fma(_1407, 100.0, _2678);
    float _2706 = _1716 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2708 = _2680 + 0.5;
    float _2710 = _1716 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2712 = abs(_1742);
    float _2714 = log2(_2712);
    float _2716 = -_2656;
    float _2718 = fma(_2618, _1165, _2716);
    float _2720 = _1223 * _2692;
    float _2722 = _2704 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2724 = fma(_1213, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2706);
    float _2726 = _2704 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2728 = _1245 * _2692;
    float _2730 = fma(_1213, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2710);
    float _2732 = -_2720;
    float _2734 = fma(_1245, _2718, _2732);
    float _2736 = fma(_2208, _2682, _2686);
    float _2738 = _2704 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2740 = fma(_1217, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2724);
    float _2742 = fma(_1389, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2722);
    float _2744 = fma(_1389, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2726);
    float _2746 = fma(_1217, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2730);
    float _2748 = _2454 * _2668;
    float _2750 = _2736 + 0.5;
    float _2752 = fma(_1389, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2738);
    float _2754 = _2740 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _2756 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2742);
    float _2758 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2744);
    float _2760 = _2746 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _2762 = fma(_1223, _2718, _2728);
    float _2764 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2752);
    float _2766 = _2756 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2768 = in.m_64.z;
    float _2770 = _2704 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2772 = _2764 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2774 = _2766 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2776 = in.m_64.w;
    float _2778 = fma(_1389, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2770);
    float _2780 = _2758 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _2782 = _1742 <= 8000.0;
    bool _2784 = isnan(_1742);
    bool _2786 = _2782 || _2784;
    bool _2788 = isnan(8000.0);
    bool _2790 = _2786 || _2788;
    float _2792 = float(_2790);
    out.m_86.x = _2598;
    out.m_86.y = _2696;
    out.m_86.z = _2690;
    float _2794 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2778);
    out.m_88.x = _2708;
    out.m_88.y = _2750;
    out.m_88.z = _2748;
    out.m_88.w = _2702;
    float _2796 = _2794 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2798 = _2714 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2800 = _2766 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    out.m_74.z = _2768;
    float _2802 = trunc(_2754);
    int _2804 = int(_2802);
    float _2806 = _2766 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2808 = _2766 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2810 = fma(_2772, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2774);
    out.m_74.w = _2776;
    float _2812 = fma(_2772, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2806);
    float _2814 = fma(_2772, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2808);
    float _2816 = fma(_2772, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2800);
    float _2818 = trunc(_2760);
    int _2820 = int(_2818);
    float _2822 = fma(_2780, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2810);
    float _2824 = fma(_2780, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2812);
    float _2826 = fma(_2780, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2816);
    float _2828 = fma(_2780, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2814);
    float _2830 = fma(_2796, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2822);
    float _2832 = fma(_2796, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2824);
    float _2834 = fma(_2796, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2826);
    float _2836 = exp2(_2798);
    int _2838 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2840 = _2804 + _2838;
    int _2842 = _2840 + 1;
    float _2844 = fma(_2796, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2828);
    float _2846 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2848 = _2704 + _2846;
    bool _2850 = _2842 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _2852 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2854 = _1389 + _2852;
    out.gl_Position.x = _2830;
    out.gl_Position.y = _2832;
    out.gl_Position.z = _2844;
    out.gl_Position.w = _2834;
    int _2856 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2858 = _2820 + _2856;
    int _2860 = _2858 + 1;
    float _2862 = _2848 * _2848;
    int _2864 = _2842 | _2860;
    float _2866 = fma(_2854, _2854, _2862);
    float _2868 = fma(_2836, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2870 = precise::clamp(_2868, 0.0, 1.0);
    bool _2872 = _2864 < 0;
    bool _2874 = _2872 || _2850;
    float _2876 = fma(_2870, -2.0, 3.0);
    float _2878 = _2870 * _2870;
    bool _2880 = _2860 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2882 = _2880 || _2874;
    float _2884 = _2878 * _2876;
    float _2886 = -_2884;
    float _2888 = _2886 + 1.0;
    float _2890 = fma(_2888, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2884);
    float _2892 = _2832;
    float _2894 = _2844;
    float _2896 = _2760;
    float _2898 = _2754;
    float _2900 = _2834;
    if (_2882)
    {
        _2892 = 1.0;
    }
    float _2902 = _2892;
    float _2904 = _2792 * _2890;
    float _2906 = _2902;
    if (!_2882)
    {
        int _2908 = _2860 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2910 = _2908 + _2842;
        float _2912 = floor(_2760);
        int _2914 = _2910 << 2;
        uint _2916 = uint(int(uint(_2910) >> uint(2)));
        int _2918 = 12 & _2914;
        int _2920 = int(_2916) << 4;
        int _2922 = _2920 + _2918;
        float _2924 = floor(_2754);
        float _2926 = -_2912;
        float _2928 = _2760 + _2926;
        int _2930 = _2922 + 400;
        uint _2932 = uint(int(uint(_2930) >> uint(2)));
        uint _2934 = uint(int(uint(int(_2932)) >> uint(2)));
        int _2936 = int(_2932) & 3;
        float _2938 = (*spvDescriptorSet0.vp_c15)._m0[int(_2934)][_2936];
        float _2940 = -_2924;
        float _2942 = _2754 + _2940;
        float _2944 = rint(_2938);
        float _2946 = precise::max(_2944, 0.0);
        uint _2948 = uint(_2946);
        uint _2950 = clamp(_2948, 0u, 65535u);
        float3 _7781 = float3(_2942, _2928, float(int(_2950)));
        float3 _7783 = select(_7781, float3(0.0), isnan(_7781));
        float _2952 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _7783.xy, uint(rint(_7783.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _7783.xy, uint(rint(_7783.z)), level(0.0)).x;
        int _2954 = _2910 << 4;
        int _2956 = _2954 + 2048;
        uint _2958 = uint(int(uint(_2956) >> uint(2)));
        uint _2960 = uint(int(uint(int(_2958)) >> uint(2)));
        int _2962 = int(_2958) & 3;
        float _2964 = (*spvDescriptorSet0.vp_c15)._m0[int(_2960)][_2962];
        int _2966 = int(_2958) + 1;
        uint _2968 = uint(int(uint(_2966) >> uint(2)));
        int _2970 = _2966 & 3;
        float _2972 = (*spvDescriptorSet0.vp_c15)._m0[int(_2968)][_2970];
        int _2974 = _2956 + 8;
        uint _2976 = uint(int(uint(_2974) >> uint(2)));
        uint _2978 = uint(int(uint(int(_2976)) >> uint(2)));
        int _2980 = int(_2976) & 3;
        float _2982 = (*spvDescriptorSet0.vp_c15)._m0[int(_2978)][_2980];
        int _2984 = int(_2976) + 1;
        uint _2986 = uint(int(uint(_2984) >> uint(2)));
        int _2988 = _2984 & 3;
        float _2990 = (*spvDescriptorSet0.vp_c15)._m0[int(_2986)][_2988];
        float _2992 = _1716 * _2972;
        float _2994 = fma(_1213, _2964, _2992);
        float _2996 = fma(_1217, _2982, _2994);
        float _2998 = _2996 + _2990;
        float _3000 = precise::clamp(_2998, 0.0, 1.0);
        float _3002 = -_3000;
        float _3004 = _3002 + _2952;
        float _3006 = fma(_3004, 500.0, 1.5);
        float _3008 = exp2(_3006);
        float _3010 = 0.0 + _3008;
        float _3012 = precise::clamp(_3010, 0.0, 1.0);
        _2894 = _2938;
        _2906 = _3012;
        _1754 = _3008;
    }
    float _3014 = _2894;
    float _3016 = _2906;
    float _3018 = _1754;
    float _3020 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3022 = _1393 + _3020;
    float _3024 = _2904 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3026 = -_2036;
    float _3028 = _3026 + 1.0;
    float _3030 = _3014;
    float _3032 = _3018;
    if (!_1962)
    {
        _3030 = 1.0;
    }
    float _3034 = _3030;
    float _3036 = fma(_3022, _3022, _2866);
    float _3038 = _3034;
    if (_1962)
    {
        bool _3040 = _2048 >= _1990;
        bool _3042 = isnan(_2048);
        bool _3044 = _3040 || _3042;
        bool _3046 = isnan(_1990);
        bool _3048 = _3044 || _3046;
        float _3050 = float(_3048);
        _3038 = _3050;
    }
    float _3052 = _3038;
    float _3054 = _3028 * _3024;
    float _3056 = precise::clamp(_3054, 0.0, 1.0);
    out.m_90.x = _2762;
    out.m_90.y = _2700;
    out.m_90.z = _2734;
    float _3058 = _3052 * _3016;
    float _3060 = sqrt(_3036);
    float _3062 = -_3056;
    float _3064 = fma(_3062, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3066 = -_3058;
    float _3068 = fma(_3066, _3064, 1.0);
    float _3070 = precise::clamp(_3068, 0.0, 1.0);
    float _3072 = _3070 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_92.x = _3072;
    bool _3074 = _3060 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3076 = isnan(_3060);
    bool _3078 = _3074 || _3076;
    bool _3080 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3082 = _3078 || _3080;
    float _3084 = _3064;
    float _3086 = _3070;
    if (!_3082)
    {
        _3032 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3088 = _3032;
    float _3090 = _3088;
    float _3092 = _3088;
    if (!_3082)
    {
        _2896 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3094 = _2896;
    float _3096 = _3094;
    float _3098 = _3094;
    if (!_3082)
    {
        _2898 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3100 = _2898;
    float _3102 = _3100;
    float _3104 = _3100;
    if (!_3082)
    {
        _2900 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3106 = _2900;
    float _3108 = _3106;
    float _3110 = _3106;
    if (!_3082)
    {
        _3084 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3112 = _3084;
    float _3114 = _3112;
    float _3116 = _3112;
    if (!_3082)
    {
        _3086 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3118 = _3086;
    bool _3120 = !_3082;
    float _3122 = _3118;
    float _3124 = _3118;
    if (!_3120)
    {
        bool _3126 = _3060 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3128 = isnan(_3060);
        bool _3130 = _3126 || _3128;
        bool _3132 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3134 = _3130 || _3132;
        if (!_3134)
        {
            float _3136 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3138 = _3060 + _3136;
            float _3140 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3142 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3140;
            float _3144 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3146 = _3144 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3148 = 1.0 / _3142;
            float _3150 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3152 = _3150 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3154 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3156 = _3154 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3158 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3160 = _3158 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3162 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3164 = _3162 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3166 = _3138 * _3148;
            float _3168 = precise::clamp(_3166, 0.0, 1.0);
            float _3170 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3172 = _3170 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3174 = fma(_3168, _3146, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3176 = fma(_3168, _3172, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3178 = fma(_3168, _3152, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3180 = fma(_3168, _3156, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3182 = fma(_3168, _3160, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3184 = fma(_3168, _3164, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3098 = _3174;
            _3116 = _3182;
            _3092 = _3178;
            _3110 = _3180;
            _3104 = _3176;
            _3124 = _3184;
            _3186 = true;
        }
        else
        {
            bool _3188 = _3060 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3190 = isnan(_3060);
            bool _3192 = _3188 || _3190;
            bool _3194 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3196 = _3192 || _3194;
            if (!_3196)
            {
                _3090 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3198 = _3090;
            _3092 = _3198;
            if (!_3196)
            {
                _3096 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3200 = _3096;
            _3098 = _3200;
            if (!_3196)
            {
                _3102 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3202 = _3102;
            _3104 = _3202;
            if (!_3196)
            {
                _3108 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3204 = _3108;
            _3110 = _3204;
            if (!_3196)
            {
                _3114 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3206 = _3114;
            _3116 = _3206;
            if (!_3196)
            {
                _3122 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3208 = _3122;
            bool _3210 = !_3196;
            _3124 = _3208;
            if (!_3210)
            {
                bool _3212 = _3060 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3214 = isnan(_3060);
                bool _3216 = _3212 || _3214;
                bool _3218 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3220 = _3216 || _3218;
                if (!_3220)
                {
                    float _3222 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3224 = _3060 + _3222;
                    float _3226 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3228 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3226;
                    float _3230 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3232 = _3230 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3234 = 1.0 / _3228;
                    float _3236 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3238 = _3236 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3240 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3242 = _3240 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3244 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3246 = _3244 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3248 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3250 = _3248 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3252 = _3224 * _3234;
                    float _3254 = precise::clamp(_3252, 0.0, 1.0);
                    float _3256 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3258 = _3256 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3260 = fma(_3254, _3232, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3262 = fma(_3254, _3258, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3264 = fma(_3254, _3238, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3266 = fma(_3254, _3242, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3268 = fma(_3254, _3246, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3270 = fma(_3254, _3250, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3098 = _3260;
                    _3116 = _3268;
                    _3092 = _3264;
                    _3110 = _3266;
                    _3104 = _3262;
                    _3124 = _3270;
                    _3186 = true;
                }
                else
                {
                    _3098 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3116 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3092 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3110 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3104 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3124 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3186 = false;
    float _3272 = _3098;
    float _3274 = _3116;
    float _3276 = _3092;
    float _3278 = _3110;
    float _3280 = _3104;
    float _3282 = _3124;
    float _3284 = fma(_2700, -0.5, 0.5);
    float _3286 = precise::clamp(_3284, 0.0, 1.0);
    float _3288 = -_3272;
    float _3290 = _3288 + _3274;
    float _3292 = -_3276;
    float _3294 = _3292 + _3278;
    float _3296 = -_3280;
    float _3298 = _3296 + _3282;
    bool _3300 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3302 = fma(_3286, _3290, _3272);
    float _3304 = fma(_3286, _3294, _3276);
    float _3306 = fma(_3286, _3298, _3280);
    float _3308 = _3302 * 0.586610972881317138671875;
    out.m_52.x = 1.0;
    float _3310 = fma(_3304, 0.298911988735198974609375, _3308);
    float _3312 = fma(_3306, 0.114477999508380889892578125, _3310);
    out.m_94.x = 0.0;
    float _3314 = -_3312;
    float _3316 = _3304 + _3314;
    float _3318 = -_3312;
    float _3320 = _3302 + _3318;
    float _3322 = -_3312;
    float _3324 = _3306 + _3322;
    float _3326 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3328 = fma(_3316, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3312);
    float _3330 = fma(_3320, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3312);
    float _3332 = fma(_3324, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3312);
    out.m_92.w = _3326;
    out.m_96.x = _3328;
    out.m_96.y = _3330;
    out.m_96.z = _3332;
    if (!_3300)
    {
        return out;
    }
    float _3334 = -_2704;
    float _3336 = _3334 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3338 = -_1389;
    float _3340 = _3338 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3342 = -_1393;
    float _3344 = _3342 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3346 = _3336 * _3336;
    float _3348 = fma(_3340, _3340, _3346);
    float _3350 = fma(_3344, _3344, _3348);
    float _3352 = sqrt(_3350);
    float _3354 = rsqrt(_3350);
    float _3356 = -_3352;
    float _3358 = _3356 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3360 = _3358 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3362 = precise::clamp(_3360, 0.0, 1.0);
    float _3364 = _3340 * _3354;
    float _3366 = _3336 * _3354;
    float _3368 = abs(_3362);
    float _3370 = log2(_3368);
    float _3372 = _3344 * _3354;
    float _3374 = _3364 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3376 = _2700 * _3366;
    float _3378 = -_3366;
    float _3380 = -_3374;
    float _3382 = fma(_3378, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3380);
    float _3384 = fma(_2762, _3364, _3376);
    float _3386 = -_3372;
    float _3388 = fma(_3386, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3382);
    float _3390 = fma(_2734, _3372, _3384);
    float _3392 = precise::clamp(_3390, 0.0, 1.0);
    float _3394 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3396 = _3388 + _3394;
    float _3398 = _3370 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3400 = _3396 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3402 = precise::clamp(_3400, 0.0, 1.0);
    float _3404 = exp2(_3398);
    float _3406 = _3404 * _3402;
    float _3408 = _3392 * _3406;
    float _3410 = _3408 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3412 = _3408 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3414 = _3408 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_94.x = _3410;
    out.m_94.y = _3412;
    out.m_94.z = _3414;
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
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3186 = false;
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
    if (!_119)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3471 = as_type<float>(_131);
        out.gl_Position.z = _3471;
    }
    if (!_119)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _133 = in.m_54.w;
    float _135 = float(_115);
    float _137 = -_133;
    float _139 = _137 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _141 = _133 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _143 = isnan(_133);
    bool _145 = _141 || _143;
    bool _147 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _149 = _145 || _147;
    bool _151 = _139 >= _135;
    bool _153 = !_149;
    bool _155 = _151 || _153;
    if (_155)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _157 = _123;
    if (_155)
    {
        out.m_52.x = 0.0;
    }
    int _159 = 0;
    if (_155)
    {
        float _161 = _157 * 5.0;
        _159 = as_type<int>(_161);
    }
    int _163 = _159;
    if (_155)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3534 = as_type<float>(_163);
        out.gl_Position.z = _3534;
    }
    if (_155)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _165 = in.m_56.x;
    float _167 = in.m_56.y;
    float _169 = in.m_56.z;
    float _171 = 1.0 / _135;
    float _173 = in.m_58.x;
    float _175 = in.m_58.y;
    float _177 = in.m_58.z;
    float _179 = in.m_60.x;
    float _181 = in.m_60.y;
    float _183 = in.m_60.z;
    float _185 = _139 * _171;
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
    float _219 = _167;
    float _221 = _195;
    float _223 = _205;
    float _225 = _199;
    if (_211)
    {
        float _227 = rsqrt(_195);
        _215 = _227;
    }
    float _229 = _215;
    if (!_211)
    {
        _217 = 0.0;
    }
    float _231 = _217;
    bool _233 = _209 > 0.0;
    float _235 = 0.0;
    float _237 = _209;
    float _239 = _231;
    if (!_211)
    {
        _235 = 0.0;
    }
    float _241 = _235;
    float _243 = _241;
    if (!_211)
    {
        _237 = 0.0;
    }
    float _245 = _237;
    float _247 = _201;
    float _249 = _245;
    if (_213)
    {
        float _251 = rsqrt(_199);
        _247 = _251;
    }
    float _253 = _247;
    float _255 = 0.0;
    if (!_213)
    {
        _255 = 0.0;
    }
    float _257 = _255;
    float _259 = 0.0;
    float _261 = _257;
    if (_233)
    {
        float _263 = rsqrt(_205);
        _259 = _263;
    }
    float _265 = _259;
    float _267 = _229;
    if (_211)
    {
        float _269 = _229 * _165;
        _239 = _269;
    }
    float _271 = _239;
    if (_211)
    {
        float _273 = _229 * _173;
        _243 = _273;
    }
    float _275 = _243;
    if (_211)
    {
        float _277 = _229 * _179;
        _249 = _277;
    }
    float _279 = _249;
    bool _281 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    if (!_213)
    {
        _267 = 0.0;
    }
    float _283 = _267;
    float _285 = _283;
    if (_213)
    {
        float _287 = _253 * _167;
        _261 = _287;
    }
    float _289 = _261;
    if (!_213)
    {
        _219 = 0.0;
    }
    float _291 = _219;
    float _293 = _291;
    if (_213)
    {
        float _295 = _253 * _175;
        _293 = _295;
    }
    float _297 = _293;
    if (!_233)
    {
        _221 = 0.0;
    }
    float _299 = _221;
    float _301 = _299;
    if (_213)
    {
        float _303 = _253 * _181;
        _285 = _303;
    }
    float _305 = _285;
    if (!_233)
    {
        _223 = 0.0;
    }
    float _307 = _223;
    float _309 = _307;
    if (!_233)
    {
        _225 = 0.0;
    }
    float _311 = _225;
    float _313 = _311;
    if (_233)
    {
        float _315 = _265 * _169;
        _301 = _315;
    }
    float _317 = _301;
    if (_233)
    {
        float _319 = _265 * _177;
        _309 = _319;
    }
    float _321 = _309;
    float _323 = _321;
    if (_233)
    {
        float _325 = _265 * _183;
        _313 = _325;
    }
    float _327 = _313;
    bool _329 = !_281;
    float _347;
    if (!_329)
    {
        float _331 = in.m_62.x;
        float _333 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _335 = _331 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _337 = fma(_335, (*spvDescriptorSet0.vp_c9)._m0[12].x, _139);
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
    float _357 = _139 * (*spvDescriptorSet0.vp_c9)._m0[193].y;
    float _359 = in.m_62.x;
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _363 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _361;
    float _365 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _367 = _351 + _365;
    float _369 = in.m_49.x;
    float _371 = in.m_49.y;
    float _373 = in.m_49.z;
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _377 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _375;
    float _379 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _381 = _379 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _385 = _351 + _383;
    float _387 = in.m_62.y;
    float _389 = 1.0 / _363;
    bool _391 = _351 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _393 = isnan(_351);
    bool _395 = _391 || _393;
    bool _397 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _399 = _395 || _397;
    float _401 = float(_399);
    float _403 = 1.0 / _377;
    float _405 = fma(_359, 6.283185482025146484375, _357);
    float _407 = abs(_353);
    float _409 = log2(_407);
    float _411 = fma((*spvDescriptorSet0.vp_c9)._m0[194].y, 0.01745329238474369049072265625, _405);
    float _413 = _181 * _371;
    float _415 = _411 * 0.15915493667125701904296875;
    float _417 = 1.0 / _381;
    float _419 = fma(_179, _369, _413);
    float _421 = _367 * _403;
    float _423 = _387 * 628.31854248046875;
    float _425 = fma(_353, 0.261799395084381103515625, -0.261799395084381103515625);
    float _427 = _409 * (*spvDescriptorSet0.vp_c9)._m0[193].z;
    float _429 = _411 * 0.60000002384185791015625;
    float _431 = _175 * _371;
    float _433 = exp2(_427);
    float _435 = _429 * 0.15915493667125701904296875;
    float _437 = _411 * 1.2999999523162841796875;
    float _439 = fma(_173, _369, _431);
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _443 = _351 + _441;
    float _445 = _437 * 0.15915493667125701904296875;
    float _447 = _411 + 0.52359879016876220703125;
    float _449 = _443 * _389;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _453 = _451 + (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _455 = _447 * 0.15915493667125701904296875;
    float _457 = _385 * _417;
    float _459 = fma(_411, 0.60000002384185791015625, 0.31415927410125732421875);
    float _461 = fma(_453, _359, (*spvDescriptorSet0.vp_c9)._m0[191].x);
    float _463 = _415 * 6.283185482025146484375;
    float _465 = sin(_463);
    float _467 = _459 * 0.15915493667125701904296875;
    float _469 = fma(_411, 1.2999999523162841796875, 0.680678427219390869140625);
    float _471 = fma(_139, _461, _423);
    float _473 = (*spvDescriptorSet0.vp_c9)._m0[193].w * 3.1415927410125732421875;
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _477 = _475 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _479 = _435 * 6.283185482025146484375;
    float _481 = sin(_479);
    float _483 = fma(_473, _433, _357);
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _487 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _485;
    float _489 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _491 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _489;
    float _493 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _495 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _493;
    float _497 = in.m_66.x;
    float _499 = in.m_66.y;
    float _501 = in.m_66.z;
    float _503 = fma(_487, _421, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _505 = fma(_491, _421, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _507 = fma(_495, _421, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _509 = _471 + _425;
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _513 = _511 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _515 = _445 * 6.283185482025146484375;
    float _517 = sin(_515);
    float _519 = _469 * 0.15915493667125701904296875;
    float _521 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _523 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _521;
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _527 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _525;
    float _529 = fma(_481, 0.60000002384185791015625, _465);
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _531;
    bool _535 = _351 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _537 = isnan(_351);
    bool _539 = _535 || _537;
    bool _541 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _543 = _539 || _541;
    float _545 = float(_543);
    float _547 = fma(_523, _449, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _549 = _509 * 0.89999997615814208984375;
    float _551 = fma(_527, _449, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _553 = fma(_533, _449, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    bool _555 = _351 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _557 = isnan(_351);
    bool _559 = _555 || _557;
    bool _561 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _563 = _559 || _561;
    float _565 = float(_563);
    float _567 = -_545;
    float _569 = _567 + 1.0;
    float _571 = _549 * 0.15915493667125701904296875;
    float _573 = _509 * 1.10000002384185791015625;
    float _575 = _455 * 6.283185482025146484375;
    float _577 = sin(_575);
    float _579 = _565 * _569;
    float _581 = _509 * 0.699999988079071044921875;
    float _583 = -_565;
    float _585 = _583 + 1.0;
    float _587 = _573 * 0.15915493667125701904296875;
    bool _589 = _351 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _591 = isnan(_351);
    bool _593 = _589 || _591;
    bool _595 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _597 = _593 || _595;
    float _599 = float(_597);
    float _601 = _581 * 0.15915493667125701904296875;
    float _603 = _401 * _585;
    float _605 = _467 * 6.283185482025146484375;
    float _607 = sin(_605);
    float _609 = -_401;
    float _611 = _609 + 1.0;
    float _613 = _471 * 0.89999997615814208984375;
    float _615 = fma(_359, 6.283185482025146484375, _483);
    bool _617 = _497 > 0.0;
    float _619 = _599 * _611;
    float _621 = fma(_517, 0.300000011920928955078125, _529);
    float _623 = _615 * 0.60000002384185791015625;
    float _625 = _519 * 6.283185482025146484375;
    float _627 = sin(_625);
    bool _629 = _497 >= 0.0;
    bool _631 = isnan(_497);
    bool _633 = _629 || _631;
    bool _635 = isnan(0.0);
    bool _637 = _633 || _635;
    float _639 = _503 * _619;
    float _641 = _505 * _619;
    float _643 = _507 * _619;
    float _645 = fma(_513, _457, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _647 = fma(_477, _457, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    int _649 = _637 ? 0 : 1;
    float _651 = fma(_607, 0.60000002384185791015625, _577);
    float _653 = _613 * 0.15915493667125701904296875;
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _657 = _655 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _659 = _509 * 0.15915493667125701904296875;
    float _661 = -_599;
    float _663 = _661 + 1.0;
    float _665 = _587 * 6.283185482025146484375;
    float _667 = cos(_665);
    float _669 = fma(_657, _457, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _671 = _615 * 0.15915493667125701904296875;
    float _673 = fma(_627, 0.300000011920928955078125, _651);
    int _675 = ~_649;
    int _677 = _675 + 1;
    int _679 = _677 + 1;
    float _681 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[143].x, _639);
    float _683 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[143].z, _643);
    int _685 = _679;
    if (!_617)
    {
        int _687 = ~_649;
        int _689 = _687 + 1;
        _685 = _689;
    }
    int _691 = _685;
    float _693 = -_353;
    float _695 = _693 + 1.0;
    float _697 = _623 * 0.15915493667125701904296875;
    float _699 = _615 * 1.2999999523162841796875;
    float _701 = _671 * 6.283185482025146484375;
    float _703 = sin(_701);
    float _705 = _621 * _695;
    float _707 = -_355;
    float _709 = _707 + 1.0;
    float _711 = _699 * 0.15915493667125701904296875;
    float _713 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[143].y, _641);
    float _715 = fma(_645, _603, _681);
    float _717 = in.m_68.y;
    float _719 = _705 * 0.52359879016876220703125;
    float _721 = _697 * 6.283185482025146484375;
    float _723 = sin(_721);
    float _725 = fma(_647, _603, _713);
    float _727 = fma(_669, _603, _683);
    float _729 = abs(_673);
    float _731 = _709 * _729;
    float _733 = in.m_70.x;
    float _735 = in.m_70.y;
    float _737 = in.m_70.z;
    float _739 = _719 * 0.15915493667125701904296875;
    float _741 = fma(_547, _579, _715);
    float _743 = _731 * (-45.0);
    float _745 = _571 * 6.283185482025146484375;
    float _747 = sin(_745);
    float _749 = fma(_551, _579, _725);
    float _751 = float(_691);
    float _753 = _743 * 0.01745329238474369049072265625;
    float _755 = fma(_553, _579, _727);
    float _757 = _731 * (-20.0);
    float _759 = fma(_545, (*spvDescriptorSet0.vp_c9)._m0[146].y, _749);
    float _761 = _753 * 0.15915493667125701904296875;
    float _763 = _659 * 6.283185482025146484375;
    float _765 = sin(_763);
    float _767 = fma(_723, 0.60000002384185791015625, _703);
    float _769 = _751 * _757;
    float _771 = fma(_545, (*spvDescriptorSet0.vp_c9)._m0[146].x, _741);
    float _773 = fma(_545, (*spvDescriptorSet0.vp_c9)._m0[146].z, _755);
    float _775 = _471 * 0.15915493667125701904296875;
    float _777 = _769 * 0.01745329238474369049072265625;
    float _779 = _711 * 6.283185482025146484375;
    float _781 = sin(_779);
    float _783 = _747 * 0.89999997615814208984375;
    float _785 = _499 + (-0.0199999995529651641845703125);
    float _787 = _759 * _735;
    float _789 = _771 * _733;
    float _791 = _773 * _737;
    float _793 = _601 * 6.283185482025146484375;
    float _795 = cos(_793);
    float _797 = -_783;
    float _799 = fma(_765, -1.2000000476837158203125, _797);
    float _801 = fma(_717, 0.5, 0.5);
    float _803 = abs(_799);
    bool _805 = _803 > 0.001000000047497451305389404296875;
    bool _807 = isnan(_803);
    bool _809 = _805 || _807;
    bool _811 = isnan(0.001000000047497451305389404296875);
    bool _813 = _809 || _811;
    float _815 = _739 * 6.283185482025146484375;
    float _817 = sin(_815);
    float _819 = fma(_781, 0.300000011920928955078125, _767);
    float _821 = _777 * 0.15915493667125701904296875;
    float _823 = _801 * _819;
    float _825 = _739 * 6.283185482025146484375;
    float _827 = cos(_825);
    float _829 = _795 * 0.699999988079071044921875;
    float _831 = _823 * (*spvDescriptorSet0.vp_c9)._m0[193].x;
    float _833 = fma(_667, 1.10000002384185791015625, _829);
    float _835 = _831 * 0.01745329238474369049072265625;
    float _837 = _761 * 6.283185482025146484375;
    float _839 = sin(_837);
    float _841 = _817 * _497;
    float _843 = abs(_833);
    bool _845 = _843 != 0.0;
    bool _847 = isnan(_843);
    bool _849 = _845 || _847;
    bool _851 = isnan(0.0);
    bool _853 = _849 || _851;
    float _855 = _835 * 0.15915493667125701904296875;
    float _857 = _761 * 6.283185482025146484375;
    float _859 = cos(_857);
    float _861 = _827 * _497;
    float _863 = _813 ? _799 : 0.001000000047497451305389404296875;
    float _865 = -_841;
    float _867 = fma(_827, _501, _865);
    float _869 = fma(_817, _501, _861);
    float _871 = abs(_863);
    bool _873 = _871 == 0.0;
    bool _875 = !_853;
    bool _877 = _873 && _875;
    float _879 = _867 + 0.02999999932944774627685546875;
    float _881 = _821 * 6.283185482025146484375;
    float _883 = sin(_881);
    float _885 = fma(_751, -0.100000001490116119384765625, _869);
    int _887 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _889 = _887 != 0;
    int _891 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _893 = _891 != 0;
    int _895 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _897 = _895 != 0;
    float _899 = _839 * _879;
    float _901 = abs(_863);
    bool _903 = _901 == 0.0;
    float _905 = _821 * 6.283185482025146484375;
    float _907 = cos(_905);
    float _909 = _859 * _879;
    float _911 = -_899;
    float _913 = fma(_859, _785, _911);
    bool _915 = _233;
    int _917 = as_type<int>(_819);
    if (_877)
    {
        bool _919 = as_type<int>(_863) >= 0;
        _915 = _919;
    }
    bool _921 = _915;
    int _923 = _921 ? (-1) : 0;
    if (_877)
    {
        int _925 = _921 ? 0 : 1078530011;
        _917 = _925;
    }
    int _927 = _917;
    float _929 = _775 * 6.283185482025146484375;
    float _931 = cos(_929);
    float _933 = _913 * _883;
    int _935 = _927;
    if (_877)
    {
        int _937 = int(0x80000000) & as_type<int>(_833);
        int _939 = _927 | _937;
        _935 = _939;
    }
    int _941 = _935;
    float _943 = _653 * 6.283185482025146484375;
    float _945 = cos(_943);
    float _947 = _913 * _907;
    float _949 = -_933;
    float _951 = fma(_907, _885, _949);
    float _953 = _471 * 0.699999988079071044921875;
    float _955 = fma(_883, _885, _947);
    bool _957 = !_893;
    int _959 = _957 ? 0 : 1;
    float _961 = _855 * 6.283185482025146484375;
    float _963 = sin(_961);
    bool _965 = !_889;
    int _967 = _965 ? 0 : 1;
    bool _969 = !_897;
    int _971 = _969 ? 0 : 1;
    float _973 = _855 * 6.283185482025146484375;
    float _975 = cos(_973);
    bool _977 = !_853;
    bool _979 = _977 && _903;
    int _981 = _941;
    float _983 = as_type<float>(_941);
    if (!_979)
    {
        float _985 = abs(_833);
        bool _987 = _985 != as_type<float>(0x7f800000u /* inf */);
        bool _989 = isnan(_985);
        bool _991 = _987 || _989;
        bool _993 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _995 = _991 || _993;
        float _997 = abs(_863);
        bool _999 = _997 == as_type<float>(0x7f800000u /* inf */);
        float _1001 = abs(_863);
        bool _1003 = _1001 == as_type<float>(0x7f800000u /* inf */);
        bool _1005 = !_995;
        bool _1007 = _1003 && _1005;
        if (_1007)
        {
            bool _1009 = as_type<int>(_863) >= 0;
            _923 = _1009 ? (-1) : 0;
        }
        int _1011 = _923;
        if (_1007)
        {
            _981 = 1075235812;
        }
        int _1013 = _981;
        int _1015 = _1013;
        if (_1007)
        {
            int _1017 = ~_1011;
            int _1019 = (_1017 != 0) ? _1013 : 1061752795;
            _1015 = _1019;
        }
        int _1021 = _1015;
        float _1023 = as_type<float>(_1021);
        if (_1007)
        {
            int _1025 = int(0x80000000) & as_type<int>(_833);
            int _1027 = _1021 | _1025;
            _1023 = as_type<float>(_1027);
        }
        float _1029 = _1023;
        bool _1031 = !_995;
        bool _1033 = _1031 && _999;
        _983 = _1029;
        if (!_1033)
        {
            float _1035 = abs(_833);
            float _1037 = abs(_863);
            float _1039 = precise::max(_1035, _1037);
            float _1041 = abs(_833);
            float _1043 = abs(_863);
            float _1045 = precise::min(_1041, _1043);
            float _1047 = 1.0 / _1039;
            float _1049 = abs(_833);
            float _1051 = abs(_863);
            bool _1053 = _1049 > _1051;
            bool _1055 = as_type<int>(_863) >= 0;
            float _1057 = _1045 * _1047;
            float _1059 = abs(_833);
            float _1061 = abs(_863);
            float _1063 = _1059 + _1061;
            int _1065 = as_type<int>(_833) & int(0x80000000);
            float _1067 = _1057 * _1057;
            bool _1069 = _1063 > as_type<float>(0x7f800000u /* inf */);
            bool _1071 = isnan(_1063);
            bool _1073 = _1069 || _1071;
            bool _1075 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1077 = _1073 || _1075;
            float _1079 = _1067 + 11.33538818359375;
            float _1081 = fma(_1067, _1079, 28.84246826171875);
            float _1083 = fma(_1067, _1081, 19.6966705322265625);
            float _1085 = fma(_1067, -0.82336294651031494140625, -5.674867153167724609375);
            float _1087 = fma(_1067, _1085, -6.565555095672607421875);
            float _1089 = 1.0 / _1083;
            float _1091 = _1067 * _1087;
            float _1093 = _1057 * _1091;
            float _1095 = fma(_1093, _1089, _1057);
            float _1097 = _1095;
            _983 = _1063;
            if (_1053)
            {
                float _1099 = -_1095;
                float _1101 = _1099 + 1.57079637050628662109375;
                _1097 = _1101;
            }
            float _1103 = _1097;
            int _1105 = as_type<int>(_1103);
            if (!_1055)
            {
                float _1107 = -_1103;
                float _1109 = _1107 + 3.1415927410125732421875;
                _1105 = as_type<int>(_1109);
            }
            int _1111 = _1105;
            if (!_1077)
            {
                int _1113 = _1065 | _1111;
                _983 = as_type<float>(_1113);
            }
        }
    }
    float _1115 = _983;
    float _1117 = _955 + 0.0199999995529651641845703125;
    float _1119 = _953 * 0.15915493667125701904296875;
    float _1121 = fma(_751, 0.100000001490116119384765625, _951);
    float _1123 = in.m_62.z;
    float _1125 = _1117 * _963;
    float _1127 = fma(_839, _785, _909);
    float _1129 = _1117 * _975;
    float _1131 = _1119 * 6.283185482025146484375;
    float _1133 = sin(_1131);
    float _1135 = -_1125;
    float _1137 = fma(_1121, _975, _1135);
    float _1139 = _1115 + 1.57079637050628662109375;
    float _1141 = in.m_58.w;
    float _1143 = _787 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1145 = fma(_621, (*spvDescriptorSet0.vp_c9)._m0[194].x, _1137);
    float _1147 = _1139 * (-0.15915493667125701904296875);
    float _1149 = _791 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1151 = fma(_1121, _963, _1129);
    float _1153 = _1127 + (-0.02999999932944774627685546875);
    float _1155 = in.m_60.w;
    float _1157 = _789 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1159 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1145);
    float _1161 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1153);
    float _1163 = _1147 * 6.283185482025146484375;
    float _1165 = cos(_1163);
    float _1167 = _471 * 1.10000002384185791015625;
    float _1169 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1151);
    float _1171 = _1149 * _1161;
    float _1173 = _1157 * _1159;
    float _1175 = _1167 * 0.15915493667125701904296875;
    float _1177 = _1143 * _1169;
    float _1179 = _1171 * _297;
    float _1181 = _1147 * 6.283185482025146484375;
    float _1183 = sin(_1181);
    float _1185 = _1171 * _305;
    float _1187 = _1123 * 6.283185482025146484375;
    float _1189 = fma(_1173, _275, _1179);
    float _1191 = fma(_177, _373, _439);
    float _1193 = fma(_1173, _279, _1185);
    float _1195 = _1187 * 0.15915493667125701904296875;
    float _1197 = -_1177;
    float _1199 = fma(_1197, _321, _1189);
    float _1201 = _1175 * 6.283185482025146484375;
    float _1203 = sin(_1201);
    float _1205 = -_1177;
    float _1207 = fma(_1205, _327, _1193);
    float _1209 = fma(_183, _373, _419);
    float _1211 = _1199 * _1165;
    float _1213 = _1191 + _1141;
    float _1215 = fma(_931, 1.2000000476837158203125, _945);
    float _1217 = _1209 + _1155;
    float _1219 = in.m_72.y;
    float _1221 = _1195 * 6.283185482025146484375;
    float _1223 = sin(_1221);
    float _1225 = _1199 * _1183;
    float _1227 = fma(_1207, _1183, _1211);
    float _1229 = _185 * 3.3333332538604736328125;
    float _1231 = -_1225;
    float _1233 = fma(_1207, _1165, _1231);
    float _1235 = _1213 + _1227;
    float _1237 = -_1229;
    float _1239 = _1237 + 3.3333332538604736328125;
    float _1241 = precise::clamp(_1239, 0.0, 1.0);
    float _1243 = _1195 * 6.283185482025146484375;
    float _1245 = cos(_1243);
    float _1247 = _1133 + _1203;
    float _1249 = _1217 + _1233;
    float _1251 = fma(_1215, (*spvDescriptorSet0.vp_c9)._m0[191].z, _1235);
    float _1253 = fma(_1247, (*spvDescriptorSet0.vp_c9)._m0[191].z, _1249);
    float _1255 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1257 = _1251 + _1255;
    float _1259 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1261 = _1253 + _1259;
    float _1263 = _1223 * _1257;
    float _1265 = _371 + _1219;
    float _1267 = _1245 * _1257;
    float _1269 = -_1263;
    float _1271 = fma(_1245, _1261, _1269);
    float _1273 = fma(_1223, _1261, _1267);
    float _1275 = _1271 + (*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1277 = _1273 + (*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1279 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1281 = _1275 + _1279;
    float _1283 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1285 = _1277 + _1283;
    float _1287 = _1281 * _1281;
    float _1289 = fma(_1285, _1285, _1287);
    float _1291 = sqrt(_1289);
    bool _1293 = _1291 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1295 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1297 = _1291 + _1295;
    float _1299 = 0.0 + _1229;
    float _1301 = precise::clamp(_1299, 0.0, 1.0);
    float _1303 = precise::min(_1301, _1241);
    float _1305 = _1147;
    float _1307 = _1219;
    float _1309 = _1275;
    if (_1293)
    {
        float _1311 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1305 = _1311;
    }
    float _1313 = _1305;
    float _1315 = -(*spvDescriptorSet0.vp_c9)._m0[192].w;
    float _1317 = _1315 + 1.0;
    if (_1293)
    {
        float _1319 = rsqrt(_1289);
        _1307 = _1319;
    }
    float _1321 = _1307;
    float _1323 = _1313;
    if (_1293)
    {
        float _1325 = _1297 * _1313;
        _1323 = _1325;
    }
    float _1327 = _1323;
    float _1329 = _1171 * _289;
    float _1331 = _1327;
    if (_1293)
    {
        float _1333 = _1327 * 0.15915493667125701904296875;
        _1331 = _1333;
    }
    float _1335 = _1331;
    float _1337 = fma(_1173, _271, _1329);
    float _1339 = _1229;
    float _1341 = _1335;
    if (_1293)
    {
        float _1343 = _1335 * 6.283185482025146484375;
        float _1345 = sin(_1343);
        _1339 = _1345;
    }
    float _1347 = _1339;
    float _1349 = -_1177;
    float _1351 = fma(_1349, _317, _1337);
    float _1353 = fma(_1303, -5.0, 5.0);
    float _1355 = _1265 + _1351;
    float _1357 = -_1353;
    float _1359 = fma(_1357, _1317, _1355);
    float _1361 = _1355;
    float _1363 = _1359;
    if (_1293)
    {
        float _1365 = _1359 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1361 = _1365;
    }
    float _1367 = _1361;
    float _1369 = _1367;
    float _1371 = _1347;
    if (_1293)
    {
        float _1373 = fma(_1347, _1367, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1369 = _1373;
    }
    float _1375 = _1369;
    float _1377 = _1375;
    if (!_1293)
    {
        _1371 = _1277;
    }
    float _1379 = _1371;
    float _1381 = _1379;
    if (_1293)
    {
        float _1383 = _1321 * _1375;
        _1377 = _1383;
    }
    float _1385 = _1377;
    if (_1293)
    {
        float _1387 = fma(_1285, _1385, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1381 = _1387;
    }
    float _1389 = _1381;
    if (_1293)
    {
        float _1391 = fma(_1281, _1385, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1309 = _1391;
    }
    float _1393 = _1309;
    float _1395 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1397 = _1389 + _1395;
    float _1399 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1401 = _1393 + _1399;
    float _1403 = fma(_1397, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1405 = fma(_1401, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _5330 = float2(_1403, _1405);
    float _1407 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_5330, float2(0.0), isnan(_5330)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_5330, float2(0.0), isnan(_5330)), level(0.0)).x;
    float _1409 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1411 = int(_1409);
    int _1413 = abs(_971);
    float _1415 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1417 = int(_1415);
    float _1419 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _1421 = float(_1411);
    float _1423 = 1.0 / _1421;
    float _1425 = float(uint(_1417));
    bool _1427 = _1417 == 0;
    float _1429 = 1.0 / _1425;
    float _1431 = _139 * _1423;
    float _1433 = trunc(_1431);
    int _1435 = int(_1433);
    int _1437 = as_type<int>(_1429) + (-2);
    float _1439 = float(uint(_1435));
    float _1441 = as_type<float>(_1437) * _1439;
    float _1443 = trunc(_1441);
    float _1445 = precise::max(_1443, 0.0);
    uint _1448 = uint(_1445);
    int _1450 = ~_1417;
    int _1452 = _1450 + 1;
    int _1454 = ~_1417;
    int _1456 = _1454 + 1;
    int _1458 = _1452 * int(_1448);
    int _1460 = _1458 + _1435;
    float _1462 = float(_1417);
    float _1464 = float(uint(_1460));
    float _1466 = as_type<float>(_1437) * _1464;
    int _1468 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1470 = _1468 != 0;
    float _1472 = trunc(_1466);
    float _1474 = precise::max(_1472, 0.0);
    uint _1476 = uint(_1474);
    bool _1478 = !_1470;
    float _1480 = _1478 ? 7.345489978790283203125 : 1.0;
    float _1482 = _1480 * _359;
    float _1484 = floor(_1482);
    int _1486 = int(_1448) + int(_1476);
    float _1488 = float(_1435);
    int _1490 = _1456 * _1486;
    int _1492 = _1490 + _1435;
    bool _1494 = _1488 >= _1462;
    bool _1496 = isnan(_1488);
    bool _1498 = _1494 || _1496;
    bool _1500 = isnan(_1462);
    bool _1502 = _1498 || _1500;
    float _1504 = float(_1502);
    bool _1506 = uint(_1492) >= uint(_1417);
    float _1508 = trunc(_1504);
    int _1510 = int(_1508);
    bool _1512 = !_1506;
    int _1514 = _1512 ? 0 : (-1);
    float _1516 = -_1484;
    float _1518 = _1482 + _1516;
    int _1520 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1522 = _1520 != 0;
    int _1524 = ~_1486;
    int _1526 = _1524 + _1514;
    int _1528 = _1526 + 1;
    float _1530 = _1518 * _1462;
    float _1532 = _139 * _1462;
    bool _1534 = !_1522;
    int _1536 = _1534 ? 0 : 1;
    int _1538 = _1417 * _1528;
    int _1540 = _1538 + _1435;
    float _1542 = _1532 * _171;
    float _1544 = trunc(_1530);
    int _1546 = int(_1544);
    int _1548 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1550 = _1548 != 0;
    int _1552 = ~_1510;
    int _1554 = _1552 + 1;
    int _1556 = _1554 + 1;
    bool _1558 = !_1427;
    int _1560 = _1558 ? _1540 : (-1);
    int _1562 = _1417 + (-1);
    float _1564 = trunc(_1542);
    int _1566 = int(_1564);
    int _1568 = abs(_959);
    int _1570 = _1560 * _1556;
    int _1572 = abs(_1536);
    int _1574 = abs(_967);
    int _1576 = _1510 * _1562;
    int _1578 = _1576 + _1570;
    bool _1580 = !_1550;
    int _1582 = _1580 ? 0 : 1;
    int _1584 = _1578 * _1568;
    int _1586 = _1546 * _1572;
    int _1588 = _1586 + _1435;
    int _1590 = abs(_1582);
    int _1592 = _1566 * _1574;
    int _1594 = _1592 + _1584;
    float _1596 = float(uint(_1588));
    int _1598 = _1588 * _1413;
    int _1600 = _1598 + _1594;
    int _1602 = ~_1417;
    int _1604 = _1602 + 1;
    float _1606 = as_type<float>(_1437) * _1596;
    int _1608 = _1546 * _1590;
    int _1610 = _1608 + _1600;
    int _1612 = ~_1417;
    int _1614 = _1612 + 1;
    float _1616 = trunc(_1606);
    float _1618 = precise::max(_1616, 0.0);
    uint _1620 = uint(_1618);
    float _1622 = float(uint(_1610));
    float _1624 = as_type<float>(_1437) * _1622;
    float _1626 = trunc(_1624);
    float _1628 = precise::max(_1626, 0.0);
    uint _1630 = uint(_1628);
    int _1632 = _1604 * int(_1630);
    int _1634 = _1632 + _1610;
    float _1636 = float(uint(_1634));
    float _1638 = as_type<float>(_1437) * _1636;
    int _1640 = _1614 * int(_1620);
    int _1642 = _1640 + _1588;
    float _1644 = trunc(_1638);
    float _1646 = precise::max(_1644, 0.0);
    uint _1648 = uint(_1646);
    float _1650 = float(uint(_1642));
    float _1652 = as_type<float>(_1437) * _1650;
    int _1654 = ~_1417;
    int _1656 = _1654 + 1;
    float _1658 = trunc(_1652);
    float _1660 = precise::max(_1658, 0.0);
    uint _1662 = uint(_1660);
    int _1664 = int(_1630) + int(_1648);
    int _1666 = ~_1417;
    int _1668 = _1666 + 1;
    int _1670 = _1656 * _1664;
    int _1672 = _1670 + _1610;
    bool _1674 = uint(_1672) >= uint(_1417);
    int _1676 = int(_1620) + int(_1662);
    bool _1678 = !_1674;
    int _1680 = _1678 ? 0 : (-1);
    int _1682 = _1668 * _1676;
    int _1684 = _1682 + _1588;
    int _1686 = ~_1664;
    int _1688 = _1686 + _1680;
    int _1690 = _1688 + 1;
    bool _1692 = uint(_1684) >= uint(_1417);
    int _1694 = _1417 * _1690;
    int _1696 = _1694 + _1610;
    bool _1698 = !_1427;
    int _1700 = _1698 ? _1696 : (-1);
    int _1702 = _1700 & 3;
    bool _1704 = _1702 != 0;
    float _1706 = fma(_1407, 100.0, _1265);
    float _1708 = _1706 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1710 = fma(_1213, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1708);
    float _1712 = fma(_1217, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1710);
    float _1714 = _1706 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1716 = _1706 + _1419;
    float _1718 = _1712 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1720 = fma(_1213, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1714);
    float _1722 = 1.0 / _1718;
    float _1724 = fma(_1217, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1720);
    float _1726 = _1724 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1728 = _1726 + _1718;
    float _1730 = _1728 * _1722;
    float _1732 = _1730 * 0.5;
    float _1734 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1736 = fma(_1732, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1734);
    float _1738 = 1.0 / _1736;
    float _1740 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1742 = _1738 * _1740;
    bool _1744 = _1742 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1746 = _1742 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1748 = !_1744;
    int _1750 = _1748 ? 0 : 1;
    int _1752 = 2;
    float _1754 = _1716;
    if (!_1744)
    {
        _1752 = 1;
    }
    int _1756 = _1752;
    int _1758 = _1756;
    if (!_1746)
    {
        _1758 = _1750;
    }
    int _1760 = _1758;
    int _1762 = _1760 << 6;
    int _1764 = _1762 + 96;
    uint _1766 = uint(int(uint(_1764) >> uint(2)));
    uint _1768 = uint(int(uint(int(_1766)) >> uint(2)));
    int _1770 = int(_1766) & 3;
    float _1772 = (*spvDescriptorSet0.vp_c15)._m0[int(_1768)][_1770];
    int _1774 = int(_1766) + 1;
    uint _1776 = uint(int(uint(_1774) >> uint(2)));
    int _1778 = _1774 & 3;
    float _1780 = (*spvDescriptorSet0.vp_c15)._m0[int(_1776)][_1778];
    int _1782 = _1762 + 104;
    uint _1784 = uint(int(uint(_1782) >> uint(2)));
    uint _1786 = uint(int(uint(int(_1784)) >> uint(2)));
    int _1788 = int(_1784) & 3;
    float _1790 = (*spvDescriptorSet0.vp_c15)._m0[int(_1786)][_1788];
    int _1792 = int(_1784) + 1;
    uint _1794 = uint(int(uint(_1792) >> uint(2)));
    int _1796 = _1792 & 3;
    float _1798 = (*spvDescriptorSet0.vp_c15)._m0[int(_1794)][_1796];
    int _1800 = _1762 + 48;
    uint _1802 = uint(int(uint(_1800) >> uint(2)));
    uint _1804 = uint(int(uint(int(_1802)) >> uint(2)));
    int _1806 = int(_1802) & 3;
    float _1808 = (*spvDescriptorSet0.vp_c15)._m0[int(_1804)][_1806];
    int _1810 = int(_1802) + 1;
    uint _1812 = uint(int(uint(_1810) >> uint(2)));
    int _1814 = _1810 & 3;
    float _1816 = (*spvDescriptorSet0.vp_c15)._m0[int(_1812)][_1814];
    int _1818 = _1762 + 64;
    uint _1820 = uint(int(uint(_1818) >> uint(2)));
    uint _1822 = uint(int(uint(int(_1820)) >> uint(2)));
    int _1824 = int(_1820) & 3;
    float _1826 = (*spvDescriptorSet0.vp_c15)._m0[int(_1822)][_1824];
    int _1828 = int(_1820) + 1;
    uint _1830 = uint(int(uint(_1828) >> uint(2)));
    int _1832 = _1828 & 3;
    float _1834 = (*spvDescriptorSet0.vp_c15)._m0[int(_1830)][_1832];
    int _1836 = _1762 + 56;
    uint _1838 = uint(int(uint(_1836) >> uint(2)));
    uint _1840 = uint(int(uint(int(_1838)) >> uint(2)));
    int _1842 = int(_1838) & 3;
    float _1844 = (*spvDescriptorSet0.vp_c15)._m0[int(_1840)][_1842];
    int _1846 = int(_1838) + 1;
    uint _1848 = uint(int(uint(_1846) >> uint(2)));
    int _1850 = _1846 & 3;
    float _1852 = (*spvDescriptorSet0.vp_c15)._m0[int(_1848)][_1850];
    int _1854 = _1762 + 72;
    uint _1856 = uint(int(uint(_1854) >> uint(2)));
    uint _1858 = uint(int(uint(int(_1856)) >> uint(2)));
    int _1860 = int(_1856) & 3;
    float _1862 = (*spvDescriptorSet0.vp_c15)._m0[int(_1858)][_1860];
    int _1864 = int(_1856) + 1;
    uint _1866 = uint(int(uint(_1864) >> uint(2)));
    int _1868 = _1864 & 3;
    float _1870 = (*spvDescriptorSet0.vp_c15)._m0[int(_1866)][_1868];
    float _1872 = _1716 * _1780;
    float _1874 = fma(_1213, _1772, _1872);
    int _1876 = _1762 + 80;
    uint _1878 = uint(int(uint(_1876) >> uint(2)));
    uint _1880 = uint(int(uint(int(_1878)) >> uint(2)));
    int _1882 = int(_1878) & 3;
    float _1884 = (*spvDescriptorSet0.vp_c15)._m0[int(_1880)][_1882];
    int _1886 = int(_1878) + 1;
    uint _1888 = uint(int(uint(_1886) >> uint(2)));
    int _1890 = _1886 & 3;
    float _1892 = (*spvDescriptorSet0.vp_c15)._m0[int(_1888)][_1890];
    float _1894 = fma(_1217, _1790, _1874);
    float _1896 = _1894 + _1798;
    int _1898 = _1762 + 88;
    uint _1900 = uint(int(uint(_1898) >> uint(2)));
    uint _1902 = uint(int(uint(int(_1900)) >> uint(2)));
    int _1904 = int(_1900) & 3;
    float _1906 = (*spvDescriptorSet0.vp_c15)._m0[int(_1902)][_1904];
    int _1908 = int(_1900) + 1;
    uint _1910 = uint(int(uint(_1908) >> uint(2)));
    int _1912 = _1908 & 3;
    float _1914 = (*spvDescriptorSet0.vp_c15)._m0[int(_1910)][_1912];
    float _1916 = _1716 * _1816;
    float _1918 = 1.0 / _1896;
    float _1920 = fma(_1213, _1808, _1916);
    float _1922 = _1716 * _1834;
    float _1924 = fma(_1213, _1826, _1922);
    float _1926 = fma(_1217, _1844, _1920);
    float _1928 = _1926 + _1852;
    float _1930 = fma(_1217, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1932 = fma(_1217, _1862, _1924);
    float _1934 = _1928 * _1918;
    float _1936 = fma(_1213, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1938 = floor(_1930);
    float _1940 = _1932 + _1870;
    bool _1942 = _1934 >= 0.0;
    float _1944 = _1940 * _1918;
    bool _1946 = _1934 <= 1.0;
    bool _1948 = _1946 && _1942;
    float _1950 = floor(_1936);
    bool _1952 = _1944 >= 0.0;
    bool _1954 = _1952 && _1948;
    float _1956 = _1716 * _1892;
    int _1958 = _1700 >> 31;
    bool _1960 = _1944 <= 1.0;
    bool _1962 = _1960 && _1954;
    float _1964 = fma(_1213, _1884, _1956);
    int _1966 = _1958 & 3;
    float _1968 = -_1938;
    float _1970 = _1930 + _1968;
    bool _1972 = !_1692;
    int _1974 = _1972 ? 0 : (-1);
    float _1976 = fma(_1217, _1906, _1964);
    int _1978 = _1700 + _1966;
    float _1980 = in.m_62.w;
    float _1982 = _1976 + _1914;
    int _1984 = _1978 >> 2;
    int _1986 = _1700 & 3;
    bool _1988 = _1986 != 0;
    float _1990 = _1982 * _1918;
    float _1992 = _1956;
    if (_1962)
    {
        float _1994 = float(_1760);
        _1992 = _1994;
    }
    float _1996 = _1992;
    float _1998 = -_1950;
    float _2000 = _1936 + _1998;
    int _2002 = _1984 << 4;
    int _2004 = _2002 + 368;
    bool _2006 = _1986 != 3;
    float _2008 = _1996;
    if (_1962)
    {
        float _2010 = rint(_1996);
        float _2012 = precise::max(_2010, 0.0);
        uint _2014 = uint(_2012);
        uint _2016 = clamp(_2014, 0u, 65535u);
        _2008 = as_type<float>(_2016);
    }
    float _2018 = _2008;
    uint _2020 = uint(int(uint(_2004) >> uint(2)));
    uint _2022 = uint(int(uint(int(_2020)) >> uint(2)));
    int _2024 = int(_2020) & 3;
    float _2026 = (*spvDescriptorSet0.vp_c9)._m0[int(_2022)][_2024];
    int _2028 = int(_2020) + 1;
    uint _2030 = uint(int(uint(_2028) >> uint(2)));
    int _2032 = _2028 & 3;
    float _2034 = (*spvDescriptorSet0.vp_c9)._m0[int(_2030)][_2032];
    float2 _6270 = float2(_2000, _1970);
    float _2036 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6270, float2(0.0), isnan(_6270)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6270, float2(0.0), isnan(_6270)), level(0.0)).x;
    bool _2038 = uint(_1986) > 1u;
    int _2040 = _1704 ? 0 : 1;
    bool _2042 = uint(_1986) >= 2u;
    float _2044 = _1944;
    if (_1962)
    {
        float3 _6295 = float3(_1934, _1944, float(as_type<int>(_2018)));
        float3 _6299 = select(_6295, float3(0.0), isnan(_6295));
        float _2046 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6299.xy, uint(rint(_6299.z)), _1990, level(0.0));
        _2044 = _2046;
    }
    float _2048 = _2044;
    int _2050 = ~_1676;
    int _2052 = _2050 + _1974;
    int _2054 = _2052 + 1;
    float _2056 = -_717;
    float _2058 = _2056 + 1.0;
    int _2060 = _2004 + 8;
    uint _2062 = uint(int(uint(_2060) >> uint(2)));
    uint _2064 = uint(int(uint(int(_2062)) >> uint(2)));
    int _2066 = int(_2062) & 3;
    float _2068 = (*spvDescriptorSet0.vp_c9)._m0[int(_2064)][_2066];
    int _2070 = int(_2062) + 1;
    uint _2072 = uint(int(uint(_2070) >> uint(2)));
    int _2074 = _2070 & 3;
    float _2076 = (*spvDescriptorSet0.vp_c9)._m0[int(_2072)][_2074];
    int _2078 = _2042 ? 0 : 1;
    out.m_74.x = _353;
    out.m_74.y = _355;
    bool _2080 = _1980 > 0.5;
    int _2082 = _1417 * _2054;
    int _2084 = _2082 + _1588;
    int _2086 = ~_2078;
    int _2088 = _2086 + 1;
    int _2090 = _2088 + 1;
    int _2092 = _2090;
    bool _2094 = _2080;
    if (_1293)
    {
        float _2096 = _1335 * 6.283185482025146484375;
        float _2098 = cos(_2096);
        _1341 = _2098;
    }
    float _2100 = _1341;
    int _2102 = ~_2040;
    int _2104 = _2102 + 1;
    int _2106 = _2104 + 1;
    int _2108 = _2106;
    if (_2006)
    {
        int _2110 = ~_2078;
        int _2112 = _2110 + 1;
        _2092 = _2112;
    }
    int _2114 = _2092;
    if (!_2038)
    {
        int _2116 = ~_2040;
        int _2118 = _2116 + 1;
        _2108 = _2118;
    }
    int _2120 = _2108;
    float _2122 = _359 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _2124 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2126 = _2124 != 0;
    float _2128 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _2130 = _1986 != 3;
    bool _2132 = !_1988;
    int _2134 = _2132 ? 0 : 1;
    float _2136 = -_2128;
    float _2138 = fma(_2122, 2.0, _2136);
    int _2140 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2142 = _2140 != 0;
    float _2144 = in.m_68.x;
    int _2146 = abs(_2120);
    float _2148 = -_139;
    float _2150 = fma(_2148, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2138);
    float _2152 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _2154 = abs(_2114);
    bool _2156 = !_1427;
    int _2158 = _2156 ? _2084 : (-1);
    float _2160 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _2162 = abs(_2134);
    int _2164 = ~_2146;
    int _2166 = _2164 + 1;
    int _2168 = _2166 + 1;
    float _2170 = fma(_387, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2160);
    int _2172 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2174 = _2172 != 0;
    int _2176 = _2080 ? as_type<int>(_2058) : as_type<int>(_717);
    int _2178 = _2168 * as_type<int>(_2034);
    float _2180 = _2144;
    if (_2126)
    {
        bool _2182 = _359 > 0.5;
        _2094 = _2182;
    }
    bool _2184 = _2094;
    float _2186 = fma(_359, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2152);
    int _2188 = ~_2162;
    int _2190 = _2188 + 1;
    int _2192 = _2190 + 1;
    float _2194 = _387 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2196 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2186);
    float _2198 = _2174 ? as_type<float>(_2176) : _717;
    int _2200 = _2192 * as_type<int>(_2026);
    int _2202 = _2200 + _2178;
    bool _2204 = !_2130;
    int _2206 = _2204 ? 0 : (-1);
    float _2208 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2170);
    bool _2210 = _387 > 0.5;
    int _2212 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2214 = _2212 != 0;
    float _2216 = _387;
    bool _2218 = _2210;
    if (_2142)
    {
        float _2220 = in.m_62.z;
        _2216 = _2220;
    }
    float _2222 = _2216;
    int _2224 = ~_2154;
    int _2226 = _2224 + 1;
    int _2228 = _2226 + 1;
    bool _2230 = !_2214;
    int _2232 = _2230 ? 0 : 1;
    int _2234 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2236 = _2234 != 0;
    int _2238 = _2228 * as_type<int>(_2068);
    int _2240 = _2238 + _2202;
    float _2242 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2244 = int(_2242);
    int _2246 = abs(_2206);
    float _2248 = in.m_76.x;
    float _2250 = in.m_76.y;
    float _2252 = in.m_76.z;
    float _2254 = in.m_76.w;
    int _2256 = abs(_2232);
    float _2258 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _2260 = _2210 ? as_type<int>(_2058) : as_type<int>(_717);
    int _2262 = ~_2256;
    int _2264 = _2262 + 1;
    int _2266 = _2264 + 1;
    float _2268 = _2258 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2270 = ~_2246;
    int _2272 = _2270 + 1;
    int _2274 = _2272 + 1;
    int _2276 = _2274 * as_type<int>(_2076);
    int _2278 = _2276 + _2240;
    float _2280 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2282 = float(uint(_2244));
    float _2284 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _2286 = _2256;
    if (_2142)
    {
        bool _2288 = _2222 > 0.5;
        _2218 = _2288;
    }
    bool _2290 = _2218;
    int _2292 = _2278 * _2266;
    float _2294 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _2296 = abs(_2244);
    float _2298 = 1.0 / _2282;
    float _2300 = _2236 ? as_type<float>(_2260) : _717;
    float _2302 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2304 = float(uint(_2296));
    float _2306 = _2280 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2308 = _1151 != 0.0;
    bool _2310 = isnan(_1151);
    bool _2312 = _2308 || _2310;
    bool _2314 = isnan(0.0);
    bool _2316 = _2312 || _2314;
    float _2318 = _2284 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2320 = _2158 * _2256;
    int _2322 = _2320 + _2292;
    float _2324 = _2294 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2326 = _2302 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2328 = 1.0 / _2304;
    bool _2330 = _1145 == 0.0;
    bool _2332 = !_2316;
    bool _2334 = _2330 && _2332;
    if (_2142)
    {
        float _2336 = -_2144;
        float _2338 = _2336 + 1.0;
        _2286 = as_type<int>(_2338);
    }
    int _2340 = _2286;
    out.m_78.x = _2268;
    out.m_78.y = _2324;
    out.m_78.z = _2326;
    bool _2342 = _1127 == 0.02999999932944774627685546875;
    bool _2344 = _2342 && _2334;
    float _2346 = _305 * _2252;
    float _2348 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _2350 = as_type<int>(_2298) + (-2);
    float _2352 = fma(_279, _2248, _2346);
    int _2354 = abs(_2322);
    float _2356 = fma(_2194, -2.0, _2348);
    float _2358 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2360 = float(uint(_2354));
    float _2362 = _289 * _2252;
    float _2364 = _297 * _2252;
    int _2366 = as_type<int>(_2328) + (-2);
    float _2368 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2370 = fma(_271, _2248, _2362);
    float _2372 = float(uint(_2322));
    float _2374 = fma(_275, _2248, _2364);
    float _2376 = _2358 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2378 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2356);
    int _2380 = ~_2244;
    int _2382 = _2380 + 1;
    float _2384 = as_type<float>(_2350) * _2372;
    float _2386 = -_2250;
    float _2388 = fma(_321, _2386, _2374);
    float _2390 = -_2250;
    float _2392 = fma(_317, _2390, _2370);
    float _2394 = as_type<float>(_2366) * _2360;
    out.m_80.x = _2376;
    out.m_80.y = _2306;
    out.m_80.z = _2318;
    out.m_80.w = _2368;
    int _2396 = as_type<int>(_2360);
    float _2398 = _2368;
    float _2400 = _2388;
    if (_2126)
    {
        float _2402 = -_2144;
        float _2404 = _2402 + 1.0;
        _2396 = as_type<int>(_2404);
    }
    int _2406 = _2396;
    float _2408 = trunc(_2384);
    float _2410 = precise::max(_2408, 0.0);
    uint _2412 = uint(_2410);
    float _2414 = -_2250;
    float _2416 = fma(_327, _2414, _2352);
    float _2418 = in.m_82.x;
    float _2420 = in.m_82.y;
    float _2422 = in.m_82.z;
    out.m_84.x = _2388;
    out.m_84.y = _2392;
    out.m_84.z = _2416;
    float _2424 = trunc(_2394);
    float _2426 = precise::max(_2424, 0.0);
    uint _2428 = uint(_2426);
    if (!_2126)
    {
        _2398 = _2144;
    }
    float _2430 = _2398;
    float _2432 = _2430;
    if (_2126)
    {
        float _2434 = _2184 ? as_type<float>(_2406) : _2144;
        _2432 = _2434;
    }
    float _2436 = _2432;
    int _2438 = ~_2296;
    int _2440 = _2438 + 1;
    int _2442 = _2382 * int(_2412);
    int _2444 = _2442 + _2322;
    float _2446 = as_type<float>(_2444);
    if (_2142)
    {
        float _2448 = _2290 ? as_type<float>(_2340) : _2144;
        _2180 = _2448;
    }
    float _2450 = _2180;
    float _2452 = float(uint(_2444));
    float _2454 = _2450 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _2456 = _2440 * int(_2428);
    int _2458 = _2456 + _2354;
    float _2460 = _2452;
    if (_2344)
    {
        _2446 = _2420;
    }
    float _2462 = _2446;
    float _2464 = as_type<float>(_2350) * _2452;
    float _2466 = _2462;
    if (!_2344)
    {
        float _2468 = fma(_1151, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2420);
        _2466 = _2468;
    }
    float _2470 = _2466;
    float _2472 = _2252 * _2418;
    float _2474 = float(uint(_2458));
    float _2476 = _2250 * _2422;
    if (_2344)
    {
        _2460 = _2422;
    }
    float _2478 = _2460;
    float _2480 = trunc(_2464);
    float _2482 = precise::max(_2480, 0.0);
    uint _2484 = uint(_2482);
    float _2486 = _2478;
    if (!_2344)
    {
        float _2488 = fma(_1153, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2422);
        _2486 = _2488;
    }
    float _2490 = _2486;
    float _2492 = as_type<float>(_2366) * _2474;
    float _2494 = -_2472;
    float _2496 = fma(_2248, _2422, _2494);
    float _2498 = _2248 * _2420;
    float _2500 = -_2476;
    float _2502 = fma(_2252, _2420, _2500);
    if (_2344)
    {
        _2400 = _2418;
    }
    float _2504 = _2400;
    float _2506 = _2504;
    if (!_2344)
    {
        float _2508 = fma(_1145, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2418);
        _2506 = _2508;
    }
    float _2510 = _2506;
    float _2512 = trunc(_2492);
    float _2514 = precise::max(_2512, 0.0);
    uint _2516 = uint(_2514);
    float _2518 = -_2498;
    float _2520 = fma(_2250, _2418, _2518);
    float _2522 = _297 * _2490;
    float _2524 = _289 * _2490;
    float _2526 = _305 * _2490;
    float _2528 = _2496 * _2254;
    float _2530 = _2502 * _2254;
    float _2532 = _2520 * _2254;
    int _2534 = ~_2244;
    int _2536 = _2534 + 1;
    float _2538 = fma(_275, _2510, _2522);
    int _2540 = int(_2412) + int(_2484);
    float _2542 = fma(_271, _2510, _2524);
    float _2544 = fma(_279, _2510, _2526);
    int _2546 = ~_2296;
    int _2548 = _2546 + 1;
    float _2550 = _2532 * _297;
    float _2552 = _2532 * _305;
    int _2554 = int(_2428) + int(_2516);
    float _2556 = _2532 * _289;
    int _2558 = _2536 * _2540;
    int _2560 = _2558 + _2322;
    float _2562 = fma(_2530, _275, _2550);
    int _2564 = _2322 ^ _2244;
    int _2566 = _2548 * _2554;
    int _2568 = _2566 + _2354;
    float _2570 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2572 = uint(_2560) >= uint(_2244);
    float _2574 = fma(_2530, _271, _2556);
    uint _2576 = uint(int(uint(_2564) >> uint(31)));
    float _2578 = fma(_2530, _279, _2552);
    bool _2580 = uint(_2568) >= uint(_2296);
    float _2582 = -_2470;
    float _2584 = fma(_321, _2582, _2538);
    bool _2586 = !_2572;
    int _2588 = _2586 ? 0 : (-1);
    float _2590 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2592 = !_2580;
    int _2594 = _2592 ? 0 : (-1);
    float _2596 = -_2528;
    float _2598 = fma(_2596, _321, _2562);
    int _2600 = ~_2540;
    int _2602 = _2600 + _2588;
    int _2604 = _2602 + 1;
    if (_1293)
    {
        float _2606 = _2100 + (-1.0);
        _323 = _2606;
    }
    float _2608 = _323;
    int _2610 = ~_2594;
    int _2612 = _2554 + _2610;
    int _2614 = _2612 + 1;
    float _2616 = -_2470;
    float _2618 = fma(_327, _2616, _2544);
    int _2620 = ~int(_2576);
    int _2622 = _2620 + 1;
    int _2624 = _2244 * _2604;
    int _2626 = _2624 + _2322;
    bool _2628 = _2244 == 0;
    float _2630 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2632 = _2614 ^ _2622;
    float _2634 = _2570 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2636 = !_2628;
    int _2638 = _2636 ? _2626 : (-1);
    float _2640 = _2608;
    if (_1293)
    {
        float _2642 = _2608 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2640 = _2642;
    }
    float _2644 = _2640;
    bool _2646 = _2244 == 0;
    float _2648 = fma(_2634, _2436, -0.5);
    int _2650 = ~_2622;
    int _2652 = _2650 + _2632;
    int _2654 = _2652 + 1;
    float _2656 = _2584 * _1183;
    float _2658 = float(_2638);
    float _2660 = _2590 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _2662 = !_2646;
    int _2664 = _2662 ? _2654 : (-1);
    float _2666 = _2584 * _1165;
    float _2668 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2670 = fma(_2634, _2658, _2150);
    float _2672 = float(_2664);
    float _2674 = _2198 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    if (_1293)
    {
        float _2676 = fma(_1359, _2100, _2644);
        _1363 = _2676;
    }
    float _2678 = _1363;
    float _2680 = fma(_2196, _2648, _2670);
    float _2682 = fma(_2660, _2300, -0.5);
    float _2684 = -_2378;
    float _2686 = fma(_2660, _2672, _2684);
    float _2688 = -_2528;
    float _2690 = fma(_2688, _327, _2578);
    float _2692 = fma(_2618, _1183, _2666);
    float _2694 = -_2528;
    float _2696 = fma(_2694, _317, _2574);
    float _2698 = -_2470;
    float _2700 = fma(_317, _2698, _2542);
    float _2702 = _2674 * _2630;
    float _2704 = fma(_1407, 100.0, _2678);
    float _2706 = _1716 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _2708 = _2680 + 0.5;
    float _2710 = _1716 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2712 = abs(_1742);
    float _2714 = log2(_2712);
    float _2716 = -_2656;
    float _2718 = fma(_2618, _1165, _2716);
    float _2720 = _1223 * _2692;
    float _2722 = _2704 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2724 = fma(_1213, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2706);
    float _2726 = _2704 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2728 = _1245 * _2692;
    float _2730 = fma(_1213, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2710);
    float _2732 = -_2720;
    float _2734 = fma(_1245, _2718, _2732);
    float _2736 = fma(_2208, _2682, _2686);
    float _2738 = _2704 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2740 = fma(_1217, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2724);
    float _2742 = fma(_1389, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2722);
    float _2744 = fma(_1389, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2726);
    float _2746 = fma(_1217, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2730);
    float _2748 = _2454 * _2668;
    float _2750 = _2736 + 0.5;
    float _2752 = fma(_1389, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2738);
    float _2754 = _2740 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _2756 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2742);
    float _2758 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2744);
    float _2760 = _2746 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _2762 = fma(_1223, _2718, _2728);
    float _2764 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2752);
    float _2766 = _2756 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2768 = in.m_64.z;
    float _2770 = _2704 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2772 = _2764 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2774 = _2766 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2776 = in.m_64.w;
    float _2778 = fma(_1389, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2770);
    float _2780 = _2758 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    bool _2782 = _1742 <= 8000.0;
    bool _2784 = isnan(_1742);
    bool _2786 = _2782 || _2784;
    bool _2788 = isnan(8000.0);
    bool _2790 = _2786 || _2788;
    float _2792 = float(_2790);
    out.m_86.x = _2598;
    out.m_86.y = _2696;
    out.m_86.z = _2690;
    float _2794 = fma(_1393, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2778);
    out.m_88.x = _2708;
    out.m_88.y = _2750;
    out.m_88.z = _2748;
    out.m_88.w = _2702;
    float _2796 = _2794 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2798 = _2714 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2800 = _2766 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    out.m_74.z = _2768;
    float _2802 = trunc(_2754);
    int _2804 = int(_2802);
    float _2806 = _2766 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2808 = _2766 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2810 = fma(_2772, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2774);
    out.m_74.w = _2776;
    float _2812 = fma(_2772, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2806);
    float _2814 = fma(_2772, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2808);
    float _2816 = fma(_2772, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2800);
    float _2818 = trunc(_2760);
    int _2820 = int(_2818);
    float _2822 = fma(_2780, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2810);
    float _2824 = fma(_2780, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2812);
    float _2826 = fma(_2780, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2816);
    float _2828 = fma(_2780, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2814);
    float _2830 = fma(_2796, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2822);
    float _2832 = fma(_2796, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2824);
    float _2834 = fma(_2796, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2826);
    float _2836 = exp2(_2798);
    int _2838 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2840 = _2804 + _2838;
    int _2842 = _2840 + 1;
    float _2844 = fma(_2796, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2828);
    float _2846 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2848 = _2704 + _2846;
    bool _2850 = _2842 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _2852 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2854 = _1389 + _2852;
    out.gl_Position.x = _2830;
    out.gl_Position.y = _2832;
    out.gl_Position.z = _2844;
    out.gl_Position.w = _2834;
    int _2856 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2858 = _2820 + _2856;
    int _2860 = _2858 + 1;
    float _2862 = _2848 * _2848;
    int _2864 = _2842 | _2860;
    float _2866 = fma(_2854, _2854, _2862);
    float _2868 = fma(_2836, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2870 = precise::clamp(_2868, 0.0, 1.0);
    bool _2872 = _2864 < 0;
    bool _2874 = _2872 || _2850;
    float _2876 = fma(_2870, -2.0, 3.0);
    float _2878 = _2870 * _2870;
    bool _2880 = _2860 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2882 = _2880 || _2874;
    float _2884 = _2878 * _2876;
    float _2886 = -_2884;
    float _2888 = _2886 + 1.0;
    float _2890 = fma(_2888, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2884);
    float _2892 = _2832;
    float _2894 = _2844;
    float _2896 = _2760;
    float _2898 = _2754;
    float _2900 = _2834;
    if (_2882)
    {
        _2892 = 1.0;
    }
    float _2902 = _2892;
    float _2904 = _2792 * _2890;
    float _2906 = _2902;
    if (!_2882)
    {
        int _2908 = _2860 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2910 = _2908 + _2842;
        float _2912 = floor(_2760);
        int _2914 = _2910 << 2;
        uint _2916 = uint(int(uint(_2910) >> uint(2)));
        int _2918 = 12 & _2914;
        int _2920 = int(_2916) << 4;
        int _2922 = _2920 + _2918;
        float _2924 = floor(_2754);
        float _2926 = -_2912;
        float _2928 = _2760 + _2926;
        int _2930 = _2922 + 400;
        uint _2932 = uint(int(uint(_2930) >> uint(2)));
        uint _2934 = uint(int(uint(int(_2932)) >> uint(2)));
        int _2936 = int(_2932) & 3;
        float _2938 = (*spvDescriptorSet0.vp_c15)._m0[int(_2934)][_2936];
        float _2940 = -_2924;
        float _2942 = _2754 + _2940;
        float _2944 = rint(_2938);
        float _2946 = precise::max(_2944, 0.0);
        uint _2948 = uint(_2946);
        uint _2950 = clamp(_2948, 0u, 65535u);
        float3 _7781 = float3(_2942, _2928, float(int(_2950)));
        float3 _7783 = select(_7781, float3(0.0), isnan(_7781));
        float _2952 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _7783.xy, uint(rint(_7783.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _7783.xy, uint(rint(_7783.z)), level(0.0)).x;
        int _2954 = _2910 << 4;
        int _2956 = _2954 + 2048;
        uint _2958 = uint(int(uint(_2956) >> uint(2)));
        uint _2960 = uint(int(uint(int(_2958)) >> uint(2)));
        int _2962 = int(_2958) & 3;
        float _2964 = (*spvDescriptorSet0.vp_c15)._m0[int(_2960)][_2962];
        int _2966 = int(_2958) + 1;
        uint _2968 = uint(int(uint(_2966) >> uint(2)));
        int _2970 = _2966 & 3;
        float _2972 = (*spvDescriptorSet0.vp_c15)._m0[int(_2968)][_2970];
        int _2974 = _2956 + 8;
        uint _2976 = uint(int(uint(_2974) >> uint(2)));
        uint _2978 = uint(int(uint(int(_2976)) >> uint(2)));
        int _2980 = int(_2976) & 3;
        float _2982 = (*spvDescriptorSet0.vp_c15)._m0[int(_2978)][_2980];
        int _2984 = int(_2976) + 1;
        uint _2986 = uint(int(uint(_2984) >> uint(2)));
        int _2988 = _2984 & 3;
        float _2990 = (*spvDescriptorSet0.vp_c15)._m0[int(_2986)][_2988];
        float _2992 = _1716 * _2972;
        float _2994 = fma(_1213, _2964, _2992);
        float _2996 = fma(_1217, _2982, _2994);
        float _2998 = _2996 + _2990;
        float _3000 = precise::clamp(_2998, 0.0, 1.0);
        float _3002 = -_3000;
        float _3004 = _3002 + _2952;
        float _3006 = fma(_3004, 500.0, 1.5);
        float _3008 = exp2(_3006);
        float _3010 = 0.0 + _3008;
        float _3012 = precise::clamp(_3010, 0.0, 1.0);
        _2894 = _2938;
        _2906 = _3012;
        _1754 = _3008;
    }
    float _3014 = _2894;
    float _3016 = _2906;
    float _3018 = _1754;
    float _3020 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3022 = _1393 + _3020;
    float _3024 = _2904 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3026 = -_2036;
    float _3028 = _3026 + 1.0;
    float _3030 = _3014;
    float _3032 = _3018;
    if (!_1962)
    {
        _3030 = 1.0;
    }
    float _3034 = _3030;
    float _3036 = fma(_3022, _3022, _2866);
    float _3038 = _3034;
    if (_1962)
    {
        bool _3040 = _2048 >= _1990;
        bool _3042 = isnan(_2048);
        bool _3044 = _3040 || _3042;
        bool _3046 = isnan(_1990);
        bool _3048 = _3044 || _3046;
        float _3050 = float(_3048);
        _3038 = _3050;
    }
    float _3052 = _3038;
    float _3054 = _3028 * _3024;
    float _3056 = precise::clamp(_3054, 0.0, 1.0);
    out.m_90.x = _2762;
    out.m_90.y = _2700;
    out.m_90.z = _2734;
    float _3058 = _3052 * _3016;
    float _3060 = sqrt(_3036);
    float _3062 = -_3056;
    float _3064 = fma(_3062, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3066 = -_3058;
    float _3068 = fma(_3066, _3064, 1.0);
    float _3070 = precise::clamp(_3068, 0.0, 1.0);
    float _3072 = _3070 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_92.x = _3072;
    bool _3074 = _3060 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3076 = isnan(_3060);
    bool _3078 = _3074 || _3076;
    bool _3080 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3082 = _3078 || _3080;
    float _3084 = _3064;
    float _3086 = _3070;
    if (!_3082)
    {
        _3032 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3088 = _3032;
    float _3090 = _3088;
    float _3092 = _3088;
    if (!_3082)
    {
        _2896 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3094 = _2896;
    float _3096 = _3094;
    float _3098 = _3094;
    if (!_3082)
    {
        _2898 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3100 = _2898;
    float _3102 = _3100;
    float _3104 = _3100;
    if (!_3082)
    {
        _2900 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3106 = _2900;
    float _3108 = _3106;
    float _3110 = _3106;
    if (!_3082)
    {
        _3084 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3112 = _3084;
    float _3114 = _3112;
    float _3116 = _3112;
    if (!_3082)
    {
        _3086 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3118 = _3086;
    bool _3120 = !_3082;
    float _3122 = _3118;
    float _3124 = _3118;
    if (!_3120)
    {
        bool _3126 = _3060 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3128 = isnan(_3060);
        bool _3130 = _3126 || _3128;
        bool _3132 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3134 = _3130 || _3132;
        if (!_3134)
        {
            float _3136 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3138 = _3060 + _3136;
            float _3140 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3142 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3140;
            float _3144 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3146 = _3144 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3148 = 1.0 / _3142;
            float _3150 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3152 = _3150 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3154 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3156 = _3154 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3158 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3160 = _3158 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3162 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3164 = _3162 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3166 = _3138 * _3148;
            float _3168 = precise::clamp(_3166, 0.0, 1.0);
            float _3170 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3172 = _3170 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3174 = fma(_3168, _3146, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3176 = fma(_3168, _3172, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3178 = fma(_3168, _3152, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3180 = fma(_3168, _3156, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3182 = fma(_3168, _3160, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3184 = fma(_3168, _3164, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3098 = _3174;
            _3116 = _3182;
            _3092 = _3178;
            _3110 = _3180;
            _3104 = _3176;
            _3124 = _3184;
            _3186 = true;
        }
        else
        {
            bool _3188 = _3060 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3190 = isnan(_3060);
            bool _3192 = _3188 || _3190;
            bool _3194 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3196 = _3192 || _3194;
            if (!_3196)
            {
                _3090 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3198 = _3090;
            _3092 = _3198;
            if (!_3196)
            {
                _3096 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3200 = _3096;
            _3098 = _3200;
            if (!_3196)
            {
                _3102 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3202 = _3102;
            _3104 = _3202;
            if (!_3196)
            {
                _3108 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3204 = _3108;
            _3110 = _3204;
            if (!_3196)
            {
                _3114 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3206 = _3114;
            _3116 = _3206;
            if (!_3196)
            {
                _3122 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3208 = _3122;
            bool _3210 = !_3196;
            _3124 = _3208;
            if (!_3210)
            {
                bool _3212 = _3060 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3214 = isnan(_3060);
                bool _3216 = _3212 || _3214;
                bool _3218 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3220 = _3216 || _3218;
                if (!_3220)
                {
                    float _3222 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3224 = _3060 + _3222;
                    float _3226 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3228 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3226;
                    float _3230 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3232 = _3230 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3234 = 1.0 / _3228;
                    float _3236 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3238 = _3236 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3240 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3242 = _3240 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3244 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3246 = _3244 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3248 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3250 = _3248 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3252 = _3224 * _3234;
                    float _3254 = precise::clamp(_3252, 0.0, 1.0);
                    float _3256 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3258 = _3256 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3260 = fma(_3254, _3232, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3262 = fma(_3254, _3258, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3264 = fma(_3254, _3238, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3266 = fma(_3254, _3242, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3268 = fma(_3254, _3246, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3270 = fma(_3254, _3250, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3098 = _3260;
                    _3116 = _3268;
                    _3092 = _3264;
                    _3110 = _3266;
                    _3104 = _3262;
                    _3124 = _3270;
                    _3186 = true;
                }
                else
                {
                    _3098 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3116 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3092 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3110 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3104 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3124 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3186 = false;
    float _3272 = _3098;
    float _3274 = _3116;
    float _3276 = _3092;
    float _3278 = _3110;
    float _3280 = _3104;
    float _3282 = _3124;
    float _3284 = fma(_2700, -0.5, 0.5);
    float _3286 = precise::clamp(_3284, 0.0, 1.0);
    float _3288 = -_3272;
    float _3290 = _3288 + _3274;
    float _3292 = -_3276;
    float _3294 = _3292 + _3278;
    float _3296 = -_3280;
    float _3298 = _3296 + _3282;
    bool _3300 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3302 = fma(_3286, _3290, _3272);
    float _3304 = fma(_3286, _3294, _3276);
    float _3306 = fma(_3286, _3298, _3280);
    float _3308 = _3302 * 0.586610972881317138671875;
    out.m_52.x = 1.0;
    float _3310 = fma(_3304, 0.298911988735198974609375, _3308);
    float _3312 = fma(_3306, 0.114477999508380889892578125, _3310);
    out.m_94.x = 0.0;
    float _3314 = -_3312;
    float _3316 = _3304 + _3314;
    float _3318 = -_3312;
    float _3320 = _3302 + _3318;
    float _3322 = -_3312;
    float _3324 = _3306 + _3322;
    float _3326 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3328 = fma(_3316, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3312);
    float _3330 = fma(_3320, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3312);
    float _3332 = fma(_3324, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3312);
    out.m_92.w = _3326;
    out.m_96.x = _3328;
    out.m_96.y = _3330;
    out.m_96.z = _3332;
    if (!_3300)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3334 = -_2704;
    float _3336 = _3334 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3338 = -_1389;
    float _3340 = _3338 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3342 = -_1393;
    float _3344 = _3342 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3346 = _3336 * _3336;
    float _3348 = fma(_3340, _3340, _3346);
    float _3350 = fma(_3344, _3344, _3348);
    float _3352 = sqrt(_3350);
    float _3354 = rsqrt(_3350);
    float _3356 = -_3352;
    float _3358 = _3356 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3360 = _3358 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3362 = precise::clamp(_3360, 0.0, 1.0);
    float _3364 = _3340 * _3354;
    float _3366 = _3336 * _3354;
    float _3368 = abs(_3362);
    float _3370 = log2(_3368);
    float _3372 = _3344 * _3354;
    float _3374 = _3364 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3376 = _2700 * _3366;
    float _3378 = -_3366;
    float _3380 = -_3374;
    float _3382 = fma(_3378, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3380);
    float _3384 = fma(_2762, _3364, _3376);
    float _3386 = -_3372;
    float _3388 = fma(_3386, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3382);
    float _3390 = fma(_2734, _3372, _3384);
    float _3392 = precise::clamp(_3390, 0.0, 1.0);
    float _3394 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3396 = _3388 + _3394;
    float _3398 = _3370 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3400 = _3396 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3402 = precise::clamp(_3400, 0.0, 1.0);
    float _3404 = exp2(_3398);
    float _3406 = _3404 * _3402;
    float _3408 = _3392 * _3406;
    float _3410 = _3408 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3412 = _3408 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3414 = _3408 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_94.x = _3410;
    out.m_94.y = _3412;
    out.m_94.z = _3414;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

