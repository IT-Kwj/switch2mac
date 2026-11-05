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
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_24 [[id(7)]];
    sampler vp_t_tcb_24Smplr [[id(8)]];
    texture2d_array<float> vp_t_tcb_14 [[id(9)]];
    sampler vp_t_tcb_14Smplr [[id(10)]];
    texture2d_array<float> vp_t_tcb_16 [[id(11)]];
    sampler vp_t_tcb_16Smplr [[id(12)]];
    texture3d<float> vp_t_tcb_32 [[id(13)]];
    sampler vp_t_tcb_32Smplr [[id(14)]];
    texture3d<float> vp_t_tcb_30 [[id(15)]];
    sampler vp_t_tcb_30Smplr [[id(16)]];
    texture2d<float> vp_t_tcb_1C [[id(17)]];
    sampler vp_t_tcb_1CSmplr [[id(18)]];
    sampler vp_t_tcb_24Smplr_w [[id(19)]];
    sampler vp_t_tcb_14Smplr_w [[id(20)]];
    sampler vp_t_tcb_32Smplr_w [[id(21)]];
    sampler vp_t_tcb_30Smplr_w [[id(22)]];
    sampler vp_t_tcb_1CSmplr_w [[id(23)]];
    constant dm_border_t* dm_border [[id(24)]];
};

