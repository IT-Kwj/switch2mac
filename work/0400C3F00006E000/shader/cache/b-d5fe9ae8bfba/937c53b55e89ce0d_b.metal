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
    uint4 _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float4 _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* vp_c15 [[id(1)]];
    constant _16* vp_c8 [[id(2)]];
    constant _16* vp_c10 [[id(3)]];
    constant _16* vp_c9 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_C [[id(7)]];
    sampler vp_t_tcb_CSmplr [[id(8)]];
    texture2d_array<float> vp_t_tcb_14 [[id(9)]];
    sampler vp_t_tcb_14Smplr [[id(10)]];
    texture2d_array<float> vp_t_tcb_16 [[id(11)]];
    sampler vp_t_tcb_16Smplr [[id(12)]];
    texture2d<float> vp_t_tcb_24 [[id(13)]];
    sampler vp_t_tcb_24Smplr [[id(14)]];
    texture3d<float> vp_t_tcb_32 [[id(15)]];
    sampler vp_t_tcb_32Smplr [[id(16)]];
    texture3d<float> vp_t_tcb_30 [[id(17)]];
    sampler vp_t_tcb_30Smplr [[id(18)]];
    texture2d<float> vp_t_tcb_1C [[id(19)]];
    sampler vp_t_tcb_1CSmplr [[id(20)]];
    sampler vp_t_tcb_14Smplr_w [[id(21)]];
    sampler vp_t_tcb_24Smplr_w [[id(22)]];
    sampler vp_t_tcb_32Smplr_w [[id(23)]];
    sampler vp_t_tcb_30Smplr_w [[id(24)]];
    sampler vp_t_tcb_1CSmplr_w [[id(25)]];
    constant dm_border_t* dm_border [[id(26)]];
};

struct main0_out
{
    float4 m_79 [[user(locn0)]];
    float4 m_77 [[user(locn1)]];
    float4 m_91 [[user(locn2)]];
    float4 m_83 [[user(locn3)]];
    float4 m_61 [[user(locn4)]];
    float4 m_81 [[user(locn5)]];
    float4 m_73 [[user(locn6)]];
    float4 m_89 [[user(locn7)]];
    float4 m_85 [[user(locn8)]];
    float4 m_87 [[user(locn9)]];
    float4 m_93 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_69 [[attribute(1)]];
    float4 m_58 [[attribute(2)]];
    float4 m_63 [[attribute(3)]];
    float4 m_75 [[attribute(4)]];
    float4 m_65 [[attribute(6)]];
    float4 m_71 [[attribute(7)]];
    float4 m_67 [[attribute(8)]];
};

static inline __attribute__((always_inline))
int _106(thread const int& _6760, thread const int& _6761, constant _10& support_buffer)
{
    float _6764 = as_type<float>(support_buffer._m4);
    int _6766 = _6761 + as_type<int>(_6764);
    int _6768 = 1 + _6766;
    float _6770 = support_buffer._m5[_6768].x;
    float _6772 = abs(_6770);
    bool _6774 = _6772 == 1.0;
    if (_6774)
    {
        return _6760;
    }
    float _6776 = float(_6760);
    float _6778 = _6776 / _6772;
    int _6780 = int(_6778);
    return _6780;
}

