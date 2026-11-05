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
    float4 m_76 [[user(locn1)]];
    float4 m_78 [[user(locn2)]];
    float4 m_86 [[user(locn3)]];
    float4 m_94 [[user(locn4)]];
    float4 m_61 [[user(locn5)]];
    float4 m_80 [[user(locn6)]];
    float4 m_82 [[user(locn7)]];
    float4 m_84 [[user(locn8)]];
    float4 m_72 [[user(locn9)]];
    float4 m_92 [[user(locn10)]];
    float4 m_88 [[user(locn11)]];
    float4 m_90 [[user(locn12)]];
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
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2131 = false;
    bool _759 = false;
    bool _189 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _108 = in.m_58.w;
    float _110 = trunc(_108);
    int _113 = int(_110);
    bool _117 = _113 >= 1;
    float _119 = 0.0;
    if (!_117)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _119;
    float _123 = _121;
    if (!_117)
    {
        out.m_61.x = 0.0;
    }
    int _125 = 0;
    if (!_117)
    {
        float _127 = _121 * 5.0;
        _125 = as_type<int>(_127);
    }
    int _129 = _125;
    int _131 = _129;
    if (!_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2436 = as_type<float>(_129);
        out.gl_Position.z = _2436;
    }
    if (!_117)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _133 = in.m_63.w;
    bool _135 = _133 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = isnan(_133);
    bool _139 = _135 || _137;
    bool _141 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _143 = _139 || _141;
    float _145 = -_133;
    float _147 = _145 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _149 = 0.0;
    if (_143)
    {
        float _151 = float(_113);
        _149 = _151;
    }
    float _153 = _149;
    bool _155 = _147 >= _153;
    bool _157 = !_143;
    bool _159 = _155 || _157;
    if (_159)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _123;
    if (_159)
    {
        out.m_61.x = 0.0;
    }
    if (_159)
    {
        float _163 = _161 * 5.0;
        _131 = as_type<int>(_163);
    }
    int _165 = _131;
    if (_159)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2504 = as_type<float>(_165);
        out.gl_Position.z = _2504;
    }
    if (_159)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _167 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _169 = !_167;
    float _187;
    if (!_169)
    {
        float _171 = in.m_65.x;
        float _173 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _175 = _171 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _177 = fma(_175, (*spvDescriptorSet0.vp_c9)._m0[12].x, _147);
        float _179 = _177 * _173;
        float _181 = floor(_179);
        float _183 = -_181;
        float _185 = _179 + _183;
        _187 = _185;
        _189 = true;
    }
    else
    {
        float _191 = float(_113);
        float _193 = 1.0 / _191;
        float _195 = _147 * _193;
        _187 = _195;
    }
    _189 = false;
    float _197 = _187;
    float _199 = as_type<float>(int(gl_VertexIndex));
    float _201 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _203 = _197 + _201;
    float _205 = in.m_65.x;
    float _207 = in.m_65.y;
    float _209 = in.m_65.z;
    float _211 = in.m_65.w;
    float _213 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _215 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _213;
    float _217 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _219 = 1.0 / _215;
    float _221 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _217);
    bool _223 = _197 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _225 = isnan(_197);
    bool _227 = _223 || _225;
    bool _229 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _231 = _227 || _229;
    float _233 = float(_231);
    bool _235 = _197 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _237 = isnan(_197);
    bool _239 = _235 || _237;
    bool _241 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _243 = _239 || _241;
    float _245 = float(_243);
    float _247 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _221);
    float _249 = -_233;
    float _251 = _249 + 1.0;
    float _253 = sqrt(_247);
    float _255 = _245 * _251;
    int _257 = as_type<int>(_199) & 1;
    bool _259 = _257 != 0;
    int _261 = as_type<int>(_199) & 2;
    bool _263 = _261 != 0;
    float _265 = -_245;
    float _267 = _265 + 1.0;
    float _269 = in.m_58.x;
    float _271 = in.m_58.y;
    float _273 = in.m_58.z;
    float _275 = _203 * _219;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _279 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _277;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _283 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _281;
    float _285 = rsqrt(_247);
    float _287 = in.m_70.x;
    float _289 = in.m_70.y;
    float _291 = fma(_279, _275, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _293 = fma(_283, _275, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _295 = _291 * _255;
    float _297 = precise::max(_253, 2.0);
    float _299 = _293 * _255;
    bool _301 = !_263;
    float _303 = _301 ? (-0.5) : 0.5;
    float _305 = fma(_267, (*spvDescriptorSet0.vp_c9)._m0[143].x, _295);
    bool _307 = !_259;
    float _309 = _307 ? (-0.5) : 0.5;
    float _311 = fma(_267, (*spvDescriptorSet0.vp_c9)._m0[143].y, _299);
    float _313 = precise::min(_297, 15.0);
    float _315 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[144].x, _305);
    bool _317 = _205 > 0.5;
    float _319 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[144].y, _311);
    bool _321 = _209 > 0.5;
    float _323 = fma(_313, 0.061538465321063995361328125, -0.12307693064212799072265625);
    float _325 = -_271;
    float _327 = _303 + _325;
    float _329 = -_269;
    float _331 = _309 + _329;
    float _333 = -_285;
    float _335 = fma(_333, _273, _273);
    float _337 = _271 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _339 = -_327;
    float _341 = fma(_327, _285, _339);
    float _343 = -_331;
    float _345 = fma(_331, _285, _343);
    float _347 = _319 * _289;
    float _349 = _315 * _287;
    float _351 = fma(_323, _341, _327);
    float _353 = fma(_323, _345, _331);
    float _355 = _347 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _357 = _349 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _359 = _351 + _271;
    float _361 = _353 + _269;
    float _363 = _323 * _335;
    float _365 = fma(_269, (*spvDescriptorSet0.vp_c10)._m0[4].x, _337);
    float _367 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _359);
    float _369 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _361);
    float _371 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _363);
    float _373 = fma(_273, (*spvDescriptorSet0.vp_c10)._m0[4].z, _365);
    float _375 = _355 * _367;
    float _377 = _357 * _369;
    float _379 = _271 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _381 = _375 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _383 = _375 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _385 = fma(_269, (*spvDescriptorSet0.vp_c10)._m0[6].x, _379);
    float _387 = _271 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _389 = fma(_377, (*spvDescriptorSet0.vp_c8)._m0[24].x, _381);
    float _391 = fma(_377, (*spvDescriptorSet0.vp_c8)._m0[26].x, _383);
    float _393 = fma(_273, (*spvDescriptorSet0.vp_c10)._m0[6].z, _385);
    float _395 = _373 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _397 = fma(_371, (*spvDescriptorSet0.vp_c8)._m0[24].z, _389);
    float _399 = fma(_371, (*spvDescriptorSet0.vp_c8)._m0[26].z, _391);
    float _401 = _393 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _403 = _397 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _405 = _399 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _407 = _375 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _409 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _411 = _409 != 0;
    float _413 = _395 + _403;
    float _415 = _401 + _405;
    float _417 = fma(_269, (*spvDescriptorSet0.vp_c10)._m0[5].x, _387);
    float _419 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _421 = _413 + _419;
    float _423 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _425 = _415 + _423;
    float _427 = fma(_377, (*spvDescriptorSet0.vp_c8)._m0[25].x, _407);
    float _429 = _421 * _421;
    float _431 = _425 * _425;
    float _433 = -_309;
    float _435 = _317 ? _433 : _309;
    out.m_72.x = (*spvDescriptorSet0.vp_c8)._m0[24].x;
    out.m_72.y = (*spvDescriptorSet0.vp_c8)._m0[25].x;
    out.m_72.z = (*spvDescriptorSet0.vp_c8)._m0[26].x;
    bool _437 = _211 > 0.5;
    float _439 = _429 + _431;
    int _441 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _443 = _441 != 0;
    float _445 = fma(_273, (*spvDescriptorSet0.vp_c10)._m0[5].z, _417);
    int _447 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _449 = _447 != 0;
    float _451 = sqrt(_439);
    int _453 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _455 = _453 != 0;
    float _457 = fma(_371, (*spvDescriptorSet0.vp_c8)._m0[25].z, _427);
    bool _459 = _207 > 0.5;
    float _461 = _445 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _463 = -_309;
    int _465 = _321 ? as_type<int>(_463) : as_type<int>(_309);
    float _467 = _457 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _469 = !_411;
    float _471 = _469 ? _309 : _435;
    float _473 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _475 = -_303;
    int _477 = _459 ? as_type<int>(_475) : as_type<int>(_303);
    float _479 = _461 + _467;
    bool _481 = !_449;
    float _483 = _481 ? _309 : as_type<float>(_465);
    float _485 = _359 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _487 = -_303;
    int _489 = _437 ? as_type<int>(_487) : as_type<int>(_303);
    float _491 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _493 = _451 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _495 = fma(_363, (*spvDescriptorSet0.vp_c9)._m0[17].y, 1.0);
    bool _497 = !_443;
    float _499 = _497 ? _303 : as_type<float>(_477);
    bool _501 = !_455;
    float _503 = _501 ? _303 : as_type<float>(_489);
    float _505 = _485 * _485;
    float _507 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _509 = _467;
    float _511 = _413;
    float _513 = _377;
    float _515 = _435;
    float _517 = _415;
    if (!_493)
    {
        _509 = _413;
    }
    float _519 = _509;
    float _521 = _519;
    if (!_493)
    {
        _511 = _415;
    }
    float _523 = _511;
    float _525 = _523;
    if (!_493)
    {
        _513 = _431;
    }
    float _527 = _513;
    float _529 = _527;
    if (!_493)
    {
        _515 = _429;
    }
    float _531 = _515;
    float _533 = _531;
    if (!_493)
    {
        _517 = _479;
    }
    float _535 = _517;
    bool _537 = !_493;
    float _539 = _535;
    if (!_537)
    {
        float _541 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _543 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _545 = _451 + _543;
        float _547 = rsqrt(_439);
        float _549 = _545 * _541;
        float _551 = _479 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _553 = _549 * 0.15915493667125701904296875;
        float _555 = _553 * 6.283185482025146484375;
        float _557 = sin(_555);
        float _559 = _553 * 6.283185482025146484375;
        float _561 = cos(_559);
        float _563 = fma(_557, _551, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _565 = _547 * _563;
        float _567 = _561 + (-1.0);
        float _569 = fma(_421, _565, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _571 = fma(_425, _565, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _573 = _567 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _575 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _577 = _569 + _575;
        float _579 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _581 = _571 + _579;
        float _583 = fma(_479, _561, _573);
        float _585 = _577 * _577;
        float _587 = _581 * _581;
        _539 = _583;
        _533 = _585;
        _529 = _587;
        _521 = _569;
        _525 = _571;
    }
    float _589 = _539;
    float _591 = _533;
    float _593 = _529;
    float _595 = _521;
    float _597 = _525;
    float _599 = fma(_495, _495, _505);
    float _601 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _603 = _361 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _605 = _485 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _607 = _485 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _609 = _485 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _611 = _471 + 0.5;
    float _613 = _483 + 0.5;
    float _615 = fma(_603, (*spvDescriptorSet0.vp_c8)._m0[24].x, _605);
    float _617 = rsqrt(_599);
    float _619 = fma(_603, (*spvDescriptorSet0.vp_c8)._m0[25].x, _607);
    float _621 = fma(_603, (*spvDescriptorSet0.vp_c8)._m0[26].x, _609);
    float _623 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _625 = _589 + _623;
    float _627 = _611 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _629 = _613 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _631 = -_503;
    float _633 = _631 + 0.5;
    float _635 = -_499;
    float _637 = _635 + 0.5;
    float _639 = fma(_625, _625, _591);
    float _641 = _627 * _473;
    float _643 = _629 * _507;
    float _645 = _633 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _647 = _637 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _649 = _639 + _593;
    float _651 = _645 * _601;
    float _653 = _485 * _617;
    float _655 = _495 * _617;
    float _657 = sqrt(_649);
    float _659 = -(*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _661 = _653 * _659;
    float _663 = -(*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _665 = _653 * _663;
    float _667 = -(*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _669 = _653 * _667;
    float _671 = fma(_655, (*spvDescriptorSet0.vp_c8)._m0[24].y, _661);
    float _673 = fma(_655, (*spvDescriptorSet0.vp_c8)._m0[25].y, _665);
    float _675 = fma(_655, (*spvDescriptorSet0.vp_c8)._m0[26].y, _669);
    float _677 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _679 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _681 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _683 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _685 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _687 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _689 = fma(_495, (*spvDescriptorSet0.vp_c8)._m0[24].z, _615);
    float _691 = fma(_495, (*spvDescriptorSet0.vp_c8)._m0[25].z, _619);
    float _693 = _647 * _491;
    float _695 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _697 = _677 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _699 = _679 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _701 = _681 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _703 = _683 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _705 = _685 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _707 = _687 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _709 = fma(_495, (*spvDescriptorSet0.vp_c8)._m0[26].z, _621);
    out.m_74.x = _697;
    out.m_74.y = _699;
    out.m_74.z = _701;
    out.m_74.w = _695;
    bool _711 = _657 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _713 = isnan(_657);
    bool _715 = _711 || _713;
    bool _717 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _719 = _715 || _717;
    out.m_76.x = _703;
    out.m_76.y = _705;
    out.m_76.z = _707;
    out.m_78.x = _641;
    out.m_78.y = _693;
    out.m_78.z = _643;
    out.m_78.w = _651;
    out.m_80.x = _671;
    out.m_80.y = _673;
    out.m_80.z = _675;
    float _721 = 0.0;
    int _723 = as_type<int>(_597);
    if (!_719)
    {
        _721 = 1.0;
    }
    float _725 = _721;
    out.m_82.x = _689;
    out.m_82.y = _691;
    out.m_82.z = _709;
    bool _727 = !_719;
    float _729 = _725;
    if (!_727)
    {
        bool _731 = _657 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _733 = isnan(_657);
        bool _735 = _731 || _733;
        bool _737 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _739 = _735 || _737;
        if (!_739)
        {
            float _741 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _743 = _657 + _741;
            float _745 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _747 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _745;
            float _749 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _751 = _749 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _753 = 1.0 / _747;
            float _755 = _743 * _753;
            float _757 = fma(_755, _751, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _729 = _757;
            _759 = true;
        }
        else
        {
            bool _761 = _657 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _763 = isnan(_657);
            bool _765 = _761 || _763;
            bool _767 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _769 = _765 || _767;
            if (!_769)
            {
                float _771 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _773 = _657 + _771;
                float _775 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _777 = _775 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _779 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _781 = _779 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _783 = 1.0 / _777;
                float _785 = _773 * _783;
                float _787 = fma(_785, _781, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _729 = _787;
                _759 = true;
            }
            else
            {
                _729 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _759 = false;
    float _789 = _729;
    float _791 = fma(_395, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _793 = fma(_401, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _795 = floor(_791);
    float _797 = floor(_793);
    float _799 = -_795;
    float _801 = _791 + _799;
    float _803 = -_797;
    float _805 = _793 + _803;
    float2 _3637 = float2(_801, _805);
    float _807 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3637, float2(0.0), isnan(_3637)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3637, float2(0.0), isnan(_3637)), level(0.0)).x;
    float _809 = _461 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _811 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _813 = _595 + _811;
    float _815 = fma(_395, (*spvDescriptorSet0.vp_c8)._m0[11].x, _809);
    float _817 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _819 = _589 + _817;
    float _821 = fma(_813, _789, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _823 = fma(_401, (*spvDescriptorSet0.vp_c8)._m0[11].z, _815);
    float _825 = _461 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _827 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _829 = fma(_819, _789, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _831 = _823 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _833 = fma(_395, (*spvDescriptorSet0.vp_c8)._m0[10].x, _825);
    float _835 = _461 + _827;
    float _837 = 1.0 / _831;
    float _839 = fma(_401, (*spvDescriptorSet0.vp_c8)._m0[10].z, _833);
    float _841 = _835 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _843 = _835 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _845 = _839 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _847 = fma(_395, (*spvDescriptorSet0.vp_c15)._m0[126].x, _841);
    float _849 = fma(_395, (*spvDescriptorSet0.vp_c15)._m0[127].x, _843);
    float _851 = _845 + _831;
    float _853 = fma(_401, (*spvDescriptorSet0.vp_c15)._m0[126].z, _847);
    float _855 = fma(_401, (*spvDescriptorSet0.vp_c15)._m0[127].z, _849);
    float _857 = _853 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _859 = _855 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _861 = _851 * _837;
    float _863 = _861 * 0.5;
    float _865 = trunc(_859);
    int _867 = int(_865);
    float _869 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _871 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[30].w, _869);
    float _873 = 1.0 / _871;
    int _875 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _877 = _867 + _875;
    int _879 = _877 + 1;
    float _881 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _883 = _873 * _881;
    float _885 = trunc(_857);
    int _887 = int(_885);
    bool _889 = _883 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _891 = _883 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _893 = !_889;
    int _895 = _893 ? 0 : 1;
    int _897 = 2;
    int _899 = as_type<int>(_819);
    float _901 = as_type<float>(_879);
    int _903 = as_type<int>(_821);
    if (!_889)
    {
        _897 = 1;
    }
    int _905 = _897;
    int _907 = _905;
    if (!_891)
    {
        _907 = _895;
    }
    int _909 = _907;
    int _911 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _913 = _887 + _911;
    int _915 = _913 + 1;
    int _917 = _909 << 6;
    bool _919 = _915 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _921 = _917 + 48;
    uint _924 = uint(int(uint(_921) >> uint(2)));
    uint _926 = uint(int(uint(int(_924)) >> uint(2)));
    int _928 = int(_924) & 3;
    float _930 = (*spvDescriptorSet0.vp_c15)._m0[int(_926)][_928];
    int _932 = int(_924) + 1;
    uint _934 = uint(int(uint(_932) >> uint(2)));
    int _936 = _932 & 3;
    float _938 = (*spvDescriptorSet0.vp_c15)._m0[int(_934)][_936];
    int _940 = _915 | _879;
    bool _942 = _940 < 0;
    bool _944 = _942 || _919;
    int _946 = _917 + 56;
    uint _948 = uint(int(uint(_946) >> uint(2)));
    uint _950 = uint(int(uint(int(_948)) >> uint(2)));
    int _952 = int(_948) & 3;
    float _954 = (*spvDescriptorSet0.vp_c15)._m0[int(_950)][_952];
    int _956 = int(_948) + 1;
    uint _958 = uint(int(uint(_956) >> uint(2)));
    int _960 = _956 & 3;
    float _962 = (*spvDescriptorSet0.vp_c15)._m0[int(_958)][_960];
    bool _964 = _879 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _966 = _964 || _944;
    bool _968 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _970 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _972 = _968 || _970;
    bool _974 = isnan(0.5);
    bool _976 = _972 || _974;
    float _978 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _980 = _597 + _978;
    int _982 = _917 + 64;
    uint _984 = uint(int(uint(_982) >> uint(2)));
    uint _986 = uint(int(uint(int(_984)) >> uint(2)));
    int _988 = int(_984) & 3;
    float _990 = (*spvDescriptorSet0.vp_c15)._m0[int(_986)][_988];
    int _992 = int(_984) + 1;
    uint _994 = uint(int(uint(_992) >> uint(2)));
    int _996 = _992 & 3;
    float _998 = (*spvDescriptorSet0.vp_c15)._m0[int(_994)][_996];
    float _1000 = fma(_980, _789, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1002 = _980;
    float _1004 = as_type<float>(_915);
    float _1006 = as_type<float>(_909);
    if (!_966)
    {
        int _1008 = _879 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1010 = _1008 + _915;
        _899 = _1010;
    }
    int _1012 = _899;
    int _1014 = _917 + 72;
    uint _1016 = uint(int(uint(_1014) >> uint(2)));
    uint _1018 = uint(int(uint(int(_1016)) >> uint(2)));
    int _1020 = int(_1016) & 3;
    float _1022 = (*spvDescriptorSet0.vp_c15)._m0[int(_1018)][_1020];
    int _1024 = int(_1016) + 1;
    uint _1026 = uint(int(uint(_1024) >> uint(2)));
    int _1028 = _1024 & 3;
    float _1030 = (*spvDescriptorSet0.vp_c15)._m0[int(_1026)][_1028];
    float _1032 = as_type<float>(_1012);
    if (_976)
    {
        _1002 = _821;
    }
    float _1034 = _1002;
    float _1036 = _1034;
    if (_976)
    {
        _1004 = _829;
    }
    float _1038 = _1004;
    float _1040 = _1038;
    if (_976)
    {
        _901 = _1000;
    }
    float _1042 = _901;
    int _1044 = _917 + 96;
    uint _1046 = uint(int(uint(_1044) >> uint(2)));
    uint _1048 = uint(int(uint(int(_1046)) >> uint(2)));
    int _1050 = int(_1046) & 3;
    float _1052 = (*spvDescriptorSet0.vp_c15)._m0[int(_1048)][_1050];
    int _1054 = int(_1046) + 1;
    uint _1056 = uint(int(uint(_1054) >> uint(2)));
    int _1058 = _1054 & 3;
    float _1060 = (*spvDescriptorSet0.vp_c15)._m0[int(_1056)][_1058];
    int _1062 = _917 + 104;
    uint _1064 = uint(int(uint(_1062) >> uint(2)));
    uint _1066 = uint(int(uint(int(_1064)) >> uint(2)));
    int _1068 = int(_1064) & 3;
    float _1070 = (*spvDescriptorSet0.vp_c15)._m0[int(_1066)][_1068];
    int _1072 = int(_1064) + 1;
    uint _1074 = uint(int(uint(_1072) >> uint(2)));
    int _1076 = _1072 & 3;
    float _1078 = (*spvDescriptorSet0.vp_c15)._m0[int(_1074)][_1076];
    float _1080 = _1042;
    int _1082 = as_type<int>(_1060);
    if (!_976)
    {
        float _1084 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1086 = _461 + _1084;
        float _1088 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1090 = _395 + _1088;
        float _1092 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1094 = _1086 * _1086;
        float _1096 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1098 = _401 + _1096;
        float _1100 = fma(_1090, _1090, _1094);
        float _1102 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1104 = fma(_1098, _1098, _1100);
        float _1106 = sqrt(_1104);
        float _1108 = _1092 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1110 = -_461;
        float _1112 = _1110 + _829;
        float _1114 = precise::min(_1106, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1116 = _1114 * _1102;
        float _1118 = -_401;
        float _1120 = _1118 + _1000;
        float _1122 = _1108 * _1116;
        float _1124 = -_395;
        float _1126 = _1124 + _821;
        float _1128 = fma(_1112, _1122, _461);
        float _1130 = fma(_1126, _1122, _395);
        float _1132 = fma(_1120, _1122, _401);
        _1040 = _1128;
        _723 = as_type<int>(_1122);
        _1036 = _1130;
        _1080 = _1132;
    }
    float _1134 = _1040;
    int _1136 = _723;
    float _1138 = _1036;
    float _1140 = _1080;
    float _1142 = _835 * _1060;
    int _1144 = _1136;
    int _1146 = as_type<int>(_1142);
    if (!_966)
    {
        int _1148 = _1012 << 2;
        _1144 = _1148;
    }
    int _1150 = _1144;
    float _1152 = _1134 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_966)
    {
        uint _1154 = uint(int(uint(_1012) >> uint(2)));
        _1082 = int(_1154);
    }
    int _1156 = _1082;
    float _1158 = fma(_395, _1052, _1142);
    if (!_966)
    {
        int _1160 = 12 & _1150;
        _1146 = _1160;
    }
    int _1162 = _1146;
    float _1164 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1152);
    float _1166 = _835 * _938;
    float _1168 = fma(_401, _1070, _1158);
    if (!_966)
    {
        int _1170 = _1156 << 4;
        int _1172 = _1170 + _1162;
        _903 = _1172;
    }
    int _1174 = _903;
    float _1176 = fma(_1140, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1164);
    int _1178 = _917 + 80;
    uint _1180 = uint(int(uint(_1178) >> uint(2)));
    uint _1182 = uint(int(uint(int(_1180)) >> uint(2)));
    int _1184 = int(_1180) & 3;
    float _1186 = (*spvDescriptorSet0.vp_c15)._m0[int(_1182)][_1184];
    int _1188 = int(_1180) + 1;
    uint _1190 = uint(int(uint(_1188) >> uint(2)));
    int _1192 = _1188 & 3;
    float _1194 = (*spvDescriptorSet0.vp_c15)._m0[int(_1190)][_1192];
    float _1196 = _1168 + _1078;
    float _1198 = fma(_395, _930, _1166);
    float _1200 = _1176 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1202 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1204 = 1.0 / _1196;
    float _1206 = _835 * _998;
    float _1208 = _1200 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1210 = _1168;
    float _1212 = _1196;
    if (!_966)
    {
        int _1214 = _1174 + 400;
        uint _1216 = uint(int(uint(_1214) >> uint(2)));
        uint _1218 = uint(int(uint(int(_1216)) >> uint(2)));
        int _1220 = int(_1216) & 3;
        float _1222 = (*spvDescriptorSet0.vp_c15)._m0[int(_1218)][_1220];
        _1210 = _1222;
    }
    float _1224 = _1210;
    float _1226 = fma(_401, _954, _1198);
    float _1228 = fma(_395, _990, _1206);
    float _1230 = -_1208;
    float _1232 = fma(_1230, _1202, 1.0);
    float _1234 = _1134 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1236 = _1226 + _962;
    float _1238 = _1134 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1240 = fma(_401, _1022, _1228);
    int _1242 = _917 + 88;
    uint _1244 = uint(int(uint(_1242) >> uint(2)));
    uint _1246 = uint(int(uint(int(_1244)) >> uint(2)));
    int _1248 = int(_1244) & 3;
    float _1250 = (*spvDescriptorSet0.vp_c15)._m0[int(_1246)][_1248];
    int _1252 = int(_1244) + 1;
    uint _1254 = uint(int(uint(_1252) >> uint(2)));
    int _1256 = _1252 & 3;
    float _1258 = (*spvDescriptorSet0.vp_c15)._m0[int(_1254)][_1256];
    float _1260 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1234);
    float _1262 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1238);
    float _1264 = _1134 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1266 = log2(_1232);
    float _1268 = _1236 * _1204;
    float _1270 = fma(_1140, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1260);
    float _1272 = _1240 + _1030;
    float _1274 = fma(_1140, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1262);
    float _1276 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1264);
    bool _1278 = _1268 >= 0.0;
    float _1280 = _1270 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1282 = _1272 * _1204;
    float _1284 = _1274 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    bool _1286 = _1268 <= 1.0;
    bool _1288 = _1286 && _1278;
    float _1290 = _1280 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1292 = fma(_1140, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1276);
    float _1294 = _1260;
    if (!_966)
    {
        float _1296 = floor(_859);
        _1294 = _1296;
    }
    float _1298 = _1294;
    bool _1300 = _1282 >= 0.0;
    bool _1302 = _1300 && _1288;
    float _1304 = fma(_1284, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1290);
    float _1306 = _1292 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1308 = _1280 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    bool _1310 = _1282 <= 1.0;
    bool _1312 = _1310 && _1302;
    float _1314 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1304);
    float _1316 = _1266 * 0.693147182464599609375;
    float _1318 = as_type<float>(_1174);
    if (!_966)
    {
        float _1320 = floor(_857);
        _1318 = _1320;
    }
    float _1322 = _1318;
    float _1324 = fma(_1284, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1308);
    float _1326 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1314);
    float _1328 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1324);
    float _1330 = _835 * _1194;
    float _1332 = 1.0 / _1326;
    float _1334 = _1280 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1336 = _1328;
    float _1338 = _1326;
    if (_1312)
    {
        float _1340 = float(_909);
        _1006 = _1340;
    }
    float _1342 = _1006;
    float _1344 = fma(_395, _1186, _1330);
    float _1346 = _1298;
    if (!_966)
    {
        float _1348 = -_1298;
        float _1350 = _859 + _1348;
        _1212 = _1350;
    }
    float _1352 = _1212;
    float _1354 = fma(_1284, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1334);
    float _1356 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1328);
    float _1358 = _1224;
    if (!_966)
    {
        float _1360 = rint(_1224);
        float _1362 = precise::max(_1360, 0.0);
        uint _1364 = uint(_1362);
        uint _1366 = clamp(_1364, 0u, 65535u);
        _1358 = as_type<float>(_1366);
    }
    float _1368 = _1358;
    float _1370 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1354);
    if (!_966)
    {
        float _1372 = -_1322;
        float _1374 = _857 + _1372;
        _1346 = _1374;
    }
    float _1376 = _1346;
    float _1378 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1370);
    float _1380 = fma(_401, _1250, _1344);
    float _1382 = _1344;
    if (_1312)
    {
        float _1384 = rint(_1342);
        float _1386 = precise::max(_1384, 0.0);
        uint _1388 = uint(_1386);
        uint _1390 = clamp(_1388, 0u, 65535u);
        _1382 = as_type<float>(_1390);
    }
    float _1392 = _1382;
    float _1394 = _1378 * _1332;
    float _1396 = _1380 + _1258;
    float _1398 = _1356 * _1332;
    float _1400 = fma(_1394, 0.5, 0.5);
    float _1402 = _1396 * _1204;
    float _1404 = fma(_1398, -0.5, 0.5);
    float _1406 = _1316 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1408 = _1376;
    float _1410 = _1406;
    float _1412 = _1368;
    if (!_966)
    {
        float3 _4672 = float3(_1376, _1352, float(as_type<int>(_1368)));
        float3 _4676 = select(_4672, float3(0.0), isnan(_4672));
        float _1414 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4676.xy, uint(rint(_4676.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4676.xy, uint(rint(_4676.z)), level(0.0)).x;
        _1408 = _1414;
    }
    float _1416 = _1408;
    float _1418 = _1282;
    if (_1312)
    {
        float3 _4691 = float3(_1268, _1282, float(as_type<int>(_1392)));
        float3 _4693 = select(_4691, float3(0.0), isnan(_4691));
        float _1420 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _4693.xy, uint(rint(_4693.z)), _1402, level(0.0));
        _1418 = _1420;
    }
    float _1422 = _1418;
    float3 _4703 = float3(_1400, _1404, _1406);
    float _1424 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4703, float3(0.0), isnan(_4703)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4703, float3(0.0), isnan(_4703)), level(0.0)).x;
    float3 _4712 = float3(_1400, _1404, _1406);
    float4 _1427 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4712, float3(0.0), isnan(_4712)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4712, float3(0.0), isnan(_4712)), level(0.0)).xyzw;
    float _1429 = _1427.x;
    float _1431 = _1427.y;
    float _1433 = _1427.z;
    float _1435 = _1427.w;
    bool _1437 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1439 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1441 = _1437 || _1439;
    bool _1443 = isnan(0.5);
    bool _1445 = _1441 || _1443;
    float _1447 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    if (_1445)
    {
        _1447 = 1.0;
    }
    float _1449 = _1447;
    float _1451 = _1449;
    if (_1445)
    {
        _1336 = 1.0;
    }
    float _1453 = _1336;
    float _1455 = _1453;
    float _1457 = _1422;
    if (!_1445)
    {
        float _1459 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1461 = _1459 * 0.15915493667125701904296875;
        float _1463 = _1461 * 6.283185482025146484375;
        float _1465 = cos(_1463);
        float _1467 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1469 = _1467 * 0.15915493667125701904296875;
        float _1471 = _1461 * 6.283185482025146484375;
        float _1473 = sin(_1471);
        float _1475 = 1.0 / _1465;
        float _1477 = _1469 * 6.283185482025146484375;
        float _1479 = cos(_1477);
        float _1481 = _1473 * _1475;
        float _1483 = _1469 * 6.283185482025146484375;
        float _1485 = sin(_1483);
        float _1487 = _1479 * _1481;
        float _1489 = 1.0 / _1487;
        float _1491 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1493 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1491;
        float _1495 = 1.0 / _1493;
        float _1497 = _1485 * _1489;
        float _1499 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1501 = fma(_883, _1497, _1499);
        float _1503 = _1501 * _1495;
        float _1505 = precise::clamp(_1503, 0.0, 1.0);
        _1410 = _1475;
        _1412 = _1493;
        _1455 = _1505;
    }
    float _1507 = _1410;
    float _1509 = _1412;
    float _1511 = _1455;
    float _1513 = _1507;
    float _1515 = _1509;
    if (!_1445)
    {
        float _1517 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1519 = _1517 * 0.15915493667125701904296875;
        float _1521 = _1519 * 6.283185482025146484375;
        float _1523 = cos(_1521);
        float _1525 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1527 = _1525 * 0.15915493667125701904296875;
        float _1529 = _1519 * 6.283185482025146484375;
        float _1531 = sin(_1529);
        float _1533 = 1.0 / _1523;
        float _1535 = _1527 * 6.283185482025146484375;
        float _1537 = cos(_1535);
        float _1539 = _1531 * _1533;
        float _1541 = _1527 * 6.283185482025146484375;
        float _1543 = sin(_1541);
        float _1545 = _1537 * _1539;
        float _1547 = 1.0 / _1545;
        float _1549 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1551 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1549;
        float _1553 = 1.0 / _1551;
        float _1555 = _1543 * _1547;
        float _1557 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1559 = fma(_883, _1555, _1557);
        float _1561 = _1559 * _1553;
        float _1563 = precise::clamp(_1561, 0.0, 1.0);
        float _1565 = -_1563;
        float _1567 = _1565 + 1.0;
        _1513 = _1547;
        _1515 = _1527;
        _1451 = _1567;
    }
    float _1569 = _1513;
    float _1571 = _1515;
    float _1573 = _1451;
    float _1575 = _1571;
    float _1577 = _1569;
    if (_966)
    {
        _1575 = 1.0;
    }
    float _1579 = _1575;
    float _1581 = _1579;
    if (!_966)
    {
        int _1583 = _1012 << 4;
        int _1585 = _1583 + 2048;
        uint _1587 = uint(int(uint(_1585) >> uint(2)));
        uint _1589 = uint(int(uint(int(_1587)) >> uint(2)));
        int _1591 = int(_1587) & 3;
        float _1593 = (*spvDescriptorSet0.vp_c15)._m0[int(_1589)][_1591];
        int _1595 = int(_1587) + 1;
        uint _1597 = uint(int(uint(_1595) >> uint(2)));
        int _1599 = _1595 & 3;
        float _1601 = (*spvDescriptorSet0.vp_c15)._m0[int(_1597)][_1599];
        int _1603 = _1585 + 8;
        uint _1605 = uint(int(uint(_1603) >> uint(2)));
        uint _1607 = uint(int(uint(int(_1605)) >> uint(2)));
        int _1609 = int(_1605) & 3;
        float _1611 = (*spvDescriptorSet0.vp_c15)._m0[int(_1607)][_1609];
        int _1613 = int(_1605) + 1;
        uint _1615 = uint(int(uint(_1613) >> uint(2)));
        int _1617 = _1613 & 3;
        float _1619 = (*spvDescriptorSet0.vp_c15)._m0[int(_1615)][_1617];
        float _1621 = _835 * _1601;
        float _1623 = fma(_395, _1593, _1621);
        float _1625 = fma(_401, _1611, _1623);
        float _1627 = _1625 + _1619;
        float _1629 = precise::clamp(_1627, 0.0, 1.0);
        float _1631 = -_1629;
        float _1633 = _1631 + _1416;
        float _1635 = fma(_1633, 500.0, 1.5);
        float _1637 = exp2(_1635);
        float _1639 = 0.0 + _1637;
        float _1641 = precise::clamp(_1639, 0.0, 1.0);
        _1032 = as_type<float>(_1585);
        _1581 = _1641;
    }
    float _1643 = _1032;
    float _1645 = _1581;
    float _1647 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1649 = _1134 + _1647;
    float _1651 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1653 = _1138 + _1651;
    float _1655 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1657 = _1140 + _1655;
    float _1659 = _1649 * _1649;
    float _1661 = fma(_1653, _1653, _1659);
    float _1663 = fma(_1657, _1657, _1661);
    float _1665 = rsqrt(_1663);
    float _1667 = _1665 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1669 = _1653 * _1667;
    float _1671 = _1657 * _1667;
    float _1673 = _1669 * _1669;
    float _1675 = _1671 * _1671;
    float _1677 = _1673 + _1675;
    float _1679 = sqrt(_1677);
    bool _1681 = _1679 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1683 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1685 = _1679 + _1683;
    float _1687 = _1657;
    float _1689 = _1659;
    float _1691 = _1685;
    float _1693 = _1667;
    if (_1681)
    {
        float _1695 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1687 = _1695;
    }
    float _1697 = _1687;
    if (_1681)
    {
        float _1699 = rsqrt(_1677);
        _1689 = _1699;
    }
    float _1701 = _1689;
    float _1703 = _1701;
    if (_1681)
    {
        float _1705 = _1685 * _1697;
        _1691 = _1705;
    }
    float _1707 = _1691;
    if (_1681)
    {
        float _1709 = _1707 * 0.15915493667125701904296875;
        _1577 = _1709;
    }
    float _1711 = _1577;
    float _1713 = _1665;
    if (_1681)
    {
        float _1715 = _1711 * 6.283185482025146484375;
        float _1717 = sin(_1715);
        _1713 = _1717;
    }
    float _1719 = _1713;
    float _1721 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1723 = precise::max(0.0, _1721);
    float _1725 = _1643;
    float _1727 = _1723;
    float _1729 = _1721;
    if (_1681)
    {
        float _1731 = _1711 * 6.283185482025146484375;
        float _1733 = cos(_1731);
        _1725 = _1733;
    }
    float _1735 = _1725;
    float _1737 = -_1667;
    float _1739 = -_1723;
    float _1741 = fma(_1649, _1737, _1739);
    float _1743 = _1741;
    if (_1681)
    {
        float _1745 = _1741 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1727 = _1745;
    }
    float _1747 = _1727;
    float _1749 = _1719;
    float _1751 = _1747;
    if (_1681)
    {
        float _1753 = fma(_1719, _1747, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1749 = _1753;
    }
    float _1755 = _1749;
    float _1757 = _1755;
    if (!_1681)
    {
        _1751 = _1671;
    }
    float _1759 = _1751;
    float _1761 = _1759;
    float _1763 = _1735;
    if (_1681)
    {
        float _1765 = _1735 + (-1.0);
        _1729 = _1765;
    }
    float _1767 = _1729;
    float _1769 = _1767;
    if (_1681)
    {
        float _1771 = _1701 * _1755;
        _1693 = _1771;
    }
    float _1773 = _1693;
    if (!_1681)
    {
        _1757 = _1669;
    }
    float _1775 = _1757;
    float _1777 = _1775;
    if (_1681)
    {
        float _1779 = _1767 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1769 = _1779;
    }
    float _1781 = _1769;
    if (_1681)
    {
        float _1783 = _1669 * _1773;
        _1777 = _1783;
    }
    float _1785 = _1777;
    if (!_1681)
    {
        _1703 = _1673;
    }
    float _1787 = _1703;
    float _1789 = _1787;
    if (_1681)
    {
        float _1791 = _1671 * _1773;
        _1761 = _1791;
    }
    float _1793 = _1761;
    if (_1681)
    {
        float _1795 = fma(_1741, _1735, _1781);
        _1743 = _1795;
    }
    float _1797 = _1743;
    if (_1681)
    {
        float _1799 = _1785 * _1785;
        _1789 = _1799;
    }
    float _1801 = _1789;
    if (!_1681)
    {
        _1763 = _1675;
    }
    float _1803 = _1763;
    float _1805 = _1803;
    if (_1681)
    {
        float _1807 = _1793 * _1793;
        _1805 = _1807;
    }
    float _1809 = _1805;
    float _1811 = sqrt(_1663);
    float _1813 = fma(_1797, _1797, _1801);
    float _1815 = _1813 + _1809;
    float _1817 = rsqrt(_1815);
    float _1819 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1821 = fma(_1811, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1819);
    float _1823 = precise::clamp(_1821, 0.0, 1.0);
    float _1825 = -_1823;
    float _1827 = _1825 + 1.0;
    float _1829 = _1817 * _1785;
    float _1831 = _1817 * _1797;
    float _1833 = _1817 * _1793;
    float _1835 = abs(_1827);
    float _1837 = log2(_1835);
    float _1839 = _1829 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1841 = -_1839;
    float _1843 = fma(_1831, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1841);
    float _1845 = -_1833;
    float _1847 = fma(_1845, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1843);
    float _1849 = fma(_1847, -0.5, 0.5);
    float _1851 = fma(_1847, 0.5, 0.5);
    float _1853 = _1837 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1855 = fma(_1851, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1857 = sqrt(_1849);
    float _1859 = fma(_1851, _1855, -0.212114393711090087890625);
    float _1861 = _1831 + 1.0;
    float _1863 = fma(_1851, _1859, 1.570728778839111328125);
    float _1865 = exp2(_1853);
    float _1867 = _1857 * 0.636619746685028076171875;
    float _1869 = -_1831;
    float _1871 = fma(_1865, _1861, _1869);
    float _1873 = -_1863;
    float _1875 = fma(_1867, _1873, 1.0);
    float _1877 = fma(_1871, 0.5, 0.5);
    float2 _5363 = float2(_1875, _1877);
    float3 _1881 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5363, float2(0.0), isnan(_5363)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5363, float2(0.0), isnan(_5363)), level(0.0)).xyz;
    float _1883 = _1881.x;
    float _1885 = _1881.y;
    float _1887 = _1881.z;
    float _1889 = abs(_883);
    float _1891 = log2(_1889);
    float _1893 = _1280 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1895 = -_807;
    float _1897 = _1895 + 1.0;
    out.m_84.x = _1138;
    out.m_84.y = _1134;
    out.m_84.z = _1140;
    float _1899 = fma(_1284, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1893);
    float _1901 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1899);
    bool _1903 = _883 <= 8000.0;
    bool _1905 = isnan(_883);
    bool _1907 = _1903 || _1905;
    bool _1909 = isnan(8000.0);
    bool _1911 = _1907 || _1909;
    float _1913 = float(_1911);
    float _1915 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1901);
    float _1917 = _1891 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1919 = _1915 + _1326;
    out.gl_Position.x = _1378;
    out.gl_Position.y = _1356;
    out.gl_Position.z = _1915;
    out.gl_Position.w = _1326;
    float _1921 = _1919 * 0.5;
    float _1923 = exp2(_1917);
    out.m_86.z = _1921;
    out.m_86.w = _1326;
    float _1925 = fma(_1923, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1927 = precise::clamp(_1925, 0.0, 1.0);
    float _1929 = _1837 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1931 = _1837;
    if (!_1312)
    {
        _1931 = 1.0;
    }
    float _1933 = _1931;
    float _1935 = fma(_1927, -2.0, 3.0);
    float _1937 = _1927 * _1927;
    float _1939 = _1933;
    if (_1312)
    {
        bool _1941 = _1422 >= _1402;
        bool _1943 = isnan(_1422);
        bool _1945 = _1941 || _1943;
        bool _1947 = isnan(_1402);
        bool _1949 = _1945 || _1947;
        float _1951 = float(_1949);
        _1939 = _1951;
    }
    float _1953 = _1939;
    float _1955 = exp2(_1929);
    bool _1957 = _1811 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1959 = isnan(_1811);
    bool _1961 = _1957 || _1959;
    bool _1963 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1965 = _1961 || _1963;
    float _1967 = _1937 * _1935;
    float _1969 = _1953 * _1645;
    float _1971 = -_1967;
    float _1973 = _1971 + 1.0;
    float _1975 = fma(_1973, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1967);
    float _1977 = _1913 * _1975;
    if (!_1965)
    {
        _1457 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1979 = _1457;
    float _1981 = -_1955;
    float _1983 = _1981 + 1.0;
    float _1985 = _1979;
    float _1987 = _1979;
    if (!_1965)
    {
        _1338 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1989 = _1338;
    float _1991 = _1977 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1993 = _1983 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1995 = _1897 * _1991;
    float _1997 = precise::clamp(_1995, 0.0, 1.0);
    float _1999 = _1993 * _1424;
    float _2001 = -_1993;
    float _2003 = _2001 + 1.0;
    float _2005 = -_1997;
    float _2007 = fma(_2005, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2009 = _1993;
    float _2011 = _2003;
    float _2013 = _1989;
    float _2015 = _1989;
    if (!_1965)
    {
        _2009 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2017 = _2009;
    float _2019 = _1435 * _1999;
    float _2021 = _1435 * _2003;
    float _2023 = -_1969;
    float _2025 = fma(_2023, _2007, 1.0);
    float _2027 = precise::clamp(_2025, 0.0, 1.0);
    float _2029 = _2019;
    float _2031 = _2017;
    float _2033 = _2017;
    if (!_1965)
    {
        _2011 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2035 = _2011;
    float _2037 = _2027 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2039 = _1511 * _1573;
    out.m_88.x = _2037;
    float _2041 = _2039 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2043 = _2039;
    float _2045 = _2035;
    float _2047 = _2035;
    if (!_1965)
    {
        _2043 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2049 = _2043;
    float _2051 = _1887 * _1999;
    float _2053 = fma(_1883, _2019, _1429);
    float _2055 = fma(_1885, _2019, _1431);
    float _2057 = _2049;
    float _2059 = _2049;
    if (!_1965)
    {
        _2029 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2061 = _2029;
    float _2063 = fma(_1435, _2051, _1433);
    out.m_90.x = _2053;
    out.m_90.y = _2055;
    out.m_90.z = _2063;
    out.m_90.w = _2021;
    bool _2065 = !_1965;
    float _2067 = _2061;
    float _2069 = _2061;
    if (!_2065)
    {
        bool _2071 = _1811 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2073 = isnan(_1811);
        bool _2075 = _2071 || _2073;
        bool _2077 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2079 = _2075 || _2077;
        if (!_2079)
        {
            float _2081 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2083 = _1811 + _2081;
            float _2085 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2087 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2085;
            float _2089 = 1.0 / _2087;
            float _2091 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2093 = _2091 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2095 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2097 = _2095 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2099 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2101 = _2099 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2103 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2105 = _2103 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2107 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2109 = _2107 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2111 = _2083 * _2089;
            float _2113 = precise::clamp(_2111, 0.0, 1.0);
            float _2115 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2117 = _2115 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2119 = fma(_2113, _2093, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2121 = fma(_2113, _2117, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2123 = fma(_2113, _2097, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2125 = fma(_2113, _2101, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2127 = fma(_2113, _2105, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2129 = fma(_2113, _2109, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2015 = _2121;
            _2047 = _2127;
            _1987 = _2119;
            _2033 = _2125;
            _2069 = _2123;
            _2059 = _2129;
            _2131 = true;
        }
        else
        {
            bool _2133 = _1811 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2135 = isnan(_1811);
            bool _2137 = _2133 || _2135;
            bool _2139 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2141 = _2137 || _2139;
            if (!_2141)
            {
                _1985 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2143 = _1985;
            _1987 = _2143;
            if (!_2141)
            {
                _2013 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2145 = _2013;
            _2015 = _2145;
            if (!_2141)
            {
                _2067 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2147 = _2067;
            _2069 = _2147;
            if (!_2141)
            {
                _2031 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2149 = _2031;
            _2033 = _2149;
            if (!_2141)
            {
                _2045 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2151 = _2045;
            _2047 = _2151;
            if (!_2141)
            {
                _2057 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2153 = _2057;
            bool _2155 = !_2141;
            _2059 = _2153;
            if (!_2155)
            {
                bool _2157 = _1811 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2159 = isnan(_1811);
                bool _2161 = _2157 || _2159;
                bool _2163 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2165 = _2161 || _2163;
                if (!_2165)
                {
                    float _2167 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2169 = _1811 + _2167;
                    float _2171 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2173 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2171;
                    float _2175 = 1.0 / _2173;
                    float _2177 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2179 = _2177 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2181 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2183 = _2181 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2185 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2187 = _2185 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2189 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2191 = _2189 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2193 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2195 = _2193 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2197 = _2169 * _2175;
                    float _2199 = precise::clamp(_2197, 0.0, 1.0);
                    float _2201 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2203 = _2201 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2205 = fma(_2199, _2179, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2207 = fma(_2199, _2203, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2209 = fma(_2199, _2183, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2211 = fma(_2199, _2187, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2213 = fma(_2199, _2191, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2215 = fma(_2199, _2195, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2015 = _2207;
                    _2047 = _2213;
                    _1987 = _2205;
                    _2033 = _2211;
                    _2069 = _2209;
                    _2059 = _2215;
                    _2131 = true;
                }
                else
                {
                    _2015 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2047 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1987 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2033 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2069 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2059 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2131 = false;
    float _2217 = _2015;
    float _2219 = _2047;
    float _2221 = _1987;
    float _2223 = _2033;
    float _2225 = _2069;
    float _2227 = _2059;
    float _2229 = fma(_691, -0.5, 0.5);
    float _2231 = precise::clamp(_2229, 0.0, 1.0);
    float _2233 = -_2217;
    float _2235 = _2233 + _2219;
    float _2237 = _2041 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2239 = -_2221;
    float _2241 = _2239 + _2223;
    out.m_92.x = 0.0;
    float _2243 = fma(_2231, _2235, _2217);
    float _2245 = fma(_2231, _2241, _2221);
    out.m_61.x = _2237;
    float _2247 = -_2225;
    float _2249 = _2247 + _2227;
    float _2251 = _2243 * 0.586610972881317138671875;
    bool _2253 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2255 = fma(_2231, _2249, _2225);
    float _2257 = fma(_2245, 0.298911988735198974609375, _2251);
    bool _2259 = _1511 > 0.0;
    bool _2261 = isnan(_1511);
    bool _2263 = _2259 || _2261;
    bool _2265 = isnan(0.0);
    bool _2267 = _2263 || _2265;
    float _2269 = fma(_2255, 0.114477999508380889892578125, _2257);
    bool _2271 = _1573 <= 0.0;
    bool _2273 = !_2267;
    bool _2275 = _2271 || _2273;
    float _2277 = -_2269;
    float _2279 = _2245 + _2277;
    float _2281 = -_2269;
    float _2283 = _2243 + _2281;
    float _2285 = -_2269;
    float _2287 = _2255 + _2285;
    float _2289 = fma(_2279, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2269);
    float _2291 = fma(_2283, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2269);
    float _2293 = fma(_2287, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2269);
    bool _2295 = !_2253;
    if (!_2295)
    {
        float _2297 = -_1134;
        float _2299 = _2297 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2301 = -_1138;
        float _2303 = _2301 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2305 = -_1140;
        float _2307 = _2305 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2309 = _2299 * _2299;
        float _2311 = fma(_2303, _2303, _2309);
        float _2313 = fma(_2307, _2307, _2311);
        float _2315 = sqrt(_2313);
        float _2317 = rsqrt(_2313);
        float _2319 = -_2315;
        float _2321 = _2319 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2323 = _2321 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2325 = precise::clamp(_2323, 0.0, 1.0);
        float _2327 = _2303 * _2317;
        float _2329 = _2299 * _2317;
        float _2331 = abs(_2325);
        float _2333 = log2(_2331);
        float _2335 = _2307 * _2317;
        float _2337 = _2327 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2339 = _691 * _2329;
        float _2341 = -_2329;
        float _2343 = -_2337;
        float _2345 = fma(_2341, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2343);
        float _2347 = fma(_689, _2327, _2339);
        float _2349 = -_2335;
        float _2351 = fma(_2349, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2345);
        float _2353 = fma(_709, _2335, _2347);
        float _2355 = precise::clamp(_2353, 0.0, 1.0);
        float _2357 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2359 = _2351 + _2357;
        float _2361 = _2333 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2363 = _2359 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2365 = precise::clamp(_2363, 0.0, 1.0);
        float _2367 = exp2(_2361);
        float _2369 = _2367 * _2365;
        float _2371 = _2355 * _2369;
        float _2373 = _2371 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2375 = _2371 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2377 = _2371 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_92.x = _2373;
        out.m_92.y = _2375;
        out.m_92.z = _2377;
    }
    out.m_94.x = _2289;
    out.m_94.y = _2291;
    out.m_94.z = _2293;
    if (!_2275)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_61.x = 0.0;
    float _2379 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2379;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2131 = false;
    bool _759 = false;
    bool _189 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _108 = in.m_58.w;
    float _110 = trunc(_108);
    int _113 = int(_110);
    bool _117 = _113 >= 1;
    float _119 = 0.0;
    if (!_117)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _119;
    float _123 = _121;
    if (!_117)
    {
        out.m_61.x = 0.0;
    }
    int _125 = 0;
    if (!_117)
    {
        float _127 = _121 * 5.0;
        _125 = as_type<int>(_127);
    }
    int _129 = _125;
    int _131 = _129;
    if (!_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2436 = as_type<float>(_129);
        out.gl_Position.z = _2436;
    }
    if (!_117)
    {
        return out;
    }
    float _133 = in.m_63.w;
    bool _135 = _133 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = isnan(_133);
    bool _139 = _135 || _137;
    bool _141 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _143 = _139 || _141;
    float _145 = -_133;
    float _147 = _145 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _149 = 0.0;
    if (_143)
    {
        float _151 = float(_113);
        _149 = _151;
    }
    float _153 = _149;
    bool _155 = _147 >= _153;
    bool _157 = !_143;
    bool _159 = _155 || _157;
    if (_159)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _123;
    if (_159)
    {
        out.m_61.x = 0.0;
    }
    if (_159)
    {
        float _163 = _161 * 5.0;
        _131 = as_type<int>(_163);
    }
    int _165 = _131;
    if (_159)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2504 = as_type<float>(_165);
        out.gl_Position.z = _2504;
    }
    if (_159)
    {
        return out;
    }
    bool _167 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _169 = !_167;
    float _187;
    if (!_169)
    {
        float _171 = in.m_65.x;
        float _173 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _175 = _171 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _177 = fma(_175, (*spvDescriptorSet0.vp_c9)._m0[12].x, _147);
        float _179 = _177 * _173;
        float _181 = floor(_179);
        float _183 = -_181;
        float _185 = _179 + _183;
        _187 = _185;
        _189 = true;
    }
    else
    {
        float _191 = float(_113);
        float _193 = 1.0 / _191;
        float _195 = _147 * _193;
        _187 = _195;
    }
    _189 = false;
    float _197 = _187;
    float _199 = as_type<float>(int(gl_VertexIndex));
    float _201 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _203 = _197 + _201;
    float _205 = in.m_65.x;
    float _207 = in.m_65.y;
    float _209 = in.m_65.z;
    float _211 = in.m_65.w;
    float _213 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _215 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _213;
    float _217 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _219 = 1.0 / _215;
    float _221 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _217);
    bool _223 = _197 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _225 = isnan(_197);
    bool _227 = _223 || _225;
    bool _229 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _231 = _227 || _229;
    float _233 = float(_231);
    bool _235 = _197 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _237 = isnan(_197);
    bool _239 = _235 || _237;
    bool _241 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _243 = _239 || _241;
    float _245 = float(_243);
    float _247 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _221);
    float _249 = -_233;
    float _251 = _249 + 1.0;
    float _253 = sqrt(_247);
    float _255 = _245 * _251;
    int _257 = as_type<int>(_199) & 1;
    bool _259 = _257 != 0;
    int _261 = as_type<int>(_199) & 2;
    bool _263 = _261 != 0;
    float _265 = -_245;
    float _267 = _265 + 1.0;
    float _269 = in.m_58.x;
    float _271 = in.m_58.y;
    float _273 = in.m_58.z;
    float _275 = _203 * _219;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _279 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _277;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _283 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _281;
    float _285 = rsqrt(_247);
    float _287 = in.m_70.x;
    float _289 = in.m_70.y;
    float _291 = fma(_279, _275, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _293 = fma(_283, _275, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _295 = _291 * _255;
    float _297 = precise::max(_253, 2.0);
    float _299 = _293 * _255;
    bool _301 = !_263;
    float _303 = _301 ? (-0.5) : 0.5;
    float _305 = fma(_267, (*spvDescriptorSet0.vp_c9)._m0[143].x, _295);
    bool _307 = !_259;
    float _309 = _307 ? (-0.5) : 0.5;
    float _311 = fma(_267, (*spvDescriptorSet0.vp_c9)._m0[143].y, _299);
    float _313 = precise::min(_297, 15.0);
    float _315 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[144].x, _305);
    bool _317 = _205 > 0.5;
    float _319 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[144].y, _311);
    bool _321 = _209 > 0.5;
    float _323 = fma(_313, 0.061538465321063995361328125, -0.12307693064212799072265625);
    float _325 = -_271;
    float _327 = _303 + _325;
    float _329 = -_269;
    float _331 = _309 + _329;
    float _333 = -_285;
    float _335 = fma(_333, _273, _273);
    float _337 = _271 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _339 = -_327;
    float _341 = fma(_327, _285, _339);
    float _343 = -_331;
    float _345 = fma(_331, _285, _343);
    float _347 = _319 * _289;
    float _349 = _315 * _287;
    float _351 = fma(_323, _341, _327);
    float _353 = fma(_323, _345, _331);
    float _355 = _347 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _357 = _349 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _359 = _351 + _271;
    float _361 = _353 + _269;
    float _363 = _323 * _335;
    float _365 = fma(_269, (*spvDescriptorSet0.vp_c10)._m0[4].x, _337);
    float _367 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _359);
    float _369 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _361);
    float _371 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _363);
    float _373 = fma(_273, (*spvDescriptorSet0.vp_c10)._m0[4].z, _365);
    float _375 = _355 * _367;
    float _377 = _357 * _369;
    float _379 = _271 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _381 = _375 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _383 = _375 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _385 = fma(_269, (*spvDescriptorSet0.vp_c10)._m0[6].x, _379);
    float _387 = _271 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _389 = fma(_377, (*spvDescriptorSet0.vp_c8)._m0[24].x, _381);
    float _391 = fma(_377, (*spvDescriptorSet0.vp_c8)._m0[26].x, _383);
    float _393 = fma(_273, (*spvDescriptorSet0.vp_c10)._m0[6].z, _385);
    float _395 = _373 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _397 = fma(_371, (*spvDescriptorSet0.vp_c8)._m0[24].z, _389);
    float _399 = fma(_371, (*spvDescriptorSet0.vp_c8)._m0[26].z, _391);
    float _401 = _393 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _403 = _397 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _405 = _399 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _407 = _375 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _409 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _411 = _409 != 0;
    float _413 = _395 + _403;
    float _415 = _401 + _405;
    float _417 = fma(_269, (*spvDescriptorSet0.vp_c10)._m0[5].x, _387);
    float _419 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _421 = _413 + _419;
    float _423 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _425 = _415 + _423;
    float _427 = fma(_377, (*spvDescriptorSet0.vp_c8)._m0[25].x, _407);
    float _429 = _421 * _421;
    float _431 = _425 * _425;
    float _433 = -_309;
    float _435 = _317 ? _433 : _309;
    out.m_72.x = (*spvDescriptorSet0.vp_c8)._m0[24].x;
    out.m_72.y = (*spvDescriptorSet0.vp_c8)._m0[25].x;
    out.m_72.z = (*spvDescriptorSet0.vp_c8)._m0[26].x;
    bool _437 = _211 > 0.5;
    float _439 = _429 + _431;
    int _441 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _443 = _441 != 0;
    float _445 = fma(_273, (*spvDescriptorSet0.vp_c10)._m0[5].z, _417);
    int _447 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _449 = _447 != 0;
    float _451 = sqrt(_439);
    int _453 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _455 = _453 != 0;
    float _457 = fma(_371, (*spvDescriptorSet0.vp_c8)._m0[25].z, _427);
    bool _459 = _207 > 0.5;
    float _461 = _445 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _463 = -_309;
    int _465 = _321 ? as_type<int>(_463) : as_type<int>(_309);
    float _467 = _457 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _469 = !_411;
    float _471 = _469 ? _309 : _435;
    float _473 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _475 = -_303;
    int _477 = _459 ? as_type<int>(_475) : as_type<int>(_303);
    float _479 = _461 + _467;
    bool _481 = !_449;
    float _483 = _481 ? _309 : as_type<float>(_465);
    float _485 = _359 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _487 = -_303;
    int _489 = _437 ? as_type<int>(_487) : as_type<int>(_303);
    float _491 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _493 = _451 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _495 = fma(_363, (*spvDescriptorSet0.vp_c9)._m0[17].y, 1.0);
    bool _497 = !_443;
    float _499 = _497 ? _303 : as_type<float>(_477);
    bool _501 = !_455;
    float _503 = _501 ? _303 : as_type<float>(_489);
    float _505 = _485 * _485;
    float _507 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _509 = _467;
    float _511 = _413;
    float _513 = _377;
    float _515 = _435;
    float _517 = _415;
    if (!_493)
    {
        _509 = _413;
    }
    float _519 = _509;
    float _521 = _519;
    if (!_493)
    {
        _511 = _415;
    }
    float _523 = _511;
    float _525 = _523;
    if (!_493)
    {
        _513 = _431;
    }
    float _527 = _513;
    float _529 = _527;
    if (!_493)
    {
        _515 = _429;
    }
    float _531 = _515;
    float _533 = _531;
    if (!_493)
    {
        _517 = _479;
    }
    float _535 = _517;
    bool _537 = !_493;
    float _539 = _535;
    if (!_537)
    {
        float _541 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _543 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _545 = _451 + _543;
        float _547 = rsqrt(_439);
        float _549 = _545 * _541;
        float _551 = _479 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _553 = _549 * 0.15915493667125701904296875;
        float _555 = _553 * 6.283185482025146484375;
        float _557 = sin(_555);
        float _559 = _553 * 6.283185482025146484375;
        float _561 = cos(_559);
        float _563 = fma(_557, _551, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _565 = _547 * _563;
        float _567 = _561 + (-1.0);
        float _569 = fma(_421, _565, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _571 = fma(_425, _565, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _573 = _567 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _575 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _577 = _569 + _575;
        float _579 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _581 = _571 + _579;
        float _583 = fma(_479, _561, _573);
        float _585 = _577 * _577;
        float _587 = _581 * _581;
        _539 = _583;
        _533 = _585;
        _529 = _587;
        _521 = _569;
        _525 = _571;
    }
    float _589 = _539;
    float _591 = _533;
    float _593 = _529;
    float _595 = _521;
    float _597 = _525;
    float _599 = fma(_495, _495, _505);
    float _601 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _603 = _361 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _605 = _485 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _607 = _485 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _609 = _485 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _611 = _471 + 0.5;
    float _613 = _483 + 0.5;
    float _615 = fma(_603, (*spvDescriptorSet0.vp_c8)._m0[24].x, _605);
    float _617 = rsqrt(_599);
    float _619 = fma(_603, (*spvDescriptorSet0.vp_c8)._m0[25].x, _607);
    float _621 = fma(_603, (*spvDescriptorSet0.vp_c8)._m0[26].x, _609);
    float _623 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _625 = _589 + _623;
    float _627 = _611 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _629 = _613 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _631 = -_503;
    float _633 = _631 + 0.5;
    float _635 = -_499;
    float _637 = _635 + 0.5;
    float _639 = fma(_625, _625, _591);
    float _641 = _627 * _473;
    float _643 = _629 * _507;
    float _645 = _633 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _647 = _637 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _649 = _639 + _593;
    float _651 = _645 * _601;
    float _653 = _485 * _617;
    float _655 = _495 * _617;
    float _657 = sqrt(_649);
    float _659 = -(*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _661 = _653 * _659;
    float _663 = -(*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _665 = _653 * _663;
    float _667 = -(*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _669 = _653 * _667;
    float _671 = fma(_655, (*spvDescriptorSet0.vp_c8)._m0[24].y, _661);
    float _673 = fma(_655, (*spvDescriptorSet0.vp_c8)._m0[25].y, _665);
    float _675 = fma(_655, (*spvDescriptorSet0.vp_c8)._m0[26].y, _669);
    float _677 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _679 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _681 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _683 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _685 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _687 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _689 = fma(_495, (*spvDescriptorSet0.vp_c8)._m0[24].z, _615);
    float _691 = fma(_495, (*spvDescriptorSet0.vp_c8)._m0[25].z, _619);
    float _693 = _647 * _491;
    float _695 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _697 = _677 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _699 = _679 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _701 = _681 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _703 = _683 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _705 = _685 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _707 = _687 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _709 = fma(_495, (*spvDescriptorSet0.vp_c8)._m0[26].z, _621);
    out.m_74.x = _697;
    out.m_74.y = _699;
    out.m_74.z = _701;
    out.m_74.w = _695;
    bool _711 = _657 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _713 = isnan(_657);
    bool _715 = _711 || _713;
    bool _717 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _719 = _715 || _717;
    out.m_76.x = _703;
    out.m_76.y = _705;
    out.m_76.z = _707;
    out.m_78.x = _641;
    out.m_78.y = _693;
    out.m_78.z = _643;
    out.m_78.w = _651;
    out.m_80.x = _671;
    out.m_80.y = _673;
    out.m_80.z = _675;
    float _721 = 0.0;
    int _723 = as_type<int>(_597);
    if (!_719)
    {
        _721 = 1.0;
    }
    float _725 = _721;
    out.m_82.x = _689;
    out.m_82.y = _691;
    out.m_82.z = _709;
    bool _727 = !_719;
    float _729 = _725;
    if (!_727)
    {
        bool _731 = _657 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _733 = isnan(_657);
        bool _735 = _731 || _733;
        bool _737 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _739 = _735 || _737;
        if (!_739)
        {
            float _741 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _743 = _657 + _741;
            float _745 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _747 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _745;
            float _749 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _751 = _749 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _753 = 1.0 / _747;
            float _755 = _743 * _753;
            float _757 = fma(_755, _751, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _729 = _757;
            _759 = true;
        }
        else
        {
            bool _761 = _657 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _763 = isnan(_657);
            bool _765 = _761 || _763;
            bool _767 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _769 = _765 || _767;
            if (!_769)
            {
                float _771 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _773 = _657 + _771;
                float _775 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _777 = _775 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _779 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _781 = _779 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _783 = 1.0 / _777;
                float _785 = _773 * _783;
                float _787 = fma(_785, _781, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _729 = _787;
                _759 = true;
            }
            else
            {
                _729 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _759 = false;
    float _789 = _729;
    float _791 = fma(_395, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _793 = fma(_401, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _795 = floor(_791);
    float _797 = floor(_793);
    float _799 = -_795;
    float _801 = _791 + _799;
    float _803 = -_797;
    float _805 = _793 + _803;
    float2 _3637 = float2(_801, _805);
    float _807 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3637, float2(0.0), isnan(_3637)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3637, float2(0.0), isnan(_3637)), level(0.0)).x;
    float _809 = _461 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _811 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _813 = _595 + _811;
    float _815 = fma(_395, (*spvDescriptorSet0.vp_c8)._m0[11].x, _809);
    float _817 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _819 = _589 + _817;
    float _821 = fma(_813, _789, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _823 = fma(_401, (*spvDescriptorSet0.vp_c8)._m0[11].z, _815);
    float _825 = _461 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _827 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _829 = fma(_819, _789, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _831 = _823 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _833 = fma(_395, (*spvDescriptorSet0.vp_c8)._m0[10].x, _825);
    float _835 = _461 + _827;
    float _837 = 1.0 / _831;
    float _839 = fma(_401, (*spvDescriptorSet0.vp_c8)._m0[10].z, _833);
    float _841 = _835 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _843 = _835 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _845 = _839 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _847 = fma(_395, (*spvDescriptorSet0.vp_c15)._m0[126].x, _841);
    float _849 = fma(_395, (*spvDescriptorSet0.vp_c15)._m0[127].x, _843);
    float _851 = _845 + _831;
    float _853 = fma(_401, (*spvDescriptorSet0.vp_c15)._m0[126].z, _847);
    float _855 = fma(_401, (*spvDescriptorSet0.vp_c15)._m0[127].z, _849);
    float _857 = _853 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _859 = _855 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _861 = _851 * _837;
    float _863 = _861 * 0.5;
    float _865 = trunc(_859);
    int _867 = int(_865);
    float _869 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _871 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[30].w, _869);
    float _873 = 1.0 / _871;
    int _875 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _877 = _867 + _875;
    int _879 = _877 + 1;
    float _881 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _883 = _873 * _881;
    float _885 = trunc(_857);
    int _887 = int(_885);
    bool _889 = _883 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _891 = _883 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _893 = !_889;
    int _895 = _893 ? 0 : 1;
    int _897 = 2;
    int _899 = as_type<int>(_819);
    float _901 = as_type<float>(_879);
    int _903 = as_type<int>(_821);
    if (!_889)
    {
        _897 = 1;
    }
    int _905 = _897;
    int _907 = _905;
    if (!_891)
    {
        _907 = _895;
    }
    int _909 = _907;
    int _911 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _913 = _887 + _911;
    int _915 = _913 + 1;
    int _917 = _909 << 6;
    bool _919 = _915 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _921 = _917 + 48;
    uint _924 = uint(int(uint(_921) >> uint(2)));
    uint _926 = uint(int(uint(int(_924)) >> uint(2)));
    int _928 = int(_924) & 3;
    float _930 = (*spvDescriptorSet0.vp_c15)._m0[int(_926)][_928];
    int _932 = int(_924) + 1;
    uint _934 = uint(int(uint(_932) >> uint(2)));
    int _936 = _932 & 3;
    float _938 = (*spvDescriptorSet0.vp_c15)._m0[int(_934)][_936];
    int _940 = _915 | _879;
    bool _942 = _940 < 0;
    bool _944 = _942 || _919;
    int _946 = _917 + 56;
    uint _948 = uint(int(uint(_946) >> uint(2)));
    uint _950 = uint(int(uint(int(_948)) >> uint(2)));
    int _952 = int(_948) & 3;
    float _954 = (*spvDescriptorSet0.vp_c15)._m0[int(_950)][_952];
    int _956 = int(_948) + 1;
    uint _958 = uint(int(uint(_956) >> uint(2)));
    int _960 = _956 & 3;
    float _962 = (*spvDescriptorSet0.vp_c15)._m0[int(_958)][_960];
    bool _964 = _879 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _966 = _964 || _944;
    bool _968 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _970 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _972 = _968 || _970;
    bool _974 = isnan(0.5);
    bool _976 = _972 || _974;
    float _978 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _980 = _597 + _978;
    int _982 = _917 + 64;
    uint _984 = uint(int(uint(_982) >> uint(2)));
    uint _986 = uint(int(uint(int(_984)) >> uint(2)));
    int _988 = int(_984) & 3;
    float _990 = (*spvDescriptorSet0.vp_c15)._m0[int(_986)][_988];
    int _992 = int(_984) + 1;
    uint _994 = uint(int(uint(_992) >> uint(2)));
    int _996 = _992 & 3;
    float _998 = (*spvDescriptorSet0.vp_c15)._m0[int(_994)][_996];
    float _1000 = fma(_980, _789, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1002 = _980;
    float _1004 = as_type<float>(_915);
    float _1006 = as_type<float>(_909);
    if (!_966)
    {
        int _1008 = _879 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1010 = _1008 + _915;
        _899 = _1010;
    }
    int _1012 = _899;
    int _1014 = _917 + 72;
    uint _1016 = uint(int(uint(_1014) >> uint(2)));
    uint _1018 = uint(int(uint(int(_1016)) >> uint(2)));
    int _1020 = int(_1016) & 3;
    float _1022 = (*spvDescriptorSet0.vp_c15)._m0[int(_1018)][_1020];
    int _1024 = int(_1016) + 1;
    uint _1026 = uint(int(uint(_1024) >> uint(2)));
    int _1028 = _1024 & 3;
    float _1030 = (*spvDescriptorSet0.vp_c15)._m0[int(_1026)][_1028];
    float _1032 = as_type<float>(_1012);
    if (_976)
    {
        _1002 = _821;
    }
    float _1034 = _1002;
    float _1036 = _1034;
    if (_976)
    {
        _1004 = _829;
    }
    float _1038 = _1004;
    float _1040 = _1038;
    if (_976)
    {
        _901 = _1000;
    }
    float _1042 = _901;
    int _1044 = _917 + 96;
    uint _1046 = uint(int(uint(_1044) >> uint(2)));
    uint _1048 = uint(int(uint(int(_1046)) >> uint(2)));
    int _1050 = int(_1046) & 3;
    float _1052 = (*spvDescriptorSet0.vp_c15)._m0[int(_1048)][_1050];
    int _1054 = int(_1046) + 1;
    uint _1056 = uint(int(uint(_1054) >> uint(2)));
    int _1058 = _1054 & 3;
    float _1060 = (*spvDescriptorSet0.vp_c15)._m0[int(_1056)][_1058];
    int _1062 = _917 + 104;
    uint _1064 = uint(int(uint(_1062) >> uint(2)));
    uint _1066 = uint(int(uint(int(_1064)) >> uint(2)));
    int _1068 = int(_1064) & 3;
    float _1070 = (*spvDescriptorSet0.vp_c15)._m0[int(_1066)][_1068];
    int _1072 = int(_1064) + 1;
    uint _1074 = uint(int(uint(_1072) >> uint(2)));
    int _1076 = _1072 & 3;
    float _1078 = (*spvDescriptorSet0.vp_c15)._m0[int(_1074)][_1076];
    float _1080 = _1042;
    int _1082 = as_type<int>(_1060);
    if (!_976)
    {
        float _1084 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1086 = _461 + _1084;
        float _1088 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1090 = _395 + _1088;
        float _1092 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1094 = _1086 * _1086;
        float _1096 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1098 = _401 + _1096;
        float _1100 = fma(_1090, _1090, _1094);
        float _1102 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1104 = fma(_1098, _1098, _1100);
        float _1106 = sqrt(_1104);
        float _1108 = _1092 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1110 = -_461;
        float _1112 = _1110 + _829;
        float _1114 = precise::min(_1106, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1116 = _1114 * _1102;
        float _1118 = -_401;
        float _1120 = _1118 + _1000;
        float _1122 = _1108 * _1116;
        float _1124 = -_395;
        float _1126 = _1124 + _821;
        float _1128 = fma(_1112, _1122, _461);
        float _1130 = fma(_1126, _1122, _395);
        float _1132 = fma(_1120, _1122, _401);
        _1040 = _1128;
        _723 = as_type<int>(_1122);
        _1036 = _1130;
        _1080 = _1132;
    }
    float _1134 = _1040;
    int _1136 = _723;
    float _1138 = _1036;
    float _1140 = _1080;
    float _1142 = _835 * _1060;
    int _1144 = _1136;
    int _1146 = as_type<int>(_1142);
    if (!_966)
    {
        int _1148 = _1012 << 2;
        _1144 = _1148;
    }
    int _1150 = _1144;
    float _1152 = _1134 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_966)
    {
        uint _1154 = uint(int(uint(_1012) >> uint(2)));
        _1082 = int(_1154);
    }
    int _1156 = _1082;
    float _1158 = fma(_395, _1052, _1142);
    if (!_966)
    {
        int _1160 = 12 & _1150;
        _1146 = _1160;
    }
    int _1162 = _1146;
    float _1164 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1152);
    float _1166 = _835 * _938;
    float _1168 = fma(_401, _1070, _1158);
    if (!_966)
    {
        int _1170 = _1156 << 4;
        int _1172 = _1170 + _1162;
        _903 = _1172;
    }
    int _1174 = _903;
    float _1176 = fma(_1140, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1164);
    int _1178 = _917 + 80;
    uint _1180 = uint(int(uint(_1178) >> uint(2)));
    uint _1182 = uint(int(uint(int(_1180)) >> uint(2)));
    int _1184 = int(_1180) & 3;
    float _1186 = (*spvDescriptorSet0.vp_c15)._m0[int(_1182)][_1184];
    int _1188 = int(_1180) + 1;
    uint _1190 = uint(int(uint(_1188) >> uint(2)));
    int _1192 = _1188 & 3;
    float _1194 = (*spvDescriptorSet0.vp_c15)._m0[int(_1190)][_1192];
    float _1196 = _1168 + _1078;
    float _1198 = fma(_395, _930, _1166);
    float _1200 = _1176 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1202 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1204 = 1.0 / _1196;
    float _1206 = _835 * _998;
    float _1208 = _1200 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1210 = _1168;
    float _1212 = _1196;
    if (!_966)
    {
        int _1214 = _1174 + 400;
        uint _1216 = uint(int(uint(_1214) >> uint(2)));
        uint _1218 = uint(int(uint(int(_1216)) >> uint(2)));
        int _1220 = int(_1216) & 3;
        float _1222 = (*spvDescriptorSet0.vp_c15)._m0[int(_1218)][_1220];
        _1210 = _1222;
    }
    float _1224 = _1210;
    float _1226 = fma(_401, _954, _1198);
    float _1228 = fma(_395, _990, _1206);
    float _1230 = -_1208;
    float _1232 = fma(_1230, _1202, 1.0);
    float _1234 = _1134 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1236 = _1226 + _962;
    float _1238 = _1134 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1240 = fma(_401, _1022, _1228);
    int _1242 = _917 + 88;
    uint _1244 = uint(int(uint(_1242) >> uint(2)));
    uint _1246 = uint(int(uint(int(_1244)) >> uint(2)));
    int _1248 = int(_1244) & 3;
    float _1250 = (*spvDescriptorSet0.vp_c15)._m0[int(_1246)][_1248];
    int _1252 = int(_1244) + 1;
    uint _1254 = uint(int(uint(_1252) >> uint(2)));
    int _1256 = _1252 & 3;
    float _1258 = (*spvDescriptorSet0.vp_c15)._m0[int(_1254)][_1256];
    float _1260 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1234);
    float _1262 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1238);
    float _1264 = _1134 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1266 = log2(_1232);
    float _1268 = _1236 * _1204;
    float _1270 = fma(_1140, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1260);
    float _1272 = _1240 + _1030;
    float _1274 = fma(_1140, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1262);
    float _1276 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1264);
    bool _1278 = _1268 >= 0.0;
    float _1280 = _1270 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1282 = _1272 * _1204;
    float _1284 = _1274 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    bool _1286 = _1268 <= 1.0;
    bool _1288 = _1286 && _1278;
    float _1290 = _1280 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1292 = fma(_1140, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1276);
    float _1294 = _1260;
    if (!_966)
    {
        float _1296 = floor(_859);
        _1294 = _1296;
    }
    float _1298 = _1294;
    bool _1300 = _1282 >= 0.0;
    bool _1302 = _1300 && _1288;
    float _1304 = fma(_1284, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1290);
    float _1306 = _1292 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1308 = _1280 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    bool _1310 = _1282 <= 1.0;
    bool _1312 = _1310 && _1302;
    float _1314 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1304);
    float _1316 = _1266 * 0.693147182464599609375;
    float _1318 = as_type<float>(_1174);
    if (!_966)
    {
        float _1320 = floor(_857);
        _1318 = _1320;
    }
    float _1322 = _1318;
    float _1324 = fma(_1284, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1308);
    float _1326 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1314);
    float _1328 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1324);
    float _1330 = _835 * _1194;
    float _1332 = 1.0 / _1326;
    float _1334 = _1280 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1336 = _1328;
    float _1338 = _1326;
    if (_1312)
    {
        float _1340 = float(_909);
        _1006 = _1340;
    }
    float _1342 = _1006;
    float _1344 = fma(_395, _1186, _1330);
    float _1346 = _1298;
    if (!_966)
    {
        float _1348 = -_1298;
        float _1350 = _859 + _1348;
        _1212 = _1350;
    }
    float _1352 = _1212;
    float _1354 = fma(_1284, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1334);
    float _1356 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1328);
    float _1358 = _1224;
    if (!_966)
    {
        float _1360 = rint(_1224);
        float _1362 = precise::max(_1360, 0.0);
        uint _1364 = uint(_1362);
        uint _1366 = clamp(_1364, 0u, 65535u);
        _1358 = as_type<float>(_1366);
    }
    float _1368 = _1358;
    float _1370 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1354);
    if (!_966)
    {
        float _1372 = -_1322;
        float _1374 = _857 + _1372;
        _1346 = _1374;
    }
    float _1376 = _1346;
    float _1378 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1370);
    float _1380 = fma(_401, _1250, _1344);
    float _1382 = _1344;
    if (_1312)
    {
        float _1384 = rint(_1342);
        float _1386 = precise::max(_1384, 0.0);
        uint _1388 = uint(_1386);
        uint _1390 = clamp(_1388, 0u, 65535u);
        _1382 = as_type<float>(_1390);
    }
    float _1392 = _1382;
    float _1394 = _1378 * _1332;
    float _1396 = _1380 + _1258;
    float _1398 = _1356 * _1332;
    float _1400 = fma(_1394, 0.5, 0.5);
    float _1402 = _1396 * _1204;
    float _1404 = fma(_1398, -0.5, 0.5);
    float _1406 = _1316 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1408 = _1376;
    float _1410 = _1406;
    float _1412 = _1368;
    if (!_966)
    {
        float3 _4672 = float3(_1376, _1352, float(as_type<int>(_1368)));
        float3 _4676 = select(_4672, float3(0.0), isnan(_4672));
        float _1414 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4676.xy, uint(rint(_4676.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4676.xy, uint(rint(_4676.z)), level(0.0)).x;
        _1408 = _1414;
    }
    float _1416 = _1408;
    float _1418 = _1282;
    if (_1312)
    {
        float3 _4691 = float3(_1268, _1282, float(as_type<int>(_1392)));
        float3 _4693 = select(_4691, float3(0.0), isnan(_4691));
        float _1420 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _4693.xy, uint(rint(_4693.z)), _1402, level(0.0));
        _1418 = _1420;
    }
    float _1422 = _1418;
    float3 _4703 = float3(_1400, _1404, _1406);
    float _1424 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4703, float3(0.0), isnan(_4703)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4703, float3(0.0), isnan(_4703)), level(0.0)).x;
    float3 _4712 = float3(_1400, _1404, _1406);
    float4 _1427 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4712, float3(0.0), isnan(_4712)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4712, float3(0.0), isnan(_4712)), level(0.0)).xyzw;
    float _1429 = _1427.x;
    float _1431 = _1427.y;
    float _1433 = _1427.z;
    float _1435 = _1427.w;
    bool _1437 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1439 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1441 = _1437 || _1439;
    bool _1443 = isnan(0.5);
    bool _1445 = _1441 || _1443;
    float _1447 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    if (_1445)
    {
        _1447 = 1.0;
    }
    float _1449 = _1447;
    float _1451 = _1449;
    if (_1445)
    {
        _1336 = 1.0;
    }
    float _1453 = _1336;
    float _1455 = _1453;
    float _1457 = _1422;
    if (!_1445)
    {
        float _1459 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1461 = _1459 * 0.15915493667125701904296875;
        float _1463 = _1461 * 6.283185482025146484375;
        float _1465 = cos(_1463);
        float _1467 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1469 = _1467 * 0.15915493667125701904296875;
        float _1471 = _1461 * 6.283185482025146484375;
        float _1473 = sin(_1471);
        float _1475 = 1.0 / _1465;
        float _1477 = _1469 * 6.283185482025146484375;
        float _1479 = cos(_1477);
        float _1481 = _1473 * _1475;
        float _1483 = _1469 * 6.283185482025146484375;
        float _1485 = sin(_1483);
        float _1487 = _1479 * _1481;
        float _1489 = 1.0 / _1487;
        float _1491 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1493 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1491;
        float _1495 = 1.0 / _1493;
        float _1497 = _1485 * _1489;
        float _1499 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1501 = fma(_883, _1497, _1499);
        float _1503 = _1501 * _1495;
        float _1505 = precise::clamp(_1503, 0.0, 1.0);
        _1410 = _1475;
        _1412 = _1493;
        _1455 = _1505;
    }
    float _1507 = _1410;
    float _1509 = _1412;
    float _1511 = _1455;
    float _1513 = _1507;
    float _1515 = _1509;
    if (!_1445)
    {
        float _1517 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1519 = _1517 * 0.15915493667125701904296875;
        float _1521 = _1519 * 6.283185482025146484375;
        float _1523 = cos(_1521);
        float _1525 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1527 = _1525 * 0.15915493667125701904296875;
        float _1529 = _1519 * 6.283185482025146484375;
        float _1531 = sin(_1529);
        float _1533 = 1.0 / _1523;
        float _1535 = _1527 * 6.283185482025146484375;
        float _1537 = cos(_1535);
        float _1539 = _1531 * _1533;
        float _1541 = _1527 * 6.283185482025146484375;
        float _1543 = sin(_1541);
        float _1545 = _1537 * _1539;
        float _1547 = 1.0 / _1545;
        float _1549 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1551 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1549;
        float _1553 = 1.0 / _1551;
        float _1555 = _1543 * _1547;
        float _1557 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1559 = fma(_883, _1555, _1557);
        float _1561 = _1559 * _1553;
        float _1563 = precise::clamp(_1561, 0.0, 1.0);
        float _1565 = -_1563;
        float _1567 = _1565 + 1.0;
        _1513 = _1547;
        _1515 = _1527;
        _1451 = _1567;
    }
    float _1569 = _1513;
    float _1571 = _1515;
    float _1573 = _1451;
    float _1575 = _1571;
    float _1577 = _1569;
    if (_966)
    {
        _1575 = 1.0;
    }
    float _1579 = _1575;
    float _1581 = _1579;
    if (!_966)
    {
        int _1583 = _1012 << 4;
        int _1585 = _1583 + 2048;
        uint _1587 = uint(int(uint(_1585) >> uint(2)));
        uint _1589 = uint(int(uint(int(_1587)) >> uint(2)));
        int _1591 = int(_1587) & 3;
        float _1593 = (*spvDescriptorSet0.vp_c15)._m0[int(_1589)][_1591];
        int _1595 = int(_1587) + 1;
        uint _1597 = uint(int(uint(_1595) >> uint(2)));
        int _1599 = _1595 & 3;
        float _1601 = (*spvDescriptorSet0.vp_c15)._m0[int(_1597)][_1599];
        int _1603 = _1585 + 8;
        uint _1605 = uint(int(uint(_1603) >> uint(2)));
        uint _1607 = uint(int(uint(int(_1605)) >> uint(2)));
        int _1609 = int(_1605) & 3;
        float _1611 = (*spvDescriptorSet0.vp_c15)._m0[int(_1607)][_1609];
        int _1613 = int(_1605) + 1;
        uint _1615 = uint(int(uint(_1613) >> uint(2)));
        int _1617 = _1613 & 3;
        float _1619 = (*spvDescriptorSet0.vp_c15)._m0[int(_1615)][_1617];
        float _1621 = _835 * _1601;
        float _1623 = fma(_395, _1593, _1621);
        float _1625 = fma(_401, _1611, _1623);
        float _1627 = _1625 + _1619;
        float _1629 = precise::clamp(_1627, 0.0, 1.0);
        float _1631 = -_1629;
        float _1633 = _1631 + _1416;
        float _1635 = fma(_1633, 500.0, 1.5);
        float _1637 = exp2(_1635);
        float _1639 = 0.0 + _1637;
        float _1641 = precise::clamp(_1639, 0.0, 1.0);
        _1032 = as_type<float>(_1585);
        _1581 = _1641;
    }
    float _1643 = _1032;
    float _1645 = _1581;
    float _1647 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1649 = _1134 + _1647;
    float _1651 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1653 = _1138 + _1651;
    float _1655 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1657 = _1140 + _1655;
    float _1659 = _1649 * _1649;
    float _1661 = fma(_1653, _1653, _1659);
    float _1663 = fma(_1657, _1657, _1661);
    float _1665 = rsqrt(_1663);
    float _1667 = _1665 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1669 = _1653 * _1667;
    float _1671 = _1657 * _1667;
    float _1673 = _1669 * _1669;
    float _1675 = _1671 * _1671;
    float _1677 = _1673 + _1675;
    float _1679 = sqrt(_1677);
    bool _1681 = _1679 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1683 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1685 = _1679 + _1683;
    float _1687 = _1657;
    float _1689 = _1659;
    float _1691 = _1685;
    float _1693 = _1667;
    if (_1681)
    {
        float _1695 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1687 = _1695;
    }
    float _1697 = _1687;
    if (_1681)
    {
        float _1699 = rsqrt(_1677);
        _1689 = _1699;
    }
    float _1701 = _1689;
    float _1703 = _1701;
    if (_1681)
    {
        float _1705 = _1685 * _1697;
        _1691 = _1705;
    }
    float _1707 = _1691;
    if (_1681)
    {
        float _1709 = _1707 * 0.15915493667125701904296875;
        _1577 = _1709;
    }
    float _1711 = _1577;
    float _1713 = _1665;
    if (_1681)
    {
        float _1715 = _1711 * 6.283185482025146484375;
        float _1717 = sin(_1715);
        _1713 = _1717;
    }
    float _1719 = _1713;
    float _1721 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1723 = precise::max(0.0, _1721);
    float _1725 = _1643;
    float _1727 = _1723;
    float _1729 = _1721;
    if (_1681)
    {
        float _1731 = _1711 * 6.283185482025146484375;
        float _1733 = cos(_1731);
        _1725 = _1733;
    }
    float _1735 = _1725;
    float _1737 = -_1667;
    float _1739 = -_1723;
    float _1741 = fma(_1649, _1737, _1739);
    float _1743 = _1741;
    if (_1681)
    {
        float _1745 = _1741 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1727 = _1745;
    }
    float _1747 = _1727;
    float _1749 = _1719;
    float _1751 = _1747;
    if (_1681)
    {
        float _1753 = fma(_1719, _1747, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1749 = _1753;
    }
    float _1755 = _1749;
    float _1757 = _1755;
    if (!_1681)
    {
        _1751 = _1671;
    }
    float _1759 = _1751;
    float _1761 = _1759;
    float _1763 = _1735;
    if (_1681)
    {
        float _1765 = _1735 + (-1.0);
        _1729 = _1765;
    }
    float _1767 = _1729;
    float _1769 = _1767;
    if (_1681)
    {
        float _1771 = _1701 * _1755;
        _1693 = _1771;
    }
    float _1773 = _1693;
    if (!_1681)
    {
        _1757 = _1669;
    }
    float _1775 = _1757;
    float _1777 = _1775;
    if (_1681)
    {
        float _1779 = _1767 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1769 = _1779;
    }
    float _1781 = _1769;
    if (_1681)
    {
        float _1783 = _1669 * _1773;
        _1777 = _1783;
    }
    float _1785 = _1777;
    if (!_1681)
    {
        _1703 = _1673;
    }
    float _1787 = _1703;
    float _1789 = _1787;
    if (_1681)
    {
        float _1791 = _1671 * _1773;
        _1761 = _1791;
    }
    float _1793 = _1761;
    if (_1681)
    {
        float _1795 = fma(_1741, _1735, _1781);
        _1743 = _1795;
    }
    float _1797 = _1743;
    if (_1681)
    {
        float _1799 = _1785 * _1785;
        _1789 = _1799;
    }
    float _1801 = _1789;
    if (!_1681)
    {
        _1763 = _1675;
    }
    float _1803 = _1763;
    float _1805 = _1803;
    if (_1681)
    {
        float _1807 = _1793 * _1793;
        _1805 = _1807;
    }
    float _1809 = _1805;
    float _1811 = sqrt(_1663);
    float _1813 = fma(_1797, _1797, _1801);
    float _1815 = _1813 + _1809;
    float _1817 = rsqrt(_1815);
    float _1819 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1821 = fma(_1811, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1819);
    float _1823 = precise::clamp(_1821, 0.0, 1.0);
    float _1825 = -_1823;
    float _1827 = _1825 + 1.0;
    float _1829 = _1817 * _1785;
    float _1831 = _1817 * _1797;
    float _1833 = _1817 * _1793;
    float _1835 = abs(_1827);
    float _1837 = log2(_1835);
    float _1839 = _1829 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1841 = -_1839;
    float _1843 = fma(_1831, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1841);
    float _1845 = -_1833;
    float _1847 = fma(_1845, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1843);
    float _1849 = fma(_1847, -0.5, 0.5);
    float _1851 = fma(_1847, 0.5, 0.5);
    float _1853 = _1837 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1855 = fma(_1851, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1857 = sqrt(_1849);
    float _1859 = fma(_1851, _1855, -0.212114393711090087890625);
    float _1861 = _1831 + 1.0;
    float _1863 = fma(_1851, _1859, 1.570728778839111328125);
    float _1865 = exp2(_1853);
    float _1867 = _1857 * 0.636619746685028076171875;
    float _1869 = -_1831;
    float _1871 = fma(_1865, _1861, _1869);
    float _1873 = -_1863;
    float _1875 = fma(_1867, _1873, 1.0);
    float _1877 = fma(_1871, 0.5, 0.5);
    float2 _5363 = float2(_1875, _1877);
    float3 _1881 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5363, float2(0.0), isnan(_5363)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5363, float2(0.0), isnan(_5363)), level(0.0)).xyz;
    float _1883 = _1881.x;
    float _1885 = _1881.y;
    float _1887 = _1881.z;
    float _1889 = abs(_883);
    float _1891 = log2(_1889);
    float _1893 = _1280 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1895 = -_807;
    float _1897 = _1895 + 1.0;
    out.m_84.x = _1138;
    out.m_84.y = _1134;
    out.m_84.z = _1140;
    float _1899 = fma(_1284, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1893);
    float _1901 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1899);
    bool _1903 = _883 <= 8000.0;
    bool _1905 = isnan(_883);
    bool _1907 = _1903 || _1905;
    bool _1909 = isnan(8000.0);
    bool _1911 = _1907 || _1909;
    float _1913 = float(_1911);
    float _1915 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1901);
    float _1917 = _1891 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1919 = _1915 + _1326;
    out.gl_Position.x = _1378;
    out.gl_Position.y = _1356;
    out.gl_Position.z = _1915;
    out.gl_Position.w = _1326;
    float _1921 = _1919 * 0.5;
    float _1923 = exp2(_1917);
    out.m_86.z = _1921;
    out.m_86.w = _1326;
    float _1925 = fma(_1923, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1927 = precise::clamp(_1925, 0.0, 1.0);
    float _1929 = _1837 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1931 = _1837;
    if (!_1312)
    {
        _1931 = 1.0;
    }
    float _1933 = _1931;
    float _1935 = fma(_1927, -2.0, 3.0);
    float _1937 = _1927 * _1927;
    float _1939 = _1933;
    if (_1312)
    {
        bool _1941 = _1422 >= _1402;
        bool _1943 = isnan(_1422);
        bool _1945 = _1941 || _1943;
        bool _1947 = isnan(_1402);
        bool _1949 = _1945 || _1947;
        float _1951 = float(_1949);
        _1939 = _1951;
    }
    float _1953 = _1939;
    float _1955 = exp2(_1929);
    bool _1957 = _1811 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1959 = isnan(_1811);
    bool _1961 = _1957 || _1959;
    bool _1963 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1965 = _1961 || _1963;
    float _1967 = _1937 * _1935;
    float _1969 = _1953 * _1645;
    float _1971 = -_1967;
    float _1973 = _1971 + 1.0;
    float _1975 = fma(_1973, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1967);
    float _1977 = _1913 * _1975;
    if (!_1965)
    {
        _1457 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1979 = _1457;
    float _1981 = -_1955;
    float _1983 = _1981 + 1.0;
    float _1985 = _1979;
    float _1987 = _1979;
    if (!_1965)
    {
        _1338 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1989 = _1338;
    float _1991 = _1977 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1993 = _1983 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1995 = _1897 * _1991;
    float _1997 = precise::clamp(_1995, 0.0, 1.0);
    float _1999 = _1993 * _1424;
    float _2001 = -_1993;
    float _2003 = _2001 + 1.0;
    float _2005 = -_1997;
    float _2007 = fma(_2005, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2009 = _1993;
    float _2011 = _2003;
    float _2013 = _1989;
    float _2015 = _1989;
    if (!_1965)
    {
        _2009 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2017 = _2009;
    float _2019 = _1435 * _1999;
    float _2021 = _1435 * _2003;
    float _2023 = -_1969;
    float _2025 = fma(_2023, _2007, 1.0);
    float _2027 = precise::clamp(_2025, 0.0, 1.0);
    float _2029 = _2019;
    float _2031 = _2017;
    float _2033 = _2017;
    if (!_1965)
    {
        _2011 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2035 = _2011;
    float _2037 = _2027 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2039 = _1511 * _1573;
    out.m_88.x = _2037;
    float _2041 = _2039 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2043 = _2039;
    float _2045 = _2035;
    float _2047 = _2035;
    if (!_1965)
    {
        _2043 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2049 = _2043;
    float _2051 = _1887 * _1999;
    float _2053 = fma(_1883, _2019, _1429);
    float _2055 = fma(_1885, _2019, _1431);
    float _2057 = _2049;
    float _2059 = _2049;
    if (!_1965)
    {
        _2029 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2061 = _2029;
    float _2063 = fma(_1435, _2051, _1433);
    out.m_90.x = _2053;
    out.m_90.y = _2055;
    out.m_90.z = _2063;
    out.m_90.w = _2021;
    bool _2065 = !_1965;
    float _2067 = _2061;
    float _2069 = _2061;
    if (!_2065)
    {
        bool _2071 = _1811 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2073 = isnan(_1811);
        bool _2075 = _2071 || _2073;
        bool _2077 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2079 = _2075 || _2077;
        if (!_2079)
        {
            float _2081 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2083 = _1811 + _2081;
            float _2085 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2087 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2085;
            float _2089 = 1.0 / _2087;
            float _2091 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2093 = _2091 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2095 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2097 = _2095 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2099 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2101 = _2099 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2103 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2105 = _2103 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2107 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2109 = _2107 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2111 = _2083 * _2089;
            float _2113 = precise::clamp(_2111, 0.0, 1.0);
            float _2115 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2117 = _2115 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2119 = fma(_2113, _2093, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2121 = fma(_2113, _2117, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2123 = fma(_2113, _2097, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2125 = fma(_2113, _2101, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2127 = fma(_2113, _2105, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2129 = fma(_2113, _2109, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2015 = _2121;
            _2047 = _2127;
            _1987 = _2119;
            _2033 = _2125;
            _2069 = _2123;
            _2059 = _2129;
            _2131 = true;
        }
        else
        {
            bool _2133 = _1811 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2135 = isnan(_1811);
            bool _2137 = _2133 || _2135;
            bool _2139 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2141 = _2137 || _2139;
            if (!_2141)
            {
                _1985 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2143 = _1985;
            _1987 = _2143;
            if (!_2141)
            {
                _2013 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2145 = _2013;
            _2015 = _2145;
            if (!_2141)
            {
                _2067 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2147 = _2067;
            _2069 = _2147;
            if (!_2141)
            {
                _2031 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2149 = _2031;
            _2033 = _2149;
            if (!_2141)
            {
                _2045 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2151 = _2045;
            _2047 = _2151;
            if (!_2141)
            {
                _2057 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2153 = _2057;
            bool _2155 = !_2141;
            _2059 = _2153;
            if (!_2155)
            {
                bool _2157 = _1811 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2159 = isnan(_1811);
                bool _2161 = _2157 || _2159;
                bool _2163 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2165 = _2161 || _2163;
                if (!_2165)
                {
                    float _2167 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2169 = _1811 + _2167;
                    float _2171 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2173 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2171;
                    float _2175 = 1.0 / _2173;
                    float _2177 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2179 = _2177 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2181 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2183 = _2181 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2185 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2187 = _2185 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2189 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2191 = _2189 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2193 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2195 = _2193 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2197 = _2169 * _2175;
                    float _2199 = precise::clamp(_2197, 0.0, 1.0);
                    float _2201 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2203 = _2201 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2205 = fma(_2199, _2179, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2207 = fma(_2199, _2203, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2209 = fma(_2199, _2183, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2211 = fma(_2199, _2187, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2213 = fma(_2199, _2191, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2215 = fma(_2199, _2195, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2015 = _2207;
                    _2047 = _2213;
                    _1987 = _2205;
                    _2033 = _2211;
                    _2069 = _2209;
                    _2059 = _2215;
                    _2131 = true;
                }
                else
                {
                    _2015 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2047 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1987 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2033 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2069 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2059 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2131 = false;
    float _2217 = _2015;
    float _2219 = _2047;
    float _2221 = _1987;
    float _2223 = _2033;
    float _2225 = _2069;
    float _2227 = _2059;
    float _2229 = fma(_691, -0.5, 0.5);
    float _2231 = precise::clamp(_2229, 0.0, 1.0);
    float _2233 = -_2217;
    float _2235 = _2233 + _2219;
    float _2237 = _2041 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2239 = -_2221;
    float _2241 = _2239 + _2223;
    out.m_92.x = 0.0;
    float _2243 = fma(_2231, _2235, _2217);
    float _2245 = fma(_2231, _2241, _2221);
    out.m_61.x = _2237;
    float _2247 = -_2225;
    float _2249 = _2247 + _2227;
    float _2251 = _2243 * 0.586610972881317138671875;
    bool _2253 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2255 = fma(_2231, _2249, _2225);
    float _2257 = fma(_2245, 0.298911988735198974609375, _2251);
    bool _2259 = _1511 > 0.0;
    bool _2261 = isnan(_1511);
    bool _2263 = _2259 || _2261;
    bool _2265 = isnan(0.0);
    bool _2267 = _2263 || _2265;
    float _2269 = fma(_2255, 0.114477999508380889892578125, _2257);
    bool _2271 = _1573 <= 0.0;
    bool _2273 = !_2267;
    bool _2275 = _2271 || _2273;
    float _2277 = -_2269;
    float _2279 = _2245 + _2277;
    float _2281 = -_2269;
    float _2283 = _2243 + _2281;
    float _2285 = -_2269;
    float _2287 = _2255 + _2285;
    float _2289 = fma(_2279, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2269);
    float _2291 = fma(_2283, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2269);
    float _2293 = fma(_2287, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2269);
    bool _2295 = !_2253;
    if (!_2295)
    {
        float _2297 = -_1134;
        float _2299 = _2297 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2301 = -_1138;
        float _2303 = _2301 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2305 = -_1140;
        float _2307 = _2305 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2309 = _2299 * _2299;
        float _2311 = fma(_2303, _2303, _2309);
        float _2313 = fma(_2307, _2307, _2311);
        float _2315 = sqrt(_2313);
        float _2317 = rsqrt(_2313);
        float _2319 = -_2315;
        float _2321 = _2319 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2323 = _2321 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2325 = precise::clamp(_2323, 0.0, 1.0);
        float _2327 = _2303 * _2317;
        float _2329 = _2299 * _2317;
        float _2331 = abs(_2325);
        float _2333 = log2(_2331);
        float _2335 = _2307 * _2317;
        float _2337 = _2327 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2339 = _691 * _2329;
        float _2341 = -_2329;
        float _2343 = -_2337;
        float _2345 = fma(_2341, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2343);
        float _2347 = fma(_689, _2327, _2339);
        float _2349 = -_2335;
        float _2351 = fma(_2349, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2345);
        float _2353 = fma(_709, _2335, _2347);
        float _2355 = precise::clamp(_2353, 0.0, 1.0);
        float _2357 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2359 = _2351 + _2357;
        float _2361 = _2333 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2363 = _2359 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2365 = precise::clamp(_2363, 0.0, 1.0);
        float _2367 = exp2(_2361);
        float _2369 = _2367 * _2365;
        float _2371 = _2355 * _2369;
        float _2373 = _2371 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2375 = _2371 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2377 = _2371 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_92.x = _2373;
        out.m_92.y = _2375;
        out.m_92.z = _2377;
    }
    out.m_94.x = _2289;
    out.m_94.y = _2291;
    out.m_94.z = _2293;
    if (!_2275)
    {
        return out;
    }
    out.m_61.x = 0.0;
    float _2379 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2379;
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
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2131 = false;
    bool _759 = false;
    bool _189 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _108 = in.m_58.w;
    float _110 = trunc(_108);
    int _113 = int(_110);
    bool _117 = _113 >= 1;
    float _119 = 0.0;
    if (!_117)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _119;
    float _123 = _121;
    if (!_117)
    {
        out.m_61.x = 0.0;
    }
    int _125 = 0;
    if (!_117)
    {
        float _127 = _121 * 5.0;
        _125 = as_type<int>(_127);
    }
    int _129 = _125;
    int _131 = _129;
    if (!_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2436 = as_type<float>(_129);
        out.gl_Position.z = _2436;
    }
    if (!_117)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _133 = in.m_63.w;
    bool _135 = _133 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = isnan(_133);
    bool _139 = _135 || _137;
    bool _141 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _143 = _139 || _141;
    float _145 = -_133;
    float _147 = _145 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _149 = 0.0;
    if (_143)
    {
        float _151 = float(_113);
        _149 = _151;
    }
    float _153 = _149;
    bool _155 = _147 >= _153;
    bool _157 = !_143;
    bool _159 = _155 || _157;
    if (_159)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _123;
    if (_159)
    {
        out.m_61.x = 0.0;
    }
    if (_159)
    {
        float _163 = _161 * 5.0;
        _131 = as_type<int>(_163);
    }
    int _165 = _131;
    if (_159)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2504 = as_type<float>(_165);
        out.gl_Position.z = _2504;
    }
    if (_159)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _167 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _169 = !_167;
    float _187;
    if (!_169)
    {
        float _171 = in.m_65.x;
        float _173 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _175 = _171 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _177 = fma(_175, (*spvDescriptorSet0.vp_c9)._m0[12].x, _147);
        float _179 = _177 * _173;
        float _181 = floor(_179);
        float _183 = -_181;
        float _185 = _179 + _183;
        _187 = _185;
        _189 = true;
    }
    else
    {
        float _191 = float(_113);
        float _193 = 1.0 / _191;
        float _195 = _147 * _193;
        _187 = _195;
    }
    _189 = false;
    float _197 = _187;
    float _199 = as_type<float>(int(gl_VertexIndex));
    float _201 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _203 = _197 + _201;
    float _205 = in.m_65.x;
    float _207 = in.m_65.y;
    float _209 = in.m_65.z;
    float _211 = in.m_65.w;
    float _213 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _215 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _213;
    float _217 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _219 = 1.0 / _215;
    float _221 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _217);
    bool _223 = _197 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _225 = isnan(_197);
    bool _227 = _223 || _225;
    bool _229 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _231 = _227 || _229;
    float _233 = float(_231);
    bool _235 = _197 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _237 = isnan(_197);
    bool _239 = _235 || _237;
    bool _241 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _243 = _239 || _241;
    float _245 = float(_243);
    float _247 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _221);
    float _249 = -_233;
    float _251 = _249 + 1.0;
    float _253 = sqrt(_247);
    float _255 = _245 * _251;
    int _257 = as_type<int>(_199) & 1;
    bool _259 = _257 != 0;
    int _261 = as_type<int>(_199) & 2;
    bool _263 = _261 != 0;
    float _265 = -_245;
    float _267 = _265 + 1.0;
    float _269 = in.m_58.x;
    float _271 = in.m_58.y;
    float _273 = in.m_58.z;
    float _275 = _203 * _219;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _279 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _277;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _283 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _281;
    float _285 = rsqrt(_247);
    float _287 = in.m_70.x;
    float _289 = in.m_70.y;
    float _291 = fma(_279, _275, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _293 = fma(_283, _275, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _295 = _291 * _255;
    float _297 = precise::max(_253, 2.0);
    float _299 = _293 * _255;
    bool _301 = !_263;
    float _303 = _301 ? (-0.5) : 0.5;
    float _305 = fma(_267, (*spvDescriptorSet0.vp_c9)._m0[143].x, _295);
    bool _307 = !_259;
    float _309 = _307 ? (-0.5) : 0.5;
    float _311 = fma(_267, (*spvDescriptorSet0.vp_c9)._m0[143].y, _299);
    float _313 = precise::min(_297, 15.0);
    float _315 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[144].x, _305);
    bool _317 = _205 > 0.5;
    float _319 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[144].y, _311);
    bool _321 = _209 > 0.5;
    float _323 = fma(_313, 0.061538465321063995361328125, -0.12307693064212799072265625);
    float _325 = -_271;
    float _327 = _303 + _325;
    float _329 = -_269;
    float _331 = _309 + _329;
    float _333 = -_285;
    float _335 = fma(_333, _273, _273);
    float _337 = _271 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _339 = -_327;
    float _341 = fma(_327, _285, _339);
    float _343 = -_331;
    float _345 = fma(_331, _285, _343);
    float _347 = _319 * _289;
    float _349 = _315 * _287;
    float _351 = fma(_323, _341, _327);
    float _353 = fma(_323, _345, _331);
    float _355 = _347 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _357 = _349 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _359 = _351 + _271;
    float _361 = _353 + _269;
    float _363 = _323 * _335;
    float _365 = fma(_269, (*spvDescriptorSet0.vp_c10)._m0[4].x, _337);
    float _367 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _359);
    float _369 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _361);
    float _371 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _363);
    float _373 = fma(_273, (*spvDescriptorSet0.vp_c10)._m0[4].z, _365);
    float _375 = _355 * _367;
    float _377 = _357 * _369;
    float _379 = _271 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _381 = _375 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _383 = _375 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _385 = fma(_269, (*spvDescriptorSet0.vp_c10)._m0[6].x, _379);
    float _387 = _271 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _389 = fma(_377, (*spvDescriptorSet0.vp_c8)._m0[24].x, _381);
    float _391 = fma(_377, (*spvDescriptorSet0.vp_c8)._m0[26].x, _383);
    float _393 = fma(_273, (*spvDescriptorSet0.vp_c10)._m0[6].z, _385);
    float _395 = _373 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _397 = fma(_371, (*spvDescriptorSet0.vp_c8)._m0[24].z, _389);
    float _399 = fma(_371, (*spvDescriptorSet0.vp_c8)._m0[26].z, _391);
    float _401 = _393 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _403 = _397 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _405 = _399 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _407 = _375 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _409 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _411 = _409 != 0;
    float _413 = _395 + _403;
    float _415 = _401 + _405;
    float _417 = fma(_269, (*spvDescriptorSet0.vp_c10)._m0[5].x, _387);
    float _419 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _421 = _413 + _419;
    float _423 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _425 = _415 + _423;
    float _427 = fma(_377, (*spvDescriptorSet0.vp_c8)._m0[25].x, _407);
    float _429 = _421 * _421;
    float _431 = _425 * _425;
    float _433 = -_309;
    float _435 = _317 ? _433 : _309;
    out.m_72.x = (*spvDescriptorSet0.vp_c8)._m0[24].x;
    out.m_72.y = (*spvDescriptorSet0.vp_c8)._m0[25].x;
    out.m_72.z = (*spvDescriptorSet0.vp_c8)._m0[26].x;
    bool _437 = _211 > 0.5;
    float _439 = _429 + _431;
    int _441 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _443 = _441 != 0;
    float _445 = fma(_273, (*spvDescriptorSet0.vp_c10)._m0[5].z, _417);
    int _447 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _449 = _447 != 0;
    float _451 = sqrt(_439);
    int _453 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _455 = _453 != 0;
    float _457 = fma(_371, (*spvDescriptorSet0.vp_c8)._m0[25].z, _427);
    bool _459 = _207 > 0.5;
    float _461 = _445 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _463 = -_309;
    int _465 = _321 ? as_type<int>(_463) : as_type<int>(_309);
    float _467 = _457 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _469 = !_411;
    float _471 = _469 ? _309 : _435;
    float _473 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _475 = -_303;
    int _477 = _459 ? as_type<int>(_475) : as_type<int>(_303);
    float _479 = _461 + _467;
    bool _481 = !_449;
    float _483 = _481 ? _309 : as_type<float>(_465);
    float _485 = _359 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _487 = -_303;
    int _489 = _437 ? as_type<int>(_487) : as_type<int>(_303);
    float _491 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _493 = _451 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _495 = fma(_363, (*spvDescriptorSet0.vp_c9)._m0[17].y, 1.0);
    bool _497 = !_443;
    float _499 = _497 ? _303 : as_type<float>(_477);
    bool _501 = !_455;
    float _503 = _501 ? _303 : as_type<float>(_489);
    float _505 = _485 * _485;
    float _507 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _509 = _467;
    float _511 = _413;
    float _513 = _377;
    float _515 = _435;
    float _517 = _415;
    if (!_493)
    {
        _509 = _413;
    }
    float _519 = _509;
    float _521 = _519;
    if (!_493)
    {
        _511 = _415;
    }
    float _523 = _511;
    float _525 = _523;
    if (!_493)
    {
        _513 = _431;
    }
    float _527 = _513;
    float _529 = _527;
    if (!_493)
    {
        _515 = _429;
    }
    float _531 = _515;
    float _533 = _531;
    if (!_493)
    {
        _517 = _479;
    }
    float _535 = _517;
    bool _537 = !_493;
    float _539 = _535;
    if (!_537)
    {
        float _541 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _543 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _545 = _451 + _543;
        float _547 = rsqrt(_439);
        float _549 = _545 * _541;
        float _551 = _479 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _553 = _549 * 0.15915493667125701904296875;
        float _555 = _553 * 6.283185482025146484375;
        float _557 = sin(_555);
        float _559 = _553 * 6.283185482025146484375;
        float _561 = cos(_559);
        float _563 = fma(_557, _551, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _565 = _547 * _563;
        float _567 = _561 + (-1.0);
        float _569 = fma(_421, _565, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _571 = fma(_425, _565, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _573 = _567 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _575 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _577 = _569 + _575;
        float _579 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _581 = _571 + _579;
        float _583 = fma(_479, _561, _573);
        float _585 = _577 * _577;
        float _587 = _581 * _581;
        _539 = _583;
        _533 = _585;
        _529 = _587;
        _521 = _569;
        _525 = _571;
    }
    float _589 = _539;
    float _591 = _533;
    float _593 = _529;
    float _595 = _521;
    float _597 = _525;
    float _599 = fma(_495, _495, _505);
    float _601 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _603 = _361 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _605 = _485 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _607 = _485 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _609 = _485 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _611 = _471 + 0.5;
    float _613 = _483 + 0.5;
    float _615 = fma(_603, (*spvDescriptorSet0.vp_c8)._m0[24].x, _605);
    float _617 = rsqrt(_599);
    float _619 = fma(_603, (*spvDescriptorSet0.vp_c8)._m0[25].x, _607);
    float _621 = fma(_603, (*spvDescriptorSet0.vp_c8)._m0[26].x, _609);
    float _623 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _625 = _589 + _623;
    float _627 = _611 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _629 = _613 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _631 = -_503;
    float _633 = _631 + 0.5;
    float _635 = -_499;
    float _637 = _635 + 0.5;
    float _639 = fma(_625, _625, _591);
    float _641 = _627 * _473;
    float _643 = _629 * _507;
    float _645 = _633 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _647 = _637 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _649 = _639 + _593;
    float _651 = _645 * _601;
    float _653 = _485 * _617;
    float _655 = _495 * _617;
    float _657 = sqrt(_649);
    float _659 = -(*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _661 = _653 * _659;
    float _663 = -(*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _665 = _653 * _663;
    float _667 = -(*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _669 = _653 * _667;
    float _671 = fma(_655, (*spvDescriptorSet0.vp_c8)._m0[24].y, _661);
    float _673 = fma(_655, (*spvDescriptorSet0.vp_c8)._m0[25].y, _665);
    float _675 = fma(_655, (*spvDescriptorSet0.vp_c8)._m0[26].y, _669);
    float _677 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _679 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _681 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _683 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _685 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _687 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _689 = fma(_495, (*spvDescriptorSet0.vp_c8)._m0[24].z, _615);
    float _691 = fma(_495, (*spvDescriptorSet0.vp_c8)._m0[25].z, _619);
    float _693 = _647 * _491;
    float _695 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _697 = _677 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _699 = _679 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _701 = _681 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _703 = _683 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _705 = _685 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _707 = _687 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _709 = fma(_495, (*spvDescriptorSet0.vp_c8)._m0[26].z, _621);
    out.m_74.x = _697;
    out.m_74.y = _699;
    out.m_74.z = _701;
    out.m_74.w = _695;
    bool _711 = _657 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _713 = isnan(_657);
    bool _715 = _711 || _713;
    bool _717 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _719 = _715 || _717;
    out.m_76.x = _703;
    out.m_76.y = _705;
    out.m_76.z = _707;
    out.m_78.x = _641;
    out.m_78.y = _693;
    out.m_78.z = _643;
    out.m_78.w = _651;
    out.m_80.x = _671;
    out.m_80.y = _673;
    out.m_80.z = _675;
    float _721 = 0.0;
    int _723 = as_type<int>(_597);
    if (!_719)
    {
        _721 = 1.0;
    }
    float _725 = _721;
    out.m_82.x = _689;
    out.m_82.y = _691;
    out.m_82.z = _709;
    bool _727 = !_719;
    float _729 = _725;
    if (!_727)
    {
        bool _731 = _657 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _733 = isnan(_657);
        bool _735 = _731 || _733;
        bool _737 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _739 = _735 || _737;
        if (!_739)
        {
            float _741 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _743 = _657 + _741;
            float _745 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _747 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _745;
            float _749 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _751 = _749 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _753 = 1.0 / _747;
            float _755 = _743 * _753;
            float _757 = fma(_755, _751, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _729 = _757;
            _759 = true;
        }
        else
        {
            bool _761 = _657 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _763 = isnan(_657);
            bool _765 = _761 || _763;
            bool _767 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _769 = _765 || _767;
            if (!_769)
            {
                float _771 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _773 = _657 + _771;
                float _775 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _777 = _775 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _779 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _781 = _779 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _783 = 1.0 / _777;
                float _785 = _773 * _783;
                float _787 = fma(_785, _781, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _729 = _787;
                _759 = true;
            }
            else
            {
                _729 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _759 = false;
    float _789 = _729;
    float _791 = fma(_395, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _793 = fma(_401, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _795 = floor(_791);
    float _797 = floor(_793);
    float _799 = -_795;
    float _801 = _791 + _799;
    float _803 = -_797;
    float _805 = _793 + _803;
    float2 _3637 = float2(_801, _805);
    float _807 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3637, float2(0.0), isnan(_3637)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3637, float2(0.0), isnan(_3637)), level(0.0)).x;
    float _809 = _461 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _811 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _813 = _595 + _811;
    float _815 = fma(_395, (*spvDescriptorSet0.vp_c8)._m0[11].x, _809);
    float _817 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _819 = _589 + _817;
    float _821 = fma(_813, _789, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _823 = fma(_401, (*spvDescriptorSet0.vp_c8)._m0[11].z, _815);
    float _825 = _461 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _827 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _829 = fma(_819, _789, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _831 = _823 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _833 = fma(_395, (*spvDescriptorSet0.vp_c8)._m0[10].x, _825);
    float _835 = _461 + _827;
    float _837 = 1.0 / _831;
    float _839 = fma(_401, (*spvDescriptorSet0.vp_c8)._m0[10].z, _833);
    float _841 = _835 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _843 = _835 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _845 = _839 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _847 = fma(_395, (*spvDescriptorSet0.vp_c15)._m0[126].x, _841);
    float _849 = fma(_395, (*spvDescriptorSet0.vp_c15)._m0[127].x, _843);
    float _851 = _845 + _831;
    float _853 = fma(_401, (*spvDescriptorSet0.vp_c15)._m0[126].z, _847);
    float _855 = fma(_401, (*spvDescriptorSet0.vp_c15)._m0[127].z, _849);
    float _857 = _853 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _859 = _855 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _861 = _851 * _837;
    float _863 = _861 * 0.5;
    float _865 = trunc(_859);
    int _867 = int(_865);
    float _869 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _871 = fma(_863, (*spvDescriptorSet0.vp_c8)._m0[30].w, _869);
    float _873 = 1.0 / _871;
    int _875 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _877 = _867 + _875;
    int _879 = _877 + 1;
    float _881 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _883 = _873 * _881;
    float _885 = trunc(_857);
    int _887 = int(_885);
    bool _889 = _883 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    bool _891 = _883 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    bool _893 = !_889;
    int _895 = _893 ? 0 : 1;
    int _897 = 2;
    int _899 = as_type<int>(_819);
    float _901 = as_type<float>(_879);
    int _903 = as_type<int>(_821);
    if (!_889)
    {
        _897 = 1;
    }
    int _905 = _897;
    int _907 = _905;
    if (!_891)
    {
        _907 = _895;
    }
    int _909 = _907;
    int _911 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _913 = _887 + _911;
    int _915 = _913 + 1;
    int _917 = _909 << 6;
    bool _919 = _915 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _921 = _917 + 48;
    uint _924 = uint(int(uint(_921) >> uint(2)));
    uint _926 = uint(int(uint(int(_924)) >> uint(2)));
    int _928 = int(_924) & 3;
    float _930 = (*spvDescriptorSet0.vp_c15)._m0[int(_926)][_928];
    int _932 = int(_924) + 1;
    uint _934 = uint(int(uint(_932) >> uint(2)));
    int _936 = _932 & 3;
    float _938 = (*spvDescriptorSet0.vp_c15)._m0[int(_934)][_936];
    int _940 = _915 | _879;
    bool _942 = _940 < 0;
    bool _944 = _942 || _919;
    int _946 = _917 + 56;
    uint _948 = uint(int(uint(_946) >> uint(2)));
    uint _950 = uint(int(uint(int(_948)) >> uint(2)));
    int _952 = int(_948) & 3;
    float _954 = (*spvDescriptorSet0.vp_c15)._m0[int(_950)][_952];
    int _956 = int(_948) + 1;
    uint _958 = uint(int(uint(_956) >> uint(2)));
    int _960 = _956 & 3;
    float _962 = (*spvDescriptorSet0.vp_c15)._m0[int(_958)][_960];
    bool _964 = _879 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _966 = _964 || _944;
    bool _968 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _970 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _972 = _968 || _970;
    bool _974 = isnan(0.5);
    bool _976 = _972 || _974;
    float _978 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _980 = _597 + _978;
    int _982 = _917 + 64;
    uint _984 = uint(int(uint(_982) >> uint(2)));
    uint _986 = uint(int(uint(int(_984)) >> uint(2)));
    int _988 = int(_984) & 3;
    float _990 = (*spvDescriptorSet0.vp_c15)._m0[int(_986)][_988];
    int _992 = int(_984) + 1;
    uint _994 = uint(int(uint(_992) >> uint(2)));
    int _996 = _992 & 3;
    float _998 = (*spvDescriptorSet0.vp_c15)._m0[int(_994)][_996];
    float _1000 = fma(_980, _789, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1002 = _980;
    float _1004 = as_type<float>(_915);
    float _1006 = as_type<float>(_909);
    if (!_966)
    {
        int _1008 = _879 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1010 = _1008 + _915;
        _899 = _1010;
    }
    int _1012 = _899;
    int _1014 = _917 + 72;
    uint _1016 = uint(int(uint(_1014) >> uint(2)));
    uint _1018 = uint(int(uint(int(_1016)) >> uint(2)));
    int _1020 = int(_1016) & 3;
    float _1022 = (*spvDescriptorSet0.vp_c15)._m0[int(_1018)][_1020];
    int _1024 = int(_1016) + 1;
    uint _1026 = uint(int(uint(_1024) >> uint(2)));
    int _1028 = _1024 & 3;
    float _1030 = (*spvDescriptorSet0.vp_c15)._m0[int(_1026)][_1028];
    float _1032 = as_type<float>(_1012);
    if (_976)
    {
        _1002 = _821;
    }
    float _1034 = _1002;
    float _1036 = _1034;
    if (_976)
    {
        _1004 = _829;
    }
    float _1038 = _1004;
    float _1040 = _1038;
    if (_976)
    {
        _901 = _1000;
    }
    float _1042 = _901;
    int _1044 = _917 + 96;
    uint _1046 = uint(int(uint(_1044) >> uint(2)));
    uint _1048 = uint(int(uint(int(_1046)) >> uint(2)));
    int _1050 = int(_1046) & 3;
    float _1052 = (*spvDescriptorSet0.vp_c15)._m0[int(_1048)][_1050];
    int _1054 = int(_1046) + 1;
    uint _1056 = uint(int(uint(_1054) >> uint(2)));
    int _1058 = _1054 & 3;
    float _1060 = (*spvDescriptorSet0.vp_c15)._m0[int(_1056)][_1058];
    int _1062 = _917 + 104;
    uint _1064 = uint(int(uint(_1062) >> uint(2)));
    uint _1066 = uint(int(uint(int(_1064)) >> uint(2)));
    int _1068 = int(_1064) & 3;
    float _1070 = (*spvDescriptorSet0.vp_c15)._m0[int(_1066)][_1068];
    int _1072 = int(_1064) + 1;
    uint _1074 = uint(int(uint(_1072) >> uint(2)));
    int _1076 = _1072 & 3;
    float _1078 = (*spvDescriptorSet0.vp_c15)._m0[int(_1074)][_1076];
    float _1080 = _1042;
    int _1082 = as_type<int>(_1060);
    if (!_976)
    {
        float _1084 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1086 = _461 + _1084;
        float _1088 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1090 = _395 + _1088;
        float _1092 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1094 = _1086 * _1086;
        float _1096 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1098 = _401 + _1096;
        float _1100 = fma(_1090, _1090, _1094);
        float _1102 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1104 = fma(_1098, _1098, _1100);
        float _1106 = sqrt(_1104);
        float _1108 = _1092 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1110 = -_461;
        float _1112 = _1110 + _829;
        float _1114 = precise::min(_1106, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1116 = _1114 * _1102;
        float _1118 = -_401;
        float _1120 = _1118 + _1000;
        float _1122 = _1108 * _1116;
        float _1124 = -_395;
        float _1126 = _1124 + _821;
        float _1128 = fma(_1112, _1122, _461);
        float _1130 = fma(_1126, _1122, _395);
        float _1132 = fma(_1120, _1122, _401);
        _1040 = _1128;
        _723 = as_type<int>(_1122);
        _1036 = _1130;
        _1080 = _1132;
    }
    float _1134 = _1040;
    int _1136 = _723;
    float _1138 = _1036;
    float _1140 = _1080;
    float _1142 = _835 * _1060;
    int _1144 = _1136;
    int _1146 = as_type<int>(_1142);
    if (!_966)
    {
        int _1148 = _1012 << 2;
        _1144 = _1148;
    }
    int _1150 = _1144;
    float _1152 = _1134 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_966)
    {
        uint _1154 = uint(int(uint(_1012) >> uint(2)));
        _1082 = int(_1154);
    }
    int _1156 = _1082;
    float _1158 = fma(_395, _1052, _1142);
    if (!_966)
    {
        int _1160 = 12 & _1150;
        _1146 = _1160;
    }
    int _1162 = _1146;
    float _1164 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1152);
    float _1166 = _835 * _938;
    float _1168 = fma(_401, _1070, _1158);
    if (!_966)
    {
        int _1170 = _1156 << 4;
        int _1172 = _1170 + _1162;
        _903 = _1172;
    }
    int _1174 = _903;
    float _1176 = fma(_1140, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1164);
    int _1178 = _917 + 80;
    uint _1180 = uint(int(uint(_1178) >> uint(2)));
    uint _1182 = uint(int(uint(int(_1180)) >> uint(2)));
    int _1184 = int(_1180) & 3;
    float _1186 = (*spvDescriptorSet0.vp_c15)._m0[int(_1182)][_1184];
    int _1188 = int(_1180) + 1;
    uint _1190 = uint(int(uint(_1188) >> uint(2)));
    int _1192 = _1188 & 3;
    float _1194 = (*spvDescriptorSet0.vp_c15)._m0[int(_1190)][_1192];
    float _1196 = _1168 + _1078;
    float _1198 = fma(_395, _930, _1166);
    float _1200 = _1176 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1202 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1204 = 1.0 / _1196;
    float _1206 = _835 * _998;
    float _1208 = _1200 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1210 = _1168;
    float _1212 = _1196;
    if (!_966)
    {
        int _1214 = _1174 + 400;
        uint _1216 = uint(int(uint(_1214) >> uint(2)));
        uint _1218 = uint(int(uint(int(_1216)) >> uint(2)));
        int _1220 = int(_1216) & 3;
        float _1222 = (*spvDescriptorSet0.vp_c15)._m0[int(_1218)][_1220];
        _1210 = _1222;
    }
    float _1224 = _1210;
    float _1226 = fma(_401, _954, _1198);
    float _1228 = fma(_395, _990, _1206);
    float _1230 = -_1208;
    float _1232 = fma(_1230, _1202, 1.0);
    float _1234 = _1134 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1236 = _1226 + _962;
    float _1238 = _1134 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1240 = fma(_401, _1022, _1228);
    int _1242 = _917 + 88;
    uint _1244 = uint(int(uint(_1242) >> uint(2)));
    uint _1246 = uint(int(uint(int(_1244)) >> uint(2)));
    int _1248 = int(_1244) & 3;
    float _1250 = (*spvDescriptorSet0.vp_c15)._m0[int(_1246)][_1248];
    int _1252 = int(_1244) + 1;
    uint _1254 = uint(int(uint(_1252) >> uint(2)));
    int _1256 = _1252 & 3;
    float _1258 = (*spvDescriptorSet0.vp_c15)._m0[int(_1254)][_1256];
    float _1260 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1234);
    float _1262 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1238);
    float _1264 = _1134 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1266 = log2(_1232);
    float _1268 = _1236 * _1204;
    float _1270 = fma(_1140, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1260);
    float _1272 = _1240 + _1030;
    float _1274 = fma(_1140, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1262);
    float _1276 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1264);
    bool _1278 = _1268 >= 0.0;
    float _1280 = _1270 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1282 = _1272 * _1204;
    float _1284 = _1274 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    bool _1286 = _1268 <= 1.0;
    bool _1288 = _1286 && _1278;
    float _1290 = _1280 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1292 = fma(_1140, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1276);
    float _1294 = _1260;
    if (!_966)
    {
        float _1296 = floor(_859);
        _1294 = _1296;
    }
    float _1298 = _1294;
    bool _1300 = _1282 >= 0.0;
    bool _1302 = _1300 && _1288;
    float _1304 = fma(_1284, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1290);
    float _1306 = _1292 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1308 = _1280 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    bool _1310 = _1282 <= 1.0;
    bool _1312 = _1310 && _1302;
    float _1314 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1304);
    float _1316 = _1266 * 0.693147182464599609375;
    float _1318 = as_type<float>(_1174);
    if (!_966)
    {
        float _1320 = floor(_857);
        _1318 = _1320;
    }
    float _1322 = _1318;
    float _1324 = fma(_1284, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1308);
    float _1326 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1314);
    float _1328 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1324);
    float _1330 = _835 * _1194;
    float _1332 = 1.0 / _1326;
    float _1334 = _1280 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1336 = _1328;
    float _1338 = _1326;
    if (_1312)
    {
        float _1340 = float(_909);
        _1006 = _1340;
    }
    float _1342 = _1006;
    float _1344 = fma(_395, _1186, _1330);
    float _1346 = _1298;
    if (!_966)
    {
        float _1348 = -_1298;
        float _1350 = _859 + _1348;
        _1212 = _1350;
    }
    float _1352 = _1212;
    float _1354 = fma(_1284, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1334);
    float _1356 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1328);
    float _1358 = _1224;
    if (!_966)
    {
        float _1360 = rint(_1224);
        float _1362 = precise::max(_1360, 0.0);
        uint _1364 = uint(_1362);
        uint _1366 = clamp(_1364, 0u, 65535u);
        _1358 = as_type<float>(_1366);
    }
    float _1368 = _1358;
    float _1370 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1354);
    if (!_966)
    {
        float _1372 = -_1322;
        float _1374 = _857 + _1372;
        _1346 = _1374;
    }
    float _1376 = _1346;
    float _1378 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1370);
    float _1380 = fma(_401, _1250, _1344);
    float _1382 = _1344;
    if (_1312)
    {
        float _1384 = rint(_1342);
        float _1386 = precise::max(_1384, 0.0);
        uint _1388 = uint(_1386);
        uint _1390 = clamp(_1388, 0u, 65535u);
        _1382 = as_type<float>(_1390);
    }
    float _1392 = _1382;
    float _1394 = _1378 * _1332;
    float _1396 = _1380 + _1258;
    float _1398 = _1356 * _1332;
    float _1400 = fma(_1394, 0.5, 0.5);
    float _1402 = _1396 * _1204;
    float _1404 = fma(_1398, -0.5, 0.5);
    float _1406 = _1316 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1408 = _1376;
    float _1410 = _1406;
    float _1412 = _1368;
    if (!_966)
    {
        float3 _4672 = float3(_1376, _1352, float(as_type<int>(_1368)));
        float3 _4676 = select(_4672, float3(0.0), isnan(_4672));
        float _1414 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _4676.xy, uint(rint(_4676.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _4676.xy, uint(rint(_4676.z)), level(0.0)).x;
        _1408 = _1414;
    }
    float _1416 = _1408;
    float _1418 = _1282;
    if (_1312)
    {
        float3 _4691 = float3(_1268, _1282, float(as_type<int>(_1392)));
        float3 _4693 = select(_4691, float3(0.0), isnan(_4691));
        float _1420 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _4693.xy, uint(rint(_4693.z)), _1402, level(0.0));
        _1418 = _1420;
    }
    float _1422 = _1418;
    float3 _4703 = float3(_1400, _1404, _1406);
    float _1424 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4703, float3(0.0), isnan(_4703)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4703, float3(0.0), isnan(_4703)), level(0.0)).x;
    float3 _4712 = float3(_1400, _1404, _1406);
    float4 _1427 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4712, float3(0.0), isnan(_4712)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4712, float3(0.0), isnan(_4712)), level(0.0)).xyzw;
    float _1429 = _1427.x;
    float _1431 = _1427.y;
    float _1433 = _1427.z;
    float _1435 = _1427.w;
    bool _1437 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1439 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1441 = _1437 || _1439;
    bool _1443 = isnan(0.5);
    bool _1445 = _1441 || _1443;
    float _1447 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    if (_1445)
    {
        _1447 = 1.0;
    }
    float _1449 = _1447;
    float _1451 = _1449;
    if (_1445)
    {
        _1336 = 1.0;
    }
    float _1453 = _1336;
    float _1455 = _1453;
    float _1457 = _1422;
    if (!_1445)
    {
        float _1459 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1461 = _1459 * 0.15915493667125701904296875;
        float _1463 = _1461 * 6.283185482025146484375;
        float _1465 = cos(_1463);
        float _1467 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1469 = _1467 * 0.15915493667125701904296875;
        float _1471 = _1461 * 6.283185482025146484375;
        float _1473 = sin(_1471);
        float _1475 = 1.0 / _1465;
        float _1477 = _1469 * 6.283185482025146484375;
        float _1479 = cos(_1477);
        float _1481 = _1473 * _1475;
        float _1483 = _1469 * 6.283185482025146484375;
        float _1485 = sin(_1483);
        float _1487 = _1479 * _1481;
        float _1489 = 1.0 / _1487;
        float _1491 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1493 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1491;
        float _1495 = 1.0 / _1493;
        float _1497 = _1485 * _1489;
        float _1499 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1501 = fma(_883, _1497, _1499);
        float _1503 = _1501 * _1495;
        float _1505 = precise::clamp(_1503, 0.0, 1.0);
        _1410 = _1475;
        _1412 = _1493;
        _1455 = _1505;
    }
    float _1507 = _1410;
    float _1509 = _1412;
    float _1511 = _1455;
    float _1513 = _1507;
    float _1515 = _1509;
    if (!_1445)
    {
        float _1517 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1519 = _1517 * 0.15915493667125701904296875;
        float _1521 = _1519 * 6.283185482025146484375;
        float _1523 = cos(_1521);
        float _1525 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1527 = _1525 * 0.15915493667125701904296875;
        float _1529 = _1519 * 6.283185482025146484375;
        float _1531 = sin(_1529);
        float _1533 = 1.0 / _1523;
        float _1535 = _1527 * 6.283185482025146484375;
        float _1537 = cos(_1535);
        float _1539 = _1531 * _1533;
        float _1541 = _1527 * 6.283185482025146484375;
        float _1543 = sin(_1541);
        float _1545 = _1537 * _1539;
        float _1547 = 1.0 / _1545;
        float _1549 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1551 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1549;
        float _1553 = 1.0 / _1551;
        float _1555 = _1543 * _1547;
        float _1557 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1559 = fma(_883, _1555, _1557);
        float _1561 = _1559 * _1553;
        float _1563 = precise::clamp(_1561, 0.0, 1.0);
        float _1565 = -_1563;
        float _1567 = _1565 + 1.0;
        _1513 = _1547;
        _1515 = _1527;
        _1451 = _1567;
    }
    float _1569 = _1513;
    float _1571 = _1515;
    float _1573 = _1451;
    float _1575 = _1571;
    float _1577 = _1569;
    if (_966)
    {
        _1575 = 1.0;
    }
    float _1579 = _1575;
    float _1581 = _1579;
    if (!_966)
    {
        int _1583 = _1012 << 4;
        int _1585 = _1583 + 2048;
        uint _1587 = uint(int(uint(_1585) >> uint(2)));
        uint _1589 = uint(int(uint(int(_1587)) >> uint(2)));
        int _1591 = int(_1587) & 3;
        float _1593 = (*spvDescriptorSet0.vp_c15)._m0[int(_1589)][_1591];
        int _1595 = int(_1587) + 1;
        uint _1597 = uint(int(uint(_1595) >> uint(2)));
        int _1599 = _1595 & 3;
        float _1601 = (*spvDescriptorSet0.vp_c15)._m0[int(_1597)][_1599];
        int _1603 = _1585 + 8;
        uint _1605 = uint(int(uint(_1603) >> uint(2)));
        uint _1607 = uint(int(uint(int(_1605)) >> uint(2)));
        int _1609 = int(_1605) & 3;
        float _1611 = (*spvDescriptorSet0.vp_c15)._m0[int(_1607)][_1609];
        int _1613 = int(_1605) + 1;
        uint _1615 = uint(int(uint(_1613) >> uint(2)));
        int _1617 = _1613 & 3;
        float _1619 = (*spvDescriptorSet0.vp_c15)._m0[int(_1615)][_1617];
        float _1621 = _835 * _1601;
        float _1623 = fma(_395, _1593, _1621);
        float _1625 = fma(_401, _1611, _1623);
        float _1627 = _1625 + _1619;
        float _1629 = precise::clamp(_1627, 0.0, 1.0);
        float _1631 = -_1629;
        float _1633 = _1631 + _1416;
        float _1635 = fma(_1633, 500.0, 1.5);
        float _1637 = exp2(_1635);
        float _1639 = 0.0 + _1637;
        float _1641 = precise::clamp(_1639, 0.0, 1.0);
        _1032 = as_type<float>(_1585);
        _1581 = _1641;
    }
    float _1643 = _1032;
    float _1645 = _1581;
    float _1647 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1649 = _1134 + _1647;
    float _1651 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1653 = _1138 + _1651;
    float _1655 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1657 = _1140 + _1655;
    float _1659 = _1649 * _1649;
    float _1661 = fma(_1653, _1653, _1659);
    float _1663 = fma(_1657, _1657, _1661);
    float _1665 = rsqrt(_1663);
    float _1667 = _1665 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1669 = _1653 * _1667;
    float _1671 = _1657 * _1667;
    float _1673 = _1669 * _1669;
    float _1675 = _1671 * _1671;
    float _1677 = _1673 + _1675;
    float _1679 = sqrt(_1677);
    bool _1681 = _1679 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1683 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1685 = _1679 + _1683;
    float _1687 = _1657;
    float _1689 = _1659;
    float _1691 = _1685;
    float _1693 = _1667;
    if (_1681)
    {
        float _1695 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1687 = _1695;
    }
    float _1697 = _1687;
    if (_1681)
    {
        float _1699 = rsqrt(_1677);
        _1689 = _1699;
    }
    float _1701 = _1689;
    float _1703 = _1701;
    if (_1681)
    {
        float _1705 = _1685 * _1697;
        _1691 = _1705;
    }
    float _1707 = _1691;
    if (_1681)
    {
        float _1709 = _1707 * 0.15915493667125701904296875;
        _1577 = _1709;
    }
    float _1711 = _1577;
    float _1713 = _1665;
    if (_1681)
    {
        float _1715 = _1711 * 6.283185482025146484375;
        float _1717 = sin(_1715);
        _1713 = _1717;
    }
    float _1719 = _1713;
    float _1721 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1723 = precise::max(0.0, _1721);
    float _1725 = _1643;
    float _1727 = _1723;
    float _1729 = _1721;
    if (_1681)
    {
        float _1731 = _1711 * 6.283185482025146484375;
        float _1733 = cos(_1731);
        _1725 = _1733;
    }
    float _1735 = _1725;
    float _1737 = -_1667;
    float _1739 = -_1723;
    float _1741 = fma(_1649, _1737, _1739);
    float _1743 = _1741;
    if (_1681)
    {
        float _1745 = _1741 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1727 = _1745;
    }
    float _1747 = _1727;
    float _1749 = _1719;
    float _1751 = _1747;
    if (_1681)
    {
        float _1753 = fma(_1719, _1747, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1749 = _1753;
    }
    float _1755 = _1749;
    float _1757 = _1755;
    if (!_1681)
    {
        _1751 = _1671;
    }
    float _1759 = _1751;
    float _1761 = _1759;
    float _1763 = _1735;
    if (_1681)
    {
        float _1765 = _1735 + (-1.0);
        _1729 = _1765;
    }
    float _1767 = _1729;
    float _1769 = _1767;
    if (_1681)
    {
        float _1771 = _1701 * _1755;
        _1693 = _1771;
    }
    float _1773 = _1693;
    if (!_1681)
    {
        _1757 = _1669;
    }
    float _1775 = _1757;
    float _1777 = _1775;
    if (_1681)
    {
        float _1779 = _1767 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1769 = _1779;
    }
    float _1781 = _1769;
    if (_1681)
    {
        float _1783 = _1669 * _1773;
        _1777 = _1783;
    }
    float _1785 = _1777;
    if (!_1681)
    {
        _1703 = _1673;
    }
    float _1787 = _1703;
    float _1789 = _1787;
    if (_1681)
    {
        float _1791 = _1671 * _1773;
        _1761 = _1791;
    }
    float _1793 = _1761;
    if (_1681)
    {
        float _1795 = fma(_1741, _1735, _1781);
        _1743 = _1795;
    }
    float _1797 = _1743;
    if (_1681)
    {
        float _1799 = _1785 * _1785;
        _1789 = _1799;
    }
    float _1801 = _1789;
    if (!_1681)
    {
        _1763 = _1675;
    }
    float _1803 = _1763;
    float _1805 = _1803;
    if (_1681)
    {
        float _1807 = _1793 * _1793;
        _1805 = _1807;
    }
    float _1809 = _1805;
    float _1811 = sqrt(_1663);
    float _1813 = fma(_1797, _1797, _1801);
    float _1815 = _1813 + _1809;
    float _1817 = rsqrt(_1815);
    float _1819 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1821 = fma(_1811, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1819);
    float _1823 = precise::clamp(_1821, 0.0, 1.0);
    float _1825 = -_1823;
    float _1827 = _1825 + 1.0;
    float _1829 = _1817 * _1785;
    float _1831 = _1817 * _1797;
    float _1833 = _1817 * _1793;
    float _1835 = abs(_1827);
    float _1837 = log2(_1835);
    float _1839 = _1829 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1841 = -_1839;
    float _1843 = fma(_1831, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1841);
    float _1845 = -_1833;
    float _1847 = fma(_1845, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1843);
    float _1849 = fma(_1847, -0.5, 0.5);
    float _1851 = fma(_1847, 0.5, 0.5);
    float _1853 = _1837 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1855 = fma(_1851, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1857 = sqrt(_1849);
    float _1859 = fma(_1851, _1855, -0.212114393711090087890625);
    float _1861 = _1831 + 1.0;
    float _1863 = fma(_1851, _1859, 1.570728778839111328125);
    float _1865 = exp2(_1853);
    float _1867 = _1857 * 0.636619746685028076171875;
    float _1869 = -_1831;
    float _1871 = fma(_1865, _1861, _1869);
    float _1873 = -_1863;
    float _1875 = fma(_1867, _1873, 1.0);
    float _1877 = fma(_1871, 0.5, 0.5);
    float2 _5363 = float2(_1875, _1877);
    float3 _1881 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5363, float2(0.0), isnan(_5363)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5363, float2(0.0), isnan(_5363)), level(0.0)).xyz;
    float _1883 = _1881.x;
    float _1885 = _1881.y;
    float _1887 = _1881.z;
    float _1889 = abs(_883);
    float _1891 = log2(_1889);
    float _1893 = _1280 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1895 = -_807;
    float _1897 = _1895 + 1.0;
    out.m_84.x = _1138;
    out.m_84.y = _1134;
    out.m_84.z = _1140;
    float _1899 = fma(_1284, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1893);
    float _1901 = fma(_1200, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1899);
    bool _1903 = _883 <= 8000.0;
    bool _1905 = isnan(_883);
    bool _1907 = _1903 || _1905;
    bool _1909 = isnan(8000.0);
    bool _1911 = _1907 || _1909;
    float _1913 = float(_1911);
    float _1915 = fma(_1306, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1901);
    float _1917 = _1891 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1919 = _1915 + _1326;
    out.gl_Position.x = _1378;
    out.gl_Position.y = _1356;
    out.gl_Position.z = _1915;
    out.gl_Position.w = _1326;
    float _1921 = _1919 * 0.5;
    float _1923 = exp2(_1917);
    out.m_86.z = _1921;
    out.m_86.w = _1326;
    float _1925 = fma(_1923, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1927 = precise::clamp(_1925, 0.0, 1.0);
    float _1929 = _1837 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1931 = _1837;
    if (!_1312)
    {
        _1931 = 1.0;
    }
    float _1933 = _1931;
    float _1935 = fma(_1927, -2.0, 3.0);
    float _1937 = _1927 * _1927;
    float _1939 = _1933;
    if (_1312)
    {
        bool _1941 = _1422 >= _1402;
        bool _1943 = isnan(_1422);
        bool _1945 = _1941 || _1943;
        bool _1947 = isnan(_1402);
        bool _1949 = _1945 || _1947;
        float _1951 = float(_1949);
        _1939 = _1951;
    }
    float _1953 = _1939;
    float _1955 = exp2(_1929);
    bool _1957 = _1811 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1959 = isnan(_1811);
    bool _1961 = _1957 || _1959;
    bool _1963 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1965 = _1961 || _1963;
    float _1967 = _1937 * _1935;
    float _1969 = _1953 * _1645;
    float _1971 = -_1967;
    float _1973 = _1971 + 1.0;
    float _1975 = fma(_1973, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1967);
    float _1977 = _1913 * _1975;
    if (!_1965)
    {
        _1457 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1979 = _1457;
    float _1981 = -_1955;
    float _1983 = _1981 + 1.0;
    float _1985 = _1979;
    float _1987 = _1979;
    if (!_1965)
    {
        _1338 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1989 = _1338;
    float _1991 = _1977 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1993 = _1983 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1995 = _1897 * _1991;
    float _1997 = precise::clamp(_1995, 0.0, 1.0);
    float _1999 = _1993 * _1424;
    float _2001 = -_1993;
    float _2003 = _2001 + 1.0;
    float _2005 = -_1997;
    float _2007 = fma(_2005, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2009 = _1993;
    float _2011 = _2003;
    float _2013 = _1989;
    float _2015 = _1989;
    if (!_1965)
    {
        _2009 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2017 = _2009;
    float _2019 = _1435 * _1999;
    float _2021 = _1435 * _2003;
    float _2023 = -_1969;
    float _2025 = fma(_2023, _2007, 1.0);
    float _2027 = precise::clamp(_2025, 0.0, 1.0);
    float _2029 = _2019;
    float _2031 = _2017;
    float _2033 = _2017;
    if (!_1965)
    {
        _2011 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2035 = _2011;
    float _2037 = _2027 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2039 = _1511 * _1573;
    out.m_88.x = _2037;
    float _2041 = _2039 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2043 = _2039;
    float _2045 = _2035;
    float _2047 = _2035;
    if (!_1965)
    {
        _2043 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2049 = _2043;
    float _2051 = _1887 * _1999;
    float _2053 = fma(_1883, _2019, _1429);
    float _2055 = fma(_1885, _2019, _1431);
    float _2057 = _2049;
    float _2059 = _2049;
    if (!_1965)
    {
        _2029 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2061 = _2029;
    float _2063 = fma(_1435, _2051, _1433);
    out.m_90.x = _2053;
    out.m_90.y = _2055;
    out.m_90.z = _2063;
    out.m_90.w = _2021;
    bool _2065 = !_1965;
    float _2067 = _2061;
    float _2069 = _2061;
    if (!_2065)
    {
        bool _2071 = _1811 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2073 = isnan(_1811);
        bool _2075 = _2071 || _2073;
        bool _2077 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2079 = _2075 || _2077;
        if (!_2079)
        {
            float _2081 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2083 = _1811 + _2081;
            float _2085 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2087 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2085;
            float _2089 = 1.0 / _2087;
            float _2091 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2093 = _2091 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2095 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2097 = _2095 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2099 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2101 = _2099 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2103 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2105 = _2103 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2107 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2109 = _2107 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2111 = _2083 * _2089;
            float _2113 = precise::clamp(_2111, 0.0, 1.0);
            float _2115 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2117 = _2115 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2119 = fma(_2113, _2093, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2121 = fma(_2113, _2117, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2123 = fma(_2113, _2097, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2125 = fma(_2113, _2101, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2127 = fma(_2113, _2105, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2129 = fma(_2113, _2109, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2015 = _2121;
            _2047 = _2127;
            _1987 = _2119;
            _2033 = _2125;
            _2069 = _2123;
            _2059 = _2129;
            _2131 = true;
        }
        else
        {
            bool _2133 = _1811 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2135 = isnan(_1811);
            bool _2137 = _2133 || _2135;
            bool _2139 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2141 = _2137 || _2139;
            if (!_2141)
            {
                _1985 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2143 = _1985;
            _1987 = _2143;
            if (!_2141)
            {
                _2013 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2145 = _2013;
            _2015 = _2145;
            if (!_2141)
            {
                _2067 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2147 = _2067;
            _2069 = _2147;
            if (!_2141)
            {
                _2031 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2149 = _2031;
            _2033 = _2149;
            if (!_2141)
            {
                _2045 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2151 = _2045;
            _2047 = _2151;
            if (!_2141)
            {
                _2057 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2153 = _2057;
            bool _2155 = !_2141;
            _2059 = _2153;
            if (!_2155)
            {
                bool _2157 = _1811 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2159 = isnan(_1811);
                bool _2161 = _2157 || _2159;
                bool _2163 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2165 = _2161 || _2163;
                if (!_2165)
                {
                    float _2167 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2169 = _1811 + _2167;
                    float _2171 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2173 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2171;
                    float _2175 = 1.0 / _2173;
                    float _2177 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2179 = _2177 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2181 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2183 = _2181 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2185 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2187 = _2185 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2189 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2191 = _2189 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2193 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2195 = _2193 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2197 = _2169 * _2175;
                    float _2199 = precise::clamp(_2197, 0.0, 1.0);
                    float _2201 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2203 = _2201 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2205 = fma(_2199, _2179, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2207 = fma(_2199, _2203, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2209 = fma(_2199, _2183, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2211 = fma(_2199, _2187, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2213 = fma(_2199, _2191, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2215 = fma(_2199, _2195, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2015 = _2207;
                    _2047 = _2213;
                    _1987 = _2205;
                    _2033 = _2211;
                    _2069 = _2209;
                    _2059 = _2215;
                    _2131 = true;
                }
                else
                {
                    _2015 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2047 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1987 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2033 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2069 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2059 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2131 = false;
    float _2217 = _2015;
    float _2219 = _2047;
    float _2221 = _1987;
    float _2223 = _2033;
    float _2225 = _2069;
    float _2227 = _2059;
    float _2229 = fma(_691, -0.5, 0.5);
    float _2231 = precise::clamp(_2229, 0.0, 1.0);
    float _2233 = -_2217;
    float _2235 = _2233 + _2219;
    float _2237 = _2041 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2239 = -_2221;
    float _2241 = _2239 + _2223;
    out.m_92.x = 0.0;
    float _2243 = fma(_2231, _2235, _2217);
    float _2245 = fma(_2231, _2241, _2221);
    out.m_61.x = _2237;
    float _2247 = -_2225;
    float _2249 = _2247 + _2227;
    float _2251 = _2243 * 0.586610972881317138671875;
    bool _2253 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2255 = fma(_2231, _2249, _2225);
    float _2257 = fma(_2245, 0.298911988735198974609375, _2251);
    bool _2259 = _1511 > 0.0;
    bool _2261 = isnan(_1511);
    bool _2263 = _2259 || _2261;
    bool _2265 = isnan(0.0);
    bool _2267 = _2263 || _2265;
    float _2269 = fma(_2255, 0.114477999508380889892578125, _2257);
    bool _2271 = _1573 <= 0.0;
    bool _2273 = !_2267;
    bool _2275 = _2271 || _2273;
    float _2277 = -_2269;
    float _2279 = _2245 + _2277;
    float _2281 = -_2269;
    float _2283 = _2243 + _2281;
    float _2285 = -_2269;
    float _2287 = _2255 + _2285;
    float _2289 = fma(_2279, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2269);
    float _2291 = fma(_2283, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2269);
    float _2293 = fma(_2287, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2269);
    bool _2295 = !_2253;
    if (!_2295)
    {
        float _2297 = -_1134;
        float _2299 = _2297 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2301 = -_1138;
        float _2303 = _2301 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2305 = -_1140;
        float _2307 = _2305 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2309 = _2299 * _2299;
        float _2311 = fma(_2303, _2303, _2309);
        float _2313 = fma(_2307, _2307, _2311);
        float _2315 = sqrt(_2313);
        float _2317 = rsqrt(_2313);
        float _2319 = -_2315;
        float _2321 = _2319 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2323 = _2321 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2325 = precise::clamp(_2323, 0.0, 1.0);
        float _2327 = _2303 * _2317;
        float _2329 = _2299 * _2317;
        float _2331 = abs(_2325);
        float _2333 = log2(_2331);
        float _2335 = _2307 * _2317;
        float _2337 = _2327 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2339 = _691 * _2329;
        float _2341 = -_2329;
        float _2343 = -_2337;
        float _2345 = fma(_2341, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2343);
        float _2347 = fma(_689, _2327, _2339);
        float _2349 = -_2335;
        float _2351 = fma(_2349, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2345);
        float _2353 = fma(_709, _2335, _2347);
        float _2355 = precise::clamp(_2353, 0.0, 1.0);
        float _2357 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2359 = _2351 + _2357;
        float _2361 = _2333 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2363 = _2359 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2365 = precise::clamp(_2363, 0.0, 1.0);
        float _2367 = exp2(_2361);
        float _2369 = _2367 * _2365;
        float _2371 = _2355 * _2369;
        float _2373 = _2371 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2375 = _2371 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2377 = _2371 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_92.x = _2373;
        out.m_92.y = _2375;
        out.m_92.z = _2377;
    }
    out.m_94.x = _2289;
    out.m_94.y = _2291;
    out.m_94.z = _2293;
    if (!_2275)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_61.x = 0.0;
    float _2379 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2379;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

