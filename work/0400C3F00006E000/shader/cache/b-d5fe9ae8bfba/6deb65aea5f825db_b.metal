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
    float4 m_70 [[user(locn0)]];
    float4 m_72 [[user(locn2)]];
    float4 m_74 [[user(locn3)]];
    float4 m_84 [[user(locn4)]];
    float4 m_59 [[user(locn5)]];
    float4 m_78 [[user(locn6)]];
    float4 m_82 [[user(locn7)]];
    float4 m_76 [[user(locn8)]];
    float4 m_80 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_56 [[attribute(2)]];
    float4 m_61 [[attribute(3)]];
    float4 m_63 [[attribute(4)]];
    float4 m_68 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1823 = false;
    bool _179 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _98 = in.m_56.w;
    float _100 = trunc(_98);
    int _103 = int(_100);
    bool _107 = _103 >= 1;
    float _109 = 0.0;
    if (!_107)
    {
        _109 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _111 = _109;
    float _113 = _111;
    if (!_107)
    {
        out.m_59.x = 0.0;
    }
    int _115 = 0;
    if (!_107)
    {
        float _117 = _111 * 5.0;
        _115 = as_type<int>(_117);
    }
    int _119 = _115;
    if (!_107)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2127 = as_type<float>(_119);
        out.gl_Position.z = _2127;
    }
    if (!_107)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _121 = in.m_61.w;
    bool _123 = _121 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _125 = isnan(_121);
    bool _127 = _123 || _125;
    bool _129 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _131 = _127 || _129;
    float _133 = -_121;
    float _135 = _133 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_131)
    {
        float _137 = float(_103);
        _113 = _137;
    }
    float _139 = _113;
    bool _141 = _135 >= _139;
    bool _143 = !_131;
    bool _145 = _141 || _143;
    float _147 = _139;
    if (_145)
    {
        _147 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _149 = _147;
    if (_145)
    {
        out.m_59.x = 0.0;
    }
    int _151 = 0;
    if (_145)
    {
        float _153 = _149 * 5.0;
        _151 = as_type<int>(_153);
    }
    int _155 = _151;
    if (_145)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2196 = as_type<float>(_155);
        out.gl_Position.z = _2196;
    }
    if (_145)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _157 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _159 = !_157;
    float _177;
    if (!_159)
    {
        float _161 = in.m_63.x;
        float _163 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _165 = _161 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _167 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[12].x, _135);
        float _169 = _167 * _163;
        float _171 = floor(_169);
        float _173 = -_171;
        float _175 = _169 + _173;
        _177 = _175;
        _179 = true;
    }
    else
    {
        float _181 = float(_103);
        float _183 = 1.0 / _181;
        float _185 = _135 * _183;
        _177 = _185;
    }
    _179 = false;
    float _187 = _177;
    float _189 = in.m_56.x;
    float _191 = in.m_56.y;
    float _193 = in.m_56.z;
    float _195 = _191 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _197 = _191 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _199 = fma(_189, (*spvDescriptorSet0.vp_c10)._m0[4].x, _195);
    float _201 = fma(_189, (*spvDescriptorSet0.vp_c10)._m0[6].x, _197);
    float _203 = fma(_193, (*spvDescriptorSet0.vp_c10)._m0[4].z, _199);
    float _205 = fma(_193, (*spvDescriptorSet0.vp_c10)._m0[6].z, _201);
    float _207 = _203 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _209 = _205 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _211 = fma(_207, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _213 = fma(_209, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _215 = floor(_211);
    float _217 = floor(_213);
    float _219 = -_215;
    float _221 = _211 + _219;
    float _223 = -_217;
    float _225 = _213 + _223;
    float2 _2323 = float2(_221, _225);
    float _227 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_2323, float2(0.0), isnan(_2323)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_2323, float2(0.0), isnan(_2323)), level(0.0)).x;
    float _229 = _191 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _231 = as_type<float>(int(gl_VertexIndex));
    float _233 = fma(_189, (*spvDescriptorSet0.vp_c10)._m0[5].x, _229);
    float _235 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _237 = fma(_193, (*spvDescriptorSet0.vp_c10)._m0[5].z, _233);
    float _239 = _237 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _241 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _243 = _187 + _241;
    float _245 = _239 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _247 = _239 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _249 = fma(_207, (*spvDescriptorSet0.vp_c8)._m0[11].x, _245);
    float _251 = fma(_207, (*spvDescriptorSet0.vp_c8)._m0[10].x, _247);
    float _253 = fma(_209, (*spvDescriptorSet0.vp_c8)._m0[11].z, _249);
    float _255 = fma(_209, (*spvDescriptorSet0.vp_c8)._m0[10].z, _251);
    float _257 = _253 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _259 = _255 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _261 = 1.0 / _257;
    float _263 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _265 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _263;
    float _267 = _259 + _257;
    float _269 = _239 + _235;
    float _271 = 1.0 / _265;
    float _273 = _269 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    bool _275 = _187 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _277 = isnan(_187);
    bool _279 = _275 || _277;
    bool _281 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _283 = _279 || _281;
    float _285 = float(_283);
    float _287 = fma(_207, (*spvDescriptorSet0.vp_c15)._m0[126].x, _273);
    float _289 = _267 * _261;
    float _291 = _289 * 0.5;
    float _293 = -_285;
    float _295 = _293 + 1.0;
    float _297 = fma(_209, (*spvDescriptorSet0.vp_c15)._m0[126].z, _287);
    float _299 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _301 = fma(_291, (*spvDescriptorSet0.vp_c8)._m0[30].w, _299);
    bool _303 = _187 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _305 = isnan(_187);
    bool _307 = _303 || _305;
    bool _309 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _311 = _307 || _309;
    float _313 = float(_311);
    float _315 = _297 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _317 = _243 * _271;
    float _319 = _269 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _321 = 1.0 / _301;
    float _323 = _313 * _295;
    float _325 = -_313;
    float _327 = _325 + 1.0;
    float _329 = fma(_207, (*spvDescriptorSet0.vp_c15)._m0[127].x, _319);
    float _331 = in.m_68.x;
    float _333 = in.m_68.y;
    float _335 = fma(_209, (*spvDescriptorSet0.vp_c15)._m0[127].z, _329);
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _339 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _337;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _343 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _341;
    float _345 = trunc(_315);
    int _347 = int(_345);
    float _349 = _335 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _351 = fma(_339, _317, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _353 = fma(_343, _317, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _355 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _357 = _321 * _355;
    float _359 = _351 * _323;
    float _361 = trunc(_349);
    int _363 = int(_361);
    float _365 = _353 * _323;
    bool _367 = _357 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _369 = fma(_327, (*spvDescriptorSet0.vp_c9)._m0[143].x, _359);
    bool _371 = _357 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _373 = fma(_327, (*spvDescriptorSet0.vp_c9)._m0[143].y, _365);
    float _375 = fma(_285, (*spvDescriptorSet0.vp_c9)._m0[144].x, _369);
    int _377 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _379 = _347 + _377;
    int _381 = _379 + 1;
    float _383 = fma(_285, (*spvDescriptorSet0.vp_c9)._m0[144].y, _373);
    bool _385 = !_367;
    int _387 = _385 ? 0 : 1;
    float _389 = _375 * _331;
    int _391 = as_type<int>(_231) & 1;
    bool _393 = _391 != 0;
    int _395 = as_type<int>(_231) & 2;
    bool _397 = _395 != 0;
    float _399 = _383 * _333;
    int _401 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _403 = _363 + _401;
    int _405 = _403 + 1;
    float _407 = _389 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _409 = 2;
    int _411 = as_type<int>(_231);
    int _413 = as_type<int>(_317);
    float _415 = _349;
    float _417 = _209;
    if (!_367)
    {
        _409 = 1;
    }
    int _419 = _409;
    float _421 = _399 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _423 = _381 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _425 = _381 | _405;
    float _427 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    int _429 = _419;
    if (!_371)
    {
        _429 = _387;
    }
    int _431 = _429;
    bool _433 = !_397;
    float _435 = _433 ? (-0.5) : 0.5;
    bool _437 = _425 < 0;
    bool _439 = _437 || _423;
    int _441 = _431 << 6;
    float _443 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _435);
    bool _445 = _405 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _447 = _445 || _439;
    int _449 = _441 + 96;
    uint _452 = uint(int(uint(_449) >> uint(2)));
    uint _454 = uint(int(uint(int(_452)) >> uint(2)));
    int _456 = int(_452) & 3;
    float _458 = (*spvDescriptorSet0.vp_c15)._m0[int(_454)][_456];
    int _460 = int(_452) + 1;
    uint _462 = uint(int(uint(_460) >> uint(2)));
    int _464 = _460 & 3;
    float _466 = (*spvDescriptorSet0.vp_c15)._m0[int(_462)][_464];
    bool _468 = !_393;
    float _470 = _468 ? (-0.5) : 0.5;
    float _472 = _421 * _443;
    bool _474 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _476 = isnan(0.5);
    bool _478 = _474 || _476;
    bool _480 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _482 = _478 || _480;
    float _484 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _470);
    float _486 = _472 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _488 = _441 + 104;
    uint _490 = uint(int(uint(_488) >> uint(2)));
    uint _492 = uint(int(uint(int(_490)) >> uint(2)));
    int _494 = int(_490) & 3;
    float _496 = (*spvDescriptorSet0.vp_c15)._m0[int(_492)][_494];
    int _498 = int(_490) + 1;
    uint _500 = uint(int(uint(_498) >> uint(2)));
    int _502 = _498 & 3;
    float _504 = (*spvDescriptorSet0.vp_c15)._m0[int(_500)][_502];
    float _506 = _407 * _484;
    if (!_447)
    {
        int _508 = _405 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _510 = _508 + _381;
        _411 = _510;
    }
    int _512 = _411;
    float _514 = _472 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _516 = _472 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _518 = fma(_506, (*spvDescriptorSet0.vp_c8)._m0[26].x, _486);
    int _520 = _441 + 64;
    uint _522 = uint(int(uint(_520) >> uint(2)));
    uint _524 = uint(int(uint(int(_522)) >> uint(2)));
    int _526 = int(_522) & 3;
    float _528 = (*spvDescriptorSet0.vp_c15)._m0[int(_524)][_526];
    int _530 = int(_522) + 1;
    uint _532 = uint(int(uint(_530) >> uint(2)));
    int _534 = _530 & 3;
    float _536 = (*spvDescriptorSet0.vp_c15)._m0[int(_532)][_534];
    float _538 = fma(_506, (*spvDescriptorSet0.vp_c8)._m0[24].x, _514);
    int _540 = as_type<int>(_514);
    if (!_447)
    {
        int _542 = _512 << 2;
        _413 = _542;
    }
    int _544 = _413;
    float _546 = fma(_427, (*spvDescriptorSet0.vp_c8)._m0[26].z, _518);
    int _548 = _544;
    if (!_447)
    {
        uint _550 = uint(int(uint(_512) >> uint(2)));
        _540 = int(_550);
    }
    int _552 = _540;
    float _554 = fma(_427, (*spvDescriptorSet0.vp_c8)._m0[24].z, _538);
    if (!_447)
    {
        int _556 = 12 & _544;
        _548 = _556;
    }
    int _558 = _548;
    float _560 = _546 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    int _562 = _441 + 48;
    uint _564 = uint(int(uint(_562) >> uint(2)));
    uint _566 = uint(int(uint(int(_564)) >> uint(2)));
    int _568 = int(_564) & 3;
    float _570 = (*spvDescriptorSet0.vp_c15)._m0[int(_566)][_568];
    int _572 = int(_564) + 1;
    uint _574 = uint(int(uint(_572) >> uint(2)));
    int _576 = _572 & 3;
    float _578 = (*spvDescriptorSet0.vp_c15)._m0[int(_574)][_576];
    float _580 = _554 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _582 = 0.0;
    if (!_447)
    {
        int _584 = _552 << 4;
        int _586 = _584 + _558;
        _582 = as_type<float>(_586);
    }
    float _588 = _582;
    float _590 = _209 + _560;
    float _592 = fma(_506, (*spvDescriptorSet0.vp_c8)._m0[25].x, _516);
    float _594 = _207 + _580;
    float _596 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _598 = _590 + _596;
    int _600 = _441 + 56;
    uint _602 = uint(int(uint(_600) >> uint(2)));
    uint _604 = uint(int(uint(int(_602)) >> uint(2)));
    int _606 = int(_602) & 3;
    float _608 = (*spvDescriptorSet0.vp_c15)._m0[int(_604)][_606];
    int _610 = int(_602) + 1;
    uint _612 = uint(int(uint(_610) >> uint(2)));
    int _614 = _610 & 3;
    float _616 = (*spvDescriptorSet0.vp_c15)._m0[int(_612)][_614];
    float _618 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _620 = _594 + _618;
    float _622 = fma(_427, (*spvDescriptorSet0.vp_c8)._m0[25].z, _592);
    float _624 = _598 * _598;
    float _626 = _622 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _628 = fma(_620, _620, _624);
    int _630 = _441 + 72;
    uint _632 = uint(int(uint(_630) >> uint(2)));
    uint _634 = uint(int(uint(int(_632)) >> uint(2)));
    int _636 = int(_632) & 3;
    float _638 = (*spvDescriptorSet0.vp_c15)._m0[int(_634)][_636];
    int _640 = int(_632) + 1;
    uint _642 = uint(int(uint(_640) >> uint(2)));
    int _644 = _640 & 3;
    float _646 = (*spvDescriptorSet0.vp_c15)._m0[int(_642)][_644];
    float _648 = _239 + _626;
    float _650 = sqrt(_628);
    int _652 = _441 + 80;
    uint _654 = uint(int(uint(_652) >> uint(2)));
    uint _656 = uint(int(uint(int(_654)) >> uint(2)));
    int _658 = int(_654) & 3;
    float _660 = (*spvDescriptorSet0.vp_c15)._m0[int(_656)][_658];
    int _662 = int(_654) + 1;
    uint _664 = uint(int(uint(_662) >> uint(2)));
    int _666 = _662 & 3;
    float _668 = (*spvDescriptorSet0.vp_c15)._m0[int(_664)][_666];
    float _670 = _269 * _466;
    float _672 = _466;
    float _674 = _594;
    float _676 = _590;
    float _678 = _628;
    float _680 = _598;
    float _682 = _620;
    if (!_447)
    {
        float _684 = floor(_315);
        _672 = _684;
    }
    float _686 = _672;
    float _688 = fma(_207, _458, _670);
    int _690 = _441 + 88;
    uint _692 = uint(int(uint(_690) >> uint(2)));
    uint _694 = uint(int(uint(int(_692)) >> uint(2)));
    int _696 = int(_692) & 3;
    float _698 = (*spvDescriptorSet0.vp_c15)._m0[int(_694)][_696];
    int _700 = int(_692) + 1;
    uint _702 = uint(int(uint(_700) >> uint(2)));
    int _704 = _700 & 3;
    float _706 = (*spvDescriptorSet0.vp_c15)._m0[int(_702)][_704];
    float _708 = fma(_209, _496, _688);
    bool _710 = _650 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _712 = _688;
    if (!_447)
    {
        float _714 = floor(_349);
        _712 = _714;
    }
    float _716 = _712;
    float _718 = _708 + _504;
    float _720 = _588;
    if (!_447)
    {
        int _722 = as_type<int>(_588) + 400;
        uint _724 = uint(int(uint(_722) >> uint(2)));
        uint _726 = uint(int(uint(int(_724)) >> uint(2)));
        int _728 = int(_724) & 3;
        float _730 = (*spvDescriptorSet0.vp_c15)._m0[int(_726)][_728];
        _720 = _730;
    }
    float _732 = _720;
    float _734 = _269 * _536;
    float _736 = fma(_207, _528, _734);
    float _738 = 1.0 / _718;
    float _740 = _269 * _578;
    float _742 = fma(_207, _570, _740);
    float _744 = fma(_209, _608, _742);
    float _746 = _744 + _616;
    float _748 = _744;
    float _750 = _528;
    if (!_710)
    {
        _748 = _648;
    }
    float _752 = _748;
    float _754 = fma(_209, _638, _736);
    float _756 = _754 + _646;
    bool _758 = !_710;
    float _760 = _752;
    if (!_758)
    {
        float _762 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _764 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _766 = _650 + _764;
        float _768 = rsqrt(_628);
        float _770 = _766 * _762;
        float _772 = _648 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _774 = _770 * 0.15915493667125701904296875;
        float _776 = _774 * 6.283185482025146484375;
        float _778 = cos(_776);
        float _780 = _774 * 6.283185482025146484375;
        float _782 = sin(_780);
        float _784 = _778 + (-1.0);
        float _786 = fma(_782, _772, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _788 = _784 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _790 = _768 * _786;
        float _792 = fma(_648, _778, _788);
        float _794 = fma(_620, _790, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _796 = fma(_598, _790, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _674 = _794;
        _760 = _792;
        _676 = _796;
        _678 = _768;
        _750 = _784;
    }
    float _798 = _674;
    float _800 = _760;
    float _802 = _676;
    float _804 = _678;
    float _806 = _750;
    float _808 = _804;
    float _810 = _806;
    if (_482)
    {
        _680 = _798;
    }
    float _812 = _680;
    float _814 = _812;
    if (_482)
    {
        _682 = _800;
    }
    float _816 = _682;
    float _818 = _816;
    if (_482)
    {
        _808 = _802;
    }
    float _820 = _808;
    float _822 = _820;
    if (!_482)
    {
        float _824 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _826 = _239 + _824;
        float _828 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _830 = _207 + _828;
        float _832 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _834 = -_239;
        float _836 = _834 + _800;
        float _838 = _826 * _826;
        float _840 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _842 = _209 + _840;
        float _844 = -_209;
        float _846 = _844 + _802;
        float _848 = fma(_830, _830, _838);
        float _850 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _852 = fma(_842, _842, _848);
        float _854 = sqrt(_852);
        float _856 = _832 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _858 = precise::min(_854, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _860 = _858 * _850;
        float _862 = -_207;
        float _864 = _862 + _798;
        float _866 = _856 * _860;
        float _868 = fma(_836, _866, _239);
        float _870 = fma(_864, _866, _207);
        float _872 = fma(_846, _866, _209);
        _818 = _868;
        _814 = _870;
        _822 = _872;
    }
    float _874 = _818;
    float _876 = _814;
    float _878 = _822;
    float _880 = _756 * _738;
    float _882 = _874 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _884 = _874 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _886 = _874 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _888 = _746 * _738;
    float _890 = fma(_876, (*spvDescriptorSet0.vp_c8)._m0[1].x, _882);
    float _892 = fma(_876, (*spvDescriptorSet0.vp_c8)._m0[2].x, _884);
    float _894 = fma(_876, (*spvDescriptorSet0.vp_c8)._m0[0].x, _886);
    float _896 = _874 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _898 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[1].z, _890);
    bool _900 = _888 >= 0.0;
    float _902 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[2].z, _892);
    float _904 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[0].z, _894);
    float _906 = _898 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _908 = _888 <= 1.0;
    bool _910 = _908 && _900;
    float _912 = _902 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _914 = _904 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _916 = fma(_876, (*spvDescriptorSet0.vp_c8)._m0[3].x, _896);
    float _918 = _906 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _920 = _880 >= 0.0;
    bool _922 = _920 && _910;
    float _924 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _926 = _912 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _928 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[3].z, _916);
    float _930 = fma(_914, (*spvDescriptorSet0.vp_c8)._m0[7].x, _918);
    bool _932 = _880 <= 1.0;
    bool _934 = _932 && _922;
    float _936 = _928;
    if (!_447)
    {
        float _938 = rint(_732);
        float _940 = precise::max(_938, 0.0);
        uint _942 = uint(_940);
        uint _944 = clamp(_942, 0u, 65535u);
        _810 = as_type<float>(_944);
    }
    float _946 = _810;
    float _948 = -_926;
    float _950 = fma(_948, _924, 1.0);
    float _952 = fma(_912, (*spvDescriptorSet0.vp_c8)._m0[7].z, _930);
    float _954 = _906 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _956 = fma(_914, (*spvDescriptorSet0.vp_c8)._m0[5].x, _954);
    float _958 = log2(_950);
    float _960 = _928 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    if (!_447)
    {
        float _962 = -_686;
        float _964 = _315 + _962;
        _936 = _964;
    }
    float _966 = _936;
    float _968 = fma(_960, (*spvDescriptorSet0.vp_c8)._m0[7].w, _952);
    float _970 = _269 * _668;
    float _972 = _906 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _974 = 1.0 / _968;
    float _976 = fma(_207, _660, _970);
    float _978 = _970;
    if (_934)
    {
        float _980 = float(_431);
        _978 = _980;
    }
    float _982 = _978;
    float _984 = fma(_914, (*spvDescriptorSet0.vp_c8)._m0[4].x, _972);
    float _986 = fma(_209, _698, _976);
    float _988 = fma(_912, (*spvDescriptorSet0.vp_c8)._m0[5].z, _956);
    float _990 = fma(_912, (*spvDescriptorSet0.vp_c8)._m0[4].z, _984);
    float _992 = _982;
    float _994 = _984;
    float _996 = _986;
    if (_934)
    {
        float _998 = rint(_982);
        float _1000 = precise::max(_998, 0.0);
        uint _1002 = uint(_1000);
        uint _1004 = clamp(_1002, 0u, 65535u);
        _992 = as_type<float>(_1004);
    }
    float _1006 = _992;
    float _1008 = _986 + _706;
    float _1010 = fma(_960, (*spvDescriptorSet0.vp_c8)._m0[5].w, _988);
    float _1012 = fma(_960, (*spvDescriptorSet0.vp_c8)._m0[4].w, _990);
    float _1014 = _958 * 0.693147182464599609375;
    float _1016 = _1014;
    float _1018 = _1012;
    if (!_447)
    {
        float _1020 = -_716;
        float _1022 = _349 + _1020;
        _994 = _1022;
    }
    float _1024 = _994;
    float _1026 = _1008 * _738;
    float _1028 = _1012 * _974;
    float _1030 = _1010 * _974;
    float _1032 = _1014 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1034 = fma(_1028, 0.5, 0.5);
    float _1036 = fma(_1030, -0.5, 0.5);
    float _1038 = _946;
    if (!_447)
    {
        float3 _3689 = float3(_966, _1024, float(as_type<int>(_946)));
        float3 _3693 = select(_3689, float3(0.0), isnan(_3689));
        float _1040 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _3693.xy, uint(rint(_3693.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _3693.xy, uint(rint(_3693.z)), level(0.0)).x;
        _1038 = _1040;
    }
    float _1042 = _1038;
    float _1044 = as_type<float>(_431);
    if (_934)
    {
        float3 _3709 = float3(_888, _880, float(as_type<int>(_1006)));
        float3 _3711 = select(_3709, float3(0.0), isnan(_3709));
        float _1046 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _3711.xy, uint(rint(_3711.z)), _1026, level(0.0));
        _1044 = _1046;
    }
    float _1048 = _1044;
    float3 _3721 = float3(_1034, _1036, _1032);
    float _1050 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3721, float3(0.0), isnan(_3721)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3721, float3(0.0), isnan(_3721)), level(0.0)).x;
    float3 _3730 = float3(_1034, _1036, _1032);
    float4 _1053 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3730, float3(0.0), isnan(_3730)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3730, float3(0.0), isnan(_3730)), level(0.0)).xyzw;
    float _1055 = _1053.x;
    float _1057 = _1053.y;
    float _1059 = _1053.z;
    float _1061 = _1053.w;
    bool _1063 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1065 = isnan(0.5);
    bool _1067 = _1063 || _1065;
    bool _1069 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1071 = _1067 || _1069;
    if (_447)
    {
        _415 = 1.0;
    }
    float _1073 = _415;
    float _1075 = _1073;
    if (_1071)
    {
        _1016 = 1.0;
    }
    float _1077 = _1016;
    float _1079 = _1077;
    if (_1071)
    {
        _996 = 1.0;
    }
    float _1081 = _996;
    float _1083 = _1081;
    float _1085 = _1055;
    if (!_1071)
    {
        float _1087 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1089 = _1087 * 0.15915493667125701904296875;
        float _1091 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1093 = _1089 * 6.283185482025146484375;
        float _1095 = cos(_1093);
        float _1097 = _1091 * 0.15915493667125701904296875;
        float _1099 = _1089 * 6.283185482025146484375;
        float _1101 = sin(_1099);
        float _1103 = 1.0 / _1095;
        float _1105 = _1097 * 6.283185482025146484375;
        float _1107 = cos(_1105);
        float _1109 = _1101 * _1103;
        float _1111 = _1097 * 6.283185482025146484375;
        float _1113 = sin(_1111);
        float _1115 = _1107 * _1109;
        float _1117 = 1.0 / _1115;
        float _1119 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1121 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1119;
        float _1123 = 1.0 / _1121;
        float _1125 = _1113 * _1117;
        float _1127 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1129 = fma(_357, _1125, _1127);
        float _1131 = _1129 * _1123;
        float _1133 = precise::clamp(_1131, 0.0, 1.0);
        _1083 = _1133;
    }
    float _1135 = _1083;
    if (!_1071)
    {
        float _1137 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1139 = _1137 * 0.15915493667125701904296875;
        float _1141 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1143 = _1139 * 6.283185482025146484375;
        float _1145 = cos(_1143);
        float _1147 = _1141 * 0.15915493667125701904296875;
        float _1149 = _1139 * 6.283185482025146484375;
        float _1151 = sin(_1149);
        float _1153 = 1.0 / _1145;
        float _1155 = _1147 * 6.283185482025146484375;
        float _1157 = cos(_1155);
        float _1159 = _1151 * _1153;
        float _1161 = _1147 * 6.283185482025146484375;
        float _1163 = sin(_1161);
        float _1165 = _1157 * _1159;
        float _1167 = 1.0 / _1165;
        float _1169 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1171 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1169;
        float _1173 = 1.0 / _1171;
        float _1175 = _1163 * _1167;
        float _1177 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1179 = fma(_357, _1175, _1177);
        float _1181 = _1179 * _1173;
        float _1183 = precise::clamp(_1181, 0.0, 1.0);
        float _1185 = -_1183;
        float _1187 = _1185 + 1.0;
        _1079 = _1187;
    }
    float _1189 = _1079;
    if (!_447)
    {
        int _1191 = _512 << 4;
        int _1193 = _1191 + 2048;
        uint _1195 = uint(int(uint(_1193) >> uint(2)));
        uint _1197 = uint(int(uint(int(_1195)) >> uint(2)));
        int _1199 = int(_1195) & 3;
        float _1201 = (*spvDescriptorSet0.vp_c15)._m0[int(_1197)][_1199];
        int _1203 = int(_1195) + 1;
        uint _1205 = uint(int(uint(_1203) >> uint(2)));
        int _1207 = _1203 & 3;
        float _1209 = (*spvDescriptorSet0.vp_c15)._m0[int(_1205)][_1207];
        int _1211 = _1193 + 8;
        uint _1213 = uint(int(uint(_1211) >> uint(2)));
        uint _1215 = uint(int(uint(int(_1213)) >> uint(2)));
        int _1217 = int(_1213) & 3;
        float _1219 = (*spvDescriptorSet0.vp_c15)._m0[int(_1215)][_1217];
        int _1221 = int(_1213) + 1;
        uint _1223 = uint(int(uint(_1221) >> uint(2)));
        int _1225 = _1221 & 3;
        float _1227 = (*spvDescriptorSet0.vp_c15)._m0[int(_1223)][_1225];
        float _1229 = _269 * _1209;
        float _1231 = fma(_207, _1201, _1229);
        float _1233 = fma(_209, _1219, _1231);
        float _1235 = _1233 + _1227;
        float _1237 = precise::clamp(_1235, 0.0, 1.0);
        float _1239 = -_1237;
        float _1241 = _1239 + _1042;
        float _1243 = fma(_1241, 500.0, 1.5);
        float _1245 = exp2(_1243);
        float _1247 = 0.0 + _1245;
        float _1249 = precise::clamp(_1247, 0.0, 1.0);
        _1075 = _1249;
    }
    float _1251 = _1075;
    float _1253 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1255 = _874 + _1253;
    float _1257 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1259 = _876 + _1257;
    float _1261 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1263 = _878 + _1261;
    float _1265 = _1255 * _1255;
    float _1267 = fma(_1259, _1259, _1265);
    float _1269 = fma(_1263, _1263, _1267);
    float _1271 = rsqrt(_1269);
    float _1273 = sqrt(_1269);
    float _1275 = _1271 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1277 = _1259 * _1275;
    float _1279 = _1263 * _1275;
    float _1281 = _1277 * _1277;
    float _1283 = _1279 * _1279;
    float _1285 = _1281 + _1283;
    float _1287 = sqrt(_1285);
    bool _1289 = _1287 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1291 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1293 = _1287 + _1291;
    float _1295 = _1263;
    float _1297 = _1285;
    float _1299 = _1293;
    float _1301 = _1275;
    if (_1289)
    {
        float _1303 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1295 = _1303;
    }
    float _1305 = _1295;
    if (_1289)
    {
        float _1307 = rsqrt(_1285);
        _1297 = _1307;
    }
    float _1309 = _1297;
    if (_1289)
    {
        float _1311 = _1293 * _1305;
        _1299 = _1311;
    }
    float _1313 = _1299;
    if (_1289)
    {
        float _1315 = _1313 * 0.15915493667125701904296875;
        _417 = _1315;
    }
    float _1317 = _417;
    float _1319 = _1265;
    float _1321 = _1317;
    if (_1289)
    {
        float _1323 = _1317 * 6.283185482025146484375;
        float _1325 = sin(_1323);
        _1319 = _1325;
    }
    float _1327 = _1319;
    float _1329 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1331 = precise::max(0.0, _1329);
    float _1333 = _1271;
    float _1335 = _1331;
    float _1337 = _1329;
    if (_1289)
    {
        float _1339 = _1317 * 6.283185482025146484375;
        float _1341 = cos(_1339);
        _1333 = _1341;
    }
    float _1343 = _1333;
    float _1345 = -_1275;
    float _1347 = -_1331;
    float _1349 = fma(_1255, _1345, _1347);
    float _1351 = _1349;
    if (!_1289)
    {
        _1335 = _1277;
    }
    float _1353 = _1335;
    float _1355 = _1353;
    if (_1289)
    {
        float _1357 = _1349 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1337 = _1357;
    }
    float _1359 = _1337;
    float _1361 = _1327;
    float _1363 = _1359;
    if (_1289)
    {
        float _1365 = fma(_1327, _1359, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1361 = _1365;
    }
    float _1367 = _1361;
    float _1369 = _1367;
    float _1371 = _1343;
    if (_1289)
    {
        float _1373 = _1343 + (-1.0);
        _1363 = _1373;
    }
    float _1375 = _1363;
    float _1377 = _1375;
    if (_1289)
    {
        float _1379 = _1309 * _1367;
        _1301 = _1379;
    }
    float _1381 = _1301;
    if (!_1289)
    {
        _1369 = _1281;
    }
    float _1383 = _1369;
    float _1385 = _1383;
    if (_1289)
    {
        float _1387 = _1375 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1321 = _1387;
    }
    float _1389 = _1321;
    if (_1289)
    {
        float _1391 = _1277 * _1381;
        _1355 = _1391;
    }
    float _1393 = _1355;
    if (!_1289)
    {
        _1377 = _1279;
    }
    float _1395 = _1377;
    float _1397 = _1395;
    if (_1289)
    {
        float _1399 = _1279 * _1381;
        _1397 = _1399;
    }
    float _1401 = _1397;
    if (_1289)
    {
        float _1403 = fma(_1349, _1343, _1389);
        _1351 = _1403;
    }
    float _1405 = _1351;
    if (_1289)
    {
        float _1407 = _1393 * _1393;
        _1385 = _1407;
    }
    float _1409 = _1385;
    if (!_1289)
    {
        _1371 = _1283;
    }
    float _1411 = _1371;
    float _1413 = _1411;
    if (_1289)
    {
        float _1415 = _1401 * _1401;
        _1413 = _1415;
    }
    float _1417 = _1413;
    float _1419 = fma(_1405, _1405, _1409);
    float _1421 = _1419 + _1417;
    float _1423 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1425 = fma(_1273, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1423);
    float _1427 = precise::clamp(_1425, 0.0, 1.0);
    float _1429 = rsqrt(_1421);
    float _1431 = -_1427;
    float _1433 = _1431 + 1.0;
    float _1435 = abs(_1433);
    float _1437 = log2(_1435);
    float _1439 = _1429 * _1393;
    float _1441 = _1429 * _1405;
    float _1443 = _1429 * _1401;
    float _1445 = _1439 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1447 = -_1445;
    float _1449 = fma(_1441, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1447);
    float _1451 = -_1443;
    float _1453 = fma(_1451, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1449);
    float _1455 = _1437 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1457 = fma(_1453, -0.5, 0.5);
    float _1459 = exp2(_1455);
    float _1461 = fma(_1453, 0.5, 0.5);
    float _1463 = fma(_1461, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1465 = sqrt(_1457);
    float _1467 = fma(_1461, _1463, -0.212114393711090087890625);
    float _1469 = _1441 + 1.0;
    float _1471 = fma(_1461, _1467, 1.570728778839111328125);
    float _1473 = -_1441;
    float _1475 = fma(_1459, _1469, _1473);
    float _1477 = fma(_1475, 0.5, 0.5);
    float _1479 = _1465 * 0.636619746685028076171875;
    float _1481 = -_1471;
    float _1483 = fma(_1479, _1481, 1.0);
    float2 _4365 = float2(_1483, _1477);
    float3 _1487 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4365, float2(0.0), isnan(_4365)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4365, float2(0.0), isnan(_4365)), level(0.0)).xyz;
    float _1489 = _1487.x;
    float _1491 = _1487.y;
    float _1493 = _1487.z;
    float _1495 = in.m_63.x;
    float _1497 = in.m_63.y;
    float _1499 = abs(_357);
    float _1501 = log2(_1499);
    float _1503 = _906 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1505 = _1437 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1507 = fma(_914, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1503);
    float _1509 = -_227;
    float _1511 = _1509 + 1.0;
    float _1513 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1515 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1517 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1519 = exp2(_1505);
    float _1521 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1523 = fma(_912, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1507);
    float _1525 = _1515 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1527 = _1501 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1529 = _1521 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1531 = _1513 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1533 = _357 <= 8000.0;
    bool _1535 = isnan(_357);
    bool _1537 = _1533 || _1535;
    bool _1539 = isnan(8000.0);
    bool _1541 = _1537 || _1539;
    float _1543 = float(_1541);
    float _1545 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1547 = fma(_960, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1523);
    bool _1549 = _1495 > 0.5;
    out.m_70.x = _1525;
    out.m_70.y = _1529;
    out.m_70.z = _1531;
    out.m_70.w = _1517;
    bool _1551 = _1497 > 0.5;
    float _1553 = exp2(_1527);
    float _1555 = -_435;
    int _1557 = _1551 ? as_type<int>(_1555) : as_type<int>(_435);
    out.gl_Position.x = _1012;
    out.gl_Position.y = _1010;
    out.gl_Position.z = _1547;
    out.gl_Position.w = _968;
    int _1559 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1561 = _1559 != 0;
    int _1563 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1565 = _1563 != 0;
    float _1567 = -_470;
    int _1569 = _1549 ? as_type<int>(_1567) : as_type<int>(_470);
    float _1571 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1573 = !_1561;
    float _1575 = _1573 ? _435 : as_type<float>(_1557);
    float _1577 = _435 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _1579 = !_1565;
    float _1581 = _1579 ? _470 : as_type<float>(_1569);
    float _1583 = _470 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1585 = _1577 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1587 = _1577 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1589 = _1577 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1591 = -_1519;
    float _1593 = _1591 + 1.0;
    float _1595 = fma(_1583, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1585);
    float _1597 = fma(_1583, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1587);
    float _1599 = fma(_1583, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1589);
    float _1601 = _1581 + 0.5;
    float _1603 = fma(_1553, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1605 = precise::clamp(_1603, 0.0, 1.0);
    float _1607 = _1517;
    float _1609 = _1599;
    float _1611 = _1597;
    float _1613 = _1595;
    if (!_934)
    {
        _1018 = 1.0;
    }
    float _1615 = _1018;
    float _1617 = _1593 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1619 = _1615;
    if (_934)
    {
        bool _1621 = _1048 >= _1026;
        bool _1623 = isnan(_1048);
        bool _1625 = _1621 || _1623;
        bool _1627 = isnan(_1026);
        bool _1629 = _1625 || _1627;
        float _1631 = float(_1629);
        _1619 = _1631;
    }
    float _1633 = _1619;
    float _1635 = fma(_1605, -2.0, 3.0);
    float _1637 = _1605 * _1605;
    float _1639 = -_1575;
    float _1641 = _1639 + 0.5;
    float _1643 = _1601 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1645 = _1633 * _1251;
    float _1647 = _1637 * _1635;
    float _1649 = _1617 * _1050;
    float _1651 = _1641 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1653 = _1643 * _1545;
    float _1655 = -_1647;
    float _1657 = _1655 + 1.0;
    float _1659 = _1547 + _968;
    float _1661 = -_1617;
    float _1663 = _1661 + 1.0;
    float _1665 = fma(_1657, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1647);
    float _1667 = _1061 * _1649;
    float _1669 = _1651 * _1571;
    float _1671 = _1061 * _1663;
    float _1673 = _1543 * _1665;
    float _1675 = _1659 * 0.5;
    float _1677 = _1597 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _1679 = _1599 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _1681 = _1673 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_72.x = _1653;
    out.m_72.y = _1669;
    bool _1683 = _1273 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1685 = isnan(_1273);
    bool _1687 = _1683 || _1685;
    bool _1689 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1691 = _1687 || _1689;
    float _1693 = _1511 * _1681;
    float _1695 = precise::clamp(_1693, 0.0, 1.0);
    out.m_74.z = _1675;
    out.m_74.w = _968;
    float _1697 = -_1695;
    float _1699 = fma(_1697, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1701 = -_1645;
    float _1703 = fma(_1701, _1699, 1.0);
    float _1705 = precise::clamp(_1703, 0.0, 1.0);
    if (!_1691)
    {
        _1607 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1707 = _1607;
    float _1709 = _1705 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1711 = _1595 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _1713 = _1707;
    float _1715 = _1707;
    if (!_1691)
    {
        _1609 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1717 = _1609;
    float _1719 = _1717;
    float _1721 = _1717;
    if (!_1691)
    {
        _1611 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1723 = _1611;
    out.m_76.x = _1709;
    float _1725 = _1723;
    float _1727 = _1723;
    if (!_1691)
    {
        _1613 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1729 = _1613;
    out.m_78.x = _1711;
    out.m_78.y = _1677;
    out.m_78.z = _1679;
    float _1731 = _1493 * _1649;
    float _1733 = fma(_1489, _1667, _1055);
    float _1735 = fma(_1491, _1667, _1057);
    float _1737 = _1135 * _1189;
    float _1739 = fma(_1061, _1731, _1059);
    float _1741 = _1737;
    float _1743 = _1729;
    float _1745 = _1729;
    if (!_1691)
    {
        _1085 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1747 = _1085;
    float _1749 = _1737 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1751 = _1747;
    float _1753 = _1747;
    if (!_1691)
    {
        _1741 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1755 = _1741;
    out.m_80.x = _1733;
    out.m_80.y = _1735;
    out.m_80.z = _1739;
    out.m_80.w = _1671;
    bool _1757 = !_1691;
    float _1759 = _1755;
    float _1761 = _1755;
    if (!_1757)
    {
        bool _1763 = _1273 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1765 = isnan(_1273);
        bool _1767 = _1763 || _1765;
        bool _1769 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1771 = _1767 || _1769;
        if (!_1771)
        {
            float _1773 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1775 = _1273 + _1773;
            float _1777 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1779 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1777;
            float _1781 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1783 = _1781 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1785 = 1.0 / _1779;
            float _1787 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1789 = _1787 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1791 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1793 = _1791 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1795 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1797 = _1795 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1799 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1801 = _1799 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1803 = _1775 * _1785;
            float _1805 = precise::clamp(_1803, 0.0, 1.0);
            float _1807 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1809 = _1807 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1811 = fma(_1805, _1783, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1813 = fma(_1805, _1809, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1815 = fma(_1805, _1789, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1817 = fma(_1805, _1793, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1819 = fma(_1805, _1797, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1821 = fma(_1805, _1801, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1715 = _1815;
            _1745 = _1819;
            _1753 = _1811;
            _1727 = _1817;
            _1721 = _1813;
            _1761 = _1821;
            _1823 = true;
        }
        else
        {
            bool _1825 = _1273 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1827 = isnan(_1273);
            bool _1829 = _1825 || _1827;
            bool _1831 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1833 = _1829 || _1831;
            if (!_1833)
            {
                _1751 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1835 = _1751;
            _1753 = _1835;
            if (!_1833)
            {
                _1713 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1837 = _1713;
            _1715 = _1837;
            if (!_1833)
            {
                _1719 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1839 = _1719;
            _1721 = _1839;
            if (!_1833)
            {
                _1725 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1841 = _1725;
            _1727 = _1841;
            if (!_1833)
            {
                _1743 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1843 = _1743;
            _1745 = _1843;
            if (!_1833)
            {
                _1759 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1845 = _1759;
            bool _1847 = !_1833;
            _1761 = _1845;
            if (!_1847)
            {
                bool _1849 = _1273 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1851 = isnan(_1273);
                bool _1853 = _1849 || _1851;
                bool _1855 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1857 = _1853 || _1855;
                if (!_1857)
                {
                    float _1859 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1861 = _1273 + _1859;
                    float _1863 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1865 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1863;
                    float _1867 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1869 = _1867 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1871 = 1.0 / _1865;
                    float _1873 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1875 = _1873 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1877 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1879 = _1877 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1881 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1883 = _1881 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1885 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1887 = _1885 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1889 = _1861 * _1871;
                    float _1891 = precise::clamp(_1889, 0.0, 1.0);
                    float _1893 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1895 = _1893 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1897 = fma(_1891, _1869, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1899 = fma(_1891, _1895, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1901 = fma(_1891, _1875, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1903 = fma(_1891, _1879, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1905 = fma(_1891, _1883, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1907 = fma(_1891, _1887, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1715 = _1901;
                    _1745 = _1905;
                    _1753 = _1897;
                    _1727 = _1903;
                    _1721 = _1899;
                    _1761 = _1907;
                    _1823 = true;
                }
                else
                {
                    _1715 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1745 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1753 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1727 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1721 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1761 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1823 = false;
    float _1909 = _1715;
    float _1911 = _1745;
    float _1913 = _1753;
    float _1915 = _1727;
    float _1917 = _1721;
    float _1919 = _1761;
    float _1921 = fma(_1677, -0.5, 0.5);
    float _1923 = precise::clamp(_1921, 0.0, 1.0);
    float _1925 = -_1909;
    float _1927 = _1925 + _1911;
    float _1929 = _1749 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1931 = -_1913;
    float _1933 = _1931 + _1915;
    float _1935 = fma(_1923, _1927, _1909);
    out.m_82.x = 0.0;
    float _1937 = -_1917;
    float _1939 = _1937 + _1919;
    float _1941 = fma(_1923, _1933, _1913);
    float _1943 = _1935 * 0.586610972881317138671875;
    out.m_59.x = _1929;
    bool _1945 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1947 = fma(_1923, _1939, _1917);
    float _1949 = fma(_1941, 0.298911988735198974609375, _1943);
    bool _1951 = _1135 > 0.0;
    bool _1953 = isnan(_1135);
    bool _1955 = _1951 || _1953;
    bool _1957 = isnan(0.0);
    bool _1959 = _1955 || _1957;
    float _1961 = fma(_1947, 0.114477999508380889892578125, _1949);
    bool _1963 = _1189 <= 0.0;
    bool _1965 = !_1959;
    bool _1967 = _1963 || _1965;
    float _1969 = -_1961;
    float _1971 = _1941 + _1969;
    float _1973 = -_1961;
    float _1975 = _1935 + _1973;
    float _1977 = -_1961;
    float _1979 = _1947 + _1977;
    float _1981 = fma(_1971, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1961);
    float _1983 = fma(_1975, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1961);
    float _1985 = fma(_1979, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1961);
    bool _1987 = !_1945;
    if (!_1987)
    {
        float _1989 = -_874;
        float _1991 = _1989 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _1993 = -_876;
        float _1995 = _1993 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _1997 = -_878;
        float _1999 = _1997 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2001 = _1991 * _1991;
        float _2003 = fma(_1995, _1995, _2001);
        float _2005 = fma(_1999, _1999, _2003);
        float _2007 = sqrt(_2005);
        float _2009 = rsqrt(_2005);
        float _2011 = -_2007;
        float _2013 = _2011 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2015 = _2013 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2017 = precise::clamp(_2015, 0.0, 1.0);
        float _2019 = _1995 * _2009;
        float _2021 = _1991 * _2009;
        float _2023 = abs(_2017);
        float _2025 = log2(_2023);
        float _2027 = _1999 * _2009;
        float _2029 = _2019 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2031 = _1677 * _2021;
        float _2033 = -_2021;
        float _2035 = -_2029;
        float _2037 = fma(_2033, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2035);
        float _2039 = fma(_1711, _2019, _2031);
        float _2041 = -_2027;
        float _2043 = fma(_2041, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2037);
        float _2045 = fma(_1679, _2027, _2039);
        float _2047 = precise::clamp(_2045, 0.0, 1.0);
        float _2049 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2051 = _2043 + _2049;
        float _2053 = _2025 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2055 = _2051 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2057 = precise::clamp(_2055, 0.0, 1.0);
        float _2059 = exp2(_2053);
        float _2061 = _2059 * _2057;
        float _2063 = _2047 * _2061;
        float _2065 = _2063 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2067 = _2063 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2069 = _2063 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_82.x = _2065;
        out.m_82.y = _2067;
        out.m_82.z = _2069;
    }
    out.m_84.x = _1981;
    out.m_84.y = _1983;
    out.m_84.z = _1985;
    if (!_1967)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_59.x = 0.0;
    float _2071 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2071;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1823 = false;
    bool _179 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _98 = in.m_56.w;
    float _100 = trunc(_98);
    int _103 = int(_100);
    bool _107 = _103 >= 1;
    float _109 = 0.0;
    if (!_107)
    {
        _109 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _111 = _109;
    float _113 = _111;
    if (!_107)
    {
        out.m_59.x = 0.0;
    }
    int _115 = 0;
    if (!_107)
    {
        float _117 = _111 * 5.0;
        _115 = as_type<int>(_117);
    }
    int _119 = _115;
    if (!_107)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2127 = as_type<float>(_119);
        out.gl_Position.z = _2127;
    }
    if (!_107)
    {
        return out;
    }
    float _121 = in.m_61.w;
    bool _123 = _121 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _125 = isnan(_121);
    bool _127 = _123 || _125;
    bool _129 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _131 = _127 || _129;
    float _133 = -_121;
    float _135 = _133 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_131)
    {
        float _137 = float(_103);
        _113 = _137;
    }
    float _139 = _113;
    bool _141 = _135 >= _139;
    bool _143 = !_131;
    bool _145 = _141 || _143;
    float _147 = _139;
    if (_145)
    {
        _147 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _149 = _147;
    if (_145)
    {
        out.m_59.x = 0.0;
    }
    int _151 = 0;
    if (_145)
    {
        float _153 = _149 * 5.0;
        _151 = as_type<int>(_153);
    }
    int _155 = _151;
    if (_145)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2196 = as_type<float>(_155);
        out.gl_Position.z = _2196;
    }
    if (_145)
    {
        return out;
    }
    bool _157 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _159 = !_157;
    float _177;
    if (!_159)
    {
        float _161 = in.m_63.x;
        float _163 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _165 = _161 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _167 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[12].x, _135);
        float _169 = _167 * _163;
        float _171 = floor(_169);
        float _173 = -_171;
        float _175 = _169 + _173;
        _177 = _175;
        _179 = true;
    }
    else
    {
        float _181 = float(_103);
        float _183 = 1.0 / _181;
        float _185 = _135 * _183;
        _177 = _185;
    }
    _179 = false;
    float _187 = _177;
    float _189 = in.m_56.x;
    float _191 = in.m_56.y;
    float _193 = in.m_56.z;
    float _195 = _191 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _197 = _191 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _199 = fma(_189, (*spvDescriptorSet0.vp_c10)._m0[4].x, _195);
    float _201 = fma(_189, (*spvDescriptorSet0.vp_c10)._m0[6].x, _197);
    float _203 = fma(_193, (*spvDescriptorSet0.vp_c10)._m0[4].z, _199);
    float _205 = fma(_193, (*spvDescriptorSet0.vp_c10)._m0[6].z, _201);
    float _207 = _203 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _209 = _205 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _211 = fma(_207, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _213 = fma(_209, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _215 = floor(_211);
    float _217 = floor(_213);
    float _219 = -_215;
    float _221 = _211 + _219;
    float _223 = -_217;
    float _225 = _213 + _223;
    float2 _2323 = float2(_221, _225);
    float _227 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_2323, float2(0.0), isnan(_2323)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_2323, float2(0.0), isnan(_2323)), level(0.0)).x;
    float _229 = _191 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _231 = as_type<float>(int(gl_VertexIndex));
    float _233 = fma(_189, (*spvDescriptorSet0.vp_c10)._m0[5].x, _229);
    float _235 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _237 = fma(_193, (*spvDescriptorSet0.vp_c10)._m0[5].z, _233);
    float _239 = _237 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _241 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _243 = _187 + _241;
    float _245 = _239 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _247 = _239 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _249 = fma(_207, (*spvDescriptorSet0.vp_c8)._m0[11].x, _245);
    float _251 = fma(_207, (*spvDescriptorSet0.vp_c8)._m0[10].x, _247);
    float _253 = fma(_209, (*spvDescriptorSet0.vp_c8)._m0[11].z, _249);
    float _255 = fma(_209, (*spvDescriptorSet0.vp_c8)._m0[10].z, _251);
    float _257 = _253 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _259 = _255 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _261 = 1.0 / _257;
    float _263 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _265 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _263;
    float _267 = _259 + _257;
    float _269 = _239 + _235;
    float _271 = 1.0 / _265;
    float _273 = _269 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    bool _275 = _187 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _277 = isnan(_187);
    bool _279 = _275 || _277;
    bool _281 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _283 = _279 || _281;
    float _285 = float(_283);
    float _287 = fma(_207, (*spvDescriptorSet0.vp_c15)._m0[126].x, _273);
    float _289 = _267 * _261;
    float _291 = _289 * 0.5;
    float _293 = -_285;
    float _295 = _293 + 1.0;
    float _297 = fma(_209, (*spvDescriptorSet0.vp_c15)._m0[126].z, _287);
    float _299 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _301 = fma(_291, (*spvDescriptorSet0.vp_c8)._m0[30].w, _299);
    bool _303 = _187 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _305 = isnan(_187);
    bool _307 = _303 || _305;
    bool _309 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _311 = _307 || _309;
    float _313 = float(_311);
    float _315 = _297 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _317 = _243 * _271;
    float _319 = _269 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _321 = 1.0 / _301;
    float _323 = _313 * _295;
    float _325 = -_313;
    float _327 = _325 + 1.0;
    float _329 = fma(_207, (*spvDescriptorSet0.vp_c15)._m0[127].x, _319);
    float _331 = in.m_68.x;
    float _333 = in.m_68.y;
    float _335 = fma(_209, (*spvDescriptorSet0.vp_c15)._m0[127].z, _329);
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _339 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _337;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _343 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _341;
    float _345 = trunc(_315);
    int _347 = int(_345);
    float _349 = _335 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _351 = fma(_339, _317, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _353 = fma(_343, _317, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _355 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _357 = _321 * _355;
    float _359 = _351 * _323;
    float _361 = trunc(_349);
    int _363 = int(_361);
    float _365 = _353 * _323;
    bool _367 = _357 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _369 = fma(_327, (*spvDescriptorSet0.vp_c9)._m0[143].x, _359);
    bool _371 = _357 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _373 = fma(_327, (*spvDescriptorSet0.vp_c9)._m0[143].y, _365);
    float _375 = fma(_285, (*spvDescriptorSet0.vp_c9)._m0[144].x, _369);
    int _377 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _379 = _347 + _377;
    int _381 = _379 + 1;
    float _383 = fma(_285, (*spvDescriptorSet0.vp_c9)._m0[144].y, _373);
    bool _385 = !_367;
    int _387 = _385 ? 0 : 1;
    float _389 = _375 * _331;
    int _391 = as_type<int>(_231) & 1;
    bool _393 = _391 != 0;
    int _395 = as_type<int>(_231) & 2;
    bool _397 = _395 != 0;
    float _399 = _383 * _333;
    int _401 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _403 = _363 + _401;
    int _405 = _403 + 1;
    float _407 = _389 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _409 = 2;
    int _411 = as_type<int>(_231);
    int _413 = as_type<int>(_317);
    float _415 = _349;
    float _417 = _209;
    if (!_367)
    {
        _409 = 1;
    }
    int _419 = _409;
    float _421 = _399 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _423 = _381 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _425 = _381 | _405;
    float _427 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    int _429 = _419;
    if (!_371)
    {
        _429 = _387;
    }
    int _431 = _429;
    bool _433 = !_397;
    float _435 = _433 ? (-0.5) : 0.5;
    bool _437 = _425 < 0;
    bool _439 = _437 || _423;
    int _441 = _431 << 6;
    float _443 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _435);
    bool _445 = _405 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _447 = _445 || _439;
    int _449 = _441 + 96;
    uint _452 = uint(int(uint(_449) >> uint(2)));
    uint _454 = uint(int(uint(int(_452)) >> uint(2)));
    int _456 = int(_452) & 3;
    float _458 = (*spvDescriptorSet0.vp_c15)._m0[int(_454)][_456];
    int _460 = int(_452) + 1;
    uint _462 = uint(int(uint(_460) >> uint(2)));
    int _464 = _460 & 3;
    float _466 = (*spvDescriptorSet0.vp_c15)._m0[int(_462)][_464];
    bool _468 = !_393;
    float _470 = _468 ? (-0.5) : 0.5;
    float _472 = _421 * _443;
    bool _474 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _476 = isnan(0.5);
    bool _478 = _474 || _476;
    bool _480 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _482 = _478 || _480;
    float _484 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _470);
    float _486 = _472 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _488 = _441 + 104;
    uint _490 = uint(int(uint(_488) >> uint(2)));
    uint _492 = uint(int(uint(int(_490)) >> uint(2)));
    int _494 = int(_490) & 3;
    float _496 = (*spvDescriptorSet0.vp_c15)._m0[int(_492)][_494];
    int _498 = int(_490) + 1;
    uint _500 = uint(int(uint(_498) >> uint(2)));
    int _502 = _498 & 3;
    float _504 = (*spvDescriptorSet0.vp_c15)._m0[int(_500)][_502];
    float _506 = _407 * _484;
    if (!_447)
    {
        int _508 = _405 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _510 = _508 + _381;
        _411 = _510;
    }
    int _512 = _411;
    float _514 = _472 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _516 = _472 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _518 = fma(_506, (*spvDescriptorSet0.vp_c8)._m0[26].x, _486);
    int _520 = _441 + 64;
    uint _522 = uint(int(uint(_520) >> uint(2)));
    uint _524 = uint(int(uint(int(_522)) >> uint(2)));
    int _526 = int(_522) & 3;
    float _528 = (*spvDescriptorSet0.vp_c15)._m0[int(_524)][_526];
    int _530 = int(_522) + 1;
    uint _532 = uint(int(uint(_530) >> uint(2)));
    int _534 = _530 & 3;
    float _536 = (*spvDescriptorSet0.vp_c15)._m0[int(_532)][_534];
    float _538 = fma(_506, (*spvDescriptorSet0.vp_c8)._m0[24].x, _514);
    int _540 = as_type<int>(_514);
    if (!_447)
    {
        int _542 = _512 << 2;
        _413 = _542;
    }
    int _544 = _413;
    float _546 = fma(_427, (*spvDescriptorSet0.vp_c8)._m0[26].z, _518);
    int _548 = _544;
    if (!_447)
    {
        uint _550 = uint(int(uint(_512) >> uint(2)));
        _540 = int(_550);
    }
    int _552 = _540;
    float _554 = fma(_427, (*spvDescriptorSet0.vp_c8)._m0[24].z, _538);
    if (!_447)
    {
        int _556 = 12 & _544;
        _548 = _556;
    }
    int _558 = _548;
    float _560 = _546 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    int _562 = _441 + 48;
    uint _564 = uint(int(uint(_562) >> uint(2)));
    uint _566 = uint(int(uint(int(_564)) >> uint(2)));
    int _568 = int(_564) & 3;
    float _570 = (*spvDescriptorSet0.vp_c15)._m0[int(_566)][_568];
    int _572 = int(_564) + 1;
    uint _574 = uint(int(uint(_572) >> uint(2)));
    int _576 = _572 & 3;
    float _578 = (*spvDescriptorSet0.vp_c15)._m0[int(_574)][_576];
    float _580 = _554 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _582 = 0.0;
    if (!_447)
    {
        int _584 = _552 << 4;
        int _586 = _584 + _558;
        _582 = as_type<float>(_586);
    }
    float _588 = _582;
    float _590 = _209 + _560;
    float _592 = fma(_506, (*spvDescriptorSet0.vp_c8)._m0[25].x, _516);
    float _594 = _207 + _580;
    float _596 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _598 = _590 + _596;
    int _600 = _441 + 56;
    uint _602 = uint(int(uint(_600) >> uint(2)));
    uint _604 = uint(int(uint(int(_602)) >> uint(2)));
    int _606 = int(_602) & 3;
    float _608 = (*spvDescriptorSet0.vp_c15)._m0[int(_604)][_606];
    int _610 = int(_602) + 1;
    uint _612 = uint(int(uint(_610) >> uint(2)));
    int _614 = _610 & 3;
    float _616 = (*spvDescriptorSet0.vp_c15)._m0[int(_612)][_614];
    float _618 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _620 = _594 + _618;
    float _622 = fma(_427, (*spvDescriptorSet0.vp_c8)._m0[25].z, _592);
    float _624 = _598 * _598;
    float _626 = _622 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _628 = fma(_620, _620, _624);
    int _630 = _441 + 72;
    uint _632 = uint(int(uint(_630) >> uint(2)));
    uint _634 = uint(int(uint(int(_632)) >> uint(2)));
    int _636 = int(_632) & 3;
    float _638 = (*spvDescriptorSet0.vp_c15)._m0[int(_634)][_636];
    int _640 = int(_632) + 1;
    uint _642 = uint(int(uint(_640) >> uint(2)));
    int _644 = _640 & 3;
    float _646 = (*spvDescriptorSet0.vp_c15)._m0[int(_642)][_644];
    float _648 = _239 + _626;
    float _650 = sqrt(_628);
    int _652 = _441 + 80;
    uint _654 = uint(int(uint(_652) >> uint(2)));
    uint _656 = uint(int(uint(int(_654)) >> uint(2)));
    int _658 = int(_654) & 3;
    float _660 = (*spvDescriptorSet0.vp_c15)._m0[int(_656)][_658];
    int _662 = int(_654) + 1;
    uint _664 = uint(int(uint(_662) >> uint(2)));
    int _666 = _662 & 3;
    float _668 = (*spvDescriptorSet0.vp_c15)._m0[int(_664)][_666];
    float _670 = _269 * _466;
    float _672 = _466;
    float _674 = _594;
    float _676 = _590;
    float _678 = _628;
    float _680 = _598;
    float _682 = _620;
    if (!_447)
    {
        float _684 = floor(_315);
        _672 = _684;
    }
    float _686 = _672;
    float _688 = fma(_207, _458, _670);
    int _690 = _441 + 88;
    uint _692 = uint(int(uint(_690) >> uint(2)));
    uint _694 = uint(int(uint(int(_692)) >> uint(2)));
    int _696 = int(_692) & 3;
    float _698 = (*spvDescriptorSet0.vp_c15)._m0[int(_694)][_696];
    int _700 = int(_692) + 1;
    uint _702 = uint(int(uint(_700) >> uint(2)));
    int _704 = _700 & 3;
    float _706 = (*spvDescriptorSet0.vp_c15)._m0[int(_702)][_704];
    float _708 = fma(_209, _496, _688);
    bool _710 = _650 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _712 = _688;
    if (!_447)
    {
        float _714 = floor(_349);
        _712 = _714;
    }
    float _716 = _712;
    float _718 = _708 + _504;
    float _720 = _588;
    if (!_447)
    {
        int _722 = as_type<int>(_588) + 400;
        uint _724 = uint(int(uint(_722) >> uint(2)));
        uint _726 = uint(int(uint(int(_724)) >> uint(2)));
        int _728 = int(_724) & 3;
        float _730 = (*spvDescriptorSet0.vp_c15)._m0[int(_726)][_728];
        _720 = _730;
    }
    float _732 = _720;
    float _734 = _269 * _536;
    float _736 = fma(_207, _528, _734);
    float _738 = 1.0 / _718;
    float _740 = _269 * _578;
    float _742 = fma(_207, _570, _740);
    float _744 = fma(_209, _608, _742);
    float _746 = _744 + _616;
    float _748 = _744;
    float _750 = _528;
    if (!_710)
    {
        _748 = _648;
    }
    float _752 = _748;
    float _754 = fma(_209, _638, _736);
    float _756 = _754 + _646;
    bool _758 = !_710;
    float _760 = _752;
    if (!_758)
    {
        float _762 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _764 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _766 = _650 + _764;
        float _768 = rsqrt(_628);
        float _770 = _766 * _762;
        float _772 = _648 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _774 = _770 * 0.15915493667125701904296875;
        float _776 = _774 * 6.283185482025146484375;
        float _778 = cos(_776);
        float _780 = _774 * 6.283185482025146484375;
        float _782 = sin(_780);
        float _784 = _778 + (-1.0);
        float _786 = fma(_782, _772, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _788 = _784 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _790 = _768 * _786;
        float _792 = fma(_648, _778, _788);
        float _794 = fma(_620, _790, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _796 = fma(_598, _790, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _674 = _794;
        _760 = _792;
        _676 = _796;
        _678 = _768;
        _750 = _784;
    }
    float _798 = _674;
    float _800 = _760;
    float _802 = _676;
    float _804 = _678;
    float _806 = _750;
    float _808 = _804;
    float _810 = _806;
    if (_482)
    {
        _680 = _798;
    }
    float _812 = _680;
    float _814 = _812;
    if (_482)
    {
        _682 = _800;
    }
    float _816 = _682;
    float _818 = _816;
    if (_482)
    {
        _808 = _802;
    }
    float _820 = _808;
    float _822 = _820;
    if (!_482)
    {
        float _824 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _826 = _239 + _824;
        float _828 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _830 = _207 + _828;
        float _832 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _834 = -_239;
        float _836 = _834 + _800;
        float _838 = _826 * _826;
        float _840 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _842 = _209 + _840;
        float _844 = -_209;
        float _846 = _844 + _802;
        float _848 = fma(_830, _830, _838);
        float _850 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _852 = fma(_842, _842, _848);
        float _854 = sqrt(_852);
        float _856 = _832 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _858 = precise::min(_854, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _860 = _858 * _850;
        float _862 = -_207;
        float _864 = _862 + _798;
        float _866 = _856 * _860;
        float _868 = fma(_836, _866, _239);
        float _870 = fma(_864, _866, _207);
        float _872 = fma(_846, _866, _209);
        _818 = _868;
        _814 = _870;
        _822 = _872;
    }
    float _874 = _818;
    float _876 = _814;
    float _878 = _822;
    float _880 = _756 * _738;
    float _882 = _874 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _884 = _874 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _886 = _874 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _888 = _746 * _738;
    float _890 = fma(_876, (*spvDescriptorSet0.vp_c8)._m0[1].x, _882);
    float _892 = fma(_876, (*spvDescriptorSet0.vp_c8)._m0[2].x, _884);
    float _894 = fma(_876, (*spvDescriptorSet0.vp_c8)._m0[0].x, _886);
    float _896 = _874 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _898 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[1].z, _890);
    bool _900 = _888 >= 0.0;
    float _902 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[2].z, _892);
    float _904 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[0].z, _894);
    float _906 = _898 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _908 = _888 <= 1.0;
    bool _910 = _908 && _900;
    float _912 = _902 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _914 = _904 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _916 = fma(_876, (*spvDescriptorSet0.vp_c8)._m0[3].x, _896);
    float _918 = _906 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _920 = _880 >= 0.0;
    bool _922 = _920 && _910;
    float _924 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _926 = _912 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _928 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[3].z, _916);
    float _930 = fma(_914, (*spvDescriptorSet0.vp_c8)._m0[7].x, _918);
    bool _932 = _880 <= 1.0;
    bool _934 = _932 && _922;
    float _936 = _928;
    if (!_447)
    {
        float _938 = rint(_732);
        float _940 = precise::max(_938, 0.0);
        uint _942 = uint(_940);
        uint _944 = clamp(_942, 0u, 65535u);
        _810 = as_type<float>(_944);
    }
    float _946 = _810;
    float _948 = -_926;
    float _950 = fma(_948, _924, 1.0);
    float _952 = fma(_912, (*spvDescriptorSet0.vp_c8)._m0[7].z, _930);
    float _954 = _906 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _956 = fma(_914, (*spvDescriptorSet0.vp_c8)._m0[5].x, _954);
    float _958 = log2(_950);
    float _960 = _928 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    if (!_447)
    {
        float _962 = -_686;
        float _964 = _315 + _962;
        _936 = _964;
    }
    float _966 = _936;
    float _968 = fma(_960, (*spvDescriptorSet0.vp_c8)._m0[7].w, _952);
    float _970 = _269 * _668;
    float _972 = _906 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _974 = 1.0 / _968;
    float _976 = fma(_207, _660, _970);
    float _978 = _970;
    if (_934)
    {
        float _980 = float(_431);
        _978 = _980;
    }
    float _982 = _978;
    float _984 = fma(_914, (*spvDescriptorSet0.vp_c8)._m0[4].x, _972);
    float _986 = fma(_209, _698, _976);
    float _988 = fma(_912, (*spvDescriptorSet0.vp_c8)._m0[5].z, _956);
    float _990 = fma(_912, (*spvDescriptorSet0.vp_c8)._m0[4].z, _984);
    float _992 = _982;
    float _994 = _984;
    float _996 = _986;
    if (_934)
    {
        float _998 = rint(_982);
        float _1000 = precise::max(_998, 0.0);
        uint _1002 = uint(_1000);
        uint _1004 = clamp(_1002, 0u, 65535u);
        _992 = as_type<float>(_1004);
    }
    float _1006 = _992;
    float _1008 = _986 + _706;
    float _1010 = fma(_960, (*spvDescriptorSet0.vp_c8)._m0[5].w, _988);
    float _1012 = fma(_960, (*spvDescriptorSet0.vp_c8)._m0[4].w, _990);
    float _1014 = _958 * 0.693147182464599609375;
    float _1016 = _1014;
    float _1018 = _1012;
    if (!_447)
    {
        float _1020 = -_716;
        float _1022 = _349 + _1020;
        _994 = _1022;
    }
    float _1024 = _994;
    float _1026 = _1008 * _738;
    float _1028 = _1012 * _974;
    float _1030 = _1010 * _974;
    float _1032 = _1014 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1034 = fma(_1028, 0.5, 0.5);
    float _1036 = fma(_1030, -0.5, 0.5);
    float _1038 = _946;
    if (!_447)
    {
        float3 _3689 = float3(_966, _1024, float(as_type<int>(_946)));
        float3 _3693 = select(_3689, float3(0.0), isnan(_3689));
        float _1040 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _3693.xy, uint(rint(_3693.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _3693.xy, uint(rint(_3693.z)), level(0.0)).x;
        _1038 = _1040;
    }
    float _1042 = _1038;
    float _1044 = as_type<float>(_431);
    if (_934)
    {
        float3 _3709 = float3(_888, _880, float(as_type<int>(_1006)));
        float3 _3711 = select(_3709, float3(0.0), isnan(_3709));
        float _1046 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _3711.xy, uint(rint(_3711.z)), _1026, level(0.0));
        _1044 = _1046;
    }
    float _1048 = _1044;
    float3 _3721 = float3(_1034, _1036, _1032);
    float _1050 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3721, float3(0.0), isnan(_3721)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3721, float3(0.0), isnan(_3721)), level(0.0)).x;
    float3 _3730 = float3(_1034, _1036, _1032);
    float4 _1053 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3730, float3(0.0), isnan(_3730)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3730, float3(0.0), isnan(_3730)), level(0.0)).xyzw;
    float _1055 = _1053.x;
    float _1057 = _1053.y;
    float _1059 = _1053.z;
    float _1061 = _1053.w;
    bool _1063 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1065 = isnan(0.5);
    bool _1067 = _1063 || _1065;
    bool _1069 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1071 = _1067 || _1069;
    if (_447)
    {
        _415 = 1.0;
    }
    float _1073 = _415;
    float _1075 = _1073;
    if (_1071)
    {
        _1016 = 1.0;
    }
    float _1077 = _1016;
    float _1079 = _1077;
    if (_1071)
    {
        _996 = 1.0;
    }
    float _1081 = _996;
    float _1083 = _1081;
    float _1085 = _1055;
    if (!_1071)
    {
        float _1087 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1089 = _1087 * 0.15915493667125701904296875;
        float _1091 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1093 = _1089 * 6.283185482025146484375;
        float _1095 = cos(_1093);
        float _1097 = _1091 * 0.15915493667125701904296875;
        float _1099 = _1089 * 6.283185482025146484375;
        float _1101 = sin(_1099);
        float _1103 = 1.0 / _1095;
        float _1105 = _1097 * 6.283185482025146484375;
        float _1107 = cos(_1105);
        float _1109 = _1101 * _1103;
        float _1111 = _1097 * 6.283185482025146484375;
        float _1113 = sin(_1111);
        float _1115 = _1107 * _1109;
        float _1117 = 1.0 / _1115;
        float _1119 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1121 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1119;
        float _1123 = 1.0 / _1121;
        float _1125 = _1113 * _1117;
        float _1127 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1129 = fma(_357, _1125, _1127);
        float _1131 = _1129 * _1123;
        float _1133 = precise::clamp(_1131, 0.0, 1.0);
        _1083 = _1133;
    }
    float _1135 = _1083;
    if (!_1071)
    {
        float _1137 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1139 = _1137 * 0.15915493667125701904296875;
        float _1141 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1143 = _1139 * 6.283185482025146484375;
        float _1145 = cos(_1143);
        float _1147 = _1141 * 0.15915493667125701904296875;
        float _1149 = _1139 * 6.283185482025146484375;
        float _1151 = sin(_1149);
        float _1153 = 1.0 / _1145;
        float _1155 = _1147 * 6.283185482025146484375;
        float _1157 = cos(_1155);
        float _1159 = _1151 * _1153;
        float _1161 = _1147 * 6.283185482025146484375;
        float _1163 = sin(_1161);
        float _1165 = _1157 * _1159;
        float _1167 = 1.0 / _1165;
        float _1169 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1171 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1169;
        float _1173 = 1.0 / _1171;
        float _1175 = _1163 * _1167;
        float _1177 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1179 = fma(_357, _1175, _1177);
        float _1181 = _1179 * _1173;
        float _1183 = precise::clamp(_1181, 0.0, 1.0);
        float _1185 = -_1183;
        float _1187 = _1185 + 1.0;
        _1079 = _1187;
    }
    float _1189 = _1079;
    if (!_447)
    {
        int _1191 = _512 << 4;
        int _1193 = _1191 + 2048;
        uint _1195 = uint(int(uint(_1193) >> uint(2)));
        uint _1197 = uint(int(uint(int(_1195)) >> uint(2)));
        int _1199 = int(_1195) & 3;
        float _1201 = (*spvDescriptorSet0.vp_c15)._m0[int(_1197)][_1199];
        int _1203 = int(_1195) + 1;
        uint _1205 = uint(int(uint(_1203) >> uint(2)));
        int _1207 = _1203 & 3;
        float _1209 = (*spvDescriptorSet0.vp_c15)._m0[int(_1205)][_1207];
        int _1211 = _1193 + 8;
        uint _1213 = uint(int(uint(_1211) >> uint(2)));
        uint _1215 = uint(int(uint(int(_1213)) >> uint(2)));
        int _1217 = int(_1213) & 3;
        float _1219 = (*spvDescriptorSet0.vp_c15)._m0[int(_1215)][_1217];
        int _1221 = int(_1213) + 1;
        uint _1223 = uint(int(uint(_1221) >> uint(2)));
        int _1225 = _1221 & 3;
        float _1227 = (*spvDescriptorSet0.vp_c15)._m0[int(_1223)][_1225];
        float _1229 = _269 * _1209;
        float _1231 = fma(_207, _1201, _1229);
        float _1233 = fma(_209, _1219, _1231);
        float _1235 = _1233 + _1227;
        float _1237 = precise::clamp(_1235, 0.0, 1.0);
        float _1239 = -_1237;
        float _1241 = _1239 + _1042;
        float _1243 = fma(_1241, 500.0, 1.5);
        float _1245 = exp2(_1243);
        float _1247 = 0.0 + _1245;
        float _1249 = precise::clamp(_1247, 0.0, 1.0);
        _1075 = _1249;
    }
    float _1251 = _1075;
    float _1253 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1255 = _874 + _1253;
    float _1257 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1259 = _876 + _1257;
    float _1261 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1263 = _878 + _1261;
    float _1265 = _1255 * _1255;
    float _1267 = fma(_1259, _1259, _1265);
    float _1269 = fma(_1263, _1263, _1267);
    float _1271 = rsqrt(_1269);
    float _1273 = sqrt(_1269);
    float _1275 = _1271 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1277 = _1259 * _1275;
    float _1279 = _1263 * _1275;
    float _1281 = _1277 * _1277;
    float _1283 = _1279 * _1279;
    float _1285 = _1281 + _1283;
    float _1287 = sqrt(_1285);
    bool _1289 = _1287 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1291 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1293 = _1287 + _1291;
    float _1295 = _1263;
    float _1297 = _1285;
    float _1299 = _1293;
    float _1301 = _1275;
    if (_1289)
    {
        float _1303 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1295 = _1303;
    }
    float _1305 = _1295;
    if (_1289)
    {
        float _1307 = rsqrt(_1285);
        _1297 = _1307;
    }
    float _1309 = _1297;
    if (_1289)
    {
        float _1311 = _1293 * _1305;
        _1299 = _1311;
    }
    float _1313 = _1299;
    if (_1289)
    {
        float _1315 = _1313 * 0.15915493667125701904296875;
        _417 = _1315;
    }
    float _1317 = _417;
    float _1319 = _1265;
    float _1321 = _1317;
    if (_1289)
    {
        float _1323 = _1317 * 6.283185482025146484375;
        float _1325 = sin(_1323);
        _1319 = _1325;
    }
    float _1327 = _1319;
    float _1329 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1331 = precise::max(0.0, _1329);
    float _1333 = _1271;
    float _1335 = _1331;
    float _1337 = _1329;
    if (_1289)
    {
        float _1339 = _1317 * 6.283185482025146484375;
        float _1341 = cos(_1339);
        _1333 = _1341;
    }
    float _1343 = _1333;
    float _1345 = -_1275;
    float _1347 = -_1331;
    float _1349 = fma(_1255, _1345, _1347);
    float _1351 = _1349;
    if (!_1289)
    {
        _1335 = _1277;
    }
    float _1353 = _1335;
    float _1355 = _1353;
    if (_1289)
    {
        float _1357 = _1349 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1337 = _1357;
    }
    float _1359 = _1337;
    float _1361 = _1327;
    float _1363 = _1359;
    if (_1289)
    {
        float _1365 = fma(_1327, _1359, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1361 = _1365;
    }
    float _1367 = _1361;
    float _1369 = _1367;
    float _1371 = _1343;
    if (_1289)
    {
        float _1373 = _1343 + (-1.0);
        _1363 = _1373;
    }
    float _1375 = _1363;
    float _1377 = _1375;
    if (_1289)
    {
        float _1379 = _1309 * _1367;
        _1301 = _1379;
    }
    float _1381 = _1301;
    if (!_1289)
    {
        _1369 = _1281;
    }
    float _1383 = _1369;
    float _1385 = _1383;
    if (_1289)
    {
        float _1387 = _1375 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1321 = _1387;
    }
    float _1389 = _1321;
    if (_1289)
    {
        float _1391 = _1277 * _1381;
        _1355 = _1391;
    }
    float _1393 = _1355;
    if (!_1289)
    {
        _1377 = _1279;
    }
    float _1395 = _1377;
    float _1397 = _1395;
    if (_1289)
    {
        float _1399 = _1279 * _1381;
        _1397 = _1399;
    }
    float _1401 = _1397;
    if (_1289)
    {
        float _1403 = fma(_1349, _1343, _1389);
        _1351 = _1403;
    }
    float _1405 = _1351;
    if (_1289)
    {
        float _1407 = _1393 * _1393;
        _1385 = _1407;
    }
    float _1409 = _1385;
    if (!_1289)
    {
        _1371 = _1283;
    }
    float _1411 = _1371;
    float _1413 = _1411;
    if (_1289)
    {
        float _1415 = _1401 * _1401;
        _1413 = _1415;
    }
    float _1417 = _1413;
    float _1419 = fma(_1405, _1405, _1409);
    float _1421 = _1419 + _1417;
    float _1423 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1425 = fma(_1273, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1423);
    float _1427 = precise::clamp(_1425, 0.0, 1.0);
    float _1429 = rsqrt(_1421);
    float _1431 = -_1427;
    float _1433 = _1431 + 1.0;
    float _1435 = abs(_1433);
    float _1437 = log2(_1435);
    float _1439 = _1429 * _1393;
    float _1441 = _1429 * _1405;
    float _1443 = _1429 * _1401;
    float _1445 = _1439 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1447 = -_1445;
    float _1449 = fma(_1441, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1447);
    float _1451 = -_1443;
    float _1453 = fma(_1451, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1449);
    float _1455 = _1437 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1457 = fma(_1453, -0.5, 0.5);
    float _1459 = exp2(_1455);
    float _1461 = fma(_1453, 0.5, 0.5);
    float _1463 = fma(_1461, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1465 = sqrt(_1457);
    float _1467 = fma(_1461, _1463, -0.212114393711090087890625);
    float _1469 = _1441 + 1.0;
    float _1471 = fma(_1461, _1467, 1.570728778839111328125);
    float _1473 = -_1441;
    float _1475 = fma(_1459, _1469, _1473);
    float _1477 = fma(_1475, 0.5, 0.5);
    float _1479 = _1465 * 0.636619746685028076171875;
    float _1481 = -_1471;
    float _1483 = fma(_1479, _1481, 1.0);
    float2 _4365 = float2(_1483, _1477);
    float3 _1487 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4365, float2(0.0), isnan(_4365)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4365, float2(0.0), isnan(_4365)), level(0.0)).xyz;
    float _1489 = _1487.x;
    float _1491 = _1487.y;
    float _1493 = _1487.z;
    float _1495 = in.m_63.x;
    float _1497 = in.m_63.y;
    float _1499 = abs(_357);
    float _1501 = log2(_1499);
    float _1503 = _906 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1505 = _1437 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1507 = fma(_914, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1503);
    float _1509 = -_227;
    float _1511 = _1509 + 1.0;
    float _1513 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1515 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1517 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1519 = exp2(_1505);
    float _1521 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1523 = fma(_912, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1507);
    float _1525 = _1515 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1527 = _1501 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1529 = _1521 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1531 = _1513 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1533 = _357 <= 8000.0;
    bool _1535 = isnan(_357);
    bool _1537 = _1533 || _1535;
    bool _1539 = isnan(8000.0);
    bool _1541 = _1537 || _1539;
    float _1543 = float(_1541);
    float _1545 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1547 = fma(_960, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1523);
    bool _1549 = _1495 > 0.5;
    out.m_70.x = _1525;
    out.m_70.y = _1529;
    out.m_70.z = _1531;
    out.m_70.w = _1517;
    bool _1551 = _1497 > 0.5;
    float _1553 = exp2(_1527);
    float _1555 = -_435;
    int _1557 = _1551 ? as_type<int>(_1555) : as_type<int>(_435);
    out.gl_Position.x = _1012;
    out.gl_Position.y = _1010;
    out.gl_Position.z = _1547;
    out.gl_Position.w = _968;
    int _1559 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1561 = _1559 != 0;
    int _1563 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1565 = _1563 != 0;
    float _1567 = -_470;
    int _1569 = _1549 ? as_type<int>(_1567) : as_type<int>(_470);
    float _1571 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1573 = !_1561;
    float _1575 = _1573 ? _435 : as_type<float>(_1557);
    float _1577 = _435 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _1579 = !_1565;
    float _1581 = _1579 ? _470 : as_type<float>(_1569);
    float _1583 = _470 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1585 = _1577 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1587 = _1577 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1589 = _1577 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1591 = -_1519;
    float _1593 = _1591 + 1.0;
    float _1595 = fma(_1583, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1585);
    float _1597 = fma(_1583, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1587);
    float _1599 = fma(_1583, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1589);
    float _1601 = _1581 + 0.5;
    float _1603 = fma(_1553, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1605 = precise::clamp(_1603, 0.0, 1.0);
    float _1607 = _1517;
    float _1609 = _1599;
    float _1611 = _1597;
    float _1613 = _1595;
    if (!_934)
    {
        _1018 = 1.0;
    }
    float _1615 = _1018;
    float _1617 = _1593 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1619 = _1615;
    if (_934)
    {
        bool _1621 = _1048 >= _1026;
        bool _1623 = isnan(_1048);
        bool _1625 = _1621 || _1623;
        bool _1627 = isnan(_1026);
        bool _1629 = _1625 || _1627;
        float _1631 = float(_1629);
        _1619 = _1631;
    }
    float _1633 = _1619;
    float _1635 = fma(_1605, -2.0, 3.0);
    float _1637 = _1605 * _1605;
    float _1639 = -_1575;
    float _1641 = _1639 + 0.5;
    float _1643 = _1601 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1645 = _1633 * _1251;
    float _1647 = _1637 * _1635;
    float _1649 = _1617 * _1050;
    float _1651 = _1641 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1653 = _1643 * _1545;
    float _1655 = -_1647;
    float _1657 = _1655 + 1.0;
    float _1659 = _1547 + _968;
    float _1661 = -_1617;
    float _1663 = _1661 + 1.0;
    float _1665 = fma(_1657, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1647);
    float _1667 = _1061 * _1649;
    float _1669 = _1651 * _1571;
    float _1671 = _1061 * _1663;
    float _1673 = _1543 * _1665;
    float _1675 = _1659 * 0.5;
    float _1677 = _1597 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _1679 = _1599 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _1681 = _1673 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_72.x = _1653;
    out.m_72.y = _1669;
    bool _1683 = _1273 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1685 = isnan(_1273);
    bool _1687 = _1683 || _1685;
    bool _1689 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1691 = _1687 || _1689;
    float _1693 = _1511 * _1681;
    float _1695 = precise::clamp(_1693, 0.0, 1.0);
    out.m_74.z = _1675;
    out.m_74.w = _968;
    float _1697 = -_1695;
    float _1699 = fma(_1697, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1701 = -_1645;
    float _1703 = fma(_1701, _1699, 1.0);
    float _1705 = precise::clamp(_1703, 0.0, 1.0);
    if (!_1691)
    {
        _1607 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1707 = _1607;
    float _1709 = _1705 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1711 = _1595 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _1713 = _1707;
    float _1715 = _1707;
    if (!_1691)
    {
        _1609 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1717 = _1609;
    float _1719 = _1717;
    float _1721 = _1717;
    if (!_1691)
    {
        _1611 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1723 = _1611;
    out.m_76.x = _1709;
    float _1725 = _1723;
    float _1727 = _1723;
    if (!_1691)
    {
        _1613 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1729 = _1613;
    out.m_78.x = _1711;
    out.m_78.y = _1677;
    out.m_78.z = _1679;
    float _1731 = _1493 * _1649;
    float _1733 = fma(_1489, _1667, _1055);
    float _1735 = fma(_1491, _1667, _1057);
    float _1737 = _1135 * _1189;
    float _1739 = fma(_1061, _1731, _1059);
    float _1741 = _1737;
    float _1743 = _1729;
    float _1745 = _1729;
    if (!_1691)
    {
        _1085 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1747 = _1085;
    float _1749 = _1737 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1751 = _1747;
    float _1753 = _1747;
    if (!_1691)
    {
        _1741 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1755 = _1741;
    out.m_80.x = _1733;
    out.m_80.y = _1735;
    out.m_80.z = _1739;
    out.m_80.w = _1671;
    bool _1757 = !_1691;
    float _1759 = _1755;
    float _1761 = _1755;
    if (!_1757)
    {
        bool _1763 = _1273 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1765 = isnan(_1273);
        bool _1767 = _1763 || _1765;
        bool _1769 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1771 = _1767 || _1769;
        if (!_1771)
        {
            float _1773 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1775 = _1273 + _1773;
            float _1777 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1779 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1777;
            float _1781 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1783 = _1781 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1785 = 1.0 / _1779;
            float _1787 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1789 = _1787 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1791 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1793 = _1791 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1795 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1797 = _1795 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1799 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1801 = _1799 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1803 = _1775 * _1785;
            float _1805 = precise::clamp(_1803, 0.0, 1.0);
            float _1807 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1809 = _1807 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1811 = fma(_1805, _1783, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1813 = fma(_1805, _1809, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1815 = fma(_1805, _1789, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1817 = fma(_1805, _1793, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1819 = fma(_1805, _1797, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1821 = fma(_1805, _1801, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1715 = _1815;
            _1745 = _1819;
            _1753 = _1811;
            _1727 = _1817;
            _1721 = _1813;
            _1761 = _1821;
            _1823 = true;
        }
        else
        {
            bool _1825 = _1273 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1827 = isnan(_1273);
            bool _1829 = _1825 || _1827;
            bool _1831 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1833 = _1829 || _1831;
            if (!_1833)
            {
                _1751 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1835 = _1751;
            _1753 = _1835;
            if (!_1833)
            {
                _1713 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1837 = _1713;
            _1715 = _1837;
            if (!_1833)
            {
                _1719 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1839 = _1719;
            _1721 = _1839;
            if (!_1833)
            {
                _1725 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1841 = _1725;
            _1727 = _1841;
            if (!_1833)
            {
                _1743 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1843 = _1743;
            _1745 = _1843;
            if (!_1833)
            {
                _1759 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1845 = _1759;
            bool _1847 = !_1833;
            _1761 = _1845;
            if (!_1847)
            {
                bool _1849 = _1273 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1851 = isnan(_1273);
                bool _1853 = _1849 || _1851;
                bool _1855 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1857 = _1853 || _1855;
                if (!_1857)
                {
                    float _1859 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1861 = _1273 + _1859;
                    float _1863 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1865 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1863;
                    float _1867 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1869 = _1867 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1871 = 1.0 / _1865;
                    float _1873 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1875 = _1873 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1877 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1879 = _1877 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1881 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1883 = _1881 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1885 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1887 = _1885 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1889 = _1861 * _1871;
                    float _1891 = precise::clamp(_1889, 0.0, 1.0);
                    float _1893 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1895 = _1893 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1897 = fma(_1891, _1869, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1899 = fma(_1891, _1895, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1901 = fma(_1891, _1875, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1903 = fma(_1891, _1879, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1905 = fma(_1891, _1883, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1907 = fma(_1891, _1887, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1715 = _1901;
                    _1745 = _1905;
                    _1753 = _1897;
                    _1727 = _1903;
                    _1721 = _1899;
                    _1761 = _1907;
                    _1823 = true;
                }
                else
                {
                    _1715 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1745 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1753 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1727 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1721 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1761 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1823 = false;
    float _1909 = _1715;
    float _1911 = _1745;
    float _1913 = _1753;
    float _1915 = _1727;
    float _1917 = _1721;
    float _1919 = _1761;
    float _1921 = fma(_1677, -0.5, 0.5);
    float _1923 = precise::clamp(_1921, 0.0, 1.0);
    float _1925 = -_1909;
    float _1927 = _1925 + _1911;
    float _1929 = _1749 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1931 = -_1913;
    float _1933 = _1931 + _1915;
    float _1935 = fma(_1923, _1927, _1909);
    out.m_82.x = 0.0;
    float _1937 = -_1917;
    float _1939 = _1937 + _1919;
    float _1941 = fma(_1923, _1933, _1913);
    float _1943 = _1935 * 0.586610972881317138671875;
    out.m_59.x = _1929;
    bool _1945 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1947 = fma(_1923, _1939, _1917);
    float _1949 = fma(_1941, 0.298911988735198974609375, _1943);
    bool _1951 = _1135 > 0.0;
    bool _1953 = isnan(_1135);
    bool _1955 = _1951 || _1953;
    bool _1957 = isnan(0.0);
    bool _1959 = _1955 || _1957;
    float _1961 = fma(_1947, 0.114477999508380889892578125, _1949);
    bool _1963 = _1189 <= 0.0;
    bool _1965 = !_1959;
    bool _1967 = _1963 || _1965;
    float _1969 = -_1961;
    float _1971 = _1941 + _1969;
    float _1973 = -_1961;
    float _1975 = _1935 + _1973;
    float _1977 = -_1961;
    float _1979 = _1947 + _1977;
    float _1981 = fma(_1971, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1961);
    float _1983 = fma(_1975, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1961);
    float _1985 = fma(_1979, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1961);
    bool _1987 = !_1945;
    if (!_1987)
    {
        float _1989 = -_874;
        float _1991 = _1989 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _1993 = -_876;
        float _1995 = _1993 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _1997 = -_878;
        float _1999 = _1997 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2001 = _1991 * _1991;
        float _2003 = fma(_1995, _1995, _2001);
        float _2005 = fma(_1999, _1999, _2003);
        float _2007 = sqrt(_2005);
        float _2009 = rsqrt(_2005);
        float _2011 = -_2007;
        float _2013 = _2011 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2015 = _2013 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2017 = precise::clamp(_2015, 0.0, 1.0);
        float _2019 = _1995 * _2009;
        float _2021 = _1991 * _2009;
        float _2023 = abs(_2017);
        float _2025 = log2(_2023);
        float _2027 = _1999 * _2009;
        float _2029 = _2019 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2031 = _1677 * _2021;
        float _2033 = -_2021;
        float _2035 = -_2029;
        float _2037 = fma(_2033, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2035);
        float _2039 = fma(_1711, _2019, _2031);
        float _2041 = -_2027;
        float _2043 = fma(_2041, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2037);
        float _2045 = fma(_1679, _2027, _2039);
        float _2047 = precise::clamp(_2045, 0.0, 1.0);
        float _2049 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2051 = _2043 + _2049;
        float _2053 = _2025 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2055 = _2051 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2057 = precise::clamp(_2055, 0.0, 1.0);
        float _2059 = exp2(_2053);
        float _2061 = _2059 * _2057;
        float _2063 = _2047 * _2061;
        float _2065 = _2063 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2067 = _2063 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2069 = _2063 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_82.x = _2065;
        out.m_82.y = _2067;
        out.m_82.z = _2069;
    }
    out.m_84.x = _1981;
    out.m_84.y = _1983;
    out.m_84.z = _1985;
    if (!_1967)
    {
        return out;
    }
    out.m_59.x = 0.0;
    float _2071 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2071;
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
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1823 = false;
    bool _179 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _98 = in.m_56.w;
    float _100 = trunc(_98);
    int _103 = int(_100);
    bool _107 = _103 >= 1;
    float _109 = 0.0;
    if (!_107)
    {
        _109 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _111 = _109;
    float _113 = _111;
    if (!_107)
    {
        out.m_59.x = 0.0;
    }
    int _115 = 0;
    if (!_107)
    {
        float _117 = _111 * 5.0;
        _115 = as_type<int>(_117);
    }
    int _119 = _115;
    if (!_107)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2127 = as_type<float>(_119);
        out.gl_Position.z = _2127;
    }
    if (!_107)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _121 = in.m_61.w;
    bool _123 = _121 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _125 = isnan(_121);
    bool _127 = _123 || _125;
    bool _129 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _131 = _127 || _129;
    float _133 = -_121;
    float _135 = _133 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_131)
    {
        float _137 = float(_103);
        _113 = _137;
    }
    float _139 = _113;
    bool _141 = _135 >= _139;
    bool _143 = !_131;
    bool _145 = _141 || _143;
    float _147 = _139;
    if (_145)
    {
        _147 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _149 = _147;
    if (_145)
    {
        out.m_59.x = 0.0;
    }
    int _151 = 0;
    if (_145)
    {
        float _153 = _149 * 5.0;
        _151 = as_type<int>(_153);
    }
    int _155 = _151;
    if (_145)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2196 = as_type<float>(_155);
        out.gl_Position.z = _2196;
    }
    if (_145)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _157 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _159 = !_157;
    float _177;
    if (!_159)
    {
        float _161 = in.m_63.x;
        float _163 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _165 = _161 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _167 = fma(_165, (*spvDescriptorSet0.vp_c9)._m0[12].x, _135);
        float _169 = _167 * _163;
        float _171 = floor(_169);
        float _173 = -_171;
        float _175 = _169 + _173;
        _177 = _175;
        _179 = true;
    }
    else
    {
        float _181 = float(_103);
        float _183 = 1.0 / _181;
        float _185 = _135 * _183;
        _177 = _185;
    }
    _179 = false;
    float _187 = _177;
    float _189 = in.m_56.x;
    float _191 = in.m_56.y;
    float _193 = in.m_56.z;
    float _195 = _191 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _197 = _191 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _199 = fma(_189, (*spvDescriptorSet0.vp_c10)._m0[4].x, _195);
    float _201 = fma(_189, (*spvDescriptorSet0.vp_c10)._m0[6].x, _197);
    float _203 = fma(_193, (*spvDescriptorSet0.vp_c10)._m0[4].z, _199);
    float _205 = fma(_193, (*spvDescriptorSet0.vp_c10)._m0[6].z, _201);
    float _207 = _203 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _209 = _205 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _211 = fma(_207, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _213 = fma(_209, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _215 = floor(_211);
    float _217 = floor(_213);
    float _219 = -_215;
    float _221 = _211 + _219;
    float _223 = -_217;
    float _225 = _213 + _223;
    float2 _2323 = float2(_221, _225);
    float _227 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_2323, float2(0.0), isnan(_2323)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_2323, float2(0.0), isnan(_2323)), level(0.0)).x;
    float _229 = _191 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _231 = as_type<float>(int(gl_VertexIndex));
    float _233 = fma(_189, (*spvDescriptorSet0.vp_c10)._m0[5].x, _229);
    float _235 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _237 = fma(_193, (*spvDescriptorSet0.vp_c10)._m0[5].z, _233);
    float _239 = _237 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _241 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _243 = _187 + _241;
    float _245 = _239 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _247 = _239 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _249 = fma(_207, (*spvDescriptorSet0.vp_c8)._m0[11].x, _245);
    float _251 = fma(_207, (*spvDescriptorSet0.vp_c8)._m0[10].x, _247);
    float _253 = fma(_209, (*spvDescriptorSet0.vp_c8)._m0[11].z, _249);
    float _255 = fma(_209, (*spvDescriptorSet0.vp_c8)._m0[10].z, _251);
    float _257 = _253 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _259 = _255 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _261 = 1.0 / _257;
    float _263 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _265 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _263;
    float _267 = _259 + _257;
    float _269 = _239 + _235;
    float _271 = 1.0 / _265;
    float _273 = _269 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    bool _275 = _187 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _277 = isnan(_187);
    bool _279 = _275 || _277;
    bool _281 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _283 = _279 || _281;
    float _285 = float(_283);
    float _287 = fma(_207, (*spvDescriptorSet0.vp_c15)._m0[126].x, _273);
    float _289 = _267 * _261;
    float _291 = _289 * 0.5;
    float _293 = -_285;
    float _295 = _293 + 1.0;
    float _297 = fma(_209, (*spvDescriptorSet0.vp_c15)._m0[126].z, _287);
    float _299 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _301 = fma(_291, (*spvDescriptorSet0.vp_c8)._m0[30].w, _299);
    bool _303 = _187 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _305 = isnan(_187);
    bool _307 = _303 || _305;
    bool _309 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _311 = _307 || _309;
    float _313 = float(_311);
    float _315 = _297 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _317 = _243 * _271;
    float _319 = _269 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _321 = 1.0 / _301;
    float _323 = _313 * _295;
    float _325 = -_313;
    float _327 = _325 + 1.0;
    float _329 = fma(_207, (*spvDescriptorSet0.vp_c15)._m0[127].x, _319);
    float _331 = in.m_68.x;
    float _333 = in.m_68.y;
    float _335 = fma(_209, (*spvDescriptorSet0.vp_c15)._m0[127].z, _329);
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _339 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _337;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _343 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _341;
    float _345 = trunc(_315);
    int _347 = int(_345);
    float _349 = _335 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _351 = fma(_339, _317, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _353 = fma(_343, _317, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _355 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _357 = _321 * _355;
    float _359 = _351 * _323;
    float _361 = trunc(_349);
    int _363 = int(_361);
    float _365 = _353 * _323;
    bool _367 = _357 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _369 = fma(_327, (*spvDescriptorSet0.vp_c9)._m0[143].x, _359);
    bool _371 = _357 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _373 = fma(_327, (*spvDescriptorSet0.vp_c9)._m0[143].y, _365);
    float _375 = fma(_285, (*spvDescriptorSet0.vp_c9)._m0[144].x, _369);
    int _377 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _379 = _347 + _377;
    int _381 = _379 + 1;
    float _383 = fma(_285, (*spvDescriptorSet0.vp_c9)._m0[144].y, _373);
    bool _385 = !_367;
    int _387 = _385 ? 0 : 1;
    float _389 = _375 * _331;
    int _391 = as_type<int>(_231) & 1;
    bool _393 = _391 != 0;
    int _395 = as_type<int>(_231) & 2;
    bool _397 = _395 != 0;
    float _399 = _383 * _333;
    int _401 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _403 = _363 + _401;
    int _405 = _403 + 1;
    float _407 = _389 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _409 = 2;
    int _411 = as_type<int>(_231);
    int _413 = as_type<int>(_317);
    float _415 = _349;
    float _417 = _209;
    if (!_367)
    {
        _409 = 1;
    }
    int _419 = _409;
    float _421 = _399 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _423 = _381 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _425 = _381 | _405;
    float _427 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    int _429 = _419;
    if (!_371)
    {
        _429 = _387;
    }
    int _431 = _429;
    bool _433 = !_397;
    float _435 = _433 ? (-0.5) : 0.5;
    bool _437 = _425 < 0;
    bool _439 = _437 || _423;
    int _441 = _431 << 6;
    float _443 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _435);
    bool _445 = _405 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _447 = _445 || _439;
    int _449 = _441 + 96;
    uint _452 = uint(int(uint(_449) >> uint(2)));
    uint _454 = uint(int(uint(int(_452)) >> uint(2)));
    int _456 = int(_452) & 3;
    float _458 = (*spvDescriptorSet0.vp_c15)._m0[int(_454)][_456];
    int _460 = int(_452) + 1;
    uint _462 = uint(int(uint(_460) >> uint(2)));
    int _464 = _460 & 3;
    float _466 = (*spvDescriptorSet0.vp_c15)._m0[int(_462)][_464];
    bool _468 = !_393;
    float _470 = _468 ? (-0.5) : 0.5;
    float _472 = _421 * _443;
    bool _474 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _476 = isnan(0.5);
    bool _478 = _474 || _476;
    bool _480 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _482 = _478 || _480;
    float _484 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _470);
    float _486 = _472 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _488 = _441 + 104;
    uint _490 = uint(int(uint(_488) >> uint(2)));
    uint _492 = uint(int(uint(int(_490)) >> uint(2)));
    int _494 = int(_490) & 3;
    float _496 = (*spvDescriptorSet0.vp_c15)._m0[int(_492)][_494];
    int _498 = int(_490) + 1;
    uint _500 = uint(int(uint(_498) >> uint(2)));
    int _502 = _498 & 3;
    float _504 = (*spvDescriptorSet0.vp_c15)._m0[int(_500)][_502];
    float _506 = _407 * _484;
    if (!_447)
    {
        int _508 = _405 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _510 = _508 + _381;
        _411 = _510;
    }
    int _512 = _411;
    float _514 = _472 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _516 = _472 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _518 = fma(_506, (*spvDescriptorSet0.vp_c8)._m0[26].x, _486);
    int _520 = _441 + 64;
    uint _522 = uint(int(uint(_520) >> uint(2)));
    uint _524 = uint(int(uint(int(_522)) >> uint(2)));
    int _526 = int(_522) & 3;
    float _528 = (*spvDescriptorSet0.vp_c15)._m0[int(_524)][_526];
    int _530 = int(_522) + 1;
    uint _532 = uint(int(uint(_530) >> uint(2)));
    int _534 = _530 & 3;
    float _536 = (*spvDescriptorSet0.vp_c15)._m0[int(_532)][_534];
    float _538 = fma(_506, (*spvDescriptorSet0.vp_c8)._m0[24].x, _514);
    int _540 = as_type<int>(_514);
    if (!_447)
    {
        int _542 = _512 << 2;
        _413 = _542;
    }
    int _544 = _413;
    float _546 = fma(_427, (*spvDescriptorSet0.vp_c8)._m0[26].z, _518);
    int _548 = _544;
    if (!_447)
    {
        uint _550 = uint(int(uint(_512) >> uint(2)));
        _540 = int(_550);
    }
    int _552 = _540;
    float _554 = fma(_427, (*spvDescriptorSet0.vp_c8)._m0[24].z, _538);
    if (!_447)
    {
        int _556 = 12 & _544;
        _548 = _556;
    }
    int _558 = _548;
    float _560 = _546 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    int _562 = _441 + 48;
    uint _564 = uint(int(uint(_562) >> uint(2)));
    uint _566 = uint(int(uint(int(_564)) >> uint(2)));
    int _568 = int(_564) & 3;
    float _570 = (*spvDescriptorSet0.vp_c15)._m0[int(_566)][_568];
    int _572 = int(_564) + 1;
    uint _574 = uint(int(uint(_572) >> uint(2)));
    int _576 = _572 & 3;
    float _578 = (*spvDescriptorSet0.vp_c15)._m0[int(_574)][_576];
    float _580 = _554 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _582 = 0.0;
    if (!_447)
    {
        int _584 = _552 << 4;
        int _586 = _584 + _558;
        _582 = as_type<float>(_586);
    }
    float _588 = _582;
    float _590 = _209 + _560;
    float _592 = fma(_506, (*spvDescriptorSet0.vp_c8)._m0[25].x, _516);
    float _594 = _207 + _580;
    float _596 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _598 = _590 + _596;
    int _600 = _441 + 56;
    uint _602 = uint(int(uint(_600) >> uint(2)));
    uint _604 = uint(int(uint(int(_602)) >> uint(2)));
    int _606 = int(_602) & 3;
    float _608 = (*spvDescriptorSet0.vp_c15)._m0[int(_604)][_606];
    int _610 = int(_602) + 1;
    uint _612 = uint(int(uint(_610) >> uint(2)));
    int _614 = _610 & 3;
    float _616 = (*spvDescriptorSet0.vp_c15)._m0[int(_612)][_614];
    float _618 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _620 = _594 + _618;
    float _622 = fma(_427, (*spvDescriptorSet0.vp_c8)._m0[25].z, _592);
    float _624 = _598 * _598;
    float _626 = _622 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _628 = fma(_620, _620, _624);
    int _630 = _441 + 72;
    uint _632 = uint(int(uint(_630) >> uint(2)));
    uint _634 = uint(int(uint(int(_632)) >> uint(2)));
    int _636 = int(_632) & 3;
    float _638 = (*spvDescriptorSet0.vp_c15)._m0[int(_634)][_636];
    int _640 = int(_632) + 1;
    uint _642 = uint(int(uint(_640) >> uint(2)));
    int _644 = _640 & 3;
    float _646 = (*spvDescriptorSet0.vp_c15)._m0[int(_642)][_644];
    float _648 = _239 + _626;
    float _650 = sqrt(_628);
    int _652 = _441 + 80;
    uint _654 = uint(int(uint(_652) >> uint(2)));
    uint _656 = uint(int(uint(int(_654)) >> uint(2)));
    int _658 = int(_654) & 3;
    float _660 = (*spvDescriptorSet0.vp_c15)._m0[int(_656)][_658];
    int _662 = int(_654) + 1;
    uint _664 = uint(int(uint(_662) >> uint(2)));
    int _666 = _662 & 3;
    float _668 = (*spvDescriptorSet0.vp_c15)._m0[int(_664)][_666];
    float _670 = _269 * _466;
    float _672 = _466;
    float _674 = _594;
    float _676 = _590;
    float _678 = _628;
    float _680 = _598;
    float _682 = _620;
    if (!_447)
    {
        float _684 = floor(_315);
        _672 = _684;
    }
    float _686 = _672;
    float _688 = fma(_207, _458, _670);
    int _690 = _441 + 88;
    uint _692 = uint(int(uint(_690) >> uint(2)));
    uint _694 = uint(int(uint(int(_692)) >> uint(2)));
    int _696 = int(_692) & 3;
    float _698 = (*spvDescriptorSet0.vp_c15)._m0[int(_694)][_696];
    int _700 = int(_692) + 1;
    uint _702 = uint(int(uint(_700) >> uint(2)));
    int _704 = _700 & 3;
    float _706 = (*spvDescriptorSet0.vp_c15)._m0[int(_702)][_704];
    float _708 = fma(_209, _496, _688);
    bool _710 = _650 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _712 = _688;
    if (!_447)
    {
        float _714 = floor(_349);
        _712 = _714;
    }
    float _716 = _712;
    float _718 = _708 + _504;
    float _720 = _588;
    if (!_447)
    {
        int _722 = as_type<int>(_588) + 400;
        uint _724 = uint(int(uint(_722) >> uint(2)));
        uint _726 = uint(int(uint(int(_724)) >> uint(2)));
        int _728 = int(_724) & 3;
        float _730 = (*spvDescriptorSet0.vp_c15)._m0[int(_726)][_728];
        _720 = _730;
    }
    float _732 = _720;
    float _734 = _269 * _536;
    float _736 = fma(_207, _528, _734);
    float _738 = 1.0 / _718;
    float _740 = _269 * _578;
    float _742 = fma(_207, _570, _740);
    float _744 = fma(_209, _608, _742);
    float _746 = _744 + _616;
    float _748 = _744;
    float _750 = _528;
    if (!_710)
    {
        _748 = _648;
    }
    float _752 = _748;
    float _754 = fma(_209, _638, _736);
    float _756 = _754 + _646;
    bool _758 = !_710;
    float _760 = _752;
    if (!_758)
    {
        float _762 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _764 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _766 = _650 + _764;
        float _768 = rsqrt(_628);
        float _770 = _766 * _762;
        float _772 = _648 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _774 = _770 * 0.15915493667125701904296875;
        float _776 = _774 * 6.283185482025146484375;
        float _778 = cos(_776);
        float _780 = _774 * 6.283185482025146484375;
        float _782 = sin(_780);
        float _784 = _778 + (-1.0);
        float _786 = fma(_782, _772, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _788 = _784 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _790 = _768 * _786;
        float _792 = fma(_648, _778, _788);
        float _794 = fma(_620, _790, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _796 = fma(_598, _790, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _674 = _794;
        _760 = _792;
        _676 = _796;
        _678 = _768;
        _750 = _784;
    }
    float _798 = _674;
    float _800 = _760;
    float _802 = _676;
    float _804 = _678;
    float _806 = _750;
    float _808 = _804;
    float _810 = _806;
    if (_482)
    {
        _680 = _798;
    }
    float _812 = _680;
    float _814 = _812;
    if (_482)
    {
        _682 = _800;
    }
    float _816 = _682;
    float _818 = _816;
    if (_482)
    {
        _808 = _802;
    }
    float _820 = _808;
    float _822 = _820;
    if (!_482)
    {
        float _824 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _826 = _239 + _824;
        float _828 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _830 = _207 + _828;
        float _832 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _834 = -_239;
        float _836 = _834 + _800;
        float _838 = _826 * _826;
        float _840 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _842 = _209 + _840;
        float _844 = -_209;
        float _846 = _844 + _802;
        float _848 = fma(_830, _830, _838);
        float _850 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _852 = fma(_842, _842, _848);
        float _854 = sqrt(_852);
        float _856 = _832 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _858 = precise::min(_854, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _860 = _858 * _850;
        float _862 = -_207;
        float _864 = _862 + _798;
        float _866 = _856 * _860;
        float _868 = fma(_836, _866, _239);
        float _870 = fma(_864, _866, _207);
        float _872 = fma(_846, _866, _209);
        _818 = _868;
        _814 = _870;
        _822 = _872;
    }
    float _874 = _818;
    float _876 = _814;
    float _878 = _822;
    float _880 = _756 * _738;
    float _882 = _874 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _884 = _874 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _886 = _874 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _888 = _746 * _738;
    float _890 = fma(_876, (*spvDescriptorSet0.vp_c8)._m0[1].x, _882);
    float _892 = fma(_876, (*spvDescriptorSet0.vp_c8)._m0[2].x, _884);
    float _894 = fma(_876, (*spvDescriptorSet0.vp_c8)._m0[0].x, _886);
    float _896 = _874 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _898 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[1].z, _890);
    bool _900 = _888 >= 0.0;
    float _902 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[2].z, _892);
    float _904 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[0].z, _894);
    float _906 = _898 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    bool _908 = _888 <= 1.0;
    bool _910 = _908 && _900;
    float _912 = _902 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _914 = _904 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _916 = fma(_876, (*spvDescriptorSet0.vp_c8)._m0[3].x, _896);
    float _918 = _906 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    bool _920 = _880 >= 0.0;
    bool _922 = _920 && _910;
    float _924 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _926 = _912 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _928 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[3].z, _916);
    float _930 = fma(_914, (*spvDescriptorSet0.vp_c8)._m0[7].x, _918);
    bool _932 = _880 <= 1.0;
    bool _934 = _932 && _922;
    float _936 = _928;
    if (!_447)
    {
        float _938 = rint(_732);
        float _940 = precise::max(_938, 0.0);
        uint _942 = uint(_940);
        uint _944 = clamp(_942, 0u, 65535u);
        _810 = as_type<float>(_944);
    }
    float _946 = _810;
    float _948 = -_926;
    float _950 = fma(_948, _924, 1.0);
    float _952 = fma(_912, (*spvDescriptorSet0.vp_c8)._m0[7].z, _930);
    float _954 = _906 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _956 = fma(_914, (*spvDescriptorSet0.vp_c8)._m0[5].x, _954);
    float _958 = log2(_950);
    float _960 = _928 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    if (!_447)
    {
        float _962 = -_686;
        float _964 = _315 + _962;
        _936 = _964;
    }
    float _966 = _936;
    float _968 = fma(_960, (*spvDescriptorSet0.vp_c8)._m0[7].w, _952);
    float _970 = _269 * _668;
    float _972 = _906 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _974 = 1.0 / _968;
    float _976 = fma(_207, _660, _970);
    float _978 = _970;
    if (_934)
    {
        float _980 = float(_431);
        _978 = _980;
    }
    float _982 = _978;
    float _984 = fma(_914, (*spvDescriptorSet0.vp_c8)._m0[4].x, _972);
    float _986 = fma(_209, _698, _976);
    float _988 = fma(_912, (*spvDescriptorSet0.vp_c8)._m0[5].z, _956);
    float _990 = fma(_912, (*spvDescriptorSet0.vp_c8)._m0[4].z, _984);
    float _992 = _982;
    float _994 = _984;
    float _996 = _986;
    if (_934)
    {
        float _998 = rint(_982);
        float _1000 = precise::max(_998, 0.0);
        uint _1002 = uint(_1000);
        uint _1004 = clamp(_1002, 0u, 65535u);
        _992 = as_type<float>(_1004);
    }
    float _1006 = _992;
    float _1008 = _986 + _706;
    float _1010 = fma(_960, (*spvDescriptorSet0.vp_c8)._m0[5].w, _988);
    float _1012 = fma(_960, (*spvDescriptorSet0.vp_c8)._m0[4].w, _990);
    float _1014 = _958 * 0.693147182464599609375;
    float _1016 = _1014;
    float _1018 = _1012;
    if (!_447)
    {
        float _1020 = -_716;
        float _1022 = _349 + _1020;
        _994 = _1022;
    }
    float _1024 = _994;
    float _1026 = _1008 * _738;
    float _1028 = _1012 * _974;
    float _1030 = _1010 * _974;
    float _1032 = _1014 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1034 = fma(_1028, 0.5, 0.5);
    float _1036 = fma(_1030, -0.5, 0.5);
    float _1038 = _946;
    if (!_447)
    {
        float3 _3689 = float3(_966, _1024, float(as_type<int>(_946)));
        float3 _3693 = select(_3689, float3(0.0), isnan(_3689));
        float _1040 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _3693.xy, uint(rint(_3693.z)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _3693.xy, uint(rint(_3693.z)), level(0.0)).x;
        _1038 = _1040;
    }
    float _1042 = _1038;
    float _1044 = as_type<float>(_431);
    if (_934)
    {
        float3 _3709 = float3(_888, _880, float(as_type<int>(_1006)));
        float3 _3711 = select(_3709, float3(0.0), isnan(_3709));
        float _1046 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _3711.xy, uint(rint(_3711.z)), _1026, level(0.0));
        _1044 = _1046;
    }
    float _1048 = _1044;
    float3 _3721 = float3(_1034, _1036, _1032);
    float _1050 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3721, float3(0.0), isnan(_3721)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3721, float3(0.0), isnan(_3721)), level(0.0)).x;
    float3 _3730 = float3(_1034, _1036, _1032);
    float4 _1053 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3730, float3(0.0), isnan(_3730)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3730, float3(0.0), isnan(_3730)), level(0.0)).xyzw;
    float _1055 = _1053.x;
    float _1057 = _1053.y;
    float _1059 = _1053.z;
    float _1061 = _1053.w;
    bool _1063 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1065 = isnan(0.5);
    bool _1067 = _1063 || _1065;
    bool _1069 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1071 = _1067 || _1069;
    if (_447)
    {
        _415 = 1.0;
    }
    float _1073 = _415;
    float _1075 = _1073;
    if (_1071)
    {
        _1016 = 1.0;
    }
    float _1077 = _1016;
    float _1079 = _1077;
    if (_1071)
    {
        _996 = 1.0;
    }
    float _1081 = _996;
    float _1083 = _1081;
    float _1085 = _1055;
    if (!_1071)
    {
        float _1087 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1089 = _1087 * 0.15915493667125701904296875;
        float _1091 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1093 = _1089 * 6.283185482025146484375;
        float _1095 = cos(_1093);
        float _1097 = _1091 * 0.15915493667125701904296875;
        float _1099 = _1089 * 6.283185482025146484375;
        float _1101 = sin(_1099);
        float _1103 = 1.0 / _1095;
        float _1105 = _1097 * 6.283185482025146484375;
        float _1107 = cos(_1105);
        float _1109 = _1101 * _1103;
        float _1111 = _1097 * 6.283185482025146484375;
        float _1113 = sin(_1111);
        float _1115 = _1107 * _1109;
        float _1117 = 1.0 / _1115;
        float _1119 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1121 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1119;
        float _1123 = 1.0 / _1121;
        float _1125 = _1113 * _1117;
        float _1127 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1129 = fma(_357, _1125, _1127);
        float _1131 = _1129 * _1123;
        float _1133 = precise::clamp(_1131, 0.0, 1.0);
        _1083 = _1133;
    }
    float _1135 = _1083;
    if (!_1071)
    {
        float _1137 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1139 = _1137 * 0.15915493667125701904296875;
        float _1141 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1143 = _1139 * 6.283185482025146484375;
        float _1145 = cos(_1143);
        float _1147 = _1141 * 0.15915493667125701904296875;
        float _1149 = _1139 * 6.283185482025146484375;
        float _1151 = sin(_1149);
        float _1153 = 1.0 / _1145;
        float _1155 = _1147 * 6.283185482025146484375;
        float _1157 = cos(_1155);
        float _1159 = _1151 * _1153;
        float _1161 = _1147 * 6.283185482025146484375;
        float _1163 = sin(_1161);
        float _1165 = _1157 * _1159;
        float _1167 = 1.0 / _1165;
        float _1169 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1171 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1169;
        float _1173 = 1.0 / _1171;
        float _1175 = _1163 * _1167;
        float _1177 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1179 = fma(_357, _1175, _1177);
        float _1181 = _1179 * _1173;
        float _1183 = precise::clamp(_1181, 0.0, 1.0);
        float _1185 = -_1183;
        float _1187 = _1185 + 1.0;
        _1079 = _1187;
    }
    float _1189 = _1079;
    if (!_447)
    {
        int _1191 = _512 << 4;
        int _1193 = _1191 + 2048;
        uint _1195 = uint(int(uint(_1193) >> uint(2)));
        uint _1197 = uint(int(uint(int(_1195)) >> uint(2)));
        int _1199 = int(_1195) & 3;
        float _1201 = (*spvDescriptorSet0.vp_c15)._m0[int(_1197)][_1199];
        int _1203 = int(_1195) + 1;
        uint _1205 = uint(int(uint(_1203) >> uint(2)));
        int _1207 = _1203 & 3;
        float _1209 = (*spvDescriptorSet0.vp_c15)._m0[int(_1205)][_1207];
        int _1211 = _1193 + 8;
        uint _1213 = uint(int(uint(_1211) >> uint(2)));
        uint _1215 = uint(int(uint(int(_1213)) >> uint(2)));
        int _1217 = int(_1213) & 3;
        float _1219 = (*spvDescriptorSet0.vp_c15)._m0[int(_1215)][_1217];
        int _1221 = int(_1213) + 1;
        uint _1223 = uint(int(uint(_1221) >> uint(2)));
        int _1225 = _1221 & 3;
        float _1227 = (*spvDescriptorSet0.vp_c15)._m0[int(_1223)][_1225];
        float _1229 = _269 * _1209;
        float _1231 = fma(_207, _1201, _1229);
        float _1233 = fma(_209, _1219, _1231);
        float _1235 = _1233 + _1227;
        float _1237 = precise::clamp(_1235, 0.0, 1.0);
        float _1239 = -_1237;
        float _1241 = _1239 + _1042;
        float _1243 = fma(_1241, 500.0, 1.5);
        float _1245 = exp2(_1243);
        float _1247 = 0.0 + _1245;
        float _1249 = precise::clamp(_1247, 0.0, 1.0);
        _1075 = _1249;
    }
    float _1251 = _1075;
    float _1253 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1255 = _874 + _1253;
    float _1257 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1259 = _876 + _1257;
    float _1261 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1263 = _878 + _1261;
    float _1265 = _1255 * _1255;
    float _1267 = fma(_1259, _1259, _1265);
    float _1269 = fma(_1263, _1263, _1267);
    float _1271 = rsqrt(_1269);
    float _1273 = sqrt(_1269);
    float _1275 = _1271 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1277 = _1259 * _1275;
    float _1279 = _1263 * _1275;
    float _1281 = _1277 * _1277;
    float _1283 = _1279 * _1279;
    float _1285 = _1281 + _1283;
    float _1287 = sqrt(_1285);
    bool _1289 = _1287 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1291 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1293 = _1287 + _1291;
    float _1295 = _1263;
    float _1297 = _1285;
    float _1299 = _1293;
    float _1301 = _1275;
    if (_1289)
    {
        float _1303 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1295 = _1303;
    }
    float _1305 = _1295;
    if (_1289)
    {
        float _1307 = rsqrt(_1285);
        _1297 = _1307;
    }
    float _1309 = _1297;
    if (_1289)
    {
        float _1311 = _1293 * _1305;
        _1299 = _1311;
    }
    float _1313 = _1299;
    if (_1289)
    {
        float _1315 = _1313 * 0.15915493667125701904296875;
        _417 = _1315;
    }
    float _1317 = _417;
    float _1319 = _1265;
    float _1321 = _1317;
    if (_1289)
    {
        float _1323 = _1317 * 6.283185482025146484375;
        float _1325 = sin(_1323);
        _1319 = _1325;
    }
    float _1327 = _1319;
    float _1329 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1331 = precise::max(0.0, _1329);
    float _1333 = _1271;
    float _1335 = _1331;
    float _1337 = _1329;
    if (_1289)
    {
        float _1339 = _1317 * 6.283185482025146484375;
        float _1341 = cos(_1339);
        _1333 = _1341;
    }
    float _1343 = _1333;
    float _1345 = -_1275;
    float _1347 = -_1331;
    float _1349 = fma(_1255, _1345, _1347);
    float _1351 = _1349;
    if (!_1289)
    {
        _1335 = _1277;
    }
    float _1353 = _1335;
    float _1355 = _1353;
    if (_1289)
    {
        float _1357 = _1349 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1337 = _1357;
    }
    float _1359 = _1337;
    float _1361 = _1327;
    float _1363 = _1359;
    if (_1289)
    {
        float _1365 = fma(_1327, _1359, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1361 = _1365;
    }
    float _1367 = _1361;
    float _1369 = _1367;
    float _1371 = _1343;
    if (_1289)
    {
        float _1373 = _1343 + (-1.0);
        _1363 = _1373;
    }
    float _1375 = _1363;
    float _1377 = _1375;
    if (_1289)
    {
        float _1379 = _1309 * _1367;
        _1301 = _1379;
    }
    float _1381 = _1301;
    if (!_1289)
    {
        _1369 = _1281;
    }
    float _1383 = _1369;
    float _1385 = _1383;
    if (_1289)
    {
        float _1387 = _1375 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1321 = _1387;
    }
    float _1389 = _1321;
    if (_1289)
    {
        float _1391 = _1277 * _1381;
        _1355 = _1391;
    }
    float _1393 = _1355;
    if (!_1289)
    {
        _1377 = _1279;
    }
    float _1395 = _1377;
    float _1397 = _1395;
    if (_1289)
    {
        float _1399 = _1279 * _1381;
        _1397 = _1399;
    }
    float _1401 = _1397;
    if (_1289)
    {
        float _1403 = fma(_1349, _1343, _1389);
        _1351 = _1403;
    }
    float _1405 = _1351;
    if (_1289)
    {
        float _1407 = _1393 * _1393;
        _1385 = _1407;
    }
    float _1409 = _1385;
    if (!_1289)
    {
        _1371 = _1283;
    }
    float _1411 = _1371;
    float _1413 = _1411;
    if (_1289)
    {
        float _1415 = _1401 * _1401;
        _1413 = _1415;
    }
    float _1417 = _1413;
    float _1419 = fma(_1405, _1405, _1409);
    float _1421 = _1419 + _1417;
    float _1423 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1425 = fma(_1273, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1423);
    float _1427 = precise::clamp(_1425, 0.0, 1.0);
    float _1429 = rsqrt(_1421);
    float _1431 = -_1427;
    float _1433 = _1431 + 1.0;
    float _1435 = abs(_1433);
    float _1437 = log2(_1435);
    float _1439 = _1429 * _1393;
    float _1441 = _1429 * _1405;
    float _1443 = _1429 * _1401;
    float _1445 = _1439 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1447 = -_1445;
    float _1449 = fma(_1441, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1447);
    float _1451 = -_1443;
    float _1453 = fma(_1451, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1449);
    float _1455 = _1437 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1457 = fma(_1453, -0.5, 0.5);
    float _1459 = exp2(_1455);
    float _1461 = fma(_1453, 0.5, 0.5);
    float _1463 = fma(_1461, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1465 = sqrt(_1457);
    float _1467 = fma(_1461, _1463, -0.212114393711090087890625);
    float _1469 = _1441 + 1.0;
    float _1471 = fma(_1461, _1467, 1.570728778839111328125);
    float _1473 = -_1441;
    float _1475 = fma(_1459, _1469, _1473);
    float _1477 = fma(_1475, 0.5, 0.5);
    float _1479 = _1465 * 0.636619746685028076171875;
    float _1481 = -_1471;
    float _1483 = fma(_1479, _1481, 1.0);
    float2 _4365 = float2(_1483, _1477);
    float3 _1487 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4365, float2(0.0), isnan(_4365)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4365, float2(0.0), isnan(_4365)), level(0.0)).xyz;
    float _1489 = _1487.x;
    float _1491 = _1487.y;
    float _1493 = _1487.z;
    float _1495 = in.m_63.x;
    float _1497 = in.m_63.y;
    float _1499 = abs(_357);
    float _1501 = log2(_1499);
    float _1503 = _906 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1505 = _1437 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1507 = fma(_914, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1503);
    float _1509 = -_227;
    float _1511 = _1509 + 1.0;
    float _1513 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1515 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1517 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1519 = exp2(_1505);
    float _1521 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1523 = fma(_912, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1507);
    float _1525 = _1515 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1527 = _1501 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1529 = _1521 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1531 = _1513 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1533 = _357 <= 8000.0;
    bool _1535 = isnan(_357);
    bool _1537 = _1533 || _1535;
    bool _1539 = isnan(8000.0);
    bool _1541 = _1537 || _1539;
    float _1543 = float(_1541);
    float _1545 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1547 = fma(_960, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1523);
    bool _1549 = _1495 > 0.5;
    out.m_70.x = _1525;
    out.m_70.y = _1529;
    out.m_70.z = _1531;
    out.m_70.w = _1517;
    bool _1551 = _1497 > 0.5;
    float _1553 = exp2(_1527);
    float _1555 = -_435;
    int _1557 = _1551 ? as_type<int>(_1555) : as_type<int>(_435);
    out.gl_Position.x = _1012;
    out.gl_Position.y = _1010;
    out.gl_Position.z = _1547;
    out.gl_Position.w = _968;
    int _1559 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1561 = _1559 != 0;
    int _1563 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1565 = _1563 != 0;
    float _1567 = -_470;
    int _1569 = _1549 ? as_type<int>(_1567) : as_type<int>(_470);
    float _1571 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1573 = !_1561;
    float _1575 = _1573 ? _435 : as_type<float>(_1557);
    float _1577 = _435 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _1579 = !_1565;
    float _1581 = _1579 ? _470 : as_type<float>(_1569);
    float _1583 = _470 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1585 = _1577 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1587 = _1577 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1589 = _1577 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1591 = -_1519;
    float _1593 = _1591 + 1.0;
    float _1595 = fma(_1583, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1585);
    float _1597 = fma(_1583, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1587);
    float _1599 = fma(_1583, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1589);
    float _1601 = _1581 + 0.5;
    float _1603 = fma(_1553, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1605 = precise::clamp(_1603, 0.0, 1.0);
    float _1607 = _1517;
    float _1609 = _1599;
    float _1611 = _1597;
    float _1613 = _1595;
    if (!_934)
    {
        _1018 = 1.0;
    }
    float _1615 = _1018;
    float _1617 = _1593 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1619 = _1615;
    if (_934)
    {
        bool _1621 = _1048 >= _1026;
        bool _1623 = isnan(_1048);
        bool _1625 = _1621 || _1623;
        bool _1627 = isnan(_1026);
        bool _1629 = _1625 || _1627;
        float _1631 = float(_1629);
        _1619 = _1631;
    }
    float _1633 = _1619;
    float _1635 = fma(_1605, -2.0, 3.0);
    float _1637 = _1605 * _1605;
    float _1639 = -_1575;
    float _1641 = _1639 + 0.5;
    float _1643 = _1601 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1645 = _1633 * _1251;
    float _1647 = _1637 * _1635;
    float _1649 = _1617 * _1050;
    float _1651 = _1641 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1653 = _1643 * _1545;
    float _1655 = -_1647;
    float _1657 = _1655 + 1.0;
    float _1659 = _1547 + _968;
    float _1661 = -_1617;
    float _1663 = _1661 + 1.0;
    float _1665 = fma(_1657, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1647);
    float _1667 = _1061 * _1649;
    float _1669 = _1651 * _1571;
    float _1671 = _1061 * _1663;
    float _1673 = _1543 * _1665;
    float _1675 = _1659 * 0.5;
    float _1677 = _1597 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _1679 = _1599 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _1681 = _1673 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_72.x = _1653;
    out.m_72.y = _1669;
    bool _1683 = _1273 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1685 = isnan(_1273);
    bool _1687 = _1683 || _1685;
    bool _1689 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1691 = _1687 || _1689;
    float _1693 = _1511 * _1681;
    float _1695 = precise::clamp(_1693, 0.0, 1.0);
    out.m_74.z = _1675;
    out.m_74.w = _968;
    float _1697 = -_1695;
    float _1699 = fma(_1697, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1701 = -_1645;
    float _1703 = fma(_1701, _1699, 1.0);
    float _1705 = precise::clamp(_1703, 0.0, 1.0);
    if (!_1691)
    {
        _1607 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1707 = _1607;
    float _1709 = _1705 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1711 = _1595 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _1713 = _1707;
    float _1715 = _1707;
    if (!_1691)
    {
        _1609 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1717 = _1609;
    float _1719 = _1717;
    float _1721 = _1717;
    if (!_1691)
    {
        _1611 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1723 = _1611;
    out.m_76.x = _1709;
    float _1725 = _1723;
    float _1727 = _1723;
    if (!_1691)
    {
        _1613 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1729 = _1613;
    out.m_78.x = _1711;
    out.m_78.y = _1677;
    out.m_78.z = _1679;
    float _1731 = _1493 * _1649;
    float _1733 = fma(_1489, _1667, _1055);
    float _1735 = fma(_1491, _1667, _1057);
    float _1737 = _1135 * _1189;
    float _1739 = fma(_1061, _1731, _1059);
    float _1741 = _1737;
    float _1743 = _1729;
    float _1745 = _1729;
    if (!_1691)
    {
        _1085 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1747 = _1085;
    float _1749 = _1737 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1751 = _1747;
    float _1753 = _1747;
    if (!_1691)
    {
        _1741 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1755 = _1741;
    out.m_80.x = _1733;
    out.m_80.y = _1735;
    out.m_80.z = _1739;
    out.m_80.w = _1671;
    bool _1757 = !_1691;
    float _1759 = _1755;
    float _1761 = _1755;
    if (!_1757)
    {
        bool _1763 = _1273 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1765 = isnan(_1273);
        bool _1767 = _1763 || _1765;
        bool _1769 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1771 = _1767 || _1769;
        if (!_1771)
        {
            float _1773 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1775 = _1273 + _1773;
            float _1777 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1779 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1777;
            float _1781 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1783 = _1781 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1785 = 1.0 / _1779;
            float _1787 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1789 = _1787 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1791 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1793 = _1791 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1795 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1797 = _1795 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1799 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1801 = _1799 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1803 = _1775 * _1785;
            float _1805 = precise::clamp(_1803, 0.0, 1.0);
            float _1807 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1809 = _1807 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1811 = fma(_1805, _1783, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1813 = fma(_1805, _1809, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1815 = fma(_1805, _1789, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1817 = fma(_1805, _1793, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1819 = fma(_1805, _1797, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1821 = fma(_1805, _1801, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1715 = _1815;
            _1745 = _1819;
            _1753 = _1811;
            _1727 = _1817;
            _1721 = _1813;
            _1761 = _1821;
            _1823 = true;
        }
        else
        {
            bool _1825 = _1273 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1827 = isnan(_1273);
            bool _1829 = _1825 || _1827;
            bool _1831 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1833 = _1829 || _1831;
            if (!_1833)
            {
                _1751 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1835 = _1751;
            _1753 = _1835;
            if (!_1833)
            {
                _1713 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1837 = _1713;
            _1715 = _1837;
            if (!_1833)
            {
                _1719 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1839 = _1719;
            _1721 = _1839;
            if (!_1833)
            {
                _1725 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1841 = _1725;
            _1727 = _1841;
            if (!_1833)
            {
                _1743 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1843 = _1743;
            _1745 = _1843;
            if (!_1833)
            {
                _1759 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1845 = _1759;
            bool _1847 = !_1833;
            _1761 = _1845;
            if (!_1847)
            {
                bool _1849 = _1273 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1851 = isnan(_1273);
                bool _1853 = _1849 || _1851;
                bool _1855 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1857 = _1853 || _1855;
                if (!_1857)
                {
                    float _1859 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1861 = _1273 + _1859;
                    float _1863 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1865 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1863;
                    float _1867 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1869 = _1867 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1871 = 1.0 / _1865;
                    float _1873 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1875 = _1873 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1877 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1879 = _1877 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1881 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1883 = _1881 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1885 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1887 = _1885 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1889 = _1861 * _1871;
                    float _1891 = precise::clamp(_1889, 0.0, 1.0);
                    float _1893 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1895 = _1893 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1897 = fma(_1891, _1869, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1899 = fma(_1891, _1895, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1901 = fma(_1891, _1875, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1903 = fma(_1891, _1879, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1905 = fma(_1891, _1883, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1907 = fma(_1891, _1887, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1715 = _1901;
                    _1745 = _1905;
                    _1753 = _1897;
                    _1727 = _1903;
                    _1721 = _1899;
                    _1761 = _1907;
                    _1823 = true;
                }
                else
                {
                    _1715 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1745 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1753 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1727 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1721 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1761 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1823 = false;
    float _1909 = _1715;
    float _1911 = _1745;
    float _1913 = _1753;
    float _1915 = _1727;
    float _1917 = _1721;
    float _1919 = _1761;
    float _1921 = fma(_1677, -0.5, 0.5);
    float _1923 = precise::clamp(_1921, 0.0, 1.0);
    float _1925 = -_1909;
    float _1927 = _1925 + _1911;
    float _1929 = _1749 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1931 = -_1913;
    float _1933 = _1931 + _1915;
    float _1935 = fma(_1923, _1927, _1909);
    out.m_82.x = 0.0;
    float _1937 = -_1917;
    float _1939 = _1937 + _1919;
    float _1941 = fma(_1923, _1933, _1913);
    float _1943 = _1935 * 0.586610972881317138671875;
    out.m_59.x = _1929;
    bool _1945 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1947 = fma(_1923, _1939, _1917);
    float _1949 = fma(_1941, 0.298911988735198974609375, _1943);
    bool _1951 = _1135 > 0.0;
    bool _1953 = isnan(_1135);
    bool _1955 = _1951 || _1953;
    bool _1957 = isnan(0.0);
    bool _1959 = _1955 || _1957;
    float _1961 = fma(_1947, 0.114477999508380889892578125, _1949);
    bool _1963 = _1189 <= 0.0;
    bool _1965 = !_1959;
    bool _1967 = _1963 || _1965;
    float _1969 = -_1961;
    float _1971 = _1941 + _1969;
    float _1973 = -_1961;
    float _1975 = _1935 + _1973;
    float _1977 = -_1961;
    float _1979 = _1947 + _1977;
    float _1981 = fma(_1971, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1961);
    float _1983 = fma(_1975, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1961);
    float _1985 = fma(_1979, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1961);
    bool _1987 = !_1945;
    if (!_1987)
    {
        float _1989 = -_874;
        float _1991 = _1989 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _1993 = -_876;
        float _1995 = _1993 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _1997 = -_878;
        float _1999 = _1997 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2001 = _1991 * _1991;
        float _2003 = fma(_1995, _1995, _2001);
        float _2005 = fma(_1999, _1999, _2003);
        float _2007 = sqrt(_2005);
        float _2009 = rsqrt(_2005);
        float _2011 = -_2007;
        float _2013 = _2011 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2015 = _2013 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2017 = precise::clamp(_2015, 0.0, 1.0);
        float _2019 = _1995 * _2009;
        float _2021 = _1991 * _2009;
        float _2023 = abs(_2017);
        float _2025 = log2(_2023);
        float _2027 = _1999 * _2009;
        float _2029 = _2019 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2031 = _1677 * _2021;
        float _2033 = -_2021;
        float _2035 = -_2029;
        float _2037 = fma(_2033, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2035);
        float _2039 = fma(_1711, _2019, _2031);
        float _2041 = -_2027;
        float _2043 = fma(_2041, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2037);
        float _2045 = fma(_1679, _2027, _2039);
        float _2047 = precise::clamp(_2045, 0.0, 1.0);
        float _2049 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2051 = _2043 + _2049;
        float _2053 = _2025 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2055 = _2051 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2057 = precise::clamp(_2055, 0.0, 1.0);
        float _2059 = exp2(_2053);
        float _2061 = _2059 * _2057;
        float _2063 = _2047 * _2061;
        float _2065 = _2063 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2067 = _2063 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2069 = _2063 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_82.x = _2065;
        out.m_82.y = _2067;
        out.m_82.z = _2069;
    }
    out.m_84.x = _1981;
    out.m_84.y = _1983;
    out.m_84.z = _1985;
    if (!_1967)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_59.x = 0.0;
    float _2071 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2071;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