static inline __attribute__((always_inline))
int _107(thread const int& _6810, thread const int& _6811, constant _10& support_buffer)
{
    float _6814 = as_type<float>(support_buffer._m4);
    int _6816 = _6811 + as_type<int>(_6814);
    int _6818 = 1 + _6816;
    float _6820 = support_buffer._m5[_6818].x;
    bool _6822 = _6820 == 1.0;
    if (_6822)
    {
        return _6810;
    }
    float _6824 = float(_6810);
    float _6826 = _6824 * _6820;
    int _6828 = int(_6826);
    return _6828;
}

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2329 = false;
    bool _363 = false;
    bool _193 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _111 = in.m_58.w;
    float _113 = trunc(_111);
    int _115 = int(_113);
    bool _119 = _115 >= 1;
    float _121 = 0.0;
    if (!_119)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _123 = _121;
    float _125 = _123;
    if (!_119)
    {
        out.m_61.x = 0.0;
    }
    int _127 = 0;
    if (!_119)
    {
        float _129 = _123 * 5.0;
        _127 = as_type<int>(_129);
    }
    int _131 = _127;
    if (!_119)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2673 = as_type<float>(_131);
        out.gl_Position.z = _2673;
    }
    if (!_119)
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
    float _149 = _147;
    if (_143)
    {
        float _151 = float(_115);
        _125 = _151;
    }
    float _153 = _125;
    bool _155 = _147 >= _153;
    bool _157 = !_143;
    bool _159 = _155 || _157;
    float _161 = _153;
    if (_159)
    {
        _161 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _163 = _161;
    if (_159)
    {
        out.m_61.x = 0.0;
    }
    int _165 = 0;
    if (_159)
    {
        float _167 = _163 * 5.0;
        _165 = as_type<int>(_167);
    }
    int _169 = _165;
    if (_159)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2743 = as_type<float>(_169);
        out.gl_Position.z = _2743;
    }
    if (_159)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _171 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _173 = !_171;
    float _191;
    if (!_173)
    {
        float _175 = in.m_65.x;
        float _177 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _179 = _175 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _181 = fma(_179, (*spvDescriptorSet0.vp_c9)._m0[12].x, _147);
        float _183 = _181 * _177;
        float _185 = floor(_183);
        float _187 = -_185;
        float _189 = _183 + _187;
        _191 = _189;
        _193 = true;
    }
    else
    {
        float _195 = float(_115);
        float _197 = 1.0 / _195;
        float _199 = _147 * _197;
        _191 = _199;
    }
    _193 = false;
    float _201 = _191;
    float _203 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _205 = _201 + _203;
    bool _207 = _201 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _209 = isnan(_201);
    bool _211 = _207 || _209;
    bool _213 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _215 = _211 || _213;
    float _217 = float(_215);
    float _219 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _221 = _201 + _219;
    bool _223 = _201 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _225 = isnan(_201);
    bool _227 = _223 || _225;
    bool _229 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _231 = _227 || _229;
    float _233 = float(_231);
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _237 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _235;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _241 = _239 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _243 = _201 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _245 = isnan(_201);
    bool _247 = _243 || _245;
    bool _249 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _251 = _247 || _249;
    float _253 = float(_251);
    float _255 = -_217;
    float _257 = _255 + 1.0;
    float _259 = 1.0 / _237;
    float _261 = _253 * _257;
    float _263 = -_253;
    float _265 = _263 + 1.0;
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _269 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _267;
    bool _271 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _273 = 1.0 / _241;
    float _275 = _233 * _265;
    float _277 = -_233;
    float _279 = _277 + 1.0;
    float _281 = _205 * _259;
    float _283 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _285 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _283;
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _289 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _287;
    float _291 = fma(_269, _281, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _293 = fma(_285, _281, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _295 = fma(_289, _281, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _297 = _221 * _273;
    float _299 = _291 * _275;
    float _301 = _293 * _275;
    float _303 = _295 * _275;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _307 = _305 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _311 = _309 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _315 = _313 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _317 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[143].x, _299);
    float _319 = fma(_307, _297, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _321 = fma(_311, _297, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _323 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[143].y, _301);
    float _325 = fma(_315, _297, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _327 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[143].z, _303);
    float _329 = fma(_319, _261, _317);
    float _331 = fma(_321, _261, _323);
    float _333 = fma(_325, _261, _327);
    float _335 = fma(_217, (*spvDescriptorSet0.vp_c9)._m0[145].x, _329);
    float _337 = fma(_217, (*spvDescriptorSet0.vp_c9)._m0[145].y, _331);
    float _339 = fma(_217, (*spvDescriptorSet0.vp_c9)._m0[145].z, _333);
    bool _341 = !_271;
    int _343 = as_type<int>(_329);
    float _361;
    if (!_341)
    {
        float _345 = in.m_65.x;
        float _347 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _349 = _345 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _351 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[11].x, _147);
        float _353 = _351 * _347;
        float _355 = floor(_353);
        float _357 = -_355;
        float _359 = _353 + _357;
        _361 = _359;
        _363 = true;
    }
    else
    {
        float _365 = float(_115);
        float _367 = 1.0 / _365;
        float _369 = _147 * _367;
        _361 = _369;
    }
    _363 = false;
    float _371 = _361;
    int _373 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _375 = _373;
    int _377 = 0;
    int _379 = _106(_375, _377, (*spvDescriptorSet0.support_buffer));
    float _381 = in.m_58.x;
    float _383 = in.m_58.y;
    float _385 = in.m_58.z;
    float _387 = in.m_67.z;
    float _389 = _383 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _391 = _383 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _393 = _383 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _395 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[5].x, _389);
    float _397 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[4].x, _391);
    float _399 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[6].x, _393);
    float _401 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[5].z, _395);
    float _403 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _405 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[4].z, _397);
    float _407 = _401 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _409 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[6].z, _399);
    float _411 = _405 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _413 = _407 + _403;
    float _415 = _409 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _417 = _413 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _419 = _413 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _421 = fma(_411, (*spvDescriptorSet0.vp_c15)._m0[126].x, _417);
    float _423 = fma(_411, (*spvDescriptorSet0.vp_c15)._m0[127].x, _419);
    float _425 = fma(_415, (*spvDescriptorSet0.vp_c15)._m0[126].z, _421);
    float _427 = fma(_415, (*spvDescriptorSet0.vp_c15)._m0[127].z, _423);
    float _429 = _425 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _431 = _427 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _433 = trunc(_429);
    int _435 = int(_433);
    float _437 = trunc(_431);
    int _439 = int(_437);
    int _441 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _443 = _435 + _441;
    int _445 = _443 + 1;
    bool _447 = _445 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _449 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _451 = _439 + _449;
    int _453 = _451 + 1;
    int _455 = _445 | _453;
    bool _457 = _455 < 0;
    bool _459 = _457 || _447;
    float _461 = in.m_65.x;
    float _463 = in.m_65.y;
    float _465 = in.m_65.z;
    bool _467 = _453 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _469 = _467 || _459;
    int _471 = _445;
    int _473 = _453;
    float _475 = _407;
    float _477 = _413;
    if (!_469)
    {
        int _479 = _453 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _481 = _479 + _445;
        _471 = _481;
    }
    int _483 = _471;
    float _485 = (*spvDescriptorSet0.vp_c9)._m0[144].y;
    if (!_469)
    {
        float _487 = floor(_431);
        _485 = _487;
    }
    float _489 = _485;
    if (!_469)
    {
        int _491 = _483 << 2;
        _473 = _491;
    }
    int _493 = _473;
    int _495 = _493;
    if (!_469)
    {
        uint _498 = uint(int(uint(_483) >> uint(2)));
        _343 = int(_498);
    }
    int _500 = _343;
    if (!_469)
    {
        int _502 = 12 & _493;
        _495 = _502;
    }
    int _504 = _495;
    float _506 = 0.0;
    if (!_469)
    {
        float _508 = floor(_429);
        _506 = _508;
    }
    float _510 = _506;
    int _512 = 0;
    if (!_469)
    {
        int _514 = _500 << 4;
        int _516 = _514 + _504;
        _512 = _516;
    }
    int _518 = _512;
    float _520 = _461 * 8.0;
    float _522 = 0.0;
    if (!_469)
    {
        float _524 = -_489;
        float _526 = _431 + _524;
        _522 = _526;
    }
    float _528 = _522;
    float _530 = 0.0;
    if (!_469)
    {
        int _532 = _518 + 400;
        uint _534 = uint(int(uint(_532) >> uint(2)));
        uint _536 = uint(int(uint(int(_534)) >> uint(2)));
        int _538 = int(_534) & 3;
        float _540 = (*spvDescriptorSet0.vp_c15)._m0[int(_536)][_538];
        _530 = _540;
    }
    float _542 = _530;
    float _544 = rint(_520);
    float _546 = 0.0;
    if (!_469)
    {
        float _548 = -_510;
        float _550 = _429 + _548;
        _546 = _550;
    }
    float _552 = _546;
    float _554 = _544 * 0.125;
    float _556 = precise::clamp(_554, 0.0, 1.0);
    float _558 = _542;
    if (!_469)
    {
        float _560 = rint(_542);
        float _562 = precise::max(_560, 0.0);
        uint _564 = uint(_562);
        uint _566 = clamp(_564, 0u, 65535u);
        _558 = as_type<float>(_566);
    }
    float _568 = _558;
    int _570 = _379 + (-1);
    float _572 = float(_570);
    float _574 = _556 * _572;
    float _576 = trunc(_387);
    int _578 = int(_576);
    float _580 = trunc(_574);
    int _582 = int(_580);
    int _584 = _582 + 1;
    int _586 = min(_570, _584);
    int _588 = _582;
    int _590 = 0;
    int _592 = _107(_588, _590, (*spvDescriptorSet0.support_buffer));
    int _594 = _578;
    int _596 = 0;
    int _598 = _107(_594, _596, (*spvDescriptorSet0.support_buffer));
    float3 _602 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_592, _598)), 0).xyz;
    float _604 = _602.x;
    float _606 = _602.y;
    float _608 = _602.z;
    int _610 = _586;
    int _612 = 0;
    int _614 = _107(_610, _612, (*spvDescriptorSet0.support_buffer));
    int _616 = _578;
    int _618 = 0;
    int _620 = _107(_616, _618, (*spvDescriptorSet0.support_buffer));
    float3 _622 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_614, _620)), 0).xyz;
    float _624 = _622.x;
    float _626 = _622.y;
    float _628 = _622.z;
    float _630 = _528;
    if (!_469)
    {
        float3 _3456 = float3(_552, _528, float(as_type<int>(_568)));
        float3 _3460 = select(_3456, float3(0.0), isnan(_3456));
        float _632 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _3460.xy, uint(rint(_3460.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _3460.xy, uint(rint(_3460.z)), level(0.0)).x;
        _630 = _632;
    }
    float _634 = _630;
    float _636 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _638 = log2(_636);
    float _640 = _465 * 2.0;
    float _642 = _407 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _644 = _461 * 2.0;
    float _646 = _463 * 2.0;
    float _648 = fma(_411, (*spvDescriptorSet0.vp_c8)._m0[11].x, _642);
    int _650 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _652 = _650 != 0;
    int _654 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _656 = _654 != 0;
    int _658 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _660 = _658 != 0;
    float _662 = floor(_640);
    float _664 = _463 + _465;
    float _666 = _465 + _461;
    float _668 = _461 + (-0.5);
    float _670 = _664 + (-1.0);
    float _672 = _666 + (-1.0);
    float _674 = _638 * _147;
    float _676 = fma(_415, (*spvDescriptorSet0.vp_c8)._m0[11].z, _648);
    float _678 = _465 + (-0.5);
    float _680 = floor(_644);
    float _682 = _463 + _461;
    float _684 = _407 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _686 = _662 > 0.0;
    float _688 = fma(_411, (*spvDescriptorSet0.vp_c8)._m0[10].x, _684);
    bool _690 = _662 >= 0.0;
    bool _692 = isnan(_662);
    bool _694 = _690 || _692;
    bool _696 = isnan(0.0);
    bool _698 = _694 || _696;
    float _700 = exp2(_674);
    float _702 = _676 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _704 = fma(_415, (*spvDescriptorSet0.vp_c8)._m0[10].z, _688);
    float _706 = _463 + (-0.5);
    int _708 = _698 ? 0 : 1;
    float _710 = _682 + (-1.0);
    float _712 = 1.0 / _702;
    float _714 = fma(_670, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _716 = _704 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _718 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _720 = 1.0 + _718;
    bool _722 = _680 >= 0.0;
    bool _724 = isnan(_680);
    bool _726 = _722 || _724;
    bool _728 = isnan(0.0);
    bool _730 = _726 || _728;
    float _732 = fma(_710, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _734 = _716 + _702;
    bool _736 = _680 > 0.0;
    float _738 = floor(_646);
    int _740 = ~_708;
    int _742 = _740 + 1;
    int _744 = _742 + 1;
    float _746 = -_700;
    float _748 = _746 + 1.0;
    int _750 = _744;
    if (!_686)
    {
        int _752 = ~_708;
        int _754 = _752 + 1;
        _750 = _754;
    }
    int _756 = _750;
    bool _758 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _760 = isnan(1.0);
    bool _762 = _758 || _760;
    bool _764 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _766 = _762 || _764;
    int _768 = _730 ? 0 : 1;
    float _770 = 1.0 / _720;
    float _772 = _734 * _712;
    float _774 = _772 * 0.5;
    bool _776 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _778 = isnan(0.0);
    bool _780 = _776 || _778;
    bool _782 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _784 = _780 || _782;
    bool _786 = !_652;
    int _788 = _786 ? 0 : 1;
    float _790 = _784 ? _748 : 0.0;
    float _792 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _794 = fma(_774, (*spvDescriptorSet0.vp_c8)._m0[30].w, _792);
    bool _796 = _738 > 0.0;
    bool _798 = _738 >= 0.0;
    bool _800 = isnan(_738);
    bool _802 = _798 || _800;
    bool _804 = isnan(0.0);
    bool _806 = _802 || _804;
    int _808 = abs(_788);
    float _810 = 1.0 / _794;
    float _812 = in.m_69.x;
    float _814 = in.m_69.y;
    float _816 = in.m_69.z;
    if (_766)
    {
        float _818 = _790 * _770;
        _149 = _818;
    }
    float _820 = _149;
    bool _822 = !_656;
    int _824 = _822 ? 0 : 1;
    int _826 = abs(_824);
    float _828 = float(_808);
    float _830 = float(_756);
    bool _832 = !_660;
    int _834 = _832 ? 0 : 1;
    int _836 = ~_768;
    int _838 = _836 + 1;
    int _840 = _838 + 1;
    float _842 = _828 * _830;
    int _844 = _840;
    if (!_736)
    {
        int _846 = ~_768;
        int _848 = _846 + 1;
        _844 = _848;
    }
    int _850 = _844;
    int _852 = abs(_834);
    float _854 = float(_826);
    float _856 = _842 * (-2.0);
    float _858 = float(_850);
    float _860 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _862 = _810 * _860;
    int _864 = _806 ? 0 : 1;
    float _866 = fma(_856, _812, _812);
    float _868 = fma(_732, _856, _732);
    float _870 = _854 * _858;
    bool _872 = _862 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _874 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[196].x, _866);
    bool _876 = _862 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _878 = _870 * (-2.0);
    int _880 = ~_864;
    int _882 = _880 + 1;
    int _884 = _882 + 1;
    float _886 = fma(_868, _820, _874);
    int _888 = _884;
    if (!_796)
    {
        int _890 = ~_864;
        int _892 = _890 + 1;
        _888 = _892;
    }
    int _894 = _888;
    float _896 = fma(_714, _878, _714);
    float _898 = fma(_878, _814, _814);
    float _900 = float(_852);
    float _902 = _886 * 0.15915493667125701904296875;
    float _904 = float(_894);
    float _906 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[196].y, _898);
    bool _908 = !_872;
    int _910 = _908 ? 0 : 1;
    float _912 = _902 * 6.283185482025146484375;
    float _914 = sin(_912);
    float _916 = _900 * _904;
    int _918 = 2;
    if (!_872)
    {
        _918 = 1;
    }
    int _920 = _918;
    float _922 = fma(_896, _820, _906);
    int _924 = _920;
    if (!_876)
    {
        _924 = _910;
    }
    int _926 = _924;
    float _928 = _916 * (-2.0);
    float _930 = _922 * 0.15915493667125701904296875;
    int _932 = _926 << 6;
    float _934 = fma(_928, _816, _816);
    float _936 = _902 * 6.283185482025146484375;
    float _938 = cos(_936);
    float _940 = fma(_672, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _942 = _932 + 56;
    uint _944 = uint(int(uint(_942) >> uint(2)));
    uint _946 = uint(int(uint(int(_944)) >> uint(2)));
    int _948 = int(_944) & 3;
    float _950 = (*spvDescriptorSet0.vp_c15)._m0[int(_946)][_948];
    int _952 = int(_944) + 1;
    uint _954 = uint(int(uint(_952) >> uint(2)));
    int _956 = _952 & 3;
    float _958 = (*spvDescriptorSet0.vp_c15)._m0[int(_954)][_956];
    float _960 = fma(_678, (*spvDescriptorSet0.vp_c9)._m0[196].z, _934);
    float _962 = fma(_940, _928, _940);
    float _964 = in.m_71.x;
    float _966 = in.m_71.y;
    float _968 = in.m_71.z;
    float _970 = _930 * 6.283185482025146484375;
    float _972 = sin(_970);
    float _974 = fma(_962, _820, _960);
    int _976 = _932 + 48;
    uint _978 = uint(int(uint(_976) >> uint(2)));
    uint _980 = uint(int(uint(int(_978)) >> uint(2)));
    int _982 = int(_978) & 3;
    float _984 = (*spvDescriptorSet0.vp_c15)._m0[int(_980)][_982];
    int _986 = int(_978) + 1;
    uint _988 = uint(int(uint(_986) >> uint(2)));
    int _990 = _986 & 3;
    float _992 = (*spvDescriptorSet0.vp_c15)._m0[int(_988)][_990];
    float _994 = _974 * 0.15915493667125701904296875;
    float _996 = _930 * 6.283185482025146484375;
    float _998 = cos(_996);
    int _1000 = _932 + 80;
    uint _1002 = uint(int(uint(_1000) >> uint(2)));
    uint _1004 = uint(int(uint(int(_1002)) >> uint(2)));
    int _1006 = int(_1002) & 3;
    float _1008 = (*spvDescriptorSet0.vp_c15)._m0[int(_1004)][_1006];
    int _1010 = int(_1002) + 1;
    uint _1012 = uint(int(uint(_1010) >> uint(2)));
    int _1014 = _1010 & 3;
    float _1016 = (*spvDescriptorSet0.vp_c15)._m0[int(_1012)][_1014];
    float _1018 = _994 * 6.283185482025146484375;
    float _1020 = cos(_1018);
    float _1022 = _938 * _972;
    int _1024 = _932 + 88;
    uint _1026 = uint(int(uint(_1024) >> uint(2)));
    uint _1028 = uint(int(uint(int(_1026)) >> uint(2)));
    int _1030 = int(_1026) & 3;
    float _1032 = (*spvDescriptorSet0.vp_c15)._m0[int(_1028)][_1030];
    int _1034 = int(_1026) + 1;
    uint _1036 = uint(int(uint(_1034) >> uint(2)));
    int _1038 = _1034 & 3;
    float _1040 = (*spvDescriptorSet0.vp_c15)._m0[int(_1036)][_1038];
    float _1042 = _339 * _968;
    float _1044 = floor(_574);
    float _1046 = _337 * _966;
    int _1048 = _932 + 64;
    uint _1050 = uint(int(uint(_1048) >> uint(2)));
    uint _1052 = uint(int(uint(int(_1050)) >> uint(2)));
    int _1054 = int(_1050) & 3;
    float _1056 = (*spvDescriptorSet0.vp_c15)._m0[int(_1052)][_1054];
    int _1058 = int(_1050) + 1;
    uint _1060 = uint(int(uint(_1058) >> uint(2)));
    int _1062 = _1058 & 3;
    float _1064 = (*spvDescriptorSet0.vp_c15)._m0[int(_1060)][_1062];
    float _1066 = _914 * _972;
    float _1068 = _914 * _998;
    float _1070 = _938 * _998;
    float _1072 = _335 * _964;
    float _1074 = _1046 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1076 = _994 * 6.283185482025146484375;
    float _1078 = sin(_1076);
    float _1080 = _914 * _1020;
    int _1082 = _932 + 96;
    uint _1084 = uint(int(uint(_1082) >> uint(2)));
    uint _1086 = uint(int(uint(int(_1084)) >> uint(2)));
    int _1088 = int(_1084) & 3;
    float _1090 = (*spvDescriptorSet0.vp_c15)._m0[int(_1086)][_1088];
    int _1092 = int(_1084) + 1;
    uint _1094 = uint(int(uint(_1092) >> uint(2)));
    int _1096 = _1092 & 3;
    float _1098 = (*spvDescriptorSet0.vp_c15)._m0[int(_1094)][_1096];
    float _1100 = _998 * _1020;
    float _1102 = _938 * _1020;
    float _1104 = _1072 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1106 = _1042 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1108 = -_1044;
    float _1110 = _574 + _1108;
    float _1112 = _972 * _1020;
    int _1114 = _932 + 72;
    uint _1116 = uint(int(uint(_1114) >> uint(2)));
    uint _1118 = uint(int(uint(int(_1116)) >> uint(2)));
    int _1120 = int(_1116) & 3;
    float _1122 = (*spvDescriptorSet0.vp_c15)._m0[int(_1118)][_1120];
    int _1124 = int(_1116) + 1;
    uint _1126 = uint(int(uint(_1124) >> uint(2)));
    int _1128 = _1124 & 3;
    float _1130 = (*spvDescriptorSet0.vp_c15)._m0[int(_1126)][_1128];
    float _1132 = fma(_1078, _1070, _1066);
    float _1134 = -_1068;
    float _1136 = fma(_1078, _1022, _1134);
    float _1138 = _413 * _992;
    float _1140 = -_1022;
    float _1142 = fma(_1078, _1068, _1140);
    float _1144 = fma(_1078, _1066, _1070);
    float _1146 = fma(_411, _984, _1138);
    float _1148 = _413 * _1016;
    float _1150 = fma(_415, _950, _1146);
    float _1152 = fma(_411, _1008, _1148);
    float _1154 = _1150 + _958;
    float _1156 = fma(_415, _1032, _1152);
    float _1158 = _1156 + _1040;
    float _1160 = _413 * _1064;
    float _1162 = fma(_411, _1056, _1160);
    float _1164 = _413 * _1098;
    float _1166 = fma(_411, _1090, _1164);
    float _1168 = fma(_415, _1122, _1162);
    float _1170 = _1168 + _1130;
    float _1172 = -_606;
    float _1174 = _1172 + _626;
    float _1176 = -_604;
    float _1178 = _1176 + _624;
    float _1180 = -_608;
    float _1182 = _1180 + _628;
    float _1184 = fma(_1110, _1174, _606);
    float _1186 = fma(_1110, _1178, _604);
    float _1188 = fma(_1110, _1182, _608);
    float _1190 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1184);
    float _1192 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1186);
    int _1194 = _932 + 104;
    uint _1196 = uint(int(uint(_1194) >> uint(2)));
    uint _1198 = uint(int(uint(int(_1196)) >> uint(2)));
    int _1200 = int(_1196) & 3;
    float _1202 = (*spvDescriptorSet0.vp_c15)._m0[int(_1198)][_1200];
    int _1204 = int(_1196) + 1;
    uint _1206 = uint(int(uint(_1204) >> uint(2)));
    int _1208 = _1204 & 3;
    float _1210 = (*spvDescriptorSet0.vp_c15)._m0[int(_1206)][_1208];
    float _1212 = _1074 * _1190;
    float _1214 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1188);
    float _1216 = _1104 * _1192;
    float _1218 = _1102 * _1212;
    float _1220 = _1106 * _1214;
    float _1222 = -_1212;
    float _1224 = _1078 * _1222;
    float _1226 = _1080 * _1212;
    float _1228 = fma(_1132, _1216, _1218);
    float _1230 = fma(_1100, _1216, _1224);
    float _1232 = fma(_1142, _1216, _1226);
    float _1234 = fma(_1136, _1220, _1228);
    float _1236 = fma(_1112, _1220, _1230);
    float _1238 = fma(_1144, _1220, _1232);
    float _1240 = _1234 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1242 = _1234 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1244 = fma(_1236, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1240);
    float _1246 = fma(_1236, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1242);
    float _1248 = fma(_1238, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1244);
    float _1250 = fma(_1238, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1246);
    float _1252 = _415 + _1248;
    float _1254 = _411 + _1250;
    float _1256 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1258 = _1252 + _1256;
    float _1260 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1262 = _1254 + _1260;
    float _1264 = _1258 * _1258;
    float _1266 = fma(_1262, _1262, _1264);
    float _1268 = _1234 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1270 = sqrt(_1266);
    float _1272 = fma(_1236, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1268);
    float _1274 = fma(_415, _1202, _1166);
    float _1276 = fma(_1238, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1272);
    float _1278 = _1274 + _1210;
    float _1280 = _407 + _1276;
    float _1282 = 1.0 / _1278;
    bool _1284 = _1270 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1286 = _1154 * _1282;
    float _1288 = _1170 * _1282;
    float _1290 = _1158 * _1282;
    float _1292 = _1236;
    float _1294 = _1238;
    float _1296 = _1276;
    float _1298 = _1158;
    float _1300 = _1270;
    float _1302 = _1254;
    float _1304 = _1252;
    if (!_1284)
    {
        _1292 = _1254;
    }
    float _1306 = _1292;
    float _1308 = _1306;
    if (!_1284)
    {
        _1294 = _1252;
    }
    float _1310 = _1294;
    float _1312 = _1310;
    if (!_1284)
    {
        _1296 = _1280;
    }
    float _1314 = _1296;
    bool _1316 = !_1284;
    float _1318 = _1314;
    if (!_1316)
    {
        float _1320 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1322 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1324 = _1270 + _1322;
        float _1326 = _1280 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1328 = rsqrt(_1266);
        float _1330 = _1324 * _1320;
        float _1332 = _1330 * 0.15915493667125701904296875;
        float _1334 = _1332 * 6.283185482025146484375;
        float _1336 = cos(_1334);
        float _1338 = _1332 * 6.283185482025146484375;
        float _1340 = sin(_1338);
        float _1342 = _1336 + (-1.0);
        float _1344 = _1342 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1346 = fma(_1340, _1326, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1348 = fma(_1280, _1336, _1344);
        float _1350 = _1328 * _1346;
        float _1352 = fma(_1262, _1350, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1354 = fma(_1258, _1350, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1298 = _1350;
        _1300 = _1332;
        _1302 = _1346;
        _1318 = _1348;
        _1308 = _1352;
        _1312 = _1354;
    }
    float _1356 = _1298;
    float _1358 = _1300;
    float _1360 = _1302;
    float _1362 = _1318;
    float _1364 = _1308;
    float _1366 = _1312;
    float _1368 = _1360;
    float _1370 = _1358;
    float _1372 = _1356;
    if (_469)
    {
        _475 = 1.0;
    }
    float _1374 = _475;
    float _1376 = _1374;
    if (!_469)
    {
        int _1378 = _483 << 4;
        int _1380 = _1378 + 2048;
        uint _1382 = uint(int(uint(_1380) >> uint(2)));
        uint _1384 = uint(int(uint(int(_1382)) >> uint(2)));
        int _1386 = int(_1382) & 3;
        float _1388 = (*spvDescriptorSet0.vp_c15)._m0[int(_1384)][_1386];
        int _1390 = int(_1382) + 1;
        uint _1392 = uint(int(uint(_1390) >> uint(2)));
        int _1394 = _1390 & 3;
        float _1396 = (*spvDescriptorSet0.vp_c15)._m0[int(_1392)][_1394];
        int _1398 = _1380 + 8;
        uint _1400 = uint(int(uint(_1398) >> uint(2)));
        uint _1402 = uint(int(uint(int(_1400)) >> uint(2)));
        int _1404 = int(_1400) & 3;
        float _1406 = (*spvDescriptorSet0.vp_c15)._m0[int(_1402)][_1404];
        int _1408 = int(_1400) + 1;
        uint _1410 = uint(int(uint(_1408) >> uint(2)));
        int _1412 = _1408 & 3;
        float _1414 = (*spvDescriptorSet0.vp_c15)._m0[int(_1410)][_1412];
        float _1416 = _413 * _1396;
        float _1418 = fma(_411, _1388, _1416);
        float _1420 = fma(_415, _1406, _1418);
        float _1422 = _1420 + _1414;
        float _1424 = precise::clamp(_1422, 0.0, 1.0);
        float _1426 = -_1424;
        float _1428 = _1426 + _634;
        float _1430 = fma(_1428, 500.0, 1.5);
        float _1432 = exp2(_1430);
        float _1434 = 0.0 + _1432;
        float _1436 = precise::clamp(_1434, 0.0, 1.0);
        _1368 = _1414;
        _477 = _1420;
        _1370 = _1406;
        _1372 = _1388;
        _1376 = _1436;
    }
    float _1438 = _1368;
    float _1440 = _477;
    float _1442 = _1370;
    float _1444 = _1372;
    float _1446 = _1376;
    float _1448 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1450 = _1362 + _1448;
    float _1452 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1454 = _1364 + _1452;
    float _1456 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1458 = _1366 + _1456;
    float _1460 = _1450 * _1450;
    float _1462 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1464 = fma(_1454, _1454, _1460);
    float _1466 = fma(_1458, _1458, _1464);
    float _1468 = rsqrt(_1466);
    float _1470 = sqrt(_1466);
    float _1472 = _1454 * _1468;
    float _1474 = _1458 * _1468;
    float _1476 = _1450 * _1468;
    float _1478 = _1472 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1480 = _1474 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1482 = _1478 * _1478;
    float _1484 = _1480 * _1480;
    float _1486 = _1482 + _1484;
    float _1488 = sqrt(_1486);
    bool _1490 = _1488 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1492 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1494 = _1488 + _1492;
    float _1496 = _1438;
    float _1498 = _1444;
    float _1500 = _1494;
    float _1502 = (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1504 = _1468;
    float _1506 = _1486;
    if (_1490)
    {
        float _1508 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1496 = _1508;
    }
    float _1510 = _1496;
    if (_1490)
    {
        float _1512 = rsqrt(_1486);
        _1498 = _1512;
    }
    float _1514 = _1498;
    float _1516 = _1514;
    if (_1490)
    {
        float _1518 = _1494 * _1510;
        _1500 = _1518;
    }
    float _1520 = _1500;
    if (_1490)
    {
        float _1522 = _1520 * 0.15915493667125701904296875;
        _1304 = _1522;
    }
    float _1524 = _1304;
    float _1526 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    if (!_1490)
    {
        _1502 = _1478;
    }
    float _1528 = _1502;
    float _1530 = _1440;
    float _1532 = _1528;
    if (_1490)
    {
        float _1534 = _1524 * 6.283185482025146484375;
        float _1536 = sin(_1534);
        _1530 = _1536;
    }
    float _1538 = _1530;
    float _1540 = precise::max(0.0, _1526);
    float _1542 = -_1476;
    float _1544 = -_1540;
    float _1546 = fma(_1542, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1544);
    float _1548 = _1442;
    float _1550 = _1540;
    if (_1490)
    {
        float _1552 = _1524 * 6.283185482025146484375;
        float _1554 = cos(_1552);
        _1548 = _1554;
    }
    float _1556 = _1548;
    float _1558 = fma(_411, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1560 = _1558;
    if (_1490)
    {
        float _1562 = _1546 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1504 = _1562;
    }
    float _1564 = _1504;
    float _1566 = _1564;
    float _1568 = _1538;
    if (_1490)
    {
        float _1570 = fma(_1538, _1564, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1566 = _1570;
    }
    float _1572 = _1566;
    float _1574 = floor(_1558);
    float _1576 = _1572;
    if (_1490)
    {
        float _1578 = _1514 * _1572;
        _1506 = _1578;
    }
    float _1580 = _1506;
    if (!_1490)
    {
        _1576 = _1546;
    }
    float _1582 = _1576;
    float _1584 = _1582;
    if (!_1490)
    {
        _1516 = _1482;
    }
    float _1586 = _1516;
    float _1588 = _1586;
    float _1590 = _1556;
    if (_1490)
    {
        float _1592 = _1556 + (-1.0);
        _1568 = _1592;
    }
    float _1594 = _1568;
    float _1596 = _1594;
    if (_1490)
    {
        float _1598 = _1478 * _1580;
        _1532 = _1598;
    }
    float _1600 = _1532;
    float _1602 = _1362 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1604 = _1362 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1490)
    {
        float _1606 = _1594 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1550 = _1606;
    }
    float _1608 = _1550;
    if (!_1490)
    {
        _1596 = _1480;
    }
    float _1610 = _1596;
    float _1612 = _1610;
    if (_1490)
    {
        float _1614 = _1480 * _1580;
        _1612 = _1614;
    }
    float _1616 = _1612;
    if (_1490)
    {
        float _1618 = _1600 * _1600;
        _1588 = _1618;
    }
    float _1620 = _1588;
    if (_1490)
    {
        float _1622 = fma(_1546, _1556, _1608);
        _1584 = _1622;
    }
    float _1624 = _1584;
    if (!_1490)
    {
        _1590 = _1484;
    }
    float _1626 = _1590;
    float _1628 = _1626;
    if (_1490)
    {
        float _1630 = _1616 * _1616;
        _1628 = _1630;
    }
    float _1632 = _1628;
    bool _1634 = _1286 >= 0.0;
    float _1636 = fma(_1624, _1624, _1620);
    float _1638 = fma(_415, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1640 = _1362 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    bool _1642 = _1286 <= 1.0;
    bool _1644 = _1642 && _1634;
    float _1646 = _1636 + _1632;
    float _1648 = _1362 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    bool _1650 = _1288 >= 0.0;
    bool _1652 = _1650 && _1644;
    float _1654 = rsqrt(_1646);
    float _1656 = fma(_1364, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1602);
    float _1658 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1660 = fma(_1470, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1658);
    float _1662 = precise::clamp(_1660, 0.0, 1.0);
    bool _1664 = _1288 <= 1.0;
    bool _1666 = _1664 && _1652;
    float _1668 = fma(_1364, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1640);
    float _1670 = fma(_1364, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1648);
    float _1672 = -_1662;
    float _1674 = _1672 + 1.0;
    float _1676 = fma(_1366, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1656);
    float _1678 = fma(_1366, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1668);
    float _1680 = fma(_1364, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1604);
    float _1682 = -_1574;
    float _1684 = _1558 + _1682;
    float _1686 = fma(_1366, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1670);
    float _1688 = abs(_1674);
    float _1690 = log2(_1688);
    float _1692 = _1676 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1694 = fma(_1366, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1680);
    float _1696 = _1686 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    if (_1666)
    {
        float _1698 = float(_926);
        _1560 = _1698;
    }
    float _1700 = _1560;
    float _1702 = _1654 * _1600;
    float _1704 = _1692 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1706 = _1654 * _1624;
    float _1708 = _1694 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1710 = _1702 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1712 = _1700;
    if (_1666)
    {
        float _1714 = rint(_1700);
        float _1716 = precise::max(_1714, 0.0);
        uint _1718 = uint(_1716);
        uint _1720 = clamp(_1718, 0u, 65535u);
        _1712 = as_type<float>(_1720);
    }
    float _1722 = _1712;
    float _1724 = fma(_1696, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1704);
    float _1726 = _1654 * _1616;
    float _1728 = -_1710;
    float _1730 = fma(_1706, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1728);
    float _1732 = _1708 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1734 = _1678 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1736 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1724);
    float _1738 = -_1726;
    float _1740 = fma(_1738, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1730);
    float _1742 = floor(_1638);
    float _1744 = -_1732;
    float _1746 = fma(_1744, _1462, 1.0);
    float _1748 = _1690 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1750 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1736);
    float _1752 = fma(_1740, -0.5, 0.5);
    float _1754 = fma(_1740, 0.5, 0.5);
    float _1756 = _1692 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1758 = exp2(_1748);
    float _1760 = _1692 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1762 = 0.0;
    float _1764 = _1750;
    if (_1666)
    {
        float3 _5219 = float3(_1286, _1288, float(as_type<int>(_1722)));
        float3 _5221 = select(_5219, float3(0.0), isnan(_5219));
        float _1766 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5221.xy, uint(rint(_5221.z)), _1290, level(0.0));
        _1762 = _1766;
    }
    float _1768 = _1762;
    float _1770 = fma(_1754, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1772 = fma(_1696, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1756);
    float _1774 = fma(_1696, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1760);
    float _1776 = fma(_1754, _1770, -0.212114393711090087890625);
    float _1778 = log2(_1746);
    float _1780 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1772);
    float _1782 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1774);
    float _1784 = -_1742;
    float _1786 = _1638 + _1784;
    float _1788 = fma(_1754, _1776, 1.570728778839111328125);
    float _1790 = _1706 + 1.0;
    float _1792 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1780);
    float _1794 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1782);
    float _1796 = 1.0 / _1750;
    float _1798 = -_1706;
    float _1800 = fma(_1758, _1790, _1798);
    float _1802 = sqrt(_1752);
    float _1804 = _1778 * 0.693147182464599609375;
    float2 _5295 = float2(_1684, _1786);
    float _1806 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5295, float2(0.0), isnan(_5295)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5295, float2(0.0), isnan(_5295)), level(0.0)).x;
    float _1808 = fma(_1800, 0.5, 0.5);
    float _1810 = _1804 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1812 = _1792 * _1796;
    float _1814 = _1794 * _1796;
    float _1816 = fma(_1812, 0.5, 0.5);
    float _1818 = fma(_1814, -0.5, 0.5);
    float _1820 = _1802 * 0.636619746685028076171875;
    float3 _5325 = float3(_1816, _1818, _1810);
    float _1822 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5325, float3(0.0), isnan(_5325)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5325, float3(0.0), isnan(_5325)), level(0.0)).x;
    float _1824 = -_1788;
    float _1826 = fma(_1820, _1824, 1.0);
    float3 _5339 = float3(_1816, _1818, _1810);
    float4 _1829 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5339, float3(0.0), isnan(_5339)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5339, float3(0.0), isnan(_5339)), level(0.0)).xyzw;
    float _1831 = _1829.x;
    float _1833 = _1829.y;
    float _1835 = _1829.z;
    float _1837 = _1829.w;
    float2 _5355 = float2(_1826, _1808);
    float3 _1839 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5355, float2(0.0), isnan(_5355)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5355, float2(0.0), isnan(_5355)), level(0.0)).xyz;
    float _1841 = _1839.x;
    float _1843 = _1839.y;
    float _1845 = _1839.z;
    float _1847 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1849 = _371 + _1847;
    bool _1851 = _1184 != 0.0;
    bool _1853 = isnan(_1184);
    bool _1855 = _1851 || _1853;
    bool _1857 = isnan(0.0);
    bool _1859 = _1855 || _1857;
    float _1861 = _1690 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1863 = _1692 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1865 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1867 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1865;
    float _1869 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1871 = _1869 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _1873 = _371 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1875 = isnan(_371);
    bool _1877 = _1873 || _1875;
    bool _1879 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1881 = _1877 || _1879;
    float _1883 = float(_1881);
    float _1885 = fma(_1696, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1863);
    float _1887 = 1.0 / _1867;
    bool _1889 = _371 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1891 = isnan(_371);
    bool _1893 = _1889 || _1891;
    bool _1895 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1897 = _1893 || _1895;
    float _1899 = float(_1897);
    out.m_73.x = _1364;
    out.m_73.y = _1362;
    out.m_73.z = _1366;
    float _1901 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1885);
    float _1903 = -_1899;
    float _1905 = _1903 + 1.0;
    float _1907 = 1.0 / _1871;
    bool _1909 = _1186 == 0.0;
    bool _1911 = !_1859;
    bool _1913 = _1909 && _1911;
    float _1915 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1917 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1915;
    float _1919 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1921 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1919;
    float _1923 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _1925 = _1923 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    bool _1927 = _1188 == 0.0;
    bool _1929 = _1927 && _1913;
    float _1931 = _1849 * _1887;
    bool _1933 = _371 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _1935 = isnan(_371);
    bool _1937 = _1933 || _1935;
    bool _1939 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _1941 = _1937 || _1939;
    float _1943 = float(_1941);
    float _1945 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1947 = _371 + _1945;
    float _1949 = _1883 * _1905;
    float _1951 = fma(_1917, _1931, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1953 = fma(_1921, _1931, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1955 = -_1943;
    float _1957 = _1955 + 1.0;
    float _1959 = -_1883;
    float _1961 = _1959 + 1.0;
    float _1963 = _1947 * _1907;
    float _1965 = _1951 * _1949;
    float _1967 = _1899 * _1957;
    float _1969 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1971 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1969;
    float _1973 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _1975 = _1973 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _1977 = _1953 * _1949;
    float _1979 = fma(_1925, _1963, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _1981 = fma(_1971, _1931, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1983 = fma(_1975, _1963, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _1985 = exp2(_1861);
    float _1987 = _1981 * _1949;
    float _1989 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _1991 = _1989 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _1993 = fma(_1961, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1987);
    float _1995 = fma(_1991, _1963, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _1997 = fma(_1961, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1977);
    float _1999 = fma(_1961, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1965);
    float _2001 = fma(_1995, _1967, _1993);
    float _2003 = fma(_1979, _1967, _1997);
    float _2005 = fma(_1983, _1967, _1999);
    float _2007 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2009 = fma(_1943, (*spvDescriptorSet0.vp_c9)._m0[109].x, _2001);
    float _2011 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2013 = fma(_1943, (*spvDescriptorSet0.vp_c9)._m0[109].y, _2003);
    float _2015 = fma(_1943, (*spvDescriptorSet0.vp_c9)._m0[109].z, _2005);
    float _2017 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2019 = _2011 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2021 = _2013 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2023 = _2015 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2025 = abs(_862);
    float _2027 = log2(_2025);
    float _2029 = _2017 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2031 = _2021 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2033 = _2023 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2035 = _2007 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2037 = in.m_75.x;
    float _2039 = in.m_75.y;
    float _2041 = in.m_75.z;
    float _2043 = _2009 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2045 = -_1985;
    float _2047 = _2045 + 1.0;
    out.m_77.x = _2035;
    out.m_77.y = _2019;
    out.m_77.z = _2029;
    float _2049 = _2043 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2051 = _2047 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_79.x = _2049;
    out.m_79.y = _2031;
    out.m_79.z = _2033;
    float _2053 = _2027 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2055 = exp2(_2053);
    float _2057 = _2039;
    float _2059 = _2037;
    float _2061 = _2041;
    float _2063 = _1794;
    if (!_1929)
    {
        float _2065 = fma(_1184, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2039);
        _2057 = _2065;
    }
    float _2067 = _2057;
    if (!_1929)
    {
        float _2069 = fma(_1186, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2037);
        _2059 = _2069;
    }
    float _2071 = _2059;
    if (!_1929)
    {
        float _2073 = fma(_1188, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2041);
        _2061 = _2073;
    }
    float _2075 = _2061;
    float _2077 = _1102 * _2067;
    float _2079 = -_2067;
    float _2081 = _1078 * _2079;
    float _2083 = _1080 * _2067;
    float _2085 = fma(_1132, _2071, _2077);
    float _2087 = fma(_2055, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2089 = precise::clamp(_2087, 0.0, 1.0);
    float _2091 = fma(_1100, _2071, _2081);
    float _2093 = fma(_1142, _2071, _2083);
    float _2095 = fma(_1136, _2075, _2085);
    float _2097 = fma(_2089, -2.0, 3.0);
    float _2099 = _2089 * _2089;
    float _2101 = fma(_1112, _2075, _2091);
    float _2103 = _2095 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2105 = _2095 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2107 = _2099 * _2097;
    float _2109 = fma(_1144, _2075, _2093);
    float _2111 = fma(_2101, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2103);
    float _2113 = _2103;
    if (!_1666)
    {
        _2113 = 1.0;
    }
    float _2115 = _2113;
    float _2117 = fma(_2101, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2105);
    float _2119 = _2095 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    bool _2121 = _1470 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2123 = isnan(_1470);
    bool _2125 = _2121 || _2123;
    bool _2127 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2129 = _2125 || _2127;
    float _2131 = fma(_2109, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2117);
    float _2133 = fma(_2101, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2119);
    float _2135 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1901);
    float _2137 = fma(_2109, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2133);
    float _2139 = fma(_2109, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2111);
    out.m_81.x = _2137;
    out.m_81.y = _2139;
    out.m_81.z = _2131;
    float _2141 = _2115;
    float _2143 = _2135;
    if (_1666)
    {
        bool _2145 = _1768 >= _1290;
        bool _2147 = isnan(_1768);
        bool _2149 = _2145 || _2147;
        bool _2151 = isnan(_1290);
        bool _2153 = _2149 || _2151;
        float _2155 = float(_2153);
        _2141 = _2155;
    }
    float _2157 = _2141;
    float _2159 = -_2107;
    float _2161 = _2159 + 1.0;
    float _2163 = fma(_2161, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2107);
    bool _2165 = _862 <= 8000.0;
    bool _2167 = isnan(_862);
    bool _2169 = _2165 || _2167;
    bool _2171 = isnan(8000.0);
    bool _2173 = _2169 || _2171;
    float _2175 = float(_2173);
    float _2177 = _2135 + _1750;
    float _2179 = _2157 * _1446;
    float _2181 = _2175 * _2163;
    float _2183 = _2177 * 0.5;
    out.gl_Position.x = _1792;
    out.gl_Position.y = _1794;
    out.gl_Position.z = _2135;
    out.gl_Position.w = _1750;
    float _2185 = _2181 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_83.z = _2183;
    out.m_83.w = _1750;
    float _2187 = -_1806;
    float _2189 = _2187 + 1.0;
    float _2191 = -_2051;
    float _2193 = _2191 + 1.0;
    float _2195 = _2189 * _2185;
    float _2197 = precise::clamp(_2195, 0.0, 1.0);
    float _2199 = _2193;
    if (!_2129)
    {
        _1764 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2201 = _1764;
    float _2203 = _2201;
    float _2205 = _2201;
    if (!_2129)
    {
        _2143 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2207 = _2143;
    float _2209 = -_2197;
    float _2211 = fma(_2209, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2213 = _2207;
    float _2215 = _2207;
    if (!_2129)
    {
        _2063 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2217 = _2063;
    float _2219 = -_2179;
    float _2221 = fma(_2219, _2211, 1.0);
    float _2223 = precise::clamp(_2221, 0.0, 1.0);
    float _2225 = _2051 * _1822;
    float _2227 = _2223 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2229 = _2223;
    float _2231 = _2217;
    float _2233 = _2217;
    if (!_2129)
    {
        _2229 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2235 = _2229;
    float _2237 = _1837 * _2225;
    float _2239 = _1837 * _2193;
    out.m_85.x = _2227;
    float _2241 = _2237;
    float _2243 = _2235;
    float _2245 = _2235;
    if (!_2129)
    {
        _2199 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2247 = _2199;
    float _2249 = _1845 * _2225;
    float _2251 = fma(_1841, _2237, _1831);
    float _2253 = fma(_1843, _2237, _1833);
    float _2255 = _2247;
    float _2257 = _2247;
    if (!_2129)
    {
        _2241 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2259 = _2241;
    float _2261 = fma(_1837, _2249, _1835);
    out.m_87.x = _2251;
    out.m_87.y = _2253;
    out.m_87.z = _2261;
    out.m_87.w = _2239;
    bool _2263 = !_2129;
    float _2265 = _2259;
    float _2267 = _2259;
    if (!_2263)
    {
        bool _2269 = _1470 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2271 = isnan(_1470);
        bool _2273 = _2269 || _2271;
        bool _2275 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2277 = _2273 || _2275;
        if (!_2277)
        {
            float _2279 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2281 = _1470 + _2279;
            float _2283 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2285 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2283;
            float _2287 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2289 = _2287 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2291 = 1.0 / _2285;
            float _2293 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2295 = _2293 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2297 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2299 = _2297 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2301 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2303 = _2301 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2305 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2307 = _2305 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2309 = _2281 * _2291;
            float _2311 = precise::clamp(_2309, 0.0, 1.0);
            float _2313 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2315 = _2313 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2317 = fma(_2311, _2289, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2319 = fma(_2311, _2315, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2321 = fma(_2311, _2295, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2323 = fma(_2311, _2299, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2325 = fma(_2311, _2303, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2327 = fma(_2311, _2307, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2245 = _2321;
            _2233 = _2325;
            _2267 = _2317;
            _2215 = _2323;
            _2205 = _2319;
            _2257 = _2327;
            _2329 = true;
        }
        else
        {
            bool _2331 = _1470 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2333 = isnan(_1470);
            bool _2335 = _2331 || _2333;
            bool _2337 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2339 = _2335 || _2337;
            if (!_2339)
            {
                _2265 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2341 = _2265;
            _2267 = _2341;
            if (!_2339)
            {
                _2243 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2343 = _2243;
            _2245 = _2343;
            if (!_2339)
            {
                _2203 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2345 = _2203;
            _2205 = _2345;
            if (!_2339)
            {
                _2213 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2347 = _2213;
            _2215 = _2347;
            if (!_2339)
            {
                _2231 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2349 = _2231;
            _2233 = _2349;
            if (!_2339)
            {
                _2255 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2351 = _2255;
            bool _2353 = !_2339;
            _2257 = _2351;
            if (!_2353)
            {
                bool _2355 = _1470 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2357 = isnan(_1470);
                bool _2359 = _2355 || _2357;
                bool _2361 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2363 = _2359 || _2361;
                if (!_2363)
                {
                    float _2365 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2367 = _1470 + _2365;
                    float _2369 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2371 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2369;
                    float _2373 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2375 = _2373 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2377 = 1.0 / _2371;
                    float _2379 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2381 = _2379 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2383 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2385 = _2383 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2387 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2389 = _2387 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2391 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2393 = _2391 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2395 = _2367 * _2377;
                    float _2397 = precise::clamp(_2395, 0.0, 1.0);
                    float _2399 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2401 = _2399 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2403 = fma(_2397, _2375, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2405 = fma(_2397, _2401, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2407 = fma(_2397, _2381, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2409 = fma(_2397, _2385, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2411 = fma(_2397, _2389, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2413 = fma(_2397, _2393, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2245 = _2407;
                    _2233 = _2411;
                    _2267 = _2403;
                    _2215 = _2409;
                    _2205 = _2405;
                    _2257 = _2413;
                    _2329 = true;
                }
                else
                {
                    _2245 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2233 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2267 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2215 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2205 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2257 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2329 = false;
    float _2415 = _2245;
    float _2417 = _2233;
    float _2419 = _2267;
    float _2421 = _2215;
    float _2423 = _2205;
    float _2425 = _2257;
    float _2427 = fma(_2139, -0.5, 0.5);
    float _2429 = precise::clamp(_2427, 0.0, 1.0);
    float _2431 = -_2415;
    float _2433 = _2431 + _2417;
    float _2435 = -_2419;
    float _2437 = _2435 + _2421;
    float _2439 = -_2423;
    float _2441 = _2439 + _2425;
    bool _2443 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2445 = fma(_2429, _2433, _2415);
    float _2447 = fma(_2429, _2437, _2419);
    float _2449 = fma(_2429, _2441, _2423);
    float _2451 = _2445 * 0.586610972881317138671875;
    out.m_61.x = 1.0;
    float _2453 = fma(_2447, 0.298911988735198974609375, _2451);
    float _2455 = fma(_2449, 0.114477999508380889892578125, _2453);
    out.m_89.x = 0.0;
    float _2457 = -_2455;
    float _2459 = _2447 + _2457;
    float _2461 = -_2455;
    float _2463 = _2445 + _2461;
    float _2465 = -_2455;
    float _2467 = _2449 + _2465;
    float _2469 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2471 = fma(_2459, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2455);
    float _2473 = fma(_2463, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2455);
    float _2475 = fma(_2467, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2455);
    out.m_91.x = 0.0;
    out.m_85.w = _2469;
    out.m_93.x = _2471;
    out.m_93.y = _2473;
    out.m_93.z = _2475;
    if (!_2443)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2477 = -_1362;
    float _2479 = _2477 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2481 = -_1364;
    float _2483 = _2481 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2485 = -_1366;
    float _2487 = _2485 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2489 = _2479 * _2479;
    float _2491 = fma(_2483, _2483, _2489);
    float _2493 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
    float _2495 = precise::clamp(_2493, 0.0, 1.0);
    float _2497 = fma(_2487, _2487, _2491);
    float _2499 = _2495 * _2495;
    float _2501 = rsqrt(_2497);
    float _2503 = _2479 * _2501;
    float _2505 = _2483 * _2501;
    float _2507 = _2487 * _2501;
    float _2509 = sqrt(_2497);
    float _2511 = -_1476;
    float _2513 = _2511 + _2503;
    float _2515 = -_1472;
    float _2517 = _2515 + _2505;
    float _2519 = -_1474;
    float _2521 = _2519 + _2507;
    float _2523 = _2513 * _2513;
    float _2525 = fma(_2517, _2517, _2523);
    float _2527 = fma(_2521, _2521, _2525);
    float _2529 = -_2509;
    float _2531 = _2529 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2533 = rsqrt(_2527);
    float _2535 = _2531 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2537 = precise::clamp(_2535, 0.0, 1.0);
    float _2539 = abs(_2537);
    float _2541 = log2(_2539);
    float _2543 = _2499 + (-1.0);
    float _2545 = _2513 * _2533;
    float _2547 = _2517 * _2533;
    float _2549 = _2521 * _2533;
    float _2551 = _2139 * _2545;
    float _2553 = _2139 * _2503;
    float _2555 = fma(_2137, _2547, _2551);
    float _2557 = _2541 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2559 = fma(_2137, _2505, _2553);
    float _2561 = fma(_2131, _2549, _2555);
    float _2563 = precise::clamp(_2561, 0.0, 1.0);
    float _2565 = fma(_2131, _2507, _2559);
    float _2567 = precise::clamp(_2565, 0.0, 1.0);
    float _2569 = exp2(_2557);
    float _2571 = _2563 * _2563;
    float _2573 = _2505 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2575 = fma(_2571, _2543, 1.0);
    float _2577 = -_2503;
    float _2579 = -_2573;
    float _2581 = fma(_2577, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2579);
    float _2583 = _2575 * _2575;
    float _2585 = -_2507;
    float _2587 = fma(_2585, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2581);
    float _2589 = 1.0 / _2583;
    float _2591 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2593 = _2587 + _2591;
    float _2595 = _2593 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2597 = precise::clamp(_2595, 0.0, 1.0);
    float _2599 = _2569 * _2597;
    float _2601 = _2567 * _2599;
    float _2603 = _2499 * _2589;
    float _2605 = _2601 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2607 = _2601 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2609 = _2601 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    float _2611 = _2601 * _2603;
    float _2613 = _2611 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2615 = _2611 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2617 = _2611 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_89.x = _2605;
    out.m_89.y = _2607;
    out.m_89.z = _2609;
    out.m_91.x = _2613;
    out.m_91.y = _2615;
    out.m_91.z = _2617;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2329 = false;
    bool _363 = false;
    bool _193 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _111 = in.m_58.w;
    float _113 = trunc(_111);
    int _115 = int(_113);
    bool _119 = _115 >= 1;
    float _121 = 0.0;
    if (!_119)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _123 = _121;
    float _125 = _123;
    if (!_119)
    {
        out.m_61.x = 0.0;
    }
    int _127 = 0;
    if (!_119)
    {
        float _129 = _123 * 5.0;
        _127 = as_type<int>(_129);
    }
    int _131 = _127;
    if (!_119)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2673 = as_type<float>(_131);
        out.gl_Position.z = _2673;
    }
    if (!_119)
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
    float _149 = _147;
    if (_143)
    {
        float _151 = float(_115);
        _125 = _151;
    }
    float _153 = _125;
    bool _155 = _147 >= _153;
    bool _157 = !_143;
    bool _159 = _155 || _157;
    float _161 = _153;
    if (_159)
    {
        _161 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _163 = _161;
    if (_159)
    {
        out.m_61.x = 0.0;
    }
    int _165 = 0;
    if (_159)
    {
        float _167 = _163 * 5.0;
        _165 = as_type<int>(_167);
    }
    int _169 = _165;
    if (_159)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2743 = as_type<float>(_169);
        out.gl_Position.z = _2743;
    }
    if (_159)
    {
        return out;
    }
    bool _171 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _173 = !_171;
    float _191;
    if (!_173)
    {
        float _175 = in.m_65.x;
        float _177 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _179 = _175 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _181 = fma(_179, (*spvDescriptorSet0.vp_c9)._m0[12].x, _147);
        float _183 = _181 * _177;
        float _185 = floor(_183);
        float _187 = -_185;
        float _189 = _183 + _187;
        _191 = _189;
        _193 = true;
    }
    else
    {
        float _195 = float(_115);
        float _197 = 1.0 / _195;
        float _199 = _147 * _197;
        _191 = _199;
    }
    _193 = false;
    float _201 = _191;
    float _203 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _205 = _201 + _203;
    bool _207 = _201 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _209 = isnan(_201);
    bool _211 = _207 || _209;
    bool _213 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _215 = _211 || _213;
    float _217 = float(_215);
    float _219 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _221 = _201 + _219;
    bool _223 = _201 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _225 = isnan(_201);
    bool _227 = _223 || _225;
    bool _229 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _231 = _227 || _229;
    float _233 = float(_231);
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _237 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _235;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _241 = _239 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _243 = _201 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _245 = isnan(_201);
    bool _247 = _243 || _245;
    bool _249 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _251 = _247 || _249;
    float _253 = float(_251);
    float _255 = -_217;
    float _257 = _255 + 1.0;
    float _259 = 1.0 / _237;
    float _261 = _253 * _257;
    float _263 = -_253;
    float _265 = _263 + 1.0;
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _269 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _267;
    bool _271 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _273 = 1.0 / _241;
    float _275 = _233 * _265;
    float _277 = -_233;
    float _279 = _277 + 1.0;
    float _281 = _205 * _259;
    float _283 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _285 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _283;
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _289 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _287;
    float _291 = fma(_269, _281, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _293 = fma(_285, _281, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _295 = fma(_289, _281, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _297 = _221 * _273;
    float _299 = _291 * _275;
    float _301 = _293 * _275;
    float _303 = _295 * _275;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _307 = _305 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _311 = _309 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _315 = _313 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _317 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[143].x, _299);
    float _319 = fma(_307, _297, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _321 = fma(_311, _297, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _323 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[143].y, _301);
    float _325 = fma(_315, _297, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _327 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[143].z, _303);
    float _329 = fma(_319, _261, _317);
    float _331 = fma(_321, _261, _323);
    float _333 = fma(_325, _261, _327);
    float _335 = fma(_217, (*spvDescriptorSet0.vp_c9)._m0[145].x, _329);
    float _337 = fma(_217, (*spvDescriptorSet0.vp_c9)._m0[145].y, _331);
    float _339 = fma(_217, (*spvDescriptorSet0.vp_c9)._m0[145].z, _333);
    bool _341 = !_271;
    int _343 = as_type<int>(_329);
    float _361;
    if (!_341)
    {
        float _345 = in.m_65.x;
        float _347 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _349 = _345 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _351 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[11].x, _147);
        float _353 = _351 * _347;
        float _355 = floor(_353);
        float _357 = -_355;
        float _359 = _353 + _357;
        _361 = _359;
        _363 = true;
    }
    else
    {
        float _365 = float(_115);
        float _367 = 1.0 / _365;
        float _369 = _147 * _367;
        _361 = _369;
    }
    _363 = false;
    float _371 = _361;
    int _373 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _375 = _373;
    int _377 = 0;
    int _379 = _106(_375, _377, (*spvDescriptorSet0.support_buffer));
    float _381 = in.m_58.x;
    float _383 = in.m_58.y;
    float _385 = in.m_58.z;
    float _387 = in.m_67.z;
    float _389 = _383 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _391 = _383 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _393 = _383 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _395 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[5].x, _389);
    float _397 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[4].x, _391);
    float _399 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[6].x, _393);
    float _401 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[5].z, _395);
    float _403 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _405 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[4].z, _397);
    float _407 = _401 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _409 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[6].z, _399);
    float _411 = _405 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _413 = _407 + _403;
    float _415 = _409 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _417 = _413 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _419 = _413 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _421 = fma(_411, (*spvDescriptorSet0.vp_c15)._m0[126].x, _417);
    float _423 = fma(_411, (*spvDescriptorSet0.vp_c15)._m0[127].x, _419);
    float _425 = fma(_415, (*spvDescriptorSet0.vp_c15)._m0[126].z, _421);
    float _427 = fma(_415, (*spvDescriptorSet0.vp_c15)._m0[127].z, _423);
    float _429 = _425 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _431 = _427 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _433 = trunc(_429);
    int _435 = int(_433);
    float _437 = trunc(_431);
    int _439 = int(_437);
    int _441 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _443 = _435 + _441;
    int _445 = _443 + 1;
    bool _447 = _445 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _449 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _451 = _439 + _449;
    int _453 = _451 + 1;
    int _455 = _445 | _453;
    bool _457 = _455 < 0;
    bool _459 = _457 || _447;
    float _461 = in.m_65.x;
    float _463 = in.m_65.y;
    float _465 = in.m_65.z;
    bool _467 = _453 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _469 = _467 || _459;
    int _471 = _445;
    int _473 = _453;
    float _475 = _407;
    float _477 = _413;
    if (!_469)
    {
        int _479 = _453 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _481 = _479 + _445;
        _471 = _481;
    }
    int _483 = _471;
    float _485 = (*spvDescriptorSet0.vp_c9)._m0[144].y;
    if (!_469)
    {
        float _487 = floor(_431);
        _485 = _487;
    }
    float _489 = _485;
    if (!_469)
    {
        int _491 = _483 << 2;
        _473 = _491;
    }
    int _493 = _473;
    int _495 = _493;
    if (!_469)
    {
        uint _498 = uint(int(uint(_483) >> uint(2)));
        _343 = int(_498);
    }
    int _500 = _343;
    if (!_469)
    {
        int _502 = 12 & _493;
        _495 = _502;
    }
    int _504 = _495;
    float _506 = 0.0;
    if (!_469)
    {
        float _508 = floor(_429);
        _506 = _508;
    }
    float _510 = _506;
    int _512 = 0;
    if (!_469)
    {
        int _514 = _500 << 4;
        int _516 = _514 + _504;
        _512 = _516;
    }
    int _518 = _512;
    float _520 = _461 * 8.0;
    float _522 = 0.0;
    if (!_469)
    {
        float _524 = -_489;
        float _526 = _431 + _524;
        _522 = _526;
    }
    float _528 = _522;
    float _530 = 0.0;
    if (!_469)
    {
        int _532 = _518 + 400;
        uint _534 = uint(int(uint(_532) >> uint(2)));
        uint _536 = uint(int(uint(int(_534)) >> uint(2)));
        int _538 = int(_534) & 3;
        float _540 = (*spvDescriptorSet0.vp_c15)._m0[int(_536)][_538];
        _530 = _540;
    }
    float _542 = _530;
    float _544 = rint(_520);
    float _546 = 0.0;
    if (!_469)
    {
        float _548 = -_510;
        float _550 = _429 + _548;
        _546 = _550;
    }
    float _552 = _546;
    float _554 = _544 * 0.125;
    float _556 = precise::clamp(_554, 0.0, 1.0);
    float _558 = _542;
    if (!_469)
    {
        float _560 = rint(_542);
        float _562 = precise::max(_560, 0.0);
        uint _564 = uint(_562);
        uint _566 = clamp(_564, 0u, 65535u);
        _558 = as_type<float>(_566);
    }
    float _568 = _558;
    int _570 = _379 + (-1);
    float _572 = float(_570);
    float _574 = _556 * _572;
    float _576 = trunc(_387);
    int _578 = int(_576);
    float _580 = trunc(_574);
    int _582 = int(_580);
    int _584 = _582 + 1;
    int _586 = min(_570, _584);
    int _588 = _582;
    int _590 = 0;
    int _592 = _107(_588, _590, (*spvDescriptorSet0.support_buffer));
    int _594 = _578;
    int _596 = 0;
    int _598 = _107(_594, _596, (*spvDescriptorSet0.support_buffer));
    float3 _602 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_592, _598)), 0).xyz;
    float _604 = _602.x;
    float _606 = _602.y;
    float _608 = _602.z;
    int _610 = _586;
    int _612 = 0;
    int _614 = _107(_610, _612, (*spvDescriptorSet0.support_buffer));
    int _616 = _578;
    int _618 = 0;
    int _620 = _107(_616, _618, (*spvDescriptorSet0.support_buffer));
    float3 _622 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_614, _620)), 0).xyz;
    float _624 = _622.x;
    float _626 = _622.y;
    float _628 = _622.z;
    float _630 = _528;
    if (!_469)
    {
        float3 _3456 = float3(_552, _528, float(as_type<int>(_568)));
        float3 _3460 = select(_3456, float3(0.0), isnan(_3456));
        float _632 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _3460.xy, uint(rint(_3460.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _3460.xy, uint(rint(_3460.z)), level(0.0)).x;
        _630 = _632;
    }
    float _634 = _630;
    float _636 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _638 = log2(_636);
    float _640 = _465 * 2.0;
    float _642 = _407 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _644 = _461 * 2.0;
    float _646 = _463 * 2.0;
    float _648 = fma(_411, (*spvDescriptorSet0.vp_c8)._m0[11].x, _642);
    int _650 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _652 = _650 != 0;
    int _654 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _656 = _654 != 0;
    int _658 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _660 = _658 != 0;
    float _662 = floor(_640);
    float _664 = _463 + _465;
    float _666 = _465 + _461;
    float _668 = _461 + (-0.5);
    float _670 = _664 + (-1.0);
    float _672 = _666 + (-1.0);
    float _674 = _638 * _147;
    float _676 = fma(_415, (*spvDescriptorSet0.vp_c8)._m0[11].z, _648);
    float _678 = _465 + (-0.5);
    float _680 = floor(_644);
    float _682 = _463 + _461;
    float _684 = _407 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _686 = _662 > 0.0;
    float _688 = fma(_411, (*spvDescriptorSet0.vp_c8)._m0[10].x, _684);
    bool _690 = _662 >= 0.0;
    bool _692 = isnan(_662);
    bool _694 = _690 || _692;
    bool _696 = isnan(0.0);
    bool _698 = _694 || _696;
    float _700 = exp2(_674);
    float _702 = _676 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _704 = fma(_415, (*spvDescriptorSet0.vp_c8)._m0[10].z, _688);
    float _706 = _463 + (-0.5);
    int _708 = _698 ? 0 : 1;
    float _710 = _682 + (-1.0);
    float _712 = 1.0 / _702;
    float _714 = fma(_670, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _716 = _704 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _718 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _720 = 1.0 + _718;
    bool _722 = _680 >= 0.0;
    bool _724 = isnan(_680);
    bool _726 = _722 || _724;
    bool _728 = isnan(0.0);
    bool _730 = _726 || _728;
    float _732 = fma(_710, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _734 = _716 + _702;
    bool _736 = _680 > 0.0;
    float _738 = floor(_646);
    int _740 = ~_708;
    int _742 = _740 + 1;
    int _744 = _742 + 1;
    float _746 = -_700;
    float _748 = _746 + 1.0;
    int _750 = _744;
    if (!_686)
    {
        int _752 = ~_708;
        int _754 = _752 + 1;
        _750 = _754;
    }
    int _756 = _750;
    bool _758 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _760 = isnan(1.0);
    bool _762 = _758 || _760;
    bool _764 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _766 = _762 || _764;
    int _768 = _730 ? 0 : 1;
    float _770 = 1.0 / _720;
    float _772 = _734 * _712;
    float _774 = _772 * 0.5;
    bool _776 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _778 = isnan(0.0);
    bool _780 = _776 || _778;
    bool _782 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _784 = _780 || _782;
    bool _786 = !_652;
    int _788 = _786 ? 0 : 1;
    float _790 = _784 ? _748 : 0.0;
    float _792 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _794 = fma(_774, (*spvDescriptorSet0.vp_c8)._m0[30].w, _792);
    bool _796 = _738 > 0.0;
    bool _798 = _738 >= 0.0;
    bool _800 = isnan(_738);
    bool _802 = _798 || _800;
    bool _804 = isnan(0.0);
    bool _806 = _802 || _804;
    int _808 = abs(_788);
    float _810 = 1.0 / _794;
    float _812 = in.m_69.x;
    float _814 = in.m_69.y;
    float _816 = in.m_69.z;
    if (_766)
    {
        float _818 = _790 * _770;
        _149 = _818;
    }
    float _820 = _149;
    bool _822 = !_656;
    int _824 = _822 ? 0 : 1;
    int _826 = abs(_824);
    float _828 = float(_808);
    float _830 = float(_756);
    bool _832 = !_660;
    int _834 = _832 ? 0 : 1;
    int _836 = ~_768;
    int _838 = _836 + 1;
    int _840 = _838 + 1;
    float _842 = _828 * _830;
    int _844 = _840;
    if (!_736)
    {
        int _846 = ~_768;
        int _848 = _846 + 1;
        _844 = _848;
    }
    int _850 = _844;
    int _852 = abs(_834);
    float _854 = float(_826);
    float _856 = _842 * (-2.0);
    float _858 = float(_850);
    float _860 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _862 = _810 * _860;
    int _864 = _806 ? 0 : 1;
    float _866 = fma(_856, _812, _812);
    float _868 = fma(_732, _856, _732);
    float _870 = _854 * _858;
    bool _872 = _862 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _874 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[196].x, _866);
    bool _876 = _862 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _878 = _870 * (-2.0);
    int _880 = ~_864;
    int _882 = _880 + 1;
    int _884 = _882 + 1;
    float _886 = fma(_868, _820, _874);
    int _888 = _884;
    if (!_796)
    {
        int _890 = ~_864;
        int _892 = _890 + 1;
        _888 = _892;
    }
    int _894 = _888;
    float _896 = fma(_714, _878, _714);
    float _898 = fma(_878, _814, _814);
    float _900 = float(_852);
    float _902 = _886 * 0.15915493667125701904296875;
    float _904 = float(_894);
    float _906 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[196].y, _898);
    bool _908 = !_872;
    int _910 = _908 ? 0 : 1;
    float _912 = _902 * 6.283185482025146484375;
    float _914 = sin(_912);
    float _916 = _900 * _904;
    int _918 = 2;
    if (!_872)
    {
        _918 = 1;
    }
    int _920 = _918;
    float _922 = fma(_896, _820, _906);
    int _924 = _920;
    if (!_876)
    {
        _924 = _910;
    }
    int _926 = _924;
    float _928 = _916 * (-2.0);
    float _930 = _922 * 0.15915493667125701904296875;
    int _932 = _926 << 6;
    float _934 = fma(_928, _816, _816);
    float _936 = _902 * 6.283185482025146484375;
    float _938 = cos(_936);
    float _940 = fma(_672, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _942 = _932 + 56;
    uint _944 = uint(int(uint(_942) >> uint(2)));
    uint _946 = uint(int(uint(int(_944)) >> uint(2)));
    int _948 = int(_944) & 3;
    float _950 = (*spvDescriptorSet0.vp_c15)._m0[int(_946)][_948];
    int _952 = int(_944) + 1;
    uint _954 = uint(int(uint(_952) >> uint(2)));
    int _956 = _952 & 3;
    float _958 = (*spvDescriptorSet0.vp_c15)._m0[int(_954)][_956];
    float _960 = fma(_678, (*spvDescriptorSet0.vp_c9)._m0[196].z, _934);
    float _962 = fma(_940, _928, _940);
    float _964 = in.m_71.x;
    float _966 = in.m_71.y;
    float _968 = in.m_71.z;
    float _970 = _930 * 6.283185482025146484375;
    float _972 = sin(_970);
    float _974 = fma(_962, _820, _960);
    int _976 = _932 + 48;
    uint _978 = uint(int(uint(_976) >> uint(2)));
    uint _980 = uint(int(uint(int(_978)) >> uint(2)));
    int _982 = int(_978) & 3;
    float _984 = (*spvDescriptorSet0.vp_c15)._m0[int(_980)][_982];
    int _986 = int(_978) + 1;
    uint _988 = uint(int(uint(_986) >> uint(2)));
    int _990 = _986 & 3;
    float _992 = (*spvDescriptorSet0.vp_c15)._m0[int(_988)][_990];
    float _994 = _974 * 0.15915493667125701904296875;
    float _996 = _930 * 6.283185482025146484375;
    float _998 = cos(_996);
    int _1000 = _932 + 80;
    uint _1002 = uint(int(uint(_1000) >> uint(2)));
    uint _1004 = uint(int(uint(int(_1002)) >> uint(2)));
    int _1006 = int(_1002) & 3;
    float _1008 = (*spvDescriptorSet0.vp_c15)._m0[int(_1004)][_1006];
    int _1010 = int(_1002) + 1;
    uint _1012 = uint(int(uint(_1010) >> uint(2)));
    int _1014 = _1010 & 3;
    float _1016 = (*spvDescriptorSet0.vp_c15)._m0[int(_1012)][_1014];
    float _1018 = _994 * 6.283185482025146484375;
    float _1020 = cos(_1018);
    float _1022 = _938 * _972;
    int _1024 = _932 + 88;
    uint _1026 = uint(int(uint(_1024) >> uint(2)));
    uint _1028 = uint(int(uint(int(_1026)) >> uint(2)));
    int _1030 = int(_1026) & 3;
    float _1032 = (*spvDescriptorSet0.vp_c15)._m0[int(_1028)][_1030];
    int _1034 = int(_1026) + 1;
    uint _1036 = uint(int(uint(_1034) >> uint(2)));
    int _1038 = _1034 & 3;
    float _1040 = (*spvDescriptorSet0.vp_c15)._m0[int(_1036)][_1038];
    float _1042 = _339 * _968;
    float _1044 = floor(_574);
    float _1046 = _337 * _966;
    int _1048 = _932 + 64;
    uint _1050 = uint(int(uint(_1048) >> uint(2)));
    uint _1052 = uint(int(uint(int(_1050)) >> uint(2)));
    int _1054 = int(_1050) & 3;
    float _1056 = (*spvDescriptorSet0.vp_c15)._m0[int(_1052)][_1054];
    int _1058 = int(_1050) + 1;
    uint _1060 = uint(int(uint(_1058) >> uint(2)));
    int _1062 = _1058 & 3;
    float _1064 = (*spvDescriptorSet0.vp_c15)._m0[int(_1060)][_1062];
    float _1066 = _914 * _972;
    float _1068 = _914 * _998;
    float _1070 = _938 * _998;
    float _1072 = _335 * _964;
    float _1074 = _1046 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1076 = _994 * 6.283185482025146484375;
    float _1078 = sin(_1076);
    float _1080 = _914 * _1020;
    int _1082 = _932 + 96;
    uint _1084 = uint(int(uint(_1082) >> uint(2)));
    uint _1086 = uint(int(uint(int(_1084)) >> uint(2)));
    int _1088 = int(_1084) & 3;
    float _1090 = (*spvDescriptorSet0.vp_c15)._m0[int(_1086)][_1088];
    int _1092 = int(_1084) + 1;
    uint _1094 = uint(int(uint(_1092) >> uint(2)));
    int _1096 = _1092 & 3;
    float _1098 = (*spvDescriptorSet0.vp_c15)._m0[int(_1094)][_1096];
    float _1100 = _998 * _1020;
    float _1102 = _938 * _1020;
    float _1104 = _1072 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1106 = _1042 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1108 = -_1044;
    float _1110 = _574 + _1108;
    float _1112 = _972 * _1020;
    int _1114 = _932 + 72;
    uint _1116 = uint(int(uint(_1114) >> uint(2)));
    uint _1118 = uint(int(uint(int(_1116)) >> uint(2)));
    int _1120 = int(_1116) & 3;
    float _1122 = (*spvDescriptorSet0.vp_c15)._m0[int(_1118)][_1120];
    int _1124 = int(_1116) + 1;
    uint _1126 = uint(int(uint(_1124) >> uint(2)));
    int _1128 = _1124 & 3;
    float _1130 = (*spvDescriptorSet0.vp_c15)._m0[int(_1126)][_1128];
    float _1132 = fma(_1078, _1070, _1066);
    float _1134 = -_1068;
    float _1136 = fma(_1078, _1022, _1134);
    float _1138 = _413 * _992;
    float _1140 = -_1022;
    float _1142 = fma(_1078, _1068, _1140);
    float _1144 = fma(_1078, _1066, _1070);
    float _1146 = fma(_411, _984, _1138);
    float _1148 = _413 * _1016;
    float _1150 = fma(_415, _950, _1146);
    float _1152 = fma(_411, _1008, _1148);
    float _1154 = _1150 + _958;
    float _1156 = fma(_415, _1032, _1152);
    float _1158 = _1156 + _1040;
    float _1160 = _413 * _1064;
    float _1162 = fma(_411, _1056, _1160);
    float _1164 = _413 * _1098;
    float _1166 = fma(_411, _1090, _1164);
    float _1168 = fma(_415, _1122, _1162);
    float _1170 = _1168 + _1130;
    float _1172 = -_606;
    float _1174 = _1172 + _626;
    float _1176 = -_604;
    float _1178 = _1176 + _624;
    float _1180 = -_608;
    float _1182 = _1180 + _628;
    float _1184 = fma(_1110, _1174, _606);
    float _1186 = fma(_1110, _1178, _604);
    float _1188 = fma(_1110, _1182, _608);
    float _1190 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1184);
    float _1192 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1186);
    int _1194 = _932 + 104;
    uint _1196 = uint(int(uint(_1194) >> uint(2)));
    uint _1198 = uint(int(uint(int(_1196)) >> uint(2)));
    int _1200 = int(_1196) & 3;
    float _1202 = (*spvDescriptorSet0.vp_c15)._m0[int(_1198)][_1200];
    int _1204 = int(_1196) + 1;
    uint _1206 = uint(int(uint(_1204) >> uint(2)));
    int _1208 = _1204 & 3;
    float _1210 = (*spvDescriptorSet0.vp_c15)._m0[int(_1206)][_1208];
    float _1212 = _1074 * _1190;
    float _1214 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1188);
    float _1216 = _1104 * _1192;
    float _1218 = _1102 * _1212;
    float _1220 = _1106 * _1214;
    float _1222 = -_1212;
    float _1224 = _1078 * _1222;
    float _1226 = _1080 * _1212;
    float _1228 = fma(_1132, _1216, _1218);
    float _1230 = fma(_1100, _1216, _1224);
    float _1232 = fma(_1142, _1216, _1226);
    float _1234 = fma(_1136, _1220, _1228);
    float _1236 = fma(_1112, _1220, _1230);
    float _1238 = fma(_1144, _1220, _1232);
    float _1240 = _1234 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1242 = _1234 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1244 = fma(_1236, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1240);
    float _1246 = fma(_1236, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1242);
    float _1248 = fma(_1238, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1244);
    float _1250 = fma(_1238, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1246);
    float _1252 = _415 + _1248;
    float _1254 = _411 + _1250;
    float _1256 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1258 = _1252 + _1256;
    float _1260 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1262 = _1254 + _1260;
    float _1264 = _1258 * _1258;
    float _1266 = fma(_1262, _1262, _1264);
    float _1268 = _1234 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1270 = sqrt(_1266);
    float _1272 = fma(_1236, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1268);
    float _1274 = fma(_415, _1202, _1166);
    float _1276 = fma(_1238, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1272);
    float _1278 = _1274 + _1210;
    float _1280 = _407 + _1276;
    float _1282 = 1.0 / _1278;
    bool _1284 = _1270 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1286 = _1154 * _1282;
    float _1288 = _1170 * _1282;
    float _1290 = _1158 * _1282;
    float _1292 = _1236;
    float _1294 = _1238;
    float _1296 = _1276;
    float _1298 = _1158;
    float _1300 = _1270;
    float _1302 = _1254;
    float _1304 = _1252;
    if (!_1284)
    {
        _1292 = _1254;
    }
    float _1306 = _1292;
    float _1308 = _1306;
    if (!_1284)
    {
        _1294 = _1252;
    }
    float _1310 = _1294;
    float _1312 = _1310;
    if (!_1284)
    {
        _1296 = _1280;
    }
    float _1314 = _1296;
    bool _1316 = !_1284;
    float _1318 = _1314;
    if (!_1316)
    {
        float _1320 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1322 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1324 = _1270 + _1322;
        float _1326 = _1280 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1328 = rsqrt(_1266);
        float _1330 = _1324 * _1320;
        float _1332 = _1330 * 0.15915493667125701904296875;
        float _1334 = _1332 * 6.283185482025146484375;
        float _1336 = cos(_1334);
        float _1338 = _1332 * 6.283185482025146484375;
        float _1340 = sin(_1338);
        float _1342 = _1336 + (-1.0);
        float _1344 = _1342 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1346 = fma(_1340, _1326, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1348 = fma(_1280, _1336, _1344);
        float _1350 = _1328 * _1346;
        float _1352 = fma(_1262, _1350, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1354 = fma(_1258, _1350, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1298 = _1350;
        _1300 = _1332;
        _1302 = _1346;
        _1318 = _1348;
        _1308 = _1352;
        _1312 = _1354;
    }
    float _1356 = _1298;
    float _1358 = _1300;
    float _1360 = _1302;
    float _1362 = _1318;
    float _1364 = _1308;
    float _1366 = _1312;
    float _1368 = _1360;
    float _1370 = _1358;
    float _1372 = _1356;
    if (_469)
    {
        _475 = 1.0;
    }
    float _1374 = _475;
    float _1376 = _1374;
    if (!_469)
    {
        int _1378 = _483 << 4;
        int _1380 = _1378 + 2048;
        uint _1382 = uint(int(uint(_1380) >> uint(2)));
        uint _1384 = uint(int(uint(int(_1382)) >> uint(2)));
        int _1386 = int(_1382) & 3;
        float _1388 = (*spvDescriptorSet0.vp_c15)._m0[int(_1384)][_1386];
        int _1390 = int(_1382) + 1;
        uint _1392 = uint(int(uint(_1390) >> uint(2)));
        int _1394 = _1390 & 3;
        float _1396 = (*spvDescriptorSet0.vp_c15)._m0[int(_1392)][_1394];
        int _1398 = _1380 + 8;
        uint _1400 = uint(int(uint(_1398) >> uint(2)));
        uint _1402 = uint(int(uint(int(_1400)) >> uint(2)));
        int _1404 = int(_1400) & 3;
        float _1406 = (*spvDescriptorSet0.vp_c15)._m0[int(_1402)][_1404];
        int _1408 = int(_1400) + 1;
        uint _1410 = uint(int(uint(_1408) >> uint(2)));
        int _1412 = _1408 & 3;
        float _1414 = (*spvDescriptorSet0.vp_c15)._m0[int(_1410)][_1412];
        float _1416 = _413 * _1396;
        float _1418 = fma(_411, _1388, _1416);
        float _1420 = fma(_415, _1406, _1418);
        float _1422 = _1420 + _1414;
        float _1424 = precise::clamp(_1422, 0.0, 1.0);
        float _1426 = -_1424;
        float _1428 = _1426 + _634;
        float _1430 = fma(_1428, 500.0, 1.5);
        float _1432 = exp2(_1430);
        float _1434 = 0.0 + _1432;
        float _1436 = precise::clamp(_1434, 0.0, 1.0);
        _1368 = _1414;
        _477 = _1420;
        _1370 = _1406;
        _1372 = _1388;
        _1376 = _1436;
    }
    float _1438 = _1368;
    float _1440 = _477;
    float _1442 = _1370;
    float _1444 = _1372;
    float _1446 = _1376;
    float _1448 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1450 = _1362 + _1448;
    float _1452 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1454 = _1364 + _1452;
    float _1456 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1458 = _1366 + _1456;
    float _1460 = _1450 * _1450;
    float _1462 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1464 = fma(_1454, _1454, _1460);
    float _1466 = fma(_1458, _1458, _1464);
    float _1468 = rsqrt(_1466);
    float _1470 = sqrt(_1466);
    float _1472 = _1454 * _1468;
    float _1474 = _1458 * _1468;
    float _1476 = _1450 * _1468;
    float _1478 = _1472 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1480 = _1474 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1482 = _1478 * _1478;
    float _1484 = _1480 * _1480;
    float _1486 = _1482 + _1484;
    float _1488 = sqrt(_1486);
    bool _1490 = _1488 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1492 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1494 = _1488 + _1492;
    float _1496 = _1438;
    float _1498 = _1444;
    float _1500 = _1494;
    float _1502 = (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1504 = _1468;
    float _1506 = _1486;
    if (_1490)
    {
        float _1508 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1496 = _1508;
    }
    float _1510 = _1496;
    if (_1490)
    {
        float _1512 = rsqrt(_1486);
        _1498 = _1512;
    }
    float _1514 = _1498;
    float _1516 = _1514;
    if (_1490)
    {
        float _1518 = _1494 * _1510;
        _1500 = _1518;
    }
    float _1520 = _1500;
    if (_1490)
    {
        float _1522 = _1520 * 0.15915493667125701904296875;
        _1304 = _1522;
    }
    float _1524 = _1304;
    float _1526 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    if (!_1490)
    {
        _1502 = _1478;
    }
    float _1528 = _1502;
    float _1530 = _1440;
    float _1532 = _1528;
    if (_1490)
    {
        float _1534 = _1524 * 6.283185482025146484375;
        float _1536 = sin(_1534);
        _1530 = _1536;
    }
    float _1538 = _1530;
    float _1540 = precise::max(0.0, _1526);
    float _1542 = -_1476;
    float _1544 = -_1540;
    float _1546 = fma(_1542, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1544);
    float _1548 = _1442;
    float _1550 = _1540;
    if (_1490)
    {
        float _1552 = _1524 * 6.283185482025146484375;
        float _1554 = cos(_1552);
        _1548 = _1554;
    }
    float _1556 = _1548;
    float _1558 = fma(_411, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1560 = _1558;
    if (_1490)
    {
        float _1562 = _1546 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1504 = _1562;
    }
    float _1564 = _1504;
    float _1566 = _1564;
    float _1568 = _1538;
    if (_1490)
    {
        float _1570 = fma(_1538, _1564, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1566 = _1570;
    }
    float _1572 = _1566;
    float _1574 = floor(_1558);
    float _1576 = _1572;
    if (_1490)
    {
        float _1578 = _1514 * _1572;
        _1506 = _1578;
    }
    float _1580 = _1506;
    if (!_1490)
    {
        _1576 = _1546;
    }
    float _1582 = _1576;
    float _1584 = _1582;
    if (!_1490)
    {
        _1516 = _1482;
    }
    float _1586 = _1516;
    float _1588 = _1586;
    float _1590 = _1556;
    if (_1490)
    {
        float _1592 = _1556 + (-1.0);
        _1568 = _1592;
    }
    float _1594 = _1568;
    float _1596 = _1594;
    if (_1490)
    {
        float _1598 = _1478 * _1580;
        _1532 = _1598;
    }
    float _1600 = _1532;
    float _1602 = _1362 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1604 = _1362 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1490)
    {
        float _1606 = _1594 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1550 = _1606;
    }
    float _1608 = _1550;
    if (!_1490)
    {
        _1596 = _1480;
    }
    float _1610 = _1596;
    float _1612 = _1610;
    if (_1490)
    {
        float _1614 = _1480 * _1580;
        _1612 = _1614;
    }
    float _1616 = _1612;
    if (_1490)
    {
        float _1618 = _1600 * _1600;
        _1588 = _1618;
    }
    float _1620 = _1588;
    if (_1490)
    {
        float _1622 = fma(_1546, _1556, _1608);
        _1584 = _1622;
    }
    float _1624 = _1584;
    if (!_1490)
    {
        _1590 = _1484;
    }
    float _1626 = _1590;
    float _1628 = _1626;
    if (_1490)
    {
        float _1630 = _1616 * _1616;
        _1628 = _1630;
    }
    float _1632 = _1628;
    bool _1634 = _1286 >= 0.0;
    float _1636 = fma(_1624, _1624, _1620);
    float _1638 = fma(_415, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1640 = _1362 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    bool _1642 = _1286 <= 1.0;
    bool _1644 = _1642 && _1634;
    float _1646 = _1636 + _1632;
    float _1648 = _1362 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    bool _1650 = _1288 >= 0.0;
    bool _1652 = _1650 && _1644;
    float _1654 = rsqrt(_1646);
    float _1656 = fma(_1364, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1602);
    float _1658 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1660 = fma(_1470, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1658);
    float _1662 = precise::clamp(_1660, 0.0, 1.0);
    bool _1664 = _1288 <= 1.0;
    bool _1666 = _1664 && _1652;
    float _1668 = fma(_1364, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1640);
    float _1670 = fma(_1364, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1648);
    float _1672 = -_1662;
    float _1674 = _1672 + 1.0;
    float _1676 = fma(_1366, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1656);
    float _1678 = fma(_1366, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1668);
    float _1680 = fma(_1364, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1604);
    float _1682 = -_1574;
    float _1684 = _1558 + _1682;
    float _1686 = fma(_1366, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1670);
    float _1688 = abs(_1674);
    float _1690 = log2(_1688);
    float _1692 = _1676 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1694 = fma(_1366, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1680);
    float _1696 = _1686 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    if (_1666)
    {
        float _1698 = float(_926);
        _1560 = _1698;
    }
    float _1700 = _1560;
    float _1702 = _1654 * _1600;
    float _1704 = _1692 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1706 = _1654 * _1624;
    float _1708 = _1694 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1710 = _1702 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1712 = _1700;
    if (_1666)
    {
        float _1714 = rint(_1700);
        float _1716 = precise::max(_1714, 0.0);
        uint _1718 = uint(_1716);
        uint _1720 = clamp(_1718, 0u, 65535u);
        _1712 = as_type<float>(_1720);
    }
    float _1722 = _1712;
    float _1724 = fma(_1696, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1704);
    float _1726 = _1654 * _1616;
    float _1728 = -_1710;
    float _1730 = fma(_1706, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1728);
    float _1732 = _1708 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1734 = _1678 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1736 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1724);
    float _1738 = -_1726;
    float _1740 = fma(_1738, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1730);
    float _1742 = floor(_1638);
    float _1744 = -_1732;
    float _1746 = fma(_1744, _1462, 1.0);
    float _1748 = _1690 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1750 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1736);
    float _1752 = fma(_1740, -0.5, 0.5);
    float _1754 = fma(_1740, 0.5, 0.5);
    float _1756 = _1692 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1758 = exp2(_1748);
    float _1760 = _1692 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1762 = 0.0;
    float _1764 = _1750;
    if (_1666)
    {
        float3 _5219 = float3(_1286, _1288, float(as_type<int>(_1722)));
        float3 _5221 = select(_5219, float3(0.0), isnan(_5219));
        float _1766 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5221.xy, uint(rint(_5221.z)), _1290, level(0.0));
        _1762 = _1766;
    }
    float _1768 = _1762;
    float _1770 = fma(_1754, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1772 = fma(_1696, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1756);
    float _1774 = fma(_1696, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1760);
    float _1776 = fma(_1754, _1770, -0.212114393711090087890625);
    float _1778 = log2(_1746);
    float _1780 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1772);
    float _1782 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1774);
    float _1784 = -_1742;
    float _1786 = _1638 + _1784;
    float _1788 = fma(_1754, _1776, 1.570728778839111328125);
    float _1790 = _1706 + 1.0;
    float _1792 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1780);
    float _1794 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1782);
    float _1796 = 1.0 / _1750;
    float _1798 = -_1706;
    float _1800 = fma(_1758, _1790, _1798);
    float _1802 = sqrt(_1752);
    float _1804 = _1778 * 0.693147182464599609375;
    float2 _5295 = float2(_1684, _1786);
    float _1806 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5295, float2(0.0), isnan(_5295)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5295, float2(0.0), isnan(_5295)), level(0.0)).x;
    float _1808 = fma(_1800, 0.5, 0.5);
    float _1810 = _1804 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1812 = _1792 * _1796;
    float _1814 = _1794 * _1796;
    float _1816 = fma(_1812, 0.5, 0.5);
    float _1818 = fma(_1814, -0.5, 0.5);
    float _1820 = _1802 * 0.636619746685028076171875;
    float3 _5325 = float3(_1816, _1818, _1810);
    float _1822 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5325, float3(0.0), isnan(_5325)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5325, float3(0.0), isnan(_5325)), level(0.0)).x;
    float _1824 = -_1788;
    float _1826 = fma(_1820, _1824, 1.0);
    float3 _5339 = float3(_1816, _1818, _1810);
    float4 _1829 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5339, float3(0.0), isnan(_5339)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5339, float3(0.0), isnan(_5339)), level(0.0)).xyzw;
    float _1831 = _1829.x;
    float _1833 = _1829.y;
    float _1835 = _1829.z;
    float _1837 = _1829.w;
    float2 _5355 = float2(_1826, _1808);
    float3 _1839 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5355, float2(0.0), isnan(_5355)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5355, float2(0.0), isnan(_5355)), level(0.0)).xyz;
    float _1841 = _1839.x;
    float _1843 = _1839.y;
    float _1845 = _1839.z;
    float _1847 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1849 = _371 + _1847;
    bool _1851 = _1184 != 0.0;
    bool _1853 = isnan(_1184);
    bool _1855 = _1851 || _1853;
    bool _1857 = isnan(0.0);
    bool _1859 = _1855 || _1857;
    float _1861 = _1690 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1863 = _1692 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1865 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1867 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1865;
    float _1869 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1871 = _1869 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _1873 = _371 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1875 = isnan(_371);
    bool _1877 = _1873 || _1875;
    bool _1879 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1881 = _1877 || _1879;
    float _1883 = float(_1881);
    float _1885 = fma(_1696, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1863);
    float _1887 = 1.0 / _1867;
    bool _1889 = _371 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1891 = isnan(_371);
    bool _1893 = _1889 || _1891;
    bool _1895 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1897 = _1893 || _1895;
    float _1899 = float(_1897);
    out.m_73.x = _1364;
    out.m_73.y = _1362;
    out.m_73.z = _1366;
    float _1901 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1885);
    float _1903 = -_1899;
    float _1905 = _1903 + 1.0;
    float _1907 = 1.0 / _1871;
    bool _1909 = _1186 == 0.0;
    bool _1911 = !_1859;
    bool _1913 = _1909 && _1911;
    float _1915 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1917 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1915;
    float _1919 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1921 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1919;
    float _1923 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _1925 = _1923 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    bool _1927 = _1188 == 0.0;
    bool _1929 = _1927 && _1913;
    float _1931 = _1849 * _1887;
    bool _1933 = _371 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _1935 = isnan(_371);
    bool _1937 = _1933 || _1935;
    bool _1939 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _1941 = _1937 || _1939;
    float _1943 = float(_1941);
    float _1945 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1947 = _371 + _1945;
    float _1949 = _1883 * _1905;
    float _1951 = fma(_1917, _1931, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1953 = fma(_1921, _1931, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1955 = -_1943;
    float _1957 = _1955 + 1.0;
    float _1959 = -_1883;
    float _1961 = _1959 + 1.0;
    float _1963 = _1947 * _1907;
    float _1965 = _1951 * _1949;
    float _1967 = _1899 * _1957;
    float _1969 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1971 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1969;
    float _1973 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _1975 = _1973 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _1977 = _1953 * _1949;
    float _1979 = fma(_1925, _1963, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _1981 = fma(_1971, _1931, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1983 = fma(_1975, _1963, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _1985 = exp2(_1861);
    float _1987 = _1981 * _1949;
    float _1989 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _1991 = _1989 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _1993 = fma(_1961, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1987);
    float _1995 = fma(_1991, _1963, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _1997 = fma(_1961, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1977);
    float _1999 = fma(_1961, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1965);
    float _2001 = fma(_1995, _1967, _1993);
    float _2003 = fma(_1979, _1967, _1997);
    float _2005 = fma(_1983, _1967, _1999);
    float _2007 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2009 = fma(_1943, (*spvDescriptorSet0.vp_c9)._m0[109].x, _2001);
    float _2011 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2013 = fma(_1943, (*spvDescriptorSet0.vp_c9)._m0[109].y, _2003);
    float _2015 = fma(_1943, (*spvDescriptorSet0.vp_c9)._m0[109].z, _2005);
    float _2017 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2019 = _2011 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2021 = _2013 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2023 = _2015 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2025 = abs(_862);
    float _2027 = log2(_2025);
    float _2029 = _2017 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2031 = _2021 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2033 = _2023 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2035 = _2007 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2037 = in.m_75.x;
    float _2039 = in.m_75.y;
    float _2041 = in.m_75.z;
    float _2043 = _2009 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2045 = -_1985;
    float _2047 = _2045 + 1.0;
    out.m_77.x = _2035;
    out.m_77.y = _2019;
    out.m_77.z = _2029;
    float _2049 = _2043 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2051 = _2047 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_79.x = _2049;
    out.m_79.y = _2031;
    out.m_79.z = _2033;
    float _2053 = _2027 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2055 = exp2(_2053);
    float _2057 = _2039;
    float _2059 = _2037;
    float _2061 = _2041;
    float _2063 = _1794;
    if (!_1929)
    {
        float _2065 = fma(_1184, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2039);
        _2057 = _2065;
    }
    float _2067 = _2057;
    if (!_1929)
    {
        float _2069 = fma(_1186, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2037);
        _2059 = _2069;
    }
    float _2071 = _2059;
    if (!_1929)
    {
        float _2073 = fma(_1188, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2041);
        _2061 = _2073;
    }
    float _2075 = _2061;
    float _2077 = _1102 * _2067;
    float _2079 = -_2067;
    float _2081 = _1078 * _2079;
    float _2083 = _1080 * _2067;
    float _2085 = fma(_1132, _2071, _2077);
    float _2087 = fma(_2055, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2089 = precise::clamp(_2087, 0.0, 1.0);
    float _2091 = fma(_1100, _2071, _2081);
    float _2093 = fma(_1142, _2071, _2083);
    float _2095 = fma(_1136, _2075, _2085);
    float _2097 = fma(_2089, -2.0, 3.0);
    float _2099 = _2089 * _2089;
    float _2101 = fma(_1112, _2075, _2091);
    float _2103 = _2095 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2105 = _2095 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2107 = _2099 * _2097;
    float _2109 = fma(_1144, _2075, _2093);
    float _2111 = fma(_2101, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2103);
    float _2113 = _2103;
    if (!_1666)
    {
        _2113 = 1.0;
    }
    float _2115 = _2113;
    float _2117 = fma(_2101, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2105);
    float _2119 = _2095 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    bool _2121 = _1470 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2123 = isnan(_1470);
    bool _2125 = _2121 || _2123;
    bool _2127 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2129 = _2125 || _2127;
    float _2131 = fma(_2109, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2117);
    float _2133 = fma(_2101, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2119);
    float _2135 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1901);
    float _2137 = fma(_2109, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2133);
    float _2139 = fma(_2109, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2111);
    out.m_81.x = _2137;
    out.m_81.y = _2139;
    out.m_81.z = _2131;
    float _2141 = _2115;
    float _2143 = _2135;
    if (_1666)
    {
        bool _2145 = _1768 >= _1290;
        bool _2147 = isnan(_1768);
        bool _2149 = _2145 || _2147;
        bool _2151 = isnan(_1290);
        bool _2153 = _2149 || _2151;
        float _2155 = float(_2153);
        _2141 = _2155;
    }
    float _2157 = _2141;
    float _2159 = -_2107;
    float _2161 = _2159 + 1.0;
    float _2163 = fma(_2161, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2107);
    bool _2165 = _862 <= 8000.0;
    bool _2167 = isnan(_862);
    bool _2169 = _2165 || _2167;
    bool _2171 = isnan(8000.0);
    bool _2173 = _2169 || _2171;
    float _2175 = float(_2173);
    float _2177 = _2135 + _1750;
    float _2179 = _2157 * _1446;
    float _2181 = _2175 * _2163;
    float _2183 = _2177 * 0.5;
    out.gl_Position.x = _1792;
    out.gl_Position.y = _1794;
    out.gl_Position.z = _2135;
    out.gl_Position.w = _1750;
    float _2185 = _2181 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_83.z = _2183;
    out.m_83.w = _1750;
    float _2187 = -_1806;
    float _2189 = _2187 + 1.0;
    float _2191 = -_2051;
    float _2193 = _2191 + 1.0;
    float _2195 = _2189 * _2185;
    float _2197 = precise::clamp(_2195, 0.0, 1.0);
    float _2199 = _2193;
    if (!_2129)
    {
        _1764 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2201 = _1764;
    float _2203 = _2201;
    float _2205 = _2201;
    if (!_2129)
    {
        _2143 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2207 = _2143;
    float _2209 = -_2197;
    float _2211 = fma(_2209, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2213 = _2207;
    float _2215 = _2207;
    if (!_2129)
    {
        _2063 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2217 = _2063;
    float _2219 = -_2179;
    float _2221 = fma(_2219, _2211, 1.0);
    float _2223 = precise::clamp(_2221, 0.0, 1.0);
    float _2225 = _2051 * _1822;
    float _2227 = _2223 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2229 = _2223;
    float _2231 = _2217;
    float _2233 = _2217;
    if (!_2129)
    {
        _2229 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2235 = _2229;
    float _2237 = _1837 * _2225;
    float _2239 = _1837 * _2193;
    out.m_85.x = _2227;
    float _2241 = _2237;
    float _2243 = _2235;
    float _2245 = _2235;
    if (!_2129)
    {
        _2199 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2247 = _2199;
    float _2249 = _1845 * _2225;
    float _2251 = fma(_1841, _2237, _1831);
    float _2253 = fma(_1843, _2237, _1833);
    float _2255 = _2247;
    float _2257 = _2247;
    if (!_2129)
    {
        _2241 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2259 = _2241;
    float _2261 = fma(_1837, _2249, _1835);
    out.m_87.x = _2251;
    out.m_87.y = _2253;
    out.m_87.z = _2261;
    out.m_87.w = _2239;
    bool _2263 = !_2129;
    float _2265 = _2259;
    float _2267 = _2259;
    if (!_2263)
    {
        bool _2269 = _1470 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2271 = isnan(_1470);
        bool _2273 = _2269 || _2271;
        bool _2275 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2277 = _2273 || _2275;
        if (!_2277)
        {
            float _2279 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2281 = _1470 + _2279;
            float _2283 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2285 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2283;
            float _2287 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2289 = _2287 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2291 = 1.0 / _2285;
            float _2293 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2295 = _2293 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2297 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2299 = _2297 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2301 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2303 = _2301 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2305 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2307 = _2305 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2309 = _2281 * _2291;
            float _2311 = precise::clamp(_2309, 0.0, 1.0);
            float _2313 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2315 = _2313 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2317 = fma(_2311, _2289, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2319 = fma(_2311, _2315, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2321 = fma(_2311, _2295, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2323 = fma(_2311, _2299, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2325 = fma(_2311, _2303, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2327 = fma(_2311, _2307, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2245 = _2321;
            _2233 = _2325;
            _2267 = _2317;
            _2215 = _2323;
            _2205 = _2319;
            _2257 = _2327;
            _2329 = true;
        }
        else
        {
            bool _2331 = _1470 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2333 = isnan(_1470);
            bool _2335 = _2331 || _2333;
            bool _2337 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2339 = _2335 || _2337;
            if (!_2339)
            {
                _2265 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2341 = _2265;
            _2267 = _2341;
            if (!_2339)
            {
                _2243 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2343 = _2243;
            _2245 = _2343;
            if (!_2339)
            {
                _2203 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2345 = _2203;
            _2205 = _2345;
            if (!_2339)
            {
                _2213 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2347 = _2213;
            _2215 = _2347;
            if (!_2339)
            {
                _2231 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2349 = _2231;
            _2233 = _2349;
            if (!_2339)
            {
                _2255 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2351 = _2255;
            bool _2353 = !_2339;
            _2257 = _2351;
            if (!_2353)
            {
                bool _2355 = _1470 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2357 = isnan(_1470);
                bool _2359 = _2355 || _2357;
                bool _2361 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2363 = _2359 || _2361;
                if (!_2363)
                {
                    float _2365 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2367 = _1470 + _2365;
                    float _2369 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2371 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2369;
                    float _2373 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2375 = _2373 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2377 = 1.0 / _2371;
                    float _2379 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2381 = _2379 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2383 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2385 = _2383 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2387 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2389 = _2387 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2391 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2393 = _2391 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2395 = _2367 * _2377;
                    float _2397 = precise::clamp(_2395, 0.0, 1.0);
                    float _2399 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2401 = _2399 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2403 = fma(_2397, _2375, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2405 = fma(_2397, _2401, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2407 = fma(_2397, _2381, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2409 = fma(_2397, _2385, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2411 = fma(_2397, _2389, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2413 = fma(_2397, _2393, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2245 = _2407;
                    _2233 = _2411;
                    _2267 = _2403;
                    _2215 = _2409;
                    _2205 = _2405;
                    _2257 = _2413;
                    _2329 = true;
                }
                else
                {
                    _2245 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2233 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2267 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2215 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2205 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2257 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2329 = false;
    float _2415 = _2245;
    float _2417 = _2233;
    float _2419 = _2267;
    float _2421 = _2215;
    float _2423 = _2205;
    float _2425 = _2257;
    float _2427 = fma(_2139, -0.5, 0.5);
    float _2429 = precise::clamp(_2427, 0.0, 1.0);
    float _2431 = -_2415;
    float _2433 = _2431 + _2417;
    float _2435 = -_2419;
    float _2437 = _2435 + _2421;
    float _2439 = -_2423;
    float _2441 = _2439 + _2425;
    bool _2443 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2445 = fma(_2429, _2433, _2415);
    float _2447 = fma(_2429, _2437, _2419);
    float _2449 = fma(_2429, _2441, _2423);
    float _2451 = _2445 * 0.586610972881317138671875;
    out.m_61.x = 1.0;
    float _2453 = fma(_2447, 0.298911988735198974609375, _2451);
    float _2455 = fma(_2449, 0.114477999508380889892578125, _2453);
    out.m_89.x = 0.0;
    float _2457 = -_2455;
    float _2459 = _2447 + _2457;
    float _2461 = -_2455;
    float _2463 = _2445 + _2461;
    float _2465 = -_2455;
    float _2467 = _2449 + _2465;
    float _2469 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2471 = fma(_2459, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2455);
    float _2473 = fma(_2463, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2455);
    float _2475 = fma(_2467, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2455);
    out.m_91.x = 0.0;
    out.m_85.w = _2469;
    out.m_93.x = _2471;
    out.m_93.y = _2473;
    out.m_93.z = _2475;
    if (!_2443)
    {
        return out;
    }
    float _2477 = -_1362;
    float _2479 = _2477 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2481 = -_1364;
    float _2483 = _2481 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2485 = -_1366;
    float _2487 = _2485 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2489 = _2479 * _2479;
    float _2491 = fma(_2483, _2483, _2489);
    float _2493 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
    float _2495 = precise::clamp(_2493, 0.0, 1.0);
    float _2497 = fma(_2487, _2487, _2491);
    float _2499 = _2495 * _2495;
    float _2501 = rsqrt(_2497);
    float _2503 = _2479 * _2501;
    float _2505 = _2483 * _2501;
    float _2507 = _2487 * _2501;
    float _2509 = sqrt(_2497);
    float _2511 = -_1476;
    float _2513 = _2511 + _2503;
    float _2515 = -_1472;
    float _2517 = _2515 + _2505;
    float _2519 = -_1474;
    float _2521 = _2519 + _2507;
    float _2523 = _2513 * _2513;
    float _2525 = fma(_2517, _2517, _2523);
    float _2527 = fma(_2521, _2521, _2525);
    float _2529 = -_2509;
    float _2531 = _2529 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2533 = rsqrt(_2527);
    float _2535 = _2531 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2537 = precise::clamp(_2535, 0.0, 1.0);
    float _2539 = abs(_2537);
    float _2541 = log2(_2539);
    float _2543 = _2499 + (-1.0);
    float _2545 = _2513 * _2533;
    float _2547 = _2517 * _2533;
    float _2549 = _2521 * _2533;
    float _2551 = _2139 * _2545;
    float _2553 = _2139 * _2503;
    float _2555 = fma(_2137, _2547, _2551);
    float _2557 = _2541 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2559 = fma(_2137, _2505, _2553);
    float _2561 = fma(_2131, _2549, _2555);
    float _2563 = precise::clamp(_2561, 0.0, 1.0);
    float _2565 = fma(_2131, _2507, _2559);
    float _2567 = precise::clamp(_2565, 0.0, 1.0);
    float _2569 = exp2(_2557);
    float _2571 = _2563 * _2563;
    float _2573 = _2505 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2575 = fma(_2571, _2543, 1.0);
    float _2577 = -_2503;
    float _2579 = -_2573;
    float _2581 = fma(_2577, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2579);
    float _2583 = _2575 * _2575;
    float _2585 = -_2507;
    float _2587 = fma(_2585, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2581);
    float _2589 = 1.0 / _2583;
    float _2591 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2593 = _2587 + _2591;
    float _2595 = _2593 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2597 = precise::clamp(_2595, 0.0, 1.0);
    float _2599 = _2569 * _2597;
    float _2601 = _2567 * _2599;
    float _2603 = _2499 * _2589;
    float _2605 = _2601 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2607 = _2601 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2609 = _2601 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    float _2611 = _2601 * _2603;
    float _2613 = _2611 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2615 = _2611 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2617 = _2611 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_89.x = _2605;
    out.m_89.y = _2607;
    out.m_89.z = _2609;
    out.m_91.x = _2613;
    out.m_91.y = _2615;
    out.m_91.z = _2617;
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
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2329 = false;
    bool _363 = false;
    bool _193 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _111 = in.m_58.w;
    float _113 = trunc(_111);
    int _115 = int(_113);
    bool _119 = _115 >= 1;
    float _121 = 0.0;
    if (!_119)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _123 = _121;
    float _125 = _123;
    if (!_119)
    {
        out.m_61.x = 0.0;
    }
    int _127 = 0;
    if (!_119)
    {
        float _129 = _123 * 5.0;
        _127 = as_type<int>(_129);
    }
    int _131 = _127;
    if (!_119)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2673 = as_type<float>(_131);
        out.gl_Position.z = _2673;
    }
    if (!_119)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _133 = in.m_63.w;
    bool _135 = _133 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = isnan(_133);
    bool _139 = _135 || _137;
    bool _141 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _143 = _139 || _141;
    float _145 = -_133;
    float _147 = _145 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _149 = _147;
    if (_143)
    {
        float _151 = float(_115);
        _125 = _151;
    }
    float _153 = _125;
    bool _155 = _147 >= _153;
    bool _157 = !_143;
    bool _159 = _155 || _157;
    float _161 = _153;
    if (_159)
    {
        _161 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _163 = _161;
    if (_159)
    {
        out.m_61.x = 0.0;
    }
    int _165 = 0;
    if (_159)
    {
        float _167 = _163 * 5.0;
        _165 = as_type<int>(_167);
    }
    int _169 = _165;
    if (_159)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2743 = as_type<float>(_169);
        out.gl_Position.z = _2743;
    }
    if (_159)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _171 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _173 = !_171;
    float _191;
    if (!_173)
    {
        float _175 = in.m_65.x;
        float _177 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _179 = _175 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _181 = fma(_179, (*spvDescriptorSet0.vp_c9)._m0[12].x, _147);
        float _183 = _181 * _177;
        float _185 = floor(_183);
        float _187 = -_185;
        float _189 = _183 + _187;
        _191 = _189;
        _193 = true;
    }
    else
    {
        float _195 = float(_115);
        float _197 = 1.0 / _195;
        float _199 = _147 * _197;
        _191 = _199;
    }
    _193 = false;
    float _201 = _191;
    float _203 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _205 = _201 + _203;
    bool _207 = _201 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _209 = isnan(_201);
    bool _211 = _207 || _209;
    bool _213 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _215 = _211 || _213;
    float _217 = float(_215);
    float _219 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _221 = _201 + _219;
    bool _223 = _201 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _225 = isnan(_201);
    bool _227 = _223 || _225;
    bool _229 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _231 = _227 || _229;
    float _233 = float(_231);
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _237 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _235;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _241 = _239 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _243 = _201 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _245 = isnan(_201);
    bool _247 = _243 || _245;
    bool _249 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _251 = _247 || _249;
    float _253 = float(_251);
    float _255 = -_217;
    float _257 = _255 + 1.0;
    float _259 = 1.0 / _237;
    float _261 = _253 * _257;
    float _263 = -_253;
    float _265 = _263 + 1.0;
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _269 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _267;
    bool _271 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _273 = 1.0 / _241;
    float _275 = _233 * _265;
    float _277 = -_233;
    float _279 = _277 + 1.0;
    float _281 = _205 * _259;
    float _283 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _285 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _283;
    float _287 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _289 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _287;
    float _291 = fma(_269, _281, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _293 = fma(_285, _281, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _295 = fma(_289, _281, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _297 = _221 * _273;
    float _299 = _291 * _275;
    float _301 = _293 * _275;
    float _303 = _295 * _275;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _307 = _305 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _311 = _309 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _315 = _313 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _317 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[143].x, _299);
    float _319 = fma(_307, _297, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _321 = fma(_311, _297, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _323 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[143].y, _301);
    float _325 = fma(_315, _297, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _327 = fma(_279, (*spvDescriptorSet0.vp_c9)._m0[143].z, _303);
    float _329 = fma(_319, _261, _317);
    float _331 = fma(_321, _261, _323);
    float _333 = fma(_325, _261, _327);
    float _335 = fma(_217, (*spvDescriptorSet0.vp_c9)._m0[145].x, _329);
    float _337 = fma(_217, (*spvDescriptorSet0.vp_c9)._m0[145].y, _331);
    float _339 = fma(_217, (*spvDescriptorSet0.vp_c9)._m0[145].z, _333);
    bool _341 = !_271;
    int _343 = as_type<int>(_329);
    float _361;
    if (!_341)
    {
        float _345 = in.m_65.x;
        float _347 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _349 = _345 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _351 = fma(_349, (*spvDescriptorSet0.vp_c9)._m0[11].x, _147);
        float _353 = _351 * _347;
        float _355 = floor(_353);
        float _357 = -_355;
        float _359 = _353 + _357;
        _361 = _359;
        _363 = true;
    }
    else
    {
        float _365 = float(_115);
        float _367 = 1.0 / _365;
        float _369 = _147 * _367;
        _361 = _369;
    }
    _363 = false;
    float _371 = _361;
    int _373 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _375 = _373;
    int _377 = 0;
    int _379 = _106(_375, _377, (*spvDescriptorSet0.support_buffer));
    float _381 = in.m_58.x;
    float _383 = in.m_58.y;
    float _385 = in.m_58.z;
    float _387 = in.m_67.z;
    float _389 = _383 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _391 = _383 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _393 = _383 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _395 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[5].x, _389);
    float _397 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[4].x, _391);
    float _399 = fma(_381, (*spvDescriptorSet0.vp_c10)._m0[6].x, _393);
    float _401 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[5].z, _395);
    float _403 = 1.0 + (*spvDescriptorSet0.vp_c13)._m0[1].y;
    float _405 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[4].z, _397);
    float _407 = _401 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _409 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[6].z, _399);
    float _411 = _405 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _413 = _407 + _403;
    float _415 = _409 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _417 = _413 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _419 = _413 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _421 = fma(_411, (*spvDescriptorSet0.vp_c15)._m0[126].x, _417);
    float _423 = fma(_411, (*spvDescriptorSet0.vp_c15)._m0[127].x, _419);
    float _425 = fma(_415, (*spvDescriptorSet0.vp_c15)._m0[126].z, _421);
    float _427 = fma(_415, (*spvDescriptorSet0.vp_c15)._m0[127].z, _423);
    float _429 = _425 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    float _431 = _427 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    float _433 = trunc(_429);
    int _435 = int(_433);
    float _437 = trunc(_431);
    int _439 = int(_437);
    int _441 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _443 = _435 + _441;
    int _445 = _443 + 1;
    bool _447 = _445 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _449 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _451 = _439 + _449;
    int _453 = _451 + 1;
    int _455 = _445 | _453;
    bool _457 = _455 < 0;
    bool _459 = _457 || _447;
    float _461 = in.m_65.x;
    float _463 = in.m_65.y;
    float _465 = in.m_65.z;
    bool _467 = _453 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _469 = _467 || _459;
    int _471 = _445;
    int _473 = _453;
    float _475 = _407;
    float _477 = _413;
    if (!_469)
    {
        int _479 = _453 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _481 = _479 + _445;
        _471 = _481;
    }
    int _483 = _471;
    float _485 = (*spvDescriptorSet0.vp_c9)._m0[144].y;
    if (!_469)
    {
        float _487 = floor(_431);
        _485 = _487;
    }
    float _489 = _485;
    if (!_469)
    {
        int _491 = _483 << 2;
        _473 = _491;
    }
    int _493 = _473;
    int _495 = _493;
    if (!_469)
    {
        uint _498 = uint(int(uint(_483) >> uint(2)));
        _343 = int(_498);
    }
    int _500 = _343;
    if (!_469)
    {
        int _502 = 12 & _493;
        _495 = _502;
    }
    int _504 = _495;
    float _506 = 0.0;
    if (!_469)
    {
        float _508 = floor(_429);
        _506 = _508;
    }
    float _510 = _506;
    int _512 = 0;
    if (!_469)
    {
        int _514 = _500 << 4;
        int _516 = _514 + _504;
        _512 = _516;
    }
    int _518 = _512;
    float _520 = _461 * 8.0;
    float _522 = 0.0;
    if (!_469)
    {
        float _524 = -_489;
        float _526 = _431 + _524;
        _522 = _526;
    }
    float _528 = _522;
    float _530 = 0.0;
    if (!_469)
    {
        int _532 = _518 + 400;
        uint _534 = uint(int(uint(_532) >> uint(2)));
        uint _536 = uint(int(uint(int(_534)) >> uint(2)));
        int _538 = int(_534) & 3;
        float _540 = (*spvDescriptorSet0.vp_c15)._m0[int(_536)][_538];
        _530 = _540;
    }
    float _542 = _530;
    float _544 = rint(_520);
    float _546 = 0.0;
    if (!_469)
    {
        float _548 = -_510;
        float _550 = _429 + _548;
        _546 = _550;
    }
    float _552 = _546;
    float _554 = _544 * 0.125;
    float _556 = precise::clamp(_554, 0.0, 1.0);
    float _558 = _542;
    if (!_469)
    {
        float _560 = rint(_542);
        float _562 = precise::max(_560, 0.0);
        uint _564 = uint(_562);
        uint _566 = clamp(_564, 0u, 65535u);
        _558 = as_type<float>(_566);
    }
    float _568 = _558;
    int _570 = _379 + (-1);
    float _572 = float(_570);
    float _574 = _556 * _572;
    float _576 = trunc(_387);
    int _578 = int(_576);
    float _580 = trunc(_574);
    int _582 = int(_580);
    int _584 = _582 + 1;
    int _586 = min(_570, _584);
    int _588 = _582;
    int _590 = 0;
    int _592 = _107(_588, _590, (*spvDescriptorSet0.support_buffer));
    int _594 = _578;
    int _596 = 0;
    int _598 = _107(_594, _596, (*spvDescriptorSet0.support_buffer));
    float3 _602 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_592, _598)), 0).xyz;
    float _604 = _602.x;
    float _606 = _602.y;
    float _608 = _602.z;
    int _610 = _586;
    int _612 = 0;
    int _614 = _107(_610, _612, (*spvDescriptorSet0.support_buffer));
    int _616 = _578;
    int _618 = 0;
    int _620 = _107(_616, _618, (*spvDescriptorSet0.support_buffer));
    float3 _622 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_614, _620)), 0).xyz;
    float _624 = _622.x;
    float _626 = _622.y;
    float _628 = _622.z;
    float _630 = _528;
    if (!_469)
    {
        float3 _3456 = float3(_552, _528, float(as_type<int>(_568)));
        float3 _3460 = select(_3456, float3(0.0), isnan(_3456));
        float _632 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _3460.xy, uint(rint(_3460.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _3460.xy, uint(rint(_3460.z)), level(0.0)).x;
        _630 = _632;
    }
    float _634 = _630;
    float _636 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _638 = log2(_636);
    float _640 = _465 * 2.0;
    float _642 = _407 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _644 = _461 * 2.0;
    float _646 = _463 * 2.0;
    float _648 = fma(_411, (*spvDescriptorSet0.vp_c8)._m0[11].x, _642);
    int _650 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _652 = _650 != 0;
    int _654 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _656 = _654 != 0;
    int _658 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _660 = _658 != 0;
    float _662 = floor(_640);
    float _664 = _463 + _465;
    float _666 = _465 + _461;
    float _668 = _461 + (-0.5);
    float _670 = _664 + (-1.0);
    float _672 = _666 + (-1.0);
    float _674 = _638 * _147;
    float _676 = fma(_415, (*spvDescriptorSet0.vp_c8)._m0[11].z, _648);
    float _678 = _465 + (-0.5);
    float _680 = floor(_644);
    float _682 = _463 + _461;
    float _684 = _407 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _686 = _662 > 0.0;
    float _688 = fma(_411, (*spvDescriptorSet0.vp_c8)._m0[10].x, _684);
    bool _690 = _662 >= 0.0;
    bool _692 = isnan(_662);
    bool _694 = _690 || _692;
    bool _696 = isnan(0.0);
    bool _698 = _694 || _696;
    float _700 = exp2(_674);
    float _702 = _676 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _704 = fma(_415, (*spvDescriptorSet0.vp_c8)._m0[10].z, _688);
    float _706 = _463 + (-0.5);
    int _708 = _698 ? 0 : 1;
    float _710 = _682 + (-1.0);
    float _712 = 1.0 / _702;
    float _714 = fma(_670, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _716 = _704 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _718 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _720 = 1.0 + _718;
    bool _722 = _680 >= 0.0;
    bool _724 = isnan(_680);
    bool _726 = _722 || _724;
    bool _728 = isnan(0.0);
    bool _730 = _726 || _728;
    float _732 = fma(_710, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _734 = _716 + _702;
    bool _736 = _680 > 0.0;
    float _738 = floor(_646);
    int _740 = ~_708;
    int _742 = _740 + 1;
    int _744 = _742 + 1;
    float _746 = -_700;
    float _748 = _746 + 1.0;
    int _750 = _744;
    if (!_686)
    {
        int _752 = ~_708;
        int _754 = _752 + 1;
        _750 = _754;
    }
    int _756 = _750;
    bool _758 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _760 = isnan(1.0);
    bool _762 = _758 || _760;
    bool _764 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _766 = _762 || _764;
    int _768 = _730 ? 0 : 1;
    float _770 = 1.0 / _720;
    float _772 = _734 * _712;
    float _774 = _772 * 0.5;
    bool _776 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _778 = isnan(0.0);
    bool _780 = _776 || _778;
    bool _782 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _784 = _780 || _782;
    bool _786 = !_652;
    int _788 = _786 ? 0 : 1;
    float _790 = _784 ? _748 : 0.0;
    float _792 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _794 = fma(_774, (*spvDescriptorSet0.vp_c8)._m0[30].w, _792);
    bool _796 = _738 > 0.0;
    bool _798 = _738 >= 0.0;
    bool _800 = isnan(_738);
    bool _802 = _798 || _800;
    bool _804 = isnan(0.0);
    bool _806 = _802 || _804;
    int _808 = abs(_788);
    float _810 = 1.0 / _794;
    float _812 = in.m_69.x;
    float _814 = in.m_69.y;
    float _816 = in.m_69.z;
    if (_766)
    {
        float _818 = _790 * _770;
        _149 = _818;
    }
    float _820 = _149;
    bool _822 = !_656;
    int _824 = _822 ? 0 : 1;
    int _826 = abs(_824);
    float _828 = float(_808);
    float _830 = float(_756);
    bool _832 = !_660;
    int _834 = _832 ? 0 : 1;
    int _836 = ~_768;
    int _838 = _836 + 1;
    int _840 = _838 + 1;
    float _842 = _828 * _830;
    int _844 = _840;
    if (!_736)
    {
        int _846 = ~_768;
        int _848 = _846 + 1;
        _844 = _848;
    }
    int _850 = _844;
    int _852 = abs(_834);
    float _854 = float(_826);
    float _856 = _842 * (-2.0);
    float _858 = float(_850);
    float _860 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _862 = _810 * _860;
    int _864 = _806 ? 0 : 1;
    float _866 = fma(_856, _812, _812);
    float _868 = fma(_732, _856, _732);
    float _870 = _854 * _858;
    bool _872 = _862 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _874 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[196].x, _866);
    bool _876 = _862 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _878 = _870 * (-2.0);
    int _880 = ~_864;
    int _882 = _880 + 1;
    int _884 = _882 + 1;
    float _886 = fma(_868, _820, _874);
    int _888 = _884;
    if (!_796)
    {
        int _890 = ~_864;
        int _892 = _890 + 1;
        _888 = _892;
    }
    int _894 = _888;
    float _896 = fma(_714, _878, _714);
    float _898 = fma(_878, _814, _814);
    float _900 = float(_852);
    float _902 = _886 * 0.15915493667125701904296875;
    float _904 = float(_894);
    float _906 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[196].y, _898);
    bool _908 = !_872;
    int _910 = _908 ? 0 : 1;
    float _912 = _902 * 6.283185482025146484375;
    float _914 = sin(_912);
    float _916 = _900 * _904;
    int _918 = 2;
    if (!_872)
    {
        _918 = 1;
    }
    int _920 = _918;
    float _922 = fma(_896, _820, _906);
    int _924 = _920;
    if (!_876)
    {
        _924 = _910;
    }
    int _926 = _924;
    float _928 = _916 * (-2.0);
    float _930 = _922 * 0.15915493667125701904296875;
    int _932 = _926 << 6;
    float _934 = fma(_928, _816, _816);
    float _936 = _902 * 6.283185482025146484375;
    float _938 = cos(_936);
    float _940 = fma(_672, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _942 = _932 + 56;
    uint _944 = uint(int(uint(_942) >> uint(2)));
    uint _946 = uint(int(uint(int(_944)) >> uint(2)));
    int _948 = int(_944) & 3;
    float _950 = (*spvDescriptorSet0.vp_c15)._m0[int(_946)][_948];
    int _952 = int(_944) + 1;
    uint _954 = uint(int(uint(_952) >> uint(2)));
    int _956 = _952 & 3;
    float _958 = (*spvDescriptorSet0.vp_c15)._m0[int(_954)][_956];
    float _960 = fma(_678, (*spvDescriptorSet0.vp_c9)._m0[196].z, _934);
    float _962 = fma(_940, _928, _940);
    float _964 = in.m_71.x;
    float _966 = in.m_71.y;
    float _968 = in.m_71.z;
    float _970 = _930 * 6.283185482025146484375;
    float _972 = sin(_970);
    float _974 = fma(_962, _820, _960);
    int _976 = _932 + 48;
    uint _978 = uint(int(uint(_976) >> uint(2)));
    uint _980 = uint(int(uint(int(_978)) >> uint(2)));
    int _982 = int(_978) & 3;
    float _984 = (*spvDescriptorSet0.vp_c15)._m0[int(_980)][_982];
    int _986 = int(_978) + 1;
    uint _988 = uint(int(uint(_986) >> uint(2)));
    int _990 = _986 & 3;
    float _992 = (*spvDescriptorSet0.vp_c15)._m0[int(_988)][_990];
    float _994 = _974 * 0.15915493667125701904296875;
    float _996 = _930 * 6.283185482025146484375;
    float _998 = cos(_996);
    int _1000 = _932 + 80;
    uint _1002 = uint(int(uint(_1000) >> uint(2)));
    uint _1004 = uint(int(uint(int(_1002)) >> uint(2)));
    int _1006 = int(_1002) & 3;
    float _1008 = (*spvDescriptorSet0.vp_c15)._m0[int(_1004)][_1006];
    int _1010 = int(_1002) + 1;
    uint _1012 = uint(int(uint(_1010) >> uint(2)));
    int _1014 = _1010 & 3;
    float _1016 = (*spvDescriptorSet0.vp_c15)._m0[int(_1012)][_1014];
    float _1018 = _994 * 6.283185482025146484375;
    float _1020 = cos(_1018);
    float _1022 = _938 * _972;
    int _1024 = _932 + 88;
    uint _1026 = uint(int(uint(_1024) >> uint(2)));
    uint _1028 = uint(int(uint(int(_1026)) >> uint(2)));
    int _1030 = int(_1026) & 3;
    float _1032 = (*spvDescriptorSet0.vp_c15)._m0[int(_1028)][_1030];
    int _1034 = int(_1026) + 1;
    uint _1036 = uint(int(uint(_1034) >> uint(2)));
    int _1038 = _1034 & 3;
    float _1040 = (*spvDescriptorSet0.vp_c15)._m0[int(_1036)][_1038];
    float _1042 = _339 * _968;
    float _1044 = floor(_574);
    float _1046 = _337 * _966;
    int _1048 = _932 + 64;
    uint _1050 = uint(int(uint(_1048) >> uint(2)));
    uint _1052 = uint(int(uint(int(_1050)) >> uint(2)));
    int _1054 = int(_1050) & 3;
    float _1056 = (*spvDescriptorSet0.vp_c15)._m0[int(_1052)][_1054];
    int _1058 = int(_1050) + 1;
    uint _1060 = uint(int(uint(_1058) >> uint(2)));
    int _1062 = _1058 & 3;
    float _1064 = (*spvDescriptorSet0.vp_c15)._m0[int(_1060)][_1062];
    float _1066 = _914 * _972;
    float _1068 = _914 * _998;
    float _1070 = _938 * _998;
    float _1072 = _335 * _964;
    float _1074 = _1046 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1076 = _994 * 6.283185482025146484375;
    float _1078 = sin(_1076);
    float _1080 = _914 * _1020;
    int _1082 = _932 + 96;
    uint _1084 = uint(int(uint(_1082) >> uint(2)));
    uint _1086 = uint(int(uint(int(_1084)) >> uint(2)));
    int _1088 = int(_1084) & 3;
    float _1090 = (*spvDescriptorSet0.vp_c15)._m0[int(_1086)][_1088];
    int _1092 = int(_1084) + 1;
    uint _1094 = uint(int(uint(_1092) >> uint(2)));
    int _1096 = _1092 & 3;
    float _1098 = (*spvDescriptorSet0.vp_c15)._m0[int(_1094)][_1096];
    float _1100 = _998 * _1020;
    float _1102 = _938 * _1020;
    float _1104 = _1072 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1106 = _1042 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1108 = -_1044;
    float _1110 = _574 + _1108;
    float _1112 = _972 * _1020;
    int _1114 = _932 + 72;
    uint _1116 = uint(int(uint(_1114) >> uint(2)));
    uint _1118 = uint(int(uint(int(_1116)) >> uint(2)));
    int _1120 = int(_1116) & 3;
    float _1122 = (*spvDescriptorSet0.vp_c15)._m0[int(_1118)][_1120];
    int _1124 = int(_1116) + 1;
    uint _1126 = uint(int(uint(_1124) >> uint(2)));
    int _1128 = _1124 & 3;
    float _1130 = (*spvDescriptorSet0.vp_c15)._m0[int(_1126)][_1128];
    float _1132 = fma(_1078, _1070, _1066);
    float _1134 = -_1068;
    float _1136 = fma(_1078, _1022, _1134);
    float _1138 = _413 * _992;
    float _1140 = -_1022;
    float _1142 = fma(_1078, _1068, _1140);
    float _1144 = fma(_1078, _1066, _1070);
    float _1146 = fma(_411, _984, _1138);
    float _1148 = _413 * _1016;
    float _1150 = fma(_415, _950, _1146);
    float _1152 = fma(_411, _1008, _1148);
    float _1154 = _1150 + _958;
    float _1156 = fma(_415, _1032, _1152);
    float _1158 = _1156 + _1040;
    float _1160 = _413 * _1064;
    float _1162 = fma(_411, _1056, _1160);
    float _1164 = _413 * _1098;
    float _1166 = fma(_411, _1090, _1164);
    float _1168 = fma(_415, _1122, _1162);
    float _1170 = _1168 + _1130;
    float _1172 = -_606;
    float _1174 = _1172 + _626;
    float _1176 = -_604;
    float _1178 = _1176 + _624;
    float _1180 = -_608;
    float _1182 = _1180 + _628;
    float _1184 = fma(_1110, _1174, _606);
    float _1186 = fma(_1110, _1178, _604);
    float _1188 = fma(_1110, _1182, _608);
    float _1190 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1184);
    float _1192 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1186);
    int _1194 = _932 + 104;
    uint _1196 = uint(int(uint(_1194) >> uint(2)));
    uint _1198 = uint(int(uint(int(_1196)) >> uint(2)));
    int _1200 = int(_1196) & 3;
    float _1202 = (*spvDescriptorSet0.vp_c15)._m0[int(_1198)][_1200];
    int _1204 = int(_1196) + 1;
    uint _1206 = uint(int(uint(_1204) >> uint(2)));
    int _1208 = _1204 & 3;
    float _1210 = (*spvDescriptorSet0.vp_c15)._m0[int(_1206)][_1208];
    float _1212 = _1074 * _1190;
    float _1214 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1188);
    float _1216 = _1104 * _1192;
    float _1218 = _1102 * _1212;
    float _1220 = _1106 * _1214;
    float _1222 = -_1212;
    float _1224 = _1078 * _1222;
    float _1226 = _1080 * _1212;
    float _1228 = fma(_1132, _1216, _1218);
    float _1230 = fma(_1100, _1216, _1224);
    float _1232 = fma(_1142, _1216, _1226);
    float _1234 = fma(_1136, _1220, _1228);
    float _1236 = fma(_1112, _1220, _1230);
    float _1238 = fma(_1144, _1220, _1232);
    float _1240 = _1234 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1242 = _1234 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1244 = fma(_1236, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1240);
    float _1246 = fma(_1236, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1242);
    float _1248 = fma(_1238, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1244);
    float _1250 = fma(_1238, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1246);
    float _1252 = _415 + _1248;
    float _1254 = _411 + _1250;
    float _1256 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1258 = _1252 + _1256;
    float _1260 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1262 = _1254 + _1260;
    float _1264 = _1258 * _1258;
    float _1266 = fma(_1262, _1262, _1264);
    float _1268 = _1234 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1270 = sqrt(_1266);
    float _1272 = fma(_1236, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1268);
    float _1274 = fma(_415, _1202, _1166);
    float _1276 = fma(_1238, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1272);
    float _1278 = _1274 + _1210;
    float _1280 = _407 + _1276;
    float _1282 = 1.0 / _1278;
    bool _1284 = _1270 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1286 = _1154 * _1282;
    float _1288 = _1170 * _1282;
    float _1290 = _1158 * _1282;
    float _1292 = _1236;
    float _1294 = _1238;
    float _1296 = _1276;
    float _1298 = _1158;
    float _1300 = _1270;
    float _1302 = _1254;
    float _1304 = _1252;
    if (!_1284)
    {
        _1292 = _1254;
    }
    float _1306 = _1292;
    float _1308 = _1306;
    if (!_1284)
    {
        _1294 = _1252;
    }
    float _1310 = _1294;
    float _1312 = _1310;
    if (!_1284)
    {
        _1296 = _1280;
    }
    float _1314 = _1296;
    bool _1316 = !_1284;
    float _1318 = _1314;
    if (!_1316)
    {
        float _1320 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1322 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1324 = _1270 + _1322;
        float _1326 = _1280 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1328 = rsqrt(_1266);
        float _1330 = _1324 * _1320;
        float _1332 = _1330 * 0.15915493667125701904296875;
        float _1334 = _1332 * 6.283185482025146484375;
        float _1336 = cos(_1334);
        float _1338 = _1332 * 6.283185482025146484375;
        float _1340 = sin(_1338);
        float _1342 = _1336 + (-1.0);
        float _1344 = _1342 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1346 = fma(_1340, _1326, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1348 = fma(_1280, _1336, _1344);
        float _1350 = _1328 * _1346;
        float _1352 = fma(_1262, _1350, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1354 = fma(_1258, _1350, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1298 = _1350;
        _1300 = _1332;
        _1302 = _1346;
        _1318 = _1348;
        _1308 = _1352;
        _1312 = _1354;
    }
    float _1356 = _1298;
    float _1358 = _1300;
    float _1360 = _1302;
    float _1362 = _1318;
    float _1364 = _1308;
    float _1366 = _1312;
    float _1368 = _1360;
    float _1370 = _1358;
    float _1372 = _1356;
    if (_469)
    {
        _475 = 1.0;
    }
    float _1374 = _475;
    float _1376 = _1374;
    if (!_469)
    {
        int _1378 = _483 << 4;
        int _1380 = _1378 + 2048;
        uint _1382 = uint(int(uint(_1380) >> uint(2)));
        uint _1384 = uint(int(uint(int(_1382)) >> uint(2)));
        int _1386 = int(_1382) & 3;
        float _1388 = (*spvDescriptorSet0.vp_c15)._m0[int(_1384)][_1386];
        int _1390 = int(_1382) + 1;
        uint _1392 = uint(int(uint(_1390) >> uint(2)));
        int _1394 = _1390 & 3;
        float _1396 = (*spvDescriptorSet0.vp_c15)._m0[int(_1392)][_1394];
        int _1398 = _1380 + 8;
        uint _1400 = uint(int(uint(_1398) >> uint(2)));
        uint _1402 = uint(int(uint(int(_1400)) >> uint(2)));
        int _1404 = int(_1400) & 3;
        float _1406 = (*spvDescriptorSet0.vp_c15)._m0[int(_1402)][_1404];
        int _1408 = int(_1400) + 1;
        uint _1410 = uint(int(uint(_1408) >> uint(2)));
        int _1412 = _1408 & 3;
        float _1414 = (*spvDescriptorSet0.vp_c15)._m0[int(_1410)][_1412];
        float _1416 = _413 * _1396;
        float _1418 = fma(_411, _1388, _1416);
        float _1420 = fma(_415, _1406, _1418);
        float _1422 = _1420 + _1414;
        float _1424 = precise::clamp(_1422, 0.0, 1.0);
        float _1426 = -_1424;
        float _1428 = _1426 + _634;
        float _1430 = fma(_1428, 500.0, 1.5);
        float _1432 = exp2(_1430);
        float _1434 = 0.0 + _1432;
        float _1436 = precise::clamp(_1434, 0.0, 1.0);
        _1368 = _1414;
        _477 = _1420;
        _1370 = _1406;
        _1372 = _1388;
        _1376 = _1436;
    }
    float _1438 = _1368;
    float _1440 = _477;
    float _1442 = _1370;
    float _1444 = _1372;
    float _1446 = _1376;
    float _1448 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1450 = _1362 + _1448;
    float _1452 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1454 = _1364 + _1452;
    float _1456 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1458 = _1366 + _1456;
    float _1460 = _1450 * _1450;
    float _1462 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1464 = fma(_1454, _1454, _1460);
    float _1466 = fma(_1458, _1458, _1464);
    float _1468 = rsqrt(_1466);
    float _1470 = sqrt(_1466);
    float _1472 = _1454 * _1468;
    float _1474 = _1458 * _1468;
    float _1476 = _1450 * _1468;
    float _1478 = _1472 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1480 = _1474 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1482 = _1478 * _1478;
    float _1484 = _1480 * _1480;
    float _1486 = _1482 + _1484;
    float _1488 = sqrt(_1486);
    bool _1490 = _1488 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1492 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1494 = _1488 + _1492;
    float _1496 = _1438;
    float _1498 = _1444;
    float _1500 = _1494;
    float _1502 = (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1504 = _1468;
    float _1506 = _1486;
    if (_1490)
    {
        float _1508 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1496 = _1508;
    }
    float _1510 = _1496;
    if (_1490)
    {
        float _1512 = rsqrt(_1486);
        _1498 = _1512;
    }
    float _1514 = _1498;
    float _1516 = _1514;
    if (_1490)
    {
        float _1518 = _1494 * _1510;
        _1500 = _1518;
    }
    float _1520 = _1500;
    if (_1490)
    {
        float _1522 = _1520 * 0.15915493667125701904296875;
        _1304 = _1522;
    }
    float _1524 = _1304;
    float _1526 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    if (!_1490)
    {
        _1502 = _1478;
    }
    float _1528 = _1502;
    float _1530 = _1440;
    float _1532 = _1528;
    if (_1490)
    {
        float _1534 = _1524 * 6.283185482025146484375;
        float _1536 = sin(_1534);
        _1530 = _1536;
    }
    float _1538 = _1530;
    float _1540 = precise::max(0.0, _1526);
    float _1542 = -_1476;
    float _1544 = -_1540;
    float _1546 = fma(_1542, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1544);
    float _1548 = _1442;
    float _1550 = _1540;
    if (_1490)
    {
        float _1552 = _1524 * 6.283185482025146484375;
        float _1554 = cos(_1552);
        _1548 = _1554;
    }
    float _1556 = _1548;
    float _1558 = fma(_411, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1560 = _1558;
    if (_1490)
    {
        float _1562 = _1546 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1504 = _1562;
    }
    float _1564 = _1504;
    float _1566 = _1564;
    float _1568 = _1538;
    if (_1490)
    {
        float _1570 = fma(_1538, _1564, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1566 = _1570;
    }
    float _1572 = _1566;
    float _1574 = floor(_1558);
    float _1576 = _1572;
    if (_1490)
    {
        float _1578 = _1514 * _1572;
        _1506 = _1578;
    }
    float _1580 = _1506;
    if (!_1490)
    {
        _1576 = _1546;
    }
    float _1582 = _1576;
    float _1584 = _1582;
    if (!_1490)
    {
        _1516 = _1482;
    }
    float _1586 = _1516;
    float _1588 = _1586;
    float _1590 = _1556;
    if (_1490)
    {
        float _1592 = _1556 + (-1.0);
        _1568 = _1592;
    }
    float _1594 = _1568;
    float _1596 = _1594;
    if (_1490)
    {
        float _1598 = _1478 * _1580;
        _1532 = _1598;
    }
    float _1600 = _1532;
    float _1602 = _1362 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1604 = _1362 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1490)
    {
        float _1606 = _1594 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1550 = _1606;
    }
    float _1608 = _1550;
    if (!_1490)
    {
        _1596 = _1480;
    }
    float _1610 = _1596;
    float _1612 = _1610;
    if (_1490)
    {
        float _1614 = _1480 * _1580;
        _1612 = _1614;
    }
    float _1616 = _1612;
    if (_1490)
    {
        float _1618 = _1600 * _1600;
        _1588 = _1618;
    }
    float _1620 = _1588;
    if (_1490)
    {
        float _1622 = fma(_1546, _1556, _1608);
        _1584 = _1622;
    }
    float _1624 = _1584;
    if (!_1490)
    {
        _1590 = _1484;
    }
    float _1626 = _1590;
    float _1628 = _1626;
    if (_1490)
    {
        float _1630 = _1616 * _1616;
        _1628 = _1630;
    }
    float _1632 = _1628;
    bool _1634 = _1286 >= 0.0;
    float _1636 = fma(_1624, _1624, _1620);
    float _1638 = fma(_415, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1640 = _1362 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    bool _1642 = _1286 <= 1.0;
    bool _1644 = _1642 && _1634;
    float _1646 = _1636 + _1632;
    float _1648 = _1362 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    bool _1650 = _1288 >= 0.0;
    bool _1652 = _1650 && _1644;
    float _1654 = rsqrt(_1646);
    float _1656 = fma(_1364, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1602);
    float _1658 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1660 = fma(_1470, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1658);
    float _1662 = precise::clamp(_1660, 0.0, 1.0);
    bool _1664 = _1288 <= 1.0;
    bool _1666 = _1664 && _1652;
    float _1668 = fma(_1364, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1640);
    float _1670 = fma(_1364, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1648);
    float _1672 = -_1662;
    float _1674 = _1672 + 1.0;
    float _1676 = fma(_1366, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1656);
    float _1678 = fma(_1366, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1668);
    float _1680 = fma(_1364, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1604);
    float _1682 = -_1574;
    float _1684 = _1558 + _1682;
    float _1686 = fma(_1366, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1670);
    float _1688 = abs(_1674);
    float _1690 = log2(_1688);
    float _1692 = _1676 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1694 = fma(_1366, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1680);
    float _1696 = _1686 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    if (_1666)
    {
        float _1698 = float(_926);
        _1560 = _1698;
    }
    float _1700 = _1560;
    float _1702 = _1654 * _1600;
    float _1704 = _1692 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1706 = _1654 * _1624;
    float _1708 = _1694 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1710 = _1702 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1712 = _1700;
    if (_1666)
    {
        float _1714 = rint(_1700);
        float _1716 = precise::max(_1714, 0.0);
        uint _1718 = uint(_1716);
        uint _1720 = clamp(_1718, 0u, 65535u);
        _1712 = as_type<float>(_1720);
    }
    float _1722 = _1712;
    float _1724 = fma(_1696, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1704);
    float _1726 = _1654 * _1616;
    float _1728 = -_1710;
    float _1730 = fma(_1706, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1728);
    float _1732 = _1708 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1734 = _1678 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1736 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1724);
    float _1738 = -_1726;
    float _1740 = fma(_1738, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1730);
    float _1742 = floor(_1638);
    float _1744 = -_1732;
    float _1746 = fma(_1744, _1462, 1.0);
    float _1748 = _1690 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1750 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1736);
    float _1752 = fma(_1740, -0.5, 0.5);
    float _1754 = fma(_1740, 0.5, 0.5);
    float _1756 = _1692 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1758 = exp2(_1748);
    float _1760 = _1692 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1762 = 0.0;
    float _1764 = _1750;
    if (_1666)
    {
        float3 _5219 = float3(_1286, _1288, float(as_type<int>(_1722)));
        float3 _5221 = select(_5219, float3(0.0), isnan(_5219));
        float _1766 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _5221.xy, uint(rint(_5221.z)), _1290, level(0.0));
        _1762 = _1766;
    }
    float _1768 = _1762;
    float _1770 = fma(_1754, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1772 = fma(_1696, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1756);
    float _1774 = fma(_1696, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1760);
    float _1776 = fma(_1754, _1770, -0.212114393711090087890625);
    float _1778 = log2(_1746);
    float _1780 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1772);
    float _1782 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1774);
    float _1784 = -_1742;
    float _1786 = _1638 + _1784;
    float _1788 = fma(_1754, _1776, 1.570728778839111328125);
    float _1790 = _1706 + 1.0;
    float _1792 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1780);
    float _1794 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1782);
    float _1796 = 1.0 / _1750;
    float _1798 = -_1706;
    float _1800 = fma(_1758, _1790, _1798);
    float _1802 = sqrt(_1752);
    float _1804 = _1778 * 0.693147182464599609375;
    float2 _5295 = float2(_1684, _1786);
    float _1806 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5295, float2(0.0), isnan(_5295)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5295, float2(0.0), isnan(_5295)), level(0.0)).x;
    float _1808 = fma(_1800, 0.5, 0.5);
    float _1810 = _1804 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1812 = _1792 * _1796;
    float _1814 = _1794 * _1796;
    float _1816 = fma(_1812, 0.5, 0.5);
    float _1818 = fma(_1814, -0.5, 0.5);
    float _1820 = _1802 * 0.636619746685028076171875;
    float3 _5325 = float3(_1816, _1818, _1810);
    float _1822 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5325, float3(0.0), isnan(_5325)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5325, float3(0.0), isnan(_5325)), level(0.0)).x;
    float _1824 = -_1788;
    float _1826 = fma(_1820, _1824, 1.0);
    float3 _5339 = float3(_1816, _1818, _1810);
    float4 _1829 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5339, float3(0.0), isnan(_5339)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5339, float3(0.0), isnan(_5339)), level(0.0)).xyzw;
    float _1831 = _1829.x;
    float _1833 = _1829.y;
    float _1835 = _1829.z;
    float _1837 = _1829.w;
    float2 _5355 = float2(_1826, _1808);
    float3 _1839 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5355, float2(0.0), isnan(_5355)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5355, float2(0.0), isnan(_5355)), level(0.0)).xyz;
    float _1841 = _1839.x;
    float _1843 = _1839.y;
    float _1845 = _1839.z;
    float _1847 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1849 = _371 + _1847;
    bool _1851 = _1184 != 0.0;
    bool _1853 = isnan(_1184);
    bool _1855 = _1851 || _1853;
    bool _1857 = isnan(0.0);
    bool _1859 = _1855 || _1857;
    float _1861 = _1690 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1863 = _1692 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1865 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _1867 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _1865;
    float _1869 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1871 = _1869 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _1873 = _371 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1875 = isnan(_371);
    bool _1877 = _1873 || _1875;
    bool _1879 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1881 = _1877 || _1879;
    float _1883 = float(_1881);
    float _1885 = fma(_1696, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1863);
    float _1887 = 1.0 / _1867;
    bool _1889 = _371 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _1891 = isnan(_371);
    bool _1893 = _1889 || _1891;
    bool _1895 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _1897 = _1893 || _1895;
    float _1899 = float(_1897);
    out.m_73.x = _1364;
    out.m_73.y = _1362;
    out.m_73.z = _1366;
    float _1901 = fma(_1708, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1885);
    float _1903 = -_1899;
    float _1905 = _1903 + 1.0;
    float _1907 = 1.0 / _1871;
    bool _1909 = _1186 == 0.0;
    bool _1911 = !_1859;
    bool _1913 = _1909 && _1911;
    float _1915 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1917 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1915;
    float _1919 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1921 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1919;
    float _1923 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _1925 = _1923 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    bool _1927 = _1188 == 0.0;
    bool _1929 = _1927 && _1913;
    float _1931 = _1849 * _1887;
    bool _1933 = _371 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _1935 = isnan(_371);
    bool _1937 = _1933 || _1935;
    bool _1939 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _1941 = _1937 || _1939;
    float _1943 = float(_1941);
    float _1945 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _1947 = _371 + _1945;
    float _1949 = _1883 * _1905;
    float _1951 = fma(_1917, _1931, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1953 = fma(_1921, _1931, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1955 = -_1943;
    float _1957 = _1955 + 1.0;
    float _1959 = -_1883;
    float _1961 = _1959 + 1.0;
    float _1963 = _1947 * _1907;
    float _1965 = _1951 * _1949;
    float _1967 = _1899 * _1957;
    float _1969 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1971 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1969;
    float _1973 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _1975 = _1973 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _1977 = _1953 * _1949;
    float _1979 = fma(_1925, _1963, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _1981 = fma(_1971, _1931, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1983 = fma(_1975, _1963, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _1985 = exp2(_1861);
    float _1987 = _1981 * _1949;
    float _1989 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _1991 = _1989 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _1993 = fma(_1961, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1987);
    float _1995 = fma(_1991, _1963, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _1997 = fma(_1961, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1977);
    float _1999 = fma(_1961, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1965);
    float _2001 = fma(_1995, _1967, _1993);
    float _2003 = fma(_1979, _1967, _1997);
    float _2005 = fma(_1983, _1967, _1999);
    float _2007 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2009 = fma(_1943, (*spvDescriptorSet0.vp_c9)._m0[109].x, _2001);
    float _2011 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2013 = fma(_1943, (*spvDescriptorSet0.vp_c9)._m0[109].y, _2003);
    float _2015 = fma(_1943, (*spvDescriptorSet0.vp_c9)._m0[109].z, _2005);
    float _2017 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2019 = _2011 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2021 = _2013 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2023 = _2015 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2025 = abs(_862);
    float _2027 = log2(_2025);
    float _2029 = _2017 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2031 = _2021 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2033 = _2023 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2035 = _2007 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2037 = in.m_75.x;
    float _2039 = in.m_75.y;
    float _2041 = in.m_75.z;
    float _2043 = _2009 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2045 = -_1985;
    float _2047 = _2045 + 1.0;
    out.m_77.x = _2035;
    out.m_77.y = _2019;
    out.m_77.z = _2029;
    float _2049 = _2043 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2051 = _2047 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_79.x = _2049;
    out.m_79.y = _2031;
    out.m_79.z = _2033;
    float _2053 = _2027 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2055 = exp2(_2053);
    float _2057 = _2039;
    float _2059 = _2037;
    float _2061 = _2041;
    float _2063 = _1794;
    if (!_1929)
    {
        float _2065 = fma(_1184, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2039);
        _2057 = _2065;
    }
    float _2067 = _2057;
    if (!_1929)
    {
        float _2069 = fma(_1186, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2037);
        _2059 = _2069;
    }
    float _2071 = _2059;
    if (!_1929)
    {
        float _2073 = fma(_1188, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2041);
        _2061 = _2073;
    }
    float _2075 = _2061;
    float _2077 = _1102 * _2067;
    float _2079 = -_2067;
    float _2081 = _1078 * _2079;
    float _2083 = _1080 * _2067;
    float _2085 = fma(_1132, _2071, _2077);
    float _2087 = fma(_2055, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2089 = precise::clamp(_2087, 0.0, 1.0);
    float _2091 = fma(_1100, _2071, _2081);
    float _2093 = fma(_1142, _2071, _2083);
    float _2095 = fma(_1136, _2075, _2085);
    float _2097 = fma(_2089, -2.0, 3.0);
    float _2099 = _2089 * _2089;
    float _2101 = fma(_1112, _2075, _2091);
    float _2103 = _2095 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2105 = _2095 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2107 = _2099 * _2097;
    float _2109 = fma(_1144, _2075, _2093);
    float _2111 = fma(_2101, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2103);
    float _2113 = _2103;
    if (!_1666)
    {
        _2113 = 1.0;
    }
    float _2115 = _2113;
    float _2117 = fma(_2101, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2105);
    float _2119 = _2095 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    bool _2121 = _1470 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2123 = isnan(_1470);
    bool _2125 = _2121 || _2123;
    bool _2127 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2129 = _2125 || _2127;
    float _2131 = fma(_2109, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2117);
    float _2133 = fma(_2101, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2119);
    float _2135 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1901);
    float _2137 = fma(_2109, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2133);
    float _2139 = fma(_2109, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2111);
    out.m_81.x = _2137;
    out.m_81.y = _2139;
    out.m_81.z = _2131;
    float _2141 = _2115;
    float _2143 = _2135;
    if (_1666)
    {
        bool _2145 = _1768 >= _1290;
        bool _2147 = isnan(_1768);
        bool _2149 = _2145 || _2147;
        bool _2151 = isnan(_1290);
        bool _2153 = _2149 || _2151;
        float _2155 = float(_2153);
        _2141 = _2155;
    }
    float _2157 = _2141;
    float _2159 = -_2107;
    float _2161 = _2159 + 1.0;
    float _2163 = fma(_2161, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2107);
    bool _2165 = _862 <= 8000.0;
    bool _2167 = isnan(_862);
    bool _2169 = _2165 || _2167;
    bool _2171 = isnan(8000.0);
    bool _2173 = _2169 || _2171;
    float _2175 = float(_2173);
    float _2177 = _2135 + _1750;
    float _2179 = _2157 * _1446;
    float _2181 = _2175 * _2163;
    float _2183 = _2177 * 0.5;
    out.gl_Position.x = _1792;
    out.gl_Position.y = _1794;
    out.gl_Position.z = _2135;
    out.gl_Position.w = _1750;
    float _2185 = _2181 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_83.z = _2183;
    out.m_83.w = _1750;
    float _2187 = -_1806;
    float _2189 = _2187 + 1.0;
    float _2191 = -_2051;
    float _2193 = _2191 + 1.0;
    float _2195 = _2189 * _2185;
    float _2197 = precise::clamp(_2195, 0.0, 1.0);
    float _2199 = _2193;
    if (!_2129)
    {
        _1764 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2201 = _1764;
    float _2203 = _2201;
    float _2205 = _2201;
    if (!_2129)
    {
        _2143 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2207 = _2143;
    float _2209 = -_2197;
    float _2211 = fma(_2209, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2213 = _2207;
    float _2215 = _2207;
    if (!_2129)
    {
        _2063 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2217 = _2063;
    float _2219 = -_2179;
    float _2221 = fma(_2219, _2211, 1.0);
    float _2223 = precise::clamp(_2221, 0.0, 1.0);
    float _2225 = _2051 * _1822;
    float _2227 = _2223 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2229 = _2223;
    float _2231 = _2217;
    float _2233 = _2217;
    if (!_2129)
    {
        _2229 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2235 = _2229;
    float _2237 = _1837 * _2225;
    float _2239 = _1837 * _2193;
    out.m_85.x = _2227;
    float _2241 = _2237;
    float _2243 = _2235;
    float _2245 = _2235;
    if (!_2129)
    {
        _2199 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2247 = _2199;
    float _2249 = _1845 * _2225;
    float _2251 = fma(_1841, _2237, _1831);
    float _2253 = fma(_1843, _2237, _1833);
    float _2255 = _2247;
    float _2257 = _2247;
    if (!_2129)
    {
        _2241 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2259 = _2241;
    float _2261 = fma(_1837, _2249, _1835);
    out.m_87.x = _2251;
    out.m_87.y = _2253;
    out.m_87.z = _2261;
    out.m_87.w = _2239;
    bool _2263 = !_2129;
    float _2265 = _2259;
    float _2267 = _2259;
    if (!_2263)
    {
        bool _2269 = _1470 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2271 = isnan(_1470);
        bool _2273 = _2269 || _2271;
        bool _2275 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2277 = _2273 || _2275;
        if (!_2277)
        {
            float _2279 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2281 = _1470 + _2279;
            float _2283 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2285 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2283;
            float _2287 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2289 = _2287 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2291 = 1.0 / _2285;
            float _2293 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2295 = _2293 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2297 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2299 = _2297 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2301 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2303 = _2301 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2305 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2307 = _2305 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2309 = _2281 * _2291;
            float _2311 = precise::clamp(_2309, 0.0, 1.0);
            float _2313 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2315 = _2313 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2317 = fma(_2311, _2289, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2319 = fma(_2311, _2315, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2321 = fma(_2311, _2295, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2323 = fma(_2311, _2299, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2325 = fma(_2311, _2303, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2327 = fma(_2311, _2307, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2245 = _2321;
            _2233 = _2325;
            _2267 = _2317;
            _2215 = _2323;
            _2205 = _2319;
            _2257 = _2327;
            _2329 = true;
        }
        else
        {
            bool _2331 = _1470 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2333 = isnan(_1470);
            bool _2335 = _2331 || _2333;
            bool _2337 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2339 = _2335 || _2337;
            if (!_2339)
            {
                _2265 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2341 = _2265;
            _2267 = _2341;
            if (!_2339)
            {
                _2243 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2343 = _2243;
            _2245 = _2343;
            if (!_2339)
            {
                _2203 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2345 = _2203;
            _2205 = _2345;
            if (!_2339)
            {
                _2213 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2347 = _2213;
            _2215 = _2347;
            if (!_2339)
            {
                _2231 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2349 = _2231;
            _2233 = _2349;
            if (!_2339)
            {
                _2255 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2351 = _2255;
            bool _2353 = !_2339;
            _2257 = _2351;
            if (!_2353)
            {
                bool _2355 = _1470 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2357 = isnan(_1470);
                bool _2359 = _2355 || _2357;
                bool _2361 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2363 = _2359 || _2361;
                if (!_2363)
                {
                    float _2365 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2367 = _1470 + _2365;
                    float _2369 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2371 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2369;
                    float _2373 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2375 = _2373 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2377 = 1.0 / _2371;
                    float _2379 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2381 = _2379 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2383 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2385 = _2383 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2387 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2389 = _2387 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2391 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2393 = _2391 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2395 = _2367 * _2377;
                    float _2397 = precise::clamp(_2395, 0.0, 1.0);
                    float _2399 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2401 = _2399 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2403 = fma(_2397, _2375, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2405 = fma(_2397, _2401, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2407 = fma(_2397, _2381, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2409 = fma(_2397, _2385, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2411 = fma(_2397, _2389, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2413 = fma(_2397, _2393, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2245 = _2407;
                    _2233 = _2411;
                    _2267 = _2403;
                    _2215 = _2409;
                    _2205 = _2405;
                    _2257 = _2413;
                    _2329 = true;
                }
                else
                {
                    _2245 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2233 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2267 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2215 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2205 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2257 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2329 = false;
    float _2415 = _2245;
    float _2417 = _2233;
    float _2419 = _2267;
    float _2421 = _2215;
    float _2423 = _2205;
    float _2425 = _2257;
    float _2427 = fma(_2139, -0.5, 0.5);
    float _2429 = precise::clamp(_2427, 0.0, 1.0);
    float _2431 = -_2415;
    float _2433 = _2431 + _2417;
    float _2435 = -_2419;
    float _2437 = _2435 + _2421;
    float _2439 = -_2423;
    float _2441 = _2439 + _2425;
    bool _2443 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2445 = fma(_2429, _2433, _2415);
    float _2447 = fma(_2429, _2437, _2419);
    float _2449 = fma(_2429, _2441, _2423);
    float _2451 = _2445 * 0.586610972881317138671875;
    out.m_61.x = 1.0;
    float _2453 = fma(_2447, 0.298911988735198974609375, _2451);
    float _2455 = fma(_2449, 0.114477999508380889892578125, _2453);
    out.m_89.x = 0.0;
    float _2457 = -_2455;
    float _2459 = _2447 + _2457;
    float _2461 = -_2455;
    float _2463 = _2445 + _2461;
    float _2465 = -_2455;
    float _2467 = _2449 + _2465;
    float _2469 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2471 = fma(_2459, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2455);
    float _2473 = fma(_2463, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2455);
    float _2475 = fma(_2467, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2455);
    out.m_91.x = 0.0;
    out.m_85.w = _2469;
    out.m_93.x = _2471;
    out.m_93.y = _2473;
    out.m_93.z = _2475;
    if (!_2443)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2477 = -_1362;
    float _2479 = _2477 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2481 = -_1364;
    float _2483 = _2481 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2485 = -_1366;
    float _2487 = _2485 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2489 = _2479 * _2479;
    float _2491 = fma(_2483, _2483, _2489);
    float _2493 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
    float _2495 = precise::clamp(_2493, 0.0, 1.0);
    float _2497 = fma(_2487, _2487, _2491);
    float _2499 = _2495 * _2495;
    float _2501 = rsqrt(_2497);
    float _2503 = _2479 * _2501;
    float _2505 = _2483 * _2501;
    float _2507 = _2487 * _2501;
    float _2509 = sqrt(_2497);
    float _2511 = -_1476;
    float _2513 = _2511 + _2503;
    float _2515 = -_1472;
    float _2517 = _2515 + _2505;
    float _2519 = -_1474;
    float _2521 = _2519 + _2507;
    float _2523 = _2513 * _2513;
    float _2525 = fma(_2517, _2517, _2523);
    float _2527 = fma(_2521, _2521, _2525);
    float _2529 = -_2509;
    float _2531 = _2529 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2533 = rsqrt(_2527);
    float _2535 = _2531 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2537 = precise::clamp(_2535, 0.0, 1.0);
    float _2539 = abs(_2537);
    float _2541 = log2(_2539);
    float _2543 = _2499 + (-1.0);
    float _2545 = _2513 * _2533;
    float _2547 = _2517 * _2533;
    float _2549 = _2521 * _2533;
    float _2551 = _2139 * _2545;
    float _2553 = _2139 * _2503;
    float _2555 = fma(_2137, _2547, _2551);
    float _2557 = _2541 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2559 = fma(_2137, _2505, _2553);
    float _2561 = fma(_2131, _2549, _2555);
    float _2563 = precise::clamp(_2561, 0.0, 1.0);
    float _2565 = fma(_2131, _2507, _2559);
    float _2567 = precise::clamp(_2565, 0.0, 1.0);
    float _2569 = exp2(_2557);
    float _2571 = _2563 * _2563;
    float _2573 = _2505 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2575 = fma(_2571, _2543, 1.0);
    float _2577 = -_2503;
    float _2579 = -_2573;
    float _2581 = fma(_2577, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2579);
    float _2583 = _2575 * _2575;
    float _2585 = -_2507;
    float _2587 = fma(_2585, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2581);
    float _2589 = 1.0 / _2583;
    float _2591 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2593 = _2587 + _2591;
    float _2595 = _2593 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2597 = precise::clamp(_2595, 0.0, 1.0);
    float _2599 = _2569 * _2597;
    float _2601 = _2567 * _2599;
    float _2603 = _2499 * _2589;
    float _2605 = _2601 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2607 = _2601 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2609 = _2601 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    float _2611 = _2601 * _2603;
    float _2613 = _2611 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2615 = _2611 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2617 = _2611 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_89.x = _2605;
    out.m_89.y = _2607;
    out.m_89.z = _2609;
    out.m_91.x = _2613;
    out.m_91.y = _2615;
    out.m_91.z = _2617;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

