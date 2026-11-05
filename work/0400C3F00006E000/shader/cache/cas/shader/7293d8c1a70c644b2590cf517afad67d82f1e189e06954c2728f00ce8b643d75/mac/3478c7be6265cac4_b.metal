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
    float4 m_80 [[user(locn0)]];
    float4 m_82 [[user(locn1)]];
    float4 m_52 [[user(locn2)]];
    float4 m_104 [[user(locn3)]];
    float4 m_58 [[user(locn4)]];
    float4 m_88 [[user(locn5)]];
    float4 m_76 [[user(locn6)]];
    float4 m_92 [[user(locn7)]];
    float4 m_90 [[user(locn8)]];
    float4 m_94 [[user(locn9)]];
    float4 m_96 [[user(locn10)]];
    float4 m_98 [[user(locn11)]];
    float4 m_84 [[user(locn12)]];
    float4 m_102 [[user(locn13)]];
    float4 m_100 [[user(locn14)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_74 [[attribute(0)]];
    float4 m_62 [[attribute(1)]];
    float4 m_60 [[attribute(2)]];
    float4 m_64 [[attribute(3)]];
    float4 m_49 [[attribute(5)]];
    float4 m_54 [[attribute(6)]];
    float4 m_86 [[attribute(7)]];
    float4 m_68 [[attribute(8)]];
    float4 m_56 [[attribute(9)]];
    float4 m_72 [[attribute(10)]];
    float4 m_78 [[attribute(11)]];
    float4 m_70 [[attribute(12)]];
    float4 m_66 [[attribute(13)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2856 = false;
    bool _361 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _118 = in.m_49.w;
    float _120 = trunc(_118);
    int _123 = int(_120);
    bool _127 = _123 >= 1;
    float _129 = 0.0;
    float _131 = as_type<float>(_123);
    if (!_127)
    {
        _129 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _129;
    if (!_127)
    {
        out.m_52.x = 0.0;
    }
    int _135 = 0;
    if (!_127)
    {
        float _137 = _133 * 5.0;
        _135 = as_type<int>(_137);
    }
    int _139 = _135;
    if (!_127)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3141 = as_type<float>(_139);
        out.gl_Position.z = _3141;
    }
    if (!_127)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _141 = in.m_54.w;
    float _143 = float(_123);
    float _145 = in.m_56.x;
    float _147 = in.m_56.y;
    float _149 = -_141;
    float _151 = _149 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _153 = _141 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _155 = isnan(_141);
    bool _157 = _153 || _155;
    bool _159 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _161 = _157 || _159;
    out.m_58.x = _145;
    bool _163 = _151 >= _143;
    bool _165 = !_161;
    bool _167 = _163 || _165;
    out.m_58.y = _147;
    float _169 = _147;
    if (_167)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _171 = _131;
    if (_167)
    {
        out.m_52.x = 0.0;
    }
    int _173 = 0;
    if (_167)
    {
        float _175 = _171 * 5.0;
        _173 = as_type<int>(_175);
    }
    int _177 = _173;
    if (_167)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3213 = as_type<float>(_177);
        out.gl_Position.z = _3213;
    }
    if (_167)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _179 = in.m_60.x;
    float _181 = in.m_60.y;
    float _183 = in.m_60.z;
    float _185 = 1.0 / _143;
    float _187 = in.m_62.x;
    float _189 = in.m_62.y;
    float _191 = in.m_62.z;
    float _193 = in.m_64.x;
    float _195 = in.m_64.y;
    float _197 = in.m_64.z;
    float _199 = _151 * _185;
    float _201 = _179 * _179;
    float _203 = _181 * _181;
    float _205 = fma(_187, _187, _201);
    float _207 = fma(_189, _189, _203);
    float _209 = fma(_193, _193, _205);
    float _211 = _183 * _183;
    float _213 = fma(_195, _195, _207);
    float _215 = sqrt(_209);
    float _217 = fma(_191, _191, _211);
    float _219 = fma(_197, _197, _217);
    float _221 = sqrt(_213);
    float _223 = sqrt(_219);
    bool _225 = _215 > 0.0;
    bool _227 = _221 > 0.0;
    float _229 = _215;
    float _231 = _221;
    float _233 = _209;
    float _235 = _219;
    float _237 = _213;
    if (_225)
    {
        float _239 = rsqrt(_209);
        _229 = _239;
    }
    float _241 = _229;
    float _243 = 0.0;
    if (!_225)
    {
        _243 = 0.0;
    }
    float _245 = _243;
    bool _247 = _223 > 0.0;
    float _249 = 0.0;
    float _251 = _245;
    float _253 = _223;
    if (!_225)
    {
        _249 = 0.0;
    }
    float _255 = _249;
    float _257 = 0.0;
    float _259 = _255;
    if (!_225)
    {
        _257 = 0.0;
    }
    float _261 = _257;
    float _263 = 0.0;
    float _265 = _261;
    if (_227)
    {
        float _267 = rsqrt(_213);
        _263 = _267;
    }
    float _269 = _263;
    if (!_227)
    {
        _231 = 0.0;
    }
    float _271 = _231;
    float _273 = 0.0;
    float _275 = _271;
    if (_247)
    {
        float _277 = rsqrt(_219);
        _273 = _277;
    }
    float _279 = _273;
    float _281 = _241;
    if (_225)
    {
        float _283 = _241 * _179;
        _251 = _283;
    }
    float _285 = _251;
    if (_225)
    {
        float _287 = _241 * _187;
        _259 = _287;
    }
    float _289 = _259;
    if (_225)
    {
        float _291 = _241 * _193;
        _265 = _291;
    }
    float _293 = _265;
    bool _295 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    if (!_227)
    {
        _281 = 0.0;
    }
    float _297 = _281;
    float _299 = _297;
    if (!_247)
    {
        _233 = 0.0;
    }
    float _301 = _233;
    float _303 = _301;
    if (_227)
    {
        float _305 = _269 * _181;
        _275 = _305;
    }
    float _307 = _275;
    float _309 = _307;
    if (!_227)
    {
        _235 = 0.0;
    }
    float _311 = _235;
    float _313 = _311;
    if (_227)
    {
        float _315 = _269 * _189;
        _299 = _315;
    }
    float _317 = _299;
    if (!_247)
    {
        _253 = 0.0;
    }
    float _319 = _253;
    float _321 = _319;
    if (_227)
    {
        float _323 = _269 * _195;
        _313 = _323;
    }
    float _325 = _313;
    if (!_247)
    {
        _237 = 0.0;
    }
    float _327 = _237;
    float _329 = _327;
    if (_247)
    {
        float _331 = _279 * _183;
        _303 = _331;
    }
    float _333 = _303;
    if (_247)
    {
        float _335 = _279 * _191;
        _321 = _335;
    }
    float _337 = _321;
    if (_247)
    {
        float _339 = _279 * _197;
        _329 = _339;
    }
    float _341 = _329;
    bool _343 = !_295;
    float _359;
    if (!_343)
    {
        float _345 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _347 = _145 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _349 = fma(_347, (*spvDescriptorSet0.vp_c9)._m0[12].x, _151);
        float _351 = _349 * _345;
        float _353 = floor(_351);
        float _355 = -_353;
        float _357 = _351 + _355;
        _359 = _357;
        _361 = true;
    }
    else
    {
        _359 = _199;
    }
    _361 = false;
    float _363 = _359;
    float _365 = in.m_66.x;
    float _367 = in.m_66.y;
    float _369 = _151 * (*spvDescriptorSet0.vp_c9)._m0[193].y;
    float _371 = in.m_49.x;
    float _373 = in.m_49.y;
    float _375 = in.m_49.z;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _377;
    float _381 = fma(_145, 6.283185482025146484375, _369);
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _385 = _383 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _389 = _363 + _387;
    float _391 = 1.0 / _379;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _395 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _393;
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _399 = _363 + _397;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _403 = _363 + _401;
    float _405 = 1.0 / _395;
    float _407 = fma((*spvDescriptorSet0.vp_c9)._m0[194].y, 0.01745329238474369049072265625, _381);
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _411 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _409;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _415 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _413;
    float _417 = _407 * 0.15915493667125701904296875;
    int _419 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _421 = _419 != 0;
    float _423 = -_367;
    float _425 = _423 + 1.0;
    float _427 = abs(_365);
    float _429 = log2(_427);
    float _431 = _399 * _391;
    float _433 = _189 * _373;
    float _435 = _195 * _373;
    float _437 = _407 * 1.2999999523162841796875;
    float _439 = fma(_187, _371, _433);
    float _441 = fma(_193, _371, _435);
    float _443 = _407 + 0.52359879016876220703125;
    float _445 = 1.0 / _385;
    float _447 = _443 * 0.15915493667125701904296875;
    float _449 = _389 * _405;
    float _451 = fma(_407, 0.60000002384185791015625, 0.31415927410125732421875);
    float _453 = _437 * 0.15915493667125701904296875;
    float _455 = _429 * (*spvDescriptorSet0.vp_c9)._m0[193].z;
    float _457 = fma(_407, 1.2999999523162841796875, 0.680678427219390869140625);
    float _459 = _407 * 0.60000002384185791015625;
    float _461 = _451 * 0.15915493667125701904296875;
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _465 = _463 + (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _467 = exp2(_455);
    float _469 = _459 * 0.15915493667125701904296875;
    float _471 = (*spvDescriptorSet0.vp_c9)._m0[193].w * 3.1415927410125732421875;
    float _473 = fma(_465, _145, (*spvDescriptorSet0.vp_c9)._m0[191].x);
    float _475 = _403 * _445;
    float _477 = _469 * 6.283185482025146484375;
    float _479 = sin(_477);
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _483 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _481;
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _487 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _485;
    float _489 = fma(_483, _431, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _491 = fma(_471, _467, _369);
    float _493 = _453 * 6.283185482025146484375;
    float _495 = sin(_493);
    float _497 = in.m_68.x;
    float _499 = in.m_68.y;
    float _501 = in.m_68.z;
    float _503 = _457 * 0.15915493667125701904296875;
    float _505 = fma(_145, 6.283185482025146484375, _491);
    float _507 = _417 * 6.283185482025146484375;
    float _509 = sin(_507);
    float _511 = _147 * 628.31854248046875;
    float _513 = fma(_151, _473, _511);
    float _515 = _447 * 6.283185482025146484375;
    float _517 = sin(_515);
    float _519 = _513 * 0.89999997615814208984375;
    float _521 = _513 * 0.15915493667125701904296875;
    float _523 = fma(_365, 0.261799395084381103515625, -0.261799395084381103515625);
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _527 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _525;
    float _529 = _519 * 0.15915493667125701904296875;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _533 = _531 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _537 = _535 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _539 = _461 * 6.283185482025146484375;
    float _541 = sin(_539);
    bool _543 = _497 > 0.0;
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _547 = _545 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _549 = _497 >= 0.0;
    bool _551 = isnan(_497);
    bool _553 = _549 || _551;
    bool _555 = isnan(0.0);
    bool _557 = _553 || _555;
    float _559 = fma(_527, _431, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _561 = _513 + _523;
    int _563 = _557 ? 0 : 1;
    float _565 = fma(_411, _431, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _567 = _529 * 6.283185482025146484375;
    float _569 = cos(_567);
    float _571 = fma(_533, _475, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _573 = fma(_547, _475, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _575 = fma(_537, _475, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _579 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _577;
    float _581 = _561 * 0.15915493667125701904296875;
    float _583 = _561 * 0.89999997615814208984375;
    float _585 = _561 * 1.10000002384185791015625;
    float _587 = fma(_579, _449, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    int _589 = ~_563;
    int _591 = _589 + 1;
    int _593 = _591 + 1;
    float _595 = fma(_415, _449, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    int _597 = _593;
    float _599 = _501;
    float _601 = _373;
    if (!_543)
    {
        int _603 = ~_563;
        int _605 = _603 + 1;
        _597 = _605;
    }
    int _607 = _597;
    float _609 = _561 * 0.699999988079071044921875;
    bool _611 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _613 = isnan(_363);
    bool _615 = _611 || _613;
    bool _617 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _619 = _615 || _617;
    float _621 = float(_619);
    float _623 = fma(_479, 0.60000002384185791015625, _509);
    float _625 = _585 * 0.15915493667125701904296875;
    bool _627 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _629 = isnan(_363);
    bool _631 = _627 || _629;
    bool _633 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _635 = _631 || _633;
    float _637 = float(_635);
    float _639 = _503 * 6.283185482025146484375;
    float _641 = sin(_639);
    float _643 = -_621;
    float _645 = _643 + 1.0;
    float _647 = fma(_495, 0.300000011920928955078125, _623);
    float _649 = fma(_541, 0.60000002384185791015625, _517);
    float _651 = _609 * 0.15915493667125701904296875;
    bool _653 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _655 = isnan(_363);
    bool _657 = _653 || _655;
    bool _659 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _661 = _657 || _659;
    float _663 = float(_661);
    float _665 = _637 * _645;
    float _667 = -_637;
    float _669 = _667 + 1.0;
    float _671 = fma(_487, _449, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _673 = _505 * 0.15915493667125701904296875;
    float _675 = _505 * 0.60000002384185791015625;
    float _677 = _505 * 1.2999999523162841796875;
    bool _679 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _681 = isnan(_363);
    bool _683 = _679 || _681;
    bool _685 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _687 = _683 || _685;
    float _689 = float(_687);
    float _691 = _663 * _669;
    float _693 = -_663;
    float _695 = _693 + 1.0;
    float _697 = _625 * 6.283185482025146484375;
    float _699 = cos(_697);
    float _701 = _675 * 0.15915493667125701904296875;
    float _703 = -_365;
    float _705 = _703 + 1.0;
    float _707 = _689 * _695;
    float _709 = _583 * 0.15915493667125701904296875;
    float _711 = _499 + (-0.0199999995529651641845703125);
    float _713 = _647 * _705;
    float _715 = _489 * _707;
    float _717 = _673 * 6.283185482025146484375;
    float _719 = sin(_717);
    float _721 = fma(_641, 0.300000011920928955078125, _649);
    float _723 = -_689;
    float _725 = _723 + 1.0;
    float _727 = _677 * 0.15915493667125701904296875;
    float _729 = _559 * _707;
    float _731 = abs(_721);
    float _733 = _425 * _731;
    float _735 = fma(_725, (*spvDescriptorSet0.vp_c9)._m0[143].x, _715);
    float _737 = _565 * _707;
    float _739 = _701 * 6.283185482025146484375;
    float _741 = sin(_739);
    float _743 = fma(_725, (*spvDescriptorSet0.vp_c9)._m0[143].y, _729);
    float _745 = fma(_571, _691, _735);
    float _747 = _733 * (-45.0);
    float _749 = in.m_70.y;
    float _751 = fma(_725, (*spvDescriptorSet0.vp_c9)._m0[143].z, _737);
    float _753 = _713 * 0.52359879016876220703125;
    float _755 = fma(_573, _691, _743);
    float _757 = _709 * 6.283185482025146484375;
    float _759 = sin(_757);
    float _761 = _747 * 0.01745329238474369049072265625;
    float _763 = fma(_575, _691, _751);
    float _765 = fma(_587, _665, _745);
    float _767 = _753 * 0.15915493667125701904296875;
    float _769 = in.m_72.x;
    float _771 = in.m_72.y;
    float _773 = in.m_72.z;
    float _775 = _761 * 0.15915493667125701904296875;
    float _777 = float(_607);
    float _779 = _727 * 6.283185482025146484375;
    float _781 = sin(_779);
    float _783 = _733 * (-20.0);
    float _785 = fma(_595, _665, _755);
    float _787 = fma(_671, _665, _763);
    float _789 = fma(_741, 0.60000002384185791015625, _719);
    float _791 = _777 * _783;
    float _793 = fma(_621, (*spvDescriptorSet0.vp_c9)._m0[146].x, _765);
    float _795 = _581 * 6.283185482025146484375;
    float _797 = sin(_795);
    float _799 = _791 * 0.01745329238474369049072265625;
    float _801 = _759 * 0.89999997615814208984375;
    float _803 = fma(_621, (*spvDescriptorSet0.vp_c9)._m0[146].y, _785);
    float _805 = fma(_621, (*spvDescriptorSet0.vp_c9)._m0[146].z, _787);
    float _807 = fma(_749, 0.5, 0.5);
    float _809 = _799 * 0.15915493667125701904296875;
    float _811 = _651 * 6.283185482025146484375;
    float _813 = cos(_811);
    float _815 = fma(_781, 0.300000011920928955078125, _789);
    float _817 = _807 * _815;
    float _819 = _793 * _769;
    float _821 = _805 * _773;
    float _823 = _767 * 6.283185482025146484375;
    float _825 = sin(_823);
    float _827 = -_801;
    float _829 = fma(_797, -1.2000000476837158203125, _827);
    float _831 = _817 * (*spvDescriptorSet0.vp_c9)._m0[193].x;
    float _833 = _803 * _771;
    float _835 = abs(_829);
    bool _837 = _835 > 0.001000000047497451305389404296875;
    bool _839 = isnan(_835);
    bool _841 = _837 || _839;
    bool _843 = isnan(0.001000000047497451305389404296875);
    bool _845 = _841 || _843;
    float _847 = _831 * 0.01745329238474369049072265625;
    float _849 = _767 * 6.283185482025146484375;
    float _851 = cos(_849);
    float _853 = _813 * 0.699999988079071044921875;
    float _855 = _845 ? _829 : 0.001000000047497451305389404296875;
    float _857 = fma(_699, 1.10000002384185791015625, _853);
    float _859 = abs(_855);
    bool _861 = _859 == 0.0;
    float _863 = _775 * 6.283185482025146484375;
    float _865 = sin(_863);
    float _867 = _825 * _497;
    float _869 = abs(_857);
    bool _871 = _869 != 0.0;
    bool _873 = isnan(_869);
    bool _875 = _871 || _873;
    bool _877 = isnan(0.0);
    bool _879 = _875 || _877;
    float _881 = abs(_855);
    bool _883 = _881 == 0.0;
    bool _885 = !_879;
    bool _887 = _883 && _885;
    float _889 = _775 * 6.283185482025146484375;
    float _891 = cos(_889);
    float _893 = -_867;
    float _895 = fma(_851, _501, _893);
    float _897 = _851 * _497;
    float _899 = _851;
    float _901 = _809;
    int _903 = as_type<int>(_847);
    int _905 = _879 ? (-1) : 0;
    bool _907 = _861;
    float _909 = _755;
    if (_421)
    {
        _899 = _147;
    }
    float _911 = _899;
    float _913 = _895 + 0.02999999932944774627685546875;
    float _915 = fma(_825, _501, _897);
    float _917 = _809 * 6.283185482025146484375;
    float _919 = sin(_917);
    float _921 = _847 * 0.15915493667125701904296875;
    float _923 = _865 * _913;
    float _925 = fma(_777, -0.100000001490116119384765625, _915);
    bool _927 = false;
    int _929 = as_type<int>(_925);
    float _931 = _911;
    if (_887)
    {
        bool _933 = as_type<int>(_855) >= 0;
        _927 = _933;
    }
    bool _935 = _927;
    float _937 = _809 * 6.283185482025146484375;
    float _939 = cos(_937);
    float _941 = -_923;
    float _943 = fma(_891, _711, _941);
    float _945 = _891 * _913;
    float _947 = _521 * 6.283185482025146484375;
    float _949 = cos(_947);
    float _951 = _943 * _919;
    if (_421)
    {
        _901 = _145;
    }
    float _953 = _901;
    float _955 = _921 * 6.283185482025146484375;
    float _957 = sin(_955);
    float _959 = _943 * _939;
    float _961 = -_951;
    float _963 = fma(_939, _925, _961);
    int _965 = as_type<int>(_939);
    float _967 = _953;
    if (_421)
    {
        _903 = 0;
        _965 = 0;
    }
    int _969 = _903;
    int _971 = _965;
    float _973 = fma(_919, _925, _959);
    int _975 = _969;
    int _977 = _971;
    if (_887)
    {
        int _979 = _935 ? 0 : 1078530011;
        _929 = _979;
    }
    int _981 = _929;
    float _983 = _921 * 6.283185482025146484375;
    float _985 = cos(_983);
    int _987 = _981;
    if (!_421)
    {
        float _989 = _145 * 3.1415927410125732421875;
        float _991 = _989 * 0.15915493667125701904296875;
        float _993 = _147 * 3.1415927410125732421875;
        float _995 = _993 * 0.15915493667125701904296875;
        float _997 = _991 * 6.283185482025146484375;
        float _999 = sin(_997);
        float _1001 = _995 * 6.283185482025146484375;
        float _1003 = sin(_1001);
        _975 = 2;
        _977 = 1;
        _967 = _999;
        _931 = _1003;
    }
    int _1005 = _975;
    int _1007 = _977;
    float _1009 = _967;
    float _1011 = _931;
    float _1013 = _513 * 0.699999988079071044921875;
    if (_887)
    {
        int _1015 = int(0x80000000) & as_type<int>(_857);
        int _1017 = _981 | _1015;
        _599 = as_type<float>(_1017);
    }
    float _1019 = _599;
    bool _1021 = !_879;
    bool _1023 = _1021 && _861;
    float _1025 = _1019;
    float _1027 = _1019;
    if (!_1023)
    {
        float _1029 = abs(_857);
        bool _1031 = _1029 != as_type<float>(0x7f800000u /* inf */);
        bool _1033 = isnan(_1029);
        bool _1035 = _1031 || _1033;
        bool _1037 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1039 = _1035 || _1037;
        float _1041 = abs(_855);
        bool _1043 = _1041 == as_type<float>(0x7f800000u /* inf */);
        float _1045 = abs(_855);
        bool _1047 = _1045 == as_type<float>(0x7f800000u /* inf */);
        bool _1049 = !_1039;
        bool _1051 = _1047 && _1049;
        if (_1051)
        {
            bool _1053 = as_type<int>(_855) >= 0;
            _905 = _1053 ? (-1) : 0;
        }
        int _1055 = _905;
        if (_1051)
        {
            _987 = 1075235812;
        }
        int _1057 = _987;
        int _1059 = _1057;
        if (_1051)
        {
            int _1061 = ~_1055;
            int _1063 = (_1061 != 0) ? _1057 : 1061752795;
            _1059 = _1063;
        }
        int _1065 = _1059;
        if (_1051)
        {
            int _1067 = int(0x80000000) & as_type<int>(_857);
            int _1069 = _1065 | _1067;
            _1025 = as_type<float>(_1069);
        }
        float _1071 = _1025;
        bool _1073 = !_1039;
        bool _1075 = _1073 && _1043;
        _1027 = _1071;
        if (!_1075)
        {
            float _1077 = abs(_857);
            float _1079 = abs(_855);
            float _1081 = precise::max(_1077, _1079);
            float _1083 = abs(_857);
            float _1085 = abs(_855);
            float _1087 = precise::min(_1083, _1085);
            float _1089 = 1.0 / _1081;
            float _1091 = abs(_857);
            float _1093 = abs(_855);
            bool _1095 = _1091 > _1093;
            bool _1097 = as_type<int>(_855) >= 0;
            float _1099 = _1087 * _1089;
            float _1101 = _1099 * _1099;
            float _1103 = _1101 + 11.33538818359375;
            float _1105 = fma(_1101, _1103, 28.84246826171875);
            float _1107 = fma(_1101, _1105, 19.6966705322265625);
            float _1109 = fma(_1101, -0.82336294651031494140625, -5.674867153167724609375);
            float _1111 = fma(_1101, _1109, -6.565555095672607421875);
            float _1113 = 1.0 / _1107;
            float _1115 = _1101 * _1111;
            float _1117 = abs(_857);
            float _1119 = abs(_855);
            float _1121 = _1117 + _1119;
            int _1123 = as_type<int>(_857) & int(0x80000000);
            float _1125 = _1099 * _1115;
            bool _1127 = _1121 > as_type<float>(0x7f800000u /* inf */);
            bool _1129 = isnan(_1121);
            bool _1131 = _1127 || _1129;
            bool _1133 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1135 = _1131 || _1133;
            float _1137 = fma(_1125, _1113, _1099);
            float _1139 = _1137;
            _1027 = _1121;
            if (_1095)
            {
                float _1141 = -_1137;
                float _1143 = _1141 + 1.57079637050628662109375;
                _1139 = _1143;
            }
            float _1145 = _1139;
            int _1147 = as_type<int>(_1145);
            if (!_1097)
            {
                float _1149 = -_1145;
                float _1151 = _1149 + 3.1415927410125732421875;
                _1147 = as_type<int>(_1151);
            }
            int _1153 = _1147;
            if (!_1135)
            {
                int _1155 = _1123 | _1153;
                _1027 = as_type<float>(_1155);
            }
        }
    }
    float _1157 = _1027;
    float _1159 = _973 + 0.0199999995529651641845703125;
    float _1161 = fma(_777, 0.100000001490116119384765625, _963);
    float _1163 = _1013 * 0.15915493667125701904296875;
    float _1165 = in.m_56.z;
    float _1167 = _1159 * _957;
    float _1169 = _1159 * _985;
    float _1171 = fma(_865, _711, _945);
    float _1173 = _1157 + 1.57079637050628662109375;
    float _1175 = -_1167;
    float _1177 = fma(_1161, _985, _1175);
    float _1179 = fma(_1161, _957, _1169);
    float _1181 = _1171 + (-0.02999999932944774627685546875);
    float _1183 = _1173 * (-0.15915493667125701904296875);
    float _1185 = fma(_647, (*spvDescriptorSet0.vp_c9)._m0[194].x, _1177);
    float _1187 = _821 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1189 = in.m_62.w;
    float _1191 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1181);
    float _1193 = _833 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1195 = _513 * 1.10000002384185791015625;
    float _1197 = _819 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1199 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1185);
    float _1201 = in.m_64.w;
    float _1203 = _1183 * 6.283185482025146484375;
    float _1205 = cos(_1203);
    float _1207 = _1187 * _1191;
    float _1209 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1179);
    float _1211 = _1197 * _1199;
    float _1213 = _1195 * 0.15915493667125701904296875;
    float _1215 = _1207 * _317;
    float _1217 = _1193 * _1209;
    float _1219 = _1207 * _325;
    float _1221 = _1183 * 6.283185482025146484375;
    float _1223 = sin(_1221);
    float _1225 = fma(_1211, _289, _1215);
    float _1227 = _1165 * 6.283185482025146484375;
    float _1229 = fma(_1211, _293, _1219);
    float _1231 = fma(_191, _375, _439);
    float _1233 = -_1217;
    float _1235 = fma(_1233, _337, _1225);
    float _1237 = fma(_197, _375, _441);
    float _1239 = _1227 * 0.15915493667125701904296875;
    float _1241 = _1163 * 6.283185482025146484375;
    float _1243 = sin(_1241);
    float _1245 = -_1217;
    float _1247 = fma(_1245, _341, _1229);
    float _1249 = _1235 * _1205;
    float _1251 = _1231 + _1189;
    float _1253 = fma(_949, 1.2000000476837158203125, _569);
    float _1255 = _199 * 3.3333332538604736328125;
    float _1257 = _1237 + _1201;
    float _1259 = _1213 * 6.283185482025146484375;
    float _1261 = sin(_1259);
    float _1263 = _1235 * _1223;
    float _1265 = fma(_1247, _1223, _1249);
    float _1267 = -(*spvDescriptorSet0.vp_c9)._m0[192].w;
    float _1269 = _1267 + 1.0;
    float _1271 = -_1263;
    float _1273 = fma(_1247, _1205, _1271);
    float _1275 = _1251 + _1265;
    float _1277 = _1239 * 6.283185482025146484375;
    float _1279 = sin(_1277);
    float _1281 = _1257 + _1273;
    float _1283 = fma(_1253, (*spvDescriptorSet0.vp_c9)._m0[191].z, _1275);
    float _1285 = in.m_74.y;
    float _1287 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1289 = _1283 + _1287;
    float _1291 = _1239 * 6.283185482025146484375;
    float _1293 = cos(_1291);
    float _1295 = _1243 + _1261;
    float _1297 = fma(_1295, (*spvDescriptorSet0.vp_c9)._m0[191].z, _1281);
    float _1299 = _1279 * _1289;
    float _1301 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1303 = _1297 + _1301;
    float _1305 = _1293 * _1289;
    float _1307 = -_1299;
    float _1309 = fma(_1293, _1303, _1307);
    float _1311 = fma(_1279, _1303, _1305);
    float _1313 = _1309 + (*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1315 = _1311 + (*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1317 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1319 = _1313 + _1317;
    float _1321 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1323 = _1315 + _1321;
    float _1325 = _1319 * _1319;
    float _1327 = fma(_1323, _1323, _1325);
    float _1329 = sqrt(_1327);
    bool _1331 = _1329 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1333 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1335 = _1329 + _1333;
    float _1337 = 0.0 + _1255;
    float _1339 = precise::clamp(_1337, 0.0, 1.0);
    float _1341 = -_1255;
    float _1343 = _1341 + 3.3333332538604736328125;
    float _1345 = precise::clamp(_1343, 0.0, 1.0);
    float _1347 = precise::min(_1339, _1345);
    float _1349 = _373 + _1285;
    float _1351 = _1201;
    float _1353 = 5.0;
    float _1355 = _1165;
    if (_1331)
    {
        float _1357 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1351 = _1357;
    }
    float _1359 = _1351;
    float _1361 = fma(_1347, -5.0, 5.0);
    if (_1331)
    {
        float _1363 = rsqrt(_1327);
        _1353 = _1363;
    }
    float _1365 = _1353;
    float _1367 = _1359;
    if (_1331)
    {
        float _1369 = _1335 * _1359;
        _1367 = _1369;
    }
    float _1371 = _1367;
    float _1373 = _1207 * _307;
    float _1375 = _1371;
    if (_1331)
    {
        float _1377 = _1371 * 0.15915493667125701904296875;
        _1375 = _1377;
    }
    float _1379 = _1375;
    float _1381 = fma(_1211, _285, _1373);
    float _1383 = _1283;
    if (_1331)
    {
        float _1385 = _1379 * 6.283185482025146484375;
        float _1387 = sin(_1385);
        _1383 = _1387;
    }
    float _1389 = _1383;
    float _1391 = -_1217;
    float _1393 = fma(_1391, _333, _1381);
    float _1395 = _1349 + _1393;
    float _1397 = -_1361;
    float _1399 = fma(_1397, _1269, _1395);
    float _1401 = _1395;
    float _1403 = _1399;
    if (!_1331)
    {
        _1401 = _1313;
    }
    float _1405 = _1401;
    float _1407 = _1405;
    if (_1331)
    {
        float _1409 = _1399 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _601 = _1409;
    }
    float _1411 = _601;
    float _1413 = _1411;
    float _1415 = _1389;
    if (_1331)
    {
        float _1417 = fma(_1389, _1411, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1413 = _1417;
    }
    float _1419 = _1413;
    float _1421 = _1419;
    if (!_1331)
    {
        _1415 = _1315;
    }
    float _1423 = _1415;
    float _1425 = _1423;
    if (_1331)
    {
        float _1427 = _1365 * _1419;
        _1421 = _1427;
    }
    float _1429 = _1421;
    if (_1331)
    {
        float _1431 = fma(_1323, _1429, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1425 = _1431;
    }
    float _1433 = _1425;
    if (_1331)
    {
        float _1435 = fma(_1319, _1429, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1407 = _1435;
    }
    float _1437 = _1407;
    float _1439 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1441 = _1433 + _1439;
    float _1443 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1445 = _1437 + _1443;
    float _1447 = fma(_1441, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1449 = fma(_1445, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _5032 = float2(_1447, _1449);
    float _1451 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_5032, float2(0.0), isnan(_5032)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_5032, float2(0.0), isnan(_5032)), level(0.0)).x;
    float _1453 = in.m_70.x;
    float _1455 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    int _1457 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1459 = _1457 != 0;
    int _1461 = 2;
    if (_1459)
    {
        bool _1463 = _145 > 0.5;
        _907 = _1463;
    }
    bool _1465 = _907;
    float _1467 = _1453;
    if (!_1459)
    {
        _909 = _1453;
    }
    float _1469 = _909;
    float _1471 = fma(_1451, 100.0, _1349);
    float _1473 = _1471 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1475 = _1471 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1477 = _1471 + _1455;
    float _1479 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1473);
    float _1481 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1475);
    float _1483 = in.m_56.w;
    float _1485 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1479);
    float _1487 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1481);
    float _1489 = _1485 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1491 = _1487 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1493 = 1.0 / _1489;
    float _1495 = _1491 + _1489;
    float _1497 = _1495 * _1493;
    float _1499 = _1497 * 0.5;
    float _1501 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1503 = fma(_1499, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1501);
    float _1505 = 1.0 / _1503;
    float _1507 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1509 = _1505 * _1507;
    bool _1511 = _1509 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1513 = _1509 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1515 = !_1511;
    int _1517 = _1515 ? 0 : 1;
    float _1519 = _1469;
    if (!_1511)
    {
        _1461 = 1;
    }
    int _1521 = _1461;
    int _1523 = _1521;
    if (!_1513)
    {
        _1523 = _1517;
    }
    int _1525 = _1523;
    int _1527 = _1525 << 6;
    int _1529 = _1527 + 96;
    uint _1532 = uint(int(uint(_1529) >> uint(2)));
    uint _1534 = uint(int(uint(int(_1532)) >> uint(2)));
    int _1536 = int(_1532) & 3;
    float _1538 = (*spvDescriptorSet0.vp_c15)._m0[int(_1534)][_1536];
    int _1540 = int(_1532) + 1;
    uint _1542 = uint(int(uint(_1540) >> uint(2)));
    int _1544 = _1540 & 3;
    float _1546 = (*spvDescriptorSet0.vp_c15)._m0[int(_1542)][_1544];
    int _1548 = _1527 + 104;
    uint _1550 = uint(int(uint(_1548) >> uint(2)));
    uint _1552 = uint(int(uint(int(_1550)) >> uint(2)));
    int _1554 = int(_1550) & 3;
    float _1556 = (*spvDescriptorSet0.vp_c15)._m0[int(_1552)][_1554];
    int _1558 = int(_1550) + 1;
    uint _1560 = uint(int(uint(_1558) >> uint(2)));
    int _1562 = _1558 & 3;
    float _1564 = (*spvDescriptorSet0.vp_c15)._m0[int(_1560)][_1562];
    int _1566 = _1527 + 48;
    uint _1568 = uint(int(uint(_1566) >> uint(2)));
    uint _1570 = uint(int(uint(int(_1568)) >> uint(2)));
    int _1572 = int(_1568) & 3;
    float _1574 = (*spvDescriptorSet0.vp_c15)._m0[int(_1570)][_1572];
    int _1576 = int(_1568) + 1;
    uint _1578 = uint(int(uint(_1576) >> uint(2)));
    int _1580 = _1576 & 3;
    float _1582 = (*spvDescriptorSet0.vp_c15)._m0[int(_1578)][_1580];
    int _1584 = _1527 + 64;
    uint _1586 = uint(int(uint(_1584) >> uint(2)));
    uint _1588 = uint(int(uint(int(_1586)) >> uint(2)));
    int _1590 = int(_1586) & 3;
    float _1592 = (*spvDescriptorSet0.vp_c15)._m0[int(_1588)][_1590];
    int _1594 = int(_1586) + 1;
    uint _1596 = uint(int(uint(_1594) >> uint(2)));
    int _1598 = _1594 & 3;
    float _1600 = (*spvDescriptorSet0.vp_c15)._m0[int(_1596)][_1598];
    int _1602 = _1527 + 56;
    uint _1604 = uint(int(uint(_1602) >> uint(2)));
    uint _1606 = uint(int(uint(int(_1604)) >> uint(2)));
    int _1608 = int(_1604) & 3;
    float _1610 = (*spvDescriptorSet0.vp_c15)._m0[int(_1606)][_1608];
    int _1612 = int(_1604) + 1;
    uint _1614 = uint(int(uint(_1612) >> uint(2)));
    int _1616 = _1612 & 3;
    float _1618 = (*spvDescriptorSet0.vp_c15)._m0[int(_1614)][_1616];
    int _1620 = _1527 + 72;
    uint _1622 = uint(int(uint(_1620) >> uint(2)));
    uint _1624 = uint(int(uint(int(_1622)) >> uint(2)));
    int _1626 = int(_1622) & 3;
    float _1628 = (*spvDescriptorSet0.vp_c15)._m0[int(_1624)][_1626];
    int _1630 = int(_1622) + 1;
    uint _1632 = uint(int(uint(_1630) >> uint(2)));
    int _1634 = _1630 & 3;
    float _1636 = (*spvDescriptorSet0.vp_c15)._m0[int(_1632)][_1634];
    float _1638 = _1477 * _1546;
    float _1640 = fma(_1251, _1538, _1638);
    float _1642 = fma(_1257, _1556, _1640);
    float _1644 = _1642 + _1564;
    int _1646 = _1527 + 80;
    uint _1648 = uint(int(uint(_1646) >> uint(2)));
    uint _1650 = uint(int(uint(int(_1648)) >> uint(2)));
    int _1652 = int(_1648) & 3;
    float _1654 = (*spvDescriptorSet0.vp_c15)._m0[int(_1650)][_1652];
    int _1656 = int(_1648) + 1;
    uint _1658 = uint(int(uint(_1656) >> uint(2)));
    int _1660 = _1656 & 3;
    float _1662 = (*spvDescriptorSet0.vp_c15)._m0[int(_1658)][_1660];
    float _1664 = _1477 * _1582;
    float _1666 = 1.0 / _1644;
    float _1668 = fma(_1251, _1574, _1664);
    int _1670 = _1527 + 88;
    uint _1672 = uint(int(uint(_1670) >> uint(2)));
    uint _1674 = uint(int(uint(int(_1672)) >> uint(2)));
    int _1676 = int(_1672) & 3;
    float _1678 = (*spvDescriptorSet0.vp_c15)._m0[int(_1674)][_1676];
    int _1680 = int(_1672) + 1;
    uint _1682 = uint(int(uint(_1680) >> uint(2)));
    int _1684 = _1680 & 3;
    float _1686 = (*spvDescriptorSet0.vp_c15)._m0[int(_1682)][_1684];
    float _1688 = _1477 * _1600;
    float _1690 = fma(_1251, _1592, _1688);
    float _1692 = fma(_1257, _1610, _1668);
    float _1694 = _1692 + _1618;
    float _1696 = fma(_1251, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1698 = fma(_1257, _1628, _1690);
    float _1700 = _1694 * _1666;
    float _1702 = floor(_1696);
    float _1704 = _1698 + _1636;
    bool _1706 = _1700 >= 0.0;
    float _1708 = _1704 * _1666;
    bool _1710 = _1700 <= 1.0;
    bool _1712 = _1710 && _1706;
    float _1714 = fma(_1257, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    bool _1716 = _1708 >= 0.0;
    bool _1718 = _1716 && _1712;
    float _1720 = floor(_1714);
    bool _1722 = _1708 <= 1.0;
    bool _1724 = _1722 && _1718;
    float _1726 = _1477 * _1662;
    int _1728 = as_type<int>(_1662);
    float _1730 = _1694;
    if (_1459)
    {
        float _1732 = -_1453;
        float _1734 = _1732 + 1.0;
        _1728 = as_type<int>(_1734);
    }
    int _1736 = _1728;
    float _1738 = fma(_1251, _1654, _1726);
    float _1740 = fma(_1257, _1678, _1738);
    if (_1724)
    {
        float _1742 = float(_1525);
        _1730 = _1742;
    }
    float _1744 = _1730;
    float _1746 = -_1702;
    float _1748 = _1696 + _1746;
    float _1750 = _1740 + _1686;
    float _1752 = -_1720;
    float _1754 = _1714 + _1752;
    float _1756 = _1726;
    if (_1724)
    {
        float _1758 = rint(_1744);
        float _1760 = precise::max(_1758, 0.0);
        uint _1762 = uint(_1760);
        uint _1764 = clamp(_1762, 0u, 65535u);
        _1756 = as_type<float>(_1764);
    }
    float _1766 = _1756;
    float _1768 = _1750 * _1666;
    float2 _5564 = float2(_1748, _1754);
    float _1770 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5564, float2(0.0), isnan(_5564)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5564, float2(0.0), isnan(_5564)), level(0.0)).x;
    float _1772 = _1708;
    if (_1724)
    {
        float3 _5579 = float3(_1700, _1708, float(as_type<int>(_1766)));
        float3 _5583 = select(_5579, float3(0.0), isnan(_5579));
        float _1774 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5583.xy, uint(rint(_5583.z)), _1768, level(0.0));
        _1772 = _1774;
    }
    float _1776 = _1772;
    if (_1459)
    {
        float _1778 = _1465 ? as_type<float>(_1736) : _1453;
        _1519 = _1778;
    }
    float _1780 = _1519;
    float _1782 = -_749;
    float _1784 = _1782 + 1.0;
    bool _1786 = _147 > 0.5;
    out.m_76.x = _365;
    int _1788 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1790 = _1788 != 0;
    float _1792 = _147 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1794 = _1786 ? as_type<int>(_1784) : as_type<int>(_749);
    float _1796 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1798 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1800 = _1798 != 0;
    float _1802 = _1790 ? as_type<float>(_1794) : _749;
    float _1804 = in.m_78.x;
    float _1806 = in.m_78.y;
    float _1808 = in.m_78.z;
    float _1810 = in.m_78.w;
    bool _1812 = _1483 > 0.5;
    float _1814 = _145 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1816 = _1165 > 0.5;
    float _1818 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1820 = _1812 ? as_type<int>(_1784) : as_type<int>(_749);
    float _1822 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1824 = _1816 ? as_type<int>(_1784) : as_type<int>(_749);
    float _1826 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1828 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1830 = _1828 != 0;
    float _1832 = 0.0;
    if (_1800)
    {
        float _1834 = in.m_56.z;
        _1832 = _1834;
    }
    float _1836 = _1832;
    int _1838 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1840 = _1838 != 0;
    float _1842 = fma(_1792, -2.0, _1826);
    float _1844 = -_1822;
    float _1846 = fma(_1814, 2.0, _1844);
    float _1848 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1850 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1852 = _1830 ? as_type<float>(_1824) : _749;
    float _1854 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1856 = _1840 ? as_type<float>(_1820) : _749;
    float _1858 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _1860 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1862 = _1860 != 0;
    float _1864 = _317 * _1808;
    float _1866 = _1850 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1868 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1870 = _1868 != 0;
    float _1872 = _1854 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1874 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1876 = _1874 != 0;
    float _1878 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1880 = _1858 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1882 = _307 * _1808;
    float _1884 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1886 = _1862 ? as_type<float>(_1824) : _749;
    float _1888 = fma(_289, _1804, _1864);
    float _1890 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1892 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    out.m_80.x = _1866;
    out.m_80.y = _1872;
    out.m_80.z = _1880;
    out.m_80.w = _1878;
    float _1894 = _1884 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1896 = _1890 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1898 = _1892 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1900 = _325 * _1808;
    float _1902 = _1796 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1904 = _1818 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1906 = fma(_285, _1804, _1882);
    out.m_82.x = _1894;
    out.m_82.y = _1896;
    out.m_82.z = _1898;
    float _1908 = fma(_293, _1804, _1900);
    float _1910 = fma(_1904, _1802, -0.5);
    bool _1912 = _1862;
    int _1914 = as_type<int>(_1842);
    float _1916 = _1898;
    if (_1800)
    {
        bool _1918 = _1836 > 0.5;
        _1912 = _1918;
    }
    bool _1920 = _1912;
    float _1922 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _1924 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1926 = -_1806;
    float _1928 = fma(_337, _1926, _1888);
    float _1930 = -_1806;
    float _1932 = fma(_333, _1930, _1906);
    float _1934 = -_1806;
    float _1936 = fma(_341, _1934, _1908);
    float _1938 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1924);
    float _1940 = fma(_1902, _1856, -0.5);
    float _1942 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1944 = _1848 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1946 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1938);
    float _1948 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1842);
    float _1950 = _1946;
    int _1952 = as_type<int>(_1932);
    if (_1800)
    {
        float _1954 = -_1453;
        float _1956 = _1954 + 1.0;
        _1914 = as_type<int>(_1956);
    }
    int _1958 = _1914;
    if (!_1800)
    {
        _1916 = _1453;
    }
    float _1960 = _1916;
    float _1962 = fma(_1886, _1944, -0.5);
    float _1964 = -_1948;
    float _1966 = fma(_1946, _1910, _1964);
    out.m_84.x = _1928;
    out.m_84.y = _1932;
    out.m_84.z = _1936;
    float _1968 = _1960;
    float _1970 = _1962;
    if (_1800)
    {
        float _1972 = _1920 ? as_type<float>(_1958) : _1453;
        _1968 = _1972;
    }
    float _1974 = _1968;
    float _1976 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    bool _1978 = _1005 != 2;
    float _1980 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _1982 = _1922 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    bool _1984 = _1007 != 1;
    float _1986 = _1009 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _1988 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    if (!_1870)
    {
        _1950 = _1453;
    }
    float _1990 = _1950;
    float _1992 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1994 = _1990;
    if (_1870)
    {
        float _1996 = -_1453;
        float _1998 = _1996 + 1.0;
        _1952 = as_type<int>(_1998);
    }
    int _2000 = _1952;
    float _2002 = -_1980;
    float _2004 = fma(_1986, 2.0, _2002);
    float _2006 = _1942 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2008 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2010 = fma(_1009, (*spvDescriptorSet0.vp_c9)._m0[93].z, _1988);
    int _2012 = _2000;
    if (_1870)
    {
        float _2014 = _1786 ? as_type<float>(_2000) : _1453;
        _1994 = _2014;
    }
    float _2016 = _1994;
    if (_1876)
    {
        float _2018 = -_1453;
        float _2020 = _2018 + 1.0;
        _2012 = as_type<int>(_2020);
    }
    int _2022 = _2012;
    float _2024 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2026 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _2028 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2008);
    if (_1876)
    {
        float _2030 = _1786 ? as_type<float>(_2022) : _1453;
        _1467 = _2030;
    }
    float _2032 = _1467;
    float _2034 = _1976 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _2036 = fma(_1011, (*spvDescriptorSet0.vp_c9)._m0[93].w, _2026);
    float _2038 = fma(_2006, _1780, -0.5);
    float _2040 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _2042 = _1011 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _2044 = _1992 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2046 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2028);
    float _2048 = -_151;
    float _2050 = fma(_2048, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1846);
    float _2052 = fma(_2034, _2032, -0.5);
    float _2054 = fma(_2042, -2.0, _2040);
    float _2056 = _2024 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2058 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[92].z, _2010);
    float _2060 = -_151;
    float _2062 = fma(_2060, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2004);
    float _2064 = fma(_2046, _2038, _2050);
    float _2066 = _2046;
    float _2068 = _2058;
    float _2070 = _2036;
    if (_1978)
    {
        _2066 = _145;
    }
    float _2072 = _2066;
    float _2074 = fma(_2044, _1974, -0.5);
    float _2076 = _2072;
    if (!_1978)
    {
        _2076 = _1165;
    }
    float _2078 = _2076;
    float _2080 = fma(_2058, _2052, _2062);
    float _2082 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2084 = _2078;
    if (!_1984)
    {
        _2068 = _147;
    }
    float _2086 = _2068;
    float _2088 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[91].y, _2054);
    float _2090 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[92].w, _2036);
    float _2092 = _2078 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2094 = _2086;
    if (!_1984)
    {
        _2070 = _1165;
    }
    float _2096 = _2070;
    float _2098 = fma(_1852, _1982, -0.5);
    float _2100 = _2096;
    if (!_1984)
    {
        _2084 = _2086;
    }
    float _2102 = _2084;
    float _2104 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2106 = _2102;
    if (_1984)
    {
        _2094 = _145;
    }
    float _2108 = _2094;
    float _2110 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (_1984)
    {
        _2100 = _147;
    }
    float _2112 = _2100;
    float _2114 = -_2088;
    float _2116 = fma(_2090, _2098, _2114);
    float _2118 = fma(_2108, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2104);
    float _2120 = fma(_2112, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2110);
    float _2122 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    if (_1984)
    {
        _2106 = _145;
    }
    float _2124 = _2106;
    float _2126 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    if (_1984)
    {
        _1355 = _147;
    }
    float _2128 = _1355;
    float _2130 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2132 = fma(_2056, _2016, -0.5);
    float _2134 = _2124 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2136 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2122);
    float _2138 = _2128 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _2140 = _1179 != 0.0;
    bool _2142 = isnan(_1179);
    bool _2144 = _2140 || _2142;
    bool _2146 = isnan(0.0);
    bool _2148 = _2144 || _2146;
    float _2150 = -_2130;
    float _2152 = fma(_2134, 2.0, _2150);
    float _2154 = fma(_2138, -2.0, _2126);
    bool _2156 = _1185 == 0.0;
    bool _2158 = !_2148;
    bool _2160 = _2156 && _2158;
    float _2162 = in.m_86.x;
    float _2164 = in.m_86.y;
    float _2166 = in.m_86.z;
    float _2168 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2082);
    float _2170 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _2172 = _1171 == 0.02999999932944774627685546875;
    bool _2174 = _2172 && _2160;
    float _2176 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2120);
    float _2178 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2154);
    float _2180 = -_2170;
    float _2182 = fma(_2092, 2.0, _2180);
    float _2184 = -_151;
    float _2186 = fma(_2184, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2152);
    if (!_1978)
    {
        _169 = _145;
    }
    float _2188 = _169;
    float _2190 = -_2178;
    float _2192 = fma(_2176, _1940, _2190);
    float _2194 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2118);
    float _2196 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2198 = _2064 + 0.5;
    float _2200 = _2188 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2202 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2136);
    float _2204 = -_151;
    float _2206 = fma(_2204, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2182);
    float _2208 = _2192 + 0.5;
    float _2210 = fma(_2200, -2.0, _2196);
    float _2212 = fma(_2194, _2074, _2186);
    float _2214 = fma(_2202, _2132, _2206);
    float _2216 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2168);
    float _2218 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2210);
    float _2220 = _1966 + 0.5;
    float _2222 = _2192;
    float _2224 = _2218;
    float _2226 = _2202;
    float _2228 = _2162;
    if (_2174)
    {
        _2222 = _2162;
    }
    float _2230 = _2222;
    float _2232 = _2212 + 0.5;
    float _2234 = -_2218;
    float _2236 = fma(_2216, _1962, _2234);
    float _2238 = _2230;
    if (_2174)
    {
        _2224 = _2166;
    }
    float _2240 = _2224;
    float _2242 = _2240;
    if (!_2174)
    {
        float _2244 = fma(_1181, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2166);
        _2242 = _2244;
    }
    float _2246 = _2242;
    if (_2174)
    {
        _2226 = _2230;
    }
    float _2248 = _2226;
    out.m_88.x = _2198;
    out.m_88.y = _2220;
    out.m_88.z = _2232;
    out.m_88.w = _2208;
    float _2250 = _2248;
    if (!_2174)
    {
        _2238 = _2162;
    }
    float _2252 = _2238;
    float _2254 = _2080 + 0.5;
    if (_2174)
    {
        _2228 = _2164;
    }
    float _2256 = _2228;
    float _2258 = _2116 + 0.5;
    float _2260 = _2214 + 0.5;
    float _2262 = _2256;
    if (!_2174)
    {
        float _2264 = fma(_1185, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2252);
        _2250 = _2264;
    }
    float _2266 = _2250;
    if (_2174)
    {
        _1970 = _2256;
    }
    float _2268 = _1970;
    float _2270 = _2236 + 0.5;
    float _2272 = _2268;
    if (!_2174)
    {
        _2262 = _2164;
    }
    float _2274 = _2262;
    float _2276 = _1806 * _2166;
    out.m_90.x = _2254;
    out.m_90.y = _2258;
    float _2278 = _1808 * _2252;
    float _2280 = _2208;
    if (_1331)
    {
        float _2282 = _1379 * 6.283185482025146484375;
        float _2284 = cos(_2282);
        _2280 = _2284;
    }
    float _2286 = _2280;
    if (!_2174)
    {
        float _2288 = fma(_1179, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2274);
        _2272 = _2288;
    }
    float _2290 = _2272;
    float _2292 = -_2276;
    float _2294 = fma(_1808, _2274, _2292);
    float _2296 = -_2278;
    float _2298 = fma(_1804, _2166, _2296);
    float _2300 = _1804 * _2274;
    float _2302 = _317 * _2246;
    float _2304 = _307 * _2246;
    float _2306 = _325 * _2246;
    float _2308 = -_2300;
    float _2310 = fma(_1806, _2252, _2308);
    float _2312 = fma(_289, _2266, _2302);
    float _2314 = fma(_285, _2266, _2304);
    float _2316 = fma(_293, _2266, _2306);
    float _2318 = _2310 * _1810;
    float _2320 = _2294 * _1810;
    out.m_92.x = _2260;
    out.m_92.y = _2270;
    float _2322 = -_2290;
    float _2324 = fma(_341, _2322, _2316);
    float _2326 = _2318 * _317;
    float _2328 = _2318 * _307;
    float _2330 = _2318 * _325;
    float _2332 = _2298 * _1810;
    float _2334 = fma(_2320, _289, _2326);
    float _2336 = fma(_2320, _285, _2328);
    float _2338 = fma(_2320, _293, _2330);
    float _2340 = -_2290;
    float _2342 = fma(_337, _2340, _2312);
    float _2344 = -_2332;
    float _2346 = fma(_2344, _337, _2334);
    if (_1331)
    {
        float _2348 = _2286 + (-1.0);
        _309 = _2348;
    }
    float _2350 = _309;
    float _2352 = -_2332;
    float _2354 = fma(_2352, _341, _2338);
    float _2356 = _2342 * _1223;
    float _2358 = _2342 * _1205;
    float _2360 = _2350;
    if (_1331)
    {
        float _2362 = _2350 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2360 = _2362;
    }
    float _2364 = _2360;
    float _2366 = -_2332;
    float _2368 = fma(_2366, _333, _2336);
    float _2370 = -_2356;
    float _2372 = fma(_2324, _1205, _2370);
    float _2374 = fma(_2324, _1223, _2358);
    if (_1331)
    {
        float _2376 = fma(_1399, _2286, _2364);
        _1403 = _2376;
    }
    float _2378 = _1403;
    float _2380 = _1477 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    out.m_94.x = _2346;
    out.m_94.y = _2368;
    out.m_94.z = _2354;
    float _2382 = _1279 * _2374;
    float _2384 = fma(_1451, 100.0, _2378);
    float _2386 = abs(_1509);
    float _2388 = log2(_2386);
    float _2390 = fma(_1251, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2380);
    float _2392 = -_2382;
    float _2394 = fma(_1293, _2372, _2392);
    float _2396 = _2384 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2398 = _2384 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2400 = _1293 * _2374;
    float _2402 = -_2290;
    float _2404 = fma(_333, _2402, _2314);
    float _2406 = _2384 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2408 = fma(_1433, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2398);
    float _2410 = _1477 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2412 = fma(_1433, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2396);
    float _2414 = fma(_1257, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2390);
    float _2416 = fma(_1279, _2372, _2400);
    float _2418 = fma(_1251, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2410);
    float _2420 = fma(_1437, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2408);
    float _2422 = _2414 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _2424 = _2388 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2426 = fma(_1257, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2418);
    float _2428 = _2384 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2430 = trunc(_2422);
    int _2432 = int(_2430);
    float _2434 = fma(_1433, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2406);
    float _2436 = _2426 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _2438 = fma(_1437, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2412);
    float _2440 = _2420 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2442 = fma(_1433, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2428);
    float _2444 = fma(_1437, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2434);
    float _2446 = _2438 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2448 = trunc(_2436);
    int _2450 = int(_2448);
    float _2452 = _2440 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2454 = _2440 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2456 = fma(_1437, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2442);
    float _2458 = _2444 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2460 = _2440 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2462 = _2440 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2464 = fma(_2446, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2452);
    float _2466 = exp2(_2424);
    float _2468 = fma(_2446, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2454);
    float _2470 = fma(_2446, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2460);
    float _2472 = fma(_2446, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2462);
    float _2474 = _2456 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2476 = fma(_2458, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2464);
    float _2478 = fma(_2458, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2468);
    int _2480 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2482 = _2432 + _2480;
    int _2484 = _2482 + 1;
    float _2486 = fma(_2458, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2470);
    int _2488 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2490 = _2450 + _2488;
    int _2492 = _2490 + 1;
    float _2494 = fma(_2458, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2472);
    float _2496 = fma(_2474, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2476);
    float _2498 = fma(_2474, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2478);
    bool _2500 = _2484 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _2502 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2504 = _2384 + _2502;
    int _2506 = _2484 | _2492;
    float _2508 = fma(_2466, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2510 = precise::clamp(_2508, 0.0, 1.0);
    float _2512 = fma(_2474, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2486);
    bool _2514 = _2506 < 0;
    bool _2516 = _2514 || _2500;
    float _2518 = fma(_2474, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2494);
    bool _2520 = _1509 <= 8000.0;
    bool _2522 = isnan(_1509);
    bool _2524 = _2520 || _2522;
    bool _2526 = isnan(8000.0);
    bool _2528 = _2524 || _2526;
    float _2530 = float(_2528);
    float _2532 = fma(_2510, -2.0, 3.0);
    float _2534 = _2510 * _2510;
    bool _2536 = _2492 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2538 = _2536 || _2516;
    float _2540 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2542 = _1433 + _2540;
    float _2544 = _2504 * _2504;
    float _2546 = _2534 * _2532;
    out.gl_Position.x = _2512;
    out.gl_Position.y = _2496;
    out.gl_Position.z = _2498;
    out.gl_Position.w = _2518;
    float _2548 = fma(_2542, _2542, _2544);
    float _2550 = -_2546;
    float _2552 = _2550 + 1.0;
    float _2554 = fma(_2552, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2546);
    float _2556 = _2530 * _2554;
    float _2558 = _2512;
    float _2560 = _2496;
    float _2562 = _2498;
    float _2564 = _2518;
    float _2566 = _2552;
    float _2568 = _2436;
    if (_2538)
    {
        _2558 = 1.0;
    }
    float _2570 = _2558;
    float _2572 = _2570;
    if (!_2538)
    {
        int _2574 = _2492 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2576 = _2574 + _2484;
        float _2578 = floor(_2436);
        int _2580 = _2576 << 2;
        uint _2582 = uint(int(uint(_2576) >> uint(2)));
        int _2584 = 12 & _2580;
        int _2586 = int(_2582) << 4;
        int _2588 = _2586 + _2584;
        float _2590 = floor(_2422);
        float _2592 = -_2578;
        float _2594 = _2436 + _2592;
        int _2596 = _2588 + 400;
        uint _2598 = uint(int(uint(_2596) >> uint(2)));
        uint _2600 = uint(int(uint(int(_2598)) >> uint(2)));
        int _2602 = int(_2598) & 3;
        float _2604 = (*spvDescriptorSet0.vp_c15)._m0[int(_2600)][_2602];
        float _2606 = -_2590;
        float _2608 = _2422 + _2606;
        float _2610 = rint(_2604);
        float _2612 = precise::max(_2610, 0.0);
        uint _2614 = uint(_2612);
        uint _2616 = clamp(_2614, 0u, 65535u);
        float3 _7129 = float3(_2608, _2594, float(int(_2616)));
        float3 _7131 = select(_7129, float3(0.0), isnan(_7129));
        float _2618 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _7131.xy, uint(rint(_7131.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _7131.xy, uint(rint(_7131.z)), level(0.0)).x;
        int _2620 = _2576 << 4;
        int _2622 = _2620 + 2048;
        uint _2624 = uint(int(uint(_2622) >> uint(2)));
        uint _2626 = uint(int(uint(int(_2624)) >> uint(2)));
        int _2628 = int(_2624) & 3;
        float _2630 = (*spvDescriptorSet0.vp_c15)._m0[int(_2626)][_2628];
        int _2632 = int(_2624) + 1;
        uint _2634 = uint(int(uint(_2632) >> uint(2)));
        int _2636 = _2632 & 3;
        float _2638 = (*spvDescriptorSet0.vp_c15)._m0[int(_2634)][_2636];
        int _2640 = _2622 + 8;
        uint _2642 = uint(int(uint(_2640) >> uint(2)));
        uint _2644 = uint(int(uint(int(_2642)) >> uint(2)));
        int _2646 = int(_2642) & 3;
        float _2648 = (*spvDescriptorSet0.vp_c15)._m0[int(_2644)][_2646];
        int _2650 = int(_2642) + 1;
        uint _2652 = uint(int(uint(_2650) >> uint(2)));
        int _2654 = _2650 & 3;
        float _2656 = (*spvDescriptorSet0.vp_c15)._m0[int(_2652)][_2654];
        float _2658 = _1477 * _2638;
        float _2660 = fma(_1251, _2630, _2658);
        float _2662 = fma(_1257, _2648, _2660);
        float _2664 = _2662 + _2656;
        float _2666 = precise::clamp(_2664, 0.0, 1.0);
        float _2668 = -_2666;
        float _2670 = _2668 + _2618;
        float _2672 = fma(_2670, 500.0, 1.5);
        float _2674 = exp2(_2672);
        float _2676 = 0.0 + _2674;
        float _2678 = precise::clamp(_2676, 0.0, 1.0);
        _2560 = _2604;
        _2572 = _2678;
        _2562 = as_type<float>(_2622);
        _2564 = _2618;
    }
    float _2680 = _2560;
    float _2682 = _2572;
    float _2684 = _2562;
    float _2686 = _2564;
    float _2688 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2690 = _1437 + _2688;
    float _2692 = _2556 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2694 = -_1770;
    float _2696 = _2694 + 1.0;
    float _2698 = _2680;
    float _2700 = _2686;
    float _2702 = _2684;
    if (!_1724)
    {
        _2698 = 1.0;
    }
    float _2704 = _2698;
    float _2706 = fma(_2690, _2690, _2548);
    float _2708 = _2704;
    if (_1724)
    {
        bool _2710 = _1776 >= _1768;
        bool _2712 = isnan(_1776);
        bool _2714 = _2710 || _2712;
        bool _2716 = isnan(_1768);
        bool _2718 = _2714 || _2716;
        float _2720 = float(_2718);
        _2708 = _2720;
    }
    float _2722 = _2708;
    float _2724 = _2696 * _2692;
    float _2726 = precise::clamp(_2724, 0.0, 1.0);
    out.m_96.x = _2416;
    out.m_96.y = _2404;
    out.m_96.z = _2394;
    float _2728 = _2722 * _2682;
    float _2730 = sqrt(_2706);
    float _2732 = -_2726;
    float _2734 = fma(_2732, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_98.x = _1433;
    out.m_98.y = _2384;
    out.m_98.z = _1437;
    float _2736 = -_2728;
    float _2738 = fma(_2736, _2734, 1.0);
    float _2740 = precise::clamp(_2738, 0.0, 1.0);
    float _2742 = _2740 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_100.x = _2742;
    bool _2744 = _2730 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2746 = isnan(_2730);
    bool _2748 = _2744 || _2746;
    bool _2750 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2752 = _2748 || _2750;
    float _2754 = _2734;
    float _2756 = _2740;
    if (!_2752)
    {
        _2566 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2758 = _2566;
    float _2760 = _2758;
    float _2762 = _2758;
    if (!_2752)
    {
        _2568 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2764 = _2568;
    float _2766 = _2764;
    float _2768 = _2764;
    if (!_2752)
    {
        _2700 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2770 = _2700;
    float _2772 = _2770;
    float _2774 = _2770;
    if (!_2752)
    {
        _2702 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2776 = _2702;
    float _2778 = _2776;
    float _2780 = _2776;
    if (!_2752)
    {
        _2754 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2782 = _2754;
    float _2784 = _2782;
    float _2786 = _2782;
    if (!_2752)
    {
        _2756 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2788 = _2756;
    bool _2790 = !_2752;
    float _2792 = _2788;
    float _2794 = _2788;
    if (!_2790)
    {
        bool _2796 = _2730 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2798 = isnan(_2730);
        bool _2800 = _2796 || _2798;
        bool _2802 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2804 = _2800 || _2802;
        if (!_2804)
        {
            float _2806 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2808 = _2730 + _2806;
            float _2810 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2812 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2810;
            float _2814 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2816 = _2814 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2818 = 1.0 / _2812;
            float _2820 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2822 = _2820 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2824 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2826 = _2824 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2828 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2830 = _2828 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2832 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2834 = _2832 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2836 = _2808 * _2818;
            float _2838 = precise::clamp(_2836, 0.0, 1.0);
            float _2840 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2842 = _2840 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2844 = fma(_2838, _2816, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2846 = fma(_2838, _2842, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2848 = fma(_2838, _2822, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2850 = fma(_2838, _2826, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2852 = fma(_2838, _2830, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2854 = fma(_2838, _2834, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2768 = _2844;
            _2786 = _2852;
            _2762 = _2848;
            _2780 = _2850;
            _2774 = _2846;
            _2794 = _2854;
            _2856 = true;
        }
        else
        {
            bool _2858 = _2730 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2860 = isnan(_2730);
            bool _2862 = _2858 || _2860;
            bool _2864 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2866 = _2862 || _2864;
            if (!_2866)
            {
                _2760 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2868 = _2760;
            _2762 = _2868;
            if (!_2866)
            {
                _2766 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2870 = _2766;
            _2768 = _2870;
            if (!_2866)
            {
                _2772 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2872 = _2772;
            _2774 = _2872;
            if (!_2866)
            {
                _2778 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2874 = _2778;
            _2780 = _2874;
            if (!_2866)
            {
                _2784 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2876 = _2784;
            _2786 = _2876;
            if (!_2866)
            {
                _2792 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2878 = _2792;
            bool _2880 = !_2866;
            _2794 = _2878;
            if (!_2880)
            {
                bool _2882 = _2730 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2884 = isnan(_2730);
                bool _2886 = _2882 || _2884;
                bool _2888 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2890 = _2886 || _2888;
                if (!_2890)
                {
                    float _2892 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2894 = _2730 + _2892;
                    float _2896 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2898 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2896;
                    float _2900 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2902 = _2900 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2904 = 1.0 / _2898;
                    float _2906 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2908 = _2906 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2910 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2912 = _2910 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2914 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2916 = _2914 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2918 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2920 = _2918 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2922 = _2894 * _2904;
                    float _2924 = precise::clamp(_2922, 0.0, 1.0);
                    float _2926 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2928 = _2926 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2930 = fma(_2924, _2902, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2932 = fma(_2924, _2928, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2934 = fma(_2924, _2908, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2936 = fma(_2924, _2912, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2938 = fma(_2924, _2916, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2940 = fma(_2924, _2920, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2768 = _2930;
                    _2786 = _2938;
                    _2762 = _2934;
                    _2780 = _2936;
                    _2774 = _2932;
                    _2794 = _2940;
                    _2856 = true;
                }
                else
                {
                    _2768 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2786 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2762 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2780 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2774 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2794 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2856 = false;
    float _2942 = _2768;
    float _2944 = _2786;
    float _2946 = _2762;
    float _2948 = _2780;
    float _2950 = _2774;
    float _2952 = _2794;
    float _2954 = fma(_2404, -0.5, 0.5);
    float _2956 = precise::clamp(_2954, 0.0, 1.0);
    float _2958 = -_2942;
    float _2960 = _2958 + _2944;
    float _2962 = -_2946;
    float _2964 = _2962 + _2948;
    float _2966 = -_2950;
    float _2968 = _2966 + _2952;
    bool _2970 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2972 = fma(_2956, _2960, _2942);
    float _2974 = fma(_2956, _2964, _2946);
    float _2976 = fma(_2956, _2968, _2950);
    float _2978 = _2972 * 0.586610972881317138671875;
    out.m_52.x = 1.0;
    float _2980 = fma(_2974, 0.298911988735198974609375, _2978);
    float _2982 = fma(_2976, 0.114477999508380889892578125, _2980);
    out.m_102.x = 0.0;
    float _2984 = -_2982;
    float _2986 = _2974 + _2984;
    float _2988 = -_2982;
    float _2990 = _2972 + _2988;
    float _2992 = -_2982;
    float _2994 = _2976 + _2992;
    float _2996 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2998 = fma(_2986, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2982);
    float _3000 = fma(_2990, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2982);
    float _3002 = fma(_2994, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2982);
    out.m_100.w = _2996;
    out.m_104.x = _2998;
    out.m_104.y = _3000;
    out.m_104.z = _3002;
    if (!_2970)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3004 = -_2384;
    float _3006 = _3004 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3008 = -_1433;
    float _3010 = _3008 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3012 = -_1437;
    float _3014 = _3012 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3016 = _3006 * _3006;
    float _3018 = fma(_3010, _3010, _3016);
    float _3020 = fma(_3014, _3014, _3018);
    float _3022 = sqrt(_3020);
    float _3024 = rsqrt(_3020);
    float _3026 = -_3022;
    float _3028 = _3026 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3030 = _3028 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3032 = precise::clamp(_3030, 0.0, 1.0);
    float _3034 = _3010 * _3024;
    float _3036 = _3006 * _3024;
    float _3038 = abs(_3032);
    float _3040 = log2(_3038);
    float _3042 = _3014 * _3024;
    float _3044 = _3034 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3046 = _2404 * _3036;
    float _3048 = -_3036;
    float _3050 = -_3044;
    float _3052 = fma(_3048, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3050);
    float _3054 = fma(_2416, _3034, _3046);
    float _3056 = -_3042;
    float _3058 = fma(_3056, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3052);
    float _3060 = fma(_2394, _3042, _3054);
    float _3062 = precise::clamp(_3060, 0.0, 1.0);
    float _3064 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3066 = _3058 + _3064;
    float _3068 = _3040 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3070 = _3066 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3072 = precise::clamp(_3070, 0.0, 1.0);
    float _3074 = exp2(_3068);
    float _3076 = _3074 * _3072;
    float _3078 = _3062 * _3076;
    float _3080 = _3078 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3082 = _3078 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3084 = _3078 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_102.x = _3080;
    out.m_102.y = _3082;
    out.m_102.z = _3084;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2856 = false;
    bool _361 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _118 = in.m_49.w;
    float _120 = trunc(_118);
    int _123 = int(_120);
    bool _127 = _123 >= 1;
    float _129 = 0.0;
    float _131 = as_type<float>(_123);
    if (!_127)
    {
        _129 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _129;
    if (!_127)
    {
        out.m_52.x = 0.0;
    }
    int _135 = 0;
    if (!_127)
    {
        float _137 = _133 * 5.0;
        _135 = as_type<int>(_137);
    }
    int _139 = _135;
    if (!_127)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3141 = as_type<float>(_139);
        out.gl_Position.z = _3141;
    }
    if (!_127)
    {
        return out;
    }
    float _141 = in.m_54.w;
    float _143 = float(_123);
    float _145 = in.m_56.x;
    float _147 = in.m_56.y;
    float _149 = -_141;
    float _151 = _149 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _153 = _141 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _155 = isnan(_141);
    bool _157 = _153 || _155;
    bool _159 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _161 = _157 || _159;
    out.m_58.x = _145;
    bool _163 = _151 >= _143;
    bool _165 = !_161;
    bool _167 = _163 || _165;
    out.m_58.y = _147;
    float _169 = _147;
    if (_167)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _171 = _131;
    if (_167)
    {
        out.m_52.x = 0.0;
    }
    int _173 = 0;
    if (_167)
    {
        float _175 = _171 * 5.0;
        _173 = as_type<int>(_175);
    }
    int _177 = _173;
    if (_167)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3213 = as_type<float>(_177);
        out.gl_Position.z = _3213;
    }
    if (_167)
    {
        return out;
    }
    float _179 = in.m_60.x;
    float _181 = in.m_60.y;
    float _183 = in.m_60.z;
    float _185 = 1.0 / _143;
    float _187 = in.m_62.x;
    float _189 = in.m_62.y;
    float _191 = in.m_62.z;
    float _193 = in.m_64.x;
    float _195 = in.m_64.y;
    float _197 = in.m_64.z;
    float _199 = _151 * _185;
    float _201 = _179 * _179;
    float _203 = _181 * _181;
    float _205 = fma(_187, _187, _201);
    float _207 = fma(_189, _189, _203);
    float _209 = fma(_193, _193, _205);
    float _211 = _183 * _183;
    float _213 = fma(_195, _195, _207);
    float _215 = sqrt(_209);
    float _217 = fma(_191, _191, _211);
    float _219 = fma(_197, _197, _217);
    float _221 = sqrt(_213);
    float _223 = sqrt(_219);
    bool _225 = _215 > 0.0;
    bool _227 = _221 > 0.0;
    float _229 = _215;
    float _231 = _221;
    float _233 = _209;
    float _235 = _219;
    float _237 = _213;
    if (_225)
    {
        float _239 = rsqrt(_209);
        _229 = _239;
    }
    float _241 = _229;
    float _243 = 0.0;
    if (!_225)
    {
        _243 = 0.0;
    }
    float _245 = _243;
    bool _247 = _223 > 0.0;
    float _249 = 0.0;
    float _251 = _245;
    float _253 = _223;
    if (!_225)
    {
        _249 = 0.0;
    }
    float _255 = _249;
    float _257 = 0.0;
    float _259 = _255;
    if (!_225)
    {
        _257 = 0.0;
    }
    float _261 = _257;
    float _263 = 0.0;
    float _265 = _261;
    if (_227)
    {
        float _267 = rsqrt(_213);
        _263 = _267;
    }
    float _269 = _263;
    if (!_227)
    {
        _231 = 0.0;
    }
    float _271 = _231;
    float _273 = 0.0;
    float _275 = _271;
    if (_247)
    {
        float _277 = rsqrt(_219);
        _273 = _277;
    }
    float _279 = _273;
    float _281 = _241;
    if (_225)
    {
        float _283 = _241 * _179;
        _251 = _283;
    }
    float _285 = _251;
    if (_225)
    {
        float _287 = _241 * _187;
        _259 = _287;
    }
    float _289 = _259;
    if (_225)
    {
        float _291 = _241 * _193;
        _265 = _291;
    }
    float _293 = _265;
    bool _295 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    if (!_227)
    {
        _281 = 0.0;
    }
    float _297 = _281;
    float _299 = _297;
    if (!_247)
    {
        _233 = 0.0;
    }
    float _301 = _233;
    float _303 = _301;
    if (_227)
    {
        float _305 = _269 * _181;
        _275 = _305;
    }
    float _307 = _275;
    float _309 = _307;
    if (!_227)
    {
        _235 = 0.0;
    }
    float _311 = _235;
    float _313 = _311;
    if (_227)
    {
        float _315 = _269 * _189;
        _299 = _315;
    }
    float _317 = _299;
    if (!_247)
    {
        _253 = 0.0;
    }
    float _319 = _253;
    float _321 = _319;
    if (_227)
    {
        float _323 = _269 * _195;
        _313 = _323;
    }
    float _325 = _313;
    if (!_247)
    {
        _237 = 0.0;
    }
    float _327 = _237;
    float _329 = _327;
    if (_247)
    {
        float _331 = _279 * _183;
        _303 = _331;
    }
    float _333 = _303;
    if (_247)
    {
        float _335 = _279 * _191;
        _321 = _335;
    }
    float _337 = _321;
    if (_247)
    {
        float _339 = _279 * _197;
        _329 = _339;
    }
    float _341 = _329;
    bool _343 = !_295;
    float _359;
    if (!_343)
    {
        float _345 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _347 = _145 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _349 = fma(_347, (*spvDescriptorSet0.vp_c9)._m0[12].x, _151);
        float _351 = _349 * _345;
        float _353 = floor(_351);
        float _355 = -_353;
        float _357 = _351 + _355;
        _359 = _357;
        _361 = true;
    }
    else
    {
        _359 = _199;
    }
    _361 = false;
    float _363 = _359;
    float _365 = in.m_66.x;
    float _367 = in.m_66.y;
    float _369 = _151 * (*spvDescriptorSet0.vp_c9)._m0[193].y;
    float _371 = in.m_49.x;
    float _373 = in.m_49.y;
    float _375 = in.m_49.z;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _377;
    float _381 = fma(_145, 6.283185482025146484375, _369);
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _385 = _383 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _389 = _363 + _387;
    float _391 = 1.0 / _379;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _395 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _393;
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _399 = _363 + _397;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _403 = _363 + _401;
    float _405 = 1.0 / _395;
    float _407 = fma((*spvDescriptorSet0.vp_c9)._m0[194].y, 0.01745329238474369049072265625, _381);
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _411 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _409;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _415 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _413;
    float _417 = _407 * 0.15915493667125701904296875;
    int _419 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _421 = _419 != 0;
    float _423 = -_367;
    float _425 = _423 + 1.0;
    float _427 = abs(_365);
    float _429 = log2(_427);
    float _431 = _399 * _391;
    float _433 = _189 * _373;
    float _435 = _195 * _373;
    float _437 = _407 * 1.2999999523162841796875;
    float _439 = fma(_187, _371, _433);
    float _441 = fma(_193, _371, _435);
    float _443 = _407 + 0.52359879016876220703125;
    float _445 = 1.0 / _385;
    float _447 = _443 * 0.15915493667125701904296875;
    float _449 = _389 * _405;
    float _451 = fma(_407, 0.60000002384185791015625, 0.31415927410125732421875);
    float _453 = _437 * 0.15915493667125701904296875;
    float _455 = _429 * (*spvDescriptorSet0.vp_c9)._m0[193].z;
    float _457 = fma(_407, 1.2999999523162841796875, 0.680678427219390869140625);
    float _459 = _407 * 0.60000002384185791015625;
    float _461 = _451 * 0.15915493667125701904296875;
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _465 = _463 + (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _467 = exp2(_455);
    float _469 = _459 * 0.15915493667125701904296875;
    float _471 = (*spvDescriptorSet0.vp_c9)._m0[193].w * 3.1415927410125732421875;
    float _473 = fma(_465, _145, (*spvDescriptorSet0.vp_c9)._m0[191].x);
    float _475 = _403 * _445;
    float _477 = _469 * 6.283185482025146484375;
    float _479 = sin(_477);
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _483 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _481;
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _487 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _485;
    float _489 = fma(_483, _431, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _491 = fma(_471, _467, _369);
    float _493 = _453 * 6.283185482025146484375;
    float _495 = sin(_493);
    float _497 = in.m_68.x;
    float _499 = in.m_68.y;
    float _501 = in.m_68.z;
    float _503 = _457 * 0.15915493667125701904296875;
    float _505 = fma(_145, 6.283185482025146484375, _491);
    float _507 = _417 * 6.283185482025146484375;
    float _509 = sin(_507);
    float _511 = _147 * 628.31854248046875;
    float _513 = fma(_151, _473, _511);
    float _515 = _447 * 6.283185482025146484375;
    float _517 = sin(_515);
    float _519 = _513 * 0.89999997615814208984375;
    float _521 = _513 * 0.15915493667125701904296875;
    float _523 = fma(_365, 0.261799395084381103515625, -0.261799395084381103515625);
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _527 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _525;
    float _529 = _519 * 0.15915493667125701904296875;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _533 = _531 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _537 = _535 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _539 = _461 * 6.283185482025146484375;
    float _541 = sin(_539);
    bool _543 = _497 > 0.0;
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _547 = _545 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _549 = _497 >= 0.0;
    bool _551 = isnan(_497);
    bool _553 = _549 || _551;
    bool _555 = isnan(0.0);
    bool _557 = _553 || _555;
    float _559 = fma(_527, _431, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _561 = _513 + _523;
    int _563 = _557 ? 0 : 1;
    float _565 = fma(_411, _431, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _567 = _529 * 6.283185482025146484375;
    float _569 = cos(_567);
    float _571 = fma(_533, _475, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _573 = fma(_547, _475, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _575 = fma(_537, _475, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _579 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _577;
    float _581 = _561 * 0.15915493667125701904296875;
    float _583 = _561 * 0.89999997615814208984375;
    float _585 = _561 * 1.10000002384185791015625;
    float _587 = fma(_579, _449, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    int _589 = ~_563;
    int _591 = _589 + 1;
    int _593 = _591 + 1;
    float _595 = fma(_415, _449, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    int _597 = _593;
    float _599 = _501;
    float _601 = _373;
    if (!_543)
    {
        int _603 = ~_563;
        int _605 = _603 + 1;
        _597 = _605;
    }
    int _607 = _597;
    float _609 = _561 * 0.699999988079071044921875;
    bool _611 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _613 = isnan(_363);
    bool _615 = _611 || _613;
    bool _617 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _619 = _615 || _617;
    float _621 = float(_619);
    float _623 = fma(_479, 0.60000002384185791015625, _509);
    float _625 = _585 * 0.15915493667125701904296875;
    bool _627 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _629 = isnan(_363);
    bool _631 = _627 || _629;
    bool _633 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _635 = _631 || _633;
    float _637 = float(_635);
    float _639 = _503 * 6.283185482025146484375;
    float _641 = sin(_639);
    float _643 = -_621;
    float _645 = _643 + 1.0;
    float _647 = fma(_495, 0.300000011920928955078125, _623);
    float _649 = fma(_541, 0.60000002384185791015625, _517);
    float _651 = _609 * 0.15915493667125701904296875;
    bool _653 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _655 = isnan(_363);
    bool _657 = _653 || _655;
    bool _659 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _661 = _657 || _659;
    float _663 = float(_661);
    float _665 = _637 * _645;
    float _667 = -_637;
    float _669 = _667 + 1.0;
    float _671 = fma(_487, _449, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _673 = _505 * 0.15915493667125701904296875;
    float _675 = _505 * 0.60000002384185791015625;
    float _677 = _505 * 1.2999999523162841796875;
    bool _679 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _681 = isnan(_363);
    bool _683 = _679 || _681;
    bool _685 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _687 = _683 || _685;
    float _689 = float(_687);
    float _691 = _663 * _669;
    float _693 = -_663;
    float _695 = _693 + 1.0;
    float _697 = _625 * 6.283185482025146484375;
    float _699 = cos(_697);
    float _701 = _675 * 0.15915493667125701904296875;
    float _703 = -_365;
    float _705 = _703 + 1.0;
    float _707 = _689 * _695;
    float _709 = _583 * 0.15915493667125701904296875;
    float _711 = _499 + (-0.0199999995529651641845703125);
    float _713 = _647 * _705;
    float _715 = _489 * _707;
    float _717 = _673 * 6.283185482025146484375;
    float _719 = sin(_717);
    float _721 = fma(_641, 0.300000011920928955078125, _649);
    float _723 = -_689;
    float _725 = _723 + 1.0;
    float _727 = _677 * 0.15915493667125701904296875;
    float _729 = _559 * _707;
    float _731 = abs(_721);
    float _733 = _425 * _731;
    float _735 = fma(_725, (*spvDescriptorSet0.vp_c9)._m0[143].x, _715);
    float _737 = _565 * _707;
    float _739 = _701 * 6.283185482025146484375;
    float _741 = sin(_739);
    float _743 = fma(_725, (*spvDescriptorSet0.vp_c9)._m0[143].y, _729);
    float _745 = fma(_571, _691, _735);
    float _747 = _733 * (-45.0);
    float _749 = in.m_70.y;
    float _751 = fma(_725, (*spvDescriptorSet0.vp_c9)._m0[143].z, _737);
    float _753 = _713 * 0.52359879016876220703125;
    float _755 = fma(_573, _691, _743);
    float _757 = _709 * 6.283185482025146484375;
    float _759 = sin(_757);
    float _761 = _747 * 0.01745329238474369049072265625;
    float _763 = fma(_575, _691, _751);
    float _765 = fma(_587, _665, _745);
    float _767 = _753 * 0.15915493667125701904296875;
    float _769 = in.m_72.x;
    float _771 = in.m_72.y;
    float _773 = in.m_72.z;
    float _775 = _761 * 0.15915493667125701904296875;
    float _777 = float(_607);
    float _779 = _727 * 6.283185482025146484375;
    float _781 = sin(_779);
    float _783 = _733 * (-20.0);
    float _785 = fma(_595, _665, _755);
    float _787 = fma(_671, _665, _763);
    float _789 = fma(_741, 0.60000002384185791015625, _719);
    float _791 = _777 * _783;
    float _793 = fma(_621, (*spvDescriptorSet0.vp_c9)._m0[146].x, _765);
    float _795 = _581 * 6.283185482025146484375;
    float _797 = sin(_795);
    float _799 = _791 * 0.01745329238474369049072265625;
    float _801 = _759 * 0.89999997615814208984375;
    float _803 = fma(_621, (*spvDescriptorSet0.vp_c9)._m0[146].y, _785);
    float _805 = fma(_621, (*spvDescriptorSet0.vp_c9)._m0[146].z, _787);
    float _807 = fma(_749, 0.5, 0.5);
    float _809 = _799 * 0.15915493667125701904296875;
    float _811 = _651 * 6.283185482025146484375;
    float _813 = cos(_811);
    float _815 = fma(_781, 0.300000011920928955078125, _789);
    float _817 = _807 * _815;
    float _819 = _793 * _769;
    float _821 = _805 * _773;
    float _823 = _767 * 6.283185482025146484375;
    float _825 = sin(_823);
    float _827 = -_801;
    float _829 = fma(_797, -1.2000000476837158203125, _827);
    float _831 = _817 * (*spvDescriptorSet0.vp_c9)._m0[193].x;
    float _833 = _803 * _771;
    float _835 = abs(_829);
    bool _837 = _835 > 0.001000000047497451305389404296875;
    bool _839 = isnan(_835);
    bool _841 = _837 || _839;
    bool _843 = isnan(0.001000000047497451305389404296875);
    bool _845 = _841 || _843;
    float _847 = _831 * 0.01745329238474369049072265625;
    float _849 = _767 * 6.283185482025146484375;
    float _851 = cos(_849);
    float _853 = _813 * 0.699999988079071044921875;
    float _855 = _845 ? _829 : 0.001000000047497451305389404296875;
    float _857 = fma(_699, 1.10000002384185791015625, _853);
    float _859 = abs(_855);
    bool _861 = _859 == 0.0;
    float _863 = _775 * 6.283185482025146484375;
    float _865 = sin(_863);
    float _867 = _825 * _497;
    float _869 = abs(_857);
    bool _871 = _869 != 0.0;
    bool _873 = isnan(_869);
    bool _875 = _871 || _873;
    bool _877 = isnan(0.0);
    bool _879 = _875 || _877;
    float _881 = abs(_855);
    bool _883 = _881 == 0.0;
    bool _885 = !_879;
    bool _887 = _883 && _885;
    float _889 = _775 * 6.283185482025146484375;
    float _891 = cos(_889);
    float _893 = -_867;
    float _895 = fma(_851, _501, _893);
    float _897 = _851 * _497;
    float _899 = _851;
    float _901 = _809;
    int _903 = as_type<int>(_847);
    int _905 = _879 ? (-1) : 0;
    bool _907 = _861;
    float _909 = _755;
    if (_421)
    {
        _899 = _147;
    }
    float _911 = _899;
    float _913 = _895 + 0.02999999932944774627685546875;
    float _915 = fma(_825, _501, _897);
    float _917 = _809 * 6.283185482025146484375;
    float _919 = sin(_917);
    float _921 = _847 * 0.15915493667125701904296875;
    float _923 = _865 * _913;
    float _925 = fma(_777, -0.100000001490116119384765625, _915);
    bool _927 = false;
    int _929 = as_type<int>(_925);
    float _931 = _911;
    if (_887)
    {
        bool _933 = as_type<int>(_855) >= 0;
        _927 = _933;
    }
    bool _935 = _927;
    float _937 = _809 * 6.283185482025146484375;
    float _939 = cos(_937);
    float _941 = -_923;
    float _943 = fma(_891, _711, _941);
    float _945 = _891 * _913;
    float _947 = _521 * 6.283185482025146484375;
    float _949 = cos(_947);
    float _951 = _943 * _919;
    if (_421)
    {
        _901 = _145;
    }
    float _953 = _901;
    float _955 = _921 * 6.283185482025146484375;
    float _957 = sin(_955);
    float _959 = _943 * _939;
    float _961 = -_951;
    float _963 = fma(_939, _925, _961);
    int _965 = as_type<int>(_939);
    float _967 = _953;
    if (_421)
    {
        _903 = 0;
        _965 = 0;
    }
    int _969 = _903;
    int _971 = _965;
    float _973 = fma(_919, _925, _959);
    int _975 = _969;
    int _977 = _971;
    if (_887)
    {
        int _979 = _935 ? 0 : 1078530011;
        _929 = _979;
    }
    int _981 = _929;
    float _983 = _921 * 6.283185482025146484375;
    float _985 = cos(_983);
    int _987 = _981;
    if (!_421)
    {
        float _989 = _145 * 3.1415927410125732421875;
        float _991 = _989 * 0.15915493667125701904296875;
        float _993 = _147 * 3.1415927410125732421875;
        float _995 = _993 * 0.15915493667125701904296875;
        float _997 = _991 * 6.283185482025146484375;
        float _999 = sin(_997);
        float _1001 = _995 * 6.283185482025146484375;
        float _1003 = sin(_1001);
        _975 = 2;
        _977 = 1;
        _967 = _999;
        _931 = _1003;
    }
    int _1005 = _975;
    int _1007 = _977;
    float _1009 = _967;
    float _1011 = _931;
    float _1013 = _513 * 0.699999988079071044921875;
    if (_887)
    {
        int _1015 = int(0x80000000) & as_type<int>(_857);
        int _1017 = _981 | _1015;
        _599 = as_type<float>(_1017);
    }
    float _1019 = _599;
    bool _1021 = !_879;
    bool _1023 = _1021 && _861;
    float _1025 = _1019;
    float _1027 = _1019;
    if (!_1023)
    {
        float _1029 = abs(_857);
        bool _1031 = _1029 != as_type<float>(0x7f800000u /* inf */);
        bool _1033 = isnan(_1029);
        bool _1035 = _1031 || _1033;
        bool _1037 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1039 = _1035 || _1037;
        float _1041 = abs(_855);
        bool _1043 = _1041 == as_type<float>(0x7f800000u /* inf */);
        float _1045 = abs(_855);
        bool _1047 = _1045 == as_type<float>(0x7f800000u /* inf */);
        bool _1049 = !_1039;
        bool _1051 = _1047 && _1049;
        if (_1051)
        {
            bool _1053 = as_type<int>(_855) >= 0;
            _905 = _1053 ? (-1) : 0;
        }
        int _1055 = _905;
        if (_1051)
        {
            _987 = 1075235812;
        }
        int _1057 = _987;
        int _1059 = _1057;
        if (_1051)
        {
            int _1061 = ~_1055;
            int _1063 = (_1061 != 0) ? _1057 : 1061752795;
            _1059 = _1063;
        }
        int _1065 = _1059;
        if (_1051)
        {
            int _1067 = int(0x80000000) & as_type<int>(_857);
            int _1069 = _1065 | _1067;
            _1025 = as_type<float>(_1069);
        }
        float _1071 = _1025;
        bool _1073 = !_1039;
        bool _1075 = _1073 && _1043;
        _1027 = _1071;
        if (!_1075)
        {
            float _1077 = abs(_857);
            float _1079 = abs(_855);
            float _1081 = precise::max(_1077, _1079);
            float _1083 = abs(_857);
            float _1085 = abs(_855);
            float _1087 = precise::min(_1083, _1085);
            float _1089 = 1.0 / _1081;
            float _1091 = abs(_857);
            float _1093 = abs(_855);
            bool _1095 = _1091 > _1093;
            bool _1097 = as_type<int>(_855) >= 0;
            float _1099 = _1087 * _1089;
            float _1101 = _1099 * _1099;
            float _1103 = _1101 + 11.33538818359375;
            float _1105 = fma(_1101, _1103, 28.84246826171875);
            float _1107 = fma(_1101, _1105, 19.6966705322265625);
            float _1109 = fma(_1101, -0.82336294651031494140625, -5.674867153167724609375);
            float _1111 = fma(_1101, _1109, -6.565555095672607421875);
            float _1113 = 1.0 / _1107;
            float _1115 = _1101 * _1111;
            float _1117 = abs(_857);
            float _1119 = abs(_855);
            float _1121 = _1117 + _1119;
            int _1123 = as_type<int>(_857) & int(0x80000000);
            float _1125 = _1099 * _1115;
            bool _1127 = _1121 > as_type<float>(0x7f800000u /* inf */);
            bool _1129 = isnan(_1121);
            bool _1131 = _1127 || _1129;
            bool _1133 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1135 = _1131 || _1133;
            float _1137 = fma(_1125, _1113, _1099);
            float _1139 = _1137;
            _1027 = _1121;
            if (_1095)
            {
                float _1141 = -_1137;
                float _1143 = _1141 + 1.57079637050628662109375;
                _1139 = _1143;
            }
            float _1145 = _1139;
            int _1147 = as_type<int>(_1145);
            if (!_1097)
            {
                float _1149 = -_1145;
                float _1151 = _1149 + 3.1415927410125732421875;
                _1147 = as_type<int>(_1151);
            }
            int _1153 = _1147;
            if (!_1135)
            {
                int _1155 = _1123 | _1153;
                _1027 = as_type<float>(_1155);
            }
        }
    }
    float _1157 = _1027;
    float _1159 = _973 + 0.0199999995529651641845703125;
    float _1161 = fma(_777, 0.100000001490116119384765625, _963);
    float _1163 = _1013 * 0.15915493667125701904296875;
    float _1165 = in.m_56.z;
    float _1167 = _1159 * _957;
    float _1169 = _1159 * _985;
    float _1171 = fma(_865, _711, _945);
    float _1173 = _1157 + 1.57079637050628662109375;
    float _1175 = -_1167;
    float _1177 = fma(_1161, _985, _1175);
    float _1179 = fma(_1161, _957, _1169);
    float _1181 = _1171 + (-0.02999999932944774627685546875);
    float _1183 = _1173 * (-0.15915493667125701904296875);
    float _1185 = fma(_647, (*spvDescriptorSet0.vp_c9)._m0[194].x, _1177);
    float _1187 = _821 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1189 = in.m_62.w;
    float _1191 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1181);
    float _1193 = _833 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1195 = _513 * 1.10000002384185791015625;
    float _1197 = _819 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1199 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1185);
    float _1201 = in.m_64.w;
    float _1203 = _1183 * 6.283185482025146484375;
    float _1205 = cos(_1203);
    float _1207 = _1187 * _1191;
    float _1209 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1179);
    float _1211 = _1197 * _1199;
    float _1213 = _1195 * 0.15915493667125701904296875;
    float _1215 = _1207 * _317;
    float _1217 = _1193 * _1209;
    float _1219 = _1207 * _325;
    float _1221 = _1183 * 6.283185482025146484375;
    float _1223 = sin(_1221);
    float _1225 = fma(_1211, _289, _1215);
    float _1227 = _1165 * 6.283185482025146484375;
    float _1229 = fma(_1211, _293, _1219);
    float _1231 = fma(_191, _375, _439);
    float _1233 = -_1217;
    float _1235 = fma(_1233, _337, _1225);
    float _1237 = fma(_197, _375, _441);
    float _1239 = _1227 * 0.15915493667125701904296875;
    float _1241 = _1163 * 6.283185482025146484375;
    float _1243 = sin(_1241);
    float _1245 = -_1217;
    float _1247 = fma(_1245, _341, _1229);
    float _1249 = _1235 * _1205;
    float _1251 = _1231 + _1189;
    float _1253 = fma(_949, 1.2000000476837158203125, _569);
    float _1255 = _199 * 3.3333332538604736328125;
    float _1257 = _1237 + _1201;
    float _1259 = _1213 * 6.283185482025146484375;
    float _1261 = sin(_1259);
    float _1263 = _1235 * _1223;
    float _1265 = fma(_1247, _1223, _1249);
    float _1267 = -(*spvDescriptorSet0.vp_c9)._m0[192].w;
    float _1269 = _1267 + 1.0;
    float _1271 = -_1263;
    float _1273 = fma(_1247, _1205, _1271);
    float _1275 = _1251 + _1265;
    float _1277 = _1239 * 6.283185482025146484375;
    float _1279 = sin(_1277);
    float _1281 = _1257 + _1273;
    float _1283 = fma(_1253, (*spvDescriptorSet0.vp_c9)._m0[191].z, _1275);
    float _1285 = in.m_74.y;
    float _1287 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1289 = _1283 + _1287;
    float _1291 = _1239 * 6.283185482025146484375;
    float _1293 = cos(_1291);
    float _1295 = _1243 + _1261;
    float _1297 = fma(_1295, (*spvDescriptorSet0.vp_c9)._m0[191].z, _1281);
    float _1299 = _1279 * _1289;
    float _1301 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1303 = _1297 + _1301;
    float _1305 = _1293 * _1289;
    float _1307 = -_1299;
    float _1309 = fma(_1293, _1303, _1307);
    float _1311 = fma(_1279, _1303, _1305);
    float _1313 = _1309 + (*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1315 = _1311 + (*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1317 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1319 = _1313 + _1317;
    float _1321 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1323 = _1315 + _1321;
    float _1325 = _1319 * _1319;
    float _1327 = fma(_1323, _1323, _1325);
    float _1329 = sqrt(_1327);
    bool _1331 = _1329 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1333 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1335 = _1329 + _1333;
    float _1337 = 0.0 + _1255;
    float _1339 = precise::clamp(_1337, 0.0, 1.0);
    float _1341 = -_1255;
    float _1343 = _1341 + 3.3333332538604736328125;
    float _1345 = precise::clamp(_1343, 0.0, 1.0);
    float _1347 = precise::min(_1339, _1345);
    float _1349 = _373 + _1285;
    float _1351 = _1201;
    float _1353 = 5.0;
    float _1355 = _1165;
    if (_1331)
    {
        float _1357 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1351 = _1357;
    }
    float _1359 = _1351;
    float _1361 = fma(_1347, -5.0, 5.0);
    if (_1331)
    {
        float _1363 = rsqrt(_1327);
        _1353 = _1363;
    }
    float _1365 = _1353;
    float _1367 = _1359;
    if (_1331)
    {
        float _1369 = _1335 * _1359;
        _1367 = _1369;
    }
    float _1371 = _1367;
    float _1373 = _1207 * _307;
    float _1375 = _1371;
    if (_1331)
    {
        float _1377 = _1371 * 0.15915493667125701904296875;
        _1375 = _1377;
    }
    float _1379 = _1375;
    float _1381 = fma(_1211, _285, _1373);
    float _1383 = _1283;
    if (_1331)
    {
        float _1385 = _1379 * 6.283185482025146484375;
        float _1387 = sin(_1385);
        _1383 = _1387;
    }
    float _1389 = _1383;
    float _1391 = -_1217;
    float _1393 = fma(_1391, _333, _1381);
    float _1395 = _1349 + _1393;
    float _1397 = -_1361;
    float _1399 = fma(_1397, _1269, _1395);
    float _1401 = _1395;
    float _1403 = _1399;
    if (!_1331)
    {
        _1401 = _1313;
    }
    float _1405 = _1401;
    float _1407 = _1405;
    if (_1331)
    {
        float _1409 = _1399 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _601 = _1409;
    }
    float _1411 = _601;
    float _1413 = _1411;
    float _1415 = _1389;
    if (_1331)
    {
        float _1417 = fma(_1389, _1411, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1413 = _1417;
    }
    float _1419 = _1413;
    float _1421 = _1419;
    if (!_1331)
    {
        _1415 = _1315;
    }
    float _1423 = _1415;
    float _1425 = _1423;
    if (_1331)
    {
        float _1427 = _1365 * _1419;
        _1421 = _1427;
    }
    float _1429 = _1421;
    if (_1331)
    {
        float _1431 = fma(_1323, _1429, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1425 = _1431;
    }
    float _1433 = _1425;
    if (_1331)
    {
        float _1435 = fma(_1319, _1429, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1407 = _1435;
    }
    float _1437 = _1407;
    float _1439 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1441 = _1433 + _1439;
    float _1443 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1445 = _1437 + _1443;
    float _1447 = fma(_1441, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1449 = fma(_1445, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _5032 = float2(_1447, _1449);
    float _1451 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_5032, float2(0.0), isnan(_5032)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_5032, float2(0.0), isnan(_5032)), level(0.0)).x;
    float _1453 = in.m_70.x;
    float _1455 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    int _1457 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1459 = _1457 != 0;
    int _1461 = 2;
    if (_1459)
    {
        bool _1463 = _145 > 0.5;
        _907 = _1463;
    }
    bool _1465 = _907;
    float _1467 = _1453;
    if (!_1459)
    {
        _909 = _1453;
    }
    float _1469 = _909;
    float _1471 = fma(_1451, 100.0, _1349);
    float _1473 = _1471 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1475 = _1471 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1477 = _1471 + _1455;
    float _1479 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1473);
    float _1481 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1475);
    float _1483 = in.m_56.w;
    float _1485 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1479);
    float _1487 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1481);
    float _1489 = _1485 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1491 = _1487 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1493 = 1.0 / _1489;
    float _1495 = _1491 + _1489;
    float _1497 = _1495 * _1493;
    float _1499 = _1497 * 0.5;
    float _1501 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1503 = fma(_1499, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1501);
    float _1505 = 1.0 / _1503;
    float _1507 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1509 = _1505 * _1507;
    bool _1511 = _1509 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1513 = _1509 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1515 = !_1511;
    int _1517 = _1515 ? 0 : 1;
    float _1519 = _1469;
    if (!_1511)
    {
        _1461 = 1;
    }
    int _1521 = _1461;
    int _1523 = _1521;
    if (!_1513)
    {
        _1523 = _1517;
    }
    int _1525 = _1523;
    int _1527 = _1525 << 6;
    int _1529 = _1527 + 96;
    uint _1532 = uint(int(uint(_1529) >> uint(2)));
    uint _1534 = uint(int(uint(int(_1532)) >> uint(2)));
    int _1536 = int(_1532) & 3;
    float _1538 = (*spvDescriptorSet0.vp_c15)._m0[int(_1534)][_1536];
    int _1540 = int(_1532) + 1;
    uint _1542 = uint(int(uint(_1540) >> uint(2)));
    int _1544 = _1540 & 3;
    float _1546 = (*spvDescriptorSet0.vp_c15)._m0[int(_1542)][_1544];
    int _1548 = _1527 + 104;
    uint _1550 = uint(int(uint(_1548) >> uint(2)));
    uint _1552 = uint(int(uint(int(_1550)) >> uint(2)));
    int _1554 = int(_1550) & 3;
    float _1556 = (*spvDescriptorSet0.vp_c15)._m0[int(_1552)][_1554];
    int _1558 = int(_1550) + 1;
    uint _1560 = uint(int(uint(_1558) >> uint(2)));
    int _1562 = _1558 & 3;
    float _1564 = (*spvDescriptorSet0.vp_c15)._m0[int(_1560)][_1562];
    int _1566 = _1527 + 48;
    uint _1568 = uint(int(uint(_1566) >> uint(2)));
    uint _1570 = uint(int(uint(int(_1568)) >> uint(2)));
    int _1572 = int(_1568) & 3;
    float _1574 = (*spvDescriptorSet0.vp_c15)._m0[int(_1570)][_1572];
    int _1576 = int(_1568) + 1;
    uint _1578 = uint(int(uint(_1576) >> uint(2)));
    int _1580 = _1576 & 3;
    float _1582 = (*spvDescriptorSet0.vp_c15)._m0[int(_1578)][_1580];
    int _1584 = _1527 + 64;
    uint _1586 = uint(int(uint(_1584) >> uint(2)));
    uint _1588 = uint(int(uint(int(_1586)) >> uint(2)));
    int _1590 = int(_1586) & 3;
    float _1592 = (*spvDescriptorSet0.vp_c15)._m0[int(_1588)][_1590];
    int _1594 = int(_1586) + 1;
    uint _1596 = uint(int(uint(_1594) >> uint(2)));
    int _1598 = _1594 & 3;
    float _1600 = (*spvDescriptorSet0.vp_c15)._m0[int(_1596)][_1598];
    int _1602 = _1527 + 56;
    uint _1604 = uint(int(uint(_1602) >> uint(2)));
    uint _1606 = uint(int(uint(int(_1604)) >> uint(2)));
    int _1608 = int(_1604) & 3;
    float _1610 = (*spvDescriptorSet0.vp_c15)._m0[int(_1606)][_1608];
    int _1612 = int(_1604) + 1;
    uint _1614 = uint(int(uint(_1612) >> uint(2)));
    int _1616 = _1612 & 3;
    float _1618 = (*spvDescriptorSet0.vp_c15)._m0[int(_1614)][_1616];
    int _1620 = _1527 + 72;
    uint _1622 = uint(int(uint(_1620) >> uint(2)));
    uint _1624 = uint(int(uint(int(_1622)) >> uint(2)));
    int _1626 = int(_1622) & 3;
    float _1628 = (*spvDescriptorSet0.vp_c15)._m0[int(_1624)][_1626];
    int _1630 = int(_1622) + 1;
    uint _1632 = uint(int(uint(_1630) >> uint(2)));
    int _1634 = _1630 & 3;
    float _1636 = (*spvDescriptorSet0.vp_c15)._m0[int(_1632)][_1634];
    float _1638 = _1477 * _1546;
    float _1640 = fma(_1251, _1538, _1638);
    float _1642 = fma(_1257, _1556, _1640);
    float _1644 = _1642 + _1564;
    int _1646 = _1527 + 80;
    uint _1648 = uint(int(uint(_1646) >> uint(2)));
    uint _1650 = uint(int(uint(int(_1648)) >> uint(2)));
    int _1652 = int(_1648) & 3;
    float _1654 = (*spvDescriptorSet0.vp_c15)._m0[int(_1650)][_1652];
    int _1656 = int(_1648) + 1;
    uint _1658 = uint(int(uint(_1656) >> uint(2)));
    int _1660 = _1656 & 3;
    float _1662 = (*spvDescriptorSet0.vp_c15)._m0[int(_1658)][_1660];
    float _1664 = _1477 * _1582;
    float _1666 = 1.0 / _1644;
    float _1668 = fma(_1251, _1574, _1664);
    int _1670 = _1527 + 88;
    uint _1672 = uint(int(uint(_1670) >> uint(2)));
    uint _1674 = uint(int(uint(int(_1672)) >> uint(2)));
    int _1676 = int(_1672) & 3;
    float _1678 = (*spvDescriptorSet0.vp_c15)._m0[int(_1674)][_1676];
    int _1680 = int(_1672) + 1;
    uint _1682 = uint(int(uint(_1680) >> uint(2)));
    int _1684 = _1680 & 3;
    float _1686 = (*spvDescriptorSet0.vp_c15)._m0[int(_1682)][_1684];
    float _1688 = _1477 * _1600;
    float _1690 = fma(_1251, _1592, _1688);
    float _1692 = fma(_1257, _1610, _1668);
    float _1694 = _1692 + _1618;
    float _1696 = fma(_1251, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1698 = fma(_1257, _1628, _1690);
    float _1700 = _1694 * _1666;
    float _1702 = floor(_1696);
    float _1704 = _1698 + _1636;
    bool _1706 = _1700 >= 0.0;
    float _1708 = _1704 * _1666;
    bool _1710 = _1700 <= 1.0;
    bool _1712 = _1710 && _1706;
    float _1714 = fma(_1257, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    bool _1716 = _1708 >= 0.0;
    bool _1718 = _1716 && _1712;
    float _1720 = floor(_1714);
    bool _1722 = _1708 <= 1.0;
    bool _1724 = _1722 && _1718;
    float _1726 = _1477 * _1662;
    int _1728 = as_type<int>(_1662);
    float _1730 = _1694;
    if (_1459)
    {
        float _1732 = -_1453;
        float _1734 = _1732 + 1.0;
        _1728 = as_type<int>(_1734);
    }
    int _1736 = _1728;
    float _1738 = fma(_1251, _1654, _1726);
    float _1740 = fma(_1257, _1678, _1738);
    if (_1724)
    {
        float _1742 = float(_1525);
        _1730 = _1742;
    }
    float _1744 = _1730;
    float _1746 = -_1702;
    float _1748 = _1696 + _1746;
    float _1750 = _1740 + _1686;
    float _1752 = -_1720;
    float _1754 = _1714 + _1752;
    float _1756 = _1726;
    if (_1724)
    {
        float _1758 = rint(_1744);
        float _1760 = precise::max(_1758, 0.0);
        uint _1762 = uint(_1760);
        uint _1764 = clamp(_1762, 0u, 65535u);
        _1756 = as_type<float>(_1764);
    }
    float _1766 = _1756;
    float _1768 = _1750 * _1666;
    float2 _5564 = float2(_1748, _1754);
    float _1770 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5564, float2(0.0), isnan(_5564)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5564, float2(0.0), isnan(_5564)), level(0.0)).x;
    float _1772 = _1708;
    if (_1724)
    {
        float3 _5579 = float3(_1700, _1708, float(as_type<int>(_1766)));
        float3 _5583 = select(_5579, float3(0.0), isnan(_5579));
        float _1774 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5583.xy, uint(rint(_5583.z)), _1768, level(0.0));
        _1772 = _1774;
    }
    float _1776 = _1772;
    if (_1459)
    {
        float _1778 = _1465 ? as_type<float>(_1736) : _1453;
        _1519 = _1778;
    }
    float _1780 = _1519;
    float _1782 = -_749;
    float _1784 = _1782 + 1.0;
    bool _1786 = _147 > 0.5;
    out.m_76.x = _365;
    int _1788 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1790 = _1788 != 0;
    float _1792 = _147 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1794 = _1786 ? as_type<int>(_1784) : as_type<int>(_749);
    float _1796 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1798 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1800 = _1798 != 0;
    float _1802 = _1790 ? as_type<float>(_1794) : _749;
    float _1804 = in.m_78.x;
    float _1806 = in.m_78.y;
    float _1808 = in.m_78.z;
    float _1810 = in.m_78.w;
    bool _1812 = _1483 > 0.5;
    float _1814 = _145 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1816 = _1165 > 0.5;
    float _1818 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1820 = _1812 ? as_type<int>(_1784) : as_type<int>(_749);
    float _1822 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1824 = _1816 ? as_type<int>(_1784) : as_type<int>(_749);
    float _1826 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1828 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1830 = _1828 != 0;
    float _1832 = 0.0;
    if (_1800)
    {
        float _1834 = in.m_56.z;
        _1832 = _1834;
    }
    float _1836 = _1832;
    int _1838 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1840 = _1838 != 0;
    float _1842 = fma(_1792, -2.0, _1826);
    float _1844 = -_1822;
    float _1846 = fma(_1814, 2.0, _1844);
    float _1848 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1850 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1852 = _1830 ? as_type<float>(_1824) : _749;
    float _1854 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1856 = _1840 ? as_type<float>(_1820) : _749;
    float _1858 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _1860 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1862 = _1860 != 0;
    float _1864 = _317 * _1808;
    float _1866 = _1850 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1868 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1870 = _1868 != 0;
    float _1872 = _1854 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1874 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1876 = _1874 != 0;
    float _1878 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1880 = _1858 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1882 = _307 * _1808;
    float _1884 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1886 = _1862 ? as_type<float>(_1824) : _749;
    float _1888 = fma(_289, _1804, _1864);
    float _1890 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1892 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    out.m_80.x = _1866;
    out.m_80.y = _1872;
    out.m_80.z = _1880;
    out.m_80.w = _1878;
    float _1894 = _1884 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1896 = _1890 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1898 = _1892 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1900 = _325 * _1808;
    float _1902 = _1796 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1904 = _1818 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1906 = fma(_285, _1804, _1882);
    out.m_82.x = _1894;
    out.m_82.y = _1896;
    out.m_82.z = _1898;
    float _1908 = fma(_293, _1804, _1900);
    float _1910 = fma(_1904, _1802, -0.5);
    bool _1912 = _1862;
    int _1914 = as_type<int>(_1842);
    float _1916 = _1898;
    if (_1800)
    {
        bool _1918 = _1836 > 0.5;
        _1912 = _1918;
    }
    bool _1920 = _1912;
    float _1922 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _1924 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1926 = -_1806;
    float _1928 = fma(_337, _1926, _1888);
    float _1930 = -_1806;
    float _1932 = fma(_333, _1930, _1906);
    float _1934 = -_1806;
    float _1936 = fma(_341, _1934, _1908);
    float _1938 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1924);
    float _1940 = fma(_1902, _1856, -0.5);
    float _1942 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1944 = _1848 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1946 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1938);
    float _1948 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1842);
    float _1950 = _1946;
    int _1952 = as_type<int>(_1932);
    if (_1800)
    {
        float _1954 = -_1453;
        float _1956 = _1954 + 1.0;
        _1914 = as_type<int>(_1956);
    }
    int _1958 = _1914;
    if (!_1800)
    {
        _1916 = _1453;
    }
    float _1960 = _1916;
    float _1962 = fma(_1886, _1944, -0.5);
    float _1964 = -_1948;
    float _1966 = fma(_1946, _1910, _1964);
    out.m_84.x = _1928;
    out.m_84.y = _1932;
    out.m_84.z = _1936;
    float _1968 = _1960;
    float _1970 = _1962;
    if (_1800)
    {
        float _1972 = _1920 ? as_type<float>(_1958) : _1453;
        _1968 = _1972;
    }
    float _1974 = _1968;
    float _1976 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    bool _1978 = _1005 != 2;
    float _1980 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _1982 = _1922 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    bool _1984 = _1007 != 1;
    float _1986 = _1009 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _1988 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    if (!_1870)
    {
        _1950 = _1453;
    }
    float _1990 = _1950;
    float _1992 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1994 = _1990;
    if (_1870)
    {
        float _1996 = -_1453;
        float _1998 = _1996 + 1.0;
        _1952 = as_type<int>(_1998);
    }
    int _2000 = _1952;
    float _2002 = -_1980;
    float _2004 = fma(_1986, 2.0, _2002);
    float _2006 = _1942 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2008 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2010 = fma(_1009, (*spvDescriptorSet0.vp_c9)._m0[93].z, _1988);
    int _2012 = _2000;
    if (_1870)
    {
        float _2014 = _1786 ? as_type<float>(_2000) : _1453;
        _1994 = _2014;
    }
    float _2016 = _1994;
    if (_1876)
    {
        float _2018 = -_1453;
        float _2020 = _2018 + 1.0;
        _2012 = as_type<int>(_2020);
    }
    int _2022 = _2012;
    float _2024 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2026 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _2028 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2008);
    if (_1876)
    {
        float _2030 = _1786 ? as_type<float>(_2022) : _1453;
        _1467 = _2030;
    }
    float _2032 = _1467;
    float _2034 = _1976 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _2036 = fma(_1011, (*spvDescriptorSet0.vp_c9)._m0[93].w, _2026);
    float _2038 = fma(_2006, _1780, -0.5);
    float _2040 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _2042 = _1011 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _2044 = _1992 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2046 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2028);
    float _2048 = -_151;
    float _2050 = fma(_2048, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1846);
    float _2052 = fma(_2034, _2032, -0.5);
    float _2054 = fma(_2042, -2.0, _2040);
    float _2056 = _2024 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2058 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[92].z, _2010);
    float _2060 = -_151;
    float _2062 = fma(_2060, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2004);
    float _2064 = fma(_2046, _2038, _2050);
    float _2066 = _2046;
    float _2068 = _2058;
    float _2070 = _2036;
    if (_1978)
    {
        _2066 = _145;
    }
    float _2072 = _2066;
    float _2074 = fma(_2044, _1974, -0.5);
    float _2076 = _2072;
    if (!_1978)
    {
        _2076 = _1165;
    }
    float _2078 = _2076;
    float _2080 = fma(_2058, _2052, _2062);
    float _2082 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2084 = _2078;
    if (!_1984)
    {
        _2068 = _147;
    }
    float _2086 = _2068;
    float _2088 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[91].y, _2054);
    float _2090 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[92].w, _2036);
    float _2092 = _2078 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2094 = _2086;
    if (!_1984)
    {
        _2070 = _1165;
    }
    float _2096 = _2070;
    float _2098 = fma(_1852, _1982, -0.5);
    float _2100 = _2096;
    if (!_1984)
    {
        _2084 = _2086;
    }
    float _2102 = _2084;
    float _2104 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2106 = _2102;
    if (_1984)
    {
        _2094 = _145;
    }
    float _2108 = _2094;
    float _2110 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (_1984)
    {
        _2100 = _147;
    }
    float _2112 = _2100;
    float _2114 = -_2088;
    float _2116 = fma(_2090, _2098, _2114);
    float _2118 = fma(_2108, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2104);
    float _2120 = fma(_2112, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2110);
    float _2122 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    if (_1984)
    {
        _2106 = _145;
    }
    float _2124 = _2106;
    float _2126 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    if (_1984)
    {
        _1355 = _147;
    }
    float _2128 = _1355;
    float _2130 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2132 = fma(_2056, _2016, -0.5);
    float _2134 = _2124 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2136 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2122);
    float _2138 = _2128 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _2140 = _1179 != 0.0;
    bool _2142 = isnan(_1179);
    bool _2144 = _2140 || _2142;
    bool _2146 = isnan(0.0);
    bool _2148 = _2144 || _2146;
    float _2150 = -_2130;
    float _2152 = fma(_2134, 2.0, _2150);
    float _2154 = fma(_2138, -2.0, _2126);
    bool _2156 = _1185 == 0.0;
    bool _2158 = !_2148;
    bool _2160 = _2156 && _2158;
    float _2162 = in.m_86.x;
    float _2164 = in.m_86.y;
    float _2166 = in.m_86.z;
    float _2168 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2082);
    float _2170 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _2172 = _1171 == 0.02999999932944774627685546875;
    bool _2174 = _2172 && _2160;
    float _2176 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2120);
    float _2178 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2154);
    float _2180 = -_2170;
    float _2182 = fma(_2092, 2.0, _2180);
    float _2184 = -_151;
    float _2186 = fma(_2184, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2152);
    if (!_1978)
    {
        _169 = _145;
    }
    float _2188 = _169;
    float _2190 = -_2178;
    float _2192 = fma(_2176, _1940, _2190);
    float _2194 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2118);
    float _2196 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2198 = _2064 + 0.5;
    float _2200 = _2188 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2202 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2136);
    float _2204 = -_151;
    float _2206 = fma(_2204, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2182);
    float _2208 = _2192 + 0.5;
    float _2210 = fma(_2200, -2.0, _2196);
    float _2212 = fma(_2194, _2074, _2186);
    float _2214 = fma(_2202, _2132, _2206);
    float _2216 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2168);
    float _2218 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2210);
    float _2220 = _1966 + 0.5;
    float _2222 = _2192;
    float _2224 = _2218;
    float _2226 = _2202;
    float _2228 = _2162;
    if (_2174)
    {
        _2222 = _2162;
    }
    float _2230 = _2222;
    float _2232 = _2212 + 0.5;
    float _2234 = -_2218;
    float _2236 = fma(_2216, _1962, _2234);
    float _2238 = _2230;
    if (_2174)
    {
        _2224 = _2166;
    }
    float _2240 = _2224;
    float _2242 = _2240;
    if (!_2174)
    {
        float _2244 = fma(_1181, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2166);
        _2242 = _2244;
    }
    float _2246 = _2242;
    if (_2174)
    {
        _2226 = _2230;
    }
    float _2248 = _2226;
    out.m_88.x = _2198;
    out.m_88.y = _2220;
    out.m_88.z = _2232;
    out.m_88.w = _2208;
    float _2250 = _2248;
    if (!_2174)
    {
        _2238 = _2162;
    }
    float _2252 = _2238;
    float _2254 = _2080 + 0.5;
    if (_2174)
    {
        _2228 = _2164;
    }
    float _2256 = _2228;
    float _2258 = _2116 + 0.5;
    float _2260 = _2214 + 0.5;
    float _2262 = _2256;
    if (!_2174)
    {
        float _2264 = fma(_1185, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2252);
        _2250 = _2264;
    }
    float _2266 = _2250;
    if (_2174)
    {
        _1970 = _2256;
    }
    float _2268 = _1970;
    float _2270 = _2236 + 0.5;
    float _2272 = _2268;
    if (!_2174)
    {
        _2262 = _2164;
    }
    float _2274 = _2262;
    float _2276 = _1806 * _2166;
    out.m_90.x = _2254;
    out.m_90.y = _2258;
    float _2278 = _1808 * _2252;
    float _2280 = _2208;
    if (_1331)
    {
        float _2282 = _1379 * 6.283185482025146484375;
        float _2284 = cos(_2282);
        _2280 = _2284;
    }
    float _2286 = _2280;
    if (!_2174)
    {
        float _2288 = fma(_1179, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2274);
        _2272 = _2288;
    }
    float _2290 = _2272;
    float _2292 = -_2276;
    float _2294 = fma(_1808, _2274, _2292);
    float _2296 = -_2278;
    float _2298 = fma(_1804, _2166, _2296);
    float _2300 = _1804 * _2274;
    float _2302 = _317 * _2246;
    float _2304 = _307 * _2246;
    float _2306 = _325 * _2246;
    float _2308 = -_2300;
    float _2310 = fma(_1806, _2252, _2308);
    float _2312 = fma(_289, _2266, _2302);
    float _2314 = fma(_285, _2266, _2304);
    float _2316 = fma(_293, _2266, _2306);
    float _2318 = _2310 * _1810;
    float _2320 = _2294 * _1810;
    out.m_92.x = _2260;
    out.m_92.y = _2270;
    float _2322 = -_2290;
    float _2324 = fma(_341, _2322, _2316);
    float _2326 = _2318 * _317;
    float _2328 = _2318 * _307;
    float _2330 = _2318 * _325;
    float _2332 = _2298 * _1810;
    float _2334 = fma(_2320, _289, _2326);
    float _2336 = fma(_2320, _285, _2328);
    float _2338 = fma(_2320, _293, _2330);
    float _2340 = -_2290;
    float _2342 = fma(_337, _2340, _2312);
    float _2344 = -_2332;
    float _2346 = fma(_2344, _337, _2334);
    if (_1331)
    {
        float _2348 = _2286 + (-1.0);
        _309 = _2348;
    }
    float _2350 = _309;
    float _2352 = -_2332;
    float _2354 = fma(_2352, _341, _2338);
    float _2356 = _2342 * _1223;
    float _2358 = _2342 * _1205;
    float _2360 = _2350;
    if (_1331)
    {
        float _2362 = _2350 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2360 = _2362;
    }
    float _2364 = _2360;
    float _2366 = -_2332;
    float _2368 = fma(_2366, _333, _2336);
    float _2370 = -_2356;
    float _2372 = fma(_2324, _1205, _2370);
    float _2374 = fma(_2324, _1223, _2358);
    if (_1331)
    {
        float _2376 = fma(_1399, _2286, _2364);
        _1403 = _2376;
    }
    float _2378 = _1403;
    float _2380 = _1477 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    out.m_94.x = _2346;
    out.m_94.y = _2368;
    out.m_94.z = _2354;
    float _2382 = _1279 * _2374;
    float _2384 = fma(_1451, 100.0, _2378);
    float _2386 = abs(_1509);
    float _2388 = log2(_2386);
    float _2390 = fma(_1251, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2380);
    float _2392 = -_2382;
    float _2394 = fma(_1293, _2372, _2392);
    float _2396 = _2384 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2398 = _2384 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2400 = _1293 * _2374;
    float _2402 = -_2290;
    float _2404 = fma(_333, _2402, _2314);
    float _2406 = _2384 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2408 = fma(_1433, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2398);
    float _2410 = _1477 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2412 = fma(_1433, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2396);
    float _2414 = fma(_1257, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2390);
    float _2416 = fma(_1279, _2372, _2400);
    float _2418 = fma(_1251, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2410);
    float _2420 = fma(_1437, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2408);
    float _2422 = _2414 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _2424 = _2388 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2426 = fma(_1257, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2418);
    float _2428 = _2384 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2430 = trunc(_2422);
    int _2432 = int(_2430);
    float _2434 = fma(_1433, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2406);
    float _2436 = _2426 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _2438 = fma(_1437, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2412);
    float _2440 = _2420 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2442 = fma(_1433, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2428);
    float _2444 = fma(_1437, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2434);
    float _2446 = _2438 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2448 = trunc(_2436);
    int _2450 = int(_2448);
    float _2452 = _2440 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2454 = _2440 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2456 = fma(_1437, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2442);
    float _2458 = _2444 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2460 = _2440 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2462 = _2440 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2464 = fma(_2446, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2452);
    float _2466 = exp2(_2424);
    float _2468 = fma(_2446, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2454);
    float _2470 = fma(_2446, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2460);
    float _2472 = fma(_2446, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2462);
    float _2474 = _2456 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2476 = fma(_2458, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2464);
    float _2478 = fma(_2458, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2468);
    int _2480 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2482 = _2432 + _2480;
    int _2484 = _2482 + 1;
    float _2486 = fma(_2458, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2470);
    int _2488 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2490 = _2450 + _2488;
    int _2492 = _2490 + 1;
    float _2494 = fma(_2458, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2472);
    float _2496 = fma(_2474, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2476);
    float _2498 = fma(_2474, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2478);
    bool _2500 = _2484 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _2502 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2504 = _2384 + _2502;
    int _2506 = _2484 | _2492;
    float _2508 = fma(_2466, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2510 = precise::clamp(_2508, 0.0, 1.0);
    float _2512 = fma(_2474, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2486);
    bool _2514 = _2506 < 0;
    bool _2516 = _2514 || _2500;
    float _2518 = fma(_2474, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2494);
    bool _2520 = _1509 <= 8000.0;
    bool _2522 = isnan(_1509);
    bool _2524 = _2520 || _2522;
    bool _2526 = isnan(8000.0);
    bool _2528 = _2524 || _2526;
    float _2530 = float(_2528);
    float _2532 = fma(_2510, -2.0, 3.0);
    float _2534 = _2510 * _2510;
    bool _2536 = _2492 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2538 = _2536 || _2516;
    float _2540 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2542 = _1433 + _2540;
    float _2544 = _2504 * _2504;
    float _2546 = _2534 * _2532;
    out.gl_Position.x = _2512;
    out.gl_Position.y = _2496;
    out.gl_Position.z = _2498;
    out.gl_Position.w = _2518;
    float _2548 = fma(_2542, _2542, _2544);
    float _2550 = -_2546;
    float _2552 = _2550 + 1.0;
    float _2554 = fma(_2552, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2546);
    float _2556 = _2530 * _2554;
    float _2558 = _2512;
    float _2560 = _2496;
    float _2562 = _2498;
    float _2564 = _2518;
    float _2566 = _2552;
    float _2568 = _2436;
    if (_2538)
    {
        _2558 = 1.0;
    }
    float _2570 = _2558;
    float _2572 = _2570;
    if (!_2538)
    {
        int _2574 = _2492 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2576 = _2574 + _2484;
        float _2578 = floor(_2436);
        int _2580 = _2576 << 2;
        uint _2582 = uint(int(uint(_2576) >> uint(2)));
        int _2584 = 12 & _2580;
        int _2586 = int(_2582) << 4;
        int _2588 = _2586 + _2584;
        float _2590 = floor(_2422);
        float _2592 = -_2578;
        float _2594 = _2436 + _2592;
        int _2596 = _2588 + 400;
        uint _2598 = uint(int(uint(_2596) >> uint(2)));
        uint _2600 = uint(int(uint(int(_2598)) >> uint(2)));
        int _2602 = int(_2598) & 3;
        float _2604 = (*spvDescriptorSet0.vp_c15)._m0[int(_2600)][_2602];
        float _2606 = -_2590;
        float _2608 = _2422 + _2606;
        float _2610 = rint(_2604);
        float _2612 = precise::max(_2610, 0.0);
        uint _2614 = uint(_2612);
        uint _2616 = clamp(_2614, 0u, 65535u);
        float3 _7129 = float3(_2608, _2594, float(int(_2616)));
        float3 _7131 = select(_7129, float3(0.0), isnan(_7129));
        float _2618 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _7131.xy, uint(rint(_7131.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _7131.xy, uint(rint(_7131.z)), level(0.0)).x;
        int _2620 = _2576 << 4;
        int _2622 = _2620 + 2048;
        uint _2624 = uint(int(uint(_2622) >> uint(2)));
        uint _2626 = uint(int(uint(int(_2624)) >> uint(2)));
        int _2628 = int(_2624) & 3;
        float _2630 = (*spvDescriptorSet0.vp_c15)._m0[int(_2626)][_2628];
        int _2632 = int(_2624) + 1;
        uint _2634 = uint(int(uint(_2632) >> uint(2)));
        int _2636 = _2632 & 3;
        float _2638 = (*spvDescriptorSet0.vp_c15)._m0[int(_2634)][_2636];
        int _2640 = _2622 + 8;
        uint _2642 = uint(int(uint(_2640) >> uint(2)));
        uint _2644 = uint(int(uint(int(_2642)) >> uint(2)));
        int _2646 = int(_2642) & 3;
        float _2648 = (*spvDescriptorSet0.vp_c15)._m0[int(_2644)][_2646];
        int _2650 = int(_2642) + 1;
        uint _2652 = uint(int(uint(_2650) >> uint(2)));
        int _2654 = _2650 & 3;
        float _2656 = (*spvDescriptorSet0.vp_c15)._m0[int(_2652)][_2654];
        float _2658 = _1477 * _2638;
        float _2660 = fma(_1251, _2630, _2658);
        float _2662 = fma(_1257, _2648, _2660);
        float _2664 = _2662 + _2656;
        float _2666 = precise::clamp(_2664, 0.0, 1.0);
        float _2668 = -_2666;
        float _2670 = _2668 + _2618;
        float _2672 = fma(_2670, 500.0, 1.5);
        float _2674 = exp2(_2672);
        float _2676 = 0.0 + _2674;
        float _2678 = precise::clamp(_2676, 0.0, 1.0);
        _2560 = _2604;
        _2572 = _2678;
        _2562 = as_type<float>(_2622);
        _2564 = _2618;
    }
    float _2680 = _2560;
    float _2682 = _2572;
    float _2684 = _2562;
    float _2686 = _2564;
    float _2688 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2690 = _1437 + _2688;
    float _2692 = _2556 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2694 = -_1770;
    float _2696 = _2694 + 1.0;
    float _2698 = _2680;
    float _2700 = _2686;
    float _2702 = _2684;
    if (!_1724)
    {
        _2698 = 1.0;
    }
    float _2704 = _2698;
    float _2706 = fma(_2690, _2690, _2548);
    float _2708 = _2704;
    if (_1724)
    {
        bool _2710 = _1776 >= _1768;
        bool _2712 = isnan(_1776);
        bool _2714 = _2710 || _2712;
        bool _2716 = isnan(_1768);
        bool _2718 = _2714 || _2716;
        float _2720 = float(_2718);
        _2708 = _2720;
    }
    float _2722 = _2708;
    float _2724 = _2696 * _2692;
    float _2726 = precise::clamp(_2724, 0.0, 1.0);
    out.m_96.x = _2416;
    out.m_96.y = _2404;
    out.m_96.z = _2394;
    float _2728 = _2722 * _2682;
    float _2730 = sqrt(_2706);
    float _2732 = -_2726;
    float _2734 = fma(_2732, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_98.x = _1433;
    out.m_98.y = _2384;
    out.m_98.z = _1437;
    float _2736 = -_2728;
    float _2738 = fma(_2736, _2734, 1.0);
    float _2740 = precise::clamp(_2738, 0.0, 1.0);
    float _2742 = _2740 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_100.x = _2742;
    bool _2744 = _2730 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2746 = isnan(_2730);
    bool _2748 = _2744 || _2746;
    bool _2750 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2752 = _2748 || _2750;
    float _2754 = _2734;
    float _2756 = _2740;
    if (!_2752)
    {
        _2566 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2758 = _2566;
    float _2760 = _2758;
    float _2762 = _2758;
    if (!_2752)
    {
        _2568 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2764 = _2568;
    float _2766 = _2764;
    float _2768 = _2764;
    if (!_2752)
    {
        _2700 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2770 = _2700;
    float _2772 = _2770;
    float _2774 = _2770;
    if (!_2752)
    {
        _2702 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2776 = _2702;
    float _2778 = _2776;
    float _2780 = _2776;
    if (!_2752)
    {
        _2754 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2782 = _2754;
    float _2784 = _2782;
    float _2786 = _2782;
    if (!_2752)
    {
        _2756 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2788 = _2756;
    bool _2790 = !_2752;
    float _2792 = _2788;
    float _2794 = _2788;
    if (!_2790)
    {
        bool _2796 = _2730 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2798 = isnan(_2730);
        bool _2800 = _2796 || _2798;
        bool _2802 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2804 = _2800 || _2802;
        if (!_2804)
        {
            float _2806 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2808 = _2730 + _2806;
            float _2810 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2812 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2810;
            float _2814 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2816 = _2814 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2818 = 1.0 / _2812;
            float _2820 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2822 = _2820 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2824 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2826 = _2824 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2828 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2830 = _2828 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2832 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2834 = _2832 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2836 = _2808 * _2818;
            float _2838 = precise::clamp(_2836, 0.0, 1.0);
            float _2840 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2842 = _2840 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2844 = fma(_2838, _2816, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2846 = fma(_2838, _2842, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2848 = fma(_2838, _2822, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2850 = fma(_2838, _2826, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2852 = fma(_2838, _2830, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2854 = fma(_2838, _2834, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2768 = _2844;
            _2786 = _2852;
            _2762 = _2848;
            _2780 = _2850;
            _2774 = _2846;
            _2794 = _2854;
            _2856 = true;
        }
        else
        {
            bool _2858 = _2730 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2860 = isnan(_2730);
            bool _2862 = _2858 || _2860;
            bool _2864 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2866 = _2862 || _2864;
            if (!_2866)
            {
                _2760 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2868 = _2760;
            _2762 = _2868;
            if (!_2866)
            {
                _2766 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2870 = _2766;
            _2768 = _2870;
            if (!_2866)
            {
                _2772 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2872 = _2772;
            _2774 = _2872;
            if (!_2866)
            {
                _2778 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2874 = _2778;
            _2780 = _2874;
            if (!_2866)
            {
                _2784 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2876 = _2784;
            _2786 = _2876;
            if (!_2866)
            {
                _2792 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2878 = _2792;
            bool _2880 = !_2866;
            _2794 = _2878;
            if (!_2880)
            {
                bool _2882 = _2730 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2884 = isnan(_2730);
                bool _2886 = _2882 || _2884;
                bool _2888 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2890 = _2886 || _2888;
                if (!_2890)
                {
                    float _2892 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2894 = _2730 + _2892;
                    float _2896 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2898 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2896;
                    float _2900 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2902 = _2900 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2904 = 1.0 / _2898;
                    float _2906 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2908 = _2906 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2910 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2912 = _2910 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2914 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2916 = _2914 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2918 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2920 = _2918 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2922 = _2894 * _2904;
                    float _2924 = precise::clamp(_2922, 0.0, 1.0);
                    float _2926 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2928 = _2926 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2930 = fma(_2924, _2902, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2932 = fma(_2924, _2928, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2934 = fma(_2924, _2908, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2936 = fma(_2924, _2912, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2938 = fma(_2924, _2916, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2940 = fma(_2924, _2920, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2768 = _2930;
                    _2786 = _2938;
                    _2762 = _2934;
                    _2780 = _2936;
                    _2774 = _2932;
                    _2794 = _2940;
                    _2856 = true;
                }
                else
                {
                    _2768 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2786 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2762 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2780 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2774 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2794 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2856 = false;
    float _2942 = _2768;
    float _2944 = _2786;
    float _2946 = _2762;
    float _2948 = _2780;
    float _2950 = _2774;
    float _2952 = _2794;
    float _2954 = fma(_2404, -0.5, 0.5);
    float _2956 = precise::clamp(_2954, 0.0, 1.0);
    float _2958 = -_2942;
    float _2960 = _2958 + _2944;
    float _2962 = -_2946;
    float _2964 = _2962 + _2948;
    float _2966 = -_2950;
    float _2968 = _2966 + _2952;
    bool _2970 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2972 = fma(_2956, _2960, _2942);
    float _2974 = fma(_2956, _2964, _2946);
    float _2976 = fma(_2956, _2968, _2950);
    float _2978 = _2972 * 0.586610972881317138671875;
    out.m_52.x = 1.0;
    float _2980 = fma(_2974, 0.298911988735198974609375, _2978);
    float _2982 = fma(_2976, 0.114477999508380889892578125, _2980);
    out.m_102.x = 0.0;
    float _2984 = -_2982;
    float _2986 = _2974 + _2984;
    float _2988 = -_2982;
    float _2990 = _2972 + _2988;
    float _2992 = -_2982;
    float _2994 = _2976 + _2992;
    float _2996 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2998 = fma(_2986, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2982);
    float _3000 = fma(_2990, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2982);
    float _3002 = fma(_2994, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2982);
    out.m_100.w = _2996;
    out.m_104.x = _2998;
    out.m_104.y = _3000;
    out.m_104.z = _3002;
    if (!_2970)
    {
        return out;
    }
    float _3004 = -_2384;
    float _3006 = _3004 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3008 = -_1433;
    float _3010 = _3008 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3012 = -_1437;
    float _3014 = _3012 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3016 = _3006 * _3006;
    float _3018 = fma(_3010, _3010, _3016);
    float _3020 = fma(_3014, _3014, _3018);
    float _3022 = sqrt(_3020);
    float _3024 = rsqrt(_3020);
    float _3026 = -_3022;
    float _3028 = _3026 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3030 = _3028 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3032 = precise::clamp(_3030, 0.0, 1.0);
    float _3034 = _3010 * _3024;
    float _3036 = _3006 * _3024;
    float _3038 = abs(_3032);
    float _3040 = log2(_3038);
    float _3042 = _3014 * _3024;
    float _3044 = _3034 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3046 = _2404 * _3036;
    float _3048 = -_3036;
    float _3050 = -_3044;
    float _3052 = fma(_3048, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3050);
    float _3054 = fma(_2416, _3034, _3046);
    float _3056 = -_3042;
    float _3058 = fma(_3056, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3052);
    float _3060 = fma(_2394, _3042, _3054);
    float _3062 = precise::clamp(_3060, 0.0, 1.0);
    float _3064 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3066 = _3058 + _3064;
    float _3068 = _3040 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3070 = _3066 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3072 = precise::clamp(_3070, 0.0, 1.0);
    float _3074 = exp2(_3068);
    float _3076 = _3074 * _3072;
    float _3078 = _3062 * _3076;
    float _3080 = _3078 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3082 = _3078 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3084 = _3078 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_102.x = _3080;
    out.m_102.y = _3082;
    out.m_102.z = _3084;
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
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_52 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_104 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_102 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_100 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2856 = false;
    bool _361 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _118 = in.m_49.w;
    float _120 = trunc(_118);
    int _123 = int(_120);
    bool _127 = _123 >= 1;
    float _129 = 0.0;
    float _131 = as_type<float>(_123);
    if (!_127)
    {
        _129 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _129;
    if (!_127)
    {
        out.m_52.x = 0.0;
    }
    int _135 = 0;
    if (!_127)
    {
        float _137 = _133 * 5.0;
        _135 = as_type<int>(_137);
    }
    int _139 = _135;
    if (!_127)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3141 = as_type<float>(_139);
        out.gl_Position.z = _3141;
    }
    if (!_127)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _141 = in.m_54.w;
    float _143 = float(_123);
    float _145 = in.m_56.x;
    float _147 = in.m_56.y;
    float _149 = -_141;
    float _151 = _149 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _153 = _141 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _155 = isnan(_141);
    bool _157 = _153 || _155;
    bool _159 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _161 = _157 || _159;
    out.m_58.x = _145;
    bool _163 = _151 >= _143;
    bool _165 = !_161;
    bool _167 = _163 || _165;
    out.m_58.y = _147;
    float _169 = _147;
    if (_167)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _171 = _131;
    if (_167)
    {
        out.m_52.x = 0.0;
    }
    int _173 = 0;
    if (_167)
    {
        float _175 = _171 * 5.0;
        _173 = as_type<int>(_175);
    }
    int _177 = _173;
    if (_167)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3213 = as_type<float>(_177);
        out.gl_Position.z = _3213;
    }
    if (_167)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _179 = in.m_60.x;
    float _181 = in.m_60.y;
    float _183 = in.m_60.z;
    float _185 = 1.0 / _143;
    float _187 = in.m_62.x;
    float _189 = in.m_62.y;
    float _191 = in.m_62.z;
    float _193 = in.m_64.x;
    float _195 = in.m_64.y;
    float _197 = in.m_64.z;
    float _199 = _151 * _185;
    float _201 = _179 * _179;
    float _203 = _181 * _181;
    float _205 = fma(_187, _187, _201);
    float _207 = fma(_189, _189, _203);
    float _209 = fma(_193, _193, _205);
    float _211 = _183 * _183;
    float _213 = fma(_195, _195, _207);
    float _215 = sqrt(_209);
    float _217 = fma(_191, _191, _211);
    float _219 = fma(_197, _197, _217);
    float _221 = sqrt(_213);
    float _223 = sqrt(_219);
    bool _225 = _215 > 0.0;
    bool _227 = _221 > 0.0;
    float _229 = _215;
    float _231 = _221;
    float _233 = _209;
    float _235 = _219;
    float _237 = _213;
    if (_225)
    {
        float _239 = rsqrt(_209);
        _229 = _239;
    }
    float _241 = _229;
    float _243 = 0.0;
    if (!_225)
    {
        _243 = 0.0;
    }
    float _245 = _243;
    bool _247 = _223 > 0.0;
    float _249 = 0.0;
    float _251 = _245;
    float _253 = _223;
    if (!_225)
    {
        _249 = 0.0;
    }
    float _255 = _249;
    float _257 = 0.0;
    float _259 = _255;
    if (!_225)
    {
        _257 = 0.0;
    }
    float _261 = _257;
    float _263 = 0.0;
    float _265 = _261;
    if (_227)
    {
        float _267 = rsqrt(_213);
        _263 = _267;
    }
    float _269 = _263;
    if (!_227)
    {
        _231 = 0.0;
    }
    float _271 = _231;
    float _273 = 0.0;
    float _275 = _271;
    if (_247)
    {
        float _277 = rsqrt(_219);
        _273 = _277;
    }
    float _279 = _273;
    float _281 = _241;
    if (_225)
    {
        float _283 = _241 * _179;
        _251 = _283;
    }
    float _285 = _251;
    if (_225)
    {
        float _287 = _241 * _187;
        _259 = _287;
    }
    float _289 = _259;
    if (_225)
    {
        float _291 = _241 * _193;
        _265 = _291;
    }
    float _293 = _265;
    bool _295 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    if (!_227)
    {
        _281 = 0.0;
    }
    float _297 = _281;
    float _299 = _297;
    if (!_247)
    {
        _233 = 0.0;
    }
    float _301 = _233;
    float _303 = _301;
    if (_227)
    {
        float _305 = _269 * _181;
        _275 = _305;
    }
    float _307 = _275;
    float _309 = _307;
    if (!_227)
    {
        _235 = 0.0;
    }
    float _311 = _235;
    float _313 = _311;
    if (_227)
    {
        float _315 = _269 * _189;
        _299 = _315;
    }
    float _317 = _299;
    if (!_247)
    {
        _253 = 0.0;
    }
    float _319 = _253;
    float _321 = _319;
    if (_227)
    {
        float _323 = _269 * _195;
        _313 = _323;
    }
    float _325 = _313;
    if (!_247)
    {
        _237 = 0.0;
    }
    float _327 = _237;
    float _329 = _327;
    if (_247)
    {
        float _331 = _279 * _183;
        _303 = _331;
    }
    float _333 = _303;
    if (_247)
    {
        float _335 = _279 * _191;
        _321 = _335;
    }
    float _337 = _321;
    if (_247)
    {
        float _339 = _279 * _197;
        _329 = _339;
    }
    float _341 = _329;
    bool _343 = !_295;
    float _359;
    if (!_343)
    {
        float _345 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _347 = _145 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _349 = fma(_347, (*spvDescriptorSet0.vp_c9)._m0[12].x, _151);
        float _351 = _349 * _345;
        float _353 = floor(_351);
        float _355 = -_353;
        float _357 = _351 + _355;
        _359 = _357;
        _361 = true;
    }
    else
    {
        _359 = _199;
    }
    _361 = false;
    float _363 = _359;
    float _365 = in.m_66.x;
    float _367 = in.m_66.y;
    float _369 = _151 * (*spvDescriptorSet0.vp_c9)._m0[193].y;
    float _371 = in.m_49.x;
    float _373 = in.m_49.y;
    float _375 = in.m_49.z;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _379 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _377;
    float _381 = fma(_145, 6.283185482025146484375, _369);
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _385 = _383 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _389 = _363 + _387;
    float _391 = 1.0 / _379;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _395 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _393;
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _399 = _363 + _397;
    float _401 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _403 = _363 + _401;
    float _405 = 1.0 / _395;
    float _407 = fma((*spvDescriptorSet0.vp_c9)._m0[194].y, 0.01745329238474369049072265625, _381);
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _411 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _409;
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _415 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _413;
    float _417 = _407 * 0.15915493667125701904296875;
    int _419 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _421 = _419 != 0;
    float _423 = -_367;
    float _425 = _423 + 1.0;
    float _427 = abs(_365);
    float _429 = log2(_427);
    float _431 = _399 * _391;
    float _433 = _189 * _373;
    float _435 = _195 * _373;
    float _437 = _407 * 1.2999999523162841796875;
    float _439 = fma(_187, _371, _433);
    float _441 = fma(_193, _371, _435);
    float _443 = _407 + 0.52359879016876220703125;
    float _445 = 1.0 / _385;
    float _447 = _443 * 0.15915493667125701904296875;
    float _449 = _389 * _405;
    float _451 = fma(_407, 0.60000002384185791015625, 0.31415927410125732421875);
    float _453 = _437 * 0.15915493667125701904296875;
    float _455 = _429 * (*spvDescriptorSet0.vp_c9)._m0[193].z;
    float _457 = fma(_407, 1.2999999523162841796875, 0.680678427219390869140625);
    float _459 = _407 * 0.60000002384185791015625;
    float _461 = _451 * 0.15915493667125701904296875;
    float _463 = -(*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _465 = _463 + (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _467 = exp2(_455);
    float _469 = _459 * 0.15915493667125701904296875;
    float _471 = (*spvDescriptorSet0.vp_c9)._m0[193].w * 3.1415927410125732421875;
    float _473 = fma(_465, _145, (*spvDescriptorSet0.vp_c9)._m0[191].x);
    float _475 = _403 * _445;
    float _477 = _469 * 6.283185482025146484375;
    float _479 = sin(_477);
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _483 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _481;
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _487 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _485;
    float _489 = fma(_483, _431, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _491 = fma(_471, _467, _369);
    float _493 = _453 * 6.283185482025146484375;
    float _495 = sin(_493);
    float _497 = in.m_68.x;
    float _499 = in.m_68.y;
    float _501 = in.m_68.z;
    float _503 = _457 * 0.15915493667125701904296875;
    float _505 = fma(_145, 6.283185482025146484375, _491);
    float _507 = _417 * 6.283185482025146484375;
    float _509 = sin(_507);
    float _511 = _147 * 628.31854248046875;
    float _513 = fma(_151, _473, _511);
    float _515 = _447 * 6.283185482025146484375;
    float _517 = sin(_515);
    float _519 = _513 * 0.89999997615814208984375;
    float _521 = _513 * 0.15915493667125701904296875;
    float _523 = fma(_365, 0.261799395084381103515625, -0.261799395084381103515625);
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _527 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _525;
    float _529 = _519 * 0.15915493667125701904296875;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _533 = _531 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _537 = _535 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _539 = _461 * 6.283185482025146484375;
    float _541 = sin(_539);
    bool _543 = _497 > 0.0;
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _547 = _545 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _549 = _497 >= 0.0;
    bool _551 = isnan(_497);
    bool _553 = _549 || _551;
    bool _555 = isnan(0.0);
    bool _557 = _553 || _555;
    float _559 = fma(_527, _431, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _561 = _513 + _523;
    int _563 = _557 ? 0 : 1;
    float _565 = fma(_411, _431, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _567 = _529 * 6.283185482025146484375;
    float _569 = cos(_567);
    float _571 = fma(_533, _475, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _573 = fma(_547, _475, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _575 = fma(_537, _475, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _579 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _577;
    float _581 = _561 * 0.15915493667125701904296875;
    float _583 = _561 * 0.89999997615814208984375;
    float _585 = _561 * 1.10000002384185791015625;
    float _587 = fma(_579, _449, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    int _589 = ~_563;
    int _591 = _589 + 1;
    int _593 = _591 + 1;
    float _595 = fma(_415, _449, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    int _597 = _593;
    float _599 = _501;
    float _601 = _373;
    if (!_543)
    {
        int _603 = ~_563;
        int _605 = _603 + 1;
        _597 = _605;
    }
    int _607 = _597;
    float _609 = _561 * 0.699999988079071044921875;
    bool _611 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _613 = isnan(_363);
    bool _615 = _611 || _613;
    bool _617 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _619 = _615 || _617;
    float _621 = float(_619);
    float _623 = fma(_479, 0.60000002384185791015625, _509);
    float _625 = _585 * 0.15915493667125701904296875;
    bool _627 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _629 = isnan(_363);
    bool _631 = _627 || _629;
    bool _633 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _635 = _631 || _633;
    float _637 = float(_635);
    float _639 = _503 * 6.283185482025146484375;
    float _641 = sin(_639);
    float _643 = -_621;
    float _645 = _643 + 1.0;
    float _647 = fma(_495, 0.300000011920928955078125, _623);
    float _649 = fma(_541, 0.60000002384185791015625, _517);
    float _651 = _609 * 0.15915493667125701904296875;
    bool _653 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _655 = isnan(_363);
    bool _657 = _653 || _655;
    bool _659 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _661 = _657 || _659;
    float _663 = float(_661);
    float _665 = _637 * _645;
    float _667 = -_637;
    float _669 = _667 + 1.0;
    float _671 = fma(_487, _449, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _673 = _505 * 0.15915493667125701904296875;
    float _675 = _505 * 0.60000002384185791015625;
    float _677 = _505 * 1.2999999523162841796875;
    bool _679 = _363 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _681 = isnan(_363);
    bool _683 = _679 || _681;
    bool _685 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _687 = _683 || _685;
    float _689 = float(_687);
    float _691 = _663 * _669;
    float _693 = -_663;
    float _695 = _693 + 1.0;
    float _697 = _625 * 6.283185482025146484375;
    float _699 = cos(_697);
    float _701 = _675 * 0.15915493667125701904296875;
    float _703 = -_365;
    float _705 = _703 + 1.0;
    float _707 = _689 * _695;
    float _709 = _583 * 0.15915493667125701904296875;
    float _711 = _499 + (-0.0199999995529651641845703125);
    float _713 = _647 * _705;
    float _715 = _489 * _707;
    float _717 = _673 * 6.283185482025146484375;
    float _719 = sin(_717);
    float _721 = fma(_641, 0.300000011920928955078125, _649);
    float _723 = -_689;
    float _725 = _723 + 1.0;
    float _727 = _677 * 0.15915493667125701904296875;
    float _729 = _559 * _707;
    float _731 = abs(_721);
    float _733 = _425 * _731;
    float _735 = fma(_725, (*spvDescriptorSet0.vp_c9)._m0[143].x, _715);
    float _737 = _565 * _707;
    float _739 = _701 * 6.283185482025146484375;
    float _741 = sin(_739);
    float _743 = fma(_725, (*spvDescriptorSet0.vp_c9)._m0[143].y, _729);
    float _745 = fma(_571, _691, _735);
    float _747 = _733 * (-45.0);
    float _749 = in.m_70.y;
    float _751 = fma(_725, (*spvDescriptorSet0.vp_c9)._m0[143].z, _737);
    float _753 = _713 * 0.52359879016876220703125;
    float _755 = fma(_573, _691, _743);
    float _757 = _709 * 6.283185482025146484375;
    float _759 = sin(_757);
    float _761 = _747 * 0.01745329238474369049072265625;
    float _763 = fma(_575, _691, _751);
    float _765 = fma(_587, _665, _745);
    float _767 = _753 * 0.15915493667125701904296875;
    float _769 = in.m_72.x;
    float _771 = in.m_72.y;
    float _773 = in.m_72.z;
    float _775 = _761 * 0.15915493667125701904296875;
    float _777 = float(_607);
    float _779 = _727 * 6.283185482025146484375;
    float _781 = sin(_779);
    float _783 = _733 * (-20.0);
    float _785 = fma(_595, _665, _755);
    float _787 = fma(_671, _665, _763);
    float _789 = fma(_741, 0.60000002384185791015625, _719);
    float _791 = _777 * _783;
    float _793 = fma(_621, (*spvDescriptorSet0.vp_c9)._m0[146].x, _765);
    float _795 = _581 * 6.283185482025146484375;
    float _797 = sin(_795);
    float _799 = _791 * 0.01745329238474369049072265625;
    float _801 = _759 * 0.89999997615814208984375;
    float _803 = fma(_621, (*spvDescriptorSet0.vp_c9)._m0[146].y, _785);
    float _805 = fma(_621, (*spvDescriptorSet0.vp_c9)._m0[146].z, _787);
    float _807 = fma(_749, 0.5, 0.5);
    float _809 = _799 * 0.15915493667125701904296875;
    float _811 = _651 * 6.283185482025146484375;
    float _813 = cos(_811);
    float _815 = fma(_781, 0.300000011920928955078125, _789);
    float _817 = _807 * _815;
    float _819 = _793 * _769;
    float _821 = _805 * _773;
    float _823 = _767 * 6.283185482025146484375;
    float _825 = sin(_823);
    float _827 = -_801;
    float _829 = fma(_797, -1.2000000476837158203125, _827);
    float _831 = _817 * (*spvDescriptorSet0.vp_c9)._m0[193].x;
    float _833 = _803 * _771;
    float _835 = abs(_829);
    bool _837 = _835 > 0.001000000047497451305389404296875;
    bool _839 = isnan(_835);
    bool _841 = _837 || _839;
    bool _843 = isnan(0.001000000047497451305389404296875);
    bool _845 = _841 || _843;
    float _847 = _831 * 0.01745329238474369049072265625;
    float _849 = _767 * 6.283185482025146484375;
    float _851 = cos(_849);
    float _853 = _813 * 0.699999988079071044921875;
    float _855 = _845 ? _829 : 0.001000000047497451305389404296875;
    float _857 = fma(_699, 1.10000002384185791015625, _853);
    float _859 = abs(_855);
    bool _861 = _859 == 0.0;
    float _863 = _775 * 6.283185482025146484375;
    float _865 = sin(_863);
    float _867 = _825 * _497;
    float _869 = abs(_857);
    bool _871 = _869 != 0.0;
    bool _873 = isnan(_869);
    bool _875 = _871 || _873;
    bool _877 = isnan(0.0);
    bool _879 = _875 || _877;
    float _881 = abs(_855);
    bool _883 = _881 == 0.0;
    bool _885 = !_879;
    bool _887 = _883 && _885;
    float _889 = _775 * 6.283185482025146484375;
    float _891 = cos(_889);
    float _893 = -_867;
    float _895 = fma(_851, _501, _893);
    float _897 = _851 * _497;
    float _899 = _851;
    float _901 = _809;
    int _903 = as_type<int>(_847);
    int _905 = _879 ? (-1) : 0;
    bool _907 = _861;
    float _909 = _755;
    if (_421)
    {
        _899 = _147;
    }
    float _911 = _899;
    float _913 = _895 + 0.02999999932944774627685546875;
    float _915 = fma(_825, _501, _897);
    float _917 = _809 * 6.283185482025146484375;
    float _919 = sin(_917);
    float _921 = _847 * 0.15915493667125701904296875;
    float _923 = _865 * _913;
    float _925 = fma(_777, -0.100000001490116119384765625, _915);
    bool _927 = false;
    int _929 = as_type<int>(_925);
    float _931 = _911;
    if (_887)
    {
        bool _933 = as_type<int>(_855) >= 0;
        _927 = _933;
    }
    bool _935 = _927;
    float _937 = _809 * 6.283185482025146484375;
    float _939 = cos(_937);
    float _941 = -_923;
    float _943 = fma(_891, _711, _941);
    float _945 = _891 * _913;
    float _947 = _521 * 6.283185482025146484375;
    float _949 = cos(_947);
    float _951 = _943 * _919;
    if (_421)
    {
        _901 = _145;
    }
    float _953 = _901;
    float _955 = _921 * 6.283185482025146484375;
    float _957 = sin(_955);
    float _959 = _943 * _939;
    float _961 = -_951;
    float _963 = fma(_939, _925, _961);
    int _965 = as_type<int>(_939);
    float _967 = _953;
    if (_421)
    {
        _903 = 0;
        _965 = 0;
    }
    int _969 = _903;
    int _971 = _965;
    float _973 = fma(_919, _925, _959);
    int _975 = _969;
    int _977 = _971;
    if (_887)
    {
        int _979 = _935 ? 0 : 1078530011;
        _929 = _979;
    }
    int _981 = _929;
    float _983 = _921 * 6.283185482025146484375;
    float _985 = cos(_983);
    int _987 = _981;
    if (!_421)
    {
        float _989 = _145 * 3.1415927410125732421875;
        float _991 = _989 * 0.15915493667125701904296875;
        float _993 = _147 * 3.1415927410125732421875;
        float _995 = _993 * 0.15915493667125701904296875;
        float _997 = _991 * 6.283185482025146484375;
        float _999 = sin(_997);
        float _1001 = _995 * 6.283185482025146484375;
        float _1003 = sin(_1001);
        _975 = 2;
        _977 = 1;
        _967 = _999;
        _931 = _1003;
    }
    int _1005 = _975;
    int _1007 = _977;
    float _1009 = _967;
    float _1011 = _931;
    float _1013 = _513 * 0.699999988079071044921875;
    if (_887)
    {
        int _1015 = int(0x80000000) & as_type<int>(_857);
        int _1017 = _981 | _1015;
        _599 = as_type<float>(_1017);
    }
    float _1019 = _599;
    bool _1021 = !_879;
    bool _1023 = _1021 && _861;
    float _1025 = _1019;
    float _1027 = _1019;
    if (!_1023)
    {
        float _1029 = abs(_857);
        bool _1031 = _1029 != as_type<float>(0x7f800000u /* inf */);
        bool _1033 = isnan(_1029);
        bool _1035 = _1031 || _1033;
        bool _1037 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1039 = _1035 || _1037;
        float _1041 = abs(_855);
        bool _1043 = _1041 == as_type<float>(0x7f800000u /* inf */);
        float _1045 = abs(_855);
        bool _1047 = _1045 == as_type<float>(0x7f800000u /* inf */);
        bool _1049 = !_1039;
        bool _1051 = _1047 && _1049;
        if (_1051)
        {
            bool _1053 = as_type<int>(_855) >= 0;
            _905 = _1053 ? (-1) : 0;
        }
        int _1055 = _905;
        if (_1051)
        {
            _987 = 1075235812;
        }
        int _1057 = _987;
        int _1059 = _1057;
        if (_1051)
        {
            int _1061 = ~_1055;
            int _1063 = (_1061 != 0) ? _1057 : 1061752795;
            _1059 = _1063;
        }
        int _1065 = _1059;
        if (_1051)
        {
            int _1067 = int(0x80000000) & as_type<int>(_857);
            int _1069 = _1065 | _1067;
            _1025 = as_type<float>(_1069);
        }
        float _1071 = _1025;
        bool _1073 = !_1039;
        bool _1075 = _1073 && _1043;
        _1027 = _1071;
        if (!_1075)
        {
            float _1077 = abs(_857);
            float _1079 = abs(_855);
            float _1081 = precise::max(_1077, _1079);
            float _1083 = abs(_857);
            float _1085 = abs(_855);
            float _1087 = precise::min(_1083, _1085);
            float _1089 = 1.0 / _1081;
            float _1091 = abs(_857);
            float _1093 = abs(_855);
            bool _1095 = _1091 > _1093;
            bool _1097 = as_type<int>(_855) >= 0;
            float _1099 = _1087 * _1089;
            float _1101 = _1099 * _1099;
            float _1103 = _1101 + 11.33538818359375;
            float _1105 = fma(_1101, _1103, 28.84246826171875);
            float _1107 = fma(_1101, _1105, 19.6966705322265625);
            float _1109 = fma(_1101, -0.82336294651031494140625, -5.674867153167724609375);
            float _1111 = fma(_1101, _1109, -6.565555095672607421875);
            float _1113 = 1.0 / _1107;
            float _1115 = _1101 * _1111;
            float _1117 = abs(_857);
            float _1119 = abs(_855);
            float _1121 = _1117 + _1119;
            int _1123 = as_type<int>(_857) & int(0x80000000);
            float _1125 = _1099 * _1115;
            bool _1127 = _1121 > as_type<float>(0x7f800000u /* inf */);
            bool _1129 = isnan(_1121);
            bool _1131 = _1127 || _1129;
            bool _1133 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1135 = _1131 || _1133;
            float _1137 = fma(_1125, _1113, _1099);
            float _1139 = _1137;
            _1027 = _1121;
            if (_1095)
            {
                float _1141 = -_1137;
                float _1143 = _1141 + 1.57079637050628662109375;
                _1139 = _1143;
            }
            float _1145 = _1139;
            int _1147 = as_type<int>(_1145);
            if (!_1097)
            {
                float _1149 = -_1145;
                float _1151 = _1149 + 3.1415927410125732421875;
                _1147 = as_type<int>(_1151);
            }
            int _1153 = _1147;
            if (!_1135)
            {
                int _1155 = _1123 | _1153;
                _1027 = as_type<float>(_1155);
            }
        }
    }
    float _1157 = _1027;
    float _1159 = _973 + 0.0199999995529651641845703125;
    float _1161 = fma(_777, 0.100000001490116119384765625, _963);
    float _1163 = _1013 * 0.15915493667125701904296875;
    float _1165 = in.m_56.z;
    float _1167 = _1159 * _957;
    float _1169 = _1159 * _985;
    float _1171 = fma(_865, _711, _945);
    float _1173 = _1157 + 1.57079637050628662109375;
    float _1175 = -_1167;
    float _1177 = fma(_1161, _985, _1175);
    float _1179 = fma(_1161, _957, _1169);
    float _1181 = _1171 + (-0.02999999932944774627685546875);
    float _1183 = _1173 * (-0.15915493667125701904296875);
    float _1185 = fma(_647, (*spvDescriptorSet0.vp_c9)._m0[194].x, _1177);
    float _1187 = _821 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1189 = in.m_62.w;
    float _1191 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1181);
    float _1193 = _833 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1195 = _513 * 1.10000002384185791015625;
    float _1197 = _819 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1199 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1185);
    float _1201 = in.m_64.w;
    float _1203 = _1183 * 6.283185482025146484375;
    float _1205 = cos(_1203);
    float _1207 = _1187 * _1191;
    float _1209 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1179);
    float _1211 = _1197 * _1199;
    float _1213 = _1195 * 0.15915493667125701904296875;
    float _1215 = _1207 * _317;
    float _1217 = _1193 * _1209;
    float _1219 = _1207 * _325;
    float _1221 = _1183 * 6.283185482025146484375;
    float _1223 = sin(_1221);
    float _1225 = fma(_1211, _289, _1215);
    float _1227 = _1165 * 6.283185482025146484375;
    float _1229 = fma(_1211, _293, _1219);
    float _1231 = fma(_191, _375, _439);
    float _1233 = -_1217;
    float _1235 = fma(_1233, _337, _1225);
    float _1237 = fma(_197, _375, _441);
    float _1239 = _1227 * 0.15915493667125701904296875;
    float _1241 = _1163 * 6.283185482025146484375;
    float _1243 = sin(_1241);
    float _1245 = -_1217;
    float _1247 = fma(_1245, _341, _1229);
    float _1249 = _1235 * _1205;
    float _1251 = _1231 + _1189;
    float _1253 = fma(_949, 1.2000000476837158203125, _569);
    float _1255 = _199 * 3.3333332538604736328125;
    float _1257 = _1237 + _1201;
    float _1259 = _1213 * 6.283185482025146484375;
    float _1261 = sin(_1259);
    float _1263 = _1235 * _1223;
    float _1265 = fma(_1247, _1223, _1249);
    float _1267 = -(*spvDescriptorSet0.vp_c9)._m0[192].w;
    float _1269 = _1267 + 1.0;
    float _1271 = -_1263;
    float _1273 = fma(_1247, _1205, _1271);
    float _1275 = _1251 + _1265;
    float _1277 = _1239 * 6.283185482025146484375;
    float _1279 = sin(_1277);
    float _1281 = _1257 + _1273;
    float _1283 = fma(_1253, (*spvDescriptorSet0.vp_c9)._m0[191].z, _1275);
    float _1285 = in.m_74.y;
    float _1287 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1289 = _1283 + _1287;
    float _1291 = _1239 * 6.283185482025146484375;
    float _1293 = cos(_1291);
    float _1295 = _1243 + _1261;
    float _1297 = fma(_1295, (*spvDescriptorSet0.vp_c9)._m0[191].z, _1281);
    float _1299 = _1279 * _1289;
    float _1301 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1303 = _1297 + _1301;
    float _1305 = _1293 * _1289;
    float _1307 = -_1299;
    float _1309 = fma(_1293, _1303, _1307);
    float _1311 = fma(_1279, _1303, _1305);
    float _1313 = _1309 + (*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1315 = _1311 + (*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1317 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1319 = _1313 + _1317;
    float _1321 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1323 = _1315 + _1321;
    float _1325 = _1319 * _1319;
    float _1327 = fma(_1323, _1323, _1325);
    float _1329 = sqrt(_1327);
    bool _1331 = _1329 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1333 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1335 = _1329 + _1333;
    float _1337 = 0.0 + _1255;
    float _1339 = precise::clamp(_1337, 0.0, 1.0);
    float _1341 = -_1255;
    float _1343 = _1341 + 3.3333332538604736328125;
    float _1345 = precise::clamp(_1343, 0.0, 1.0);
    float _1347 = precise::min(_1339, _1345);
    float _1349 = _373 + _1285;
    float _1351 = _1201;
    float _1353 = 5.0;
    float _1355 = _1165;
    if (_1331)
    {
        float _1357 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1351 = _1357;
    }
    float _1359 = _1351;
    float _1361 = fma(_1347, -5.0, 5.0);
    if (_1331)
    {
        float _1363 = rsqrt(_1327);
        _1353 = _1363;
    }
    float _1365 = _1353;
    float _1367 = _1359;
    if (_1331)
    {
        float _1369 = _1335 * _1359;
        _1367 = _1369;
    }
    float _1371 = _1367;
    float _1373 = _1207 * _307;
    float _1375 = _1371;
    if (_1331)
    {
        float _1377 = _1371 * 0.15915493667125701904296875;
        _1375 = _1377;
    }
    float _1379 = _1375;
    float _1381 = fma(_1211, _285, _1373);
    float _1383 = _1283;
    if (_1331)
    {
        float _1385 = _1379 * 6.283185482025146484375;
        float _1387 = sin(_1385);
        _1383 = _1387;
    }
    float _1389 = _1383;
    float _1391 = -_1217;
    float _1393 = fma(_1391, _333, _1381);
    float _1395 = _1349 + _1393;
    float _1397 = -_1361;
    float _1399 = fma(_1397, _1269, _1395);
    float _1401 = _1395;
    float _1403 = _1399;
    if (!_1331)
    {
        _1401 = _1313;
    }
    float _1405 = _1401;
    float _1407 = _1405;
    if (_1331)
    {
        float _1409 = _1399 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _601 = _1409;
    }
    float _1411 = _601;
    float _1413 = _1411;
    float _1415 = _1389;
    if (_1331)
    {
        float _1417 = fma(_1389, _1411, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1413 = _1417;
    }
    float _1419 = _1413;
    float _1421 = _1419;
    if (!_1331)
    {
        _1415 = _1315;
    }
    float _1423 = _1415;
    float _1425 = _1423;
    if (_1331)
    {
        float _1427 = _1365 * _1419;
        _1421 = _1427;
    }
    float _1429 = _1421;
    if (_1331)
    {
        float _1431 = fma(_1323, _1429, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1425 = _1431;
    }
    float _1433 = _1425;
    if (_1331)
    {
        float _1435 = fma(_1319, _1429, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1407 = _1435;
    }
    float _1437 = _1407;
    float _1439 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1441 = _1433 + _1439;
    float _1443 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1445 = _1437 + _1443;
    float _1447 = fma(_1441, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1449 = fma(_1445, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _5032 = float2(_1447, _1449);
    float _1451 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_5032, float2(0.0), isnan(_5032)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_5032, float2(0.0), isnan(_5032)), level(0.0)).x;
    float _1453 = in.m_70.x;
    float _1455 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    int _1457 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1459 = _1457 != 0;
    int _1461 = 2;
    if (_1459)
    {
        bool _1463 = _145 > 0.5;
        _907 = _1463;
    }
    bool _1465 = _907;
    float _1467 = _1453;
    if (!_1459)
    {
        _909 = _1453;
    }
    float _1469 = _909;
    float _1471 = fma(_1451, 100.0, _1349);
    float _1473 = _1471 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1475 = _1471 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1477 = _1471 + _1455;
    float _1479 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1473);
    float _1481 = fma(_1251, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1475);
    float _1483 = in.m_56.w;
    float _1485 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1479);
    float _1487 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1481);
    float _1489 = _1485 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1491 = _1487 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1493 = 1.0 / _1489;
    float _1495 = _1491 + _1489;
    float _1497 = _1495 * _1493;
    float _1499 = _1497 * 0.5;
    float _1501 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1503 = fma(_1499, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1501);
    float _1505 = 1.0 / _1503;
    float _1507 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1509 = _1505 * _1507;
    bool _1511 = _1509 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _1513 = _1509 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _1515 = !_1511;
    int _1517 = _1515 ? 0 : 1;
    float _1519 = _1469;
    if (!_1511)
    {
        _1461 = 1;
    }
    int _1521 = _1461;
    int _1523 = _1521;
    if (!_1513)
    {
        _1523 = _1517;
    }
    int _1525 = _1523;
    int _1527 = _1525 << 6;
    int _1529 = _1527 + 96;
    uint _1532 = uint(int(uint(_1529) >> uint(2)));
    uint _1534 = uint(int(uint(int(_1532)) >> uint(2)));
    int _1536 = int(_1532) & 3;
    float _1538 = (*spvDescriptorSet0.vp_c15)._m0[int(_1534)][_1536];
    int _1540 = int(_1532) + 1;
    uint _1542 = uint(int(uint(_1540) >> uint(2)));
    int _1544 = _1540 & 3;
    float _1546 = (*spvDescriptorSet0.vp_c15)._m0[int(_1542)][_1544];
    int _1548 = _1527 + 104;
    uint _1550 = uint(int(uint(_1548) >> uint(2)));
    uint _1552 = uint(int(uint(int(_1550)) >> uint(2)));
    int _1554 = int(_1550) & 3;
    float _1556 = (*spvDescriptorSet0.vp_c15)._m0[int(_1552)][_1554];
    int _1558 = int(_1550) + 1;
    uint _1560 = uint(int(uint(_1558) >> uint(2)));
    int _1562 = _1558 & 3;
    float _1564 = (*spvDescriptorSet0.vp_c15)._m0[int(_1560)][_1562];
    int _1566 = _1527 + 48;
    uint _1568 = uint(int(uint(_1566) >> uint(2)));
    uint _1570 = uint(int(uint(int(_1568)) >> uint(2)));
    int _1572 = int(_1568) & 3;
    float _1574 = (*spvDescriptorSet0.vp_c15)._m0[int(_1570)][_1572];
    int _1576 = int(_1568) + 1;
    uint _1578 = uint(int(uint(_1576) >> uint(2)));
    int _1580 = _1576 & 3;
    float _1582 = (*spvDescriptorSet0.vp_c15)._m0[int(_1578)][_1580];
    int _1584 = _1527 + 64;
    uint _1586 = uint(int(uint(_1584) >> uint(2)));
    uint _1588 = uint(int(uint(int(_1586)) >> uint(2)));
    int _1590 = int(_1586) & 3;
    float _1592 = (*spvDescriptorSet0.vp_c15)._m0[int(_1588)][_1590];
    int _1594 = int(_1586) + 1;
    uint _1596 = uint(int(uint(_1594) >> uint(2)));
    int _1598 = _1594 & 3;
    float _1600 = (*spvDescriptorSet0.vp_c15)._m0[int(_1596)][_1598];
    int _1602 = _1527 + 56;
    uint _1604 = uint(int(uint(_1602) >> uint(2)));
    uint _1606 = uint(int(uint(int(_1604)) >> uint(2)));
    int _1608 = int(_1604) & 3;
    float _1610 = (*spvDescriptorSet0.vp_c15)._m0[int(_1606)][_1608];
    int _1612 = int(_1604) + 1;
    uint _1614 = uint(int(uint(_1612) >> uint(2)));
    int _1616 = _1612 & 3;
    float _1618 = (*spvDescriptorSet0.vp_c15)._m0[int(_1614)][_1616];
    int _1620 = _1527 + 72;
    uint _1622 = uint(int(uint(_1620) >> uint(2)));
    uint _1624 = uint(int(uint(int(_1622)) >> uint(2)));
    int _1626 = int(_1622) & 3;
    float _1628 = (*spvDescriptorSet0.vp_c15)._m0[int(_1624)][_1626];
    int _1630 = int(_1622) + 1;
    uint _1632 = uint(int(uint(_1630) >> uint(2)));
    int _1634 = _1630 & 3;
    float _1636 = (*spvDescriptorSet0.vp_c15)._m0[int(_1632)][_1634];
    float _1638 = _1477 * _1546;
    float _1640 = fma(_1251, _1538, _1638);
    float _1642 = fma(_1257, _1556, _1640);
    float _1644 = _1642 + _1564;
    int _1646 = _1527 + 80;
    uint _1648 = uint(int(uint(_1646) >> uint(2)));
    uint _1650 = uint(int(uint(int(_1648)) >> uint(2)));
    int _1652 = int(_1648) & 3;
    float _1654 = (*spvDescriptorSet0.vp_c15)._m0[int(_1650)][_1652];
    int _1656 = int(_1648) + 1;
    uint _1658 = uint(int(uint(_1656) >> uint(2)));
    int _1660 = _1656 & 3;
    float _1662 = (*spvDescriptorSet0.vp_c15)._m0[int(_1658)][_1660];
    float _1664 = _1477 * _1582;
    float _1666 = 1.0 / _1644;
    float _1668 = fma(_1251, _1574, _1664);
    int _1670 = _1527 + 88;
    uint _1672 = uint(int(uint(_1670) >> uint(2)));
    uint _1674 = uint(int(uint(int(_1672)) >> uint(2)));
    int _1676 = int(_1672) & 3;
    float _1678 = (*spvDescriptorSet0.vp_c15)._m0[int(_1674)][_1676];
    int _1680 = int(_1672) + 1;
    uint _1682 = uint(int(uint(_1680) >> uint(2)));
    int _1684 = _1680 & 3;
    float _1686 = (*spvDescriptorSet0.vp_c15)._m0[int(_1682)][_1684];
    float _1688 = _1477 * _1600;
    float _1690 = fma(_1251, _1592, _1688);
    float _1692 = fma(_1257, _1610, _1668);
    float _1694 = _1692 + _1618;
    float _1696 = fma(_1251, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1698 = fma(_1257, _1628, _1690);
    float _1700 = _1694 * _1666;
    float _1702 = floor(_1696);
    float _1704 = _1698 + _1636;
    bool _1706 = _1700 >= 0.0;
    float _1708 = _1704 * _1666;
    bool _1710 = _1700 <= 1.0;
    bool _1712 = _1710 && _1706;
    float _1714 = fma(_1257, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    bool _1716 = _1708 >= 0.0;
    bool _1718 = _1716 && _1712;
    float _1720 = floor(_1714);
    bool _1722 = _1708 <= 1.0;
    bool _1724 = _1722 && _1718;
    float _1726 = _1477 * _1662;
    int _1728 = as_type<int>(_1662);
    float _1730 = _1694;
    if (_1459)
    {
        float _1732 = -_1453;
        float _1734 = _1732 + 1.0;
        _1728 = as_type<int>(_1734);
    }
    int _1736 = _1728;
    float _1738 = fma(_1251, _1654, _1726);
    float _1740 = fma(_1257, _1678, _1738);
    if (_1724)
    {
        float _1742 = float(_1525);
        _1730 = _1742;
    }
    float _1744 = _1730;
    float _1746 = -_1702;
    float _1748 = _1696 + _1746;
    float _1750 = _1740 + _1686;
    float _1752 = -_1720;
    float _1754 = _1714 + _1752;
    float _1756 = _1726;
    if (_1724)
    {
        float _1758 = rint(_1744);
        float _1760 = precise::max(_1758, 0.0);
        uint _1762 = uint(_1760);
        uint _1764 = clamp(_1762, 0u, 65535u);
        _1756 = as_type<float>(_1764);
    }
    float _1766 = _1756;
    float _1768 = _1750 * _1666;
    float2 _5564 = float2(_1748, _1754);
    float _1770 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5564, float2(0.0), isnan(_5564)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5564, float2(0.0), isnan(_5564)), level(0.0)).x;
    float _1772 = _1708;
    if (_1724)
    {
        float3 _5579 = float3(_1700, _1708, float(as_type<int>(_1766)));
        float3 _5583 = select(_5579, float3(0.0), isnan(_5579));
        float _1774 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5583.xy, uint(rint(_5583.z)), _1768, level(0.0));
        _1772 = _1774;
    }
    float _1776 = _1772;
    if (_1459)
    {
        float _1778 = _1465 ? as_type<float>(_1736) : _1453;
        _1519 = _1778;
    }
    float _1780 = _1519;
    float _1782 = -_749;
    float _1784 = _1782 + 1.0;
    bool _1786 = _147 > 0.5;
    out.m_76.x = _365;
    int _1788 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1790 = _1788 != 0;
    float _1792 = _147 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1794 = _1786 ? as_type<int>(_1784) : as_type<int>(_749);
    float _1796 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1798 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1800 = _1798 != 0;
    float _1802 = _1790 ? as_type<float>(_1794) : _749;
    float _1804 = in.m_78.x;
    float _1806 = in.m_78.y;
    float _1808 = in.m_78.z;
    float _1810 = in.m_78.w;
    bool _1812 = _1483 > 0.5;
    float _1814 = _145 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1816 = _1165 > 0.5;
    float _1818 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1820 = _1812 ? as_type<int>(_1784) : as_type<int>(_749);
    float _1822 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1824 = _1816 ? as_type<int>(_1784) : as_type<int>(_749);
    float _1826 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1828 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1830 = _1828 != 0;
    float _1832 = 0.0;
    if (_1800)
    {
        float _1834 = in.m_56.z;
        _1832 = _1834;
    }
    float _1836 = _1832;
    int _1838 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1840 = _1838 != 0;
    float _1842 = fma(_1792, -2.0, _1826);
    float _1844 = -_1822;
    float _1846 = fma(_1814, 2.0, _1844);
    float _1848 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1850 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1852 = _1830 ? as_type<float>(_1824) : _749;
    float _1854 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1856 = _1840 ? as_type<float>(_1820) : _749;
    float _1858 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _1860 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1862 = _1860 != 0;
    float _1864 = _317 * _1808;
    float _1866 = _1850 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1868 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1870 = _1868 != 0;
    float _1872 = _1854 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1874 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1876 = _1874 != 0;
    float _1878 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1880 = _1858 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1882 = _307 * _1808;
    float _1884 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1886 = _1862 ? as_type<float>(_1824) : _749;
    float _1888 = fma(_289, _1804, _1864);
    float _1890 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1892 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    out.m_80.x = _1866;
    out.m_80.y = _1872;
    out.m_80.z = _1880;
    out.m_80.w = _1878;
    float _1894 = _1884 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1896 = _1890 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1898 = _1892 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1900 = _325 * _1808;
    float _1902 = _1796 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1904 = _1818 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1906 = fma(_285, _1804, _1882);
    out.m_82.x = _1894;
    out.m_82.y = _1896;
    out.m_82.z = _1898;
    float _1908 = fma(_293, _1804, _1900);
    float _1910 = fma(_1904, _1802, -0.5);
    bool _1912 = _1862;
    int _1914 = as_type<int>(_1842);
    float _1916 = _1898;
    if (_1800)
    {
        bool _1918 = _1836 > 0.5;
        _1912 = _1918;
    }
    bool _1920 = _1912;
    float _1922 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _1924 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1926 = -_1806;
    float _1928 = fma(_337, _1926, _1888);
    float _1930 = -_1806;
    float _1932 = fma(_333, _1930, _1906);
    float _1934 = -_1806;
    float _1936 = fma(_341, _1934, _1908);
    float _1938 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1924);
    float _1940 = fma(_1902, _1856, -0.5);
    float _1942 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1944 = _1848 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1946 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1938);
    float _1948 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1842);
    float _1950 = _1946;
    int _1952 = as_type<int>(_1932);
    if (_1800)
    {
        float _1954 = -_1453;
        float _1956 = _1954 + 1.0;
        _1914 = as_type<int>(_1956);
    }
    int _1958 = _1914;
    if (!_1800)
    {
        _1916 = _1453;
    }
    float _1960 = _1916;
    float _1962 = fma(_1886, _1944, -0.5);
    float _1964 = -_1948;
    float _1966 = fma(_1946, _1910, _1964);
    out.m_84.x = _1928;
    out.m_84.y = _1932;
    out.m_84.z = _1936;
    float _1968 = _1960;
    float _1970 = _1962;
    if (_1800)
    {
        float _1972 = _1920 ? as_type<float>(_1958) : _1453;
        _1968 = _1972;
    }
    float _1974 = _1968;
    float _1976 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    bool _1978 = _1005 != 2;
    float _1980 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _1982 = _1922 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    bool _1984 = _1007 != 1;
    float _1986 = _1009 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _1988 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    if (!_1870)
    {
        _1950 = _1453;
    }
    float _1990 = _1950;
    float _1992 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1994 = _1990;
    if (_1870)
    {
        float _1996 = -_1453;
        float _1998 = _1996 + 1.0;
        _1952 = as_type<int>(_1998);
    }
    int _2000 = _1952;
    float _2002 = -_1980;
    float _2004 = fma(_1986, 2.0, _2002);
    float _2006 = _1942 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2008 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2010 = fma(_1009, (*spvDescriptorSet0.vp_c9)._m0[93].z, _1988);
    int _2012 = _2000;
    if (_1870)
    {
        float _2014 = _1786 ? as_type<float>(_2000) : _1453;
        _1994 = _2014;
    }
    float _2016 = _1994;
    if (_1876)
    {
        float _2018 = -_1453;
        float _2020 = _2018 + 1.0;
        _2012 = as_type<int>(_2020);
    }
    int _2022 = _2012;
    float _2024 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2026 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _2028 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2008);
    if (_1876)
    {
        float _2030 = _1786 ? as_type<float>(_2022) : _1453;
        _1467 = _2030;
    }
    float _2032 = _1467;
    float _2034 = _1976 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _2036 = fma(_1011, (*spvDescriptorSet0.vp_c9)._m0[93].w, _2026);
    float _2038 = fma(_2006, _1780, -0.5);
    float _2040 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _2042 = _1011 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _2044 = _1992 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2046 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2028);
    float _2048 = -_151;
    float _2050 = fma(_2048, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1846);
    float _2052 = fma(_2034, _2032, -0.5);
    float _2054 = fma(_2042, -2.0, _2040);
    float _2056 = _2024 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2058 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[92].z, _2010);
    float _2060 = -_151;
    float _2062 = fma(_2060, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2004);
    float _2064 = fma(_2046, _2038, _2050);
    float _2066 = _2046;
    float _2068 = _2058;
    float _2070 = _2036;
    if (_1978)
    {
        _2066 = _145;
    }
    float _2072 = _2066;
    float _2074 = fma(_2044, _1974, -0.5);
    float _2076 = _2072;
    if (!_1978)
    {
        _2076 = _1165;
    }
    float _2078 = _2076;
    float _2080 = fma(_2058, _2052, _2062);
    float _2082 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2084 = _2078;
    if (!_1984)
    {
        _2068 = _147;
    }
    float _2086 = _2068;
    float _2088 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[91].y, _2054);
    float _2090 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[92].w, _2036);
    float _2092 = _2078 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2094 = _2086;
    if (!_1984)
    {
        _2070 = _1165;
    }
    float _2096 = _2070;
    float _2098 = fma(_1852, _1982, -0.5);
    float _2100 = _2096;
    if (!_1984)
    {
        _2084 = _2086;
    }
    float _2102 = _2084;
    float _2104 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2106 = _2102;
    if (_1984)
    {
        _2094 = _145;
    }
    float _2108 = _2094;
    float _2110 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (_1984)
    {
        _2100 = _147;
    }
    float _2112 = _2100;
    float _2114 = -_2088;
    float _2116 = fma(_2090, _2098, _2114);
    float _2118 = fma(_2108, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2104);
    float _2120 = fma(_2112, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2110);
    float _2122 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    if (_1984)
    {
        _2106 = _145;
    }
    float _2124 = _2106;
    float _2126 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    if (_1984)
    {
        _1355 = _147;
    }
    float _2128 = _1355;
    float _2130 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2132 = fma(_2056, _2016, -0.5);
    float _2134 = _2124 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2136 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2122);
    float _2138 = _2128 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _2140 = _1179 != 0.0;
    bool _2142 = isnan(_1179);
    bool _2144 = _2140 || _2142;
    bool _2146 = isnan(0.0);
    bool _2148 = _2144 || _2146;
    float _2150 = -_2130;
    float _2152 = fma(_2134, 2.0, _2150);
    float _2154 = fma(_2138, -2.0, _2126);
    bool _2156 = _1185 == 0.0;
    bool _2158 = !_2148;
    bool _2160 = _2156 && _2158;
    float _2162 = in.m_86.x;
    float _2164 = in.m_86.y;
    float _2166 = in.m_86.z;
    float _2168 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2082);
    float _2170 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _2172 = _1171 == 0.02999999932944774627685546875;
    bool _2174 = _2172 && _2160;
    float _2176 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2120);
    float _2178 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2154);
    float _2180 = -_2170;
    float _2182 = fma(_2092, 2.0, _2180);
    float _2184 = -_151;
    float _2186 = fma(_2184, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2152);
    if (!_1978)
    {
        _169 = _145;
    }
    float _2188 = _169;
    float _2190 = -_2178;
    float _2192 = fma(_2176, _1940, _2190);
    float _2194 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2118);
    float _2196 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2198 = _2064 + 0.5;
    float _2200 = _2188 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2202 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2136);
    float _2204 = -_151;
    float _2206 = fma(_2204, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2182);
    float _2208 = _2192 + 0.5;
    float _2210 = fma(_2200, -2.0, _2196);
    float _2212 = fma(_2194, _2074, _2186);
    float _2214 = fma(_2202, _2132, _2206);
    float _2216 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2168);
    float _2218 = fma(_151, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2210);
    float _2220 = _1966 + 0.5;
    float _2222 = _2192;
    float _2224 = _2218;
    float _2226 = _2202;
    float _2228 = _2162;
    if (_2174)
    {
        _2222 = _2162;
    }
    float _2230 = _2222;
    float _2232 = _2212 + 0.5;
    float _2234 = -_2218;
    float _2236 = fma(_2216, _1962, _2234);
    float _2238 = _2230;
    if (_2174)
    {
        _2224 = _2166;
    }
    float _2240 = _2224;
    float _2242 = _2240;
    if (!_2174)
    {
        float _2244 = fma(_1181, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2166);
        _2242 = _2244;
    }
    float _2246 = _2242;
    if (_2174)
    {
        _2226 = _2230;
    }
    float _2248 = _2226;
    out.m_88.x = _2198;
    out.m_88.y = _2220;
    out.m_88.z = _2232;
    out.m_88.w = _2208;
    float _2250 = _2248;
    if (!_2174)
    {
        _2238 = _2162;
    }
    float _2252 = _2238;
    float _2254 = _2080 + 0.5;
    if (_2174)
    {
        _2228 = _2164;
    }
    float _2256 = _2228;
    float _2258 = _2116 + 0.5;
    float _2260 = _2214 + 0.5;
    float _2262 = _2256;
    if (!_2174)
    {
        float _2264 = fma(_1185, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2252);
        _2250 = _2264;
    }
    float _2266 = _2250;
    if (_2174)
    {
        _1970 = _2256;
    }
    float _2268 = _1970;
    float _2270 = _2236 + 0.5;
    float _2272 = _2268;
    if (!_2174)
    {
        _2262 = _2164;
    }
    float _2274 = _2262;
    float _2276 = _1806 * _2166;
    out.m_90.x = _2254;
    out.m_90.y = _2258;
    float _2278 = _1808 * _2252;
    float _2280 = _2208;
    if (_1331)
    {
        float _2282 = _1379 * 6.283185482025146484375;
        float _2284 = cos(_2282);
        _2280 = _2284;
    }
    float _2286 = _2280;
    if (!_2174)
    {
        float _2288 = fma(_1179, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2274);
        _2272 = _2288;
    }
    float _2290 = _2272;
    float _2292 = -_2276;
    float _2294 = fma(_1808, _2274, _2292);
    float _2296 = -_2278;
    float _2298 = fma(_1804, _2166, _2296);
    float _2300 = _1804 * _2274;
    float _2302 = _317 * _2246;
    float _2304 = _307 * _2246;
    float _2306 = _325 * _2246;
    float _2308 = -_2300;
    float _2310 = fma(_1806, _2252, _2308);
    float _2312 = fma(_289, _2266, _2302);
    float _2314 = fma(_285, _2266, _2304);
    float _2316 = fma(_293, _2266, _2306);
    float _2318 = _2310 * _1810;
    float _2320 = _2294 * _1810;
    out.m_92.x = _2260;
    out.m_92.y = _2270;
    float _2322 = -_2290;
    float _2324 = fma(_341, _2322, _2316);
    float _2326 = _2318 * _317;
    float _2328 = _2318 * _307;
    float _2330 = _2318 * _325;
    float _2332 = _2298 * _1810;
    float _2334 = fma(_2320, _289, _2326);
    float _2336 = fma(_2320, _285, _2328);
    float _2338 = fma(_2320, _293, _2330);
    float _2340 = -_2290;
    float _2342 = fma(_337, _2340, _2312);
    float _2344 = -_2332;
    float _2346 = fma(_2344, _337, _2334);
    if (_1331)
    {
        float _2348 = _2286 + (-1.0);
        _309 = _2348;
    }
    float _2350 = _309;
    float _2352 = -_2332;
    float _2354 = fma(_2352, _341, _2338);
    float _2356 = _2342 * _1223;
    float _2358 = _2342 * _1205;
    float _2360 = _2350;
    if (_1331)
    {
        float _2362 = _2350 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2360 = _2362;
    }
    float _2364 = _2360;
    float _2366 = -_2332;
    float _2368 = fma(_2366, _333, _2336);
    float _2370 = -_2356;
    float _2372 = fma(_2324, _1205, _2370);
    float _2374 = fma(_2324, _1223, _2358);
    if (_1331)
    {
        float _2376 = fma(_1399, _2286, _2364);
        _1403 = _2376;
    }
    float _2378 = _1403;
    float _2380 = _1477 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    out.m_94.x = _2346;
    out.m_94.y = _2368;
    out.m_94.z = _2354;
    float _2382 = _1279 * _2374;
    float _2384 = fma(_1451, 100.0, _2378);
    float _2386 = abs(_1509);
    float _2388 = log2(_2386);
    float _2390 = fma(_1251, (*spvDescriptorSet0.vp_c15)._m0[126].x, _2380);
    float _2392 = -_2382;
    float _2394 = fma(_1293, _2372, _2392);
    float _2396 = _2384 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2398 = _2384 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2400 = _1293 * _2374;
    float _2402 = -_2290;
    float _2404 = fma(_333, _2402, _2314);
    float _2406 = _2384 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2408 = fma(_1433, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2398);
    float _2410 = _1477 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _2412 = fma(_1433, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2396);
    float _2414 = fma(_1257, (*spvDescriptorSet0.vp_c15)._m0[126].z, _2390);
    float _2416 = fma(_1279, _2372, _2400);
    float _2418 = fma(_1251, (*spvDescriptorSet0.vp_c15)._m0[127].x, _2410);
    float _2420 = fma(_1437, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2408);
    float _2422 = _2414 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _2424 = _2388 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2426 = fma(_1257, (*spvDescriptorSet0.vp_c15)._m0[127].z, _2418);
    float _2428 = _2384 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2430 = trunc(_2422);
    int _2432 = int(_2430);
    float _2434 = fma(_1433, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2406);
    float _2436 = _2426 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _2438 = fma(_1437, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2412);
    float _2440 = _2420 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2442 = fma(_1433, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2428);
    float _2444 = fma(_1437, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2434);
    float _2446 = _2438 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2448 = trunc(_2436);
    int _2450 = int(_2448);
    float _2452 = _2440 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2454 = _2440 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2456 = fma(_1437, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2442);
    float _2458 = _2444 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2460 = _2440 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2462 = _2440 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2464 = fma(_2446, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2452);
    float _2466 = exp2(_2424);
    float _2468 = fma(_2446, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2454);
    float _2470 = fma(_2446, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2460);
    float _2472 = fma(_2446, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2462);
    float _2474 = _2456 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2476 = fma(_2458, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2464);
    float _2478 = fma(_2458, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2468);
    int _2480 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _2482 = _2432 + _2480;
    int _2484 = _2482 + 1;
    float _2486 = fma(_2458, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2470);
    int _2488 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _2490 = _2450 + _2488;
    int _2492 = _2490 + 1;
    float _2494 = fma(_2458, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2472);
    float _2496 = fma(_2474, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2476);
    float _2498 = fma(_2474, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2478);
    bool _2500 = _2484 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _2502 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2504 = _2384 + _2502;
    int _2506 = _2484 | _2492;
    float _2508 = fma(_2466, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2510 = precise::clamp(_2508, 0.0, 1.0);
    float _2512 = fma(_2474, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2486);
    bool _2514 = _2506 < 0;
    bool _2516 = _2514 || _2500;
    float _2518 = fma(_2474, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2494);
    bool _2520 = _1509 <= 8000.0;
    bool _2522 = isnan(_1509);
    bool _2524 = _2520 || _2522;
    bool _2526 = isnan(8000.0);
    bool _2528 = _2524 || _2526;
    float _2530 = float(_2528);
    float _2532 = fma(_2510, -2.0, 3.0);
    float _2534 = _2510 * _2510;
    bool _2536 = _2492 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _2538 = _2536 || _2516;
    float _2540 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2542 = _1433 + _2540;
    float _2544 = _2504 * _2504;
    float _2546 = _2534 * _2532;
    out.gl_Position.x = _2512;
    out.gl_Position.y = _2496;
    out.gl_Position.z = _2498;
    out.gl_Position.w = _2518;
    float _2548 = fma(_2542, _2542, _2544);
    float _2550 = -_2546;
    float _2552 = _2550 + 1.0;
    float _2554 = fma(_2552, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2546);
    float _2556 = _2530 * _2554;
    float _2558 = _2512;
    float _2560 = _2496;
    float _2562 = _2498;
    float _2564 = _2518;
    float _2566 = _2552;
    float _2568 = _2436;
    if (_2538)
    {
        _2558 = 1.0;
    }
    float _2570 = _2558;
    float _2572 = _2570;
    if (!_2538)
    {
        int _2574 = _2492 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _2576 = _2574 + _2484;
        float _2578 = floor(_2436);
        int _2580 = _2576 << 2;
        uint _2582 = uint(int(uint(_2576) >> uint(2)));
        int _2584 = 12 & _2580;
        int _2586 = int(_2582) << 4;
        int _2588 = _2586 + _2584;
        float _2590 = floor(_2422);
        float _2592 = -_2578;
        float _2594 = _2436 + _2592;
        int _2596 = _2588 + 400;
        uint _2598 = uint(int(uint(_2596) >> uint(2)));
        uint _2600 = uint(int(uint(int(_2598)) >> uint(2)));
        int _2602 = int(_2598) & 3;
        float _2604 = (*spvDescriptorSet0.vp_c15)._m0[int(_2600)][_2602];
        float _2606 = -_2590;
        float _2608 = _2422 + _2606;
        float _2610 = rint(_2604);
        float _2612 = precise::max(_2610, 0.0);
        uint _2614 = uint(_2612);
        uint _2616 = clamp(_2614, 0u, 65535u);
        float3 _7129 = float3(_2608, _2594, float(int(_2616)));
        float3 _7131 = select(_7129, float3(0.0), isnan(_7129));
        float _2618 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _7131.xy, uint(rint(_7131.z)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _7131.xy, uint(rint(_7131.z)), level(0.0)).x;
        int _2620 = _2576 << 4;
        int _2622 = _2620 + 2048;
        uint _2624 = uint(int(uint(_2622) >> uint(2)));
        uint _2626 = uint(int(uint(int(_2624)) >> uint(2)));
        int _2628 = int(_2624) & 3;
        float _2630 = (*spvDescriptorSet0.vp_c15)._m0[int(_2626)][_2628];
        int _2632 = int(_2624) + 1;
        uint _2634 = uint(int(uint(_2632) >> uint(2)));
        int _2636 = _2632 & 3;
        float _2638 = (*spvDescriptorSet0.vp_c15)._m0[int(_2634)][_2636];
        int _2640 = _2622 + 8;
        uint _2642 = uint(int(uint(_2640) >> uint(2)));
        uint _2644 = uint(int(uint(int(_2642)) >> uint(2)));
        int _2646 = int(_2642) & 3;
        float _2648 = (*spvDescriptorSet0.vp_c15)._m0[int(_2644)][_2646];
        int _2650 = int(_2642) + 1;
        uint _2652 = uint(int(uint(_2650) >> uint(2)));
        int _2654 = _2650 & 3;
        float _2656 = (*spvDescriptorSet0.vp_c15)._m0[int(_2652)][_2654];
        float _2658 = _1477 * _2638;
        float _2660 = fma(_1251, _2630, _2658);
        float _2662 = fma(_1257, _2648, _2660);
        float _2664 = _2662 + _2656;
        float _2666 = precise::clamp(_2664, 0.0, 1.0);
        float _2668 = -_2666;
        float _2670 = _2668 + _2618;
        float _2672 = fma(_2670, 500.0, 1.5);
        float _2674 = exp2(_2672);
        float _2676 = 0.0 + _2674;
        float _2678 = precise::clamp(_2676, 0.0, 1.0);
        _2560 = _2604;
        _2572 = _2678;
        _2562 = as_type<float>(_2622);
        _2564 = _2618;
    }
    float _2680 = _2560;
    float _2682 = _2572;
    float _2684 = _2562;
    float _2686 = _2564;
    float _2688 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2690 = _1437 + _2688;
    float _2692 = _2556 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2694 = -_1770;
    float _2696 = _2694 + 1.0;
    float _2698 = _2680;
    float _2700 = _2686;
    float _2702 = _2684;
    if (!_1724)
    {
        _2698 = 1.0;
    }
    float _2704 = _2698;
    float _2706 = fma(_2690, _2690, _2548);
    float _2708 = _2704;
    if (_1724)
    {
        bool _2710 = _1776 >= _1768;
        bool _2712 = isnan(_1776);
        bool _2714 = _2710 || _2712;
        bool _2716 = isnan(_1768);
        bool _2718 = _2714 || _2716;
        float _2720 = float(_2718);
        _2708 = _2720;
    }
    float _2722 = _2708;
    float _2724 = _2696 * _2692;
    float _2726 = precise::clamp(_2724, 0.0, 1.0);
    out.m_96.x = _2416;
    out.m_96.y = _2404;
    out.m_96.z = _2394;
    float _2728 = _2722 * _2682;
    float _2730 = sqrt(_2706);
    float _2732 = -_2726;
    float _2734 = fma(_2732, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_98.x = _1433;
    out.m_98.y = _2384;
    out.m_98.z = _1437;
    float _2736 = -_2728;
    float _2738 = fma(_2736, _2734, 1.0);
    float _2740 = precise::clamp(_2738, 0.0, 1.0);
    float _2742 = _2740 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_100.x = _2742;
    bool _2744 = _2730 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2746 = isnan(_2730);
    bool _2748 = _2744 || _2746;
    bool _2750 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2752 = _2748 || _2750;
    float _2754 = _2734;
    float _2756 = _2740;
    if (!_2752)
    {
        _2566 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2758 = _2566;
    float _2760 = _2758;
    float _2762 = _2758;
    if (!_2752)
    {
        _2568 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2764 = _2568;
    float _2766 = _2764;
    float _2768 = _2764;
    if (!_2752)
    {
        _2700 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2770 = _2700;
    float _2772 = _2770;
    float _2774 = _2770;
    if (!_2752)
    {
        _2702 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2776 = _2702;
    float _2778 = _2776;
    float _2780 = _2776;
    if (!_2752)
    {
        _2754 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2782 = _2754;
    float _2784 = _2782;
    float _2786 = _2782;
    if (!_2752)
    {
        _2756 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2788 = _2756;
    bool _2790 = !_2752;
    float _2792 = _2788;
    float _2794 = _2788;
    if (!_2790)
    {
        bool _2796 = _2730 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2798 = isnan(_2730);
        bool _2800 = _2796 || _2798;
        bool _2802 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2804 = _2800 || _2802;
        if (!_2804)
        {
            float _2806 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2808 = _2730 + _2806;
            float _2810 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2812 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2810;
            float _2814 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2816 = _2814 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2818 = 1.0 / _2812;
            float _2820 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2822 = _2820 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2824 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2826 = _2824 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2828 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2830 = _2828 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2832 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2834 = _2832 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2836 = _2808 * _2818;
            float _2838 = precise::clamp(_2836, 0.0, 1.0);
            float _2840 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2842 = _2840 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2844 = fma(_2838, _2816, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2846 = fma(_2838, _2842, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2848 = fma(_2838, _2822, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2850 = fma(_2838, _2826, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2852 = fma(_2838, _2830, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2854 = fma(_2838, _2834, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2768 = _2844;
            _2786 = _2852;
            _2762 = _2848;
            _2780 = _2850;
            _2774 = _2846;
            _2794 = _2854;
            _2856 = true;
        }
        else
        {
            bool _2858 = _2730 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2860 = isnan(_2730);
            bool _2862 = _2858 || _2860;
            bool _2864 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2866 = _2862 || _2864;
            if (!_2866)
            {
                _2760 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2868 = _2760;
            _2762 = _2868;
            if (!_2866)
            {
                _2766 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2870 = _2766;
            _2768 = _2870;
            if (!_2866)
            {
                _2772 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2872 = _2772;
            _2774 = _2872;
            if (!_2866)
            {
                _2778 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2874 = _2778;
            _2780 = _2874;
            if (!_2866)
            {
                _2784 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2876 = _2784;
            _2786 = _2876;
            if (!_2866)
            {
                _2792 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2878 = _2792;
            bool _2880 = !_2866;
            _2794 = _2878;
            if (!_2880)
            {
                bool _2882 = _2730 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2884 = isnan(_2730);
                bool _2886 = _2882 || _2884;
                bool _2888 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2890 = _2886 || _2888;
                if (!_2890)
                {
                    float _2892 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2894 = _2730 + _2892;
                    float _2896 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2898 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2896;
                    float _2900 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2902 = _2900 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2904 = 1.0 / _2898;
                    float _2906 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2908 = _2906 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2910 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2912 = _2910 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2914 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2916 = _2914 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2918 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2920 = _2918 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2922 = _2894 * _2904;
                    float _2924 = precise::clamp(_2922, 0.0, 1.0);
                    float _2926 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2928 = _2926 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2930 = fma(_2924, _2902, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2932 = fma(_2924, _2928, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2934 = fma(_2924, _2908, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2936 = fma(_2924, _2912, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2938 = fma(_2924, _2916, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2940 = fma(_2924, _2920, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2768 = _2930;
                    _2786 = _2938;
                    _2762 = _2934;
                    _2780 = _2936;
                    _2774 = _2932;
                    _2794 = _2940;
                    _2856 = true;
                }
                else
                {
                    _2768 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2786 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2762 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2780 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2774 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2794 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2856 = false;
    float _2942 = _2768;
    float _2944 = _2786;
    float _2946 = _2762;
    float _2948 = _2780;
    float _2950 = _2774;
    float _2952 = _2794;
    float _2954 = fma(_2404, -0.5, 0.5);
    float _2956 = precise::clamp(_2954, 0.0, 1.0);
    float _2958 = -_2942;
    float _2960 = _2958 + _2944;
    float _2962 = -_2946;
    float _2964 = _2962 + _2948;
    float _2966 = -_2950;
    float _2968 = _2966 + _2952;
    bool _2970 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2972 = fma(_2956, _2960, _2942);
    float _2974 = fma(_2956, _2964, _2946);
    float _2976 = fma(_2956, _2968, _2950);
    float _2978 = _2972 * 0.586610972881317138671875;
    out.m_52.x = 1.0;
    float _2980 = fma(_2974, 0.298911988735198974609375, _2978);
    float _2982 = fma(_2976, 0.114477999508380889892578125, _2980);
    out.m_102.x = 0.0;
    float _2984 = -_2982;
    float _2986 = _2974 + _2984;
    float _2988 = -_2982;
    float _2990 = _2972 + _2988;
    float _2992 = -_2982;
    float _2994 = _2976 + _2992;
    float _2996 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2998 = fma(_2986, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2982);
    float _3000 = fma(_2990, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2982);
    float _3002 = fma(_2994, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2982);
    out.m_100.w = _2996;
    out.m_104.x = _2998;
    out.m_104.y = _3000;
    out.m_104.z = _3002;
    if (!_2970)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3004 = -_2384;
    float _3006 = _3004 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3008 = -_1433;
    float _3010 = _3008 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3012 = -_1437;
    float _3014 = _3012 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3016 = _3006 * _3006;
    float _3018 = fma(_3010, _3010, _3016);
    float _3020 = fma(_3014, _3014, _3018);
    float _3022 = sqrt(_3020);
    float _3024 = rsqrt(_3020);
    float _3026 = -_3022;
    float _3028 = _3026 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3030 = _3028 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3032 = precise::clamp(_3030, 0.0, 1.0);
    float _3034 = _3010 * _3024;
    float _3036 = _3006 * _3024;
    float _3038 = abs(_3032);
    float _3040 = log2(_3038);
    float _3042 = _3014 * _3024;
    float _3044 = _3034 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3046 = _2404 * _3036;
    float _3048 = -_3036;
    float _3050 = -_3044;
    float _3052 = fma(_3048, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3050);
    float _3054 = fma(_2416, _3034, _3046);
    float _3056 = -_3042;
    float _3058 = fma(_3056, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3052);
    float _3060 = fma(_2394, _3042, _3054);
    float _3062 = precise::clamp(_3060, 0.0, 1.0);
    float _3064 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3066 = _3058 + _3064;
    float _3068 = _3040 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3070 = _3066 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3072 = precise::clamp(_3070, 0.0, 1.0);
    float _3074 = exp2(_3068);
    float _3076 = _3074 * _3072;
    float _3078 = _3062 * _3076;
    float _3080 = _3078 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3082 = _3078 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3084 = _3078 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_102.x = _3080;
    out.m_102.y = _3082;
    out.m_102.z = _3084;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_52.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_52.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_52.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_52.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_104.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_104.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_104.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_104.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_102.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_102.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_102.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_102.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_100.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_100.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_100.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_100.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

