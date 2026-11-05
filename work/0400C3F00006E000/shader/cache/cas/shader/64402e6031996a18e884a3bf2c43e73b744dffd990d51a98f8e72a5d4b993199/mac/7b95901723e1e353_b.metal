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
    texture2d<float> vp_t_tcb_24 [[id(6)]];
    sampler vp_t_tcb_24Smplr [[id(7)]];
    texture2d_array<float> vp_t_tcb_14 [[id(8)]];
    sampler vp_t_tcb_14Smplr [[id(9)]];
    texture2d_array<float> vp_t_tcb_16 [[id(10)]];
    sampler vp_t_tcb_16Smplr [[id(11)]];
    texture3d<float> vp_t_tcb_32 [[id(12)]];
    sampler vp_t_tcb_32Smplr [[id(13)]];
    texture3d<float> vp_t_tcb_30 [[id(14)]];
    sampler vp_t_tcb_30Smplr [[id(15)]];
    texture2d<float> vp_t_tcb_1C [[id(16)]];
    sampler vp_t_tcb_1CSmplr [[id(17)]];
    sampler vp_t_tcb_24Smplr_w [[id(18)]];
    sampler vp_t_tcb_14Smplr_w [[id(19)]];
    sampler vp_t_tcb_32Smplr_w [[id(20)]];
    sampler vp_t_tcb_30Smplr_w [[id(21)]];
    sampler vp_t_tcb_1CSmplr_w [[id(22)]];
    constant dm_border_t* dm_border [[id(23)]];
};