struct main0_out
{
    float4 m_74 [[user(locn0)]];
    float4 m_72 [[user(locn2)]];
    float4 m_78 [[user(locn3)]];
    float4 m_86 [[user(locn4)]];
    float4 m_61 [[user(locn5)]];
    float4 m_76 [[user(locn6)]];
    float4 m_84 [[user(locn7)]];
    float4 m_80 [[user(locn8)]];
    float4 m_82 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_58 [[attribute(2)]];
    float4 m_63 [[attribute(3)]];
    float4 m_65 [[attribute(4)]];
    float4 m_70 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2033 = false;
    bool _655 = false;
    bool _181 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _100 = in.m_58.w;
    float _102 = trunc(_100);
    int _105 = int(_102);
    bool _109 = _105 >= 1;
    float _111 = 0.0;
    if (!_109)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _113 = _111;
    float _115 = _113;
    if (!_109)
    {
        out.m_61.x = 0.0;
    }
    int _117 = 0;
    if (!_109)
    {
        float _119 = _113 * 5.0;
        _117 = as_type<int>(_119);
    }
    int _121 = _117;
    int _123 = _121;
    if (!_109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2338 = as_type<float>(_121);
        out.gl_Position.z = _2338;
    }
    if (!_109)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _125 = in.m_63.w;
    bool _127 = _125 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _129 = isnan(_125);
    bool _131 = _127 || _129;
    bool _133 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _135 = _131 || _133;
    float _137 = -_125;
    float _139 = _137 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _141 = 0.0;
    if (_135)
    {
        float _143 = float(_105);
        _141 = _143;
    }
    float _145 = _141;
    bool _147 = _139 >= _145;
    bool _149 = !_135;
    bool _151 = _147 || _149;
    if (_151)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _153 = _115;
    if (_151)
    {
        out.m_61.x = 0.0;
    }
    if (_151)
    {
        float _155 = _153 * 5.0;
        _123 = as_type<int>(_155);
    }
    int _157 = _123;
    if (_151)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2406 = as_type<float>(_157);
        out.gl_Position.z = _2406;
    }
    if (_151)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _159 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _161 = !_159;
    float _179;
    if (!_161)
    {
        float _163 = in.m_65.x;
        float _165 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _167 = _163 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _169 = fma(_167, (*spvDescriptorSet0.vp_c9)._m0[12].x, _139);
        float _171 = _169 * _165;
        float _173 = floor(_171);
        float _175 = -_173;
        float _177 = _171 + _175;
        _179 = _177;
        _181 = true;
    }
    else
    {
        float _183 = float(_105);
        float _185 = 1.0 / _183;
        float _187 = _139 * _185;
        _179 = _187;
    }
    _181 = false;
    float _189 = _179;
    float _191 = as_type<float>(int(gl_VertexIndex));
    float _193 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _195 = _189 + _193;
    float _197 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _199 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _201 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _199;
    float _203 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _205 = 1.0 / _201;
    float _207 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _203);
    bool _209 = _189 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _211 = isnan(_189);
    bool _213 = _209 || _211;
    bool _215 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _217 = _213 || _215;
    float _219 = float(_217);
    bool _221 = _189 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _223 = isnan(_189);
    bool _225 = _221 || _223;
    bool _227 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _229 = _225 || _227;
    float _231 = float(_229);
    float _233 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _207);
    float _235 = -_219;
    float _237 = _235 + 1.0;
    float _239 = sqrt(_233);
    int _241 = as_type<int>(_191) & 1;
    bool _243 = _241 != 0;
    int _245 = as_type<int>(_191) & 2;
    bool _247 = _245 != 0;
    float _249 = in.m_58.x;
    float _251 = in.m_58.y;
    float _253 = in.m_58.z;
    float _255 = _195 * _205;
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _259 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _257;
    float _261 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _263 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _261;
    float _265 = rsqrt(_233);
    float _267 = _231 * _237;
    float _269 = fma(_259, _255, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _271 = fma(_263, _255, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _273 = in.m_70.x;
    float _275 = in.m_70.y;
    float _277 = precise::max(_239, 2.0);
    float _279 = _271 * _267;
    bool _281 = !_247;
    float _283 = _281 ? (-0.5) : 0.5;
    float _285 = _269 * _267;
    bool _287 = !_243;
    float _289 = _287 ? (-0.5) : 0.5;
    float _291 = -_231;
    float _293 = _291 + 1.0;
    float _295 = precise::min(_277, 15.0);
    float _297 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[143].x, _285);
    float _299 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[143].y, _279);
    float _301 = fma(_295, 0.061538465321063995361328125, -0.12307693064212799072265625);
    float _303 = -_251;
    float _305 = _283 + _303;
    float _307 = -_249;
    float _309 = _289 + _307;
    float _311 = fma(_219, (*spvDescriptorSet0.vp_c9)._m0[144].x, _297);
    float _313 = fma(_219, (*spvDescriptorSet0.vp_c9)._m0[144].y, _299);
    float _315 = -_305;
    float _317 = fma(_305, _265, _315);
    float _319 = -_309;
    float _321 = fma(_309, _265, _319);
    float _323 = -_265;
    float _325 = fma(_323, _253, _253);
    float _327 = _251 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _329 = fma(_301, _317, _305);
    float _331 = fma(_301, _321, _309);
    float _333 = _313 * _275;
    float _335 = _311 * _273;
    float _337 = _329 + _251;
    float _339 = _331 + _249;
    float _341 = _333 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _343 = _335 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _345 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _337);
    float _347 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _339);
    float _349 = _301 * _325;
    float _351 = fma(_249, (*spvDescriptorSet0.vp_c10)._m0[4].x, _327);
    float _353 = _341 * _345;
    float _355 = _343 * _347;
    float _357 = _251 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _359 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _349);
    float _361 = _353 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _363 = _353 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _365 = fma(_249, (*spvDescriptorSet0.vp_c10)._m0[6].x, _357);
    float _367 = fma(_253, (*spvDescriptorSet0.vp_c10)._m0[4].z, _351);
    float _369 = fma(_355, (*spvDescriptorSet0.vp_c8)._m0[24].x, _361);
    float _371 = fma(_355, (*spvDescriptorSet0.vp_c8)._m0[26].x, _363);
    float _373 = fma(_253, (*spvDescriptorSet0.vp_c10)._m0[6].z, _365);
    float _375 = _367 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _377 = fma(_359, (*spvDescriptorSet0.vp_c8)._m0[24].z, _369);
    float _379 = fma(_359, (*spvDescriptorSet0.vp_c8)._m0[26].z, _371);
    float _381 = _373 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _383 = _251 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _385 = _377 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _387 = _379 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _389 = _353 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _391 = in.m_65.x;
    float _393 = in.m_65.y;
    float _395 = _375 + _385;
    float _397 = _381 + _387;
    float _399 = fma(_249, (*spvDescriptorSet0.vp_c10)._m0[5].x, _383);
    float _401 = fma(_355, (*spvDescriptorSet0.vp_c8)._m0[25].x, _389);
    float _403 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _405 = _395 + _403;
    float _407 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _409 = _397 + _407;
    float _411 = fma(_253, (*spvDescriptorSet0.vp_c10)._m0[5].z, _399);
    float _413 = fma(_359, (*spvDescriptorSet0.vp_c8)._m0[25].z, _401);
    float _415 = _405 * _405;
    float _417 = _409 * _409;
    float _419 = _411 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _421 = _413 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _423 = _415 + _417;
    float _425 = _419 + _421;
    int _427 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _429 = _427 != 0;
    float _431 = sqrt(_423);
    int _433 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _435 = _433 != 0;
    bool _437 = _391 > 0.5;
    bool _439 = _393 > 0.5;
    float _441 = -_289;
    int _443 = _437 ? as_type<int>(_441) : as_type<int>(_289);
    float _445 = -_283;
    int _447 = _439 ? as_type<int>(_445) : as_type<int>(_283);
    bool _449 = _431 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _451 = _421;
    float _453 = _411;
    float _455 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    float _457 = _395;
    float _459 = _397;
    float _461 = _409;
    if (!_449)
    {
        _451 = _395;
    }
    float _463 = _451;
    float _465 = _463;
    if (!_449)
    {
        _453 = _417;
    }
    float _467 = _453;
    float _469 = _467;
    if (!_449)
    {
        _455 = _415;
    }
    float _471 = _455;
    float _473 = _471;
    if (!_449)
    {
        _457 = _425;
    }
    float _475 = _457;
    bool _477 = !_449;
    float _479 = _475;
    if (!_477)
    {
        float _481 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _483 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _485 = _431 + _483;
        float _487 = rsqrt(_423);
        float _489 = _485 * _481;
        float _491 = _425 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _493 = _489 * 0.15915493667125701904296875;
        float _495 = _493 * 6.283185482025146484375;
        float _497 = sin(_495);
        float _499 = _493 * 6.283185482025146484375;
        float _501 = cos(_499);
        float _503 = fma(_497, _491, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _505 = _487 * _503;
        float _507 = _501 + (-1.0);
        float _509 = fma(_405, _505, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _511 = fma(_409, _505, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _513 = _507 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _515 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _517 = _509 + _515;
        float _519 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _521 = _511 + _519;
        float _523 = fma(_425, _501, _513);
        float _525 = _517 * _517;
        float _527 = _521 * _521;
        _479 = _523;
        _473 = _525;
        _469 = _527;
        _465 = _509;
        _459 = _511;
    }
    float _529 = _479;
    float _531 = _473;
    float _533 = _469;
    float _535 = _465;
    float _537 = _459;
    float _539 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _541 = _529 + _539;
    float _543 = _337 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _545 = !_435;
    float _547 = _545 ? _283 : as_type<float>(_447);
    float _549 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _551 = fma(_541, _541, _531);
    float _553 = _339 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _555 = _543 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _557 = _543 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _559 = !_429;
    float _561 = _559 ? _289 : as_type<float>(_443);
    float _563 = _543 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _565 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[17].y, 1.0);
    float _567 = _551 + _533;
    float _569 = fma(_553, (*spvDescriptorSet0.vp_c8)._m0[24].x, _555);
    float _571 = fma(_553, (*spvDescriptorSet0.vp_c8)._m0[25].x, _557);
    float _573 = fma(_553, (*spvDescriptorSet0.vp_c8)._m0[26].x, _563);
    float _575 = _561 + 0.5;
    float _577 = -_547;
    float _579 = _577 + 0.5;
    float _581 = sqrt(_567);
    float _583 = _575 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _585 = _579 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _587 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _589 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _591 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _593 = _583 * _197;
    float _595 = _585 * _549;
    float _597 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _599 = _587 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _601 = _589 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _603 = _591 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _605 = fma(_565, (*spvDescriptorSet0.vp_c8)._m0[24].z, _569);
    float _607 = fma(_565, (*spvDescriptorSet0.vp_c8)._m0[25].z, _571);
    float _609 = fma(_565, (*spvDescriptorSet0.vp_c8)._m0[26].z, _573);
    out.m_72.x = _593;
    out.m_72.y = _595;
    bool _611 = _581 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _613 = isnan(_581);
    bool _615 = _611 || _613;
    bool _617 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _619 = _615 || _617;
    out.m_74.x = _599;
    out.m_74.y = _601;
    out.m_74.z = _603;
    out.m_74.w = _597;
    out.m_76.x = _605;
    out.m_76.y = _607;
    out.m_76.z = _609;
    if (!_619)
    {
        _461 = 1.0;
    }
    float _621 = _461;
    bool _623 = !_619;
    float _625 = _621;
    if (!_623)
    {
        bool _627 = _581 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _629 = isnan(_581);
        bool _631 = _627 || _629;
        bool _633 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _635 = _631 || _633;
        if (!_635)
        {
            float _637 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _639 = _581 + _637;
            float _641 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _643 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _641;
            float _645 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _647 = _645 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _649 = 1.0 / _643;
            float _651 = _639 * _649;
            float _653 = fma(_651, _647, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _625 = _653;
            _655 = true;
        }
        else
        {
            bool _657 = _581 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _659 = isnan(_581);
            bool _661 = _657 || _659;
            bool _663 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _665 = _661 || _663;
            if (!_665)
            {
                float _667 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _669 = _581 + _667;
                float _671 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _673 = _671 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _675 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _677 = _675 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _679 = 1.0 / _673;
                float _681 = _669 * _679;
                float _683 = fma(_681, _677, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _625 = _683;
                _655 = true;
            }
            else
            {
                _625 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _655 = false;
    float _685 = _625;
    float _687 = fma(_375, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _689 = fma(_381, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _691 = floor(_687);
    float _693 = floor(_689);
    float _695 = -_691;
    float _697 = _687 + _695;
    float _699 = -_693;
    float _701 = _689 + _699;
    float2 _3356 = float2(_697, _701);
    float _703 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3356, float2(0.0), isnan(_3356)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3356, float2(0.0), isnan(_3356)), level(0.0)).x;
    float _705 = _419 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _707 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _709 = _535 + _707;
    float _711 = fma(_375, (*spvDescriptorSet0.vp_c8)._m0[11].x, _705);
    float _713 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _715 = _529 + _713;
    float _717 = fma(_709, _685, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _719 = fma(_381, (*spvDescriptorSet0.vp_c8)._m0[11].z, _711);
    float _721 = _419 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _723 = fma(_715, _685, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _725 = _719 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _727 = fma(_375, (*spvDescriptorSet0.vp_c8)._m0[10].x, _721);
    float _729 = 1.0 / _725;
    float _731 = fma(_381, (*spvDescriptorSet0.vp_c8)._m0[10].z, _727);
    float _733 = _731 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _735 = _733 + _725;
    float _737 = _735 * _729;
    float _739 = _737 * 0.5;
    float _741 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _743 = fma(_739, (*spvDescriptorSet0.vp_c8)._m0[30].w, _741);
    float _745 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _747 = _419 + _745;
    float _749 = 1.0 / _743;
    float _751 = _747 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _753 = _747 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _755 = fma(_375, (*spvDescriptorSet0.vp_c15)._m0[126].x, _751);
    float _757 = fma(_375, (*spvDescriptorSet0.vp_c15)._m0[127].x, _753);
    float _759 = fma(_381, (*spvDescriptorSet0.vp_c15)._m0[126].z, _755);
    float _761 = fma(_381, (*spvDescriptorSet0.vp_c15)._m0[127].z, _757);
    float _763 = _759 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _765 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _767 = _749 * _765;
    float _769 = _761 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _771 = trunc(_763);
    int _773 = int(_771);
    bool _775 = _767 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _777 = _767 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _779 = !_775;
    int _781 = _779 ? 0 : 1;
    float _783 = trunc(_769);
    int _785 = int(_783);
    int _787 = 2;
    float _789 = _685;
    int _791 = as_type<int>(_715);
    int _793 = as_type<int>(_709);
    if (!_775)
    {
        _787 = 1;
    }
    int _795 = _787;
    int _797 = _795;
    if (!_777)
    {
        _797 = _781;
    }
    int _799 = _797;
    int _801 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _803 = _773 + _801;
    int _805 = _803 + 1;
    int _807 = _799 << 6;
    bool _809 = _805 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _811 = _807 + 48;
    uint _814 = uint(int(uint(_811) >> uint(2)));
    uint _816 = uint(int(uint(int(_814)) >> uint(2)));
    int _818 = int(_814) & 3;
    float _820 = (*spvDescriptorSet0.vp_c15)._m0[int(_816)][_818];
    int _822 = int(_814) + 1;
    uint _824 = uint(int(uint(_822) >> uint(2)));
    int _826 = _822 & 3;
    float _828 = (*spvDescriptorSet0.vp_c15)._m0[int(_824)][_826];
    int _830 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _832 = _785 + _830;
    int _834 = _832 + 1;
    int _836 = _805 | _834;
    int _838 = _807 + 56;
    uint _840 = uint(int(uint(_838) >> uint(2)));
    uint _842 = uint(int(uint(int(_840)) >> uint(2)));
    int _844 = int(_840) & 3;
    float _846 = (*spvDescriptorSet0.vp_c15)._m0[int(_842)][_844];
    int _848 = int(_840) + 1;
    uint _850 = uint(int(uint(_848) >> uint(2)));
    int _852 = _848 & 3;
    float _854 = (*spvDescriptorSet0.vp_c15)._m0[int(_850)][_852];
    bool _856 = _836 < 0;
    bool _858 = _856 || _809;
    bool _860 = _834 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _862 = _860 || _858;
    bool _864 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _866 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _868 = _864 || _866;
    bool _870 = isnan(0.5);
    bool _872 = _868 || _870;
    int _874 = _807 + 64;
    uint _876 = uint(int(uint(_874) >> uint(2)));
    uint _878 = uint(int(uint(int(_876)) >> uint(2)));
    int _880 = int(_876) & 3;
    float _882 = (*spvDescriptorSet0.vp_c15)._m0[int(_878)][_880];
    int _884 = int(_876) + 1;
    uint _886 = uint(int(uint(_884) >> uint(2)));
    int _888 = _884 & 3;
    float _890 = (*spvDescriptorSet0.vp_c15)._m0[int(_886)][_888];
    float _892 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _894 = _537 + _892;
    float _896 = fma(_894, _685, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    int _898 = _807 + 72;
    uint _900 = uint(int(uint(_898) >> uint(2)));
    uint _902 = uint(int(uint(int(_900)) >> uint(2)));
    int _904 = int(_900) & 3;
    float _906 = (*spvDescriptorSet0.vp_c15)._m0[int(_902)][_904];
    int _908 = int(_900) + 1;
    uint _910 = uint(int(uint(_908) >> uint(2)));
    int _912 = _908 & 3;
    float _914 = (*spvDescriptorSet0.vp_c15)._m0[int(_910)][_912];
    int _916 = _805;
    float _918 = as_type<float>(_834);
    float _920 = _894;
    float _922 = _896;
    float _924 = as_type<float>(_799);
    if (!_862)
    {
        int _926 = _834 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _928 = _926 + _805;
        _916 = _928;
    }
    int _930 = _916;
    if (_872)
    {
        _918 = _717;
    }
    float _932 = _918;
    float _934 = _932;
    if (_872)
    {
        _789 = _723;
    }
    float _936 = _789;
    int _938 = _807 + 96;
    uint _940 = uint(int(uint(_938) >> uint(2)));
    uint _942 = uint(int(uint(int(_940)) >> uint(2)));
    int _944 = int(_940) & 3;
    float _946 = (*spvDescriptorSet0.vp_c15)._m0[int(_942)][_944];
    int _948 = int(_940) + 1;
    uint _950 = uint(int(uint(_948) >> uint(2)));
    int _952 = _948 & 3;
    float _954 = (*spvDescriptorSet0.vp_c15)._m0[int(_950)][_952];
    float _956 = _936;
    if (_872)
    {
        _920 = _896;
    }
    float _958 = _920;
    int _960 = _807 + 104;
    uint _962 = uint(int(uint(_960) >> uint(2)));
    uint _964 = uint(int(uint(int(_962)) >> uint(2)));
    int _966 = int(_962) & 3;
    float _968 = (*spvDescriptorSet0.vp_c15)._m0[int(_964)][_966];
    int _970 = int(_962) + 1;
    uint _972 = uint(int(uint(_970) >> uint(2)));
    int _974 = _970 & 3;
    float _976 = (*spvDescriptorSet0.vp_c15)._m0[int(_972)][_974];
    float _978 = _958;
    int _980 = as_type<int>(_946);
    if (!_872)
    {
        float _982 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _984 = _419 + _982;
        float _986 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _988 = _375 + _986;
        float _990 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _992 = -_375;
        float _994 = _992 + _717;
        float _996 = _984 * _984;
        float _998 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1000 = _381 + _998;
        float _1002 = -_381;
        float _1004 = _1002 + _896;
        float _1006 = fma(_988, _988, _996);
        float _1008 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1010 = fma(_1000, _1000, _1006);
        float _1012 = sqrt(_1010);
        float _1014 = _990 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1016 = precise::min(_1012, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1018 = _1016 * _1008;
        float _1020 = -_419;
        float _1022 = _1020 + _723;
        float _1024 = _1014 * _1018;
        float _1026 = fma(_1022, _1024, _419);
        float _1028 = fma(_994, _1024, _375);
        float _1030 = fma(_1004, _1024, _381);
        _956 = _1026;
        _934 = _1028;
        _978 = _1030;
        _791 = as_type<int>(_990);
        _793 = as_type<int>(_1022);
        _922 = _1004;
    }
    float _1032 = _956;
    float _1034 = _934;
    float _1036 = _978;
    int _1038 = _791;
    int _1040 = _793;
    float _1042 = _922;
    float _1044 = _1032 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1046 = _747 * _954;
    int _1048 = _1038;
    int _1050 = _1040;
    if (!_862)
    {
        int _1052 = _930 << 2;
        _1048 = _1052;
    }
    int _1054 = _1048;
    float _1056 = _747 * _890;
    float _1058 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1044);
    float _1060 = fma(_375, _946, _1046);
    if (!_862)
    {
        uint _1062 = uint(int(uint(_930) >> uint(2)));
        _1050 = int(_1062);
    }
    int _1064 = _1050;
    float _1066 = fma(_375, _882, _1056);
    float _1068 = fma(_1036, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1058);
    if (!_862)
    {
        int _1070 = 12 & _1054;
        _980 = _1070;
    }
    int _1072 = _980;
    float _1074 = fma(_381, _968, _1060);
    float _1076 = _747 * _828;
    float _1078 = _1068 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1080 = as_type<float>(_1072);
    if (!_862)
    {
        int _1082 = _1064 << 4;
        int _1084 = _1082 + _1072;
        _1080 = as_type<float>(_1084);
    }
    float _1086 = _1080;
    float _1088 = _1074 + _976;
    int _1090 = _807 + 80;
    uint _1092 = uint(int(uint(_1090) >> uint(2)));
    uint _1094 = uint(int(uint(int(_1092)) >> uint(2)));
    int _1096 = int(_1092) & 3;
    float _1098 = (*spvDescriptorSet0.vp_c15)._m0[int(_1094)][_1096];
    int _1100 = int(_1092) + 1;
    uint _1102 = uint(int(uint(_1100) >> uint(2)));
    int _1104 = _1100 & 3;
    float _1106 = (*spvDescriptorSet0.vp_c15)._m0[int(_1102)][_1104];
    float _1108 = fma(_375, _820, _1076);
    float _1110 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1112 = 1.0 / _1088;
    float _1114 = _1078 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1116 = fma(_381, _846, _1108);
    float _1118 = _1032 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1120 = _1032 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1122 = _1086;
    if (!_862)
    {
        int _1124 = as_type<int>(_1086) + 400;
        uint _1126 = uint(int(uint(_1124) >> uint(2)));
        uint _1128 = uint(int(uint(int(_1126)) >> uint(2)));
        int _1130 = int(_1126) & 3;
        float _1132 = (*spvDescriptorSet0.vp_c15)._m0[int(_1128)][_1130];
        _1122 = _1132;
    }
    float _1134 = _1122;
    float _1136 = _1116 + _854;
    float _1138 = -_1114;
    float _1140 = fma(_1138, _1110, 1.0);
    float _1142 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1118);
    float _1144 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1120);
    float _1146 = fma(_381, _906, _1066);
    float _1148 = _1032 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1150 = fma(_1036, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1142);
    int _1152 = _807 + 88;
    uint _1154 = uint(int(uint(_1152) >> uint(2)));
    uint _1156 = uint(int(uint(int(_1154)) >> uint(2)));
    int _1158 = int(_1154) & 3;
    float _1160 = (*spvDescriptorSet0.vp_c15)._m0[int(_1156)][_1158];
    int _1162 = int(_1154) + 1;
    uint _1164 = uint(int(uint(_1162) >> uint(2)));
    int _1166 = _1162 & 3;
    float _1168 = (*spvDescriptorSet0.vp_c15)._m0[int(_1164)][_1166];
    float _1170 = fma(_1036, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1144);
    float _1172 = _1146 + _914;
    float _1174 = _1136 * _1112;
    float _1176 = _1150 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1178 = _1170 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1180 = _1172 * _1112;
    float _1182 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1148);
    bool _1184 = _1174 >= 0.0;
    float _1186 = _1178 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1188 = log2(_1140);
    float _1190 = fma(_1036, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1182);
    bool _1192 = _1174 <= 1.0;
    bool _1194 = _1192 && _1184;
    float _1196 = fma(_1176, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1186);
    float _1198 = _1178 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1200 = _1190 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    bool _1202 = _1180 >= 0.0;
    bool _1204 = _1202 && _1194;
    float _1206 = fma(_1078, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1196);
    float _1208 = _1140;
    if (!_862)
    {
        float _1210 = floor(_769);
        _1208 = _1210;
    }
    float _1212 = _1208;
    bool _1214 = _1180 <= 1.0;
    bool _1216 = _1214 && _1204;
    float _1218 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1206);
    float _1220 = fma(_1176, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1198);
    float _1222 = _1042;
    if (!_862)
    {
        float _1224 = floor(_763);
        _1222 = _1224;
    }
    float _1226 = _1222;
    float _1228 = fma(_1078, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1220);
    float _1230 = _1188 * 0.693147182464599609375;
    float _1232 = _747 * _1106;
    float _1234 = _1178 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1236 = 1.0 / _1218;
    float _1238 = _1228;
    if (_1216)
    {
        float _1240 = float(_799);
        _924 = _1240;
    }
    float _1242 = _924;
    float _1244 = fma(_375, _1098, _1232);
    float _1246 = fma(_1176, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1234);
    float _1248 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1228);
    float _1250 = 0.0;
    float _1252 = _1212;
    float _1254 = _1248;
    if (!_862)
    {
        float _1256 = -_1212;
        float _1258 = _769 + _1256;
        _1250 = _1258;
    }
    float _1260 = _1250;
    float _1262 = fma(_1078, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1246);
    float _1264 = _1134;
    if (!_862)
    {
        float _1266 = rint(_1134);
        float _1268 = precise::max(_1266, 0.0);
        uint _1270 = uint(_1268);
        uint _1272 = clamp(_1270, 0u, 65535u);
        _1264 = as_type<float>(_1272);
    }
    float _1274 = _1264;
    if (!_862)
    {
        float _1276 = -_1226;
        float _1278 = _763 + _1276;
        _1252 = _1278;
    }
    float _1280 = _1252;
    float _1282 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1262);
    float _1284 = fma(_381, _1160, _1244);
    float _1286 = _1244;
    if (_1216)
    {
        float _1288 = rint(_1242);
        float _1290 = precise::max(_1288, 0.0);
        uint _1292 = uint(_1290);
        uint _1294 = clamp(_1292, 0u, 65535u);
        _1286 = as_type<float>(_1294);
    }
    float _1296 = _1286;
    float _1298 = _1248 * _1236;
    float _1300 = _1284 + _1168;
    float _1302 = _1282 * _1236;
    float _1304 = fma(_1298, -0.5, 0.5);
    float _1306 = _1300 * _1112;
    float _1308 = fma(_1302, 0.5, 0.5);
    float _1310 = _1230 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1312 = _1280;
    float _1314 = _1310;
    float _1316 = _1274;
    if (!_862)
    {
        float3 _4396 = float3(_1280, _1260, float(as_type<int>(_1274)));
        float3 _4400 = select(_4396, float3(0.0), isnan(_4396));
        float _1318 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4400.xy, uint(rint(_4400.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4400.xy, uint(rint(_4400.z)), level(0.0)).x;
        _1312 = _1318;
    }
    float _1320 = _1312;
    float _1322 = _1180;
    if (_1216)
    {
        float3 _4415 = float3(_1174, _1180, float(as_type<int>(_1296)));
        float3 _4417 = select(_4415, float3(0.0), isnan(_4415));
        float _1324 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _4417.xy, uint(rint(_4417.z)), _1306, level(0.0));
        _1322 = _1324;
    }
    float _1326 = _1322;
    float3 _4427 = float3(_1308, _1304, _1310);
    float _1328 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4427, float3(0.0), isnan(_4427)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4427, float3(0.0), isnan(_4427)), level(0.0)).x;
    float3 _4436 = float3(_1308, _1304, _1310);
    float4 _1331 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4436, float3(0.0), isnan(_4436)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4436, float3(0.0), isnan(_4436)), level(0.0)).xyzw;
    float _1333 = _1331.x;
    float _1335 = _1331.y;
    float _1337 = _1331.z;
    float _1339 = _1331.w;
    bool _1341 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1343 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1345 = _1341 || _1343;
    bool _1347 = isnan(0.5);
    bool _1349 = _1345 || _1347;
    float _1351 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    if (_1349)
    {
        _1351 = 1.0;
    }
    float _1353 = _1351;
    float _1355 = _1353;
    if (_1349)
    {
        _1238 = 1.0;
    }
    float _1357 = _1238;
    float _1359 = _1357;
    float _1361 = _1326;
    if (!_1349)
    {
        float _1363 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1365 = _1363 * 0.15915493667125701904296875;
        float _1367 = _1365 * 6.283185482025146484375;
        float _1369 = cos(_1367);
        float _1371 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1373 = _1371 * 0.15915493667125701904296875;
        float _1375 = _1365 * 6.283185482025146484375;
        float _1377 = sin(_1375);
        float _1379 = 1.0 / _1369;
        float _1381 = _1373 * 6.283185482025146484375;
        float _1383 = cos(_1381);
        float _1385 = _1377 * _1379;
        float _1387 = _1373 * 6.283185482025146484375;
        float _1389 = sin(_1387);
        float _1391 = _1383 * _1385;
        float _1393 = 1.0 / _1391;
        float _1395 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1397 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1395;
        float _1399 = 1.0 / _1397;
        float _1401 = _1389 * _1393;
        float _1403 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1405 = fma(_767, _1401, _1403);
        float _1407 = _1405 * _1399;
        float _1409 = precise::clamp(_1407, 0.0, 1.0);
        _1314 = _1379;
        _1316 = _1399;
        _1359 = _1409;
    }
    float _1411 = _1314;
    float _1413 = _1316;
    float _1415 = _1359;
    float _1417 = _1411;
    float _1419 = _1413;
    if (!_1349)
    {
        float _1421 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1423 = _1421 * 0.15915493667125701904296875;
        float _1425 = _1423 * 6.283185482025146484375;
        float _1427 = cos(_1425);
        float _1429 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1431 = _1429 * 0.15915493667125701904296875;
        float _1433 = _1423 * 6.283185482025146484375;
        float _1435 = sin(_1433);
        float _1437 = 1.0 / _1427;
        float _1439 = _1431 * 6.283185482025146484375;
        float _1441 = cos(_1439);
        float _1443 = _1435 * _1437;
        float _1445 = _1431 * 6.283185482025146484375;
        float _1447 = sin(_1445);
        float _1449 = _1441 * _1443;
        float _1451 = 1.0 / _1449;
        float _1453 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1455 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1453;
        float _1457 = 1.0 / _1455;
        float _1459 = _1447 * _1451;
        float _1461 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1463 = fma(_767, _1459, _1461);
        float _1465 = _1463 * _1457;
        float _1467 = precise::clamp(_1465, 0.0, 1.0);
        float _1469 = -_1467;
        float _1471 = _1469 + 1.0;
        _1417 = _1459;
        _1419 = _1431;
        _1355 = _1471;
    }
    float _1473 = _1417;
    float _1475 = _1419;
    float _1477 = _1355;
    float _1479 = _1475;
    float _1481 = _1473;
    if (_862)
    {
        _1479 = 1.0;
    }
    float _1483 = _1479;
    float _1485 = _1483;
    if (!_862)
    {
        int _1487 = _930 << 4;
        int _1489 = _1487 + 2048;
        uint _1491 = uint(int(uint(_1489) >> uint(2)));
        uint _1493 = uint(int(uint(int(_1491)) >> uint(2)));
        int _1495 = int(_1491) & 3;
        float _1497 = (*spvDescriptorSet0.vp_c15)._m0[int(_1493)][_1495];
        int _1499 = int(_1491) + 1;
        uint _1501 = uint(int(uint(_1499) >> uint(2)));
        int _1503 = _1499 & 3;
        float _1505 = (*spvDescriptorSet0.vp_c15)._m0[int(_1501)][_1503];
        int _1507 = _1489 + 8;
        uint _1509 = uint(int(uint(_1507) >> uint(2)));
        uint _1511 = uint(int(uint(int(_1509)) >> uint(2)));
        int _1513 = int(_1509) & 3;
        float _1515 = (*spvDescriptorSet0.vp_c15)._m0[int(_1511)][_1513];
        int _1517 = int(_1509) + 1;
        uint _1519 = uint(int(uint(_1517) >> uint(2)));
        int _1521 = _1517 & 3;
        float _1523 = (*spvDescriptorSet0.vp_c15)._m0[int(_1519)][_1521];
        float _1525 = _747 * _1505;
        float _1527 = fma(_375, _1497, _1525);
        float _1529 = fma(_381, _1515, _1527);
        float _1531 = _1529 + _1523;
        float _1533 = precise::clamp(_1531, 0.0, 1.0);
        float _1535 = -_1533;
        float _1537 = _1535 + _1320;
        float _1539 = fma(_1537, 500.0, 1.5);
        float _1541 = exp2(_1539);
        float _1543 = 0.0 + _1541;
        float _1545 = precise::clamp(_1543, 0.0, 1.0);
        _1485 = _1545;
    }
    float _1547 = _1485;
    float _1549 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1551 = _1032 + _1549;
    float _1553 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1555 = _1034 + _1553;
    float _1557 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1559 = _1036 + _1557;
    float _1561 = _1551 * _1551;
    float _1563 = fma(_1555, _1555, _1561);
    float _1565 = fma(_1559, _1559, _1563);
    float _1567 = rsqrt(_1565);
    float _1569 = _1567 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1571 = _1555 * _1569;
    float _1573 = _1559 * _1569;
    float _1575 = _1571 * _1571;
    float _1577 = _1573 * _1573;
    float _1579 = _1575 + _1577;
    float _1581 = sqrt(_1579);
    bool _1583 = _1581 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1585 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1587 = _1581 + _1585;
    float _1589 = _1559;
    float _1591 = _1561;
    float _1593 = _1587;
    float _1595 = _1569;
    if (_1583)
    {
        float _1597 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1589 = _1597;
    }
    float _1599 = _1589;
    if (_1583)
    {
        float _1601 = rsqrt(_1579);
        _1591 = _1601;
    }
    float _1603 = _1591;
    float _1605 = _1603;
    if (_1583)
    {
        float _1607 = _1587 * _1599;
        _1593 = _1607;
    }
    float _1609 = _1593;
    if (_1583)
    {
        float _1611 = _1609 * 0.15915493667125701904296875;
        _1481 = _1611;
    }
    float _1613 = _1481;
    float _1615 = _1567;
    if (_1583)
    {
        float _1617 = _1613 * 6.283185482025146484375;
        float _1619 = sin(_1617);
        _1615 = _1619;
    }
    float _1621 = _1615;
    float _1623 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1625 = precise::max(0.0, _1623);
    float _1627 = _1320;
    float _1629 = _1625;
    float _1631 = _1621;
    float _1633 = _1623;
    if (_1583)
    {
        float _1635 = _1613 * 6.283185482025146484375;
        float _1637 = cos(_1635);
        _1627 = _1637;
    }
    float _1639 = _1627;
    float _1641 = -_1569;
    float _1643 = -_1625;
    float _1645 = fma(_1551, _1641, _1643);
    float _1647 = _1645;
    if (_1583)
    {
        float _1649 = _1645 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1629 = _1649;
    }
    float _1651 = _1629;
    float _1653 = _1651;
    if (_1583)
    {
        float _1655 = fma(_1621, _1651, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1631 = _1655;
    }
    float _1657 = _1631;
    float _1659 = _1657;
    if (!_1583)
    {
        _1653 = _1573;
    }
    float _1661 = _1653;
    float _1663 = _1661;
    float _1665 = _1639;
    if (_1583)
    {
        float _1667 = _1639 + (-1.0);
        _1633 = _1667;
    }
    float _1669 = _1633;
    float _1671 = 0.0;
    if (_1583)
    {
        float _1673 = _1603 * _1657;
        _1671 = _1673;
    }
    float _1675 = _1671;
    if (!_1583)
    {
        _1659 = _1571;
    }
    float _1677 = _1659;
    float _1679 = _1677;
    if (_1583)
    {
        float _1681 = _1669 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1595 = _1681;
    }
    float _1683 = _1595;
    if (_1583)
    {
        float _1685 = _1571 * _1675;
        _1679 = _1685;
    }
    float _1687 = _1679;
    if (!_1583)
    {
        _1605 = _1575;
    }
    float _1689 = _1605;
    float _1691 = _1689;
    if (_1583)
    {
        float _1693 = _1573 * _1675;
        _1663 = _1693;
    }
    float _1695 = _1663;
    if (_1583)
    {
        float _1697 = fma(_1645, _1639, _1683);
        _1647 = _1697;
    }
    float _1699 = _1647;
    if (_1583)
    {
        float _1701 = _1687 * _1687;
        _1691 = _1701;
    }
    float _1703 = _1691;
    if (!_1583)
    {
        _1665 = _1577;
    }
    float _1705 = _1665;
    float _1707 = _1705;
    if (_1583)
    {
        float _1709 = _1695 * _1695;
        _1707 = _1709;
    }
    float _1711 = _1707;
    float _1713 = sqrt(_1565);
    float _1715 = fma(_1699, _1699, _1703);
    float _1717 = _1715 + _1711;
    float _1719 = rsqrt(_1717);
    float _1721 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1723 = fma(_1713, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1721);
    float _1725 = precise::clamp(_1723, 0.0, 1.0);
    float _1727 = -_1725;
    float _1729 = _1727 + 1.0;
    float _1731 = _1719 * _1699;
    float _1733 = _1719 * _1687;
    float _1735 = abs(_1729);
    float _1737 = log2(_1735);
    float _1739 = _1719 * _1695;
    float _1741 = _1733 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1743 = -_1741;
    float _1745 = fma(_1731, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1743);
    float _1747 = -_1739;
    float _1749 = fma(_1747, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1745);
    float _1751 = fma(_1749, -0.5, 0.5);
    float _1753 = _1737 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1755 = fma(_1749, 0.5, 0.5);
    float _1757 = sqrt(_1751);
    float _1759 = fma(_1755, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1761 = fma(_1755, _1759, -0.212114393711090087890625);
    float _1763 = _1731 + 1.0;
    float _1765 = exp2(_1753);
    float _1767 = fma(_1755, _1761, 1.570728778839111328125);
    float _1769 = _1757 * 0.636619746685028076171875;
    float _1771 = -_1767;
    float _1773 = fma(_1769, _1771, 1.0);
    float _1775 = -_1731;
    float _1777 = fma(_1765, _1763, _1775);
    float _1779 = fma(_1777, 0.5, 0.5);
    float2 _5084 = float2(_1773, _1779);
    float3 _1783 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5084, float2(0.0), isnan(_5084)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5084, float2(0.0), isnan(_5084)), level(0.0)).xyz;
    float _1785 = _1783.x;
    float _1787 = _1783.y;
    float _1789 = _1783.z;
    float _1791 = abs(_767);
    float _1793 = log2(_1791);
    float _1795 = _1178 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1797 = _1737 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1799 = -_703;
    float _1801 = _1799 + 1.0;
    float _1803 = fma(_1176, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1795);
    bool _1805 = _1713 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1807 = isnan(_1713);
    bool _1809 = _1805 || _1807;
    bool _1811 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1813 = _1809 || _1811;
    float _1815 = fma(_1078, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1803);
    float _1817 = exp2(_1797);
    bool _1819 = _767 <= 8000.0;
    bool _1821 = isnan(_767);
    bool _1823 = _1819 || _1821;
    bool _1825 = isnan(8000.0);
    bool _1827 = _1823 || _1825;
    float _1829 = float(_1827);
    float _1831 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1815);
    float _1833 = _1793 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1835 = _1831 + _1218;
    out.gl_Position.x = _1282;
    out.gl_Position.y = _1248;
    out.gl_Position.z = _1831;
    out.gl_Position.w = _1218;
    float _1837 = _1835 * 0.5;
    float _1839 = exp2(_1833);
    out.m_78.z = _1837;
    out.m_78.w = _1218;
    float _1841 = -_1817;
    float _1843 = _1841 + 1.0;
    float _1845 = _1817;
    if (!_1216)
    {
        _1254 = 1.0;
    }
    float _1847 = _1254;
    float _1849 = _1847;
    if (_1216)
    {
        bool _1851 = _1326 >= _1306;
        bool _1853 = isnan(_1326);
        bool _1855 = _1851 || _1853;
        bool _1857 = isnan(_1306);
        bool _1859 = _1855 || _1857;
        float _1861 = float(_1859);
        _1849 = _1861;
    }
    float _1863 = _1849;
    float _1865 = _1843 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (!_1813)
    {
        _1845 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1867 = _1845;
    float _1869 = fma(_1839, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1871 = precise::clamp(_1869, 0.0, 1.0);
    float _1873 = _1867;
    float _1875 = _1867;
    if (!_1813)
    {
        _1361 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1877 = _1361;
    float _1879 = _1865 * _1328;
    float _1881 = _1863 * _1547;
    float _1883 = fma(_1871, -2.0, 3.0);
    float _1885 = _1871 * _1871;
    float _1887 = _1339 * _1879;
    float _1889 = -_1865;
    float _1891 = _1889 + 1.0;
    float _1893 = _1885 * _1883;
    float _1895 = -_1893;
    float _1897 = _1895 + 1.0;
    float _1899 = fma(_1897, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1893);
    float _1901 = _1829 * _1899;
    float _1903 = _1901 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1905 = _1801 * _1903;
    float _1907 = precise::clamp(_1905, 0.0, 1.0);
    float _1909 = _1903;
    float _1911 = _1887;
    float _1913 = _1877;
    float _1915 = _1877;
    if (!_1813)
    {
        _1909 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1917 = _1909;
    float _1919 = -_1907;
    float _1921 = fma(_1919, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1923 = -_1881;
    float _1925 = fma(_1923, _1921, 1.0);
    float _1927 = precise::clamp(_1925, 0.0, 1.0);
    float _1929 = _1927 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1931 = _1927;
    float _1933 = _1917;
    float _1935 = _1917;
    if (!_1813)
    {
        _1931 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1937 = _1931;
    out.m_80.x = _1929;
    float _1939 = _1789 * _1879;
    float _1941 = fma(_1785, _1887, _1333);
    float _1943 = fma(_1787, _1887, _1335);
    float _1945 = _1339 * _1891;
    float _1947 = fma(_1339, _1939, _1337);
    float _1949 = _1415 * _1477;
    float _1951 = _1949;
    float _1953 = _1937;
    float _1955 = _1937;
    if (!_1813)
    {
        _1911 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1957 = _1911;
    out.m_82.x = _1941;
    out.m_82.y = _1943;
    out.m_82.z = _1947;
    out.m_82.w = _1945;
    float _1959 = _1949 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1961 = _1957;
    float _1963 = _1957;
    if (!_1813)
    {
        _1951 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1965 = _1951;
    bool _1967 = !_1813;
    float _1969 = _1965;
    float _1971 = _1965;
    if (!_1967)
    {
        bool _1973 = _1713 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1975 = isnan(_1713);
        bool _1977 = _1973 || _1975;
        bool _1979 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1981 = _1977 || _1979;
        if (!_1981)
        {
            float _1983 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1985 = _1713 + _1983;
            float _1987 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1989 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1987;
            float _1991 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1993 = _1991 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1995 = 1.0 / _1989;
            float _1997 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1999 = _1997 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2001 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2003 = _2001 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2005 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2007 = _2005 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2009 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2011 = _2009 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2013 = _1985 * _1995;
            float _2015 = precise::clamp(_2013, 0.0, 1.0);
            float _2017 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2019 = _2017 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2021 = fma(_2015, _1993, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2023 = fma(_2015, _2019, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2025 = fma(_2015, _1999, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2027 = fma(_2015, _2003, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2029 = fma(_2015, _2007, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2031 = fma(_2015, _2011, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1915 = _2025;
            _1955 = _2029;
            _1875 = _2021;
            _1963 = _2027;
            _1935 = _2023;
            _1971 = _2031;
            _2033 = true;
        }
        else
        {
            bool _2035 = _1713 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2037 = isnan(_1713);
            bool _2039 = _2035 || _2037;
            bool _2041 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2043 = _2039 || _2041;
            if (!_2043)
            {
                _1873 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2045 = _1873;
            _1875 = _2045;
            if (!_2043)
            {
                _1913 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2047 = _1913;
            _1915 = _2047;
            if (!_2043)
            {
                _1933 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2049 = _1933;
            _1935 = _2049;
            if (!_2043)
            {
                _1961 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2051 = _1961;
            _1963 = _2051;
            if (!_2043)
            {
                _1953 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2053 = _1953;
            _1955 = _2053;
            if (!_2043)
            {
                _1969 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2055 = _1969;
            bool _2057 = !_2043;
            _1971 = _2055;
            if (!_2057)
            {
                bool _2059 = _1713 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2061 = isnan(_1713);
                bool _2063 = _2059 || _2061;
                bool _2065 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2067 = _2063 || _2065;
                if (!_2067)
                {
                    float _2069 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2071 = _1713 + _2069;
                    float _2073 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2075 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2073;
                    float _2077 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2079 = _2077 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2081 = 1.0 / _2075;
                    float _2083 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2085 = _2083 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2087 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2089 = _2087 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2091 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2093 = _2091 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2095 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2097 = _2095 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2099 = _2071 * _2081;
                    float _2101 = precise::clamp(_2099, 0.0, 1.0);
                    float _2103 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2105 = _2103 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2107 = fma(_2101, _2079, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2109 = fma(_2101, _2105, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2111 = fma(_2101, _2085, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2113 = fma(_2101, _2089, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2115 = fma(_2101, _2093, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2117 = fma(_2101, _2097, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1915 = _2111;
                    _1955 = _2115;
                    _1875 = _2107;
                    _1963 = _2113;
                    _1935 = _2109;
                    _1971 = _2117;
                    _2033 = true;
                }
                else
                {
                    _1915 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1955 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1875 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1963 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1935 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1971 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2033 = false;
    float _2119 = _1915;
    float _2121 = _1955;
    float _2123 = _1875;
    float _2125 = _1963;
    float _2127 = _1935;
    float _2129 = _1971;
    float _2131 = fma(_607, -0.5, 0.5);
    float _2133 = precise::clamp(_2131, 0.0, 1.0);
    float _2135 = -_2119;
    float _2137 = _2135 + _2121;
    float _2139 = _1959 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2141 = -_2123;
    float _2143 = _2141 + _2125;
    float _2145 = fma(_2133, _2137, _2119);
    out.m_84.x = 0.0;
    float _2147 = -_2127;
    float _2149 = _2147 + _2129;
    float _2151 = fma(_2133, _2143, _2123);
    float _2153 = _2145 * 0.586610972881317138671875;
    out.m_61.x = _2139;
    bool _2155 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2157 = fma(_2133, _2149, _2127);
    float _2159 = fma(_2151, 0.298911988735198974609375, _2153);
    bool _2161 = _1415 > 0.0;
    bool _2163 = isnan(_1415);
    bool _2165 = _2161 || _2163;
    bool _2167 = isnan(0.0);
    bool _2169 = _2165 || _2167;
    float _2171 = fma(_2157, 0.114477999508380889892578125, _2159);
    bool _2173 = _1477 <= 0.0;
    bool _2175 = !_2169;
    bool _2177 = _2173 || _2175;
    float _2179 = -_2171;
    float _2181 = _2151 + _2179;
    float _2183 = -_2171;
    float _2185 = _2145 + _2183;
    float _2187 = -_2171;
    float _2189 = _2157 + _2187;
    float _2191 = fma(_2181, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2171);
    float _2193 = fma(_2185, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2171);
    float _2195 = fma(_2189, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2171);
    bool _2197 = !_2155;
    if (!_2197)
    {
        float _2199 = -_1032;
        float _2201 = _2199 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2203 = -_1034;
        float _2205 = _2203 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2207 = -_1036;
        float _2209 = _2207 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2211 = _2201 * _2201;
        float _2213 = fma(_2205, _2205, _2211);
        float _2215 = fma(_2209, _2209, _2213);
        float _2217 = sqrt(_2215);
        float _2219 = rsqrt(_2215);
        float _2221 = -_2217;
        float _2223 = _2221 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2225 = _2223 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2227 = precise::clamp(_2225, 0.0, 1.0);
        float _2229 = _2205 * _2219;
        float _2231 = _2201 * _2219;
        float _2233 = abs(_2227);
        float _2235 = log2(_2233);
        float _2237 = _2209 * _2219;
        float _2239 = _2229 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2241 = _607 * _2231;
        float _2243 = -_2231;
        float _2245 = -_2239;
        float _2247 = fma(_2243, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2245);
        float _2249 = fma(_605, _2229, _2241);
        float _2251 = -_2237;
        float _2253 = fma(_2251, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2247);
        float _2255 = fma(_609, _2237, _2249);
        float _2257 = precise::clamp(_2255, 0.0, 1.0);
        float _2259 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2261 = _2253 + _2259;
        float _2263 = _2235 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2265 = _2261 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2267 = precise::clamp(_2265, 0.0, 1.0);
        float _2269 = exp2(_2263);
        float _2271 = _2269 * _2267;
        float _2273 = _2257 * _2271;
        float _2275 = _2273 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2277 = _2273 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2279 = _2273 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_84.x = _2275;
        out.m_84.y = _2277;
        out.m_84.z = _2279;
    }
    out.m_86.x = _2191;
    out.m_86.y = _2193;
    out.m_86.z = _2195;
    if (!_2177)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_61.x = 0.0;
    float _2281 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2281;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2033 = false;
    bool _655 = false;
    bool _181 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _100 = in.m_58.w;
    float _102 = trunc(_100);
    int _105 = int(_102);
    bool _109 = _105 >= 1;
    float _111 = 0.0;
    if (!_109)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _113 = _111;
    float _115 = _113;
    if (!_109)
    {
        out.m_61.x = 0.0;
    }
    int _117 = 0;
    if (!_109)
    {
        float _119 = _113 * 5.0;
        _117 = as_type<int>(_119);
    }
    int _121 = _117;
    int _123 = _121;
    if (!_109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2338 = as_type<float>(_121);
        out.gl_Position.z = _2338;
    }
    if (!_109)
    {
        return out;
    }
    float _125 = in.m_63.w;
    bool _127 = _125 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _129 = isnan(_125);
    bool _131 = _127 || _129;
    bool _133 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _135 = _131 || _133;
    float _137 = -_125;
    float _139 = _137 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _141 = 0.0;
    if (_135)
    {
        float _143 = float(_105);
        _141 = _143;
    }
    float _145 = _141;
    bool _147 = _139 >= _145;
    bool _149 = !_135;
    bool _151 = _147 || _149;
    if (_151)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _153 = _115;
    if (_151)
    {
        out.m_61.x = 0.0;
    }
    if (_151)
    {
        float _155 = _153 * 5.0;
        _123 = as_type<int>(_155);
    }
    int _157 = _123;
    if (_151)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2406 = as_type<float>(_157);
        out.gl_Position.z = _2406;
    }
    if (_151)
    {
        return out;
    }
    bool _159 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _161 = !_159;
    float _179;
    if (!_161)
    {
        float _163 = in.m_65.x;
        float _165 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _167 = _163 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _169 = fma(_167, (*spvDescriptorSet0.vp_c9)._m0[12].x, _139);
        float _171 = _169 * _165;
        float _173 = floor(_171);
        float _175 = -_173;
        float _177 = _171 + _175;
        _179 = _177;
        _181 = true;
    }
    else
    {
        float _183 = float(_105);
        float _185 = 1.0 / _183;
        float _187 = _139 * _185;
        _179 = _187;
    }
    _181 = false;
    float _189 = _179;
    float _191 = as_type<float>(int(gl_VertexIndex));
    float _193 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _195 = _189 + _193;
    float _197 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _199 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _201 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _199;
    float _203 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _205 = 1.0 / _201;
    float _207 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _203);
    bool _209 = _189 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _211 = isnan(_189);
    bool _213 = _209 || _211;
    bool _215 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _217 = _213 || _215;
    float _219 = float(_217);
    bool _221 = _189 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _223 = isnan(_189);
    bool _225 = _221 || _223;
    bool _227 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _229 = _225 || _227;
    float _231 = float(_229);
    float _233 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _207);
    float _235 = -_219;
    float _237 = _235 + 1.0;
    float _239 = sqrt(_233);
    int _241 = as_type<int>(_191) & 1;
    bool _243 = _241 != 0;
    int _245 = as_type<int>(_191) & 2;
    bool _247 = _245 != 0;
    float _249 = in.m_58.x;
    float _251 = in.m_58.y;
    float _253 = in.m_58.z;
    float _255 = _195 * _205;
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _259 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _257;
    float _261 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _263 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _261;
    float _265 = rsqrt(_233);
    float _267 = _231 * _237;
    float _269 = fma(_259, _255, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _271 = fma(_263, _255, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _273 = in.m_70.x;
    float _275 = in.m_70.y;
    float _277 = precise::max(_239, 2.0);
    float _279 = _271 * _267;
    bool _281 = !_247;
    float _283 = _281 ? (-0.5) : 0.5;
    float _285 = _269 * _267;
    bool _287 = !_243;
    float _289 = _287 ? (-0.5) : 0.5;
    float _291 = -_231;
    float _293 = _291 + 1.0;
    float _295 = precise::min(_277, 15.0);
    float _297 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[143].x, _285);
    float _299 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[143].y, _279);
    float _301 = fma(_295, 0.061538465321063995361328125, -0.12307693064212799072265625);
    float _303 = -_251;
    float _305 = _283 + _303;
    float _307 = -_249;
    float _309 = _289 + _307;
    float _311 = fma(_219, (*spvDescriptorSet0.vp_c9)._m0[144].x, _297);
    float _313 = fma(_219, (*spvDescriptorSet0.vp_c9)._m0[144].y, _299);
    float _315 = -_305;
    float _317 = fma(_305, _265, _315);
    float _319 = -_309;
    float _321 = fma(_309, _265, _319);
    float _323 = -_265;
    float _325 = fma(_323, _253, _253);
    float _327 = _251 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _329 = fma(_301, _317, _305);
    float _331 = fma(_301, _321, _309);
    float _333 = _313 * _275;
    float _335 = _311 * _273;
    float _337 = _329 + _251;
    float _339 = _331 + _249;
    float _341 = _333 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _343 = _335 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _345 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _337);
    float _347 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _339);
    float _349 = _301 * _325;
    float _351 = fma(_249, (*spvDescriptorSet0.vp_c10)._m0[4].x, _327);
    float _353 = _341 * _345;
    float _355 = _343 * _347;
    float _357 = _251 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _359 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _349);
    float _361 = _353 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _363 = _353 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _365 = fma(_249, (*spvDescriptorSet0.vp_c10)._m0[6].x, _357);
    float _367 = fma(_253, (*spvDescriptorSet0.vp_c10)._m0[4].z, _351);
    float _369 = fma(_355, (*spvDescriptorSet0.vp_c8)._m0[24].x, _361);
    float _371 = fma(_355, (*spvDescriptorSet0.vp_c8)._m0[26].x, _363);
    float _373 = fma(_253, (*spvDescriptorSet0.vp_c10)._m0[6].z, _365);
    float _375 = _367 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _377 = fma(_359, (*spvDescriptorSet0.vp_c8)._m0[24].z, _369);
    float _379 = fma(_359, (*spvDescriptorSet0.vp_c8)._m0[26].z, _371);
    float _381 = _373 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _383 = _251 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _385 = _377 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _387 = _379 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _389 = _353 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _391 = in.m_65.x;
    float _393 = in.m_65.y;
    float _395 = _375 + _385;
    float _397 = _381 + _387;
    float _399 = fma(_249, (*spvDescriptorSet0.vp_c10)._m0[5].x, _383);
    float _401 = fma(_355, (*spvDescriptorSet0.vp_c8)._m0[25].x, _389);
    float _403 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _405 = _395 + _403;
    float _407 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _409 = _397 + _407;
    float _411 = fma(_253, (*spvDescriptorSet0.vp_c10)._m0[5].z, _399);
    float _413 = fma(_359, (*spvDescriptorSet0.vp_c8)._m0[25].z, _401);
    float _415 = _405 * _405;
    float _417 = _409 * _409;
    float _419 = _411 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _421 = _413 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _423 = _415 + _417;
    float _425 = _419 + _421;
    int _427 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _429 = _427 != 0;
    float _431 = sqrt(_423);
    int _433 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _435 = _433 != 0;
    bool _437 = _391 > 0.5;
    bool _439 = _393 > 0.5;
    float _441 = -_289;
    int _443 = _437 ? as_type<int>(_441) : as_type<int>(_289);
    float _445 = -_283;
    int _447 = _439 ? as_type<int>(_445) : as_type<int>(_283);
    bool _449 = _431 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _451 = _421;
    float _453 = _411;
    float _455 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    float _457 = _395;
    float _459 = _397;
    float _461 = _409;
    if (!_449)
    {
        _451 = _395;
    }
    float _463 = _451;
    float _465 = _463;
    if (!_449)
    {
        _453 = _417;
    }
    float _467 = _453;
    float _469 = _467;
    if (!_449)
    {
        _455 = _415;
    }
    float _471 = _455;
    float _473 = _471;
    if (!_449)
    {
        _457 = _425;
    }
    float _475 = _457;
    bool _477 = !_449;
    float _479 = _475;
    if (!_477)
    {
        float _481 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _483 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _485 = _431 + _483;
        float _487 = rsqrt(_423);
        float _489 = _485 * _481;
        float _491 = _425 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _493 = _489 * 0.15915493667125701904296875;
        float _495 = _493 * 6.283185482025146484375;
        float _497 = sin(_495);
        float _499 = _493 * 6.283185482025146484375;
        float _501 = cos(_499);
        float _503 = fma(_497, _491, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _505 = _487 * _503;
        float _507 = _501 + (-1.0);
        float _509 = fma(_405, _505, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _511 = fma(_409, _505, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _513 = _507 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _515 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _517 = _509 + _515;
        float _519 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _521 = _511 + _519;
        float _523 = fma(_425, _501, _513);
        float _525 = _517 * _517;
        float _527 = _521 * _521;
        _479 = _523;
        _473 = _525;
        _469 = _527;
        _465 = _509;
        _459 = _511;
    }
    float _529 = _479;
    float _531 = _473;
    float _533 = _469;
    float _535 = _465;
    float _537 = _459;
    float _539 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _541 = _529 + _539;
    float _543 = _337 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _545 = !_435;
    float _547 = _545 ? _283 : as_type<float>(_447);
    float _549 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _551 = fma(_541, _541, _531);
    float _553 = _339 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _555 = _543 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _557 = _543 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _559 = !_429;
    float _561 = _559 ? _289 : as_type<float>(_443);
    float _563 = _543 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _565 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[17].y, 1.0);
    float _567 = _551 + _533;
    float _569 = fma(_553, (*spvDescriptorSet0.vp_c8)._m0[24].x, _555);
    float _571 = fma(_553, (*spvDescriptorSet0.vp_c8)._m0[25].x, _557);
    float _573 = fma(_553, (*spvDescriptorSet0.vp_c8)._m0[26].x, _563);
    float _575 = _561 + 0.5;
    float _577 = -_547;
    float _579 = _577 + 0.5;
    float _581 = sqrt(_567);
    float _583 = _575 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _585 = _579 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _587 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _589 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _591 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _593 = _583 * _197;
    float _595 = _585 * _549;
    float _597 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _599 = _587 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _601 = _589 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _603 = _591 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _605 = fma(_565, (*spvDescriptorSet0.vp_c8)._m0[24].z, _569);
    float _607 = fma(_565, (*spvDescriptorSet0.vp_c8)._m0[25].z, _571);
    float _609 = fma(_565, (*spvDescriptorSet0.vp_c8)._m0[26].z, _573);
    out.m_72.x = _593;
    out.m_72.y = _595;
    bool _611 = _581 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _613 = isnan(_581);
    bool _615 = _611 || _613;
    bool _617 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _619 = _615 || _617;
    out.m_74.x = _599;
    out.m_74.y = _601;
    out.m_74.z = _603;
    out.m_74.w = _597;
    out.m_76.x = _605;
    out.m_76.y = _607;
    out.m_76.z = _609;
    if (!_619)
    {
        _461 = 1.0;
    }
    float _621 = _461;
    bool _623 = !_619;
    float _625 = _621;
    if (!_623)
    {
        bool _627 = _581 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _629 = isnan(_581);
        bool _631 = _627 || _629;
        bool _633 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _635 = _631 || _633;
        if (!_635)
        {
            float _637 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _639 = _581 + _637;
            float _641 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _643 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _641;
            float _645 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _647 = _645 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _649 = 1.0 / _643;
            float _651 = _639 * _649;
            float _653 = fma(_651, _647, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _625 = _653;
            _655 = true;
        }
        else
        {
            bool _657 = _581 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _659 = isnan(_581);
            bool _661 = _657 || _659;
            bool _663 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _665 = _661 || _663;
            if (!_665)
            {
                float _667 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _669 = _581 + _667;
                float _671 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _673 = _671 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _675 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _677 = _675 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _679 = 1.0 / _673;
                float _681 = _669 * _679;
                float _683 = fma(_681, _677, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _625 = _683;
                _655 = true;
            }
            else
            {
                _625 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _655 = false;
    float _685 = _625;
    float _687 = fma(_375, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _689 = fma(_381, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _691 = floor(_687);
    float _693 = floor(_689);
    float _695 = -_691;
    float _697 = _687 + _695;
    float _699 = -_693;
    float _701 = _689 + _699;
    float2 _3356 = float2(_697, _701);
    float _703 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3356, float2(0.0), isnan(_3356)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3356, float2(0.0), isnan(_3356)), level(0.0)).x;
    float _705 = _419 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _707 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _709 = _535 + _707;
    float _711 = fma(_375, (*spvDescriptorSet0.vp_c8)._m0[11].x, _705);
    float _713 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _715 = _529 + _713;
    float _717 = fma(_709, _685, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _719 = fma(_381, (*spvDescriptorSet0.vp_c8)._m0[11].z, _711);
    float _721 = _419 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _723 = fma(_715, _685, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _725 = _719 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _727 = fma(_375, (*spvDescriptorSet0.vp_c8)._m0[10].x, _721);
    float _729 = 1.0 / _725;
    float _731 = fma(_381, (*spvDescriptorSet0.vp_c8)._m0[10].z, _727);
    float _733 = _731 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _735 = _733 + _725;
    float _737 = _735 * _729;
    float _739 = _737 * 0.5;
    float _741 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _743 = fma(_739, (*spvDescriptorSet0.vp_c8)._m0[30].w, _741);
    float _745 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _747 = _419 + _745;
    float _749 = 1.0 / _743;
    float _751 = _747 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _753 = _747 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _755 = fma(_375, (*spvDescriptorSet0.vp_c15)._m0[126].x, _751);
    float _757 = fma(_375, (*spvDescriptorSet0.vp_c15)._m0[127].x, _753);
    float _759 = fma(_381, (*spvDescriptorSet0.vp_c15)._m0[126].z, _755);
    float _761 = fma(_381, (*spvDescriptorSet0.vp_c15)._m0[127].z, _757);
    float _763 = _759 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _765 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _767 = _749 * _765;
    float _769 = _761 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _771 = trunc(_763);
    int _773 = int(_771);
    bool _775 = _767 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _777 = _767 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _779 = !_775;
    int _781 = _779 ? 0 : 1;
    float _783 = trunc(_769);
    int _785 = int(_783);
    int _787 = 2;
    float _789 = _685;
    int _791 = as_type<int>(_715);
    int _793 = as_type<int>(_709);
    if (!_775)
    {
        _787 = 1;
    }
    int _795 = _787;
    int _797 = _795;
    if (!_777)
    {
        _797 = _781;
    }
    int _799 = _797;
    int _801 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _803 = _773 + _801;
    int _805 = _803 + 1;
    int _807 = _799 << 6;
    bool _809 = _805 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _811 = _807 + 48;
    uint _814 = uint(int(uint(_811) >> uint(2)));
    uint _816 = uint(int(uint(int(_814)) >> uint(2)));
    int _818 = int(_814) & 3;
    float _820 = (*spvDescriptorSet0.vp_c15)._m0[int(_816)][_818];
    int _822 = int(_814) + 1;
    uint _824 = uint(int(uint(_822) >> uint(2)));
    int _826 = _822 & 3;
    float _828 = (*spvDescriptorSet0.vp_c15)._m0[int(_824)][_826];
    int _830 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _832 = _785 + _830;
    int _834 = _832 + 1;
    int _836 = _805 | _834;
    int _838 = _807 + 56;
    uint _840 = uint(int(uint(_838) >> uint(2)));
    uint _842 = uint(int(uint(int(_840)) >> uint(2)));
    int _844 = int(_840) & 3;
    float _846 = (*spvDescriptorSet0.vp_c15)._m0[int(_842)][_844];
    int _848 = int(_840) + 1;
    uint _850 = uint(int(uint(_848) >> uint(2)));
    int _852 = _848 & 3;
    float _854 = (*spvDescriptorSet0.vp_c15)._m0[int(_850)][_852];
    bool _856 = _836 < 0;
    bool _858 = _856 || _809;
    bool _860 = _834 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _862 = _860 || _858;
    bool _864 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _866 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _868 = _864 || _866;
    bool _870 = isnan(0.5);
    bool _872 = _868 || _870;
    int _874 = _807 + 64;
    uint _876 = uint(int(uint(_874) >> uint(2)));
    uint _878 = uint(int(uint(int(_876)) >> uint(2)));
    int _880 = int(_876) & 3;
    float _882 = (*spvDescriptorSet0.vp_c15)._m0[int(_878)][_880];
    int _884 = int(_876) + 1;
    uint _886 = uint(int(uint(_884) >> uint(2)));
    int _888 = _884 & 3;
    float _890 = (*spvDescriptorSet0.vp_c15)._m0[int(_886)][_888];
    float _892 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _894 = _537 + _892;
    float _896 = fma(_894, _685, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    int _898 = _807 + 72;
    uint _900 = uint(int(uint(_898) >> uint(2)));
    uint _902 = uint(int(uint(int(_900)) >> uint(2)));
    int _904 = int(_900) & 3;
    float _906 = (*spvDescriptorSet0.vp_c15)._m0[int(_902)][_904];
    int _908 = int(_900) + 1;
    uint _910 = uint(int(uint(_908) >> uint(2)));
    int _912 = _908 & 3;
    float _914 = (*spvDescriptorSet0.vp_c15)._m0[int(_910)][_912];
    int _916 = _805;
    float _918 = as_type<float>(_834);
    float _920 = _894;
    float _922 = _896;
    float _924 = as_type<float>(_799);
    if (!_862)
    {
        int _926 = _834 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _928 = _926 + _805;
        _916 = _928;
    }
    int _930 = _916;
    if (_872)
    {
        _918 = _717;
    }
    float _932 = _918;
    float _934 = _932;
    if (_872)
    {
        _789 = _723;
    }
    float _936 = _789;
    int _938 = _807 + 96;
    uint _940 = uint(int(uint(_938) >> uint(2)));
    uint _942 = uint(int(uint(int(_940)) >> uint(2)));
    int _944 = int(_940) & 3;
    float _946 = (*spvDescriptorSet0.vp_c15)._m0[int(_942)][_944];
    int _948 = int(_940) + 1;
    uint _950 = uint(int(uint(_948) >> uint(2)));
    int _952 = _948 & 3;
    float _954 = (*spvDescriptorSet0.vp_c15)._m0[int(_950)][_952];
    float _956 = _936;
    if (_872)
    {
        _920 = _896;
    }
    float _958 = _920;
    int _960 = _807 + 104;
    uint _962 = uint(int(uint(_960) >> uint(2)));
    uint _964 = uint(int(uint(int(_962)) >> uint(2)));
    int _966 = int(_962) & 3;
    float _968 = (*spvDescriptorSet0.vp_c15)._m0[int(_964)][_966];
    int _970 = int(_962) + 1;
    uint _972 = uint(int(uint(_970) >> uint(2)));
    int _974 = _970 & 3;
    float _976 = (*spvDescriptorSet0.vp_c15)._m0[int(_972)][_974];
    float _978 = _958;
    int _980 = as_type<int>(_946);
    if (!_872)
    {
        float _982 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _984 = _419 + _982;
        float _986 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _988 = _375 + _986;
        float _990 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _992 = -_375;
        float _994 = _992 + _717;
        float _996 = _984 * _984;
        float _998 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1000 = _381 + _998;
        float _1002 = -_381;
        float _1004 = _1002 + _896;
        float _1006 = fma(_988, _988, _996);
        float _1008 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1010 = fma(_1000, _1000, _1006);
        float _1012 = sqrt(_1010);
        float _1014 = _990 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1016 = precise::min(_1012, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1018 = _1016 * _1008;
        float _1020 = -_419;
        float _1022 = _1020 + _723;
        float _1024 = _1014 * _1018;
        float _1026 = fma(_1022, _1024, _419);
        float _1028 = fma(_994, _1024, _375);
        float _1030 = fma(_1004, _1024, _381);
        _956 = _1026;
        _934 = _1028;
        _978 = _1030;
        _791 = as_type<int>(_990);
        _793 = as_type<int>(_1022);
        _922 = _1004;
    }
    float _1032 = _956;
    float _1034 = _934;
    float _1036 = _978;
    int _1038 = _791;
    int _1040 = _793;
    float _1042 = _922;
    float _1044 = _1032 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1046 = _747 * _954;
    int _1048 = _1038;
    int _1050 = _1040;
    if (!_862)
    {
        int _1052 = _930 << 2;
        _1048 = _1052;
    }
    int _1054 = _1048;
    float _1056 = _747 * _890;
    float _1058 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1044);
    float _1060 = fma(_375, _946, _1046);
    if (!_862)
    {
        uint _1062 = uint(int(uint(_930) >> uint(2)));
        _1050 = int(_1062);
    }
    int _1064 = _1050;
    float _1066 = fma(_375, _882, _1056);
    float _1068 = fma(_1036, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1058);
    if (!_862)
    {
        int _1070 = 12 & _1054;
        _980 = _1070;
    }
    int _1072 = _980;
    float _1074 = fma(_381, _968, _1060);
    float _1076 = _747 * _828;
    float _1078 = _1068 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1080 = as_type<float>(_1072);
    if (!_862)
    {
        int _1082 = _1064 << 4;
        int _1084 = _1082 + _1072;
        _1080 = as_type<float>(_1084);
    }
    float _1086 = _1080;
    float _1088 = _1074 + _976;
    int _1090 = _807 + 80;
    uint _1092 = uint(int(uint(_1090) >> uint(2)));
    uint _1094 = uint(int(uint(int(_1092)) >> uint(2)));
    int _1096 = int(_1092) & 3;
    float _1098 = (*spvDescriptorSet0.vp_c15)._m0[int(_1094)][_1096];
    int _1100 = int(_1092) + 1;
    uint _1102 = uint(int(uint(_1100) >> uint(2)));
    int _1104 = _1100 & 3;
    float _1106 = (*spvDescriptorSet0.vp_c15)._m0[int(_1102)][_1104];
    float _1108 = fma(_375, _820, _1076);
    float _1110 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1112 = 1.0 / _1088;
    float _1114 = _1078 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1116 = fma(_381, _846, _1108);
    float _1118 = _1032 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1120 = _1032 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1122 = _1086;
    if (!_862)
    {
        int _1124 = as_type<int>(_1086) + 400;
        uint _1126 = uint(int(uint(_1124) >> uint(2)));
        uint _1128 = uint(int(uint(int(_1126)) >> uint(2)));
        int _1130 = int(_1126) & 3;
        float _1132 = (*spvDescriptorSet0.vp_c15)._m0[int(_1128)][_1130];
        _1122 = _1132;
    }
    float _1134 = _1122;
    float _1136 = _1116 + _854;
    float _1138 = -_1114;
    float _1140 = fma(_1138, _1110, 1.0);
    float _1142 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1118);
    float _1144 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1120);
    float _1146 = fma(_381, _906, _1066);
    float _1148 = _1032 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1150 = fma(_1036, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1142);
    int _1152 = _807 + 88;
    uint _1154 = uint(int(uint(_1152) >> uint(2)));
    uint _1156 = uint(int(uint(int(_1154)) >> uint(2)));
    int _1158 = int(_1154) & 3;
    float _1160 = (*spvDescriptorSet0.vp_c15)._m0[int(_1156)][_1158];
    int _1162 = int(_1154) + 1;
    uint _1164 = uint(int(uint(_1162) >> uint(2)));
    int _1166 = _1162 & 3;
    float _1168 = (*spvDescriptorSet0.vp_c15)._m0[int(_1164)][_1166];
    float _1170 = fma(_1036, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1144);
    float _1172 = _1146 + _914;
    float _1174 = _1136 * _1112;
    float _1176 = _1150 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1178 = _1170 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1180 = _1172 * _1112;
    float _1182 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1148);
    bool _1184 = _1174 >= 0.0;
    float _1186 = _1178 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1188 = log2(_1140);
    float _1190 = fma(_1036, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1182);
    bool _1192 = _1174 <= 1.0;
    bool _1194 = _1192 && _1184;
    float _1196 = fma(_1176, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1186);
    float _1198 = _1178 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1200 = _1190 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    bool _1202 = _1180 >= 0.0;
    bool _1204 = _1202 && _1194;
    float _1206 = fma(_1078, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1196);
    float _1208 = _1140;
    if (!_862)
    {
        float _1210 = floor(_769);
        _1208 = _1210;
    }
    float _1212 = _1208;
    bool _1214 = _1180 <= 1.0;
    bool _1216 = _1214 && _1204;
    float _1218 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1206);
    float _1220 = fma(_1176, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1198);
    float _1222 = _1042;
    if (!_862)
    {
        float _1224 = floor(_763);
        _1222 = _1224;
    }
    float _1226 = _1222;
    float _1228 = fma(_1078, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1220);
    float _1230 = _1188 * 0.693147182464599609375;
    float _1232 = _747 * _1106;
    float _1234 = _1178 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1236 = 1.0 / _1218;
    float _1238 = _1228;
    if (_1216)
    {
        float _1240 = float(_799);
        _924 = _1240;
    }
    float _1242 = _924;
    float _1244 = fma(_375, _1098, _1232);
    float _1246 = fma(_1176, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1234);
    float _1248 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1228);
    float _1250 = 0.0;
    float _1252 = _1212;
    float _1254 = _1248;
    if (!_862)
    {
        float _1256 = -_1212;
        float _1258 = _769 + _1256;
        _1250 = _1258;
    }
    float _1260 = _1250;
    float _1262 = fma(_1078, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1246);
    float _1264 = _1134;
    if (!_862)
    {
        float _1266 = rint(_1134);
        float _1268 = precise::max(_1266, 0.0);
        uint _1270 = uint(_1268);
        uint _1272 = clamp(_1270, 0u, 65535u);
        _1264 = as_type<float>(_1272);
    }
    float _1274 = _1264;
    if (!_862)
    {
        float _1276 = -_1226;
        float _1278 = _763 + _1276;
        _1252 = _1278;
    }
    float _1280 = _1252;
    float _1282 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1262);
    float _1284 = fma(_381, _1160, _1244);
    float _1286 = _1244;
    if (_1216)
    {
        float _1288 = rint(_1242);
        float _1290 = precise::max(_1288, 0.0);
        uint _1292 = uint(_1290);
        uint _1294 = clamp(_1292, 0u, 65535u);
        _1286 = as_type<float>(_1294);
    }
    float _1296 = _1286;
    float _1298 = _1248 * _1236;
    float _1300 = _1284 + _1168;
    float _1302 = _1282 * _1236;
    float _1304 = fma(_1298, -0.5, 0.5);
    float _1306 = _1300 * _1112;
    float _1308 = fma(_1302, 0.5, 0.5);
    float _1310 = _1230 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1312 = _1280;
    float _1314 = _1310;
    float _1316 = _1274;
    if (!_862)
    {
        float3 _4396 = float3(_1280, _1260, float(as_type<int>(_1274)));
        float3 _4400 = select(_4396, float3(0.0), isnan(_4396));
        float _1318 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4400.xy, uint(rint(_4400.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4400.xy, uint(rint(_4400.z)), level(0.0)).x;
        _1312 = _1318;
    }
    float _1320 = _1312;
    float _1322 = _1180;
    if (_1216)
    {
        float3 _4415 = float3(_1174, _1180, float(as_type<int>(_1296)));
        float3 _4417 = select(_4415, float3(0.0), isnan(_4415));
        float _1324 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _4417.xy, uint(rint(_4417.z)), _1306, level(0.0));
        _1322 = _1324;
    }
    float _1326 = _1322;
    float3 _4427 = float3(_1308, _1304, _1310);
    float _1328 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4427, float3(0.0), isnan(_4427)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4427, float3(0.0), isnan(_4427)), level(0.0)).x;
    float3 _4436 = float3(_1308, _1304, _1310);
    float4 _1331 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4436, float3(0.0), isnan(_4436)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4436, float3(0.0), isnan(_4436)), level(0.0)).xyzw;
    float _1333 = _1331.x;
    float _1335 = _1331.y;
    float _1337 = _1331.z;
    float _1339 = _1331.w;
    bool _1341 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1343 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1345 = _1341 || _1343;
    bool _1347 = isnan(0.5);
    bool _1349 = _1345 || _1347;
    float _1351 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    if (_1349)
    {
        _1351 = 1.0;
    }
    float _1353 = _1351;
    float _1355 = _1353;
    if (_1349)
    {
        _1238 = 1.0;
    }
    float _1357 = _1238;
    float _1359 = _1357;
    float _1361 = _1326;
    if (!_1349)
    {
        float _1363 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1365 = _1363 * 0.15915493667125701904296875;
        float _1367 = _1365 * 6.283185482025146484375;
        float _1369 = cos(_1367);
        float _1371 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1373 = _1371 * 0.15915493667125701904296875;
        float _1375 = _1365 * 6.283185482025146484375;
        float _1377 = sin(_1375);
        float _1379 = 1.0 / _1369;
        float _1381 = _1373 * 6.283185482025146484375;
        float _1383 = cos(_1381);
        float _1385 = _1377 * _1379;
        float _1387 = _1373 * 6.283185482025146484375;
        float _1389 = sin(_1387);
        float _1391 = _1383 * _1385;
        float _1393 = 1.0 / _1391;
        float _1395 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1397 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1395;
        float _1399 = 1.0 / _1397;
        float _1401 = _1389 * _1393;
        float _1403 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1405 = fma(_767, _1401, _1403);
        float _1407 = _1405 * _1399;
        float _1409 = precise::clamp(_1407, 0.0, 1.0);
        _1314 = _1379;
        _1316 = _1399;
        _1359 = _1409;
    }
    float _1411 = _1314;
    float _1413 = _1316;
    float _1415 = _1359;
    float _1417 = _1411;
    float _1419 = _1413;
    if (!_1349)
    {
        float _1421 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1423 = _1421 * 0.15915493667125701904296875;
        float _1425 = _1423 * 6.283185482025146484375;
        float _1427 = cos(_1425);
        float _1429 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1431 = _1429 * 0.15915493667125701904296875;
        float _1433 = _1423 * 6.283185482025146484375;
        float _1435 = sin(_1433);
        float _1437 = 1.0 / _1427;
        float _1439 = _1431 * 6.283185482025146484375;
        float _1441 = cos(_1439);
        float _1443 = _1435 * _1437;
        float _1445 = _1431 * 6.283185482025146484375;
        float _1447 = sin(_1445);
        float _1449 = _1441 * _1443;
        float _1451 = 1.0 / _1449;
        float _1453 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1455 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1453;
        float _1457 = 1.0 / _1455;
        float _1459 = _1447 * _1451;
        float _1461 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1463 = fma(_767, _1459, _1461);
        float _1465 = _1463 * _1457;
        float _1467 = precise::clamp(_1465, 0.0, 1.0);
        float _1469 = -_1467;
        float _1471 = _1469 + 1.0;
        _1417 = _1459;
        _1419 = _1431;
        _1355 = _1471;
    }
    float _1473 = _1417;
    float _1475 = _1419;
    float _1477 = _1355;
    float _1479 = _1475;
    float _1481 = _1473;
    if (_862)
    {
        _1479 = 1.0;
    }
    float _1483 = _1479;
    float _1485 = _1483;
    if (!_862)
    {
        int _1487 = _930 << 4;
        int _1489 = _1487 + 2048;
        uint _1491 = uint(int(uint(_1489) >> uint(2)));
        uint _1493 = uint(int(uint(int(_1491)) >> uint(2)));
        int _1495 = int(_1491) & 3;
        float _1497 = (*spvDescriptorSet0.vp_c15)._m0[int(_1493)][_1495];
        int _1499 = int(_1491) + 1;
        uint _1501 = uint(int(uint(_1499) >> uint(2)));
        int _1503 = _1499 & 3;
        float _1505 = (*spvDescriptorSet0.vp_c15)._m0[int(_1501)][_1503];
        int _1507 = _1489 + 8;
        uint _1509 = uint(int(uint(_1507) >> uint(2)));
        uint _1511 = uint(int(uint(int(_1509)) >> uint(2)));
        int _1513 = int(_1509) & 3;
        float _1515 = (*spvDescriptorSet0.vp_c15)._m0[int(_1511)][_1513];
        int _1517 = int(_1509) + 1;
        uint _1519 = uint(int(uint(_1517) >> uint(2)));
        int _1521 = _1517 & 3;
        float _1523 = (*spvDescriptorSet0.vp_c15)._m0[int(_1519)][_1521];
        float _1525 = _747 * _1505;
        float _1527 = fma(_375, _1497, _1525);
        float _1529 = fma(_381, _1515, _1527);
        float _1531 = _1529 + _1523;
        float _1533 = precise::clamp(_1531, 0.0, 1.0);
        float _1535 = -_1533;
        float _1537 = _1535 + _1320;
        float _1539 = fma(_1537, 500.0, 1.5);
        float _1541 = exp2(_1539);
        float _1543 = 0.0 + _1541;
        float _1545 = precise::clamp(_1543, 0.0, 1.0);
        _1485 = _1545;
    }
    float _1547 = _1485;
    float _1549 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1551 = _1032 + _1549;
    float _1553 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1555 = _1034 + _1553;
    float _1557 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1559 = _1036 + _1557;
    float _1561 = _1551 * _1551;
    float _1563 = fma(_1555, _1555, _1561);
    float _1565 = fma(_1559, _1559, _1563);
    float _1567 = rsqrt(_1565);
    float _1569 = _1567 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1571 = _1555 * _1569;
    float _1573 = _1559 * _1569;
    float _1575 = _1571 * _1571;
    float _1577 = _1573 * _1573;
    float _1579 = _1575 + _1577;
    float _1581 = sqrt(_1579);
    bool _1583 = _1581 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1585 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1587 = _1581 + _1585;
    float _1589 = _1559;
    float _1591 = _1561;
    float _1593 = _1587;
    float _1595 = _1569;
    if (_1583)
    {
        float _1597 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1589 = _1597;
    }
    float _1599 = _1589;
    if (_1583)
    {
        float _1601 = rsqrt(_1579);
        _1591 = _1601;
    }
    float _1603 = _1591;
    float _1605 = _1603;
    if (_1583)
    {
        float _1607 = _1587 * _1599;
        _1593 = _1607;
    }
    float _1609 = _1593;
    if (_1583)
    {
        float _1611 = _1609 * 0.15915493667125701904296875;
        _1481 = _1611;
    }
    float _1613 = _1481;
    float _1615 = _1567;
    if (_1583)
    {
        float _1617 = _1613 * 6.283185482025146484375;
        float _1619 = sin(_1617);
        _1615 = _1619;
    }
    float _1621 = _1615;
    float _1623 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1625 = precise::max(0.0, _1623);
    float _1627 = _1320;
    float _1629 = _1625;
    float _1631 = _1621;
    float _1633 = _1623;
    if (_1583)
    {
        float _1635 = _1613 * 6.283185482025146484375;
        float _1637 = cos(_1635);
        _1627 = _1637;
    }
    float _1639 = _1627;
    float _1641 = -_1569;
    float _1643 = -_1625;
    float _1645 = fma(_1551, _1641, _1643);
    float _1647 = _1645;
    if (_1583)
    {
        float _1649 = _1645 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1629 = _1649;
    }
    float _1651 = _1629;
    float _1653 = _1651;
    if (_1583)
    {
        float _1655 = fma(_1621, _1651, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1631 = _1655;
    }
    float _1657 = _1631;
    float _1659 = _1657;
    if (!_1583)
    {
        _1653 = _1573;
    }
    float _1661 = _1653;
    float _1663 = _1661;
    float _1665 = _1639;
    if (_1583)
    {
        float _1667 = _1639 + (-1.0);
        _1633 = _1667;
    }
    float _1669 = _1633;
    float _1671 = 0.0;
    if (_1583)
    {
        float _1673 = _1603 * _1657;
        _1671 = _1673;
    }
    float _1675 = _1671;
    if (!_1583)
    {
        _1659 = _1571;
    }
    float _1677 = _1659;
    float _1679 = _1677;
    if (_1583)
    {
        float _1681 = _1669 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1595 = _1681;
    }
    float _1683 = _1595;
    if (_1583)
    {
        float _1685 = _1571 * _1675;
        _1679 = _1685;
    }
    float _1687 = _1679;
    if (!_1583)
    {
        _1605 = _1575;
    }
    float _1689 = _1605;
    float _1691 = _1689;
    if (_1583)
    {
        float _1693 = _1573 * _1675;
        _1663 = _1693;
    }
    float _1695 = _1663;
    if (_1583)
    {
        float _1697 = fma(_1645, _1639, _1683);
        _1647 = _1697;
    }
    float _1699 = _1647;
    if (_1583)
    {
        float _1701 = _1687 * _1687;
        _1691 = _1701;
    }
    float _1703 = _1691;
    if (!_1583)
    {
        _1665 = _1577;
    }
    float _1705 = _1665;
    float _1707 = _1705;
    if (_1583)
    {
        float _1709 = _1695 * _1695;
        _1707 = _1709;
    }
    float _1711 = _1707;
    float _1713 = sqrt(_1565);
    float _1715 = fma(_1699, _1699, _1703);
    float _1717 = _1715 + _1711;
    float _1719 = rsqrt(_1717);
    float _1721 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1723 = fma(_1713, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1721);
    float _1725 = precise::clamp(_1723, 0.0, 1.0);
    float _1727 = -_1725;
    float _1729 = _1727 + 1.0;
    float _1731 = _1719 * _1699;
    float _1733 = _1719 * _1687;
    float _1735 = abs(_1729);
    float _1737 = log2(_1735);
    float _1739 = _1719 * _1695;
    float _1741 = _1733 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1743 = -_1741;
    float _1745 = fma(_1731, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1743);
    float _1747 = -_1739;
    float _1749 = fma(_1747, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1745);
    float _1751 = fma(_1749, -0.5, 0.5);
    float _1753 = _1737 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1755 = fma(_1749, 0.5, 0.5);
    float _1757 = sqrt(_1751);
    float _1759 = fma(_1755, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1761 = fma(_1755, _1759, -0.212114393711090087890625);
    float _1763 = _1731 + 1.0;
    float _1765 = exp2(_1753);
    float _1767 = fma(_1755, _1761, 1.570728778839111328125);
    float _1769 = _1757 * 0.636619746685028076171875;
    float _1771 = -_1767;
    float _1773 = fma(_1769, _1771, 1.0);
    float _1775 = -_1731;
    float _1777 = fma(_1765, _1763, _1775);
    float _1779 = fma(_1777, 0.5, 0.5);
    float2 _5084 = float2(_1773, _1779);
    float3 _1783 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5084, float2(0.0), isnan(_5084)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5084, float2(0.0), isnan(_5084)), level(0.0)).xyz;
    float _1785 = _1783.x;
    float _1787 = _1783.y;
    float _1789 = _1783.z;
    float _1791 = abs(_767);
    float _1793 = log2(_1791);
    float _1795 = _1178 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1797 = _1737 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1799 = -_703;
    float _1801 = _1799 + 1.0;
    float _1803 = fma(_1176, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1795);
    bool _1805 = _1713 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1807 = isnan(_1713);
    bool _1809 = _1805 || _1807;
    bool _1811 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1813 = _1809 || _1811;
    float _1815 = fma(_1078, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1803);
    float _1817 = exp2(_1797);
    bool _1819 = _767 <= 8000.0;
    bool _1821 = isnan(_767);
    bool _1823 = _1819 || _1821;
    bool _1825 = isnan(8000.0);
    bool _1827 = _1823 || _1825;
    float _1829 = float(_1827);
    float _1831 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1815);
    float _1833 = _1793 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1835 = _1831 + _1218;
    out.gl_Position.x = _1282;
    out.gl_Position.y = _1248;
    out.gl_Position.z = _1831;
    out.gl_Position.w = _1218;
    float _1837 = _1835 * 0.5;
    float _1839 = exp2(_1833);
    out.m_78.z = _1837;
    out.m_78.w = _1218;
    float _1841 = -_1817;
    float _1843 = _1841 + 1.0;
    float _1845 = _1817;
    if (!_1216)
    {
        _1254 = 1.0;
    }
    float _1847 = _1254;
    float _1849 = _1847;
    if (_1216)
    {
        bool _1851 = _1326 >= _1306;
        bool _1853 = isnan(_1326);
        bool _1855 = _1851 || _1853;
        bool _1857 = isnan(_1306);
        bool _1859 = _1855 || _1857;
        float _1861 = float(_1859);
        _1849 = _1861;
    }
    float _1863 = _1849;
    float _1865 = _1843 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (!_1813)
    {
        _1845 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1867 = _1845;
    float _1869 = fma(_1839, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1871 = precise::clamp(_1869, 0.0, 1.0);
    float _1873 = _1867;
    float _1875 = _1867;
    if (!_1813)
    {
        _1361 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1877 = _1361;
    float _1879 = _1865 * _1328;
    float _1881 = _1863 * _1547;
    float _1883 = fma(_1871, -2.0, 3.0);
    float _1885 = _1871 * _1871;
    float _1887 = _1339 * _1879;
    float _1889 = -_1865;
    float _1891 = _1889 + 1.0;
    float _1893 = _1885 * _1883;
    float _1895 = -_1893;
    float _1897 = _1895 + 1.0;
    float _1899 = fma(_1897, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1893);
    float _1901 = _1829 * _1899;
    float _1903 = _1901 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1905 = _1801 * _1903;
    float _1907 = precise::clamp(_1905, 0.0, 1.0);
    float _1909 = _1903;
    float _1911 = _1887;
    float _1913 = _1877;
    float _1915 = _1877;
    if (!_1813)
    {
        _1909 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1917 = _1909;
    float _1919 = -_1907;
    float _1921 = fma(_1919, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1923 = -_1881;
    float _1925 = fma(_1923, _1921, 1.0);
    float _1927 = precise::clamp(_1925, 0.0, 1.0);
    float _1929 = _1927 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1931 = _1927;
    float _1933 = _1917;
    float _1935 = _1917;
    if (!_1813)
    {
        _1931 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1937 = _1931;
    out.m_80.x = _1929;
    float _1939 = _1789 * _1879;
    float _1941 = fma(_1785, _1887, _1333);
    float _1943 = fma(_1787, _1887, _1335);
    float _1945 = _1339 * _1891;
    float _1947 = fma(_1339, _1939, _1337);
    float _1949 = _1415 * _1477;
    float _1951 = _1949;
    float _1953 = _1937;
    float _1955 = _1937;
    if (!_1813)
    {
        _1911 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1957 = _1911;
    out.m_82.x = _1941;
    out.m_82.y = _1943;
    out.m_82.z = _1947;
    out.m_82.w = _1945;
    float _1959 = _1949 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1961 = _1957;
    float _1963 = _1957;
    if (!_1813)
    {
        _1951 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1965 = _1951;
    bool _1967 = !_1813;
    float _1969 = _1965;
    float _1971 = _1965;
    if (!_1967)
    {
        bool _1973 = _1713 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1975 = isnan(_1713);
        bool _1977 = _1973 || _1975;
        bool _1979 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1981 = _1977 || _1979;
        if (!_1981)
        {
            float _1983 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1985 = _1713 + _1983;
            float _1987 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1989 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1987;
            float _1991 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1993 = _1991 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1995 = 1.0 / _1989;
            float _1997 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1999 = _1997 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2001 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2003 = _2001 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2005 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2007 = _2005 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2009 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2011 = _2009 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2013 = _1985 * _1995;
            float _2015 = precise::clamp(_2013, 0.0, 1.0);
            float _2017 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2019 = _2017 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2021 = fma(_2015, _1993, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2023 = fma(_2015, _2019, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2025 = fma(_2015, _1999, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2027 = fma(_2015, _2003, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2029 = fma(_2015, _2007, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2031 = fma(_2015, _2011, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1915 = _2025;
            _1955 = _2029;
            _1875 = _2021;
            _1963 = _2027;
            _1935 = _2023;
            _1971 = _2031;
            _2033 = true;
        }
        else
        {
            bool _2035 = _1713 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2037 = isnan(_1713);
            bool _2039 = _2035 || _2037;
            bool _2041 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2043 = _2039 || _2041;
            if (!_2043)
            {
                _1873 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2045 = _1873;
            _1875 = _2045;
            if (!_2043)
            {
                _1913 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2047 = _1913;
            _1915 = _2047;
            if (!_2043)
            {
                _1933 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2049 = _1933;
            _1935 = _2049;
            if (!_2043)
            {
                _1961 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2051 = _1961;
            _1963 = _2051;
            if (!_2043)
            {
                _1953 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2053 = _1953;
            _1955 = _2053;
            if (!_2043)
            {
                _1969 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2055 = _1969;
            bool _2057 = !_2043;
            _1971 = _2055;
            if (!_2057)
            {
                bool _2059 = _1713 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2061 = isnan(_1713);
                bool _2063 = _2059 || _2061;
                bool _2065 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2067 = _2063 || _2065;
                if (!_2067)
                {
                    float _2069 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2071 = _1713 + _2069;
                    float _2073 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2075 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2073;
                    float _2077 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2079 = _2077 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2081 = 1.0 / _2075;
                    float _2083 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2085 = _2083 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2087 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2089 = _2087 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2091 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2093 = _2091 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2095 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2097 = _2095 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2099 = _2071 * _2081;
                    float _2101 = precise::clamp(_2099, 0.0, 1.0);
                    float _2103 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2105 = _2103 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2107 = fma(_2101, _2079, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2109 = fma(_2101, _2105, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2111 = fma(_2101, _2085, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2113 = fma(_2101, _2089, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2115 = fma(_2101, _2093, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2117 = fma(_2101, _2097, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1915 = _2111;
                    _1955 = _2115;
                    _1875 = _2107;
                    _1963 = _2113;
                    _1935 = _2109;
                    _1971 = _2117;
                    _2033 = true;
                }
                else
                {
                    _1915 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1955 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1875 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1963 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1935 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1971 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2033 = false;
    float _2119 = _1915;
    float _2121 = _1955;
    float _2123 = _1875;
    float _2125 = _1963;
    float _2127 = _1935;
    float _2129 = _1971;
    float _2131 = fma(_607, -0.5, 0.5);
    float _2133 = precise::clamp(_2131, 0.0, 1.0);
    float _2135 = -_2119;
    float _2137 = _2135 + _2121;
    float _2139 = _1959 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2141 = -_2123;
    float _2143 = _2141 + _2125;
    float _2145 = fma(_2133, _2137, _2119);
    out.m_84.x = 0.0;
    float _2147 = -_2127;
    float _2149 = _2147 + _2129;
    float _2151 = fma(_2133, _2143, _2123);
    float _2153 = _2145 * 0.586610972881317138671875;
    out.m_61.x = _2139;
    bool _2155 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2157 = fma(_2133, _2149, _2127);
    float _2159 = fma(_2151, 0.298911988735198974609375, _2153);
    bool _2161 = _1415 > 0.0;
    bool _2163 = isnan(_1415);
    bool _2165 = _2161 || _2163;
    bool _2167 = isnan(0.0);
    bool _2169 = _2165 || _2167;
    float _2171 = fma(_2157, 0.114477999508380889892578125, _2159);
    bool _2173 = _1477 <= 0.0;
    bool _2175 = !_2169;
    bool _2177 = _2173 || _2175;
    float _2179 = -_2171;
    float _2181 = _2151 + _2179;
    float _2183 = -_2171;
    float _2185 = _2145 + _2183;
    float _2187 = -_2171;
    float _2189 = _2157 + _2187;
    float _2191 = fma(_2181, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2171);
    float _2193 = fma(_2185, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2171);
    float _2195 = fma(_2189, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2171);
    bool _2197 = !_2155;
    if (!_2197)
    {
        float _2199 = -_1032;
        float _2201 = _2199 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2203 = -_1034;
        float _2205 = _2203 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2207 = -_1036;
        float _2209 = _2207 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2211 = _2201 * _2201;
        float _2213 = fma(_2205, _2205, _2211);
        float _2215 = fma(_2209, _2209, _2213);
        float _2217 = sqrt(_2215);
        float _2219 = rsqrt(_2215);
        float _2221 = -_2217;
        float _2223 = _2221 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2225 = _2223 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2227 = precise::clamp(_2225, 0.0, 1.0);
        float _2229 = _2205 * _2219;
        float _2231 = _2201 * _2219;
        float _2233 = abs(_2227);
        float _2235 = log2(_2233);
        float _2237 = _2209 * _2219;
        float _2239 = _2229 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2241 = _607 * _2231;
        float _2243 = -_2231;
        float _2245 = -_2239;
        float _2247 = fma(_2243, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2245);
        float _2249 = fma(_605, _2229, _2241);
        float _2251 = -_2237;
        float _2253 = fma(_2251, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2247);
        float _2255 = fma(_609, _2237, _2249);
        float _2257 = precise::clamp(_2255, 0.0, 1.0);
        float _2259 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2261 = _2253 + _2259;
        float _2263 = _2235 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2265 = _2261 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2267 = precise::clamp(_2265, 0.0, 1.0);
        float _2269 = exp2(_2263);
        float _2271 = _2269 * _2267;
        float _2273 = _2257 * _2271;
        float _2275 = _2273 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2277 = _2273 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2279 = _2273 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_84.x = _2275;
        out.m_84.y = _2277;
        out.m_84.z = _2279;
    }
    out.m_86.x = _2191;
    out.m_86.y = _2193;
    out.m_86.z = _2195;
    if (!_2177)
    {
        return out;
    }
    out.m_61.x = 0.0;
    float _2281 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2281;
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
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2033 = false;
    bool _655 = false;
    bool _181 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _100 = in.m_58.w;
    float _102 = trunc(_100);
    int _105 = int(_102);
    bool _109 = _105 >= 1;
    float _111 = 0.0;
    if (!_109)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _113 = _111;
    float _115 = _113;
    if (!_109)
    {
        out.m_61.x = 0.0;
    }
    int _117 = 0;
    if (!_109)
    {
        float _119 = _113 * 5.0;
        _117 = as_type<int>(_119);
    }
    int _121 = _117;
    int _123 = _121;
    if (!_109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2338 = as_type<float>(_121);
        out.gl_Position.z = _2338;
    }
    if (!_109)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _125 = in.m_63.w;
    bool _127 = _125 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _129 = isnan(_125);
    bool _131 = _127 || _129;
    bool _133 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _135 = _131 || _133;
    float _137 = -_125;
    float _139 = _137 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _141 = 0.0;
    if (_135)
    {
        float _143 = float(_105);
        _141 = _143;
    }
    float _145 = _141;
    bool _147 = _139 >= _145;
    bool _149 = !_135;
    bool _151 = _147 || _149;
    if (_151)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _153 = _115;
    if (_151)
    {
        out.m_61.x = 0.0;
    }
    if (_151)
    {
        float _155 = _153 * 5.0;
        _123 = as_type<int>(_155);
    }
    int _157 = _123;
    if (_151)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2406 = as_type<float>(_157);
        out.gl_Position.z = _2406;
    }
    if (_151)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _159 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _161 = !_159;
    float _179;
    if (!_161)
    {
        float _163 = in.m_65.x;
        float _165 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _167 = _163 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _169 = fma(_167, (*spvDescriptorSet0.vp_c9)._m0[12].x, _139);
        float _171 = _169 * _165;
        float _173 = floor(_171);
        float _175 = -_173;
        float _177 = _171 + _175;
        _179 = _177;
        _181 = true;
    }
    else
    {
        float _183 = float(_105);
        float _185 = 1.0 / _183;
        float _187 = _139 * _185;
        _179 = _187;
    }
    _181 = false;
    float _189 = _179;
    float _191 = as_type<float>(int(gl_VertexIndex));
    float _193 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _195 = _189 + _193;
    float _197 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _199 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _201 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _199;
    float _203 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _205 = 1.0 / _201;
    float _207 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _203);
    bool _209 = _189 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _211 = isnan(_189);
    bool _213 = _209 || _211;
    bool _215 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _217 = _213 || _215;
    float _219 = float(_217);
    bool _221 = _189 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _223 = isnan(_189);
    bool _225 = _221 || _223;
    bool _227 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _229 = _225 || _227;
    float _231 = float(_229);
    float _233 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _207);
    float _235 = -_219;
    float _237 = _235 + 1.0;
    float _239 = sqrt(_233);
    int _241 = as_type<int>(_191) & 1;
    bool _243 = _241 != 0;
    int _245 = as_type<int>(_191) & 2;
    bool _247 = _245 != 0;
    float _249 = in.m_58.x;
    float _251 = in.m_58.y;
    float _253 = in.m_58.z;
    float _255 = _195 * _205;
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _259 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _257;
    float _261 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _263 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _261;
    float _265 = rsqrt(_233);
    float _267 = _231 * _237;
    float _269 = fma(_259, _255, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _271 = fma(_263, _255, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _273 = in.m_70.x;
    float _275 = in.m_70.y;
    float _277 = precise::max(_239, 2.0);
    float _279 = _271 * _267;
    bool _281 = !_247;
    float _283 = _281 ? (-0.5) : 0.5;
    float _285 = _269 * _267;
    bool _287 = !_243;
    float _289 = _287 ? (-0.5) : 0.5;
    float _291 = -_231;
    float _293 = _291 + 1.0;
    float _295 = precise::min(_277, 15.0);
    float _297 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[143].x, _285);
    float _299 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[143].y, _279);
    float _301 = fma(_295, 0.061538465321063995361328125, -0.12307693064212799072265625);
    float _303 = -_251;
    float _305 = _283 + _303;
    float _307 = -_249;
    float _309 = _289 + _307;
    float _311 = fma(_219, (*spvDescriptorSet0.vp_c9)._m0[144].x, _297);
    float _313 = fma(_219, (*spvDescriptorSet0.vp_c9)._m0[144].y, _299);
    float _315 = -_305;
    float _317 = fma(_305, _265, _315);
    float _319 = -_309;
    float _321 = fma(_309, _265, _319);
    float _323 = -_265;
    float _325 = fma(_323, _253, _253);
    float _327 = _251 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _329 = fma(_301, _317, _305);
    float _331 = fma(_301, _321, _309);
    float _333 = _313 * _275;
    float _335 = _311 * _273;
    float _337 = _329 + _251;
    float _339 = _331 + _249;
    float _341 = _333 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _343 = _335 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _345 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _337);
    float _347 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _339);
    float _349 = _301 * _325;
    float _351 = fma(_249, (*spvDescriptorSet0.vp_c10)._m0[4].x, _327);
    float _353 = _341 * _345;
    float _355 = _343 * _347;
    float _357 = _251 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _359 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _349);
    float _361 = _353 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _363 = _353 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _365 = fma(_249, (*spvDescriptorSet0.vp_c10)._m0[6].x, _357);
    float _367 = fma(_253, (*spvDescriptorSet0.vp_c10)._m0[4].z, _351);
    float _369 = fma(_355, (*spvDescriptorSet0.vp_c8)._m0[24].x, _361);
    float _371 = fma(_355, (*spvDescriptorSet0.vp_c8)._m0[26].x, _363);
    float _373 = fma(_253, (*spvDescriptorSet0.vp_c10)._m0[6].z, _365);
    float _375 = _367 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _377 = fma(_359, (*spvDescriptorSet0.vp_c8)._m0[24].z, _369);
    float _379 = fma(_359, (*spvDescriptorSet0.vp_c8)._m0[26].z, _371);
    float _381 = _373 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _383 = _251 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _385 = _377 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _387 = _379 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _389 = _353 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _391 = in.m_65.x;
    float _393 = in.m_65.y;
    float _395 = _375 + _385;
    float _397 = _381 + _387;
    float _399 = fma(_249, (*spvDescriptorSet0.vp_c10)._m0[5].x, _383);
    float _401 = fma(_355, (*spvDescriptorSet0.vp_c8)._m0[25].x, _389);
    float _403 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _405 = _395 + _403;
    float _407 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _409 = _397 + _407;
    float _411 = fma(_253, (*spvDescriptorSet0.vp_c10)._m0[5].z, _399);
    float _413 = fma(_359, (*spvDescriptorSet0.vp_c8)._m0[25].z, _401);
    float _415 = _405 * _405;
    float _417 = _409 * _409;
    float _419 = _411 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _421 = _413 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _423 = _415 + _417;
    float _425 = _419 + _421;
    int _427 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _429 = _427 != 0;
    float _431 = sqrt(_423);
    int _433 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _435 = _433 != 0;
    bool _437 = _391 > 0.5;
    bool _439 = _393 > 0.5;
    float _441 = -_289;
    int _443 = _437 ? as_type<int>(_441) : as_type<int>(_289);
    float _445 = -_283;
    int _447 = _439 ? as_type<int>(_445) : as_type<int>(_283);
    bool _449 = _431 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _451 = _421;
    float _453 = _411;
    float _455 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    float _457 = _395;
    float _459 = _397;
    float _461 = _409;
    if (!_449)
    {
        _451 = _395;
    }
    float _463 = _451;
    float _465 = _463;
    if (!_449)
    {
        _453 = _417;
    }
    float _467 = _453;
    float _469 = _467;
    if (!_449)
    {
        _455 = _415;
    }
    float _471 = _455;
    float _473 = _471;
    if (!_449)
    {
        _457 = _425;
    }
    float _475 = _457;
    bool _477 = !_449;
    float _479 = _475;
    if (!_477)
    {
        float _481 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _483 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _485 = _431 + _483;
        float _487 = rsqrt(_423);
        float _489 = _485 * _481;
        float _491 = _425 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _493 = _489 * 0.15915493667125701904296875;
        float _495 = _493 * 6.283185482025146484375;
        float _497 = sin(_495);
        float _499 = _493 * 6.283185482025146484375;
        float _501 = cos(_499);
        float _503 = fma(_497, _491, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _505 = _487 * _503;
        float _507 = _501 + (-1.0);
        float _509 = fma(_405, _505, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _511 = fma(_409, _505, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _513 = _507 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _515 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _517 = _509 + _515;
        float _519 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _521 = _511 + _519;
        float _523 = fma(_425, _501, _513);
        float _525 = _517 * _517;
        float _527 = _521 * _521;
        _479 = _523;
        _473 = _525;
        _469 = _527;
        _465 = _509;
        _459 = _511;
    }
    float _529 = _479;
    float _531 = _473;
    float _533 = _469;
    float _535 = _465;
    float _537 = _459;
    float _539 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _541 = _529 + _539;
    float _543 = _337 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _545 = !_435;
    float _547 = _545 ? _283 : as_type<float>(_447);
    float _549 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _551 = fma(_541, _541, _531);
    float _553 = _339 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _555 = _543 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _557 = _543 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _559 = !_429;
    float _561 = _559 ? _289 : as_type<float>(_443);
    float _563 = _543 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _565 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[17].y, 1.0);
    float _567 = _551 + _533;
    float _569 = fma(_553, (*spvDescriptorSet0.vp_c8)._m0[24].x, _555);
    float _571 = fma(_553, (*spvDescriptorSet0.vp_c8)._m0[25].x, _557);
    float _573 = fma(_553, (*spvDescriptorSet0.vp_c8)._m0[26].x, _563);
    float _575 = _561 + 0.5;
    float _577 = -_547;
    float _579 = _577 + 0.5;
    float _581 = sqrt(_567);
    float _583 = _575 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _585 = _579 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _587 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _589 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _591 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _593 = _583 * _197;
    float _595 = _585 * _549;
    float _597 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _599 = _587 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _601 = _589 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _603 = _591 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _605 = fma(_565, (*spvDescriptorSet0.vp_c8)._m0[24].z, _569);
    float _607 = fma(_565, (*spvDescriptorSet0.vp_c8)._m0[25].z, _571);
    float _609 = fma(_565, (*spvDescriptorSet0.vp_c8)._m0[26].z, _573);
    out.m_72.x = _593;
    out.m_72.y = _595;
    bool _611 = _581 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _613 = isnan(_581);
    bool _615 = _611 || _613;
    bool _617 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _619 = _615 || _617;
    out.m_74.x = _599;
    out.m_74.y = _601;
    out.m_74.z = _603;
    out.m_74.w = _597;
    out.m_76.x = _605;
    out.m_76.y = _607;
    out.m_76.z = _609;
    if (!_619)
    {
        _461 = 1.0;
    }
    float _621 = _461;
    bool _623 = !_619;
    float _625 = _621;
    if (!_623)
    {
        bool _627 = _581 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _629 = isnan(_581);
        bool _631 = _627 || _629;
        bool _633 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _635 = _631 || _633;
        if (!_635)
        {
            float _637 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _639 = _581 + _637;
            float _641 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _643 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _641;
            float _645 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _647 = _645 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _649 = 1.0 / _643;
            float _651 = _639 * _649;
            float _653 = fma(_651, _647, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _625 = _653;
            _655 = true;
        }
        else
        {
            bool _657 = _581 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _659 = isnan(_581);
            bool _661 = _657 || _659;
            bool _663 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _665 = _661 || _663;
            if (!_665)
            {
                float _667 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _669 = _581 + _667;
                float _671 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _673 = _671 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _675 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _677 = _675 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _679 = 1.0 / _673;
                float _681 = _669 * _679;
                float _683 = fma(_681, _677, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _625 = _683;
                _655 = true;
            }
            else
            {
                _625 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _655 = false;
    float _685 = _625;
    float _687 = fma(_375, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _689 = fma(_381, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _691 = floor(_687);
    float _693 = floor(_689);
    float _695 = -_691;
    float _697 = _687 + _695;
    float _699 = -_693;
    float _701 = _689 + _699;
    float2 _3356 = float2(_697, _701);
    float _703 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3356, float2(0.0), isnan(_3356)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3356, float2(0.0), isnan(_3356)), level(0.0)).x;
    float _705 = _419 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _707 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _709 = _535 + _707;
    float _711 = fma(_375, (*spvDescriptorSet0.vp_c8)._m0[11].x, _705);
    float _713 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _715 = _529 + _713;
    float _717 = fma(_709, _685, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _719 = fma(_381, (*spvDescriptorSet0.vp_c8)._m0[11].z, _711);
    float _721 = _419 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _723 = fma(_715, _685, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _725 = _719 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _727 = fma(_375, (*spvDescriptorSet0.vp_c8)._m0[10].x, _721);
    float _729 = 1.0 / _725;
    float _731 = fma(_381, (*spvDescriptorSet0.vp_c8)._m0[10].z, _727);
    float _733 = _731 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _735 = _733 + _725;
    float _737 = _735 * _729;
    float _739 = _737 * 0.5;
    float _741 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _743 = fma(_739, (*spvDescriptorSet0.vp_c8)._m0[30].w, _741);
    float _745 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _747 = _419 + _745;
    float _749 = 1.0 / _743;
    float _751 = _747 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _753 = _747 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _755 = fma(_375, (*spvDescriptorSet0.vp_c15)._m0[126].x, _751);
    float _757 = fma(_375, (*spvDescriptorSet0.vp_c15)._m0[127].x, _753);
    float _759 = fma(_381, (*spvDescriptorSet0.vp_c15)._m0[126].z, _755);
    float _761 = fma(_381, (*spvDescriptorSet0.vp_c15)._m0[127].z, _757);
    float _763 = _759 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _765 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _767 = _749 * _765;
    float _769 = _761 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _771 = trunc(_763);
    int _773 = int(_771);
    bool _775 = _767 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _777 = _767 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _779 = !_775;
    int _781 = _779 ? 0 : 1;
    float _783 = trunc(_769);
    int _785 = int(_783);
    int _787 = 2;
    float _789 = _685;
    int _791 = as_type<int>(_715);
    int _793 = as_type<int>(_709);
    if (!_775)
    {
        _787 = 1;
    }
    int _795 = _787;
    int _797 = _795;
    if (!_777)
    {
        _797 = _781;
    }
    int _799 = _797;
    int _801 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _803 = _773 + _801;
    int _805 = _803 + 1;
    int _807 = _799 << 6;
    bool _809 = _805 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _811 = _807 + 48;
    uint _814 = uint(int(uint(_811) >> uint(2)));
    uint _816 = uint(int(uint(int(_814)) >> uint(2)));
    int _818 = int(_814) & 3;
    float _820 = (*spvDescriptorSet0.vp_c15)._m0[int(_816)][_818];
    int _822 = int(_814) + 1;
    uint _824 = uint(int(uint(_822) >> uint(2)));
    int _826 = _822 & 3;
    float _828 = (*spvDescriptorSet0.vp_c15)._m0[int(_824)][_826];
    int _830 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _832 = _785 + _830;
    int _834 = _832 + 1;
    int _836 = _805 | _834;
    int _838 = _807 + 56;
    uint _840 = uint(int(uint(_838) >> uint(2)));
    uint _842 = uint(int(uint(int(_840)) >> uint(2)));
    int _844 = int(_840) & 3;
    float _846 = (*spvDescriptorSet0.vp_c15)._m0[int(_842)][_844];
    int _848 = int(_840) + 1;
    uint _850 = uint(int(uint(_848) >> uint(2)));
    int _852 = _848 & 3;
    float _854 = (*spvDescriptorSet0.vp_c15)._m0[int(_850)][_852];
    bool _856 = _836 < 0;
    bool _858 = _856 || _809;
    bool _860 = _834 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _862 = _860 || _858;
    bool _864 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _866 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _868 = _864 || _866;
    bool _870 = isnan(0.5);
    bool _872 = _868 || _870;
    int _874 = _807 + 64;
    uint _876 = uint(int(uint(_874) >> uint(2)));
    uint _878 = uint(int(uint(int(_876)) >> uint(2)));
    int _880 = int(_876) & 3;
    float _882 = (*spvDescriptorSet0.vp_c15)._m0[int(_878)][_880];
    int _884 = int(_876) + 1;
    uint _886 = uint(int(uint(_884) >> uint(2)));
    int _888 = _884 & 3;
    float _890 = (*spvDescriptorSet0.vp_c15)._m0[int(_886)][_888];
    float _892 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _894 = _537 + _892;
    float _896 = fma(_894, _685, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    int _898 = _807 + 72;
    uint _900 = uint(int(uint(_898) >> uint(2)));
    uint _902 = uint(int(uint(int(_900)) >> uint(2)));
    int _904 = int(_900) & 3;
    float _906 = (*spvDescriptorSet0.vp_c15)._m0[int(_902)][_904];
    int _908 = int(_900) + 1;
    uint _910 = uint(int(uint(_908) >> uint(2)));
    int _912 = _908 & 3;
    float _914 = (*spvDescriptorSet0.vp_c15)._m0[int(_910)][_912];
    int _916 = _805;
    float _918 = as_type<float>(_834);
    float _920 = _894;
    float _922 = _896;
    float _924 = as_type<float>(_799);
    if (!_862)
    {
        int _926 = _834 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _928 = _926 + _805;
        _916 = _928;
    }
    int _930 = _916;
    if (_872)
    {
        _918 = _717;
    }
    float _932 = _918;
    float _934 = _932;
    if (_872)
    {
        _789 = _723;
    }
    float _936 = _789;
    int _938 = _807 + 96;
    uint _940 = uint(int(uint(_938) >> uint(2)));
    uint _942 = uint(int(uint(int(_940)) >> uint(2)));
    int _944 = int(_940) & 3;
    float _946 = (*spvDescriptorSet0.vp_c15)._m0[int(_942)][_944];
    int _948 = int(_940) + 1;
    uint _950 = uint(int(uint(_948) >> uint(2)));
    int _952 = _948 & 3;
    float _954 = (*spvDescriptorSet0.vp_c15)._m0[int(_950)][_952];
    float _956 = _936;
    if (_872)
    {
        _920 = _896;
    }
    float _958 = _920;
    int _960 = _807 + 104;
    uint _962 = uint(int(uint(_960) >> uint(2)));
    uint _964 = uint(int(uint(int(_962)) >> uint(2)));
    int _966 = int(_962) & 3;
    float _968 = (*spvDescriptorSet0.vp_c15)._m0[int(_964)][_966];
    int _970 = int(_962) + 1;
    uint _972 = uint(int(uint(_970) >> uint(2)));
    int _974 = _970 & 3;
    float _976 = (*spvDescriptorSet0.vp_c15)._m0[int(_972)][_974];
    float _978 = _958;
    int _980 = as_type<int>(_946);
    if (!_872)
    {
        float _982 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _984 = _419 + _982;
        float _986 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _988 = _375 + _986;
        float _990 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _992 = -_375;
        float _994 = _992 + _717;
        float _996 = _984 * _984;
        float _998 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1000 = _381 + _998;
        float _1002 = -_381;
        float _1004 = _1002 + _896;
        float _1006 = fma(_988, _988, _996);
        float _1008 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1010 = fma(_1000, _1000, _1006);
        float _1012 = sqrt(_1010);
        float _1014 = _990 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1016 = precise::min(_1012, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1018 = _1016 * _1008;
        float _1020 = -_419;
        float _1022 = _1020 + _723;
        float _1024 = _1014 * _1018;
        float _1026 = fma(_1022, _1024, _419);
        float _1028 = fma(_994, _1024, _375);
        float _1030 = fma(_1004, _1024, _381);
        _956 = _1026;
        _934 = _1028;
        _978 = _1030;
        _791 = as_type<int>(_990);
        _793 = as_type<int>(_1022);
        _922 = _1004;
    }
    float _1032 = _956;
    float _1034 = _934;
    float _1036 = _978;
    int _1038 = _791;
    int _1040 = _793;
    float _1042 = _922;
    float _1044 = _1032 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1046 = _747 * _954;
    int _1048 = _1038;
    int _1050 = _1040;
    if (!_862)
    {
        int _1052 = _930 << 2;
        _1048 = _1052;
    }
    int _1054 = _1048;
    float _1056 = _747 * _890;
    float _1058 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1044);
    float _1060 = fma(_375, _946, _1046);
    if (!_862)
    {
        uint _1062 = uint(int(uint(_930) >> uint(2)));
        _1050 = int(_1062);
    }
    int _1064 = _1050;
    float _1066 = fma(_375, _882, _1056);
    float _1068 = fma(_1036, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1058);
    if (!_862)
    {
        int _1070 = 12 & _1054;
        _980 = _1070;
    }
    int _1072 = _980;
    float _1074 = fma(_381, _968, _1060);
    float _1076 = _747 * _828;
    float _1078 = _1068 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1080 = as_type<float>(_1072);
    if (!_862)
    {
        int _1082 = _1064 << 4;
        int _1084 = _1082 + _1072;
        _1080 = as_type<float>(_1084);
    }
    float _1086 = _1080;
    float _1088 = _1074 + _976;
    int _1090 = _807 + 80;
    uint _1092 = uint(int(uint(_1090) >> uint(2)));
    uint _1094 = uint(int(uint(int(_1092)) >> uint(2)));
    int _1096 = int(_1092) & 3;
    float _1098 = (*spvDescriptorSet0.vp_c15)._m0[int(_1094)][_1096];
    int _1100 = int(_1092) + 1;
    uint _1102 = uint(int(uint(_1100) >> uint(2)));
    int _1104 = _1100 & 3;
    float _1106 = (*spvDescriptorSet0.vp_c15)._m0[int(_1102)][_1104];
    float _1108 = fma(_375, _820, _1076);
    float _1110 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1112 = 1.0 / _1088;
    float _1114 = _1078 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1116 = fma(_381, _846, _1108);
    float _1118 = _1032 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1120 = _1032 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1122 = _1086;
    if (!_862)
    {
        int _1124 = as_type<int>(_1086) + 400;
        uint _1126 = uint(int(uint(_1124) >> uint(2)));
        uint _1128 = uint(int(uint(int(_1126)) >> uint(2)));
        int _1130 = int(_1126) & 3;
        float _1132 = (*spvDescriptorSet0.vp_c15)._m0[int(_1128)][_1130];
        _1122 = _1132;
    }
    float _1134 = _1122;
    float _1136 = _1116 + _854;
    float _1138 = -_1114;
    float _1140 = fma(_1138, _1110, 1.0);
    float _1142 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1118);
    float _1144 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1120);
    float _1146 = fma(_381, _906, _1066);
    float _1148 = _1032 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1150 = fma(_1036, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1142);
    int _1152 = _807 + 88;
    uint _1154 = uint(int(uint(_1152) >> uint(2)));
    uint _1156 = uint(int(uint(int(_1154)) >> uint(2)));
    int _1158 = int(_1154) & 3;
    float _1160 = (*spvDescriptorSet0.vp_c15)._m0[int(_1156)][_1158];
    int _1162 = int(_1154) + 1;
    uint _1164 = uint(int(uint(_1162) >> uint(2)));
    int _1166 = _1162 & 3;
    float _1168 = (*spvDescriptorSet0.vp_c15)._m0[int(_1164)][_1166];
    float _1170 = fma(_1036, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1144);
    float _1172 = _1146 + _914;
    float _1174 = _1136 * _1112;
    float _1176 = _1150 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1178 = _1170 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1180 = _1172 * _1112;
    float _1182 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1148);
    bool _1184 = _1174 >= 0.0;
    float _1186 = _1178 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1188 = log2(_1140);
    float _1190 = fma(_1036, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1182);
    bool _1192 = _1174 <= 1.0;
    bool _1194 = _1192 && _1184;
    float _1196 = fma(_1176, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1186);
    float _1198 = _1178 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1200 = _1190 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    bool _1202 = _1180 >= 0.0;
    bool _1204 = _1202 && _1194;
    float _1206 = fma(_1078, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1196);
    float _1208 = _1140;
    if (!_862)
    {
        float _1210 = floor(_769);
        _1208 = _1210;
    }
    float _1212 = _1208;
    bool _1214 = _1180 <= 1.0;
    bool _1216 = _1214 && _1204;
    float _1218 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1206);
    float _1220 = fma(_1176, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1198);
    float _1222 = _1042;
    if (!_862)
    {
        float _1224 = floor(_763);
        _1222 = _1224;
    }
    float _1226 = _1222;
    float _1228 = fma(_1078, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1220);
    float _1230 = _1188 * 0.693147182464599609375;
    float _1232 = _747 * _1106;
    float _1234 = _1178 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1236 = 1.0 / _1218;
    float _1238 = _1228;
    if (_1216)
    {
        float _1240 = float(_799);
        _924 = _1240;
    }
    float _1242 = _924;
    float _1244 = fma(_375, _1098, _1232);
    float _1246 = fma(_1176, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1234);
    float _1248 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1228);
    float _1250 = 0.0;
    float _1252 = _1212;
    float _1254 = _1248;
    if (!_862)
    {
        float _1256 = -_1212;
        float _1258 = _769 + _1256;
        _1250 = _1258;
    }
    float _1260 = _1250;
    float _1262 = fma(_1078, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1246);
    float _1264 = _1134;
    if (!_862)
    {
        float _1266 = rint(_1134);
        float _1268 = precise::max(_1266, 0.0);
        uint _1270 = uint(_1268);
        uint _1272 = clamp(_1270, 0u, 65535u);
        _1264 = as_type<float>(_1272);
    }
    float _1274 = _1264;
    if (!_862)
    {
        float _1276 = -_1226;
        float _1278 = _763 + _1276;
        _1252 = _1278;
    }
    float _1280 = _1252;
    float _1282 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1262);
    float _1284 = fma(_381, _1160, _1244);
    float _1286 = _1244;
    if (_1216)
    {
        float _1288 = rint(_1242);
        float _1290 = precise::max(_1288, 0.0);
        uint _1292 = uint(_1290);
        uint _1294 = clamp(_1292, 0u, 65535u);
        _1286 = as_type<float>(_1294);
    }
    float _1296 = _1286;
    float _1298 = _1248 * _1236;
    float _1300 = _1284 + _1168;
    float _1302 = _1282 * _1236;
    float _1304 = fma(_1298, -0.5, 0.5);
    float _1306 = _1300 * _1112;
    float _1308 = fma(_1302, 0.5, 0.5);
    float _1310 = _1230 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1312 = _1280;
    float _1314 = _1310;
    float _1316 = _1274;
    if (!_862)
    {
        float3 _4396 = float3(_1280, _1260, float(as_type<int>(_1274)));
        float3 _4400 = select(_4396, float3(0.0), isnan(_4396));
        float _1318 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4400.xy, uint(rint(_4400.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4400.xy, uint(rint(_4400.z)), level(0.0)).x;
        _1312 = _1318;
    }
    float _1320 = _1312;
    float _1322 = _1180;
    if (_1216)
    {
        float3 _4415 = float3(_1174, _1180, float(as_type<int>(_1296)));
        float3 _4417 = select(_4415, float3(0.0), isnan(_4415));
        float _1324 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _4417.xy, uint(rint(_4417.z)), _1306, level(0.0));
        _1322 = _1324;
    }
    float _1326 = _1322;
    float3 _4427 = float3(_1308, _1304, _1310);
    float _1328 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4427, float3(0.0), isnan(_4427)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4427, float3(0.0), isnan(_4427)), level(0.0)).x;
    float3 _4436 = float3(_1308, _1304, _1310);
    float4 _1331 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4436, float3(0.0), isnan(_4436)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4436, float3(0.0), isnan(_4436)), level(0.0)).xyzw;
    float _1333 = _1331.x;
    float _1335 = _1331.y;
    float _1337 = _1331.z;
    float _1339 = _1331.w;
    bool _1341 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1343 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1345 = _1341 || _1343;
    bool _1347 = isnan(0.5);
    bool _1349 = _1345 || _1347;
    float _1351 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    if (_1349)
    {
        _1351 = 1.0;
    }
    float _1353 = _1351;
    float _1355 = _1353;
    if (_1349)
    {
        _1238 = 1.0;
    }
    float _1357 = _1238;
    float _1359 = _1357;
    float _1361 = _1326;
    if (!_1349)
    {
        float _1363 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1365 = _1363 * 0.15915493667125701904296875;
        float _1367 = _1365 * 6.283185482025146484375;
        float _1369 = cos(_1367);
        float _1371 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1373 = _1371 * 0.15915493667125701904296875;
        float _1375 = _1365 * 6.283185482025146484375;
        float _1377 = sin(_1375);
        float _1379 = 1.0 / _1369;
        float _1381 = _1373 * 6.283185482025146484375;
        float _1383 = cos(_1381);
        float _1385 = _1377 * _1379;
        float _1387 = _1373 * 6.283185482025146484375;
        float _1389 = sin(_1387);
        float _1391 = _1383 * _1385;
        float _1393 = 1.0 / _1391;
        float _1395 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1397 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1395;
        float _1399 = 1.0 / _1397;
        float _1401 = _1389 * _1393;
        float _1403 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1405 = fma(_767, _1401, _1403);
        float _1407 = _1405 * _1399;
        float _1409 = precise::clamp(_1407, 0.0, 1.0);
        _1314 = _1379;
        _1316 = _1399;
        _1359 = _1409;
    }
    float _1411 = _1314;
    float _1413 = _1316;
    float _1415 = _1359;
    float _1417 = _1411;
    float _1419 = _1413;
    if (!_1349)
    {
        float _1421 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1423 = _1421 * 0.15915493667125701904296875;
        float _1425 = _1423 * 6.283185482025146484375;
        float _1427 = cos(_1425);
        float _1429 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1431 = _1429 * 0.15915493667125701904296875;
        float _1433 = _1423 * 6.283185482025146484375;
        float _1435 = sin(_1433);
        float _1437 = 1.0 / _1427;
        float _1439 = _1431 * 6.283185482025146484375;
        float _1441 = cos(_1439);
        float _1443 = _1435 * _1437;
        float _1445 = _1431 * 6.283185482025146484375;
        float _1447 = sin(_1445);
        float _1449 = _1441 * _1443;
        float _1451 = 1.0 / _1449;
        float _1453 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1455 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1453;
        float _1457 = 1.0 / _1455;
        float _1459 = _1447 * _1451;
        float _1461 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1463 = fma(_767, _1459, _1461);
        float _1465 = _1463 * _1457;
        float _1467 = precise::clamp(_1465, 0.0, 1.0);
        float _1469 = -_1467;
        float _1471 = _1469 + 1.0;
        _1417 = _1459;
        _1419 = _1431;
        _1355 = _1471;
    }
    float _1473 = _1417;
    float _1475 = _1419;
    float _1477 = _1355;
    float _1479 = _1475;
    float _1481 = _1473;
    if (_862)
    {
        _1479 = 1.0;
    }
    float _1483 = _1479;
    float _1485 = _1483;
    if (!_862)
    {
        int _1487 = _930 << 4;
        int _1489 = _1487 + 2048;
        uint _1491 = uint(int(uint(_1489) >> uint(2)));
        uint _1493 = uint(int(uint(int(_1491)) >> uint(2)));
        int _1495 = int(_1491) & 3;
        float _1497 = (*spvDescriptorSet0.vp_c15)._m0[int(_1493)][_1495];
        int _1499 = int(_1491) + 1;
        uint _1501 = uint(int(uint(_1499) >> uint(2)));
        int _1503 = _1499 & 3;
        float _1505 = (*spvDescriptorSet0.vp_c15)._m0[int(_1501)][_1503];
        int _1507 = _1489 + 8;
        uint _1509 = uint(int(uint(_1507) >> uint(2)));
        uint _1511 = uint(int(uint(int(_1509)) >> uint(2)));
        int _1513 = int(_1509) & 3;
        float _1515 = (*spvDescriptorSet0.vp_c15)._m0[int(_1511)][_1513];
        int _1517 = int(_1509) + 1;
        uint _1519 = uint(int(uint(_1517) >> uint(2)));
        int _1521 = _1517 & 3;
        float _1523 = (*spvDescriptorSet0.vp_c15)._m0[int(_1519)][_1521];
        float _1525 = _747 * _1505;
        float _1527 = fma(_375, _1497, _1525);
        float _1529 = fma(_381, _1515, _1527);
        float _1531 = _1529 + _1523;
        float _1533 = precise::clamp(_1531, 0.0, 1.0);
        float _1535 = -_1533;
        float _1537 = _1535 + _1320;
        float _1539 = fma(_1537, 500.0, 1.5);
        float _1541 = exp2(_1539);
        float _1543 = 0.0 + _1541;
        float _1545 = precise::clamp(_1543, 0.0, 1.0);
        _1485 = _1545;
    }
    float _1547 = _1485;
    float _1549 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1551 = _1032 + _1549;
    float _1553 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1555 = _1034 + _1553;
    float _1557 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1559 = _1036 + _1557;
    float _1561 = _1551 * _1551;
    float _1563 = fma(_1555, _1555, _1561);
    float _1565 = fma(_1559, _1559, _1563);
    float _1567 = rsqrt(_1565);
    float _1569 = _1567 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1571 = _1555 * _1569;
    float _1573 = _1559 * _1569;
    float _1575 = _1571 * _1571;
    float _1577 = _1573 * _1573;
    float _1579 = _1575 + _1577;
    float _1581 = sqrt(_1579);
    bool _1583 = _1581 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1585 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1587 = _1581 + _1585;
    float _1589 = _1559;
    float _1591 = _1561;
    float _1593 = _1587;
    float _1595 = _1569;
    if (_1583)
    {
        float _1597 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1589 = _1597;
    }
    float _1599 = _1589;
    if (_1583)
    {
        float _1601 = rsqrt(_1579);
        _1591 = _1601;
    }
    float _1603 = _1591;
    float _1605 = _1603;
    if (_1583)
    {
        float _1607 = _1587 * _1599;
        _1593 = _1607;
    }
    float _1609 = _1593;
    if (_1583)
    {
        float _1611 = _1609 * 0.15915493667125701904296875;
        _1481 = _1611;
    }
    float _1613 = _1481;
    float _1615 = _1567;
    if (_1583)
    {
        float _1617 = _1613 * 6.283185482025146484375;
        float _1619 = sin(_1617);
        _1615 = _1619;
    }
    float _1621 = _1615;
    float _1623 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1625 = precise::max(0.0, _1623);
    float _1627 = _1320;
    float _1629 = _1625;
    float _1631 = _1621;
    float _1633 = _1623;
    if (_1583)
    {
        float _1635 = _1613 * 6.283185482025146484375;
        float _1637 = cos(_1635);
        _1627 = _1637;
    }
    float _1639 = _1627;
    float _1641 = -_1569;
    float _1643 = -_1625;
    float _1645 = fma(_1551, _1641, _1643);
    float _1647 = _1645;
    if (_1583)
    {
        float _1649 = _1645 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1629 = _1649;
    }
    float _1651 = _1629;
    float _1653 = _1651;
    if (_1583)
    {
        float _1655 = fma(_1621, _1651, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1631 = _1655;
    }
    float _1657 = _1631;
    float _1659 = _1657;
    if (!_1583)
    {
        _1653 = _1573;
    }
    float _1661 = _1653;
    float _1663 = _1661;
    float _1665 = _1639;
    if (_1583)
    {
        float _1667 = _1639 + (-1.0);
        _1633 = _1667;
    }
    float _1669 = _1633;
    float _1671 = 0.0;
    if (_1583)
    {
        float _1673 = _1603 * _1657;
        _1671 = _1673;
    }
    float _1675 = _1671;
    if (!_1583)
    {
        _1659 = _1571;
    }
    float _1677 = _1659;
    float _1679 = _1677;
    if (_1583)
    {
        float _1681 = _1669 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1595 = _1681;
    }
    float _1683 = _1595;
    if (_1583)
    {
        float _1685 = _1571 * _1675;
        _1679 = _1685;
    }
    float _1687 = _1679;
    if (!_1583)
    {
        _1605 = _1575;
    }
    float _1689 = _1605;
    float _1691 = _1689;
    if (_1583)
    {
        float _1693 = _1573 * _1675;
        _1663 = _1693;
    }
    float _1695 = _1663;
    if (_1583)
    {
        float _1697 = fma(_1645, _1639, _1683);
        _1647 = _1697;
    }
    float _1699 = _1647;
    if (_1583)
    {
        float _1701 = _1687 * _1687;
        _1691 = _1701;
    }
    float _1703 = _1691;
    if (!_1583)
    {
        _1665 = _1577;
    }
    float _1705 = _1665;
    float _1707 = _1705;
    if (_1583)
    {
        float _1709 = _1695 * _1695;
        _1707 = _1709;
    }
    float _1711 = _1707;
    float _1713 = sqrt(_1565);
    float _1715 = fma(_1699, _1699, _1703);
    float _1717 = _1715 + _1711;
    float _1719 = rsqrt(_1717);
    float _1721 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1723 = fma(_1713, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1721);
    float _1725 = precise::clamp(_1723, 0.0, 1.0);
    float _1727 = -_1725;
    float _1729 = _1727 + 1.0;
    float _1731 = _1719 * _1699;
    float _1733 = _1719 * _1687;
    float _1735 = abs(_1729);
    float _1737 = log2(_1735);
    float _1739 = _1719 * _1695;
    float _1741 = _1733 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1743 = -_1741;
    float _1745 = fma(_1731, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1743);
    float _1747 = -_1739;
    float _1749 = fma(_1747, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1745);
    float _1751 = fma(_1749, -0.5, 0.5);
    float _1753 = _1737 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1755 = fma(_1749, 0.5, 0.5);
    float _1757 = sqrt(_1751);
    float _1759 = fma(_1755, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1761 = fma(_1755, _1759, -0.212114393711090087890625);
    float _1763 = _1731 + 1.0;
    float _1765 = exp2(_1753);
    float _1767 = fma(_1755, _1761, 1.570728778839111328125);
    float _1769 = _1757 * 0.636619746685028076171875;
    float _1771 = -_1767;
    float _1773 = fma(_1769, _1771, 1.0);
    float _1775 = -_1731;
    float _1777 = fma(_1765, _1763, _1775);
    float _1779 = fma(_1777, 0.5, 0.5);
    float2 _5084 = float2(_1773, _1779);
    float3 _1783 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5084, float2(0.0), isnan(_5084)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5084, float2(0.0), isnan(_5084)), level(0.0)).xyz;
    float _1785 = _1783.x;
    float _1787 = _1783.y;
    float _1789 = _1783.z;
    float _1791 = abs(_767);
    float _1793 = log2(_1791);
    float _1795 = _1178 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1797 = _1737 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1799 = -_703;
    float _1801 = _1799 + 1.0;
    float _1803 = fma(_1176, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1795);
    bool _1805 = _1713 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1807 = isnan(_1713);
    bool _1809 = _1805 || _1807;
    bool _1811 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1813 = _1809 || _1811;
    float _1815 = fma(_1078, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1803);
    float _1817 = exp2(_1797);
    bool _1819 = _767 <= 8000.0;
    bool _1821 = isnan(_767);
    bool _1823 = _1819 || _1821;
    bool _1825 = isnan(8000.0);
    bool _1827 = _1823 || _1825;
    float _1829 = float(_1827);
    float _1831 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1815);
    float _1833 = _1793 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1835 = _1831 + _1218;
    out.gl_Position.x = _1282;
    out.gl_Position.y = _1248;
    out.gl_Position.z = _1831;
    out.gl_Position.w = _1218;
    float _1837 = _1835 * 0.5;
    float _1839 = exp2(_1833);
    out.m_78.z = _1837;
    out.m_78.w = _1218;
    float _1841 = -_1817;
    float _1843 = _1841 + 1.0;
    float _1845 = _1817;
    if (!_1216)
    {
        _1254 = 1.0;
    }
    float _1847 = _1254;
    float _1849 = _1847;
    if (_1216)
    {
        bool _1851 = _1326 >= _1306;
        bool _1853 = isnan(_1326);
        bool _1855 = _1851 || _1853;
        bool _1857 = isnan(_1306);
        bool _1859 = _1855 || _1857;
        float _1861 = float(_1859);
        _1849 = _1861;
    }
    float _1863 = _1849;
    float _1865 = _1843 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    if (!_1813)
    {
        _1845 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1867 = _1845;
    float _1869 = fma(_1839, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1871 = precise::clamp(_1869, 0.0, 1.0);
    float _1873 = _1867;
    float _1875 = _1867;
    if (!_1813)
    {
        _1361 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1877 = _1361;
    float _1879 = _1865 * _1328;
    float _1881 = _1863 * _1547;
    float _1883 = fma(_1871, -2.0, 3.0);
    float _1885 = _1871 * _1871;
    float _1887 = _1339 * _1879;
    float _1889 = -_1865;
    float _1891 = _1889 + 1.0;
    float _1893 = _1885 * _1883;
    float _1895 = -_1893;
    float _1897 = _1895 + 1.0;
    float _1899 = fma(_1897, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1893);
    float _1901 = _1829 * _1899;
    float _1903 = _1901 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1905 = _1801 * _1903;
    float _1907 = precise::clamp(_1905, 0.0, 1.0);
    float _1909 = _1903;
    float _1911 = _1887;
    float _1913 = _1877;
    float _1915 = _1877;
    if (!_1813)
    {
        _1909 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1917 = _1909;
    float _1919 = -_1907;
    float _1921 = fma(_1919, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1923 = -_1881;
    float _1925 = fma(_1923, _1921, 1.0);
    float _1927 = precise::clamp(_1925, 0.0, 1.0);
    float _1929 = _1927 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1931 = _1927;
    float _1933 = _1917;
    float _1935 = _1917;
    if (!_1813)
    {
        _1931 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1937 = _1931;
    out.m_80.x = _1929;
    float _1939 = _1789 * _1879;
    float _1941 = fma(_1785, _1887, _1333);
    float _1943 = fma(_1787, _1887, _1335);
    float _1945 = _1339 * _1891;
    float _1947 = fma(_1339, _1939, _1337);
    float _1949 = _1415 * _1477;
    float _1951 = _1949;
    float _1953 = _1937;
    float _1955 = _1937;
    if (!_1813)
    {
        _1911 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1957 = _1911;
    out.m_82.x = _1941;
    out.m_82.y = _1943;
    out.m_82.z = _1947;
    out.m_82.w = _1945;
    float _1959 = _1949 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1961 = _1957;
    float _1963 = _1957;
    if (!_1813)
    {
        _1951 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1965 = _1951;
    bool _1967 = !_1813;
    float _1969 = _1965;
    float _1971 = _1965;
    if (!_1967)
    {
        bool _1973 = _1713 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1975 = isnan(_1713);
        bool _1977 = _1973 || _1975;
        bool _1979 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1981 = _1977 || _1979;
        if (!_1981)
        {
            float _1983 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1985 = _1713 + _1983;
            float _1987 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1989 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1987;
            float _1991 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1993 = _1991 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1995 = 1.0 / _1989;
            float _1997 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1999 = _1997 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2001 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2003 = _2001 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2005 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2007 = _2005 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2009 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2011 = _2009 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2013 = _1985 * _1995;
            float _2015 = precise::clamp(_2013, 0.0, 1.0);
            float _2017 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2019 = _2017 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2021 = fma(_2015, _1993, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2023 = fma(_2015, _2019, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2025 = fma(_2015, _1999, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2027 = fma(_2015, _2003, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2029 = fma(_2015, _2007, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2031 = fma(_2015, _2011, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1915 = _2025;
            _1955 = _2029;
            _1875 = _2021;
            _1963 = _2027;
            _1935 = _2023;
            _1971 = _2031;
            _2033 = true;
        }
        else
        {
            bool _2035 = _1713 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2037 = isnan(_1713);
            bool _2039 = _2035 || _2037;
            bool _2041 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2043 = _2039 || _2041;
            if (!_2043)
            {
                _1873 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2045 = _1873;
            _1875 = _2045;
            if (!_2043)
            {
                _1913 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2047 = _1913;
            _1915 = _2047;
            if (!_2043)
            {
                _1933 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2049 = _1933;
            _1935 = _2049;
            if (!_2043)
            {
                _1961 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2051 = _1961;
            _1963 = _2051;
            if (!_2043)
            {
                _1953 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2053 = _1953;
            _1955 = _2053;
            if (!_2043)
            {
                _1969 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2055 = _1969;
            bool _2057 = !_2043;
            _1971 = _2055;
            if (!_2057)
            {
                bool _2059 = _1713 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2061 = isnan(_1713);
                bool _2063 = _2059 || _2061;
                bool _2065 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2067 = _2063 || _2065;
                if (!_2067)
                {
                    float _2069 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2071 = _1713 + _2069;
                    float _2073 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2075 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2073;
                    float _2077 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2079 = _2077 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2081 = 1.0 / _2075;
                    float _2083 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2085 = _2083 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2087 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2089 = _2087 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2091 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2093 = _2091 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2095 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2097 = _2095 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2099 = _2071 * _2081;
                    float _2101 = precise::clamp(_2099, 0.0, 1.0);
                    float _2103 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2105 = _2103 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2107 = fma(_2101, _2079, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2109 = fma(_2101, _2105, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2111 = fma(_2101, _2085, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2113 = fma(_2101, _2089, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2115 = fma(_2101, _2093, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2117 = fma(_2101, _2097, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1915 = _2111;
                    _1955 = _2115;
                    _1875 = _2107;
                    _1963 = _2113;
                    _1935 = _2109;
                    _1971 = _2117;
                    _2033 = true;
                }
                else
                {
                    _1915 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1955 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1875 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1963 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1935 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1971 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2033 = false;
    float _2119 = _1915;
    float _2121 = _1955;
    float _2123 = _1875;
    float _2125 = _1963;
    float _2127 = _1935;
    float _2129 = _1971;
    float _2131 = fma(_607, -0.5, 0.5);
    float _2133 = precise::clamp(_2131, 0.0, 1.0);
    float _2135 = -_2119;
    float _2137 = _2135 + _2121;
    float _2139 = _1959 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2141 = -_2123;
    float _2143 = _2141 + _2125;
    float _2145 = fma(_2133, _2137, _2119);
    out.m_84.x = 0.0;
    float _2147 = -_2127;
    float _2149 = _2147 + _2129;
    float _2151 = fma(_2133, _2143, _2123);
    float _2153 = _2145 * 0.586610972881317138671875;
    out.m_61.x = _2139;
    bool _2155 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2157 = fma(_2133, _2149, _2127);
    float _2159 = fma(_2151, 0.298911988735198974609375, _2153);
    bool _2161 = _1415 > 0.0;
    bool _2163 = isnan(_1415);
    bool _2165 = _2161 || _2163;
    bool _2167 = isnan(0.0);
    bool _2169 = _2165 || _2167;
    float _2171 = fma(_2157, 0.114477999508380889892578125, _2159);
    bool _2173 = _1477 <= 0.0;
    bool _2175 = !_2169;
    bool _2177 = _2173 || _2175;
    float _2179 = -_2171;
    float _2181 = _2151 + _2179;
    float _2183 = -_2171;
    float _2185 = _2145 + _2183;
    float _2187 = -_2171;
    float _2189 = _2157 + _2187;
    float _2191 = fma(_2181, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2171);
    float _2193 = fma(_2185, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2171);
    float _2195 = fma(_2189, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2171);
    bool _2197 = !_2155;
    if (!_2197)
    {
        float _2199 = -_1032;
        float _2201 = _2199 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2203 = -_1034;
        float _2205 = _2203 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2207 = -_1036;
        float _2209 = _2207 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2211 = _2201 * _2201;
        float _2213 = fma(_2205, _2205, _2211);
        float _2215 = fma(_2209, _2209, _2213);
        float _2217 = sqrt(_2215);
        float _2219 = rsqrt(_2215);
        float _2221 = -_2217;
        float _2223 = _2221 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2225 = _2223 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2227 = precise::clamp(_2225, 0.0, 1.0);
        float _2229 = _2205 * _2219;
        float _2231 = _2201 * _2219;
        float _2233 = abs(_2227);
        float _2235 = log2(_2233);
        float _2237 = _2209 * _2219;
        float _2239 = _2229 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2241 = _607 * _2231;
        float _2243 = -_2231;
        float _2245 = -_2239;
        float _2247 = fma(_2243, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2245);
        float _2249 = fma(_605, _2229, _2241);
        float _2251 = -_2237;
        float _2253 = fma(_2251, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2247);
        float _2255 = fma(_609, _2237, _2249);
        float _2257 = precise::clamp(_2255, 0.0, 1.0);
        float _2259 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2261 = _2253 + _2259;
        float _2263 = _2235 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2265 = _2261 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2267 = precise::clamp(_2265, 0.0, 1.0);
        float _2269 = exp2(_2263);
        float _2271 = _2269 * _2267;
        float _2273 = _2257 * _2271;
        float _2275 = _2273 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2277 = _2273 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2279 = _2273 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_84.x = _2275;
        out.m_84.y = _2277;
        out.m_84.z = _2279;
    }
    out.m_86.x = _2191;
    out.m_86.y = _2193;
    out.m_86.z = _2195;
    if (!_2177)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_61.x = 0.0;
    float _2281 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2281;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