struct main0_out
{
    float4 m_69 [[user(locn0)]];
    float4 m_76 [[user(locn1)]];
    float4 m_78 [[user(locn2)]];
    float4 m_80 [[user(locn3)]];
    float4 m_92 [[user(locn4)]];
    float4 m_59 [[user(locn5)]];
    float4 m_82 [[user(locn6)]];
    float4 m_86 [[user(locn7)]];
    float4 m_74 [[user(locn8)]];
    float4 m_90 [[user(locn9)]];
    float4 m_88 [[user(locn10)]];
    float4 m_84 [[user(locn11)]];
    float4 m_94 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_63 [[attribute(2)]];
    float4 m_56 [[attribute(3)]];
    float4 m_61 [[attribute(4)]];
    float4 m_65 [[attribute(5)]];
    float4 m_67 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2819 = false;
    bool _549 = false;
    bool _409 = false;
    bool _215 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _108 = in.m_56.w;
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
        out.m_59.x = 0.0;
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
        float _3178 = as_type<float>(_129);
        out.gl_Position.z = _3178;
    }
    if (!_117)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _133 = in.m_61.w;
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
        out.m_59.x = 0.0;
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
        float _3246 = as_type<float>(_165);
        out.gl_Position.z = _3246;
    }
    if (_159)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _167 = in.m_63.x;
    float _169 = in.m_63.y;
    float _171 = in.m_63.z;
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
        float _197 = in.m_65.x;
        float _199 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _201 = _197 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _203 = fma(_201, (*spvDescriptorSet0.vp_c9)._m0[12].x, _147);
        float _205 = _203 * _199;
        float _207 = floor(_205);
        float _209 = -_207;
        float _211 = _205 + _209;
        _213 = _211;
        _215 = true;
    }
    else
    {
        float _217 = float(_113);
        float _219 = 1.0 / _217;
        float _221 = _147 * _219;
        _213 = _221;
    }
    _215 = false;
    float _223 = _213;
    float _225 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _227 = _223 + _225;
    float _229 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _231 = _223 + _229;
    float _233 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _235 = _223 + _233;
    float _237 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _239 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _237;
    float _241 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _243 = _241 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _245 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _247 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _245;
    float _249 = 1.0 / _239;
    bool _251 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _253 = 1.0 / _247;
    bool _255 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _257 = isnan(_223);
    bool _259 = _255 || _257;
    bool _261 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _263 = _259 || _261;
    float _265 = float(_263);
    float _267 = 1.0 / _243;
    float _269 = _227 * _249;
    bool _271 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _273 = isnan(_223);
    bool _275 = _271 || _273;
    bool _277 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _279 = _275 || _277;
    float _281 = float(_279);
    float _283 = _231 * _253;
    bool _285 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _287 = isnan(_223);
    bool _289 = _285 || _287;
    bool _291 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _293 = _289 || _291;
    float _295 = float(_293);
    float _297 = -_265;
    float _299 = _297 + 1.0;
    float _301 = _295 * _299;
    float _303 = -_295;
    float _305 = _303 + 1.0;
    float _307 = _235 * _267;
    float _309 = -_281;
    float _311 = _309 + 1.0;
    bool _313 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _315 = isnan(_223);
    bool _317 = _313 || _315;
    bool _319 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _321 = _317 || _319;
    float _323 = float(_321);
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _327 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _325;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _331 = _329 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _333 = _265 * _311;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _337 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _335;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _341 = _339 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _343 = fma(_327, _269, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _345 = _323 * _305;
    float _347 = fma(_337, _269, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _349 = fma(_331, _307, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _351 = fma(_341, _307, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _353 = -_323;
    float _355 = _353 + 1.0;
    float _357 = _343 * _345;
    float _359 = _347 * _345;
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _363 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _361;
    float _365 = fma(_355, (*spvDescriptorSet0.vp_c9)._m0[143].x, _357);
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _369 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _367;
    float _371 = fma(_355, (*spvDescriptorSet0.vp_c9)._m0[143].y, _359);
    float _373 = fma(_363, _283, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _375 = fma(_349, _301, _365);
    float _377 = fma(_369, _283, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _379 = fma(_351, _301, _371);
    float _381 = fma(_373, _333, _375);
    float _383 = fma(_377, _333, _379);
    float _385 = fma(_281, (*spvDescriptorSet0.vp_c9)._m0[146].x, _381);
    float _387 = fma(_281, (*spvDescriptorSet0.vp_c9)._m0[146].y, _383);
    bool _389 = !_251;
    float _407;
    if (!_389)
    {
        float _391 = in.m_65.x;
        float _393 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _395 = _391 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _397 = fma(_395, (*spvDescriptorSet0.vp_c9)._m0[11].x, _147);
        float _399 = _397 * _393;
        float _401 = floor(_399);
        float _403 = -_401;
        float _405 = _399 + _403;
        _407 = _405;
        _409 = true;
    }
    else
    {
        float _411 = float(_113);
        float _413 = 1.0 / _411;
        float _415 = _147 * _413;
        _407 = _415;
    }
    _409 = false;
    float _417 = _407;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _421 = _417 + _419;
    float _423 = in.m_67.x;
    float _425 = in.m_67.y;
    bool _427 = _417 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _429 = isnan(_417);
    bool _431 = _427 || _429;
    bool _433 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _435 = _431 || _433;
    float _437 = float(_435);
    float _439 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _441 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _439;
    float _443 = 1.0 / _441;
    float _445 = -_437;
    float _447 = _445 + 1.0;
    bool _449 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _451 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _455 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _453;
    float _457 = _421 * _443;
    float _459 = _385 * _423;
    bool _461 = _417 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _463 = isnan(_417);
    bool _465 = _461 || _463;
    bool _467 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _469 = _465 || _467;
    float _471 = float(_469);
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _475 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _473;
    float _477 = fma(_455, _457, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _481 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _479;
    float _483 = _471 * _447;
    float _485 = fma(_475, _457, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _487 = fma(_481, _457, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _489 = -_471;
    float _491 = _489 + 1.0;
    float _493 = _477 * _483;
    float _495 = _485 * _483;
    float _497 = _487 * _483;
    float _499 = fma(_491, (*spvDescriptorSet0.vp_c9)._m0[107].x, _495);
    float _501 = fma(_491, (*spvDescriptorSet0.vp_c9)._m0[107].y, _497);
    float _503 = fma(_491, (*spvDescriptorSet0.vp_c9)._m0[107].z, _493);
    float _505 = fma(_437, (*spvDescriptorSet0.vp_c9)._m0[108].x, _499);
    float _507 = fma(_437, (*spvDescriptorSet0.vp_c9)._m0[108].y, _501);
    float _509 = fma(_437, (*spvDescriptorSet0.vp_c9)._m0[108].z, _503);
    float _511 = _505 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _513 = _507 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _515 = _509 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _517 = _511 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _519 = _513 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _521 = _515 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _523 = _387 * _425;
    out.m_69.x = _517;
    out.m_69.y = _519;
    out.m_69.z = _521;
    out.m_69.w = _451;
    bool _525 = !_449;
    float _545;
    float _547;
    if (!_525)
    {
        float _527 = in.m_65.x;
        float _529 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _531 = float(_113);
        float _533 = _527 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _535 = fma(_533, (*spvDescriptorSet0.vp_c9)._m0[11].z, _147);
        float _537 = _535 * _529;
        float _539 = floor(_537);
        float _541 = -_539;
        float _543 = _537 + _541;
        _545 = _531;
        _547 = _543;
        _549 = true;
    }
    else
    {
        float _551 = float(_113);
        float _553 = 1.0 / _551;
        float _555 = _147 * _553;
        _545 = _551;
        _547 = _555;
    }
    _549 = false;
    float _557 = _545;
    float _559 = _547;
    float _561 = in.m_56.x;
    float _563 = in.m_56.y;
    float _565 = in.m_56.z;
    float _567 = _563 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _569 = _563 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _571 = fma(_561, (*spvDescriptorSet0.vp_c10)._m0[6].x, _567);
    float _573 = fma(_561, (*spvDescriptorSet0.vp_c10)._m0[4].x, _569);
    float _575 = fma(_565, (*spvDescriptorSet0.vp_c10)._m0[6].z, _571);
    float _577 = fma(_565, (*spvDescriptorSet0.vp_c10)._m0[4].z, _573);
    float _579 = _575 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _581 = _577 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _583 = fma(_579, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _585 = fma(_581, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _587 = floor(_583);
    float _589 = floor(_585);
    float _591 = -_587;
    float _593 = _583 + _591;
    float _595 = -_589;
    float _597 = _585 + _595;
    float2 _3971 = float2(_597, _593);
    float _599 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3971, float2(0.0), isnan(_3971)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3971, float2(0.0), isnan(_3971)), level(0.0)).x;
    float _601 = _563 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _603 = _523 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _605 = fma(_561, (*spvDescriptorSet0.vp_c10)._m0[5].x, _601);
    float _607 = _459 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _609 = fma(_565, (*spvDescriptorSet0.vp_c10)._m0[5].z, _605);
    float _611 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _613 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _615 = _609 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _617 = as_type<float>(int(gl_VertexIndex));
    float _619 = _615 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _621 = _615 + _613;
    float _623 = fma(_581, (*spvDescriptorSet0.vp_c8)._m0[11].x, _619);
    float _625 = fma(_579, (*spvDescriptorSet0.vp_c8)._m0[11].z, _623);
    float _627 = _615 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _629 = _625 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _631 = fma(_581, (*spvDescriptorSet0.vp_c8)._m0[10].x, _627);
    float _633 = 1.0 / _629;
    float _635 = fma(_579, (*spvDescriptorSet0.vp_c8)._m0[10].z, _631);
    float _637 = _635 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    int _639 = as_type<int>(_617) & 1;
    bool _641 = _639 != 0;
    int _643 = as_type<int>(_617) & 2;
    bool _645 = _643 != 0;
    float _647 = _637 + _629;
    bool _649 = !_645;
    float _651 = _649 ? (-0.5) : 0.5;
    bool _653 = !_641;
    float _655 = _653 ? (-0.5) : 0.5;
    float _657 = _647 * _633;
    float _659 = _657 * 0.5;
    float _661 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _651);
    float _663 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _665 = fma(_659, (*spvDescriptorSet0.vp_c8)._m0[30].w, _663);
    float _667 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _655);
    float _669 = _603 * _661;
    float _671 = _607 * _667;
    float _673 = 1.0 / _665;
    float _675 = _669 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _677 = _621 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _679 = fma(_671, (*spvDescriptorSet0.vp_c8)._m0[24].x, _675);
    float _681 = _621 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _683 = fma(_581, (*spvDescriptorSet0.vp_c15)._m0[126].x, _677);
    float _685 = _669 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _687 = fma(_611, (*spvDescriptorSet0.vp_c8)._m0[24].z, _679);
    float _689 = fma(_581, (*spvDescriptorSet0.vp_c15)._m0[127].x, _681);
    float _691 = fma(_579, (*spvDescriptorSet0.vp_c15)._m0[126].z, _683);
    float _693 = fma(_671, (*spvDescriptorSet0.vp_c8)._m0[26].x, _685);
    float _695 = _669 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _697 = fma(_579, (*spvDescriptorSet0.vp_c15)._m0[127].z, _689);
    float _699 = _691 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _701 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _703 = _673 * _701;
    float _705 = fma(_611, (*spvDescriptorSet0.vp_c8)._m0[26].z, _693);
    float _707 = _697 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _709 = trunc(_699);
    int _711 = int(_709);
    float _713 = _687 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    bool _715 = _703 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _717 = _705 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    bool _719 = _703 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _721 = _581 + _713;
    bool _723 = !_715;
    int _725 = _723 ? 0 : 1;
    float _727 = _579 + _717;
    float _729 = trunc(_707);
    int _731 = int(_729);
    float _733 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _735 = _721 + _733;
    float _737 = fma(_671, (*spvDescriptorSet0.vp_c8)._m0[25].x, _695);
    float _739 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _741 = _727 + _739;
    float _743 = fma(_611, (*spvDescriptorSet0.vp_c8)._m0[25].z, _737);
    int _745 = 2;
    float _747 = _695;
    float _749 = _721;
    float _751 = _727;
    if (!_715)
    {
        _745 = 1;
    }
    int _753 = _745;
    float _755 = _741 * _741;
    int _757 = _753;
    if (!_719)
    {
        _757 = _725;
    }
    int _759 = _757;
    float _761 = _743 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _763 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _765 = _711 + _763;
    int _767 = _765 + 1;
    float _769 = fma(_735, _735, _755);
    int _771 = _759 << 6;
    float _773 = _615 + _761;
    bool _775 = _767 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _777 = sqrt(_769);
    int _779 = _771 + 48;
    uint _782 = uint(int(uint(_779) >> uint(2)));
    uint _784 = uint(int(uint(int(_782)) >> uint(2)));
    int _786 = int(_782) & 3;
    float _788 = (*spvDescriptorSet0.vp_c15)._m0[int(_784)][_786];
    int _790 = int(_782) + 1;
    uint _792 = uint(int(uint(_790) >> uint(2)));
    int _794 = _790 & 3;
    float _796 = (*spvDescriptorSet0.vp_c15)._m0[int(_792)][_794];
    int _798 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _800 = _731 + _798;
    int _802 = _800 + 1;
    int _804 = _767 | _802;
    int _806 = _771 + 56;
    uint _808 = uint(int(uint(_806) >> uint(2)));
    uint _810 = uint(int(uint(int(_808)) >> uint(2)));
    int _812 = int(_808) & 3;
    float _814 = (*spvDescriptorSet0.vp_c15)._m0[int(_810)][_812];
    int _816 = int(_808) + 1;
    uint _818 = uint(int(uint(_816) >> uint(2)));
    int _820 = _816 & 3;
    float _822 = (*spvDescriptorSet0.vp_c15)._m0[int(_818)][_820];
    bool _824 = _804 < 0;
    bool _826 = _824 || _775;
    bool _828 = _802 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _830 = _828 || _826;
    bool _832 = _777 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _834 = _771 + 64;
    uint _836 = uint(int(uint(_834) >> uint(2)));
    uint _838 = uint(int(uint(int(_836)) >> uint(2)));
    int _840 = int(_836) & 3;
    float _842 = (*spvDescriptorSet0.vp_c15)._m0[int(_838)][_840];
    int _844 = int(_836) + 1;
    uint _846 = uint(int(uint(_844) >> uint(2)));
    int _848 = _844 & 3;
    float _850 = (*spvDescriptorSet0.vp_c15)._m0[int(_846)][_848];
    int _852 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _854 = _852 != 0;
    int _856 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _858 = _856 != 0;
    int _860 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _862 = _860 != 0;
    int _864 = _771 + 72;
    uint _866 = uint(int(uint(_864) >> uint(2)));
    uint _868 = uint(int(uint(int(_866)) >> uint(2)));
    int _870 = int(_866) & 3;
    float _872 = (*spvDescriptorSet0.vp_c15)._m0[int(_868)][_870];
    int _874 = int(_866) + 1;
    uint _876 = uint(int(uint(_874) >> uint(2)));
    int _878 = _874 & 3;
    float _880 = (*spvDescriptorSet0.vp_c15)._m0[int(_876)][_878];
    bool _882 = !_858;
    int _884 = _882 ? 0 : 1;
    int _886 = _767;
    float _888 = _777;
    float _890 = as_type<float>(_759);
    float _892 = as_type<float>(_771);
    if (!_830)
    {
        int _894 = _802 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _896 = _894 + _767;
        _886 = _896;
    }
    int _898 = _886;
    bool _900 = !_854;
    int _902 = _900 ? 0 : 1;
    bool _904 = !_862;
    int _906 = _904 ? 0 : 1;
    int _908 = 0;
    if (!_830)
    {
        int _910 = _898 << 2;
        _908 = _910;
    }
    int _912 = _908;
    int _914 = _771 + 96;
    uint _916 = uint(int(uint(_914) >> uint(2)));
    uint _918 = uint(int(uint(int(_916)) >> uint(2)));
    int _920 = int(_916) & 3;
    float _922 = (*spvDescriptorSet0.vp_c15)._m0[int(_918)][_920];
    int _924 = int(_916) + 1;
    uint _926 = uint(int(uint(_924) >> uint(2)));
    int _928 = _924 & 3;
    float _930 = (*spvDescriptorSet0.vp_c15)._m0[int(_926)][_928];
    int _932 = 0;
    int _934 = _912;
    if (!_830)
    {
        uint _936 = uint(int(uint(_898) >> uint(2)));
        _932 = int(_936);
    }
    int _938 = _932;
    if (!_830)
    {
        int _940 = 12 & _912;
        _934 = _940;
    }
    int _942 = _934;
    if (!_832)
    {
        _747 = _773;
    }
    float _944 = _747;
    int _946 = _771 + 104;
    uint _948 = uint(int(uint(_946) >> uint(2)));
    uint _950 = uint(int(uint(int(_948)) >> uint(2)));
    int _952 = int(_948) & 3;
    float _954 = (*spvDescriptorSet0.vp_c15)._m0[int(_950)][_952];
    int _956 = int(_948) + 1;
    uint _958 = uint(int(uint(_956) >> uint(2)));
    int _960 = _956 & 3;
    float _962 = (*spvDescriptorSet0.vp_c15)._m0[int(_958)][_960];
    bool _964 = !_832;
    float _966 = _944;
    float _968 = _930;
    float _970 = _796;
    if (!_964)
    {
        float _972 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _974 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _976 = _777 + _974;
        float _978 = rsqrt(_769);
        float _980 = _976 * _972;
        float _982 = _773 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _984 = _980 * 0.15915493667125701904296875;
        float _986 = _984 * 6.283185482025146484375;
        float _988 = cos(_986);
        float _990 = _984 * 6.283185482025146484375;
        float _992 = sin(_990);
        float _994 = _988 + (-1.0);
        float _996 = _994 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _998 = fma(_992, _982, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1000 = fma(_773, _988, _996);
        float _1002 = _978 * _998;
        float _1004 = fma(_735, _1002, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1006 = fma(_741, _1002, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _966 = _1000;
        _749 = _1004;
        _751 = _1006;
        _888 = _984;
    }
    float _1008 = _966;
    float _1010 = _749;
    float _1012 = _751;
    float _1014 = _888;
    float _1016 = _1014;
    float _1018 = _1010;
    float _1020 = _1008;
    float _1022 = _1012;
    if (!_830)
    {
        int _1024 = _938 << 4;
        int _1026 = _1024 + _942;
        _1016 = as_type<float>(_1026);
    }
    float _1028 = _1016;
    float _1030 = -_615;
    float _1032 = _1030 + _1008;
    int _1034 = _771 + 80;
    uint _1036 = uint(int(uint(_1034) >> uint(2)));
    uint _1038 = uint(int(uint(int(_1036)) >> uint(2)));
    int _1040 = int(_1036) & 3;
    float _1042 = (*spvDescriptorSet0.vp_c15)._m0[int(_1038)][_1040];
    int _1044 = int(_1036) + 1;
    uint _1046 = uint(int(uint(_1044) >> uint(2)));
    int _1048 = _1044 & 3;
    float _1050 = (*spvDescriptorSet0.vp_c15)._m0[int(_1046)][_1048];
    float _1052 = -_581;
    float _1054 = _1052 + _1010;
    float _1056 = -_579;
    float _1058 = _1056 + _1012;
    float _1060 = _1032 * _1032;
    float _1062 = _621 * _930;
    float _1064 = _621 * _850;
    if (!_830)
    {
        float _1066 = floor(_699);
        _968 = _1066;
    }
    float _1068 = _968;
    float _1070 = fma(_1054, _1054, _1060);
    int _1072 = _771 + 88;
    uint _1074 = uint(int(uint(_1072) >> uint(2)));
    uint _1076 = uint(int(uint(int(_1074)) >> uint(2)));
    int _1078 = int(_1074) & 3;
    float _1080 = (*spvDescriptorSet0.vp_c15)._m0[int(_1076)][_1078];
    int _1082 = int(_1074) + 1;
    uint _1084 = uint(int(uint(_1082) >> uint(2)));
    int _1086 = _1082 & 3;
    float _1088 = (*spvDescriptorSet0.vp_c15)._m0[int(_1084)][_1086];
    float _1090 = fma(_581, _922, _1062);
    float _1092 = fma(_581, _842, _1064);
    float _1094 = fma(_1058, _1058, _1070);
    float _1096 = fma(_579, _954, _1090);
    float _1098 = _621 * _796;
    float _1100 = sqrt(_1094);
    float _1102 = _1028;
    float _1104 = _1098;
    if (!_830)
    {
        int _1106 = as_type<int>(_1028) + 400;
        uint _1108 = uint(int(uint(_1106) >> uint(2)));
        uint _1110 = uint(int(uint(int(_1108)) >> uint(2)));
        int _1112 = int(_1108) & 3;
        float _1114 = (*spvDescriptorSet0.vp_c15)._m0[int(_1110)][_1112];
        _1102 = _1114;
    }
    float _1116 = _1102;
    float _1118 = _1096 + _962;
    float _1120 = fma(_581, _788, _1098);
    float _1122 = fma(_579, _872, _1092);
    bool _1124 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1126 = isnan(0.5);
    bool _1128 = _1124 || _1126;
    bool _1130 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1132 = _1128 || _1130;
    float _1134 = fma(_579, _814, _1120);
    float _1136 = _1090;
    float _1138 = _1120;
    if (!_830)
    {
        float _1140 = floor(_707);
        _1136 = _1140;
    }
    float _1142 = _1136;
    float _1144 = _1122 + _880;
    float _1146 = _1134 + _822;
    bool _1148 = _1100 > 0.0;
    float _1150 = 1.0 / _1118;
    bool _1152 = !_1148;
    if (!_1152)
    {
        float _1154 = _189 * _189;
        float _1156 = rsqrt(_1094);
        float _1158 = fma(_187, _187, _1154);
        float _1160 = fma(_191, _191, _1158);
        float _1162 = sqrt(_1160);
        float _1164 = _1054 * _1156;
        float _1166 = _1032 * _1156;
        float _1168 = _1058 * _1156;
        bool _1170 = _1162 > 0.0;
        bool _1172 = !_1170;
        _970 = _1160;
        _1138 = _1162;
        _1104 = _1166;
        if (!_1172)
        {
            float _1174 = rsqrt(_1160);
            float _1176 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1178 = _189 * _1174;
            float _1180 = _187 * _1174;
            float _1182 = _1166 * _1178;
            float _1184 = _191 * _1174;
            float _1186 = fma(_1164, _1180, _1182);
            float _1188 = _1176 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1190 = fma(_1168, _1184, _1186);
            float _1192 = _1190 * _1188;
            float _1194 = fma(_187, _1192, _1010);
            float _1196 = fma(_189, _1192, _1008);
            float _1198 = fma(_191, _1192, _1012);
            _1018 = _1194;
            _1020 = _1196;
            _1022 = _1198;
            _970 = _1174;
            _1138 = _1192;
        }
    }
    float _1200 = _1018;
    float _1202 = _1020;
    float _1204 = _1022;
    float _1206 = _970;
    float _1208 = _1138;
    float _1210 = _1104;
    float _1212 = _1208;
    float _1214 = _1206;
    float _1216 = _1210;
    float _1218 = _1204;
    if (_1132)
    {
        _1212 = _1200;
    }
    float _1220 = _1212;
    float _1222 = _1220;
    if (_1132)
    {
        _1214 = _1202;
    }
    float _1224 = _1214;
    float _1226 = _1224;
    if (_1132)
    {
        _195 = _1204;
    }
    float _1228 = _195;
    float _1230 = _1228;
    if (!_1132)
    {
        float _1232 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1234 = _615 + _1232;
        float _1236 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1238 = _581 + _1236;
        float _1240 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1242 = -_615;
        float _1244 = _1242 + _1202;
        float _1246 = _1234 * _1234;
        float _1248 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1250 = _579 + _1248;
        float _1252 = fma(_1238, _1238, _1246);
        float _1254 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1256 = fma(_1250, _1250, _1252);
        float _1258 = sqrt(_1256);
        float _1260 = _1240 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1262 = -_579;
        float _1264 = _1262 + _1204;
        float _1266 = precise::min(_1258, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1268 = _1266 * _1254;
        float _1270 = _1260 * _1268;
        float _1272 = -_581;
        float _1274 = _1272 + _1200;
        float _1276 = fma(_1244, _1270, _615);
        float _1278 = fma(_1274, _1270, _581);
        float _1280 = fma(_1264, _1270, _579);
        _1226 = _1276;
        _1222 = _1278;
        _1230 = _1280;
        _1216 = _1254;
    }
    float _1282 = _1226;
    float _1284 = _1222;
    float _1286 = _1230;
    float _1288 = _1216;
    float _1290 = _1282 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1292 = _1282 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1294 = _1146 * _1150;
    float _1296 = _1282 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1298 = fma(_1284, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1290);
    float _1300 = fma(_1284, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1292);
    float _1302 = _1282 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    bool _1304 = _1294 >= 0.0;
    float _1306 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1298);
    float _1308 = fma(_1284, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1296);
    float _1310 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1300);
    float _1312 = _1144 * _1150;
    float _1314 = _1306 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _1316 = _1294 <= 1.0;
    bool _1318 = _1316 && _1304;
    float _1320 = fma(_1284, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1302);
    float _1322 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1308);
    float _1324 = _1310 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1326 = _1314 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1328 = _1312 >= 0.0;
    bool _1330 = _1328 && _1318;
    float _1332 = _1322 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1334 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1320);
    float _1336 = fma(_1324, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1326);
    bool _1338 = _1312 <= 1.0;
    bool _1340 = _1338 && _1330;
    float _1342 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1344 = _1332 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1346 = _1334 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1348 = fma(_1332, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1336);
    float _1350 = _1288;
    if (!_830)
    {
        float _1352 = rint(_1116);
        float _1354 = precise::max(_1352, 0.0);
        uint _1356 = uint(_1354);
        uint _1358 = clamp(_1356, 0u, 65535u);
        _1350 = as_type<float>(_1358);
    }
    float _1360 = _1350;
    float _1362 = -_1344;
    float _1364 = fma(_1362, _1342, 1.0);
    float _1366 = _1314 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1368 = fma(_1346, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1348);
    float _1370 = _1314 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1372 = _1364;
    float _1374 = _1368;
    if (!_830)
    {
        float _1376 = -_1142;
        float _1378 = _707 + _1376;
        _1218 = _1378;
    }
    float _1380 = _1218;
    float _1382 = log2(_1364);
    float _1384 = _621 * _1050;
    if (_1340)
    {
        float _1386 = float(_759);
        _890 = _1386;
    }
    float _1388 = _890;
    float _1390 = fma(_1324, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1366);
    float _1392 = fma(_1324, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1370);
    float _1394 = fma(_581, _1042, _1384);
    float _1396 = fma(_1332, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1390);
    float _1398 = 1.0 / _1368;
    float _1400 = fma(_579, _1080, _1394);
    float _1402 = fma(_1332, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1392);
    if (!_830)
    {
        float _1404 = -_1068;
        float _1406 = _699 + _1404;
        _1372 = _1406;
    }
    float _1408 = _1372;
    float _1410 = _1400 + _1088;
    float _1412 = fma(_1346, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1396);
    float _1414 = fma(_1346, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1402);
    float _1416 = _1366;
    float _1418 = _1412;
    if (_1340)
    {
        float _1420 = rint(_1388);
        float _1422 = precise::max(_1420, 0.0);
        uint _1424 = uint(_1422);
        uint _1426 = clamp(_1424, 0u, 65535u);
        _1416 = as_type<float>(_1426);
    }
    float _1428 = _1416;
    float _1430 = _1382 * 0.693147182464599609375;
    float _1432 = _1410 * _1150;
    float _1434 = _1412 * _1398;
    float _1436 = _1414 * _1398;
    float _1438 = _1430 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1440 = fma(_1434, 0.5, 0.5);
    float _1442 = fma(_1436, -0.5, 0.5);
    float _1444 = _1380;
    if (!_830)
    {
        float3 _5370 = float3(_1408, _1380, float(as_type<int>(_1360)));
        float3 _5374 = select(_5370, float3(0.0), isnan(_5370));
        float _1446 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5374.xy, uint(rint(_5374.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5374.xy, uint(rint(_5374.z)), level(0.0)).x;
        _1444 = _1446;
    }
    float _1448 = _1444;
    float _1450 = _1388;
    if (_1340)
    {
        float3 _5389 = float3(_1294, _1312, float(as_type<int>(_1428)));
        float3 _5391 = select(_5389, float3(0.0), isnan(_5389));
        float _1452 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5391.xy, uint(rint(_5391.z)), _1432, level(0.0));
        _1450 = _1452;
    }
    float _1454 = _1450;
    float3 _5401 = float3(_1440, _1442, _1438);
    float _1456 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5401, float3(0.0), isnan(_5401)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5401, float3(0.0), isnan(_5401)), level(0.0)).x;
    float3 _5410 = float3(_1440, _1442, _1438);
    float4 _1459 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5410, float3(0.0), isnan(_5410)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5410, float3(0.0), isnan(_5410)), level(0.0)).xyzw;
    float _1461 = _1459.x;
    float _1463 = _1459.y;
    float _1465 = _1459.z;
    float _1467 = _1459.w;
    float _1469 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1471 = int(_1469);
    float _1473 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1475 = int(_1473);
    float _1477 = float(_1471);
    float _1479 = 1.0 / _1477;
    float _1481 = float(uint(_1475));
    int _1483 = ~_1475;
    int _1485 = _1483 + 1;
    int _1487 = ~_1475;
    int _1489 = _1487 + 1;
    float _1491 = 1.0 / _1481;
    float _1493 = _147 * _1479;
    float _1495 = trunc(_1493);
    int _1497 = int(_1495);
    int _1499 = as_type<int>(_1491) + (-2);
    float _1501 = _1491;
    float _1503 = as_type<float>(_1489);
    if (_830)
    {
        _1501 = 1.0;
    }
    float _1505 = _1501;
    float _1507 = float(uint(_1497));
    float _1509 = as_type<float>(_1499) * _1507;
    float _1511 = in.m_65.x;
    float _1513 = in.m_65.y;
    float _1515 = trunc(_1509);
    float _1517 = precise::max(_1515, 0.0);
    uint _1519 = uint(_1517);
    int _1521 = _1485 * int(_1519);
    int _1523 = _1521 + _1497;
    float _1525 = float(uint(_1523));
    float _1527 = as_type<float>(_1499) * _1525;
    float _1529 = trunc(_1527);
    float _1531 = precise::max(_1529, 0.0);
    uint _1533 = uint(_1531);
    int _1535 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1537 = _1535 != 0;
    bool _1539 = !_1537;
    float _1541 = _1539 ? 7.345489978790283203125 : 1.0;
    bool _1543 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1545 = isnan(0.5);
    bool _1547 = _1543 || _1545;
    bool _1549 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1551 = _1547 || _1549;
    float _1553 = _1541 * _1511;
    int _1555 = int(_1519) + int(_1533);
    float _1557 = floor(_1553);
    float _1559 = _1505;
    if (_1551)
    {
        _1503 = 1.0;
    }
    float _1561 = _1503;
    int _1563 = _1489 * _1555;
    int _1565 = _1563 + _1497;
    bool _1567 = uint(_1565) >= uint(_1475);
    float _1569 = -_1557;
    float _1571 = _1553 + _1569;
    float _1573 = _1561;
    float _1575 = _1461;
    if (!_1551)
    {
        float _1577 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1579 = _1577 * 0.15915493667125701904296875;
        float _1581 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1583 = _1579 * 6.283185482025146484375;
        float _1585 = cos(_1583);
        float _1587 = _1581 * 0.15915493667125701904296875;
        float _1589 = _1579 * 6.283185482025146484375;
        float _1591 = sin(_1589);
        float _1593 = 1.0 / _1585;
        float _1595 = _1587 * 6.283185482025146484375;
        float _1597 = cos(_1595);
        float _1599 = _1591 * _1593;
        float _1601 = _1587 * 6.283185482025146484375;
        float _1603 = sin(_1601);
        float _1605 = _1597 * _1599;
        float _1607 = 1.0 / _1605;
        float _1609 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1611 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1609;
        float _1613 = 1.0 / _1611;
        float _1615 = _1603 * _1607;
        float _1617 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1619 = fma(_703, _1615, _1617);
        float _1621 = _1619 * _1613;
        float _1623 = precise::clamp(_1621, 0.0, 1.0);
        _892 = _1613;
        _1573 = _1623;
    }
    float _1625 = _892;
    float _1627 = _1573;
    if (!_830)
    {
        int _1629 = _898 << 4;
        int _1631 = _1629 + 2048;
        uint _1633 = uint(int(uint(_1631) >> uint(2)));
        uint _1635 = uint(int(uint(int(_1633)) >> uint(2)));
        int _1637 = int(_1633) & 3;
        float _1639 = (*spvDescriptorSet0.vp_c15)._m0[int(_1635)][_1637];
        int _1641 = int(_1633) + 1;
        uint _1643 = uint(int(uint(_1641) >> uint(2)));
        int _1645 = _1641 & 3;
        float _1647 = (*spvDescriptorSet0.vp_c15)._m0[int(_1643)][_1645];
        int _1649 = _1631 + 8;
        uint _1651 = uint(int(uint(_1649) >> uint(2)));
        uint _1653 = uint(int(uint(int(_1651)) >> uint(2)));
        int _1655 = int(_1651) & 3;
        float _1657 = (*spvDescriptorSet0.vp_c15)._m0[int(_1653)][_1655];
        int _1659 = int(_1651) + 1;
        uint _1661 = uint(int(uint(_1659) >> uint(2)));
        int _1663 = _1659 & 3;
        float _1665 = (*spvDescriptorSet0.vp_c15)._m0[int(_1661)][_1663];
        float _1667 = _621 * _1647;
        float _1669 = fma(_581, _1639, _1667);
        float _1671 = fma(_579, _1657, _1669);
        float _1673 = _1671 + _1665;
        float _1675 = precise::clamp(_1673, 0.0, 1.0);
        float _1677 = -_1675;
        float _1679 = _1677 + _1448;
        float _1681 = fma(_1679, 500.0, 1.5);
        float _1683 = exp2(_1681);
        float _1685 = 0.0 + _1683;
        float _1687 = precise::clamp(_1685, 0.0, 1.0);
        _1559 = _1687;
    }
    float _1689 = _1559;
    float _1691 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1693 = _1282 + _1691;
    float _1695 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1697 = _1284 + _1695;
    float _1699 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1701 = _1286 + _1699;
    float _1703 = _1693 * _1693;
    float _1705 = fma(_1697, _1697, _1703);
    float _1707 = fma(_1701, _1701, _1705);
    float _1709 = rsqrt(_1707);
    float _1711 = sqrt(_1707);
    float _1713 = _1697 * _1709;
    float _1715 = _1701 * _1709;
    float _1717 = _1693 * _1709;
    float _1719 = _1713 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1721 = _1715 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1723 = _1719 * _1719;
    float _1725 = _1721 * _1721;
    float _1727 = _1723 + _1725;
    float _1729 = sqrt(_1727);
    bool _1731 = _1729 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1733 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1735 = _1729 + _1733;
    float _1737 = _1625;
    float _1739 = _1727;
    float _1741 = _1735;
    float _1743 = _1719;
    float _1745 = _1721;
    float _1747 = _1723;
    float _1749 = _1725;
    if (_1731)
    {
        float _1751 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1737 = _1751;
    }
    float _1753 = _1737;
    if (_1731)
    {
        float _1755 = rsqrt(_1727);
        _1739 = _1755;
    }
    float _1757 = _1739;
    if (_1731)
    {
        float _1759 = _1735 * _1753;
        _1741 = _1759;
    }
    float _1761 = _1741;
    float _1763 = 0.0;
    if (_1731)
    {
        float _1765 = _1761 * 0.15915493667125701904296875;
        _1763 = _1765;
    }
    float _1767 = _1763;
    float _1769 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1771 = _1096;
    float _1773 = _1769;
    if (_1731)
    {
        float _1775 = _1767 * 6.283185482025146484375;
        float _1777 = sin(_1775);
        _1771 = _1777;
    }
    float _1779 = _1771;
    float _1781 = precise::max(0.0, _1769);
    float _1783 = _1761;
    if (_1731)
    {
        float _1785 = _1767 * 6.283185482025146484375;
        float _1787 = cos(_1785);
        _1783 = _1787;
    }
    float _1789 = _1783;
    float _1791 = -_1717;
    float _1793 = -_1781;
    float _1795 = fma(_1791, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1793);
    float _1797 = _1795;
    if (_1731)
    {
        float _1799 = _1795 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1773 = _1799;
    }
    float _1801 = _1773;
    float _1803 = _1779;
    float _1805 = _1801;
    if (_1731)
    {
        float _1807 = fma(_1779, _1801, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1803 = _1807;
    }
    float _1809 = _1803;
    float _1811 = _1809;
    if (_1731)
    {
        float _1813 = _1757 * _1809;
        _1811 = _1813;
    }
    float _1815 = _1811;
    if (_1731)
    {
        float _1817 = _1789 + (-1.0);
        _1805 = _1817;
    }
    float _1819 = _1805;
    float _1821 = _1819;
    if (_1731)
    {
        float _1823 = _1719 * _1815;
        _1743 = _1823;
    }
    float _1825 = _1743;
    if (_1731)
    {
        float _1827 = _1721 * _1815;
        _1745 = _1827;
    }
    float _1829 = _1745;
    if (_1731)
    {
        float _1831 = _1819 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1821 = _1831;
    }
    float _1833 = _1821;
    if (_1731)
    {
        float _1835 = _1825 * _1825;
        _1747 = _1835;
    }
    float _1837 = _1747;
    if (_1731)
    {
        float _1839 = _1829 * _1829;
        _1749 = _1839;
    }
    float _1841 = _1749;
    if (_1731)
    {
        float _1843 = fma(_1795, _1789, _1833);
        _1797 = _1843;
    }
    float _1845 = _1797;
    float _1847 = float(_1475);
    float _1849 = fma(_1845, _1845, _1837);
    float _1851 = _1849 + _1841;
    float _1853 = rsqrt(_1851);
    float _1855 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1857 = fma(_1711, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1855);
    float _1859 = precise::clamp(_1857, 0.0, 1.0);
    float _1861 = -_1859;
    float _1863 = _1861 + 1.0;
    float _1865 = abs(_1863);
    float _1867 = log2(_1865);
    float _1869 = _1853 * _1825;
    float _1871 = _1853 * _1845;
    float _1873 = _1853 * _1829;
    float _1875 = float(_1497);
    float _1877 = _1869 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1879 = -_1877;
    float _1881 = fma(_1871, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1879);
    float _1883 = _1867 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1885 = -_1873;
    float _1887 = fma(_1885, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1881);
    float _1889 = exp2(_1883);
    float _1891 = fma(_1887, -0.5, 0.5);
    float _1893 = fma(_1887, 0.5, 0.5);
    float _1895 = fma(_1893, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1897 = sqrt(_1891);
    float _1899 = fma(_1893, _1895, -0.212114393711090087890625);
    float _1901 = _1871 + 1.0;
    float _1903 = fma(_1893, _1899, 1.570728778839111328125);
    bool _1905 = _1875 >= _1847;
    bool _1907 = isnan(_1875);
    bool _1909 = _1905 || _1907;
    bool _1911 = isnan(_1847);
    bool _1913 = _1909 || _1911;
    float _1915 = float(_1913);
    float _1917 = -_1871;
    float _1919 = fma(_1889, _1901, _1917);
    float _1921 = 1.0 / _557;
    bool _1923 = !_1567;
    int _1925 = _1923 ? 0 : (-1);
    float _1927 = fma(_1919, 0.5, 0.5);
    float _1929 = _1897 * 0.636619746685028076171875;
    float _1931 = trunc(_1915);
    int _1933 = int(_1931);
    float _1935 = -_1903;
    float _1937 = fma(_1929, _1935, 1.0);
    float2 _6098 = float2(_1937, _1927);
    float3 _1941 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6098, float2(0.0), isnan(_6098)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6098, float2(0.0), isnan(_6098)), level(0.0)).xyz;
    float _1943 = _1941.x;
    float _1945 = _1941.y;
    float _1947 = _1941.z;
    int _1949 = ~_1555;
    int _1951 = _1949 + _1925;
    int _1953 = _1951 + 1;
    float _1955 = _147 * _1847;
    float _1957 = _1571 * _1847;
    bool _1959 = _1475 == 0;
    float _1961 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1963 = _559 + _1961;
    int _1965 = _1475 * _1953;
    int _1967 = _1965 + _1497;
    float _1969 = _1955 * _1921;
    float _1971 = trunc(_1957);
    int _1973 = int(_1971);
    int _1975 = ~_1933;
    int _1977 = _1975 + 1;
    int _1979 = _1977 + 1;
    float _1981 = _1867 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1983 = !_1959;
    int _1985 = _1983 ? _1967 : (-1);
    float _1987 = -_599;
    float _1989 = _1987 + 1.0;
    int _1991 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1993 = _1991 != 0;
    out.m_74.x = _1284;
    out.m_74.y = _1282;
    out.m_74.z = _1286;
    int _1995 = _1475 + (-1);
    float _1997 = trunc(_1969);
    int _1999 = int(_1997);
    int _2001 = _1985 * _1979;
    bool _2003 = !_1993;
    int _2005 = _2003 ? 0 : 1;
    int _2007 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2009 = _2007 != 0;
    int _2011 = _1933 * _1995;
    int _2013 = _2011 + _2001;
    int _2015 = abs(_884);
    int _2017 = abs(_2005);
    float _2019 = exp2(_1981);
    int _2021 = abs(_902);
    int _2023 = _2013 * _2015;
    bool _2025 = !_2009;
    int _2027 = _2025 ? 0 : 1;
    int _2029 = abs(_906);
    int _2031 = abs(_2027);
    int _2033 = _1973 * _2017;
    int _2035 = _2033 + _1497;
    int _2037 = _1999 * _2021;
    int _2039 = _2037 + _2023;
    int _2041 = _2035 * _2029;
    int _2043 = _2041 + _2039;
    int _2045 = ~_1475;
    int _2047 = _2045 + 1;
    int _2049 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2051 = _2049 != 0;
    int _2053 = _1973 * _2031;
    int _2055 = _2053 + _2043;
    int _2057 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2059 = _2057 != 0;
    int _2061 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2063 = _2061 != 0;
    float _2065 = float(uint(_2055));
    int _2067 = ~_1475;
    int _2069 = _2067 + 1;
    float _2071 = as_type<float>(_1499) * _2065;
    bool _2073 = _1511 > 0.5;
    float _2075 = trunc(_2071);
    float _2077 = precise::max(_2075, 0.0);
    uint _2079 = uint(_2077);
    float _2081 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2083 = fma(_1511, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2081);
    float _2085 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _2087 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _2085;
    float _2089 = 1.0 / _2087;
    int _2091 = _2047 * int(_2079);
    int _2093 = _2091 + _2055;
    float _2095 = float(uint(_2093));
    float _2097 = _1511 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2099 = as_type<float>(_1499) * _2095;
    float _2101 = trunc(_2099);
    float _2103 = precise::max(_2101, 0.0);
    uint _2105 = uint(_2103);
    float _2107 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2109 = -_2107;
    float _2111 = fma(_2097, 2.0, _2109);
    float _2113 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _2115 = _2113 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _2117 = 1.0 / _2115;
    int _2119 = int(_2079) + int(_2105);
    float _2121 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2123 = _1513 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2125 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2083);
    int _2127 = _2069 * _2119;
    int _2129 = _2127 + _2055;
    float _2131 = fma(_2123, -2.0, _2121);
    float _2133 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2135 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _2137 = _559 + _2135;
    bool _2139 = uint(_2129) >= uint(_1475);
    float _2141 = -_147;
    float _2143 = fma(_2141, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2111);
    float _2145 = fma(_1513, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2133);
    float _2147 = _1963 * _2117;
    bool _2149 = !_2139;
    int _2151 = _2149 ? 0 : (-1);
    float _2153 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2145);
    bool _2155 = _1513 > 0.5;
    float _2157 = _2137 * _2089;
    float _2159 = float(uint(_2035));
    float _2161 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2131);
    float _2163 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _2165 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _2163;
    int _2167 = ~_2119;
    int _2169 = _2167 + _2151;
    int _2171 = _2169 + 1;
    float _2173 = as_type<float>(_1499) * _2159;
    float _2175 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _2177 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _2175;
    float _2179 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _2181 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _2179;
    bool _2183 = _559 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _2185 = isnan(_559);
    bool _2187 = _2183 || _2185;
    bool _2189 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _2191 = _2187 || _2189;
    float _2193 = float(_2191);
    int _2195 = _1475 * _2171;
    int _2197 = _2195 + _2055;
    float _2199 = fma(_2177, _2157, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _2201 = trunc(_2173);
    float _2203 = precise::max(_2201, 0.0);
    uint _2205 = uint(_2203);
    float _2207 = fma(_2181, _2157, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _2209 = fma(_2165, _2157, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _2211 = _559 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _2213 = isnan(_559);
    bool _2215 = _2211 || _2213;
    bool _2217 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _2219 = _2215 || _2217;
    float _2221 = float(_2219);
    float _2223 = -_2193;
    float _2225 = _2223 + 1.0;
    bool _2227 = _559 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _2229 = isnan(_559);
    bool _2231 = _2227 || _2229;
    bool _2233 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _2235 = _2231 || _2233;
    float _2237 = float(_2235);
    float _2239 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _2241 = _2239 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    int _2243 = ~_1475;
    int _2245 = _2243 + 1;
    float _2247 = _2221 * _2225;
    float _2249 = -_2221;
    float _2251 = _2249 + 1.0;
    float _2253 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _2255 = _2253 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    bool _2257 = !_1959;
    int _2259 = _2257 ? _2197 : (-1);
    float _2261 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _2263 = _2261 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _2265 = _2237 * _2251;
    float _2267 = fma(_2255, _2147, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    int _2269 = _2259 >> 31;
    int _2271 = _2245 * int(_2205);
    int _2273 = _2271 + _2035;
    float _2275 = fma(_2263, _2147, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _2277 = fma(_2241, _2147, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    int _2279 = _2269 & 3;
    float _2281 = _2199 * _2265;
    float _2283 = float(uint(_2273));
    float _2285 = _2207 * _2265;
    int _2287 = _2259 + _2279;
    float _2289 = _2209 * _2265;
    float _2291 = -_655;
    int _2293 = _2073 ? as_type<int>(_2291) : as_type<int>(_655);
    float _2295 = as_type<float>(_1499) * _2283;
    int _2297 = _2287 >> 2;
    float _2299 = _651 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2301 = -_651;
    int _2303 = _2155 ? as_type<int>(_2301) : as_type<int>(_651);
    float _2305 = -_2237;
    float _2307 = _2305 + 1.0;
    int _2309 = _2297 << 4;
    int _2311 = _2309 + 368;
    float _2313 = trunc(_2295);
    float _2315 = precise::max(_2313, 0.0);
    uint _2317 = uint(_2315);
    bool _2319 = !_2063;
    float _2321 = _2319 ? _651 : as_type<float>(_2303);
    float _2323 = _2299 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2325 = !_2059;
    float _2327 = _2325 ? _655 : as_type<float>(_2293);
    float _2329 = _2299 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2331 = _2299 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2333 = _655 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    uint _2335 = uint(int(uint(_2311) >> uint(2)));
    uint _2337 = uint(int(uint(int(_2335)) >> uint(2)));
    int _2339 = int(_2335) & 3;
    float _2341 = (*spvDescriptorSet0.vp_c9)._m0[int(_2337)][_2339];
    int _2343 = int(_2335) + 1;
    uint _2345 = uint(int(uint(_2343) >> uint(2)));
    int _2347 = _2343 & 3;
    float _2349 = (*spvDescriptorSet0.vp_c9)._m0[int(_2345)][_2347];
    int _2351 = ~_1475;
    int _2353 = _2351 + 1;
    float _2355 = fma(_2307, (*spvDescriptorSet0.vp_c9)._m0[123].z, _2289);
    float _2357 = fma(_2333, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2323);
    float _2359 = fma(_2333, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2329);
    float _2361 = fma(_2333, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2331);
    int _2363 = _2259 & 3;
    bool _2365 = _2363 != 0;
    float _2367 = fma(_2307, (*spvDescriptorSet0.vp_c9)._m0[123].x, _2281);
    float _2369 = fma(_2307, (*spvDescriptorSet0.vp_c9)._m0[123].y, _2285);
    int _2371 = int(_2205) + int(_2317);
    float _2373 = fma(_2277, _2247, _2355);
    int _2375 = _2311 + 8;
    uint _2377 = uint(int(uint(_2375) >> uint(2)));
    uint _2379 = uint(int(uint(int(_2377)) >> uint(2)));
    int _2381 = int(_2377) & 3;
    float _2383 = (*spvDescriptorSet0.vp_c9)._m0[int(_2379)][_2381];
    int _2385 = int(_2377) + 1;
    uint _2387 = uint(int(uint(_2385) >> uint(2)));
    int _2389 = _2385 & 3;
    float _2391 = (*spvDescriptorSet0.vp_c9)._m0[int(_2387)][_2389];
    bool _2393 = uint(_2363) > 1u;
    float _2395 = fma(_2267, _2247, _2367);
    int _2397 = _2353 * _2371;
    int _2399 = _2397 + _2035;
    int _2401 = _2259 & 3;
    bool _2403 = _2401 != 0;
    float _2405 = _2321 + (-0.5);
    float _2407 = fma(_2275, _2247, _2369);
    float _2409 = fma(_2193, (*spvDescriptorSet0.vp_c9)._m0[125].x, _2395);
    bool _2411 = uint(_2399) >= uint(_1475);
    float _2413 = -_2405;
    float _2415 = -_2161;
    float _2417 = fma(_2413, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2415);
    int _2419 = _2403 ? 0 : 1;
    float _2421 = _1314 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2423 = !_2411;
    int _2425 = _2423 ? 0 : (-1);
    float _2427 = -_2153;
    float _2429 = _2427 + 1.0;
    int _2431 = ~_2419;
    int _2433 = _2431 + 1;
    int _2435 = _2433 + 1;
    float _2437 = _2327 + 0.5;
    int _2439 = ~_2371;
    int _2441 = _2439 + _2425;
    int _2443 = _2441 + 1;
    float _2445 = -_2125;
    float _2447 = _2445 + 1.0;
    int _2449 = _2435;
    if (!_2393)
    {
        int _2451 = ~_2419;
        int _2453 = _2451 + 1;
        _2449 = _2453;
    }
    int _2455 = _2449;
    float _2457 = fma(_2193, (*spvDescriptorSet0.vp_c9)._m0[125].y, _2407);
    bool _2459 = _2363 != 3;
    int _2461 = _1475 * _2443;
    int _2463 = _2461 + _2035;
    int _2465 = abs(_2455);
    float _2467 = fma(_2193, (*spvDescriptorSet0.vp_c9)._m0[125].z, _2373);
    bool _2469 = !_2365;
    int _2471 = _2469 ? 0 : 1;
    float _2473 = fma(_2437, (*spvDescriptorSet0.vp_c9)._m0[80].x, _2143);
    bool _2475 = uint(_2363) >= 2u;
    int _2477 = abs(_2471);
    int _2479 = ~_2465;
    int _2481 = _2479 + 1;
    int _2483 = _2481 + 1;
    int _2485 = _2475 ? 0 : 1;
    bool _2487 = _2363 != 3;
    int _2489 = ~_2485;
    int _2491 = _2489 + 1;
    int _2493 = _2491 + 1;
    int _2495 = _2483 * as_type<int>(_2349);
    int _2497 = _2493;
    if (_2459)
    {
        int _2499 = ~_2485;
        int _2501 = _2499 + 1;
        _2497 = _2501;
    }
    int _2503 = _2497;
    float _2505 = abs(_703);
    float _2507 = log2(_2505);
    float _2509 = fma(_1324, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2421);
    bool _2511 = !_2487;
    int _2513 = _2511 ? 0 : (-1);
    int _2515 = abs(_2503);
    int _2517 = abs(_2513);
    int _2519 = ~_2477;
    int _2521 = _2519 + 1;
    int _2523 = _2521 + 1;
    int _2525 = ~_2515;
    int _2527 = _2525 + 1;
    int _2529 = _2527 + 1;
    bool _2531 = !_2051;
    int _2533 = _2531 ? 0 : 1;
    int _2535 = _2523 * as_type<int>(_2341);
    int _2537 = _2535 + _2495;
    int _2539 = ~_2517;
    int _2541 = _2539 + 1;
    int _2543 = _2541 + 1;
    float _2545 = fma(_1332, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2509);
    int _2547 = abs(_2533);
    int _2549 = _2529 * as_type<int>(_2383);
    int _2551 = _2549 + _2537;
    float _2553 = _2507 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2555 = _2457 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2557 = fma(_1346, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2545);
    int _2559 = _2543 * as_type<int>(_2391);
    int _2561 = _2559 + _2551;
    float _2563 = fma(_2321, _2429, _2417);
    float _2565 = _2409 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2567 = exp2(_2553);
    float _2569 = _2467 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2571 = -_2447;
    float _2573 = fma(_2327, _2571, _2473);
    float _2575 = _2565 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2577 = _2555 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2579 = _2569 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.gl_Position.x = _1412;
    out.gl_Position.y = _1414;
    out.gl_Position.z = _2557;
    out.gl_Position.w = _1368;
    bool _2581 = _703 <= 8000.0;
    bool _2583 = isnan(_703);
    bool _2585 = _2581 || _2583;
    bool _2587 = isnan(8000.0);
    bool _2589 = _2585 || _2587;
    float _2591 = float(_2589);
    out.m_76.x = _2575;
    out.m_76.y = _2577;
    out.m_76.z = _2579;
    int _2593 = ~_2547;
    int _2595 = _2593 + 1;
    int _2597 = _2595 + 1;
    bool _2599 = !_1959;
    int _2601 = _2599 ? _2463 : (-1);
    float _2603 = fma(_2567, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2605 = precise::clamp(_2603, 0.0, 1.0);
    out.m_78.x = _2573;
    out.m_78.y = _2563;
    int _2607 = _2561 * _2597;
    bool _2609 = _1711 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2611 = isnan(_1711);
    bool _2613 = _2609 || _2611;
    bool _2615 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2617 = _2613 || _2615;
    int _2619 = _2601 * _2547;
    int _2621 = _2619 + _2607;
    float _2623 = _2557 + _1368;
    float _2625 = fma(_2605, -2.0, 3.0);
    float _2627 = _2605 * _2605;
    float _2629 = _2579;
    if (!_1340)
    {
        _1418 = 1.0;
    }
    float _2631 = _1418;
    float _2633 = _2623 * 0.5;
    float _2635 = _2631;
    if (_1340)
    {
        bool _2637 = _1454 >= _1432;
        bool _2639 = isnan(_1454);
        bool _2641 = _2637 || _2639;
        bool _2643 = isnan(_1432);
        bool _2645 = _2641 || _2643;
        float _2647 = float(_2645);
        _2635 = _2647;
    }
    float _2649 = _2635;
    float _2651 = _2627 * _2625;
    float _2653 = float(_2621);
    out.m_80.z = _2633;
    out.m_80.w = _1368;
    float _2655 = -_2651;
    float _2657 = _2655 + 1.0;
    float _2659 = _2649 * _1689;
    float _2661 = _2651;
    if (!_2617)
    {
        _2629 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2663 = _2629;
    out.m_82.x = _2653;
    float _2665 = fma(_2657, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2651);
    float _2667 = _2663;
    float _2669 = _2663;
    if (!_2617)
    {
        _2661 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2671 = _2661;
    float _2673 = _2671;
    float _2675 = _2671;
    if (!_2617)
    {
        _1374 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2677 = _1374;
    float _2679 = _2591 * _2665;
    float _2681 = _2679 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2683 = -_2019;
    float _2685 = _2683 + 1.0;
    float _2687 = _1989 * _2681;
    float _2689 = precise::clamp(_2687, 0.0, 1.0);
    float _2691 = _2685 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2693 = _2361 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _2695 = -_2689;
    float _2697 = fma(_2695, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2699 = _2691 * _1456;
    float _2701 = -_2691;
    float _2703 = _2701 + 1.0;
    float _2705 = -_2659;
    float _2707 = fma(_2705, _2697, 1.0);
    float _2709 = precise::clamp(_2707, 0.0, 1.0);
    float _2711 = _1467 * _2699;
    float _2713 = _1947 * _2699;
    float _2715 = _1467 * _2703;
    float _2717 = _2357 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _2719 = fma(_1943, _2711, _1461);
    float _2721 = fma(_1945, _2711, _1463);
    float _2723 = fma(_1467, _2713, _1465);
    float _2725 = _2359 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _2727 = _2709 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2729 = _1627 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2731 = _2703;
    float _2733 = _2727;
    float _2735 = _2677;
    float _2737 = _2677;
    if (!_2617)
    {
        _1575 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2739 = _1575;
    out.m_84.x = _2719;
    out.m_84.y = _2721;
    out.m_84.z = _2723;
    out.m_84.w = _2715;
    float _2741 = _2739;
    float _2743 = _2739;
    if (!_2617)
    {
        _2731 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2745 = _2731;
    out.m_86.x = _2717;
    out.m_86.y = _2725;
    out.m_86.z = _2693;
    out.m_88.x = _2727;
    float _2747 = _2745;
    float _2749 = _2745;
    if (!_2617)
    {
        _2733 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2751 = _2733;
    bool _2753 = !_2617;
    float _2755 = _2751;
    float _2757 = _2751;
    if (!_2753)
    {
        bool _2759 = _1711 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2761 = isnan(_1711);
        bool _2763 = _2759 || _2761;
        bool _2765 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2767 = _2763 || _2765;
        if (!_2767)
        {
            float _2769 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2771 = _1711 + _2769;
            float _2773 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2775 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2773;
            float _2777 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2779 = _2777 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2781 = 1.0 / _2775;
            float _2783 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2785 = _2783 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2787 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2789 = _2787 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2791 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2793 = _2791 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2795 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2797 = _2795 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2799 = _2771 * _2781;
            float _2801 = precise::clamp(_2799, 0.0, 1.0);
            float _2803 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2805 = _2803 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2807 = fma(_2801, _2779, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2809 = fma(_2801, _2805, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2811 = fma(_2801, _2785, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2813 = fma(_2801, _2789, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2815 = fma(_2801, _2793, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2817 = fma(_2801, _2797, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2743 = _2807;
            _2737 = _2815;
            _2675 = _2811;
            _2749 = _2813;
            _2669 = _2809;
            _2757 = _2817;
            _2819 = true;
        }
        else
        {
            bool _2821 = _1711 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2823 = isnan(_1711);
            bool _2825 = _2821 || _2823;
            bool _2827 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2829 = _2825 || _2827;
            if (!_2829)
            {
                _2673 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2831 = _2673;
            _2675 = _2831;
            if (!_2829)
            {
                _2741 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2833 = _2741;
            _2743 = _2833;
            if (!_2829)
            {
                _2667 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2835 = _2667;
            _2669 = _2835;
            if (!_2829)
            {
                _2747 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2837 = _2747;
            _2749 = _2837;
            if (!_2829)
            {
                _2735 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2839 = _2735;
            _2737 = _2839;
            if (!_2829)
            {
                _2755 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2841 = _2755;
            bool _2843 = !_2829;
            _2757 = _2841;
            if (!_2843)
            {
                bool _2845 = _1711 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2847 = isnan(_1711);
                bool _2849 = _2845 || _2847;
                bool _2851 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2853 = _2849 || _2851;
                if (!_2853)
                {
                    float _2855 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2857 = _1711 + _2855;
                    float _2859 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2861 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2859;
                    float _2863 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2865 = _2863 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2867 = 1.0 / _2861;
                    float _2869 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2871 = _2869 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2873 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2875 = _2873 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2877 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2879 = _2877 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2881 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2883 = _2881 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2885 = _2857 * _2867;
                    float _2887 = precise::clamp(_2885, 0.0, 1.0);
                    float _2889 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2891 = _2889 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2893 = fma(_2887, _2865, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2895 = fma(_2887, _2891, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2897 = fma(_2887, _2871, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2899 = fma(_2887, _2875, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2901 = fma(_2887, _2879, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2903 = fma(_2887, _2883, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2743 = _2893;
                    _2737 = _2901;
                    _2675 = _2897;
                    _2749 = _2899;
                    _2669 = _2895;
                    _2757 = _2903;
                    _2819 = true;
                }
                else
                {
                    _2743 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2737 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2675 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2749 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2669 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2757 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2819 = false;
    float _2905 = _2743;
    float _2907 = _2737;
    float _2909 = _2675;
    float _2911 = _2749;
    float _2913 = _2669;
    float _2915 = _2757;
    float _2917 = fma(_2725, -0.5, 0.5);
    float _2919 = precise::clamp(_2917, 0.0, 1.0);
    float _2921 = -_2905;
    float _2923 = _2921 + _2907;
    float _2925 = _2729 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2927 = -_2909;
    float _2929 = _2927 + _2911;
    out.m_90.x = 0.0;
    float _2931 = fma(_2919, _2923, _2905);
    float _2933 = fma(_2919, _2929, _2909);
    out.m_59.x = _2925;
    float _2935 = -_2913;
    float _2937 = _2935 + _2915;
    float _2939 = _2931 * 0.586610972881317138671875;
    bool _2941 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2943 = fma(_2919, _2937, _2913);
    float _2945 = fma(_2933, 0.298911988735198974609375, _2939);
    bool _2947 = _1627 > 0.0;
    bool _2949 = isnan(_1627);
    bool _2951 = _2947 || _2949;
    bool _2953 = isnan(0.0);
    bool _2955 = _2951 || _2953;
    out.m_92.x = 0.0;
    float _2957 = fma(_2943, 0.114477999508380889892578125, _2945);
    float _2959 = -_2957;
    float _2961 = _2933 + _2959;
    float _2963 = -_2957;
    float _2965 = _2931 + _2963;
    float _2967 = -_2957;
    float _2969 = _2943 + _2967;
    float _2971 = fma(_2961, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2957);
    float _2973 = fma(_2965, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2957);
    float _2975 = fma(_2969, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2957);
    bool _2977 = !_2941;
    if (!_2977)
    {
        float _2979 = -_1282;
        float _2981 = _2979 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2983 = -_1284;
        float _2985 = _2983 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2987 = -_1286;
        float _2989 = _2987 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2991 = _2981 * _2981;
        float _2993 = fma(_2985, _2985, _2991);
        float _2995 = fma(_2989, _2989, _2993);
        float _2997 = rsqrt(_2995);
        float _2999 = _2981 * _2997;
        float _3001 = _2985 * _2997;
        float _3003 = _2989 * _2997;
        float _3005 = sqrt(_2995);
        float _3007 = -_1717;
        float _3009 = _3007 + _2999;
        float _3011 = -_1713;
        float _3013 = _3011 + _3001;
        float _3015 = -_1715;
        float _3017 = _3015 + _3003;
        float _3019 = _3009 * _3009;
        float _3021 = fma(_3013, _3013, _3019);
        float _3023 = fma(_3017, _3017, _3021);
        float _3025 = -_3005;
        float _3027 = _3025 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3029 = rsqrt(_3023);
        float _3031 = _3027 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3033 = precise::clamp(_3031, 0.0, 1.0);
        float _3035 = abs(_3033);
        float _3037 = log2(_3035);
        float _3039 = _3009 * _3029;
        float _3041 = _3013 * _3029;
        float _3043 = _3017 * _3029;
        float _3045 = _2725 * _3039;
        float _3047 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
        float _3049 = precise::clamp(_3047, 0.0, 1.0);
        float _3051 = _2725 * _2999;
        float _3053 = fma(_2717, _3041, _3045);
        float _3055 = _3049 * _3049;
        float _3057 = _3037 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3059 = fma(_2717, _3001, _3051);
        float _3061 = fma(_2693, _3043, _3053);
        float _3063 = precise::clamp(_3061, 0.0, 1.0);
        float _3065 = _3055 + (-1.0);
        float _3067 = fma(_2693, _3003, _3059);
        float _3069 = precise::clamp(_3067, 0.0, 1.0);
        float _3071 = _3063 * _3063;
        float _3073 = _3001 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3075 = exp2(_3057);
        float _3077 = fma(_3071, _3065, 1.0);
        float _3079 = -_2999;
        float _3081 = -_3073;
        float _3083 = fma(_3079, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3081);
        float _3085 = _3077 * _3077;
        float _3087 = -_3003;
        float _3089 = fma(_3087, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3083);
        float _3091 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3093 = _3089 + _3091;
        float _3095 = 1.0 / _3085;
        float _3097 = _3093 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3099 = precise::clamp(_3097, 0.0, 1.0);
        float _3101 = _3075 * _3099;
        float _3103 = _3069 * _3101;
        float _3105 = _3103 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3107 = _3055 * _3095;
        float _3109 = _3103 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3111 = _3103 * _3107;
        float _3113 = _3103 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        float _3115 = _3111 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3117 = _3111 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3119 = _3111 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_90.x = _3105;
        out.m_90.y = _3109;
        out.m_90.z = _3113;
        out.m_92.x = _3115;
        out.m_92.y = _3117;
        out.m_92.z = _3119;
    }
    out.m_94.x = _2971;
    out.m_94.y = _2973;
    out.m_94.z = _2975;
    if (_2955)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_59.x = 0.0;
    float _3121 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3121;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2819 = false;
    bool _549 = false;
    bool _409 = false;
    bool _215 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _108 = in.m_56.w;
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
        out.m_59.x = 0.0;
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
        float _3178 = as_type<float>(_129);
        out.gl_Position.z = _3178;
    }
    if (!_117)
    {
        return out;
    }
    float _133 = in.m_61.w;
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
        out.m_59.x = 0.0;
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
        float _3246 = as_type<float>(_165);
        out.gl_Position.z = _3246;
    }
    if (_159)
    {
        return out;
    }
    float _167 = in.m_63.x;
    float _169 = in.m_63.y;
    float _171 = in.m_63.z;
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
        float _197 = in.m_65.x;
        float _199 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _201 = _197 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _203 = fma(_201, (*spvDescriptorSet0.vp_c9)._m0[12].x, _147);
        float _205 = _203 * _199;
        float _207 = floor(_205);
        float _209 = -_207;
        float _211 = _205 + _209;
        _213 = _211;
        _215 = true;
    }
    else
    {
        float _217 = float(_113);
        float _219 = 1.0 / _217;
        float _221 = _147 * _219;
        _213 = _221;
    }
    _215 = false;
    float _223 = _213;
    float _225 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _227 = _223 + _225;
    float _229 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _231 = _223 + _229;
    float _233 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _235 = _223 + _233;
    float _237 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _239 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _237;
    float _241 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _243 = _241 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _245 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _247 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _245;
    float _249 = 1.0 / _239;
    bool _251 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _253 = 1.0 / _247;
    bool _255 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _257 = isnan(_223);
    bool _259 = _255 || _257;
    bool _261 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _263 = _259 || _261;
    float _265 = float(_263);
    float _267 = 1.0 / _243;
    float _269 = _227 * _249;
    bool _271 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _273 = isnan(_223);
    bool _275 = _271 || _273;
    bool _277 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _279 = _275 || _277;
    float _281 = float(_279);
    float _283 = _231 * _253;
    bool _285 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _287 = isnan(_223);
    bool _289 = _285 || _287;
    bool _291 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _293 = _289 || _291;
    float _295 = float(_293);
    float _297 = -_265;
    float _299 = _297 + 1.0;
    float _301 = _295 * _299;
    float _303 = -_295;
    float _305 = _303 + 1.0;
    float _307 = _235 * _267;
    float _309 = -_281;
    float _311 = _309 + 1.0;
    bool _313 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _315 = isnan(_223);
    bool _317 = _313 || _315;
    bool _319 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _321 = _317 || _319;
    float _323 = float(_321);
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _327 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _325;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _331 = _329 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _333 = _265 * _311;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _337 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _335;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _341 = _339 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _343 = fma(_327, _269, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _345 = _323 * _305;
    float _347 = fma(_337, _269, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _349 = fma(_331, _307, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _351 = fma(_341, _307, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _353 = -_323;
    float _355 = _353 + 1.0;
    float _357 = _343 * _345;
    float _359 = _347 * _345;
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _363 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _361;
    float _365 = fma(_355, (*spvDescriptorSet0.vp_c9)._m0[143].x, _357);
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _369 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _367;
    float _371 = fma(_355, (*spvDescriptorSet0.vp_c9)._m0[143].y, _359);
    float _373 = fma(_363, _283, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _375 = fma(_349, _301, _365);
    float _377 = fma(_369, _283, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _379 = fma(_351, _301, _371);
    float _381 = fma(_373, _333, _375);
    float _383 = fma(_377, _333, _379);
    float _385 = fma(_281, (*spvDescriptorSet0.vp_c9)._m0[146].x, _381);
    float _387 = fma(_281, (*spvDescriptorSet0.vp_c9)._m0[146].y, _383);
    bool _389 = !_251;
    float _407;
    if (!_389)
    {
        float _391 = in.m_65.x;
        float _393 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _395 = _391 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _397 = fma(_395, (*spvDescriptorSet0.vp_c9)._m0[11].x, _147);
        float _399 = _397 * _393;
        float _401 = floor(_399);
        float _403 = -_401;
        float _405 = _399 + _403;
        _407 = _405;
        _409 = true;
    }
    else
    {
        float _411 = float(_113);
        float _413 = 1.0 / _411;
        float _415 = _147 * _413;
        _407 = _415;
    }
    _409 = false;
    float _417 = _407;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _421 = _417 + _419;
    float _423 = in.m_67.x;
    float _425 = in.m_67.y;
    bool _427 = _417 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _429 = isnan(_417);
    bool _431 = _427 || _429;
    bool _433 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _435 = _431 || _433;
    float _437 = float(_435);
    float _439 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _441 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _439;
    float _443 = 1.0 / _441;
    float _445 = -_437;
    float _447 = _445 + 1.0;
    bool _449 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _451 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _455 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _453;
    float _457 = _421 * _443;
    float _459 = _385 * _423;
    bool _461 = _417 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _463 = isnan(_417);
    bool _465 = _461 || _463;
    bool _467 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _469 = _465 || _467;
    float _471 = float(_469);
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _475 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _473;
    float _477 = fma(_455, _457, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _481 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _479;
    float _483 = _471 * _447;
    float _485 = fma(_475, _457, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _487 = fma(_481, _457, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _489 = -_471;
    float _491 = _489 + 1.0;
    float _493 = _477 * _483;
    float _495 = _485 * _483;
    float _497 = _487 * _483;
    float _499 = fma(_491, (*spvDescriptorSet0.vp_c9)._m0[107].x, _495);
    float _501 = fma(_491, (*spvDescriptorSet0.vp_c9)._m0[107].y, _497);
    float _503 = fma(_491, (*spvDescriptorSet0.vp_c9)._m0[107].z, _493);
    float _505 = fma(_437, (*spvDescriptorSet0.vp_c9)._m0[108].x, _499);
    float _507 = fma(_437, (*spvDescriptorSet0.vp_c9)._m0[108].y, _501);
    float _509 = fma(_437, (*spvDescriptorSet0.vp_c9)._m0[108].z, _503);
    float _511 = _505 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _513 = _507 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _515 = _509 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _517 = _511 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _519 = _513 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _521 = _515 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _523 = _387 * _425;
    out.m_69.x = _517;
    out.m_69.y = _519;
    out.m_69.z = _521;
    out.m_69.w = _451;
    bool _525 = !_449;
    float _545;
    float _547;
    if (!_525)
    {
        float _527 = in.m_65.x;
        float _529 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _531 = float(_113);
        float _533 = _527 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _535 = fma(_533, (*spvDescriptorSet0.vp_c9)._m0[11].z, _147);
        float _537 = _535 * _529;
        float _539 = floor(_537);
        float _541 = -_539;
        float _543 = _537 + _541;
        _545 = _531;
        _547 = _543;
        _549 = true;
    }
    else
    {
        float _551 = float(_113);
        float _553 = 1.0 / _551;
        float _555 = _147 * _553;
        _545 = _551;
        _547 = _555;
    }
    _549 = false;
    float _557 = _545;
    float _559 = _547;
    float _561 = in.m_56.x;
    float _563 = in.m_56.y;
    float _565 = in.m_56.z;
    float _567 = _563 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _569 = _563 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _571 = fma(_561, (*spvDescriptorSet0.vp_c10)._m0[6].x, _567);
    float _573 = fma(_561, (*spvDescriptorSet0.vp_c10)._m0[4].x, _569);
    float _575 = fma(_565, (*spvDescriptorSet0.vp_c10)._m0[6].z, _571);
    float _577 = fma(_565, (*spvDescriptorSet0.vp_c10)._m0[4].z, _573);
    float _579 = _575 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _581 = _577 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _583 = fma(_579, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _585 = fma(_581, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _587 = floor(_583);
    float _589 = floor(_585);
    float _591 = -_587;
    float _593 = _583 + _591;
    float _595 = -_589;
    float _597 = _585 + _595;
    float2 _3971 = float2(_597, _593);
    float _599 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3971, float2(0.0), isnan(_3971)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3971, float2(0.0), isnan(_3971)), level(0.0)).x;
    float _601 = _563 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _603 = _523 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _605 = fma(_561, (*spvDescriptorSet0.vp_c10)._m0[5].x, _601);
    float _607 = _459 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _609 = fma(_565, (*spvDescriptorSet0.vp_c10)._m0[5].z, _605);
    float _611 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _613 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _615 = _609 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _617 = as_type<float>(int(gl_VertexIndex));
    float _619 = _615 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _621 = _615 + _613;
    float _623 = fma(_581, (*spvDescriptorSet0.vp_c8)._m0[11].x, _619);
    float _625 = fma(_579, (*spvDescriptorSet0.vp_c8)._m0[11].z, _623);
    float _627 = _615 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _629 = _625 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _631 = fma(_581, (*spvDescriptorSet0.vp_c8)._m0[10].x, _627);
    float _633 = 1.0 / _629;
    float _635 = fma(_579, (*spvDescriptorSet0.vp_c8)._m0[10].z, _631);
    float _637 = _635 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    int _639 = as_type<int>(_617) & 1;
    bool _641 = _639 != 0;
    int _643 = as_type<int>(_617) & 2;
    bool _645 = _643 != 0;
    float _647 = _637 + _629;
    bool _649 = !_645;
    float _651 = _649 ? (-0.5) : 0.5;
    bool _653 = !_641;
    float _655 = _653 ? (-0.5) : 0.5;
    float _657 = _647 * _633;
    float _659 = _657 * 0.5;
    float _661 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _651);
    float _663 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _665 = fma(_659, (*spvDescriptorSet0.vp_c8)._m0[30].w, _663);
    float _667 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _655);
    float _669 = _603 * _661;
    float _671 = _607 * _667;
    float _673 = 1.0 / _665;
    float _675 = _669 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _677 = _621 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _679 = fma(_671, (*spvDescriptorSet0.vp_c8)._m0[24].x, _675);
    float _681 = _621 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _683 = fma(_581, (*spvDescriptorSet0.vp_c15)._m0[126].x, _677);
    float _685 = _669 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _687 = fma(_611, (*spvDescriptorSet0.vp_c8)._m0[24].z, _679);
    float _689 = fma(_581, (*spvDescriptorSet0.vp_c15)._m0[127].x, _681);
    float _691 = fma(_579, (*spvDescriptorSet0.vp_c15)._m0[126].z, _683);
    float _693 = fma(_671, (*spvDescriptorSet0.vp_c8)._m0[26].x, _685);
    float _695 = _669 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _697 = fma(_579, (*spvDescriptorSet0.vp_c15)._m0[127].z, _689);
    float _699 = _691 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _701 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _703 = _673 * _701;
    float _705 = fma(_611, (*spvDescriptorSet0.vp_c8)._m0[26].z, _693);
    float _707 = _697 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _709 = trunc(_699);
    int _711 = int(_709);
    float _713 = _687 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    bool _715 = _703 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _717 = _705 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    bool _719 = _703 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _721 = _581 + _713;
    bool _723 = !_715;
    int _725 = _723 ? 0 : 1;
    float _727 = _579 + _717;
    float _729 = trunc(_707);
    int _731 = int(_729);
    float _733 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _735 = _721 + _733;
    float _737 = fma(_671, (*spvDescriptorSet0.vp_c8)._m0[25].x, _695);
    float _739 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _741 = _727 + _739;
    float _743 = fma(_611, (*spvDescriptorSet0.vp_c8)._m0[25].z, _737);
    int _745 = 2;
    float _747 = _695;
    float _749 = _721;
    float _751 = _727;
    if (!_715)
    {
        _745 = 1;
    }
    int _753 = _745;
    float _755 = _741 * _741;
    int _757 = _753;
    if (!_719)
    {
        _757 = _725;
    }
    int _759 = _757;
    float _761 = _743 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _763 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _765 = _711 + _763;
    int _767 = _765 + 1;
    float _769 = fma(_735, _735, _755);
    int _771 = _759 << 6;
    float _773 = _615 + _761;
    bool _775 = _767 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _777 = sqrt(_769);
    int _779 = _771 + 48;
    uint _782 = uint(int(uint(_779) >> uint(2)));
    uint _784 = uint(int(uint(int(_782)) >> uint(2)));
    int _786 = int(_782) & 3;
    float _788 = (*spvDescriptorSet0.vp_c15)._m0[int(_784)][_786];
    int _790 = int(_782) + 1;
    uint _792 = uint(int(uint(_790) >> uint(2)));
    int _794 = _790 & 3;
    float _796 = (*spvDescriptorSet0.vp_c15)._m0[int(_792)][_794];
    int _798 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _800 = _731 + _798;
    int _802 = _800 + 1;
    int _804 = _767 | _802;
    int _806 = _771 + 56;
    uint _808 = uint(int(uint(_806) >> uint(2)));
    uint _810 = uint(int(uint(int(_808)) >> uint(2)));
    int _812 = int(_808) & 3;
    float _814 = (*spvDescriptorSet0.vp_c15)._m0[int(_810)][_812];
    int _816 = int(_808) + 1;
    uint _818 = uint(int(uint(_816) >> uint(2)));
    int _820 = _816 & 3;
    float _822 = (*spvDescriptorSet0.vp_c15)._m0[int(_818)][_820];
    bool _824 = _804 < 0;
    bool _826 = _824 || _775;
    bool _828 = _802 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _830 = _828 || _826;
    bool _832 = _777 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _834 = _771 + 64;
    uint _836 = uint(int(uint(_834) >> uint(2)));
    uint _838 = uint(int(uint(int(_836)) >> uint(2)));
    int _840 = int(_836) & 3;
    float _842 = (*spvDescriptorSet0.vp_c15)._m0[int(_838)][_840];
    int _844 = int(_836) + 1;
    uint _846 = uint(int(uint(_844) >> uint(2)));
    int _848 = _844 & 3;
    float _850 = (*spvDescriptorSet0.vp_c15)._m0[int(_846)][_848];
    int _852 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _854 = _852 != 0;
    int _856 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _858 = _856 != 0;
    int _860 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _862 = _860 != 0;
    int _864 = _771 + 72;
    uint _866 = uint(int(uint(_864) >> uint(2)));
    uint _868 = uint(int(uint(int(_866)) >> uint(2)));
    int _870 = int(_866) & 3;
    float _872 = (*spvDescriptorSet0.vp_c15)._m0[int(_868)][_870];
    int _874 = int(_866) + 1;
    uint _876 = uint(int(uint(_874) >> uint(2)));
    int _878 = _874 & 3;
    float _880 = (*spvDescriptorSet0.vp_c15)._m0[int(_876)][_878];
    bool _882 = !_858;
    int _884 = _882 ? 0 : 1;
    int _886 = _767;
    float _888 = _777;
    float _890 = as_type<float>(_759);
    float _892 = as_type<float>(_771);
    if (!_830)
    {
        int _894 = _802 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _896 = _894 + _767;
        _886 = _896;
    }
    int _898 = _886;
    bool _900 = !_854;
    int _902 = _900 ? 0 : 1;
    bool _904 = !_862;
    int _906 = _904 ? 0 : 1;
    int _908 = 0;
    if (!_830)
    {
        int _910 = _898 << 2;
        _908 = _910;
    }
    int _912 = _908;
    int _914 = _771 + 96;
    uint _916 = uint(int(uint(_914) >> uint(2)));
    uint _918 = uint(int(uint(int(_916)) >> uint(2)));
    int _920 = int(_916) & 3;
    float _922 = (*spvDescriptorSet0.vp_c15)._m0[int(_918)][_920];
    int _924 = int(_916) + 1;
    uint _926 = uint(int(uint(_924) >> uint(2)));
    int _928 = _924 & 3;
    float _930 = (*spvDescriptorSet0.vp_c15)._m0[int(_926)][_928];
    int _932 = 0;
    int _934 = _912;
    if (!_830)
    {
        uint _936 = uint(int(uint(_898) >> uint(2)));
        _932 = int(_936);
    }
    int _938 = _932;
    if (!_830)
    {
        int _940 = 12 & _912;
        _934 = _940;
    }
    int _942 = _934;
    if (!_832)
    {
        _747 = _773;
    }
    float _944 = _747;
    int _946 = _771 + 104;
    uint _948 = uint(int(uint(_946) >> uint(2)));
    uint _950 = uint(int(uint(int(_948)) >> uint(2)));
    int _952 = int(_948) & 3;
    float _954 = (*spvDescriptorSet0.vp_c15)._m0[int(_950)][_952];
    int _956 = int(_948) + 1;
    uint _958 = uint(int(uint(_956) >> uint(2)));
    int _960 = _956 & 3;
    float _962 = (*spvDescriptorSet0.vp_c15)._m0[int(_958)][_960];
    bool _964 = !_832;
    float _966 = _944;
    float _968 = _930;
    float _970 = _796;
    if (!_964)
    {
        float _972 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _974 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _976 = _777 + _974;
        float _978 = rsqrt(_769);
        float _980 = _976 * _972;
        float _982 = _773 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _984 = _980 * 0.15915493667125701904296875;
        float _986 = _984 * 6.283185482025146484375;
        float _988 = cos(_986);
        float _990 = _984 * 6.283185482025146484375;
        float _992 = sin(_990);
        float _994 = _988 + (-1.0);
        float _996 = _994 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _998 = fma(_992, _982, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1000 = fma(_773, _988, _996);
        float _1002 = _978 * _998;
        float _1004 = fma(_735, _1002, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1006 = fma(_741, _1002, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _966 = _1000;
        _749 = _1004;
        _751 = _1006;
        _888 = _984;
    }
    float _1008 = _966;
    float _1010 = _749;
    float _1012 = _751;
    float _1014 = _888;
    float _1016 = _1014;
    float _1018 = _1010;
    float _1020 = _1008;
    float _1022 = _1012;
    if (!_830)
    {
        int _1024 = _938 << 4;
        int _1026 = _1024 + _942;
        _1016 = as_type<float>(_1026);
    }
    float _1028 = _1016;
    float _1030 = -_615;
    float _1032 = _1030 + _1008;
    int _1034 = _771 + 80;
    uint _1036 = uint(int(uint(_1034) >> uint(2)));
    uint _1038 = uint(int(uint(int(_1036)) >> uint(2)));
    int _1040 = int(_1036) & 3;
    float _1042 = (*spvDescriptorSet0.vp_c15)._m0[int(_1038)][_1040];
    int _1044 = int(_1036) + 1;
    uint _1046 = uint(int(uint(_1044) >> uint(2)));
    int _1048 = _1044 & 3;
    float _1050 = (*spvDescriptorSet0.vp_c15)._m0[int(_1046)][_1048];
    float _1052 = -_581;
    float _1054 = _1052 + _1010;
    float _1056 = -_579;
    float _1058 = _1056 + _1012;
    float _1060 = _1032 * _1032;
    float _1062 = _621 * _930;
    float _1064 = _621 * _850;
    if (!_830)
    {
        float _1066 = floor(_699);
        _968 = _1066;
    }
    float _1068 = _968;
    float _1070 = fma(_1054, _1054, _1060);
    int _1072 = _771 + 88;
    uint _1074 = uint(int(uint(_1072) >> uint(2)));
    uint _1076 = uint(int(uint(int(_1074)) >> uint(2)));
    int _1078 = int(_1074) & 3;
    float _1080 = (*spvDescriptorSet0.vp_c15)._m0[int(_1076)][_1078];
    int _1082 = int(_1074) + 1;
    uint _1084 = uint(int(uint(_1082) >> uint(2)));
    int _1086 = _1082 & 3;
    float _1088 = (*spvDescriptorSet0.vp_c15)._m0[int(_1084)][_1086];
    float _1090 = fma(_581, _922, _1062);
    float _1092 = fma(_581, _842, _1064);
    float _1094 = fma(_1058, _1058, _1070);
    float _1096 = fma(_579, _954, _1090);
    float _1098 = _621 * _796;
    float _1100 = sqrt(_1094);
    float _1102 = _1028;
    float _1104 = _1098;
    if (!_830)
    {
        int _1106 = as_type<int>(_1028) + 400;
        uint _1108 = uint(int(uint(_1106) >> uint(2)));
        uint _1110 = uint(int(uint(int(_1108)) >> uint(2)));
        int _1112 = int(_1108) & 3;
        float _1114 = (*spvDescriptorSet0.vp_c15)._m0[int(_1110)][_1112];
        _1102 = _1114;
    }
    float _1116 = _1102;
    float _1118 = _1096 + _962;
    float _1120 = fma(_581, _788, _1098);
    float _1122 = fma(_579, _872, _1092);
    bool _1124 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1126 = isnan(0.5);
    bool _1128 = _1124 || _1126;
    bool _1130 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1132 = _1128 || _1130;
    float _1134 = fma(_579, _814, _1120);
    float _1136 = _1090;
    float _1138 = _1120;
    if (!_830)
    {
        float _1140 = floor(_707);
        _1136 = _1140;
    }
    float _1142 = _1136;
    float _1144 = _1122 + _880;
    float _1146 = _1134 + _822;
    bool _1148 = _1100 > 0.0;
    float _1150 = 1.0 / _1118;
    bool _1152 = !_1148;
    if (!_1152)
    {
        float _1154 = _189 * _189;
        float _1156 = rsqrt(_1094);
        float _1158 = fma(_187, _187, _1154);
        float _1160 = fma(_191, _191, _1158);
        float _1162 = sqrt(_1160);
        float _1164 = _1054 * _1156;
        float _1166 = _1032 * _1156;
        float _1168 = _1058 * _1156;
        bool _1170 = _1162 > 0.0;
        bool _1172 = !_1170;
        _970 = _1160;
        _1138 = _1162;
        _1104 = _1166;
        if (!_1172)
        {
            float _1174 = rsqrt(_1160);
            float _1176 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1178 = _189 * _1174;
            float _1180 = _187 * _1174;
            float _1182 = _1166 * _1178;
            float _1184 = _191 * _1174;
            float _1186 = fma(_1164, _1180, _1182);
            float _1188 = _1176 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1190 = fma(_1168, _1184, _1186);
            float _1192 = _1190 * _1188;
            float _1194 = fma(_187, _1192, _1010);
            float _1196 = fma(_189, _1192, _1008);
            float _1198 = fma(_191, _1192, _1012);
            _1018 = _1194;
            _1020 = _1196;
            _1022 = _1198;
            _970 = _1174;
            _1138 = _1192;
        }
    }
    float _1200 = _1018;
    float _1202 = _1020;
    float _1204 = _1022;
    float _1206 = _970;
    float _1208 = _1138;
    float _1210 = _1104;
    float _1212 = _1208;
    float _1214 = _1206;
    float _1216 = _1210;
    float _1218 = _1204;
    if (_1132)
    {
        _1212 = _1200;
    }
    float _1220 = _1212;
    float _1222 = _1220;
    if (_1132)
    {
        _1214 = _1202;
    }
    float _1224 = _1214;
    float _1226 = _1224;
    if (_1132)
    {
        _195 = _1204;
    }
    float _1228 = _195;
    float _1230 = _1228;
    if (!_1132)
    {
        float _1232 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1234 = _615 + _1232;
        float _1236 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1238 = _581 + _1236;
        float _1240 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1242 = -_615;
        float _1244 = _1242 + _1202;
        float _1246 = _1234 * _1234;
        float _1248 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1250 = _579 + _1248;
        float _1252 = fma(_1238, _1238, _1246);
        float _1254 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1256 = fma(_1250, _1250, _1252);
        float _1258 = sqrt(_1256);
        float _1260 = _1240 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1262 = -_579;
        float _1264 = _1262 + _1204;
        float _1266 = precise::min(_1258, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1268 = _1266 * _1254;
        float _1270 = _1260 * _1268;
        float _1272 = -_581;
        float _1274 = _1272 + _1200;
        float _1276 = fma(_1244, _1270, _615);
        float _1278 = fma(_1274, _1270, _581);
        float _1280 = fma(_1264, _1270, _579);
        _1226 = _1276;
        _1222 = _1278;
        _1230 = _1280;
        _1216 = _1254;
    }
    float _1282 = _1226;
    float _1284 = _1222;
    float _1286 = _1230;
    float _1288 = _1216;
    float _1290 = _1282 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1292 = _1282 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1294 = _1146 * _1150;
    float _1296 = _1282 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1298 = fma(_1284, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1290);
    float _1300 = fma(_1284, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1292);
    float _1302 = _1282 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    bool _1304 = _1294 >= 0.0;
    float _1306 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1298);
    float _1308 = fma(_1284, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1296);
    float _1310 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1300);
    float _1312 = _1144 * _1150;
    float _1314 = _1306 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _1316 = _1294 <= 1.0;
    bool _1318 = _1316 && _1304;
    float _1320 = fma(_1284, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1302);
    float _1322 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1308);
    float _1324 = _1310 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1326 = _1314 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1328 = _1312 >= 0.0;
    bool _1330 = _1328 && _1318;
    float _1332 = _1322 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1334 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1320);
    float _1336 = fma(_1324, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1326);
    bool _1338 = _1312 <= 1.0;
    bool _1340 = _1338 && _1330;
    float _1342 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1344 = _1332 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1346 = _1334 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1348 = fma(_1332, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1336);
    float _1350 = _1288;
    if (!_830)
    {
        float _1352 = rint(_1116);
        float _1354 = precise::max(_1352, 0.0);
        uint _1356 = uint(_1354);
        uint _1358 = clamp(_1356, 0u, 65535u);
        _1350 = as_type<float>(_1358);
    }
    float _1360 = _1350;
    float _1362 = -_1344;
    float _1364 = fma(_1362, _1342, 1.0);
    float _1366 = _1314 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1368 = fma(_1346, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1348);
    float _1370 = _1314 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1372 = _1364;
    float _1374 = _1368;
    if (!_830)
    {
        float _1376 = -_1142;
        float _1378 = _707 + _1376;
        _1218 = _1378;
    }
    float _1380 = _1218;
    float _1382 = log2(_1364);
    float _1384 = _621 * _1050;
    if (_1340)
    {
        float _1386 = float(_759);
        _890 = _1386;
    }
    float _1388 = _890;
    float _1390 = fma(_1324, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1366);
    float _1392 = fma(_1324, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1370);
    float _1394 = fma(_581, _1042, _1384);
    float _1396 = fma(_1332, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1390);
    float _1398 = 1.0 / _1368;
    float _1400 = fma(_579, _1080, _1394);
    float _1402 = fma(_1332, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1392);
    if (!_830)
    {
        float _1404 = -_1068;
        float _1406 = _699 + _1404;
        _1372 = _1406;
    }
    float _1408 = _1372;
    float _1410 = _1400 + _1088;
    float _1412 = fma(_1346, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1396);
    float _1414 = fma(_1346, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1402);
    float _1416 = _1366;
    float _1418 = _1412;
    if (_1340)
    {
        float _1420 = rint(_1388);
        float _1422 = precise::max(_1420, 0.0);
        uint _1424 = uint(_1422);
        uint _1426 = clamp(_1424, 0u, 65535u);
        _1416 = as_type<float>(_1426);
    }
    float _1428 = _1416;
    float _1430 = _1382 * 0.693147182464599609375;
    float _1432 = _1410 * _1150;
    float _1434 = _1412 * _1398;
    float _1436 = _1414 * _1398;
    float _1438 = _1430 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1440 = fma(_1434, 0.5, 0.5);
    float _1442 = fma(_1436, -0.5, 0.5);
    float _1444 = _1380;
    if (!_830)
    {
        float3 _5370 = float3(_1408, _1380, float(as_type<int>(_1360)));
        float3 _5374 = select(_5370, float3(0.0), isnan(_5370));
        float _1446 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5374.xy, uint(rint(_5374.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5374.xy, uint(rint(_5374.z)), level(0.0)).x;
        _1444 = _1446;
    }
    float _1448 = _1444;
    float _1450 = _1388;
    if (_1340)
    {
        float3 _5389 = float3(_1294, _1312, float(as_type<int>(_1428)));
        float3 _5391 = select(_5389, float3(0.0), isnan(_5389));
        float _1452 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5391.xy, uint(rint(_5391.z)), _1432, level(0.0));
        _1450 = _1452;
    }
    float _1454 = _1450;
    float3 _5401 = float3(_1440, _1442, _1438);
    float _1456 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5401, float3(0.0), isnan(_5401)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5401, float3(0.0), isnan(_5401)), level(0.0)).x;
    float3 _5410 = float3(_1440, _1442, _1438);
    float4 _1459 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5410, float3(0.0), isnan(_5410)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5410, float3(0.0), isnan(_5410)), level(0.0)).xyzw;
    float _1461 = _1459.x;
    float _1463 = _1459.y;
    float _1465 = _1459.z;
    float _1467 = _1459.w;
    float _1469 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1471 = int(_1469);
    float _1473 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1475 = int(_1473);
    float _1477 = float(_1471);
    float _1479 = 1.0 / _1477;
    float _1481 = float(uint(_1475));
    int _1483 = ~_1475;
    int _1485 = _1483 + 1;
    int _1487 = ~_1475;
    int _1489 = _1487 + 1;
    float _1491 = 1.0 / _1481;
    float _1493 = _147 * _1479;
    float _1495 = trunc(_1493);
    int _1497 = int(_1495);
    int _1499 = as_type<int>(_1491) + (-2);
    float _1501 = _1491;
    float _1503 = as_type<float>(_1489);
    if (_830)
    {
        _1501 = 1.0;
    }
    float _1505 = _1501;
    float _1507 = float(uint(_1497));
    float _1509 = as_type<float>(_1499) * _1507;
    float _1511 = in.m_65.x;
    float _1513 = in.m_65.y;
    float _1515 = trunc(_1509);
    float _1517 = precise::max(_1515, 0.0);
    uint _1519 = uint(_1517);
    int _1521 = _1485 * int(_1519);
    int _1523 = _1521 + _1497;
    float _1525 = float(uint(_1523));
    float _1527 = as_type<float>(_1499) * _1525;
    float _1529 = trunc(_1527);
    float _1531 = precise::max(_1529, 0.0);
    uint _1533 = uint(_1531);
    int _1535 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1537 = _1535 != 0;
    bool _1539 = !_1537;
    float _1541 = _1539 ? 7.345489978790283203125 : 1.0;
    bool _1543 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1545 = isnan(0.5);
    bool _1547 = _1543 || _1545;
    bool _1549 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1551 = _1547 || _1549;
    float _1553 = _1541 * _1511;
    int _1555 = int(_1519) + int(_1533);
    float _1557 = floor(_1553);
    float _1559 = _1505;
    if (_1551)
    {
        _1503 = 1.0;
    }
    float _1561 = _1503;
    int _1563 = _1489 * _1555;
    int _1565 = _1563 + _1497;
    bool _1567 = uint(_1565) >= uint(_1475);
    float _1569 = -_1557;
    float _1571 = _1553 + _1569;
    float _1573 = _1561;
    float _1575 = _1461;
    if (!_1551)
    {
        float _1577 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1579 = _1577 * 0.15915493667125701904296875;
        float _1581 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1583 = _1579 * 6.283185482025146484375;
        float _1585 = cos(_1583);
        float _1587 = _1581 * 0.15915493667125701904296875;
        float _1589 = _1579 * 6.283185482025146484375;
        float _1591 = sin(_1589);
        float _1593 = 1.0 / _1585;
        float _1595 = _1587 * 6.283185482025146484375;
        float _1597 = cos(_1595);
        float _1599 = _1591 * _1593;
        float _1601 = _1587 * 6.283185482025146484375;
        float _1603 = sin(_1601);
        float _1605 = _1597 * _1599;
        float _1607 = 1.0 / _1605;
        float _1609 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1611 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1609;
        float _1613 = 1.0 / _1611;
        float _1615 = _1603 * _1607;
        float _1617 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1619 = fma(_703, _1615, _1617);
        float _1621 = _1619 * _1613;
        float _1623 = precise::clamp(_1621, 0.0, 1.0);
        _892 = _1613;
        _1573 = _1623;
    }
    float _1625 = _892;
    float _1627 = _1573;
    if (!_830)
    {
        int _1629 = _898 << 4;
        int _1631 = _1629 + 2048;
        uint _1633 = uint(int(uint(_1631) >> uint(2)));
        uint _1635 = uint(int(uint(int(_1633)) >> uint(2)));
        int _1637 = int(_1633) & 3;
        float _1639 = (*spvDescriptorSet0.vp_c15)._m0[int(_1635)][_1637];
        int _1641 = int(_1633) + 1;
        uint _1643 = uint(int(uint(_1641) >> uint(2)));
        int _1645 = _1641 & 3;
        float _1647 = (*spvDescriptorSet0.vp_c15)._m0[int(_1643)][_1645];
        int _1649 = _1631 + 8;
        uint _1651 = uint(int(uint(_1649) >> uint(2)));
        uint _1653 = uint(int(uint(int(_1651)) >> uint(2)));
        int _1655 = int(_1651) & 3;
        float _1657 = (*spvDescriptorSet0.vp_c15)._m0[int(_1653)][_1655];
        int _1659 = int(_1651) + 1;
        uint _1661 = uint(int(uint(_1659) >> uint(2)));
        int _1663 = _1659 & 3;
        float _1665 = (*spvDescriptorSet0.vp_c15)._m0[int(_1661)][_1663];
        float _1667 = _621 * _1647;
        float _1669 = fma(_581, _1639, _1667);
        float _1671 = fma(_579, _1657, _1669);
        float _1673 = _1671 + _1665;
        float _1675 = precise::clamp(_1673, 0.0, 1.0);
        float _1677 = -_1675;
        float _1679 = _1677 + _1448;
        float _1681 = fma(_1679, 500.0, 1.5);
        float _1683 = exp2(_1681);
        float _1685 = 0.0 + _1683;
        float _1687 = precise::clamp(_1685, 0.0, 1.0);
        _1559 = _1687;
    }
    float _1689 = _1559;
    float _1691 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1693 = _1282 + _1691;
    float _1695 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1697 = _1284 + _1695;
    float _1699 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1701 = _1286 + _1699;
    float _1703 = _1693 * _1693;
    float _1705 = fma(_1697, _1697, _1703);
    float _1707 = fma(_1701, _1701, _1705);
    float _1709 = rsqrt(_1707);
    float _1711 = sqrt(_1707);
    float _1713 = _1697 * _1709;
    float _1715 = _1701 * _1709;
    float _1717 = _1693 * _1709;
    float _1719 = _1713 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1721 = _1715 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1723 = _1719 * _1719;
    float _1725 = _1721 * _1721;
    float _1727 = _1723 + _1725;
    float _1729 = sqrt(_1727);
    bool _1731 = _1729 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1733 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1735 = _1729 + _1733;
    float _1737 = _1625;
    float _1739 = _1727;
    float _1741 = _1735;
    float _1743 = _1719;
    float _1745 = _1721;
    float _1747 = _1723;
    float _1749 = _1725;
    if (_1731)
    {
        float _1751 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1737 = _1751;
    }
    float _1753 = _1737;
    if (_1731)
    {
        float _1755 = rsqrt(_1727);
        _1739 = _1755;
    }
    float _1757 = _1739;
    if (_1731)
    {
        float _1759 = _1735 * _1753;
        _1741 = _1759;
    }
    float _1761 = _1741;
    float _1763 = 0.0;
    if (_1731)
    {
        float _1765 = _1761 * 0.15915493667125701904296875;
        _1763 = _1765;
    }
    float _1767 = _1763;
    float _1769 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1771 = _1096;
    float _1773 = _1769;
    if (_1731)
    {
        float _1775 = _1767 * 6.283185482025146484375;
        float _1777 = sin(_1775);
        _1771 = _1777;
    }
    float _1779 = _1771;
    float _1781 = precise::max(0.0, _1769);
    float _1783 = _1761;
    if (_1731)
    {
        float _1785 = _1767 * 6.283185482025146484375;
        float _1787 = cos(_1785);
        _1783 = _1787;
    }
    float _1789 = _1783;
    float _1791 = -_1717;
    float _1793 = -_1781;
    float _1795 = fma(_1791, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1793);
    float _1797 = _1795;
    if (_1731)
    {
        float _1799 = _1795 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1773 = _1799;
    }
    float _1801 = _1773;
    float _1803 = _1779;
    float _1805 = _1801;
    if (_1731)
    {
        float _1807 = fma(_1779, _1801, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1803 = _1807;
    }
    float _1809 = _1803;
    float _1811 = _1809;
    if (_1731)
    {
        float _1813 = _1757 * _1809;
        _1811 = _1813;
    }
    float _1815 = _1811;
    if (_1731)
    {
        float _1817 = _1789 + (-1.0);
        _1805 = _1817;
    }
    float _1819 = _1805;
    float _1821 = _1819;
    if (_1731)
    {
        float _1823 = _1719 * _1815;
        _1743 = _1823;
    }
    float _1825 = _1743;
    if (_1731)
    {
        float _1827 = _1721 * _1815;
        _1745 = _1827;
    }
    float _1829 = _1745;
    if (_1731)
    {
        float _1831 = _1819 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1821 = _1831;
    }
    float _1833 = _1821;
    if (_1731)
    {
        float _1835 = _1825 * _1825;
        _1747 = _1835;
    }
    float _1837 = _1747;
    if (_1731)
    {
        float _1839 = _1829 * _1829;
        _1749 = _1839;
    }
    float _1841 = _1749;
    if (_1731)
    {
        float _1843 = fma(_1795, _1789, _1833);
        _1797 = _1843;
    }
    float _1845 = _1797;
    float _1847 = float(_1475);
    float _1849 = fma(_1845, _1845, _1837);
    float _1851 = _1849 + _1841;
    float _1853 = rsqrt(_1851);
    float _1855 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1857 = fma(_1711, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1855);
    float _1859 = precise::clamp(_1857, 0.0, 1.0);
    float _1861 = -_1859;
    float _1863 = _1861 + 1.0;
    float _1865 = abs(_1863);
    float _1867 = log2(_1865);
    float _1869 = _1853 * _1825;
    float _1871 = _1853 * _1845;
    float _1873 = _1853 * _1829;
    float _1875 = float(_1497);
    float _1877 = _1869 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1879 = -_1877;
    float _1881 = fma(_1871, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1879);
    float _1883 = _1867 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1885 = -_1873;
    float _1887 = fma(_1885, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1881);
    float _1889 = exp2(_1883);
    float _1891 = fma(_1887, -0.5, 0.5);
    float _1893 = fma(_1887, 0.5, 0.5);
    float _1895 = fma(_1893, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1897 = sqrt(_1891);
    float _1899 = fma(_1893, _1895, -0.212114393711090087890625);
    float _1901 = _1871 + 1.0;
    float _1903 = fma(_1893, _1899, 1.570728778839111328125);
    bool _1905 = _1875 >= _1847;
    bool _1907 = isnan(_1875);
    bool _1909 = _1905 || _1907;
    bool _1911 = isnan(_1847);
    bool _1913 = _1909 || _1911;
    float _1915 = float(_1913);
    float _1917 = -_1871;
    float _1919 = fma(_1889, _1901, _1917);
    float _1921 = 1.0 / _557;
    bool _1923 = !_1567;
    int _1925 = _1923 ? 0 : (-1);
    float _1927 = fma(_1919, 0.5, 0.5);
    float _1929 = _1897 * 0.636619746685028076171875;
    float _1931 = trunc(_1915);
    int _1933 = int(_1931);
    float _1935 = -_1903;
    float _1937 = fma(_1929, _1935, 1.0);
    float2 _6098 = float2(_1937, _1927);
    float3 _1941 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6098, float2(0.0), isnan(_6098)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6098, float2(0.0), isnan(_6098)), level(0.0)).xyz;
    float _1943 = _1941.x;
    float _1945 = _1941.y;
    float _1947 = _1941.z;
    int _1949 = ~_1555;
    int _1951 = _1949 + _1925;
    int _1953 = _1951 + 1;
    float _1955 = _147 * _1847;
    float _1957 = _1571 * _1847;
    bool _1959 = _1475 == 0;
    float _1961 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1963 = _559 + _1961;
    int _1965 = _1475 * _1953;
    int _1967 = _1965 + _1497;
    float _1969 = _1955 * _1921;
    float _1971 = trunc(_1957);
    int _1973 = int(_1971);
    int _1975 = ~_1933;
    int _1977 = _1975 + 1;
    int _1979 = _1977 + 1;
    float _1981 = _1867 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1983 = !_1959;
    int _1985 = _1983 ? _1967 : (-1);
    float _1987 = -_599;
    float _1989 = _1987 + 1.0;
    int _1991 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1993 = _1991 != 0;
    out.m_74.x = _1284;
    out.m_74.y = _1282;
    out.m_74.z = _1286;
    int _1995 = _1475 + (-1);
    float _1997 = trunc(_1969);
    int _1999 = int(_1997);
    int _2001 = _1985 * _1979;
    bool _2003 = !_1993;
    int _2005 = _2003 ? 0 : 1;
    int _2007 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2009 = _2007 != 0;
    int _2011 = _1933 * _1995;
    int _2013 = _2011 + _2001;
    int _2015 = abs(_884);
    int _2017 = abs(_2005);
    float _2019 = exp2(_1981);
    int _2021 = abs(_902);
    int _2023 = _2013 * _2015;
    bool _2025 = !_2009;
    int _2027 = _2025 ? 0 : 1;
    int _2029 = abs(_906);
    int _2031 = abs(_2027);
    int _2033 = _1973 * _2017;
    int _2035 = _2033 + _1497;
    int _2037 = _1999 * _2021;
    int _2039 = _2037 + _2023;
    int _2041 = _2035 * _2029;
    int _2043 = _2041 + _2039;
    int _2045 = ~_1475;
    int _2047 = _2045 + 1;
    int _2049 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2051 = _2049 != 0;
    int _2053 = _1973 * _2031;
    int _2055 = _2053 + _2043;
    int _2057 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2059 = _2057 != 0;
    int _2061 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2063 = _2061 != 0;
    float _2065 = float(uint(_2055));
    int _2067 = ~_1475;
    int _2069 = _2067 + 1;
    float _2071 = as_type<float>(_1499) * _2065;
    bool _2073 = _1511 > 0.5;
    float _2075 = trunc(_2071);
    float _2077 = precise::max(_2075, 0.0);
    uint _2079 = uint(_2077);
    float _2081 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2083 = fma(_1511, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2081);
    float _2085 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _2087 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _2085;
    float _2089 = 1.0 / _2087;
    int _2091 = _2047 * int(_2079);
    int _2093 = _2091 + _2055;
    float _2095 = float(uint(_2093));
    float _2097 = _1511 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2099 = as_type<float>(_1499) * _2095;
    float _2101 = trunc(_2099);
    float _2103 = precise::max(_2101, 0.0);
    uint _2105 = uint(_2103);
    float _2107 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2109 = -_2107;
    float _2111 = fma(_2097, 2.0, _2109);
    float _2113 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _2115 = _2113 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _2117 = 1.0 / _2115;
    int _2119 = int(_2079) + int(_2105);
    float _2121 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2123 = _1513 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2125 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2083);
    int _2127 = _2069 * _2119;
    int _2129 = _2127 + _2055;
    float _2131 = fma(_2123, -2.0, _2121);
    float _2133 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2135 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _2137 = _559 + _2135;
    bool _2139 = uint(_2129) >= uint(_1475);
    float _2141 = -_147;
    float _2143 = fma(_2141, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2111);
    float _2145 = fma(_1513, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2133);
    float _2147 = _1963 * _2117;
    bool _2149 = !_2139;
    int _2151 = _2149 ? 0 : (-1);
    float _2153 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2145);
    bool _2155 = _1513 > 0.5;
    float _2157 = _2137 * _2089;
    float _2159 = float(uint(_2035));
    float _2161 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2131);
    float _2163 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _2165 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _2163;
    int _2167 = ~_2119;
    int _2169 = _2167 + _2151;
    int _2171 = _2169 + 1;
    float _2173 = as_type<float>(_1499) * _2159;
    float _2175 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _2177 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _2175;
    float _2179 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _2181 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _2179;
    bool _2183 = _559 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _2185 = isnan(_559);
    bool _2187 = _2183 || _2185;
    bool _2189 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _2191 = _2187 || _2189;
    float _2193 = float(_2191);
    int _2195 = _1475 * _2171;
    int _2197 = _2195 + _2055;
    float _2199 = fma(_2177, _2157, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _2201 = trunc(_2173);
    float _2203 = precise::max(_2201, 0.0);
    uint _2205 = uint(_2203);
    float _2207 = fma(_2181, _2157, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _2209 = fma(_2165, _2157, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _2211 = _559 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _2213 = isnan(_559);
    bool _2215 = _2211 || _2213;
    bool _2217 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _2219 = _2215 || _2217;
    float _2221 = float(_2219);
    float _2223 = -_2193;
    float _2225 = _2223 + 1.0;
    bool _2227 = _559 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _2229 = isnan(_559);
    bool _2231 = _2227 || _2229;
    bool _2233 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _2235 = _2231 || _2233;
    float _2237 = float(_2235);
    float _2239 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _2241 = _2239 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    int _2243 = ~_1475;
    int _2245 = _2243 + 1;
    float _2247 = _2221 * _2225;
    float _2249 = -_2221;
    float _2251 = _2249 + 1.0;
    float _2253 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _2255 = _2253 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    bool _2257 = !_1959;
    int _2259 = _2257 ? _2197 : (-1);
    float _2261 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _2263 = _2261 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _2265 = _2237 * _2251;
    float _2267 = fma(_2255, _2147, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    int _2269 = _2259 >> 31;
    int _2271 = _2245 * int(_2205);
    int _2273 = _2271 + _2035;
    float _2275 = fma(_2263, _2147, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _2277 = fma(_2241, _2147, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    int _2279 = _2269 & 3;
    float _2281 = _2199 * _2265;
    float _2283 = float(uint(_2273));
    float _2285 = _2207 * _2265;
    int _2287 = _2259 + _2279;
    float _2289 = _2209 * _2265;
    float _2291 = -_655;
    int _2293 = _2073 ? as_type<int>(_2291) : as_type<int>(_655);
    float _2295 = as_type<float>(_1499) * _2283;
    int _2297 = _2287 >> 2;
    float _2299 = _651 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2301 = -_651;
    int _2303 = _2155 ? as_type<int>(_2301) : as_type<int>(_651);
    float _2305 = -_2237;
    float _2307 = _2305 + 1.0;
    int _2309 = _2297 << 4;
    int _2311 = _2309 + 368;
    float _2313 = trunc(_2295);
    float _2315 = precise::max(_2313, 0.0);
    uint _2317 = uint(_2315);
    bool _2319 = !_2063;
    float _2321 = _2319 ? _651 : as_type<float>(_2303);
    float _2323 = _2299 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2325 = !_2059;
    float _2327 = _2325 ? _655 : as_type<float>(_2293);
    float _2329 = _2299 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2331 = _2299 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2333 = _655 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    uint _2335 = uint(int(uint(_2311) >> uint(2)));
    uint _2337 = uint(int(uint(int(_2335)) >> uint(2)));
    int _2339 = int(_2335) & 3;
    float _2341 = (*spvDescriptorSet0.vp_c9)._m0[int(_2337)][_2339];
    int _2343 = int(_2335) + 1;
    uint _2345 = uint(int(uint(_2343) >> uint(2)));
    int _2347 = _2343 & 3;
    float _2349 = (*spvDescriptorSet0.vp_c9)._m0[int(_2345)][_2347];
    int _2351 = ~_1475;
    int _2353 = _2351 + 1;
    float _2355 = fma(_2307, (*spvDescriptorSet0.vp_c9)._m0[123].z, _2289);
    float _2357 = fma(_2333, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2323);
    float _2359 = fma(_2333, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2329);
    float _2361 = fma(_2333, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2331);
    int _2363 = _2259 & 3;
    bool _2365 = _2363 != 0;
    float _2367 = fma(_2307, (*spvDescriptorSet0.vp_c9)._m0[123].x, _2281);
    float _2369 = fma(_2307, (*spvDescriptorSet0.vp_c9)._m0[123].y, _2285);
    int _2371 = int(_2205) + int(_2317);
    float _2373 = fma(_2277, _2247, _2355);
    int _2375 = _2311 + 8;
    uint _2377 = uint(int(uint(_2375) >> uint(2)));
    uint _2379 = uint(int(uint(int(_2377)) >> uint(2)));
    int _2381 = int(_2377) & 3;
    float _2383 = (*spvDescriptorSet0.vp_c9)._m0[int(_2379)][_2381];
    int _2385 = int(_2377) + 1;
    uint _2387 = uint(int(uint(_2385) >> uint(2)));
    int _2389 = _2385 & 3;
    float _2391 = (*spvDescriptorSet0.vp_c9)._m0[int(_2387)][_2389];
    bool _2393 = uint(_2363) > 1u;
    float _2395 = fma(_2267, _2247, _2367);
    int _2397 = _2353 * _2371;
    int _2399 = _2397 + _2035;
    int _2401 = _2259 & 3;
    bool _2403 = _2401 != 0;
    float _2405 = _2321 + (-0.5);
    float _2407 = fma(_2275, _2247, _2369);
    float _2409 = fma(_2193, (*spvDescriptorSet0.vp_c9)._m0[125].x, _2395);
    bool _2411 = uint(_2399) >= uint(_1475);
    float _2413 = -_2405;
    float _2415 = -_2161;
    float _2417 = fma(_2413, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2415);
    int _2419 = _2403 ? 0 : 1;
    float _2421 = _1314 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2423 = !_2411;
    int _2425 = _2423 ? 0 : (-1);
    float _2427 = -_2153;
    float _2429 = _2427 + 1.0;
    int _2431 = ~_2419;
    int _2433 = _2431 + 1;
    int _2435 = _2433 + 1;
    float _2437 = _2327 + 0.5;
    int _2439 = ~_2371;
    int _2441 = _2439 + _2425;
    int _2443 = _2441 + 1;
    float _2445 = -_2125;
    float _2447 = _2445 + 1.0;
    int _2449 = _2435;
    if (!_2393)
    {
        int _2451 = ~_2419;
        int _2453 = _2451 + 1;
        _2449 = _2453;
    }
    int _2455 = _2449;
    float _2457 = fma(_2193, (*spvDescriptorSet0.vp_c9)._m0[125].y, _2407);
    bool _2459 = _2363 != 3;
    int _2461 = _1475 * _2443;
    int _2463 = _2461 + _2035;
    int _2465 = abs(_2455);
    float _2467 = fma(_2193, (*spvDescriptorSet0.vp_c9)._m0[125].z, _2373);
    bool _2469 = !_2365;
    int _2471 = _2469 ? 0 : 1;
    float _2473 = fma(_2437, (*spvDescriptorSet0.vp_c9)._m0[80].x, _2143);
    bool _2475 = uint(_2363) >= 2u;
    int _2477 = abs(_2471);
    int _2479 = ~_2465;
    int _2481 = _2479 + 1;
    int _2483 = _2481 + 1;
    int _2485 = _2475 ? 0 : 1;
    bool _2487 = _2363 != 3;
    int _2489 = ~_2485;
    int _2491 = _2489 + 1;
    int _2493 = _2491 + 1;
    int _2495 = _2483 * as_type<int>(_2349);
    int _2497 = _2493;
    if (_2459)
    {
        int _2499 = ~_2485;
        int _2501 = _2499 + 1;
        _2497 = _2501;
    }
    int _2503 = _2497;
    float _2505 = abs(_703);
    float _2507 = log2(_2505);
    float _2509 = fma(_1324, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2421);
    bool _2511 = !_2487;
    int _2513 = _2511 ? 0 : (-1);
    int _2515 = abs(_2503);
    int _2517 = abs(_2513);
    int _2519 = ~_2477;
    int _2521 = _2519 + 1;
    int _2523 = _2521 + 1;
    int _2525 = ~_2515;
    int _2527 = _2525 + 1;
    int _2529 = _2527 + 1;
    bool _2531 = !_2051;
    int _2533 = _2531 ? 0 : 1;
    int _2535 = _2523 * as_type<int>(_2341);
    int _2537 = _2535 + _2495;
    int _2539 = ~_2517;
    int _2541 = _2539 + 1;
    int _2543 = _2541 + 1;
    float _2545 = fma(_1332, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2509);
    int _2547 = abs(_2533);
    int _2549 = _2529 * as_type<int>(_2383);
    int _2551 = _2549 + _2537;
    float _2553 = _2507 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2555 = _2457 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2557 = fma(_1346, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2545);
    int _2559 = _2543 * as_type<int>(_2391);
    int _2561 = _2559 + _2551;
    float _2563 = fma(_2321, _2429, _2417);
    float _2565 = _2409 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2567 = exp2(_2553);
    float _2569 = _2467 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2571 = -_2447;
    float _2573 = fma(_2327, _2571, _2473);
    float _2575 = _2565 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2577 = _2555 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2579 = _2569 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.gl_Position.x = _1412;
    out.gl_Position.y = _1414;
    out.gl_Position.z = _2557;
    out.gl_Position.w = _1368;
    bool _2581 = _703 <= 8000.0;
    bool _2583 = isnan(_703);
    bool _2585 = _2581 || _2583;
    bool _2587 = isnan(8000.0);
    bool _2589 = _2585 || _2587;
    float _2591 = float(_2589);
    out.m_76.x = _2575;
    out.m_76.y = _2577;
    out.m_76.z = _2579;
    int _2593 = ~_2547;
    int _2595 = _2593 + 1;
    int _2597 = _2595 + 1;
    bool _2599 = !_1959;
    int _2601 = _2599 ? _2463 : (-1);
    float _2603 = fma(_2567, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2605 = precise::clamp(_2603, 0.0, 1.0);
    out.m_78.x = _2573;
    out.m_78.y = _2563;
    int _2607 = _2561 * _2597;
    bool _2609 = _1711 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2611 = isnan(_1711);
    bool _2613 = _2609 || _2611;
    bool _2615 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2617 = _2613 || _2615;
    int _2619 = _2601 * _2547;
    int _2621 = _2619 + _2607;
    float _2623 = _2557 + _1368;
    float _2625 = fma(_2605, -2.0, 3.0);
    float _2627 = _2605 * _2605;
    float _2629 = _2579;
    if (!_1340)
    {
        _1418 = 1.0;
    }
    float _2631 = _1418;
    float _2633 = _2623 * 0.5;
    float _2635 = _2631;
    if (_1340)
    {
        bool _2637 = _1454 >= _1432;
        bool _2639 = isnan(_1454);
        bool _2641 = _2637 || _2639;
        bool _2643 = isnan(_1432);
        bool _2645 = _2641 || _2643;
        float _2647 = float(_2645);
        _2635 = _2647;
    }
    float _2649 = _2635;
    float _2651 = _2627 * _2625;
    float _2653 = float(_2621);
    out.m_80.z = _2633;
    out.m_80.w = _1368;
    float _2655 = -_2651;
    float _2657 = _2655 + 1.0;
    float _2659 = _2649 * _1689;
    float _2661 = _2651;
    if (!_2617)
    {
        _2629 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2663 = _2629;
    out.m_82.x = _2653;
    float _2665 = fma(_2657, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2651);
    float _2667 = _2663;
    float _2669 = _2663;
    if (!_2617)
    {
        _2661 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2671 = _2661;
    float _2673 = _2671;
    float _2675 = _2671;
    if (!_2617)
    {
        _1374 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2677 = _1374;
    float _2679 = _2591 * _2665;
    float _2681 = _2679 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2683 = -_2019;
    float _2685 = _2683 + 1.0;
    float _2687 = _1989 * _2681;
    float _2689 = precise::clamp(_2687, 0.0, 1.0);
    float _2691 = _2685 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2693 = _2361 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _2695 = -_2689;
    float _2697 = fma(_2695, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2699 = _2691 * _1456;
    float _2701 = -_2691;
    float _2703 = _2701 + 1.0;
    float _2705 = -_2659;
    float _2707 = fma(_2705, _2697, 1.0);
    float _2709 = precise::clamp(_2707, 0.0, 1.0);
    float _2711 = _1467 * _2699;
    float _2713 = _1947 * _2699;
    float _2715 = _1467 * _2703;
    float _2717 = _2357 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _2719 = fma(_1943, _2711, _1461);
    float _2721 = fma(_1945, _2711, _1463);
    float _2723 = fma(_1467, _2713, _1465);
    float _2725 = _2359 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _2727 = _2709 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2729 = _1627 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2731 = _2703;
    float _2733 = _2727;
    float _2735 = _2677;
    float _2737 = _2677;
    if (!_2617)
    {
        _1575 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2739 = _1575;
    out.m_84.x = _2719;
    out.m_84.y = _2721;
    out.m_84.z = _2723;
    out.m_84.w = _2715;
    float _2741 = _2739;
    float _2743 = _2739;
    if (!_2617)
    {
        _2731 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2745 = _2731;
    out.m_86.x = _2717;
    out.m_86.y = _2725;
    out.m_86.z = _2693;
    out.m_88.x = _2727;
    float _2747 = _2745;
    float _2749 = _2745;
    if (!_2617)
    {
        _2733 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2751 = _2733;
    bool _2753 = !_2617;
    float _2755 = _2751;
    float _2757 = _2751;
    if (!_2753)
    {
        bool _2759 = _1711 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2761 = isnan(_1711);
        bool _2763 = _2759 || _2761;
        bool _2765 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2767 = _2763 || _2765;
        if (!_2767)
        {
            float _2769 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2771 = _1711 + _2769;
            float _2773 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2775 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2773;
            float _2777 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2779 = _2777 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2781 = 1.0 / _2775;
            float _2783 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2785 = _2783 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2787 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2789 = _2787 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2791 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2793 = _2791 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2795 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2797 = _2795 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2799 = _2771 * _2781;
            float _2801 = precise::clamp(_2799, 0.0, 1.0);
            float _2803 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2805 = _2803 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2807 = fma(_2801, _2779, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2809 = fma(_2801, _2805, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2811 = fma(_2801, _2785, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2813 = fma(_2801, _2789, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2815 = fma(_2801, _2793, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2817 = fma(_2801, _2797, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2743 = _2807;
            _2737 = _2815;
            _2675 = _2811;
            _2749 = _2813;
            _2669 = _2809;
            _2757 = _2817;
            _2819 = true;
        }
        else
        {
            bool _2821 = _1711 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2823 = isnan(_1711);
            bool _2825 = _2821 || _2823;
            bool _2827 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2829 = _2825 || _2827;
            if (!_2829)
            {
                _2673 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2831 = _2673;
            _2675 = _2831;
            if (!_2829)
            {
                _2741 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2833 = _2741;
            _2743 = _2833;
            if (!_2829)
            {
                _2667 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2835 = _2667;
            _2669 = _2835;
            if (!_2829)
            {
                _2747 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2837 = _2747;
            _2749 = _2837;
            if (!_2829)
            {
                _2735 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2839 = _2735;
            _2737 = _2839;
            if (!_2829)
            {
                _2755 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2841 = _2755;
            bool _2843 = !_2829;
            _2757 = _2841;
            if (!_2843)
            {
                bool _2845 = _1711 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2847 = isnan(_1711);
                bool _2849 = _2845 || _2847;
                bool _2851 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2853 = _2849 || _2851;
                if (!_2853)
                {
                    float _2855 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2857 = _1711 + _2855;
                    float _2859 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2861 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2859;
                    float _2863 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2865 = _2863 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2867 = 1.0 / _2861;
                    float _2869 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2871 = _2869 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2873 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2875 = _2873 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2877 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2879 = _2877 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2881 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2883 = _2881 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2885 = _2857 * _2867;
                    float _2887 = precise::clamp(_2885, 0.0, 1.0);
                    float _2889 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2891 = _2889 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2893 = fma(_2887, _2865, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2895 = fma(_2887, _2891, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2897 = fma(_2887, _2871, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2899 = fma(_2887, _2875, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2901 = fma(_2887, _2879, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2903 = fma(_2887, _2883, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2743 = _2893;
                    _2737 = _2901;
                    _2675 = _2897;
                    _2749 = _2899;
                    _2669 = _2895;
                    _2757 = _2903;
                    _2819 = true;
                }
                else
                {
                    _2743 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2737 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2675 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2749 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2669 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2757 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2819 = false;
    float _2905 = _2743;
    float _2907 = _2737;
    float _2909 = _2675;
    float _2911 = _2749;
    float _2913 = _2669;
    float _2915 = _2757;
    float _2917 = fma(_2725, -0.5, 0.5);
    float _2919 = precise::clamp(_2917, 0.0, 1.0);
    float _2921 = -_2905;
    float _2923 = _2921 + _2907;
    float _2925 = _2729 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2927 = -_2909;
    float _2929 = _2927 + _2911;
    out.m_90.x = 0.0;
    float _2931 = fma(_2919, _2923, _2905);
    float _2933 = fma(_2919, _2929, _2909);
    out.m_59.x = _2925;
    float _2935 = -_2913;
    float _2937 = _2935 + _2915;
    float _2939 = _2931 * 0.586610972881317138671875;
    bool _2941 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2943 = fma(_2919, _2937, _2913);
    float _2945 = fma(_2933, 0.298911988735198974609375, _2939);
    bool _2947 = _1627 > 0.0;
    bool _2949 = isnan(_1627);
    bool _2951 = _2947 || _2949;
    bool _2953 = isnan(0.0);
    bool _2955 = _2951 || _2953;
    out.m_92.x = 0.0;
    float _2957 = fma(_2943, 0.114477999508380889892578125, _2945);
    float _2959 = -_2957;
    float _2961 = _2933 + _2959;
    float _2963 = -_2957;
    float _2965 = _2931 + _2963;
    float _2967 = -_2957;
    float _2969 = _2943 + _2967;
    float _2971 = fma(_2961, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2957);
    float _2973 = fma(_2965, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2957);
    float _2975 = fma(_2969, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2957);
    bool _2977 = !_2941;
    if (!_2977)
    {
        float _2979 = -_1282;
        float _2981 = _2979 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2983 = -_1284;
        float _2985 = _2983 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2987 = -_1286;
        float _2989 = _2987 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2991 = _2981 * _2981;
        float _2993 = fma(_2985, _2985, _2991);
        float _2995 = fma(_2989, _2989, _2993);
        float _2997 = rsqrt(_2995);
        float _2999 = _2981 * _2997;
        float _3001 = _2985 * _2997;
        float _3003 = _2989 * _2997;
        float _3005 = sqrt(_2995);
        float _3007 = -_1717;
        float _3009 = _3007 + _2999;
        float _3011 = -_1713;
        float _3013 = _3011 + _3001;
        float _3015 = -_1715;
        float _3017 = _3015 + _3003;
        float _3019 = _3009 * _3009;
        float _3021 = fma(_3013, _3013, _3019);
        float _3023 = fma(_3017, _3017, _3021);
        float _3025 = -_3005;
        float _3027 = _3025 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3029 = rsqrt(_3023);
        float _3031 = _3027 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3033 = precise::clamp(_3031, 0.0, 1.0);
        float _3035 = abs(_3033);
        float _3037 = log2(_3035);
        float _3039 = _3009 * _3029;
        float _3041 = _3013 * _3029;
        float _3043 = _3017 * _3029;
        float _3045 = _2725 * _3039;
        float _3047 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
        float _3049 = precise::clamp(_3047, 0.0, 1.0);
        float _3051 = _2725 * _2999;
        float _3053 = fma(_2717, _3041, _3045);
        float _3055 = _3049 * _3049;
        float _3057 = _3037 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3059 = fma(_2717, _3001, _3051);
        float _3061 = fma(_2693, _3043, _3053);
        float _3063 = precise::clamp(_3061, 0.0, 1.0);
        float _3065 = _3055 + (-1.0);
        float _3067 = fma(_2693, _3003, _3059);
        float _3069 = precise::clamp(_3067, 0.0, 1.0);
        float _3071 = _3063 * _3063;
        float _3073 = _3001 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3075 = exp2(_3057);
        float _3077 = fma(_3071, _3065, 1.0);
        float _3079 = -_2999;
        float _3081 = -_3073;
        float _3083 = fma(_3079, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3081);
        float _3085 = _3077 * _3077;
        float _3087 = -_3003;
        float _3089 = fma(_3087, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3083);
        float _3091 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3093 = _3089 + _3091;
        float _3095 = 1.0 / _3085;
        float _3097 = _3093 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3099 = precise::clamp(_3097, 0.0, 1.0);
        float _3101 = _3075 * _3099;
        float _3103 = _3069 * _3101;
        float _3105 = _3103 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3107 = _3055 * _3095;
        float _3109 = _3103 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3111 = _3103 * _3107;
        float _3113 = _3103 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        float _3115 = _3111 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3117 = _3111 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3119 = _3111 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_90.x = _3105;
        out.m_90.y = _3109;
        out.m_90.z = _3113;
        out.m_92.x = _3115;
        out.m_92.y = _3117;
        out.m_92.z = _3119;
    }
    out.m_94.x = _2971;
    out.m_94.y = _2973;
    out.m_94.z = _2975;
    if (_2955)
    {
        return out;
    }
    out.m_59.x = 0.0;
    float _3121 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3121;
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
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2819 = false;
    bool _549 = false;
    bool _409 = false;
    bool _215 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _108 = in.m_56.w;
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
        out.m_59.x = 0.0;
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
        float _3178 = as_type<float>(_129);
        out.gl_Position.z = _3178;
    }
    if (!_117)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _133 = in.m_61.w;
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
        out.m_59.x = 0.0;
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
        float _3246 = as_type<float>(_165);
        out.gl_Position.z = _3246;
    }
    if (_159)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _167 = in.m_63.x;
    float _169 = in.m_63.y;
    float _171 = in.m_63.z;
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
        float _197 = in.m_65.x;
        float _199 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _201 = _197 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _203 = fma(_201, (*spvDescriptorSet0.vp_c9)._m0[12].x, _147);
        float _205 = _203 * _199;
        float _207 = floor(_205);
        float _209 = -_207;
        float _211 = _205 + _209;
        _213 = _211;
        _215 = true;
    }
    else
    {
        float _217 = float(_113);
        float _219 = 1.0 / _217;
        float _221 = _147 * _219;
        _213 = _221;
    }
    _215 = false;
    float _223 = _213;
    float _225 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _227 = _223 + _225;
    float _229 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _231 = _223 + _229;
    float _233 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _235 = _223 + _233;
    float _237 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _239 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _237;
    float _241 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _243 = _241 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _245 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _247 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _245;
    float _249 = 1.0 / _239;
    bool _251 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _253 = 1.0 / _247;
    bool _255 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _257 = isnan(_223);
    bool _259 = _255 || _257;
    bool _261 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _263 = _259 || _261;
    float _265 = float(_263);
    float _267 = 1.0 / _243;
    float _269 = _227 * _249;
    bool _271 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _273 = isnan(_223);
    bool _275 = _271 || _273;
    bool _277 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _279 = _275 || _277;
    float _281 = float(_279);
    float _283 = _231 * _253;
    bool _285 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _287 = isnan(_223);
    bool _289 = _285 || _287;
    bool _291 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _293 = _289 || _291;
    float _295 = float(_293);
    float _297 = -_265;
    float _299 = _297 + 1.0;
    float _301 = _295 * _299;
    float _303 = -_295;
    float _305 = _303 + 1.0;
    float _307 = _235 * _267;
    float _309 = -_281;
    float _311 = _309 + 1.0;
    bool _313 = _223 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _315 = isnan(_223);
    bool _317 = _313 || _315;
    bool _319 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _321 = _317 || _319;
    float _323 = float(_321);
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _327 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _325;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _331 = _329 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _333 = _265 * _311;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _337 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _335;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _341 = _339 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _343 = fma(_327, _269, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _345 = _323 * _305;
    float _347 = fma(_337, _269, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _349 = fma(_331, _307, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _351 = fma(_341, _307, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _353 = -_323;
    float _355 = _353 + 1.0;
    float _357 = _343 * _345;
    float _359 = _347 * _345;
    float _361 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _363 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _361;
    float _365 = fma(_355, (*spvDescriptorSet0.vp_c9)._m0[143].x, _357);
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _369 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _367;
    float _371 = fma(_355, (*spvDescriptorSet0.vp_c9)._m0[143].y, _359);
    float _373 = fma(_363, _283, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _375 = fma(_349, _301, _365);
    float _377 = fma(_369, _283, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _379 = fma(_351, _301, _371);
    float _381 = fma(_373, _333, _375);
    float _383 = fma(_377, _333, _379);
    float _385 = fma(_281, (*spvDescriptorSet0.vp_c9)._m0[146].x, _381);
    float _387 = fma(_281, (*spvDescriptorSet0.vp_c9)._m0[146].y, _383);
    bool _389 = !_251;
    float _407;
    if (!_389)
    {
        float _391 = in.m_65.x;
        float _393 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _395 = _391 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _397 = fma(_395, (*spvDescriptorSet0.vp_c9)._m0[11].x, _147);
        float _399 = _397 * _393;
        float _401 = floor(_399);
        float _403 = -_401;
        float _405 = _399 + _403;
        _407 = _405;
        _409 = true;
    }
    else
    {
        float _411 = float(_113);
        float _413 = 1.0 / _411;
        float _415 = _147 * _413;
        _407 = _415;
    }
    _409 = false;
    float _417 = _407;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _421 = _417 + _419;
    float _423 = in.m_67.x;
    float _425 = in.m_67.y;
    bool _427 = _417 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _429 = isnan(_417);
    bool _431 = _427 || _429;
    bool _433 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _435 = _431 || _433;
    float _437 = float(_435);
    float _439 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _441 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _439;
    float _443 = 1.0 / _441;
    float _445 = -_437;
    float _447 = _445 + 1.0;
    bool _449 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _451 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _453 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _455 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _453;
    float _457 = _421 * _443;
    float _459 = _385 * _423;
    bool _461 = _417 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _463 = isnan(_417);
    bool _465 = _461 || _463;
    bool _467 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _469 = _465 || _467;
    float _471 = float(_469);
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _475 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _473;
    float _477 = fma(_455, _457, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _481 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _479;
    float _483 = _471 * _447;
    float _485 = fma(_475, _457, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _487 = fma(_481, _457, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _489 = -_471;
    float _491 = _489 + 1.0;
    float _493 = _477 * _483;
    float _495 = _485 * _483;
    float _497 = _487 * _483;
    float _499 = fma(_491, (*spvDescriptorSet0.vp_c9)._m0[107].x, _495);
    float _501 = fma(_491, (*spvDescriptorSet0.vp_c9)._m0[107].y, _497);
    float _503 = fma(_491, (*spvDescriptorSet0.vp_c9)._m0[107].z, _493);
    float _505 = fma(_437, (*spvDescriptorSet0.vp_c9)._m0[108].x, _499);
    float _507 = fma(_437, (*spvDescriptorSet0.vp_c9)._m0[108].y, _501);
    float _509 = fma(_437, (*spvDescriptorSet0.vp_c9)._m0[108].z, _503);
    float _511 = _505 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _513 = _507 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _515 = _509 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _517 = _511 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _519 = _513 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _521 = _515 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _523 = _387 * _425;
    out.m_69.x = _517;
    out.m_69.y = _519;
    out.m_69.z = _521;
    out.m_69.w = _451;
    bool _525 = !_449;
    float _545;
    float _547;
    if (!_525)
    {
        float _527 = in.m_65.x;
        float _529 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _531 = float(_113);
        float _533 = _527 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _535 = fma(_533, (*spvDescriptorSet0.vp_c9)._m0[11].z, _147);
        float _537 = _535 * _529;
        float _539 = floor(_537);
        float _541 = -_539;
        float _543 = _537 + _541;
        _545 = _531;
        _547 = _543;
        _549 = true;
    }
    else
    {
        float _551 = float(_113);
        float _553 = 1.0 / _551;
        float _555 = _147 * _553;
        _545 = _551;
        _547 = _555;
    }
    _549 = false;
    float _557 = _545;
    float _559 = _547;
    float _561 = in.m_56.x;
    float _563 = in.m_56.y;
    float _565 = in.m_56.z;
    float _567 = _563 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _569 = _563 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _571 = fma(_561, (*spvDescriptorSet0.vp_c10)._m0[6].x, _567);
    float _573 = fma(_561, (*spvDescriptorSet0.vp_c10)._m0[4].x, _569);
    float _575 = fma(_565, (*spvDescriptorSet0.vp_c10)._m0[6].z, _571);
    float _577 = fma(_565, (*spvDescriptorSet0.vp_c10)._m0[4].z, _573);
    float _579 = _575 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _581 = _577 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _583 = fma(_579, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _585 = fma(_581, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _587 = floor(_583);
    float _589 = floor(_585);
    float _591 = -_587;
    float _593 = _583 + _591;
    float _595 = -_589;
    float _597 = _585 + _595;
    float2 _3971 = float2(_597, _593);
    float _599 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3971, float2(0.0), isnan(_3971)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3971, float2(0.0), isnan(_3971)), level(0.0)).x;
    float _601 = _563 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _603 = _523 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _605 = fma(_561, (*spvDescriptorSet0.vp_c10)._m0[5].x, _601);
    float _607 = _459 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _609 = fma(_565, (*spvDescriptorSet0.vp_c10)._m0[5].z, _605);
    float _611 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _613 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _615 = _609 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _617 = as_type<float>(int(gl_VertexIndex));
    float _619 = _615 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _621 = _615 + _613;
    float _623 = fma(_581, (*spvDescriptorSet0.vp_c8)._m0[11].x, _619);
    float _625 = fma(_579, (*spvDescriptorSet0.vp_c8)._m0[11].z, _623);
    float _627 = _615 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _629 = _625 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _631 = fma(_581, (*spvDescriptorSet0.vp_c8)._m0[10].x, _627);
    float _633 = 1.0 / _629;
    float _635 = fma(_579, (*spvDescriptorSet0.vp_c8)._m0[10].z, _631);
    float _637 = _635 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    int _639 = as_type<int>(_617) & 1;
    bool _641 = _639 != 0;
    int _643 = as_type<int>(_617) & 2;
    bool _645 = _643 != 0;
    float _647 = _637 + _629;
    bool _649 = !_645;
    float _651 = _649 ? (-0.5) : 0.5;
    bool _653 = !_641;
    float _655 = _653 ? (-0.5) : 0.5;
    float _657 = _647 * _633;
    float _659 = _657 * 0.5;
    float _661 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _651);
    float _663 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _665 = fma(_659, (*spvDescriptorSet0.vp_c8)._m0[30].w, _663);
    float _667 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _655);
    float _669 = _603 * _661;
    float _671 = _607 * _667;
    float _673 = 1.0 / _665;
    float _675 = _669 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _677 = _621 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _679 = fma(_671, (*spvDescriptorSet0.vp_c8)._m0[24].x, _675);
    float _681 = _621 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _683 = fma(_581, (*spvDescriptorSet0.vp_c15)._m0[126].x, _677);
    float _685 = _669 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _687 = fma(_611, (*spvDescriptorSet0.vp_c8)._m0[24].z, _679);
    float _689 = fma(_581, (*spvDescriptorSet0.vp_c15)._m0[127].x, _681);
    float _691 = fma(_579, (*spvDescriptorSet0.vp_c15)._m0[126].z, _683);
    float _693 = fma(_671, (*spvDescriptorSet0.vp_c8)._m0[26].x, _685);
    float _695 = _669 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _697 = fma(_579, (*spvDescriptorSet0.vp_c15)._m0[127].z, _689);
    float _699 = _691 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _701 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _703 = _673 * _701;
    float _705 = fma(_611, (*spvDescriptorSet0.vp_c8)._m0[26].z, _693);
    float _707 = _697 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _709 = trunc(_699);
    int _711 = int(_709);
    float _713 = _687 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    bool _715 = _703 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _717 = _705 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    bool _719 = _703 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _721 = _581 + _713;
    bool _723 = !_715;
    int _725 = _723 ? 0 : 1;
    float _727 = _579 + _717;
    float _729 = trunc(_707);
    int _731 = int(_729);
    float _733 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _735 = _721 + _733;
    float _737 = fma(_671, (*spvDescriptorSet0.vp_c8)._m0[25].x, _695);
    float _739 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _741 = _727 + _739;
    float _743 = fma(_611, (*spvDescriptorSet0.vp_c8)._m0[25].z, _737);
    int _745 = 2;
    float _747 = _695;
    float _749 = _721;
    float _751 = _727;
    if (!_715)
    {
        _745 = 1;
    }
    int _753 = _745;
    float _755 = _741 * _741;
    int _757 = _753;
    if (!_719)
    {
        _757 = _725;
    }
    int _759 = _757;
    float _761 = _743 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _763 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _765 = _711 + _763;
    int _767 = _765 + 1;
    float _769 = fma(_735, _735, _755);
    int _771 = _759 << 6;
    float _773 = _615 + _761;
    bool _775 = _767 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    float _777 = sqrt(_769);
    int _779 = _771 + 48;
    uint _782 = uint(int(uint(_779) >> uint(2)));
    uint _784 = uint(int(uint(int(_782)) >> uint(2)));
    int _786 = int(_782) & 3;
    float _788 = (*spvDescriptorSet0.vp_c15)._m0[int(_784)][_786];
    int _790 = int(_782) + 1;
    uint _792 = uint(int(uint(_790) >> uint(2)));
    int _794 = _790 & 3;
    float _796 = (*spvDescriptorSet0.vp_c15)._m0[int(_792)][_794];
    int _798 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _800 = _731 + _798;
    int _802 = _800 + 1;
    int _804 = _767 | _802;
    int _806 = _771 + 56;
    uint _808 = uint(int(uint(_806) >> uint(2)));
    uint _810 = uint(int(uint(int(_808)) >> uint(2)));
    int _812 = int(_808) & 3;
    float _814 = (*spvDescriptorSet0.vp_c15)._m0[int(_810)][_812];
    int _816 = int(_808) + 1;
    uint _818 = uint(int(uint(_816) >> uint(2)));
    int _820 = _816 & 3;
    float _822 = (*spvDescriptorSet0.vp_c15)._m0[int(_818)][_820];
    bool _824 = _804 < 0;
    bool _826 = _824 || _775;
    bool _828 = _802 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _830 = _828 || _826;
    bool _832 = _777 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _834 = _771 + 64;
    uint _836 = uint(int(uint(_834) >> uint(2)));
    uint _838 = uint(int(uint(int(_836)) >> uint(2)));
    int _840 = int(_836) & 3;
    float _842 = (*spvDescriptorSet0.vp_c15)._m0[int(_838)][_840];
    int _844 = int(_836) + 1;
    uint _846 = uint(int(uint(_844) >> uint(2)));
    int _848 = _844 & 3;
    float _850 = (*spvDescriptorSet0.vp_c15)._m0[int(_846)][_848];
    int _852 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _854 = _852 != 0;
    int _856 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _858 = _856 != 0;
    int _860 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _862 = _860 != 0;
    int _864 = _771 + 72;
    uint _866 = uint(int(uint(_864) >> uint(2)));
    uint _868 = uint(int(uint(int(_866)) >> uint(2)));
    int _870 = int(_866) & 3;
    float _872 = (*spvDescriptorSet0.vp_c15)._m0[int(_868)][_870];
    int _874 = int(_866) + 1;
    uint _876 = uint(int(uint(_874) >> uint(2)));
    int _878 = _874 & 3;
    float _880 = (*spvDescriptorSet0.vp_c15)._m0[int(_876)][_878];
    bool _882 = !_858;
    int _884 = _882 ? 0 : 1;
    int _886 = _767;
    float _888 = _777;
    float _890 = as_type<float>(_759);
    float _892 = as_type<float>(_771);
    if (!_830)
    {
        int _894 = _802 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _896 = _894 + _767;
        _886 = _896;
    }
    int _898 = _886;
    bool _900 = !_854;
    int _902 = _900 ? 0 : 1;
    bool _904 = !_862;
    int _906 = _904 ? 0 : 1;
    int _908 = 0;
    if (!_830)
    {
        int _910 = _898 << 2;
        _908 = _910;
    }
    int _912 = _908;
    int _914 = _771 + 96;
    uint _916 = uint(int(uint(_914) >> uint(2)));
    uint _918 = uint(int(uint(int(_916)) >> uint(2)));
    int _920 = int(_916) & 3;
    float _922 = (*spvDescriptorSet0.vp_c15)._m0[int(_918)][_920];
    int _924 = int(_916) + 1;
    uint _926 = uint(int(uint(_924) >> uint(2)));
    int _928 = _924 & 3;
    float _930 = (*spvDescriptorSet0.vp_c15)._m0[int(_926)][_928];
    int _932 = 0;
    int _934 = _912;
    if (!_830)
    {
        uint _936 = uint(int(uint(_898) >> uint(2)));
        _932 = int(_936);
    }
    int _938 = _932;
    if (!_830)
    {
        int _940 = 12 & _912;
        _934 = _940;
    }
    int _942 = _934;
    if (!_832)
    {
        _747 = _773;
    }
    float _944 = _747;
    int _946 = _771 + 104;
    uint _948 = uint(int(uint(_946) >> uint(2)));
    uint _950 = uint(int(uint(int(_948)) >> uint(2)));
    int _952 = int(_948) & 3;
    float _954 = (*spvDescriptorSet0.vp_c15)._m0[int(_950)][_952];
    int _956 = int(_948) + 1;
    uint _958 = uint(int(uint(_956) >> uint(2)));
    int _960 = _956 & 3;
    float _962 = (*spvDescriptorSet0.vp_c15)._m0[int(_958)][_960];
    bool _964 = !_832;
    float _966 = _944;
    float _968 = _930;
    float _970 = _796;
    if (!_964)
    {
        float _972 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _974 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _976 = _777 + _974;
        float _978 = rsqrt(_769);
        float _980 = _976 * _972;
        float _982 = _773 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _984 = _980 * 0.15915493667125701904296875;
        float _986 = _984 * 6.283185482025146484375;
        float _988 = cos(_986);
        float _990 = _984 * 6.283185482025146484375;
        float _992 = sin(_990);
        float _994 = _988 + (-1.0);
        float _996 = _994 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _998 = fma(_992, _982, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1000 = fma(_773, _988, _996);
        float _1002 = _978 * _998;
        float _1004 = fma(_735, _1002, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1006 = fma(_741, _1002, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _966 = _1000;
        _749 = _1004;
        _751 = _1006;
        _888 = _984;
    }
    float _1008 = _966;
    float _1010 = _749;
    float _1012 = _751;
    float _1014 = _888;
    float _1016 = _1014;
    float _1018 = _1010;
    float _1020 = _1008;
    float _1022 = _1012;
    if (!_830)
    {
        int _1024 = _938 << 4;
        int _1026 = _1024 + _942;
        _1016 = as_type<float>(_1026);
    }
    float _1028 = _1016;
    float _1030 = -_615;
    float _1032 = _1030 + _1008;
    int _1034 = _771 + 80;
    uint _1036 = uint(int(uint(_1034) >> uint(2)));
    uint _1038 = uint(int(uint(int(_1036)) >> uint(2)));
    int _1040 = int(_1036) & 3;
    float _1042 = (*spvDescriptorSet0.vp_c15)._m0[int(_1038)][_1040];
    int _1044 = int(_1036) + 1;
    uint _1046 = uint(int(uint(_1044) >> uint(2)));
    int _1048 = _1044 & 3;
    float _1050 = (*spvDescriptorSet0.vp_c15)._m0[int(_1046)][_1048];
    float _1052 = -_581;
    float _1054 = _1052 + _1010;
    float _1056 = -_579;
    float _1058 = _1056 + _1012;
    float _1060 = _1032 * _1032;
    float _1062 = _621 * _930;
    float _1064 = _621 * _850;
    if (!_830)
    {
        float _1066 = floor(_699);
        _968 = _1066;
    }
    float _1068 = _968;
    float _1070 = fma(_1054, _1054, _1060);
    int _1072 = _771 + 88;
    uint _1074 = uint(int(uint(_1072) >> uint(2)));
    uint _1076 = uint(int(uint(int(_1074)) >> uint(2)));
    int _1078 = int(_1074) & 3;
    float _1080 = (*spvDescriptorSet0.vp_c15)._m0[int(_1076)][_1078];
    int _1082 = int(_1074) + 1;
    uint _1084 = uint(int(uint(_1082) >> uint(2)));
    int _1086 = _1082 & 3;
    float _1088 = (*spvDescriptorSet0.vp_c15)._m0[int(_1084)][_1086];
    float _1090 = fma(_581, _922, _1062);
    float _1092 = fma(_581, _842, _1064);
    float _1094 = fma(_1058, _1058, _1070);
    float _1096 = fma(_579, _954, _1090);
    float _1098 = _621 * _796;
    float _1100 = sqrt(_1094);
    float _1102 = _1028;
    float _1104 = _1098;
    if (!_830)
    {
        int _1106 = as_type<int>(_1028) + 400;
        uint _1108 = uint(int(uint(_1106) >> uint(2)));
        uint _1110 = uint(int(uint(int(_1108)) >> uint(2)));
        int _1112 = int(_1108) & 3;
        float _1114 = (*spvDescriptorSet0.vp_c15)._m0[int(_1110)][_1112];
        _1102 = _1114;
    }
    float _1116 = _1102;
    float _1118 = _1096 + _962;
    float _1120 = fma(_581, _788, _1098);
    float _1122 = fma(_579, _872, _1092);
    bool _1124 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1126 = isnan(0.5);
    bool _1128 = _1124 || _1126;
    bool _1130 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1132 = _1128 || _1130;
    float _1134 = fma(_579, _814, _1120);
    float _1136 = _1090;
    float _1138 = _1120;
    if (!_830)
    {
        float _1140 = floor(_707);
        _1136 = _1140;
    }
    float _1142 = _1136;
    float _1144 = _1122 + _880;
    float _1146 = _1134 + _822;
    bool _1148 = _1100 > 0.0;
    float _1150 = 1.0 / _1118;
    bool _1152 = !_1148;
    if (!_1152)
    {
        float _1154 = _189 * _189;
        float _1156 = rsqrt(_1094);
        float _1158 = fma(_187, _187, _1154);
        float _1160 = fma(_191, _191, _1158);
        float _1162 = sqrt(_1160);
        float _1164 = _1054 * _1156;
        float _1166 = _1032 * _1156;
        float _1168 = _1058 * _1156;
        bool _1170 = _1162 > 0.0;
        bool _1172 = !_1170;
        _970 = _1160;
        _1138 = _1162;
        _1104 = _1166;
        if (!_1172)
        {
            float _1174 = rsqrt(_1160);
            float _1176 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1178 = _189 * _1174;
            float _1180 = _187 * _1174;
            float _1182 = _1166 * _1178;
            float _1184 = _191 * _1174;
            float _1186 = fma(_1164, _1180, _1182);
            float _1188 = _1176 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1190 = fma(_1168, _1184, _1186);
            float _1192 = _1190 * _1188;
            float _1194 = fma(_187, _1192, _1010);
            float _1196 = fma(_189, _1192, _1008);
            float _1198 = fma(_191, _1192, _1012);
            _1018 = _1194;
            _1020 = _1196;
            _1022 = _1198;
            _970 = _1174;
            _1138 = _1192;
        }
    }
    float _1200 = _1018;
    float _1202 = _1020;
    float _1204 = _1022;
    float _1206 = _970;
    float _1208 = _1138;
    float _1210 = _1104;
    float _1212 = _1208;
    float _1214 = _1206;
    float _1216 = _1210;
    float _1218 = _1204;
    if (_1132)
    {
        _1212 = _1200;
    }
    float _1220 = _1212;
    float _1222 = _1220;
    if (_1132)
    {
        _1214 = _1202;
    }
    float _1224 = _1214;
    float _1226 = _1224;
    if (_1132)
    {
        _195 = _1204;
    }
    float _1228 = _195;
    float _1230 = _1228;
    if (!_1132)
    {
        float _1232 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1234 = _615 + _1232;
        float _1236 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1238 = _581 + _1236;
        float _1240 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1242 = -_615;
        float _1244 = _1242 + _1202;
        float _1246 = _1234 * _1234;
        float _1248 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1250 = _579 + _1248;
        float _1252 = fma(_1238, _1238, _1246);
        float _1254 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1256 = fma(_1250, _1250, _1252);
        float _1258 = sqrt(_1256);
        float _1260 = _1240 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1262 = -_579;
        float _1264 = _1262 + _1204;
        float _1266 = precise::min(_1258, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1268 = _1266 * _1254;
        float _1270 = _1260 * _1268;
        float _1272 = -_581;
        float _1274 = _1272 + _1200;
        float _1276 = fma(_1244, _1270, _615);
        float _1278 = fma(_1274, _1270, _581);
        float _1280 = fma(_1264, _1270, _579);
        _1226 = _1276;
        _1222 = _1278;
        _1230 = _1280;
        _1216 = _1254;
    }
    float _1282 = _1226;
    float _1284 = _1222;
    float _1286 = _1230;
    float _1288 = _1216;
    float _1290 = _1282 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1292 = _1282 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1294 = _1146 * _1150;
    float _1296 = _1282 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1298 = fma(_1284, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1290);
    float _1300 = fma(_1284, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1292);
    float _1302 = _1282 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    bool _1304 = _1294 >= 0.0;
    float _1306 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1298);
    float _1308 = fma(_1284, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1296);
    float _1310 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1300);
    float _1312 = _1144 * _1150;
    float _1314 = _1306 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _1316 = _1294 <= 1.0;
    bool _1318 = _1316 && _1304;
    float _1320 = fma(_1284, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1302);
    float _1322 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1308);
    float _1324 = _1310 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1326 = _1314 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _1328 = _1312 >= 0.0;
    bool _1330 = _1328 && _1318;
    float _1332 = _1322 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1334 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1320);
    float _1336 = fma(_1324, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1326);
    bool _1338 = _1312 <= 1.0;
    bool _1340 = _1338 && _1330;
    float _1342 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1344 = _1332 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1346 = _1334 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1348 = fma(_1332, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1336);
    float _1350 = _1288;
    if (!_830)
    {
        float _1352 = rint(_1116);
        float _1354 = precise::max(_1352, 0.0);
        uint _1356 = uint(_1354);
        uint _1358 = clamp(_1356, 0u, 65535u);
        _1350 = as_type<float>(_1358);
    }
    float _1360 = _1350;
    float _1362 = -_1344;
    float _1364 = fma(_1362, _1342, 1.0);
    float _1366 = _1314 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1368 = fma(_1346, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1348);
    float _1370 = _1314 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1372 = _1364;
    float _1374 = _1368;
    if (!_830)
    {
        float _1376 = -_1142;
        float _1378 = _707 + _1376;
        _1218 = _1378;
    }
    float _1380 = _1218;
    float _1382 = log2(_1364);
    float _1384 = _621 * _1050;
    if (_1340)
    {
        float _1386 = float(_759);
        _890 = _1386;
    }
    float _1388 = _890;
    float _1390 = fma(_1324, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1366);
    float _1392 = fma(_1324, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1370);
    float _1394 = fma(_581, _1042, _1384);
    float _1396 = fma(_1332, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1390);
    float _1398 = 1.0 / _1368;
    float _1400 = fma(_579, _1080, _1394);
    float _1402 = fma(_1332, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1392);
    if (!_830)
    {
        float _1404 = -_1068;
        float _1406 = _699 + _1404;
        _1372 = _1406;
    }
    float _1408 = _1372;
    float _1410 = _1400 + _1088;
    float _1412 = fma(_1346, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1396);
    float _1414 = fma(_1346, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1402);
    float _1416 = _1366;
    float _1418 = _1412;
    if (_1340)
    {
        float _1420 = rint(_1388);
        float _1422 = precise::max(_1420, 0.0);
        uint _1424 = uint(_1422);
        uint _1426 = clamp(_1424, 0u, 65535u);
        _1416 = as_type<float>(_1426);
    }
    float _1428 = _1416;
    float _1430 = _1382 * 0.693147182464599609375;
    float _1432 = _1410 * _1150;
    float _1434 = _1412 * _1398;
    float _1436 = _1414 * _1398;
    float _1438 = _1430 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1440 = fma(_1434, 0.5, 0.5);
    float _1442 = fma(_1436, -0.5, 0.5);
    float _1444 = _1380;
    if (!_830)
    {
        float3 _5370 = float3(_1408, _1380, float(as_type<int>(_1360)));
        float3 _5374 = select(_5370, float3(0.0), isnan(_5370));
        float _1446 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _5374.xy, uint(rint(_5374.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _5374.xy, uint(rint(_5374.z)), level(0.0)).x;
        _1444 = _1446;
    }
    float _1448 = _1444;
    float _1450 = _1388;
    if (_1340)
    {
        float3 _5389 = float3(_1294, _1312, float(as_type<int>(_1428)));
        float3 _5391 = select(_5389, float3(0.0), isnan(_5389));
        float _1452 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5391.xy, uint(rint(_5391.z)), _1432, level(0.0));
        _1450 = _1452;
    }
    float _1454 = _1450;
    float3 _5401 = float3(_1440, _1442, _1438);
    float _1456 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5401, float3(0.0), isnan(_5401)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5401, float3(0.0), isnan(_5401)), level(0.0)).x;
    float3 _5410 = float3(_1440, _1442, _1438);
    float4 _1459 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5410, float3(0.0), isnan(_5410)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5410, float3(0.0), isnan(_5410)), level(0.0)).xyzw;
    float _1461 = _1459.x;
    float _1463 = _1459.y;
    float _1465 = _1459.z;
    float _1467 = _1459.w;
    float _1469 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1471 = int(_1469);
    float _1473 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1475 = int(_1473);
    float _1477 = float(_1471);
    float _1479 = 1.0 / _1477;
    float _1481 = float(uint(_1475));
    int _1483 = ~_1475;
    int _1485 = _1483 + 1;
    int _1487 = ~_1475;
    int _1489 = _1487 + 1;
    float _1491 = 1.0 / _1481;
    float _1493 = _147 * _1479;
    float _1495 = trunc(_1493);
    int _1497 = int(_1495);
    int _1499 = as_type<int>(_1491) + (-2);
    float _1501 = _1491;
    float _1503 = as_type<float>(_1489);
    if (_830)
    {
        _1501 = 1.0;
    }
    float _1505 = _1501;
    float _1507 = float(uint(_1497));
    float _1509 = as_type<float>(_1499) * _1507;
    float _1511 = in.m_65.x;
    float _1513 = in.m_65.y;
    float _1515 = trunc(_1509);
    float _1517 = precise::max(_1515, 0.0);
    uint _1519 = uint(_1517);
    int _1521 = _1485 * int(_1519);
    int _1523 = _1521 + _1497;
    float _1525 = float(uint(_1523));
    float _1527 = as_type<float>(_1499) * _1525;
    float _1529 = trunc(_1527);
    float _1531 = precise::max(_1529, 0.0);
    uint _1533 = uint(_1531);
    int _1535 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1537 = _1535 != 0;
    bool _1539 = !_1537;
    float _1541 = _1539 ? 7.345489978790283203125 : 1.0;
    bool _1543 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1545 = isnan(0.5);
    bool _1547 = _1543 || _1545;
    bool _1549 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1551 = _1547 || _1549;
    float _1553 = _1541 * _1511;
    int _1555 = int(_1519) + int(_1533);
    float _1557 = floor(_1553);
    float _1559 = _1505;
    if (_1551)
    {
        _1503 = 1.0;
    }
    float _1561 = _1503;
    int _1563 = _1489 * _1555;
    int _1565 = _1563 + _1497;
    bool _1567 = uint(_1565) >= uint(_1475);
    float _1569 = -_1557;
    float _1571 = _1553 + _1569;
    float _1573 = _1561;
    float _1575 = _1461;
    if (!_1551)
    {
        float _1577 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1579 = _1577 * 0.15915493667125701904296875;
        float _1581 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1583 = _1579 * 6.283185482025146484375;
        float _1585 = cos(_1583);
        float _1587 = _1581 * 0.15915493667125701904296875;
        float _1589 = _1579 * 6.283185482025146484375;
        float _1591 = sin(_1589);
        float _1593 = 1.0 / _1585;
        float _1595 = _1587 * 6.283185482025146484375;
        float _1597 = cos(_1595);
        float _1599 = _1591 * _1593;
        float _1601 = _1587 * 6.283185482025146484375;
        float _1603 = sin(_1601);
        float _1605 = _1597 * _1599;
        float _1607 = 1.0 / _1605;
        float _1609 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1611 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1609;
        float _1613 = 1.0 / _1611;
        float _1615 = _1603 * _1607;
        float _1617 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1619 = fma(_703, _1615, _1617);
        float _1621 = _1619 * _1613;
        float _1623 = precise::clamp(_1621, 0.0, 1.0);
        _892 = _1613;
        _1573 = _1623;
    }
    float _1625 = _892;
    float _1627 = _1573;
    if (!_830)
    {
        int _1629 = _898 << 4;
        int _1631 = _1629 + 2048;
        uint _1633 = uint(int(uint(_1631) >> uint(2)));
        uint _1635 = uint(int(uint(int(_1633)) >> uint(2)));
        int _1637 = int(_1633) & 3;
        float _1639 = (*spvDescriptorSet0.vp_c15)._m0[int(_1635)][_1637];
        int _1641 = int(_1633) + 1;
        uint _1643 = uint(int(uint(_1641) >> uint(2)));
        int _1645 = _1641 & 3;
        float _1647 = (*spvDescriptorSet0.vp_c15)._m0[int(_1643)][_1645];
        int _1649 = _1631 + 8;
        uint _1651 = uint(int(uint(_1649) >> uint(2)));
        uint _1653 = uint(int(uint(int(_1651)) >> uint(2)));
        int _1655 = int(_1651) & 3;
        float _1657 = (*spvDescriptorSet0.vp_c15)._m0[int(_1653)][_1655];
        int _1659 = int(_1651) + 1;
        uint _1661 = uint(int(uint(_1659) >> uint(2)));
        int _1663 = _1659 & 3;
        float _1665 = (*spvDescriptorSet0.vp_c15)._m0[int(_1661)][_1663];
        float _1667 = _621 * _1647;
        float _1669 = fma(_581, _1639, _1667);
        float _1671 = fma(_579, _1657, _1669);
        float _1673 = _1671 + _1665;
        float _1675 = precise::clamp(_1673, 0.0, 1.0);
        float _1677 = -_1675;
        float _1679 = _1677 + _1448;
        float _1681 = fma(_1679, 500.0, 1.5);
        float _1683 = exp2(_1681);
        float _1685 = 0.0 + _1683;
        float _1687 = precise::clamp(_1685, 0.0, 1.0);
        _1559 = _1687;
    }
    float _1689 = _1559;
    float _1691 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1693 = _1282 + _1691;
    float _1695 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1697 = _1284 + _1695;
    float _1699 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1701 = _1286 + _1699;
    float _1703 = _1693 * _1693;
    float _1705 = fma(_1697, _1697, _1703);
    float _1707 = fma(_1701, _1701, _1705);
    float _1709 = rsqrt(_1707);
    float _1711 = sqrt(_1707);
    float _1713 = _1697 * _1709;
    float _1715 = _1701 * _1709;
    float _1717 = _1693 * _1709;
    float _1719 = _1713 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1721 = _1715 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1723 = _1719 * _1719;
    float _1725 = _1721 * _1721;
    float _1727 = _1723 + _1725;
    float _1729 = sqrt(_1727);
    bool _1731 = _1729 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1733 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1735 = _1729 + _1733;
    float _1737 = _1625;
    float _1739 = _1727;
    float _1741 = _1735;
    float _1743 = _1719;
    float _1745 = _1721;
    float _1747 = _1723;
    float _1749 = _1725;
    if (_1731)
    {
        float _1751 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1737 = _1751;
    }
    float _1753 = _1737;
    if (_1731)
    {
        float _1755 = rsqrt(_1727);
        _1739 = _1755;
    }
    float _1757 = _1739;
    if (_1731)
    {
        float _1759 = _1735 * _1753;
        _1741 = _1759;
    }
    float _1761 = _1741;
    float _1763 = 0.0;
    if (_1731)
    {
        float _1765 = _1761 * 0.15915493667125701904296875;
        _1763 = _1765;
    }
    float _1767 = _1763;
    float _1769 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1771 = _1096;
    float _1773 = _1769;
    if (_1731)
    {
        float _1775 = _1767 * 6.283185482025146484375;
        float _1777 = sin(_1775);
        _1771 = _1777;
    }
    float _1779 = _1771;
    float _1781 = precise::max(0.0, _1769);
    float _1783 = _1761;
    if (_1731)
    {
        float _1785 = _1767 * 6.283185482025146484375;
        float _1787 = cos(_1785);
        _1783 = _1787;
    }
    float _1789 = _1783;
    float _1791 = -_1717;
    float _1793 = -_1781;
    float _1795 = fma(_1791, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1793);
    float _1797 = _1795;
    if (_1731)
    {
        float _1799 = _1795 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1773 = _1799;
    }
    float _1801 = _1773;
    float _1803 = _1779;
    float _1805 = _1801;
    if (_1731)
    {
        float _1807 = fma(_1779, _1801, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1803 = _1807;
    }
    float _1809 = _1803;
    float _1811 = _1809;
    if (_1731)
    {
        float _1813 = _1757 * _1809;
        _1811 = _1813;
    }
    float _1815 = _1811;
    if (_1731)
    {
        float _1817 = _1789 + (-1.0);
        _1805 = _1817;
    }
    float _1819 = _1805;
    float _1821 = _1819;
    if (_1731)
    {
        float _1823 = _1719 * _1815;
        _1743 = _1823;
    }
    float _1825 = _1743;
    if (_1731)
    {
        float _1827 = _1721 * _1815;
        _1745 = _1827;
    }
    float _1829 = _1745;
    if (_1731)
    {
        float _1831 = _1819 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1821 = _1831;
    }
    float _1833 = _1821;
    if (_1731)
    {
        float _1835 = _1825 * _1825;
        _1747 = _1835;
    }
    float _1837 = _1747;
    if (_1731)
    {
        float _1839 = _1829 * _1829;
        _1749 = _1839;
    }
    float _1841 = _1749;
    if (_1731)
    {
        float _1843 = fma(_1795, _1789, _1833);
        _1797 = _1843;
    }
    float _1845 = _1797;
    float _1847 = float(_1475);
    float _1849 = fma(_1845, _1845, _1837);
    float _1851 = _1849 + _1841;
    float _1853 = rsqrt(_1851);
    float _1855 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1857 = fma(_1711, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1855);
    float _1859 = precise::clamp(_1857, 0.0, 1.0);
    float _1861 = -_1859;
    float _1863 = _1861 + 1.0;
    float _1865 = abs(_1863);
    float _1867 = log2(_1865);
    float _1869 = _1853 * _1825;
    float _1871 = _1853 * _1845;
    float _1873 = _1853 * _1829;
    float _1875 = float(_1497);
    float _1877 = _1869 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1879 = -_1877;
    float _1881 = fma(_1871, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1879);
    float _1883 = _1867 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1885 = -_1873;
    float _1887 = fma(_1885, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1881);
    float _1889 = exp2(_1883);
    float _1891 = fma(_1887, -0.5, 0.5);
    float _1893 = fma(_1887, 0.5, 0.5);
    float _1895 = fma(_1893, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1897 = sqrt(_1891);
    float _1899 = fma(_1893, _1895, -0.212114393711090087890625);
    float _1901 = _1871 + 1.0;
    float _1903 = fma(_1893, _1899, 1.570728778839111328125);
    bool _1905 = _1875 >= _1847;
    bool _1907 = isnan(_1875);
    bool _1909 = _1905 || _1907;
    bool _1911 = isnan(_1847);
    bool _1913 = _1909 || _1911;
    float _1915 = float(_1913);
    float _1917 = -_1871;
    float _1919 = fma(_1889, _1901, _1917);
    float _1921 = 1.0 / _557;
    bool _1923 = !_1567;
    int _1925 = _1923 ? 0 : (-1);
    float _1927 = fma(_1919, 0.5, 0.5);
    float _1929 = _1897 * 0.636619746685028076171875;
    float _1931 = trunc(_1915);
    int _1933 = int(_1931);
    float _1935 = -_1903;
    float _1937 = fma(_1929, _1935, 1.0);
    float2 _6098 = float2(_1937, _1927);
    float3 _1941 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6098, float2(0.0), isnan(_6098)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6098, float2(0.0), isnan(_6098)), level(0.0)).xyz;
    float _1943 = _1941.x;
    float _1945 = _1941.y;
    float _1947 = _1941.z;
    int _1949 = ~_1555;
    int _1951 = _1949 + _1925;
    int _1953 = _1951 + 1;
    float _1955 = _147 * _1847;
    float _1957 = _1571 * _1847;
    bool _1959 = _1475 == 0;
    float _1961 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1963 = _559 + _1961;
    int _1965 = _1475 * _1953;
    int _1967 = _1965 + _1497;
    float _1969 = _1955 * _1921;
    float _1971 = trunc(_1957);
    int _1973 = int(_1971);
    int _1975 = ~_1933;
    int _1977 = _1975 + 1;
    int _1979 = _1977 + 1;
    float _1981 = _1867 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1983 = !_1959;
    int _1985 = _1983 ? _1967 : (-1);
    float _1987 = -_599;
    float _1989 = _1987 + 1.0;
    int _1991 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1993 = _1991 != 0;
    out.m_74.x = _1284;
    out.m_74.y = _1282;
    out.m_74.z = _1286;
    int _1995 = _1475 + (-1);
    float _1997 = trunc(_1969);
    int _1999 = int(_1997);
    int _2001 = _1985 * _1979;
    bool _2003 = !_1993;
    int _2005 = _2003 ? 0 : 1;
    int _2007 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2009 = _2007 != 0;
    int _2011 = _1933 * _1995;
    int _2013 = _2011 + _2001;
    int _2015 = abs(_884);
    int _2017 = abs(_2005);
    float _2019 = exp2(_1981);
    int _2021 = abs(_902);
    int _2023 = _2013 * _2015;
    bool _2025 = !_2009;
    int _2027 = _2025 ? 0 : 1;
    int _2029 = abs(_906);
    int _2031 = abs(_2027);
    int _2033 = _1973 * _2017;
    int _2035 = _2033 + _1497;
    int _2037 = _1999 * _2021;
    int _2039 = _2037 + _2023;
    int _2041 = _2035 * _2029;
    int _2043 = _2041 + _2039;
    int _2045 = ~_1475;
    int _2047 = _2045 + 1;
    int _2049 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2051 = _2049 != 0;
    int _2053 = _1973 * _2031;
    int _2055 = _2053 + _2043;
    int _2057 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2059 = _2057 != 0;
    int _2061 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2063 = _2061 != 0;
    float _2065 = float(uint(_2055));
    int _2067 = ~_1475;
    int _2069 = _2067 + 1;
    float _2071 = as_type<float>(_1499) * _2065;
    bool _2073 = _1511 > 0.5;
    float _2075 = trunc(_2071);
    float _2077 = precise::max(_2075, 0.0);
    uint _2079 = uint(_2077);
    float _2081 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2083 = fma(_1511, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2081);
    float _2085 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _2087 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _2085;
    float _2089 = 1.0 / _2087;
    int _2091 = _2047 * int(_2079);
    int _2093 = _2091 + _2055;
    float _2095 = float(uint(_2093));
    float _2097 = _1511 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2099 = as_type<float>(_1499) * _2095;
    float _2101 = trunc(_2099);
    float _2103 = precise::max(_2101, 0.0);
    uint _2105 = uint(_2103);
    float _2107 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2109 = -_2107;
    float _2111 = fma(_2097, 2.0, _2109);
    float _2113 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _2115 = _2113 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _2117 = 1.0 / _2115;
    int _2119 = int(_2079) + int(_2105);
    float _2121 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2123 = _1513 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2125 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2083);
    int _2127 = _2069 * _2119;
    int _2129 = _2127 + _2055;
    float _2131 = fma(_2123, -2.0, _2121);
    float _2133 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2135 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _2137 = _559 + _2135;
    bool _2139 = uint(_2129) >= uint(_1475);
    float _2141 = -_147;
    float _2143 = fma(_2141, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2111);
    float _2145 = fma(_1513, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2133);
    float _2147 = _1963 * _2117;
    bool _2149 = !_2139;
    int _2151 = _2149 ? 0 : (-1);
    float _2153 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2145);
    bool _2155 = _1513 > 0.5;
    float _2157 = _2137 * _2089;
    float _2159 = float(uint(_2035));
    float _2161 = fma(_147, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2131);
    float _2163 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _2165 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _2163;
    int _2167 = ~_2119;
    int _2169 = _2167 + _2151;
    int _2171 = _2169 + 1;
    float _2173 = as_type<float>(_1499) * _2159;
    float _2175 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _2177 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _2175;
    float _2179 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _2181 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _2179;
    bool _2183 = _559 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _2185 = isnan(_559);
    bool _2187 = _2183 || _2185;
    bool _2189 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _2191 = _2187 || _2189;
    float _2193 = float(_2191);
    int _2195 = _1475 * _2171;
    int _2197 = _2195 + _2055;
    float _2199 = fma(_2177, _2157, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _2201 = trunc(_2173);
    float _2203 = precise::max(_2201, 0.0);
    uint _2205 = uint(_2203);
    float _2207 = fma(_2181, _2157, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _2209 = fma(_2165, _2157, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _2211 = _559 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _2213 = isnan(_559);
    bool _2215 = _2211 || _2213;
    bool _2217 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _2219 = _2215 || _2217;
    float _2221 = float(_2219);
    float _2223 = -_2193;
    float _2225 = _2223 + 1.0;
    bool _2227 = _559 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _2229 = isnan(_559);
    bool _2231 = _2227 || _2229;
    bool _2233 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _2235 = _2231 || _2233;
    float _2237 = float(_2235);
    float _2239 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _2241 = _2239 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    int _2243 = ~_1475;
    int _2245 = _2243 + 1;
    float _2247 = _2221 * _2225;
    float _2249 = -_2221;
    float _2251 = _2249 + 1.0;
    float _2253 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _2255 = _2253 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    bool _2257 = !_1959;
    int _2259 = _2257 ? _2197 : (-1);
    float _2261 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _2263 = _2261 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _2265 = _2237 * _2251;
    float _2267 = fma(_2255, _2147, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    int _2269 = _2259 >> 31;
    int _2271 = _2245 * int(_2205);
    int _2273 = _2271 + _2035;
    float _2275 = fma(_2263, _2147, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _2277 = fma(_2241, _2147, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    int _2279 = _2269 & 3;
    float _2281 = _2199 * _2265;
    float _2283 = float(uint(_2273));
    float _2285 = _2207 * _2265;
    int _2287 = _2259 + _2279;
    float _2289 = _2209 * _2265;
    float _2291 = -_655;
    int _2293 = _2073 ? as_type<int>(_2291) : as_type<int>(_655);
    float _2295 = as_type<float>(_1499) * _2283;
    int _2297 = _2287 >> 2;
    float _2299 = _651 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2301 = -_651;
    int _2303 = _2155 ? as_type<int>(_2301) : as_type<int>(_651);
    float _2305 = -_2237;
    float _2307 = _2305 + 1.0;
    int _2309 = _2297 << 4;
    int _2311 = _2309 + 368;
    float _2313 = trunc(_2295);
    float _2315 = precise::max(_2313, 0.0);
    uint _2317 = uint(_2315);
    bool _2319 = !_2063;
    float _2321 = _2319 ? _651 : as_type<float>(_2303);
    float _2323 = _2299 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2325 = !_2059;
    float _2327 = _2325 ? _655 : as_type<float>(_2293);
    float _2329 = _2299 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2331 = _2299 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2333 = _655 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    uint _2335 = uint(int(uint(_2311) >> uint(2)));
    uint _2337 = uint(int(uint(int(_2335)) >> uint(2)));
    int _2339 = int(_2335) & 3;
    float _2341 = (*spvDescriptorSet0.vp_c9)._m0[int(_2337)][_2339];
    int _2343 = int(_2335) + 1;
    uint _2345 = uint(int(uint(_2343) >> uint(2)));
    int _2347 = _2343 & 3;
    float _2349 = (*spvDescriptorSet0.vp_c9)._m0[int(_2345)][_2347];
    int _2351 = ~_1475;
    int _2353 = _2351 + 1;
    float _2355 = fma(_2307, (*spvDescriptorSet0.vp_c9)._m0[123].z, _2289);
    float _2357 = fma(_2333, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2323);
    float _2359 = fma(_2333, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2329);
    float _2361 = fma(_2333, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2331);
    int _2363 = _2259 & 3;
    bool _2365 = _2363 != 0;
    float _2367 = fma(_2307, (*spvDescriptorSet0.vp_c9)._m0[123].x, _2281);
    float _2369 = fma(_2307, (*spvDescriptorSet0.vp_c9)._m0[123].y, _2285);
    int _2371 = int(_2205) + int(_2317);
    float _2373 = fma(_2277, _2247, _2355);
    int _2375 = _2311 + 8;
    uint _2377 = uint(int(uint(_2375) >> uint(2)));
    uint _2379 = uint(int(uint(int(_2377)) >> uint(2)));
    int _2381 = int(_2377) & 3;
    float _2383 = (*spvDescriptorSet0.vp_c9)._m0[int(_2379)][_2381];
    int _2385 = int(_2377) + 1;
    uint _2387 = uint(int(uint(_2385) >> uint(2)));
    int _2389 = _2385 & 3;
    float _2391 = (*spvDescriptorSet0.vp_c9)._m0[int(_2387)][_2389];
    bool _2393 = uint(_2363) > 1u;
    float _2395 = fma(_2267, _2247, _2367);
    int _2397 = _2353 * _2371;
    int _2399 = _2397 + _2035;
    int _2401 = _2259 & 3;
    bool _2403 = _2401 != 0;
    float _2405 = _2321 + (-0.5);
    float _2407 = fma(_2275, _2247, _2369);
    float _2409 = fma(_2193, (*spvDescriptorSet0.vp_c9)._m0[125].x, _2395);
    bool _2411 = uint(_2399) >= uint(_1475);
    float _2413 = -_2405;
    float _2415 = -_2161;
    float _2417 = fma(_2413, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2415);
    int _2419 = _2403 ? 0 : 1;
    float _2421 = _1314 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2423 = !_2411;
    int _2425 = _2423 ? 0 : (-1);
    float _2427 = -_2153;
    float _2429 = _2427 + 1.0;
    int _2431 = ~_2419;
    int _2433 = _2431 + 1;
    int _2435 = _2433 + 1;
    float _2437 = _2327 + 0.5;
    int _2439 = ~_2371;
    int _2441 = _2439 + _2425;
    int _2443 = _2441 + 1;
    float _2445 = -_2125;
    float _2447 = _2445 + 1.0;
    int _2449 = _2435;
    if (!_2393)
    {
        int _2451 = ~_2419;
        int _2453 = _2451 + 1;
        _2449 = _2453;
    }
    int _2455 = _2449;
    float _2457 = fma(_2193, (*spvDescriptorSet0.vp_c9)._m0[125].y, _2407);
    bool _2459 = _2363 != 3;
    int _2461 = _1475 * _2443;
    int _2463 = _2461 + _2035;
    int _2465 = abs(_2455);
    float _2467 = fma(_2193, (*spvDescriptorSet0.vp_c9)._m0[125].z, _2373);
    bool _2469 = !_2365;
    int _2471 = _2469 ? 0 : 1;
    float _2473 = fma(_2437, (*spvDescriptorSet0.vp_c9)._m0[80].x, _2143);
    bool _2475 = uint(_2363) >= 2u;
    int _2477 = abs(_2471);
    int _2479 = ~_2465;
    int _2481 = _2479 + 1;
    int _2483 = _2481 + 1;
    int _2485 = _2475 ? 0 : 1;
    bool _2487 = _2363 != 3;
    int _2489 = ~_2485;
    int _2491 = _2489 + 1;
    int _2493 = _2491 + 1;
    int _2495 = _2483 * as_type<int>(_2349);
    int _2497 = _2493;
    if (_2459)
    {
        int _2499 = ~_2485;
        int _2501 = _2499 + 1;
        _2497 = _2501;
    }
    int _2503 = _2497;
    float _2505 = abs(_703);
    float _2507 = log2(_2505);
    float _2509 = fma(_1324, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2421);
    bool _2511 = !_2487;
    int _2513 = _2511 ? 0 : (-1);
    int _2515 = abs(_2503);
    int _2517 = abs(_2513);
    int _2519 = ~_2477;
    int _2521 = _2519 + 1;
    int _2523 = _2521 + 1;
    int _2525 = ~_2515;
    int _2527 = _2525 + 1;
    int _2529 = _2527 + 1;
    bool _2531 = !_2051;
    int _2533 = _2531 ? 0 : 1;
    int _2535 = _2523 * as_type<int>(_2341);
    int _2537 = _2535 + _2495;
    int _2539 = ~_2517;
    int _2541 = _2539 + 1;
    int _2543 = _2541 + 1;
    float _2545 = fma(_1332, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2509);
    int _2547 = abs(_2533);
    int _2549 = _2529 * as_type<int>(_2383);
    int _2551 = _2549 + _2537;
    float _2553 = _2507 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2555 = _2457 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2557 = fma(_1346, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2545);
    int _2559 = _2543 * as_type<int>(_2391);
    int _2561 = _2559 + _2551;
    float _2563 = fma(_2321, _2429, _2417);
    float _2565 = _2409 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2567 = exp2(_2553);
    float _2569 = _2467 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2571 = -_2447;
    float _2573 = fma(_2327, _2571, _2473);
    float _2575 = _2565 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2577 = _2555 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2579 = _2569 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.gl_Position.x = _1412;
    out.gl_Position.y = _1414;
    out.gl_Position.z = _2557;
    out.gl_Position.w = _1368;
    bool _2581 = _703 <= 8000.0;
    bool _2583 = isnan(_703);
    bool _2585 = _2581 || _2583;
    bool _2587 = isnan(8000.0);
    bool _2589 = _2585 || _2587;
    float _2591 = float(_2589);
    out.m_76.x = _2575;
    out.m_76.y = _2577;
    out.m_76.z = _2579;
    int _2593 = ~_2547;
    int _2595 = _2593 + 1;
    int _2597 = _2595 + 1;
    bool _2599 = !_1959;
    int _2601 = _2599 ? _2463 : (-1);
    float _2603 = fma(_2567, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2605 = precise::clamp(_2603, 0.0, 1.0);
    out.m_78.x = _2573;
    out.m_78.y = _2563;
    int _2607 = _2561 * _2597;
    bool _2609 = _1711 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2611 = isnan(_1711);
    bool _2613 = _2609 || _2611;
    bool _2615 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2617 = _2613 || _2615;
    int _2619 = _2601 * _2547;
    int _2621 = _2619 + _2607;
    float _2623 = _2557 + _1368;
    float _2625 = fma(_2605, -2.0, 3.0);
    float _2627 = _2605 * _2605;
    float _2629 = _2579;
    if (!_1340)
    {
        _1418 = 1.0;
    }
    float _2631 = _1418;
    float _2633 = _2623 * 0.5;
    float _2635 = _2631;
    if (_1340)
    {
        bool _2637 = _1454 >= _1432;
        bool _2639 = isnan(_1454);
        bool _2641 = _2637 || _2639;
        bool _2643 = isnan(_1432);
        bool _2645 = _2641 || _2643;
        float _2647 = float(_2645);
        _2635 = _2647;
    }
    float _2649 = _2635;
    float _2651 = _2627 * _2625;
    float _2653 = float(_2621);
    out.m_80.z = _2633;
    out.m_80.w = _1368;
    float _2655 = -_2651;
    float _2657 = _2655 + 1.0;
    float _2659 = _2649 * _1689;
    float _2661 = _2651;
    if (!_2617)
    {
        _2629 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2663 = _2629;
    out.m_82.x = _2653;
    float _2665 = fma(_2657, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2651);
    float _2667 = _2663;
    float _2669 = _2663;
    if (!_2617)
    {
        _2661 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2671 = _2661;
    float _2673 = _2671;
    float _2675 = _2671;
    if (!_2617)
    {
        _1374 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2677 = _1374;
    float _2679 = _2591 * _2665;
    float _2681 = _2679 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2683 = -_2019;
    float _2685 = _2683 + 1.0;
    float _2687 = _1989 * _2681;
    float _2689 = precise::clamp(_2687, 0.0, 1.0);
    float _2691 = _2685 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2693 = _2361 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _2695 = -_2689;
    float _2697 = fma(_2695, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2699 = _2691 * _1456;
    float _2701 = -_2691;
    float _2703 = _2701 + 1.0;
    float _2705 = -_2659;
    float _2707 = fma(_2705, _2697, 1.0);
    float _2709 = precise::clamp(_2707, 0.0, 1.0);
    float _2711 = _1467 * _2699;
    float _2713 = _1947 * _2699;
    float _2715 = _1467 * _2703;
    float _2717 = _2357 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _2719 = fma(_1943, _2711, _1461);
    float _2721 = fma(_1945, _2711, _1463);
    float _2723 = fma(_1467, _2713, _1465);
    float _2725 = _2359 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _2727 = _2709 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2729 = _1627 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2731 = _2703;
    float _2733 = _2727;
    float _2735 = _2677;
    float _2737 = _2677;
    if (!_2617)
    {
        _1575 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2739 = _1575;
    out.m_84.x = _2719;
    out.m_84.y = _2721;
    out.m_84.z = _2723;
    out.m_84.w = _2715;
    float _2741 = _2739;
    float _2743 = _2739;
    if (!_2617)
    {
        _2731 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2745 = _2731;
    out.m_86.x = _2717;
    out.m_86.y = _2725;
    out.m_86.z = _2693;
    out.m_88.x = _2727;
    float _2747 = _2745;
    float _2749 = _2745;
    if (!_2617)
    {
        _2733 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2751 = _2733;
    bool _2753 = !_2617;
    float _2755 = _2751;
    float _2757 = _2751;
    if (!_2753)
    {
        bool _2759 = _1711 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2761 = isnan(_1711);
        bool _2763 = _2759 || _2761;
        bool _2765 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2767 = _2763 || _2765;
        if (!_2767)
        {
            float _2769 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2771 = _1711 + _2769;
            float _2773 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2775 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2773;
            float _2777 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2779 = _2777 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2781 = 1.0 / _2775;
            float _2783 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2785 = _2783 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2787 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2789 = _2787 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2791 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2793 = _2791 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2795 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2797 = _2795 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2799 = _2771 * _2781;
            float _2801 = precise::clamp(_2799, 0.0, 1.0);
            float _2803 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2805 = _2803 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2807 = fma(_2801, _2779, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2809 = fma(_2801, _2805, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2811 = fma(_2801, _2785, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2813 = fma(_2801, _2789, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2815 = fma(_2801, _2793, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2817 = fma(_2801, _2797, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2743 = _2807;
            _2737 = _2815;
            _2675 = _2811;
            _2749 = _2813;
            _2669 = _2809;
            _2757 = _2817;
            _2819 = true;
        }
        else
        {
            bool _2821 = _1711 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2823 = isnan(_1711);
            bool _2825 = _2821 || _2823;
            bool _2827 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2829 = _2825 || _2827;
            if (!_2829)
            {
                _2673 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2831 = _2673;
            _2675 = _2831;
            if (!_2829)
            {
                _2741 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2833 = _2741;
            _2743 = _2833;
            if (!_2829)
            {
                _2667 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2835 = _2667;
            _2669 = _2835;
            if (!_2829)
            {
                _2747 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2837 = _2747;
            _2749 = _2837;
            if (!_2829)
            {
                _2735 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2839 = _2735;
            _2737 = _2839;
            if (!_2829)
            {
                _2755 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2841 = _2755;
            bool _2843 = !_2829;
            _2757 = _2841;
            if (!_2843)
            {
                bool _2845 = _1711 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2847 = isnan(_1711);
                bool _2849 = _2845 || _2847;
                bool _2851 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2853 = _2849 || _2851;
                if (!_2853)
                {
                    float _2855 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2857 = _1711 + _2855;
                    float _2859 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2861 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2859;
                    float _2863 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2865 = _2863 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2867 = 1.0 / _2861;
                    float _2869 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2871 = _2869 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2873 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2875 = _2873 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2877 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2879 = _2877 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2881 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2883 = _2881 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2885 = _2857 * _2867;
                    float _2887 = precise::clamp(_2885, 0.0, 1.0);
                    float _2889 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2891 = _2889 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2893 = fma(_2887, _2865, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2895 = fma(_2887, _2891, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2897 = fma(_2887, _2871, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2899 = fma(_2887, _2875, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2901 = fma(_2887, _2879, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2903 = fma(_2887, _2883, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2743 = _2893;
                    _2737 = _2901;
                    _2675 = _2897;
                    _2749 = _2899;
                    _2669 = _2895;
                    _2757 = _2903;
                    _2819 = true;
                }
                else
                {
                    _2743 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2737 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2675 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2749 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2669 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2757 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2819 = false;
    float _2905 = _2743;
    float _2907 = _2737;
    float _2909 = _2675;
    float _2911 = _2749;
    float _2913 = _2669;
    float _2915 = _2757;
    float _2917 = fma(_2725, -0.5, 0.5);
    float _2919 = precise::clamp(_2917, 0.0, 1.0);
    float _2921 = -_2905;
    float _2923 = _2921 + _2907;
    float _2925 = _2729 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2927 = -_2909;
    float _2929 = _2927 + _2911;
    out.m_90.x = 0.0;
    float _2931 = fma(_2919, _2923, _2905);
    float _2933 = fma(_2919, _2929, _2909);
    out.m_59.x = _2925;
    float _2935 = -_2913;
    float _2937 = _2935 + _2915;
    float _2939 = _2931 * 0.586610972881317138671875;
    bool _2941 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2943 = fma(_2919, _2937, _2913);
    float _2945 = fma(_2933, 0.298911988735198974609375, _2939);
    bool _2947 = _1627 > 0.0;
    bool _2949 = isnan(_1627);
    bool _2951 = _2947 || _2949;
    bool _2953 = isnan(0.0);
    bool _2955 = _2951 || _2953;
    out.m_92.x = 0.0;
    float _2957 = fma(_2943, 0.114477999508380889892578125, _2945);
    float _2959 = -_2957;
    float _2961 = _2933 + _2959;
    float _2963 = -_2957;
    float _2965 = _2931 + _2963;
    float _2967 = -_2957;
    float _2969 = _2943 + _2967;
    float _2971 = fma(_2961, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2957);
    float _2973 = fma(_2965, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2957);
    float _2975 = fma(_2969, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2957);
    bool _2977 = !_2941;
    if (!_2977)
    {
        float _2979 = -_1282;
        float _2981 = _2979 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2983 = -_1284;
        float _2985 = _2983 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2987 = -_1286;
        float _2989 = _2987 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2991 = _2981 * _2981;
        float _2993 = fma(_2985, _2985, _2991);
        float _2995 = fma(_2989, _2989, _2993);
        float _2997 = rsqrt(_2995);
        float _2999 = _2981 * _2997;
        float _3001 = _2985 * _2997;
        float _3003 = _2989 * _2997;
        float _3005 = sqrt(_2995);
        float _3007 = -_1717;
        float _3009 = _3007 + _2999;
        float _3011 = -_1713;
        float _3013 = _3011 + _3001;
        float _3015 = -_1715;
        float _3017 = _3015 + _3003;
        float _3019 = _3009 * _3009;
        float _3021 = fma(_3013, _3013, _3019);
        float _3023 = fma(_3017, _3017, _3021);
        float _3025 = -_3005;
        float _3027 = _3025 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3029 = rsqrt(_3023);
        float _3031 = _3027 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3033 = precise::clamp(_3031, 0.0, 1.0);
        float _3035 = abs(_3033);
        float _3037 = log2(_3035);
        float _3039 = _3009 * _3029;
        float _3041 = _3013 * _3029;
        float _3043 = _3017 * _3029;
        float _3045 = _2725 * _3039;
        float _3047 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
        float _3049 = precise::clamp(_3047, 0.0, 1.0);
        float _3051 = _2725 * _2999;
        float _3053 = fma(_2717, _3041, _3045);
        float _3055 = _3049 * _3049;
        float _3057 = _3037 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3059 = fma(_2717, _3001, _3051);
        float _3061 = fma(_2693, _3043, _3053);
        float _3063 = precise::clamp(_3061, 0.0, 1.0);
        float _3065 = _3055 + (-1.0);
        float _3067 = fma(_2693, _3003, _3059);
        float _3069 = precise::clamp(_3067, 0.0, 1.0);
        float _3071 = _3063 * _3063;
        float _3073 = _3001 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3075 = exp2(_3057);
        float _3077 = fma(_3071, _3065, 1.0);
        float _3079 = -_2999;
        float _3081 = -_3073;
        float _3083 = fma(_3079, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3081);
        float _3085 = _3077 * _3077;
        float _3087 = -_3003;
        float _3089 = fma(_3087, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3083);
        float _3091 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3093 = _3089 + _3091;
        float _3095 = 1.0 / _3085;
        float _3097 = _3093 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3099 = precise::clamp(_3097, 0.0, 1.0);
        float _3101 = _3075 * _3099;
        float _3103 = _3069 * _3101;
        float _3105 = _3103 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3107 = _3055 * _3095;
        float _3109 = _3103 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3111 = _3103 * _3107;
        float _3113 = _3103 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        float _3115 = _3111 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3117 = _3111 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3119 = _3111 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_90.x = _3105;
        out.m_90.y = _3109;
        out.m_90.z = _3113;
        out.m_92.x = _3115;
        out.m_92.y = _3117;
        out.m_92.z = _3119;
    }
    out.m_94.x = _2971;
    out.m_94.y = _2973;
    out.m_94.z = _2975;
    if (_2955)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_59.x = 0.0;
    float _3121 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3121;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

