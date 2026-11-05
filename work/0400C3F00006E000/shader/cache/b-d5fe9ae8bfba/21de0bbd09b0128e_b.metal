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
    constant _16* vp_c16 [[id(5)]];
    constant _16* vp_c13 [[id(6)]];
    constant _16* vp_c7 [[id(7)]];
    texture2d<float> vp_t_tcb_C [[id(8)]];
    sampler vp_t_tcb_CSmplr [[id(9)]];
    texture2d<float> vp_t_tcb_24 [[id(10)]];
    sampler vp_t_tcb_24Smplr [[id(11)]];
    texture2d_array<float> vp_t_tcb_16 [[id(12)]];
    sampler vp_t_tcb_16Smplr [[id(13)]];
    texture3d<float> vp_t_tcb_32 [[id(14)]];
    sampler vp_t_tcb_32Smplr [[id(15)]];
    texture3d<float> vp_t_tcb_30 [[id(16)]];
    sampler vp_t_tcb_30Smplr [[id(17)]];
    texture2d_array<float> vp_t_tcb_14 [[id(18)]];
    sampler vp_t_tcb_14Smplr [[id(19)]];
    texture2d<float> vp_t_tcb_1C [[id(20)]];
    sampler vp_t_tcb_1CSmplr [[id(21)]];
    sampler vp_t_tcb_24Smplr_w [[id(22)]];
    sampler vp_t_tcb_32Smplr_w [[id(23)]];
    sampler vp_t_tcb_30Smplr_w [[id(24)]];
    sampler vp_t_tcb_14Smplr_w [[id(25)]];
    sampler vp_t_tcb_1CSmplr_w [[id(26)]];
    constant dm_border_t* dm_border [[id(27)]];
};

struct main0_out
{
    float4 m_75 [[user(locn0)]];
    float4 m_63 [[user(locn2)]];
    float4 m_99 [[user(locn3)]];
    float4 m_83 [[user(locn4)]];
    float4 m_77 [[user(locn5)]];
    float4 m_91 [[user(locn6)]];
    float4 m_87 [[user(locn8)]];
    float4 m_89 [[user(locn9)]];
    float4 m_85 [[user(locn10)]];
    float4 m_97 [[user(locn11)]];
    float4 m_93 [[user(locn12)]];
    float4 m_95 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_71 [[attribute(1)]];
    float4 m_60 [[attribute(2)]];
    float4 m_65 [[attribute(3)]];
    float4 m_81 [[attribute(4)]];
    float4 m_67 [[attribute(6)]];
    float4 m_79 [[attribute(7)]];
    float4 m_73 [[attribute(8)]];
    float4 m_69 [[attribute(9)]];
};

static inline __attribute__((always_inline))
int _112(thread const int& _7824, thread const int& _7825, constant _10& support_buffer)
{
    float _7828 = as_type<float>(support_buffer._m4);
    int _7830 = _7825 + as_type<int>(_7828);
    int _7832 = 1 + _7830;
    float _7834 = support_buffer._m5[_7832].x;
    float _7836 = abs(_7834);
    bool _7838 = _7836 == 1.0;
    if (_7838)
    {
        return _7824;
    }
    float _7840 = float(_7824);
    float _7842 = _7840 / _7836;
    int _7844 = int(_7842);
    return _7844;
}

static inline __attribute__((always_inline))
int _113(thread const int& _7874, thread const int& _7875, constant _10& support_buffer)
{
    float _7878 = as_type<float>(support_buffer._m4);
    int _7880 = _7875 + as_type<int>(_7878);
    int _7882 = 1 + _7880;
    float _7884 = support_buffer._m5[_7882].x;
    bool _7886 = _7884 == 1.0;
    if (_7886)
    {
        return _7874;
    }
    float _7888 = float(_7874);
    float _7890 = _7888 * _7884;
    int _7892 = int(_7890);
    return _7892;
}

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2779 = false;
    bool _1559 = false;
    bool _199 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _117 = in.m_60.w;
    float _119 = trunc(_117);
    int _121 = int(_119);
    bool _125 = _121 >= 1;
    float _127 = 0.0;
    if (!_125)
    {
        _127 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _129 = _127;
    float _131 = _129;
    if (!_125)
    {
        out.m_63.x = 0.0;
    }
    int _133 = 0;
    if (!_125)
    {
        float _135 = _129 * 5.0;
        _133 = as_type<int>(_135);
    }
    int _137 = _133;
    int _139 = _137;
    if (!_125)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3064 = as_type<float>(_137);
        out.gl_Position.z = _3064;
    }
    if (!_125)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _141 = in.m_65.w;
    bool _143 = _141 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _145 = isnan(_141);
    bool _147 = _143 || _145;
    bool _149 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _151 = _147 || _149;
    float _153 = -_141;
    float _155 = _153 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _157 = _155;
    if (_151)
    {
        float _159 = float(_121);
        _131 = _159;
    }
    float _161 = _131;
    bool _163 = _155 >= _161;
    bool _165 = !_151;
    bool _167 = _163 || _165;
    float _169 = _161;
    if (_167)
    {
        _169 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _171 = _169;
    if (_167)
    {
        out.m_63.x = 0.0;
    }
    if (_167)
    {
        float _173 = _171 * 5.0;
        _139 = as_type<int>(_173);
    }
    int _175 = _139;
    if (_167)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3134 = as_type<float>(_175);
        out.gl_Position.z = _3134;
    }
    if (_167)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _177 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _179 = !_177;
    float _197;
    if (!_179)
    {
        float _181 = in.m_67.x;
        float _183 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _185 = _181 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _187 = fma(_185, (*spvDescriptorSet0.vp_c9)._m0[12].x, _155);
        float _189 = _187 * _183;
        float _191 = floor(_189);
        float _193 = -_191;
        float _195 = _189 + _193;
        _197 = _195;
        _199 = true;
    }
    else
    {
        float _201 = float(_121);
        float _203 = 1.0 / _201;
        float _205 = _155 * _203;
        _197 = _205;
    }
    _199 = false;
    float _207 = _197;
    int _209 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _211 = _209;
    int _213 = 0;
    int _215 = _112(_211, _213, (*spvDescriptorSet0.support_buffer));
    float _217 = in.m_67.x;
    float _219 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _221 = in.m_69.z;
    float _223 = in.m_67.w;
    float _225 = in.m_69.y;
    float _227 = _217 * 8.0;
    float _229 = trunc(_221);
    int _231 = int(_229);
    float _233 = rint(_227);
    float _235 = _233 * 0.125;
    float _237 = precise::clamp(_235, 0.0, 1.0);
    int _239 = _215 + (-1);
    float _241 = float(_239);
    float _243 = _237 * _241;
    float _245 = trunc(_243);
    int _247 = int(_245);
    float _249 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _251 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _249;
    float _253 = 1.0 / _251;
    int _255 = _247 + 1;
    int _257 = min(_239, _255);
    int _259 = _247;
    int _261 = 0;
    int _263 = _113(_259, _261, (*spvDescriptorSet0.support_buffer));
    int _265 = _231;
    int _267 = 0;
    int _269 = _113(_265, _267, (*spvDescriptorSet0.support_buffer));
    float3 _273 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_263, _269)), 0).xyz;
    float _275 = _273.x;
    float _277 = _273.y;
    float _279 = _273.z;
    int _281 = _257;
    int _283 = 0;
    int _285 = _113(_281, _283, (*spvDescriptorSet0.support_buffer));
    int _287 = _231;
    int _289 = 0;
    int _291 = _113(_287, _289, (*spvDescriptorSet0.support_buffer));
    float3 _293 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_285, _291)), 0).xyz;
    float _295 = _293.x;
    float _297 = _293.y;
    float _299 = _293.z;
    float _301 = in.m_67.z;
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _305 = _303 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _309 = _207 + _307;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _313 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _311;
    int _315 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _317 = _315 != 0;
    float _319 = 1.0 / _305;
    int _321 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _323 = _321 != 0;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _327 = _325 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _329 = in.m_69.x;
    int _331 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _333 = _331 != 0;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _337 = _207 + _335;
    bool _339 = _223 > 0.5;
    float _341 = 1.0 / _313;
    float _343 = -_225;
    float _345 = _343 + 1.0;
    int _347 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _349 = _347 != 0;
    int _351 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _353 = _351 != 0;
    int _355 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _357 = _355 != 0;
    float _359 = _309 * _253;
    float _361 = _225;
    float _363 = _207;
    if (_317)
    {
        float _365 = _339 ? _345 : _225;
        _361 = _365;
    }
    float _367 = _361;
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _371 = _207 + _369;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _375 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _373;
    float _377 = 1.0 / _327;
    bool _379 = _301 > 0.5;
    bool _381 = _379 && _323;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _385 = _207 + _383;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _389 = _207 + _387;
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _393 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _391;
    float _395 = _371 * _341;
    float _397 = _385 * _319;
    float _399 = 1.0 / _375;
    float _401 = _301 * 2.0;
    float _403 = _217 + _301;
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _407 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _405;
    float _409 = fma(_393, _359, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _411 = _403 + (-1.0);
    float _413 = floor(_401);
    float _415 = _217 * 2.0;
    float _417 = fma(_411, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _419 = _389 * _377;
    float _421 = _219 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _423 = fma(_407, _359, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _427 = _425 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _429 = floor(_415);
    float _431 = _337 * _399;
    float _433 = _399;
    float _435 = _401;
    if (_323)
    {
        _433 = _329;
    }
    float _437 = _433;
    float _439 = fma(_421, _367, -0.5);
    float _441 = _437;
    if (!_323)
    {
        _435 = _329;
    }
    float _443 = _435;
    float _445 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _447 = _445 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _449 = _443;
    if (_381)
    {
        float _451 = -_437;
        float _453 = _451 + 1.0;
        _441 = _453;
    }
    float _455 = _441;
    bool _457 = _413 >= 0.0;
    bool _459 = isnan(_413);
    bool _461 = _457 || _459;
    bool _463 = isnan(0.0);
    bool _465 = _461 || _463;
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _469 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _467;
    float _471 = fma(_427, _397, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _475 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _473;
    if (_323)
    {
        _449 = _455;
    }
    float _477 = _449;
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _481 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _479;
    int _483 = _465 ? 0 : 1;
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _487 = _485 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    bool _489 = _429 > 0.0;
    float _491 = fma(_481, _359, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _493 = _429 >= 0.0;
    bool _495 = isnan(_429);
    bool _497 = _493 || _495;
    bool _499 = isnan(0.0);
    bool _501 = _497 || _499;
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _505 = _503 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _507 = (*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _509 = _477;
    if (!_333)
    {
        float _511 = in.m_67.y;
        _507 = _511;
    }
    float _513 = _507;
    float _515 = fma(_447, _397, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _517 = fma(_505, _397, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _519 = fma(_475, _395, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _521 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _523 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _521;
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _527 = _525 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _529 = fma(_469, _395, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _531 = fma(_487, _419, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _533 = fma(_523, _395, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _535 = fma(_527, _419, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    bool _537 = _207 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _539 = isnan(_207);
    bool _541 = _537 || _539;
    bool _543 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _545 = _541 || _543;
    float _547 = float(_545);
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _551 = _549 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    bool _553 = _207 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _555 = isnan(_207);
    bool _557 = _553 || _555;
    bool _559 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _561 = _557 || _559;
    float _563 = float(_561);
    float _565 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _567 = _207 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _569 = isnan(_207);
    bool _571 = _567 || _569;
    bool _573 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _575 = _571 || _573;
    float _577 = float(_575);
    float _579 = fma(_551, _419, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    bool _581 = _207 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _583 = isnan(_207);
    bool _585 = _581 || _583;
    bool _587 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _589 = _585 || _587;
    float _591 = float(_589);
    float _593 = -_563;
    float _595 = _593 + 1.0;
    bool _597 = _207 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _599 = isnan(_207);
    bool _601 = _597 || _599;
    bool _603 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _605 = _601 || _603;
    float _607 = float(_605);
    bool _609 = _207 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _611 = isnan(_207);
    bool _613 = _609 || _611;
    bool _615 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _617 = _613 || _615;
    float _619 = float(_617);
    float _621 = _577 * _595;
    float _623 = -_577;
    float _625 = _623 + 1.0;
    bool _627 = _413 > 0.0;
    float _629 = -_547;
    float _631 = _629 + 1.0;
    if (!_333)
    {
        _363 = _513;
    }
    float _633 = _363;
    float _635 = _619 * _625;
    float _637 = -_619;
    float _639 = _637 + 1.0;
    float _641 = -_607;
    float _643 = _641 + 1.0;
    float _645 = _633;
    float _647 = _513;
    if (_333)
    {
        float _649 = in.m_67.x;
        float _651 = in.m_67.y;
        _645 = _649;
        _647 = _651;
    }
    float _653 = _645;
    float _655 = _647;
    float _657 = _563 * _631;
    float _659 = _607 * _639;
    float _661 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _663 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _661;
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _667 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _665;
    float _669 = _591 * _643;
    float _671 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _673 = log2(_671);
    float _675 = fma(_663, _431, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _677 = fma(_667, _431, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _679 = _491 * _669;
    float _681 = _409 * _669;
    float _683 = _423 * _669;
    float _685 = _565 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _687 = -_591;
    float _689 = _687 + 1.0;
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _693 = fma(_685, _477, -0.5);
    float _695 = fma(_689, (*spvDescriptorSet0.vp_c9)._m0[143].x, _679);
    float _697 = fma(_689, (*spvDescriptorSet0.vp_c9)._m0[143].y, _681);
    if (!_333)
    {
        _509 = _301;
    }
    float _699 = _509;
    float _701 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _703 = fma(_653, (*spvDescriptorSet0.vp_c9)._m0[83].z, _691);
    float _705 = _653 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _707 = _653;
    float _709 = _699;
    if (!_333)
    {
        _707 = _301;
    }
    float _711 = _707;
    float _713 = _673 * _155;
    float _715 = _711;
    if (_333)
    {
        _715 = _655;
    }
    float _717 = _715;
    float _719 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    if (_333)
    {
        _709 = _655;
    }
    float _721 = _709;
    float _723 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _725 = fma(_717, (*spvDescriptorSet0.vp_c9)._m0[83].w, _701);
    float _727 = -_719;
    float _729 = fma(_705, 2.0, _727);
    float _731 = _721 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _733 = _501 ? 0 : 1;
    float _735 = exp2(_713);
    float _737 = fma(_517, _659, _695);
    float _739 = fma(_731, -2.0, _723);
    float _741 = _301 + _655;
    float _743 = _217 + _655;
    float _745 = fma(_689, (*spvDescriptorSet0.vp_c9)._m0[143].z, _683);
    float _747 = _655 * 2.0;
    int _749 = ~_483;
    int _751 = _749 + 1;
    int _753 = _751 + 1;
    float _755 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _757 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _755;
    int _759 = ~_733;
    int _761 = _759 + 1;
    int _763 = _761 + 1;
    float _765 = _741 + (-1.0);
    int _767 = _753;
    int _769 = _763;
    if (!_627)
    {
        int _771 = ~_483;
        int _773 = _771 + 1;
        _767 = _773;
    }
    int _775 = _767;
    float _777 = _743 + (-1.0);
    if (!_489)
    {
        int _779 = ~_733;
        int _781 = _779 + 1;
        _769 = _781;
    }
    int _783 = _769;
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _787 = 1.0 + _785;
    float _789 = floor(_747);
    bool _791 = !_349;
    int _793 = _791 ? 0 : 1;
    float _795 = fma(_757, _431, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _797 = fma(_765, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _799 = abs(_793);
    float _801 = -_735;
    float _803 = _801 + 1.0;
    bool _805 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _807 = isnan(1.0);
    bool _809 = _805 || _807;
    bool _811 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _813 = _809 || _811;
    float _815 = 1.0 / _787;
    float _817 = fma(_777, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _819 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _821 = isnan(0.0);
    bool _823 = _819 || _821;
    bool _825 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _827 = _823 || _825;
    float _829 = in.m_71.x;
    float _831 = in.m_71.y;
    float _833 = in.m_71.z;
    float _835 = float(_799);
    float _837 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[82].z, _703);
    float _839 = float(_775);
    float _841 = _217 + (-0.5);
    bool _843 = !_353;
    int _845 = _843 ? 0 : 1;
    float _847 = -_155;
    float _849 = fma(_847, (*spvDescriptorSet0.vp_c9)._m0[81].x, _729);
    float _851 = _827 ? _803 : 0.0;
    float _853 = _835 * _839;
    bool _855 = _789 > 0.0;
    float _857 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[81].y, _739);
    bool _859 = _789 >= 0.0;
    bool _861 = isnan(_789);
    bool _863 = _859 || _861;
    bool _865 = isnan(0.0);
    bool _867 = _863 || _865;
    float _869 = fma(_515, _659, _745);
    int _871 = abs(_845);
    float _873 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[82].w, _725);
    float _875 = _797;
    if (_813)
    {
        float _877 = _851 * _815;
        _157 = _877;
    }
    float _879 = _157;
    float _881 = _853 * (-2.0);
    float _883 = float(_871);
    float _885 = fma(_519, _635, _737);
    float _887 = float(_783);
    float _889 = -_857;
    float _891 = fma(_873, _439, _889);
    int _893 = _867 ? 0 : 1;
    float _895 = fma(_531, _621, _885);
    bool _897 = !_357;
    int _899 = _897 ? 0 : 1;
    float _901 = _883 * _887;
    float _903 = fma(_881, _829, _829);
    int _905 = ~_893;
    int _907 = _905 + 1;
    int _909 = _907 + 1;
    float _911 = fma(_817, _881, _817);
    float _913 = _901 * (-2.0);
    int _915 = abs(_899);
    float _917 = fma(_841, (*spvDescriptorSet0.vp_c9)._m0[196].x, _903);
    int _919 = _909;
    float _921 = _891;
    if (!_855)
    {
        int _923 = ~_893;
        int _925 = _923 + 1;
        _919 = _925;
    }
    int _927 = _919;
    float _929 = fma(_913, _831, _831);
    float _931 = float(_915);
    float _933 = _655 + (-0.5);
    float _935 = float(_927);
    float _937 = fma(_471, _659, _697);
    float _939 = fma(_797, _913, _797);
    float _941 = fma(_933, (*spvDescriptorSet0.vp_c9)._m0[196].y, _929);
    float _943 = fma(_911, _879, _917);
    float _945 = _931 * _935;
    float _947 = fma(_533, _635, _937);
    float _949 = _301 + (-0.5);
    float _951 = fma(_939, _879, _941);
    float _953 = _945 * (-2.0);
    float _955 = _943 * 0.15915493667125701904296875;
    float _957 = fma(_535, _621, _947);
    float _959 = _951 * 0.15915493667125701904296875;
    float _961 = fma(_953, _833, _833);
    float _963 = fma(_417, _953, _417);
    float _965 = fma(_529, _635, _869);
    float _967 = _955 * 6.283185482025146484375;
    float _969 = sin(_967);
    float _971 = fma(_949, (*spvDescriptorSet0.vp_c9)._m0[196].z, _961);
    float _973 = fma(_579, _621, _965);
    float _975 = fma(_963, _879, _971);
    float _977 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _979 = _959 * 6.283185482025146484375;
    float _981 = sin(_979);
    float _983 = _975 * 0.15915493667125701904296875;
    float _985 = in.m_73.x;
    float _987 = in.m_73.y;
    float _989 = in.m_73.z;
    float _991 = in.m_73.w;
    float _993 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _995 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _997 = fma(_837, _693, _849);
    float _999 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1001 = _955 * 6.283185482025146484375;
    float _1003 = cos(_1001);
    float _1005 = _993 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1007 = _977 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1009 = _995 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1011 = fma(_675, _657, _895);
    float _1013 = fma(_795, _657, _973);
    float _1015 = fma(_677, _657, _957);
    float _1017 = _997 + 0.5;
    float _1019 = _959 * 6.283185482025146484375;
    float _1021 = cos(_1019);
    float _1023 = _969 * _981;
    float _1025 = fma(_547, (*spvDescriptorSet0.vp_c9)._m0[148].z, _1013);
    out.m_75.x = _1005;
    out.m_75.y = _1007;
    out.m_75.z = _1009;
    out.m_75.w = _999;
    float _1027 = fma(_547, (*spvDescriptorSet0.vp_c9)._m0[148].x, _1011);
    float _1029 = fma(_547, (*spvDescriptorSet0.vp_c9)._m0[148].y, _1015);
    float _1031 = _891 + 0.5;
    float _1033 = _983 * 6.283185482025146484375;
    float _1035 = cos(_1033);
    out.m_77.z = _1017;
    out.m_77.w = _1031;
    float _1037 = _983 * 6.283185482025146484375;
    float _1039 = sin(_1037);
    float _1041 = _1003 * _1021;
    float _1043 = _1003 * _981;
    float _1045 = _1003 * _1035;
    float _1047 = _981 * _1035;
    float _1049 = _1021 * _1035;
    float _1051 = _969 * _1035;
    float _1053 = _1045 * _987;
    float _1055 = fma(_1039, _1041, _1023);
    float _1057 = fma(_1039, _1023, _1041);
    float _1059 = _969 * _1021;
    float _1061 = in.m_79.x;
    float _1063 = in.m_79.y;
    float _1065 = in.m_79.z;
    float _1067 = -_987;
    float _1069 = _1039 * _1067;
    float _1071 = fma(_1055, _985, _1053);
    float _1073 = -_1059;
    float _1075 = fma(_1039, _1043, _1073);
    float _1077 = -_1043;
    float _1079 = fma(_1039, _1059, _1077);
    float _1081 = floor(_243);
    float _1083 = fma(_1049, _985, _1069);
    float _1085 = fma(_1075, _989, _1071);
    float _1087 = _1051 * _987;
    float _1089 = in.m_60.x;
    float _1091 = in.m_60.y;
    float _1093 = in.m_60.z;
    float _1095 = fma(_1047, _989, _1083);
    float _1097 = _1085 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1099 = fma(_1079, _985, _1087);
    float _1101 = _1085 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1103 = _1085 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1105 = fma(_1095, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1097);
    float _1107 = fma(_1057, _989, _1099);
    float _1109 = fma(_1095, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1101);
    float _1111 = fma(_1095, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1103);
    float _1113 = fma(_1107, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1105);
    float _1115 = fma(_1107, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1109);
    float _1117 = -_1081;
    float _1119 = _243 + _1117;
    float _1121 = -_275;
    float _1123 = _1121 + _295;
    float _1125 = _1027 * _1061;
    float _1127 = -_277;
    float _1129 = _1127 + _297;
    float _1131 = _1029 * _1063;
    float _1133 = -_279;
    float _1135 = _1133 + _299;
    float _1137 = fma(_1119, _1129, _277);
    float _1139 = fma(_1119, _1123, _275);
    float _1141 = fma(_1107, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1111);
    float _1143 = in.m_81.x;
    float _1145 = in.m_81.y;
    float _1147 = in.m_81.z;
    float _1149 = fma(_1119, _1135, _279);
    bool _1151 = _1137 != 0.0;
    bool _1153 = isnan(_1137);
    bool _1155 = _1151 || _1153;
    bool _1157 = isnan(0.0);
    bool _1159 = _1155 || _1157;
    float _1161 = _1091 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    out.m_83.x = 1.0;
    out.m_83.y = 1.0;
    out.m_83.z = 1.0;
    float _1163 = _1025 * _1065;
    bool _1165 = _1139 == 0.0;
    bool _1167 = !_1159;
    bool _1169 = _1165 && _1167;
    float _1171 = fma(_1089, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1161);
    out.m_85.x = _1113;
    out.m_85.y = _1115;
    out.m_85.z = _1141;
    bool _1173 = _1149 == 0.0;
    bool _1175 = _1173 && _1169;
    float _1177 = _1091 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1179 = _1091 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1181 = _1131 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1183 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1137);
    float _1185 = fma(_1089, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1177);
    float _1187 = fma(_1089, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1179);
    float _1189 = fma(_1093, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1171);
    float _1191 = _1183 * _1181;
    float _1193 = _1125 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1195 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1139);
    float _1197 = _1163 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1199 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1149);
    float _1201 = _1045 * _1191;
    float _1203 = _1195 * _1193;
    float _1205 = fma(_1093, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1185);
    float _1207 = fma(_1093, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1187);
    float _1209 = -_1191;
    float _1211 = _1039 * _1209;
    float _1213 = _1051 * _1191;
    float _1215 = _1199 * _1197;
    float _1217 = fma(_1055, _1203, _1201);
    float _1219 = _1211;
    float _1221 = _1081;
    float _1223 = _1217;
    float _1225 = _1149;
    float _1227 = _1111;
    if (_1175)
    {
        _921 = _1143;
    }
    float _1229 = _921;
    float _1231 = fma(_1049, _1203, _1211);
    float _1233 = fma(_1079, _1203, _1213);
    float _1235 = fma(_1075, _1215, _1217);
    float _1237 = _1229;
    float _1239 = _1235;
    if (_1175)
    {
        _1219 = _1229;
    }
    float _1241 = _1219;
    float _1243 = _1205 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1245 = _1241;
    if (!_1175)
    {
        _1237 = _1143;
    }
    float _1247 = _1237;
    float _1249 = fma(_1047, _1215, _1231);
    float _1251 = _1235 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1253 = _1235 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1255 = fma(_1057, _1215, _1233);
    float _1257 = _1207 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1259 = fma(_1249, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1251);
    float _1261 = fma(_1249, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1253);
    float _1263 = _1251;
    if (_1175)
    {
        _1221 = _1145;
    }
    float _1265 = _1221;
    float _1267 = _1265;
    if (!_1175)
    {
        float _1269 = fma(_1139, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1247);
        _1245 = _1269;
    }
    float _1271 = _1245;
    float _1273 = fma(_1255, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1259);
    float _1275 = fma(_1255, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1261);
    if (_1175)
    {
        _875 = _1147;
    }
    float _1277 = _875;
    float _1279 = _989 * _1247;
    float _1281 = _1243 + _1273;
    float _1283 = _1257 + _1275;
    float _1285 = _1277;
    float _1287 = _1281;
    float _1289 = _1283;
    if (_1175)
    {
        _1263 = _1265;
    }
    float _1291 = _1263;
    float _1293 = _1291;
    if (!_1175)
    {
        _1267 = _1145;
    }
    float _1295 = _1267;
    float _1297 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1299 = _1281 + _1297;
    if (_1175)
    {
        _1223 = _1277;
    }
    float _1301 = _1223;
    float _1303 = _1301;
    if (!_1175)
    {
        _1285 = _1147;
    }
    float _1305 = _1285;
    float _1307 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1309 = _1283 + _1307;
    if (!_1175)
    {
        float _1311 = fma(_1137, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1295);
        _1293 = _1311;
    }
    float _1313 = _1293;
    float _1315 = _1299 * _1299;
    float _1317 = _985 * _1295;
    float _1319 = _1309 * _1309;
    float _1321 = _987 * _1305;
    float _1323 = _1315;
    float _1325 = _1319;
    if (!_1175)
    {
        float _1327 = fma(_1149, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1305);
        _1303 = _1327;
    }
    float _1329 = _1303;
    float _1331 = -_1317;
    float _1333 = fma(_987, _1247, _1331);
    float _1335 = _1315 + _1319;
    float _1337 = -_1321;
    float _1339 = fma(_989, _1295, _1337);
    float _1341 = -_1279;
    float _1343 = fma(_985, _1305, _1341);
    float _1345 = _1333 * _991;
    float _1347 = sqrt(_1335);
    float _1349 = _1339 * _991;
    float _1351 = _1343 * _991;
    float _1353 = _1045 * _1313;
    float _1355 = _1051 * _1313;
    float _1357 = -_1313;
    float _1359 = _1039 * _1357;
    float _1361 = -_1351;
    float _1363 = _1039 * _1361;
    float _1365 = _1045 * _1351;
    float _1367 = _1051 * _1351;
    float _1369 = _1235 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1371 = fma(_1079, _1271, _1355);
    float _1373 = fma(_1049, _1271, _1359);
    float _1375 = fma(_1079, _1349, _1367);
    float _1377 = fma(_1249, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1369);
    float _1379 = fma(_1055, _1271, _1353);
    float _1381 = fma(_1049, _1349, _1363);
    bool _1383 = _1347 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1385 = fma(_1255, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1377);
    float _1387 = _1189 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1389 = fma(_1055, _1349, _1365);
    float _1391 = fma(_1057, _1329, _1371);
    float _1393 = fma(_1057, _1345, _1375);
    float _1395 = _1387 + _1385;
    float _1397 = fma(_1047, _1329, _1373);
    float _1399 = fma(_1075, _1329, _1379);
    float _1401 = fma(_1047, _1345, _1381);
    float _1403 = fma(_1075, _1345, _1389);
    if (!_1383)
    {
        _1225 = _1395;
    }
    float _1405 = _1225;
    bool _1407 = !_1383;
    float _1409 = _1405;
    if (!_1407)
    {
        float _1411 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1413 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1415 = _1347 + _1413;
        float _1417 = rsqrt(_1335);
        float _1419 = _1415 * _1411;
        float _1421 = _1395 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1423 = _1419 * 0.15915493667125701904296875;
        float _1425 = _1423 * 6.283185482025146484375;
        float _1427 = sin(_1425);
        float _1429 = _1423 * 6.283185482025146484375;
        float _1431 = cos(_1429);
        float _1433 = fma(_1427, _1421, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1435 = _1417 * _1433;
        float _1437 = fma(_1299, _1435, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1439 = _1431 + (-1.0);
        float _1441 = fma(_1309, _1435, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1443 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1445 = _1437 + _1443;
        float _1447 = _1439 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1449 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1451 = _1441 + _1449;
        float _1453 = _1445 * _1445;
        float _1455 = fma(_1395, _1431, _1447);
        float _1457 = _1451 * _1451;
        _1409 = _1455;
        _1323 = _1453;
        _1325 = _1457;
        _1287 = _1437;
        _1289 = _1441;
    }
    float _1459 = _1409;
    float _1461 = _1323;
    float _1463 = _1325;
    float _1465 = _1287;
    float _1467 = _1289;
    float _1469 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1471 = _1459 + _1469;
    float _1473 = _1403 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1475 = _1403 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1477 = _1403 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1479 = fma(_1471, _1471, _1461);
    float _1481 = fma(_1401, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1473);
    float _1483 = fma(_1401, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1475);
    float _1485 = fma(_1401, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1477);
    float _1487 = _1479 + _1463;
    float _1489 = _1399 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1491 = _1399 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1493 = _1399 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1495 = fma(_1397, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1489);
    float _1497 = sqrt(_1487);
    float _1499 = fma(_1397, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1491);
    float _1501 = fma(_1397, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1493);
    float _1503 = fma(_1393, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1481);
    float _1505 = fma(_1391, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1495);
    float _1507 = fma(_1391, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1499);
    float _1509 = fma(_1393, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1483);
    float _1511 = fma(_1393, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1485);
    float _1513 = fma(_1391, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1501);
    out.m_87.x = _1503;
    out.m_87.y = _1509;
    out.m_87.z = _1511;
    out.m_89.x = _1505;
    out.m_89.y = _1507;
    out.m_89.z = _1513;
    bool _1515 = _1497 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1517 = isnan(_1497);
    bool _1519 = _1515 || _1517;
    bool _1521 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1523 = _1519 || _1521;
    if (!_1523)
    {
        _1239 = 1.0;
    }
    float _1525 = _1239;
    bool _1527 = !_1523;
    float _1529 = _1525;
    if (!_1527)
    {
        bool _1531 = _1497 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1533 = isnan(_1497);
        bool _1535 = _1531 || _1533;
        bool _1537 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1539 = _1535 || _1537;
        if (!_1539)
        {
            float _1541 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1543 = _1497 + _1541;
            float _1545 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1547 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1545;
            float _1549 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1551 = _1549 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1553 = 1.0 / _1547;
            float _1555 = _1543 * _1553;
            float _1557 = fma(_1555, _1551, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1529 = _1557;
            _1559 = true;
        }
        else
        {
            bool _1561 = _1497 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1563 = isnan(_1497);
            bool _1565 = _1561 || _1563;
            bool _1567 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1569 = _1565 || _1567;
            if (!_1569)
            {
                float _1571 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1573 = _1497 + _1571;
                float _1575 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1577 = _1575 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1579 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1581 = _1579 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1583 = 1.0 / _1577;
                float _1585 = _1573 * _1583;
                float _1587 = fma(_1585, _1581, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1529 = _1587;
                _1559 = true;
            }
            else
            {
                _1529 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1559 = false;
    float _1589 = _1529;
    float _1591 = fma(_1243, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1593 = fma(_1257, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1595 = floor(_1591);
    float _1597 = floor(_1593);
    float _1599 = -_1595;
    float _1601 = _1591 + _1599;
    float _1603 = -_1597;
    float _1605 = _1593 + _1603;
    float2 _5427 = float2(_1601, _1605);
    float _1607 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5427, float2(0.0), isnan(_5427)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5427, float2(0.0), isnan(_5427)), level(0.0)).x;
    float _1609 = _1387 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1611 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1613 = _1459 + _1611;
    float _1615 = fma(_1243, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1609);
    float _1617 = fma(_1613, _1589, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1619 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1615);
    float _1621 = _1387 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1623 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1625 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1627 = _1623 || _1625;
    bool _1629 = isnan(0.5);
    bool _1631 = _1627 || _1629;
    float _1633 = _1619 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1635 = fma(_1243, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1621);
    float _1637 = 1.0 / _1633;
    float _1639 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1635);
    float _1641 = _1639 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1643 = _1641 + _1633;
    float _1645 = _1643 * _1637;
    float _1647 = _1645 * 0.5;
    float _1649 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1651 = fma(_1647, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1649);
    float _1653 = 1.0 / _1651;
    float _1655 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _1657 = _1387 + _1655;
    float _1659 = _1657 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1661 = fma(_1243, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1659);
    float _1663 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1665 = _1653 * _1663;
    float _1667 = _1657 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1669 = fma(_1257, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1661);
    bool _1671 = _1665 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1673 = fma(_1243, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1667);
    bool _1675 = _1665 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1677 = _1669 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _1679 = !_1671;
    int _1681 = _1679 ? 0 : 1;
    float _1683 = fma(_1257, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1673);
    float _1685 = trunc(_1677);
    int _1687 = int(_1685);
    float _1689 = _1683 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    int _1691 = 2;
    float _1693 = _1613;
    float _1695 = _1589;
    float _1697 = _1617;
    if (!_1671)
    {
        _1691 = 1;
    }
    int _1699 = _1691;
    int _1701 = _1699;
    if (!_1675)
    {
        _1701 = _1681;
    }
    int _1703 = _1701;
    float _1705 = trunc(_1689);
    int _1707 = int(_1705);
    int _1709 = _1703 << 6;
    int _1711 = _1709 + 48;
    uint _1714 = uint(int(uint(_1711) >> uint(2)));
    uint _1716 = uint(int(uint(int(_1714)) >> uint(2)));
    int _1718 = int(_1714) & 3;
    float _1720 = (*spvDescriptorSet0.vp_c15)._m0[int(_1716)][_1718];
    int _1722 = int(_1714) + 1;
    uint _1724 = uint(int(uint(_1722) >> uint(2)));
    int _1726 = _1722 & 3;
    float _1728 = (*spvDescriptorSet0.vp_c15)._m0[int(_1724)][_1726];
    int _1730 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1732 = _1687 + _1730;
    int _1734 = _1732 + 1;
    bool _1736 = _1734 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1738 = _1709 + 56;
    uint _1740 = uint(int(uint(_1738) >> uint(2)));
    uint _1742 = uint(int(uint(int(_1740)) >> uint(2)));
    int _1744 = int(_1740) & 3;
    float _1746 = (*spvDescriptorSet0.vp_c15)._m0[int(_1742)][_1744];
    int _1748 = int(_1740) + 1;
    uint _1750 = uint(int(uint(_1748) >> uint(2)));
    int _1752 = _1748 & 3;
    float _1754 = (*spvDescriptorSet0.vp_c15)._m0[int(_1750)][_1752];
    int _1756 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1758 = _1707 + _1756;
    int _1760 = _1758 + 1;
    float _1762 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1764 = _1465 + _1762;
    int _1766 = _1734 | _1760;
    float _1768 = fma(_1764, _1589, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    int _1770 = _1709 + 64;
    uint _1772 = uint(int(uint(_1770) >> uint(2)));
    uint _1774 = uint(int(uint(int(_1772)) >> uint(2)));
    int _1776 = int(_1772) & 3;
    float _1778 = (*spvDescriptorSet0.vp_c15)._m0[int(_1774)][_1776];
    int _1780 = int(_1772) + 1;
    uint _1782 = uint(int(uint(_1780) >> uint(2)));
    int _1784 = _1780 & 3;
    float _1786 = (*spvDescriptorSet0.vp_c15)._m0[int(_1782)][_1784];
    bool _1788 = _1766 < 0;
    bool _1790 = _1788 || _1736;
    float _1792 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1794 = _1467 + _1792;
    float _1796 = _1764;
    int _1798 = _1734;
    float _1800 = as_type<float>(_1760);
    if (_1631)
    {
        _1693 = _1768;
    }
    float _1802 = _1693;
    bool _1804 = _1760 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1806 = _1804 || _1790;
    float _1808 = fma(_1794, _1589, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1810 = _1802;
    if (_1631)
    {
        _1695 = _1617;
    }
    float _1812 = _1695;
    int _1814 = _1709 + 72;
    uint _1816 = uint(int(uint(_1814) >> uint(2)));
    uint _1818 = uint(int(uint(int(_1816)) >> uint(2)));
    int _1820 = int(_1816) & 3;
    float _1822 = (*spvDescriptorSet0.vp_c15)._m0[int(_1818)][_1820];
    int _1824 = int(_1816) + 1;
    uint _1826 = uint(int(uint(_1824) >> uint(2)));
    int _1828 = _1824 & 3;
    float _1830 = (*spvDescriptorSet0.vp_c15)._m0[int(_1826)][_1828];
    float _1832 = _1812;
    if (_1631)
    {
        _1796 = _1808;
    }
    float _1834 = _1796;
    int _1836 = _1709 + 96;
    uint _1838 = uint(int(uint(_1836) >> uint(2)));
    uint _1840 = uint(int(uint(int(_1838)) >> uint(2)));
    int _1842 = int(_1838) & 3;
    float _1844 = (*spvDescriptorSet0.vp_c15)._m0[int(_1840)][_1842];
    int _1846 = int(_1838) + 1;
    uint _1848 = uint(int(uint(_1846) >> uint(2)));
    int _1850 = _1846 & 3;
    float _1852 = (*spvDescriptorSet0.vp_c15)._m0[int(_1848)][_1850];
    int _1854 = _1709 + 104;
    uint _1856 = uint(int(uint(_1854) >> uint(2)));
    uint _1858 = uint(int(uint(int(_1856)) >> uint(2)));
    int _1860 = int(_1856) & 3;
    float _1862 = (*spvDescriptorSet0.vp_c15)._m0[int(_1858)][_1860];
    int _1864 = int(_1856) + 1;
    uint _1866 = uint(int(uint(_1864) >> uint(2)));
    int _1868 = _1864 & 3;
    float _1870 = (*spvDescriptorSet0.vp_c15)._m0[int(_1866)][_1868];
    float _1872 = _1834;
    int _1874 = as_type<int>(_1852);
    if (!_1631)
    {
        float _1876 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1878 = _1387 + _1876;
        float _1880 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1882 = _1243 + _1880;
        float _1884 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1886 = _1878 * _1878;
        float _1888 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1890 = _1257 + _1888;
        float _1892 = fma(_1882, _1882, _1886);
        float _1894 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1896 = fma(_1890, _1890, _1892);
        float _1898 = sqrt(_1896);
        float _1900 = _1884 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1902 = -_1257;
        float _1904 = _1902 + _1808;
        float _1906 = precise::min(_1898, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1908 = _1906 * _1894;
        float _1910 = -_1387;
        float _1912 = _1910 + _1617;
        float _1914 = -_1243;
        float _1916 = _1914 + _1768;
        float _1918 = _1900 * _1908;
        float _1920 = fma(_1912, _1918, _1387);
        float _1922 = fma(_1916, _1918, _1243);
        float _1924 = fma(_1904, _1918, _1257);
        _1832 = _1920;
        _1810 = _1922;
        _1872 = _1924;
    }
    float _1926 = _1832;
    float _1928 = _1810;
    float _1930 = _1872;
    float _1932 = _1657 * _1852;
    float _1934 = _1926 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1936 = _1657 * _1786;
    if (!_1806)
    {
        int _1938 = _1760 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1940 = _1938 + _1734;
        _1798 = _1940;
    }
    int _1942 = _1798;
    float _1944 = fma(_1243, _1844, _1932);
    float _1946 = fma(_1928, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1934);
    float _1948 = _1657 * _1728;
    if (!_1806)
    {
        float _1950 = floor(_1677);
        _1800 = _1950;
    }
    float _1952 = _1800;
    float _1954 = fma(_1257, _1862, _1944);
    float _1956 = fma(_1930, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1946);
    float _1958 = fma(_1243, _1720, _1948);
    float _1960 = fma(_1243, _1778, _1936);
    float _1962 = _1954 + _1870;
    float _1964 = _1956 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    int _1966 = _1709 + 80;
    uint _1968 = uint(int(uint(_1966) >> uint(2)));
    uint _1970 = uint(int(uint(int(_1968)) >> uint(2)));
    int _1972 = int(_1968) & 3;
    float _1974 = (*spvDescriptorSet0.vp_c15)._m0[int(_1970)][_1972];
    int _1976 = int(_1968) + 1;
    uint _1978 = uint(int(uint(_1976) >> uint(2)));
    int _1980 = _1976 & 3;
    float _1982 = (*spvDescriptorSet0.vp_c15)._m0[int(_1978)][_1980];
    int _1984 = as_type<int>(_1956);
    if (!_1806)
    {
        int _1986 = _1942 << 2;
        _1874 = _1986;
    }
    int _1988 = _1874;
    float _1990 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1992 = _1964 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1994 = 1.0 / _1962;
    int _1996 = _1988;
    float _1998 = _1990;
    if (!_1806)
    {
        uint _2000 = uint(int(uint(_1942) >> uint(2)));
        _1984 = int(_2000);
    }
    int _2002 = _1984;
    float _2004 = fma(_1257, _1746, _1958);
    if (!_1806)
    {
        int _2006 = 12 & _1988;
        _1996 = _2006;
    }
    int _2008 = _1996;
    int _2010 = _1709 + 88;
    uint _2012 = uint(int(uint(_2010) >> uint(2)));
    uint _2014 = uint(int(uint(int(_2012)) >> uint(2)));
    int _2016 = int(_2012) & 3;
    float _2018 = (*spvDescriptorSet0.vp_c15)._m0[int(_2014)][_2016];
    int _2020 = int(_2012) + 1;
    uint _2022 = uint(int(uint(_2020) >> uint(2)));
    int _2024 = _2020 & 3;
    float _2026 = (*spvDescriptorSet0.vp_c15)._m0[int(_2022)][_2024];
    float _2028 = -_1992;
    float _2030 = fma(_2028, _1990, 1.0);
    float _2032 = fma(_1257, _1822, _1960);
    if (!_1806)
    {
        int _2034 = _2002 << 4;
        int _2036 = _2034 + _2008;
        _1998 = as_type<float>(_2036);
    }
    float _2038 = _1998;
    float _2040 = _1926 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2042 = _2004 + _1754;
    float _2044 = _1926 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2046 = _1926 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2048 = fma(_1928, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2040);
    float _2050 = _2038;
    if (!_1806)
    {
        int _2052 = as_type<int>(_2038) + 400;
        uint _2054 = uint(int(uint(_2052) >> uint(2)));
        uint _2056 = uint(int(uint(int(_2054)) >> uint(2)));
        int _2058 = int(_2054) & 3;
        float _2060 = (*spvDescriptorSet0.vp_c15)._m0[int(_2056)][_2058];
        _2050 = _2060;
    }
    float _2062 = _2050;
    float _2064 = fma(_1928, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2044);
    float _2066 = _2032 + _1830;
    float _2068 = _2042 * _1994;
    float _2070 = fma(_1930, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2048);
    float _2072 = fma(_1930, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2064);
    float _2074 = fma(_1928, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2046);
    float _2076 = _2066 * _1994;
    float _2078 = _2070 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2080 = _2072 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    bool _2082 = _2068 >= 0.0;
    float _2084 = fma(_1930, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2074);
    float _2086 = _2078 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2088 = log2(_2030);
    bool _2090 = _2068 <= 1.0;
    bool _2092 = _2090 && _2082;
    float _2094 = _2078 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2096 = fma(_2080, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2086);
    if (!_1806)
    {
        float _2098 = -_1952;
        float _2100 = _1677 + _2098;
        _1227 = _2100;
    }
    float _2102 = _1227;
    bool _2104 = _2076 >= 0.0;
    bool _2106 = _2104 && _2092;
    float _2108 = fma(_2080, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2094);
    float _2110 = fma(_1964, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2096);
    float _2112 = as_type<float>(_1709);
    if (!_1806)
    {
        float _2114 = floor(_1689);
        _2112 = _2114;
    }
    float _2116 = _2112;
    float _2118 = _2084 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    bool _2120 = _2076 <= 1.0;
    bool _2122 = _2120 && _2106;
    float _2124 = fma(_1964, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2108);
    float _2126 = fma(_2118, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2110);
    float _2128 = _2078 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2130 = _2088 * 0.693147182464599609375;
    float _2132 = 1.0 / _2126;
    float _2134 = _1657 * _1982;
    float _2136 = fma(_2080, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2128);
    float _2138 = fma(_1243, _1974, _2134);
    float _2140 = fma(_1964, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2136);
    float _2142 = _1982;
    if (_2122)
    {
        float _2144 = float(_1703);
        _2142 = _2144;
    }
    float _2146 = _2142;
    float _2148 = _2146;
    if (!_1806)
    {
        float _2150 = -_2116;
        float _2152 = _1689 + _2150;
        _1697 = _2152;
    }
    float _2154 = _1697;
    float _2156 = fma(_1257, _2018, _2138);
    float _2158 = fma(_2118, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2140);
    float _2160 = fma(_2118, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2124);
    float _2162 = _2134;
    if (_2122)
    {
        float _2164 = rint(_2146);
        float _2166 = precise::max(_2164, 0.0);
        uint _2168 = uint(_2166);
        uint _2170 = clamp(_2168, 0u, 65535u);
        _2162 = as_type<float>(_2170);
    }
    float _2172 = _2162;
    float _2174 = _2156 + _2026;
    float _2176 = _2158 * _2132;
    float _2178 = _2160 * _2132;
    float _2180 = _2130 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2182 = _2174 * _1994;
    float _2184 = _2130;
    float _2186 = _2180;
    if (!_1806)
    {
        float _2188 = rint(_2062);
        float _2190 = precise::max(_2188, 0.0);
        uint _2192 = uint(_2190);
        uint _2194 = clamp(_2192, 0u, 65535u);
        _2184 = as_type<float>(_2194);
    }
    float _2196 = _2184;
    float _2198 = fma(_2176, 0.5, 0.5);
    float _2200 = fma(_2178, -0.5, 0.5);
    float _2202 = _2172;
    float _2204 = _2198;
    if (_2122)
    {
        float3 _6452 = float3(_2068, _2076, float(as_type<int>(_2172)));
        float3 _6456 = select(_6452, float3(0.0), isnan(_6452));
        float _2206 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6456.xy, uint(rint(_6456.z)), _2182, level(0.0));
        _2202 = _2206;
    }
    float _2208 = _2202;
    float3 _6466 = float3(_2198, _2200, _2180);
    float _2210 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6466, float3(0.0), isnan(_6466)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6466, float3(0.0), isnan(_6466)), level(0.0)).x;
    float3 _6475 = float3(_2198, _2200, _2180);
    float4 _2213 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6475, float3(0.0), isnan(_6475)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6475, float3(0.0), isnan(_6475)), level(0.0)).xyzw;
    float _2215 = _2213.x;
    float _2217 = _2213.y;
    float _2219 = _2213.z;
    float _2221 = _2213.w;
    float _2223 = _2154;
    if (!_1806)
    {
        float3 _6498 = float3(_2102, _2154, float(as_type<int>(_2196)));
        float3 _6500 = select(_6498, float3(0.0), isnan(_6498));
        float _2225 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6500.xy, uint(rint(_6500.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6500.xy, uint(rint(_6500.z)), level(0.0)).x;
        _2223 = _2225;
    }
    float _2227 = _2223;
    if (_1806)
    {
        _2148 = 1.0;
    }
    float _2229 = _2148;
    float _2231 = _2229;
    if (!_1806)
    {
        int _2233 = _1942 << 4;
        int _2235 = _2233 + 2048;
        uint _2237 = uint(int(uint(_2235) >> uint(2)));
        uint _2239 = uint(int(uint(int(_2237)) >> uint(2)));
        int _2241 = int(_2237) & 3;
        float _2243 = (*spvDescriptorSet0.vp_c15)._m0[int(_2239)][_2241];
        int _2245 = int(_2237) + 1;
        uint _2247 = uint(int(uint(_2245) >> uint(2)));
        int _2249 = _2245 & 3;
        float _2251 = (*spvDescriptorSet0.vp_c15)._m0[int(_2247)][_2249];
        int _2253 = _2235 + 8;
        uint _2255 = uint(int(uint(_2253) >> uint(2)));
        uint _2257 = uint(int(uint(int(_2255)) >> uint(2)));
        int _2259 = int(_2255) & 3;
        float _2261 = (*spvDescriptorSet0.vp_c15)._m0[int(_2257)][_2259];
        int _2263 = int(_2255) + 1;
        uint _2265 = uint(int(uint(_2263) >> uint(2)));
        int _2267 = _2263 & 3;
        float _2269 = (*spvDescriptorSet0.vp_c15)._m0[int(_2265)][_2267];
        float _2271 = _1657 * _2251;
        float _2273 = fma(_1243, _2243, _2271);
        float _2275 = fma(_1257, _2261, _2273);
        float _2277 = _2275 + _2269;
        float _2279 = precise::clamp(_2277, 0.0, 1.0);
        float _2281 = -_2279;
        float _2283 = _2281 + _2227;
        float _2285 = fma(_2283, 500.0, 1.5);
        float _2287 = exp2(_2285);
        float _2289 = 0.0 + _2287;
        float _2291 = precise::clamp(_2289, 0.0, 1.0);
        _2204 = _2243;
        _2231 = _2291;
    }
    float _2293 = _2204;
    float _2295 = _2231;
    float _2297 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2299 = _1926 + _2297;
    float _2301 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2303 = _1928 + _2301;
    float _2305 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2307 = _1930 + _2305;
    float _2309 = _2299 * _2299;
    float _2311 = fma(_2303, _2303, _2309);
    float _2313 = fma(_2307, _2307, _2311);
    float _2315 = rsqrt(_2313);
    float _2317 = _2315 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2319 = _2303 * _2317;
    float _2321 = _2307 * _2317;
    float _2323 = _2319 * _2319;
    float _2325 = _2321 * _2321;
    float _2327 = _2323 + _2325;
    float _2329 = sqrt(_2327);
    bool _2331 = _2329 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2333 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2335 = _2329 + _2333;
    float _2337 = _2307;
    float _2339 = _2327;
    float _2341 = _2335;
    float _2343 = _2293;
    float _2345 = _2317;
    if (_2331)
    {
        float _2347 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2337 = _2347;
    }
    float _2349 = _2337;
    if (_2331)
    {
        float _2351 = rsqrt(_2327);
        _2339 = _2351;
    }
    float _2353 = _2339;
    if (_2331)
    {
        float _2355 = _2335 * _2349;
        _2341 = _2355;
    }
    float _2357 = _2341;
    if (_2331)
    {
        float _2359 = _2357 * 0.15915493667125701904296875;
        _2343 = _2359;
    }
    float _2361 = _2343;
    float _2363 = _2315;
    float _2365 = _2361;
    if (_2331)
    {
        float _2367 = _2361 * 6.283185482025146484375;
        float _2369 = sin(_2367);
        _2363 = _2369;
    }
    float _2371 = _2363;
    float _2373 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2375 = precise::max(0.0, _2373);
    float _2377 = _2311;
    float _2379 = _2375;
    float _2381 = _2373;
    if (_2331)
    {
        float _2383 = _2361 * 6.283185482025146484375;
        float _2385 = cos(_2383);
        _2377 = _2385;
    }
    float _2387 = _2377;
    float _2389 = -_2317;
    float _2391 = -_2375;
    float _2393 = fma(_2299, _2389, _2391);
    float _2395 = _2393;
    if (!_2331)
    {
        _2379 = _2321;
    }
    float _2397 = _2379;
    float _2399 = _2397;
    if (_2331)
    {
        float _2401 = _2393 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2381 = _2401;
    }
    float _2403 = _2381;
    float _2405 = _2403;
    if (!_2331)
    {
        _2365 = _2323;
    }
    float _2407 = _2365;
    float _2409 = _2371;
    float _2411 = _2407;
    if (_2331)
    {
        float _2413 = fma(_2371, _2403, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2409 = _2413;
    }
    float _2415 = _2409;
    float _2417 = _2415;
    float _2419 = _2387;
    if (_2331)
    {
        float _2421 = _2387 + (-1.0);
        _2405 = _2421;
    }
    float _2423 = _2405;
    if (_2331)
    {
        float _2425 = _2353 * _2415;
        _2186 = _2425;
    }
    float _2427 = _2186;
    if (!_2331)
    {
        _2417 = _2319;
    }
    float _2429 = _2417;
    float _2431 = _2429;
    if (_2331)
    {
        float _2433 = _2423 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2345 = _2433;
    }
    float _2435 = _2345;
    if (_2331)
    {
        float _2437 = _2319 * _2427;
        _2431 = _2437;
    }
    float _2439 = _2431;
    if (_2331)
    {
        float _2441 = _2321 * _2427;
        _2399 = _2441;
    }
    float _2443 = _2399;
    float _2445 = sqrt(_2313);
    if (_2331)
    {
        float _2447 = fma(_2393, _2387, _2435);
        _2395 = _2447;
    }
    float _2449 = _2395;
    if (_2331)
    {
        float _2451 = _2439 * _2439;
        _2411 = _2451;
    }
    float _2453 = _2411;
    if (!_2331)
    {
        _2419 = _2325;
    }
    float _2455 = _2419;
    float _2457 = _2455;
    if (_2331)
    {
        float _2459 = _2443 * _2443;
        _2457 = _2459;
    }
    float _2461 = _2457;
    float _2463 = fma(_2449, _2449, _2453);
    float _2465 = _2463 + _2461;
    float _2467 = rsqrt(_2465);
    float _2469 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2471 = fma(_2445, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2469);
    float _2473 = precise::clamp(_2471, 0.0, 1.0);
    float _2475 = -_2473;
    float _2477 = _2475 + 1.0;
    float _2479 = _2467 * _2449;
    float _2481 = _2467 * _2439;
    float _2483 = abs(_2477);
    float _2485 = log2(_2483);
    float _2487 = _2467 * _2443;
    float _2489 = _2481 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2491 = -_2489;
    float _2493 = fma(_2479, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2491);
    float _2495 = -_2487;
    float _2497 = fma(_2495, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2493);
    float _2499 = fma(_2497, -0.5, 0.5);
    float _2501 = _2485 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2503 = fma(_2497, 0.5, 0.5);
    float _2505 = sqrt(_2499);
    float _2507 = fma(_2503, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2509 = fma(_2503, _2507, -0.212114393711090087890625);
    float _2511 = _2479 + 1.0;
    float _2513 = exp2(_2501);
    float _2515 = fma(_2503, _2509, 1.570728778839111328125);
    float _2517 = _2505 * 0.636619746685028076171875;
    float _2519 = -_2515;
    float _2521 = fma(_2517, _2519, 1.0);
    float _2523 = -_2479;
    float _2525 = fma(_2513, _2511, _2523);
    float _2527 = fma(_2525, 0.5, 0.5);
    float2 _6968 = float2(_2521, _2527);
    float3 _2529 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6968, float2(0.0), isnan(_6968)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6968, float2(0.0), isnan(_6968)), level(0.0)).xyz;
    float _2531 = _2529.x;
    float _2533 = _2529.y;
    float _2535 = _2529.z;
    float _2537 = abs(_1665);
    float _2539 = log2(_2537);
    float _2541 = -_1607;
    float _2543 = _2541 + 1.0;
    bool _2545 = _1665 <= 8000.0;
    bool _2547 = isnan(_1665);
    bool _2549 = _2545 || _2547;
    bool _2551 = isnan(8000.0);
    bool _2553 = _2549 || _2551;
    float _2555 = float(_2553);
    float _2557 = _2539 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2559 = _2078 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2561 = fma(_2080, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2559);
    float _2563 = exp2(_2557);
    float _2565 = fma(_1964, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2561);
    float _2567 = _2485 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2569 = fma(_2118, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2565);
    float _2571 = fma(_2563, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2573 = precise::clamp(_2571, 0.0, 1.0);
    float _2575 = exp2(_2567);
    float _2577 = fma(_2573, -2.0, 3.0);
    float _2579 = _2573 * _2573;
    float _2581 = _2579 * _2577;
    float _2583 = -_2581;
    float _2585 = _2583 + 1.0;
    float _2587 = fma(_2585, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2581);
    float _2589 = _2569 + _2126;
    float _2591 = -_2575;
    float _2593 = _2591 + 1.0;
    float _2595 = _2555 * _2587;
    float _2597 = _2555;
    float _2599 = _2569;
    if (!_2122)
    {
        _2597 = 1.0;
    }
    float _2601 = _2597;
    float _2603 = _2589 * 0.5;
    float _2605 = _2601;
    if (_2122)
    {
        bool _2607 = _2208 >= _2182;
        bool _2609 = isnan(_2208);
        bool _2611 = _2607 || _2609;
        bool _2613 = isnan(_2182);
        bool _2615 = _2611 || _2613;
        float _2617 = float(_2615);
        _2605 = _2617;
    }
    float _2619 = _2605;
    float _2621 = _2595 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2623 = _2593 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _2158;
    out.gl_Position.y = _2160;
    out.gl_Position.z = _2569;
    out.gl_Position.w = _2126;
    bool _2625 = _2445 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2627 = isnan(_2445);
    bool _2629 = _2625 || _2627;
    bool _2631 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2633 = _2629 || _2631;
    float _2635 = _2543 * _2621;
    float _2637 = precise::clamp(_2635, 0.0, 1.0);
    float _2639 = _2619 * _2295;
    float _2641 = _2623 * _2210;
    out.m_91.z = _2603;
    out.m_91.w = _2126;
    float _2643 = -_2637;
    float _2645 = fma(_2643, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2647 = -_2639;
    float _2649 = fma(_2647, _2645, 1.0);
    float _2651 = precise::clamp(_2649, 0.0, 1.0);
    float _2653 = _2221 * _2641;
    float _2655 = -_2623;
    float _2657 = _2655 + 1.0;
    float _2659 = _2651 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2661 = _2657;
    float _2663 = _2651;
    float _2665 = _2623;
    float _2667 = _2653;
    if (!_2633)
    {
        _2599 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2669 = _2599;
    float _2671 = _2221 * _2657;
    float _2673 = _2669;
    float _2675 = _2669;
    if (!_2633)
    {
        _2661 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2677 = _2661;
    out.m_93.x = _2659;
    float _2679 = _2677;
    float _2681 = _2677;
    if (!_2633)
    {
        _2663 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2683 = _2663;
    float _2685 = _2683;
    float _2687 = _2683;
    if (!_2633)
    {
        _2665 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2689 = _2665;
    float _2691 = _2535 * _2641;
    float _2693 = fma(_2531, _2653, _2215);
    float _2695 = fma(_2533, _2653, _2217);
    float _2697 = _2691;
    float _2699 = _2689;
    float _2701 = _2689;
    if (!_2633)
    {
        _2667 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2703 = _2667;
    float _2705 = fma(_2221, _2691, _2219);
    float _2707 = _2703;
    float _2709 = _2703;
    if (!_2633)
    {
        _2697 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2711 = _2697;
    out.m_95.x = _2693;
    out.m_95.y = _2695;
    out.m_95.z = _2705;
    out.m_95.w = _2671;
    bool _2713 = !_2633;
    float _2715 = _2711;
    float _2717 = _2711;
    if (!_2713)
    {
        bool _2719 = _2445 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2721 = isnan(_2445);
        bool _2723 = _2719 || _2721;
        bool _2725 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2727 = _2723 || _2725;
        if (!_2727)
        {
            float _2729 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2731 = _2445 + _2729;
            float _2733 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2735 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2733;
            float _2737 = 1.0 / _2735;
            float _2739 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2741 = _2739 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2743 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2745 = _2743 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2747 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2749 = _2747 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2751 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2753 = _2751 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2755 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2757 = _2755 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2759 = _2731 * _2737;
            float _2761 = precise::clamp(_2759, 0.0, 1.0);
            float _2763 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2765 = _2763 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2767 = fma(_2761, _2741, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2769 = fma(_2761, _2765, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2771 = fma(_2761, _2745, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2773 = fma(_2761, _2749, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2775 = fma(_2761, _2753, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2777 = fma(_2761, _2757, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2717 = _2767;
            _2687 = _2775;
            _2709 = _2769;
            _2681 = _2773;
            _2675 = _2771;
            _2701 = _2777;
            _2779 = true;
        }
        else
        {
            bool _2781 = _2445 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2783 = isnan(_2445);
            bool _2785 = _2781 || _2783;
            bool _2787 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2789 = _2785 || _2787;
            if (!_2789)
            {
                _2707 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2791 = _2707;
            _2709 = _2791;
            if (!_2789)
            {
                _2715 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2793 = _2715;
            _2717 = _2793;
            if (!_2789)
            {
                _2673 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2795 = _2673;
            _2675 = _2795;
            if (!_2789)
            {
                _2679 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2797 = _2679;
            _2681 = _2797;
            if (!_2789)
            {
                _2685 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2799 = _2685;
            _2687 = _2799;
            if (!_2789)
            {
                _2699 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2801 = _2699;
            bool _2803 = !_2789;
            _2701 = _2801;
            if (!_2803)
            {
                bool _2805 = _2445 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2807 = isnan(_2445);
                bool _2809 = _2805 || _2807;
                bool _2811 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2813 = _2809 || _2811;
                if (!_2813)
                {
                    float _2815 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2817 = _2445 + _2815;
                    float _2819 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2821 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2819;
                    float _2823 = 1.0 / _2821;
                    float _2825 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2827 = _2825 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2829 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2831 = _2829 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2833 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2835 = _2833 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2837 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2839 = _2837 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2841 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2843 = _2841 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2845 = _2817 * _2823;
                    float _2847 = precise::clamp(_2845, 0.0, 1.0);
                    float _2849 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2851 = _2849 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2853 = fma(_2847, _2827, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2855 = fma(_2847, _2851, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2857 = fma(_2847, _2831, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2859 = fma(_2847, _2835, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2861 = fma(_2847, _2839, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2863 = fma(_2847, _2843, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2717 = _2853;
                    _2687 = _2861;
                    _2709 = _2855;
                    _2681 = _2859;
                    _2675 = _2857;
                    _2701 = _2863;
                    _2779 = true;
                }
                else
                {
                    _2717 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2687 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2709 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2681 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2675 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2701 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2779 = false;
    float _2865 = _2717;
    float _2867 = _2687;
    float _2869 = _2709;
    float _2871 = _2681;
    float _2873 = _2675;
    float _2875 = _2701;
    float _2877 = fma(_1507, -0.5, 0.5);
    float _2879 = precise::clamp(_2877, 0.0, 1.0);
    float _2881 = -_2865;
    float _2883 = _2881 + _2867;
    float _2885 = -_2869;
    float _2887 = _2885 + _2871;
    float _2889 = -_2873;
    float _2891 = _2889 + _2875;
    bool _2893 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2895 = fma(_2879, _2883, _2865);
    float _2897 = fma(_2879, _2887, _2869);
    float _2899 = fma(_2879, _2891, _2873);
    float _2901 = _2895 * 0.586610972881317138671875;
    out.m_63.x = 1.0;
    float _2903 = fma(_2897, 0.298911988735198974609375, _2901);
    float _2905 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2907 = fma(_2899, 0.114477999508380889892578125, _2903);
    out.m_93.w = _2905;
    float _2909 = -_2907;
    float _2911 = _2897 + _2909;
    float _2913 = -_2907;
    float _2915 = _2895 + _2913;
    float _2917 = -_2907;
    float _2919 = _2899 + _2917;
    out.m_97.x = 0.0;
    float _2921 = fma(_2911, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2907);
    float _2923 = fma(_2915, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2907);
    float _2925 = fma(_2919, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2907);
    out.m_99.x = _2921;
    out.m_99.y = _2923;
    out.m_99.z = _2925;
    if (!_2893)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2927 = -_1926;
    float _2929 = _2927 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2931 = -_1928;
    float _2933 = _2931 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2935 = -_1930;
    float _2937 = _2935 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2939 = _2929 * _2929;
    float _2941 = fma(_2933, _2933, _2939);
    float _2943 = fma(_2937, _2937, _2941);
    float _2945 = sqrt(_2943);
    float _2947 = rsqrt(_2943);
    float _2949 = -_2945;
    float _2951 = _2949 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2953 = _2951 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2955 = precise::clamp(_2953, 0.0, 1.0);
    float _2957 = _2933 * _2947;
    float _2959 = _2929 * _2947;
    float _2961 = abs(_2955);
    float _2963 = log2(_2961);
    float _2965 = _2937 * _2947;
    float _2967 = _2957 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2969 = _1507 * _2959;
    float _2971 = -_2959;
    float _2973 = -_2967;
    float _2975 = fma(_2971, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2973);
    float _2977 = fma(_1505, _2957, _2969);
    float _2979 = -_2965;
    float _2981 = fma(_2979, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2975);
    float _2983 = fma(_1513, _2965, _2977);
    float _2985 = precise::clamp(_2983, 0.0, 1.0);
    float _2987 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2989 = _2981 + _2987;
    float _2991 = _2963 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2993 = _2989 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2995 = precise::clamp(_2993, 0.0, 1.0);
    float _2997 = exp2(_2991);
    float _2999 = _2997 * _2995;
    float _3001 = _2985 * _2999;
    float _3003 = _3001 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3005 = _3001 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3007 = _3001 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_97.x = _3003;
    out.m_97.y = _3005;
    out.m_97.z = _3007;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2779 = false;
    bool _1559 = false;
    bool _199 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _117 = in.m_60.w;
    float _119 = trunc(_117);
    int _121 = int(_119);
    bool _125 = _121 >= 1;
    float _127 = 0.0;
    if (!_125)
    {
        _127 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _129 = _127;
    float _131 = _129;
    if (!_125)
    {
        out.m_63.x = 0.0;
    }
    int _133 = 0;
    if (!_125)
    {
        float _135 = _129 * 5.0;
        _133 = as_type<int>(_135);
    }
    int _137 = _133;
    int _139 = _137;
    if (!_125)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3064 = as_type<float>(_137);
        out.gl_Position.z = _3064;
    }
    if (!_125)
    {
        return out;
    }
    float _141 = in.m_65.w;
    bool _143 = _141 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _145 = isnan(_141);
    bool _147 = _143 || _145;
    bool _149 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _151 = _147 || _149;
    float _153 = -_141;
    float _155 = _153 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _157 = _155;
    if (_151)
    {
        float _159 = float(_121);
        _131 = _159;
    }
    float _161 = _131;
    bool _163 = _155 >= _161;
    bool _165 = !_151;
    bool _167 = _163 || _165;
    float _169 = _161;
    if (_167)
    {
        _169 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _171 = _169;
    if (_167)
    {
        out.m_63.x = 0.0;
    }
    if (_167)
    {
        float _173 = _171 * 5.0;
        _139 = as_type<int>(_173);
    }
    int _175 = _139;
    if (_167)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3134 = as_type<float>(_175);
        out.gl_Position.z = _3134;
    }
    if (_167)
    {
        return out;
    }
    bool _177 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _179 = !_177;
    float _197;
    if (!_179)
    {
        float _181 = in.m_67.x;
        float _183 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _185 = _181 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _187 = fma(_185, (*spvDescriptorSet0.vp_c9)._m0[12].x, _155);
        float _189 = _187 * _183;
        float _191 = floor(_189);
        float _193 = -_191;
        float _195 = _189 + _193;
        _197 = _195;
        _199 = true;
    }
    else
    {
        float _201 = float(_121);
        float _203 = 1.0 / _201;
        float _205 = _155 * _203;
        _197 = _205;
    }
    _199 = false;
    float _207 = _197;
    int _209 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _211 = _209;
    int _213 = 0;
    int _215 = _112(_211, _213, (*spvDescriptorSet0.support_buffer));
    float _217 = in.m_67.x;
    float _219 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _221 = in.m_69.z;
    float _223 = in.m_67.w;
    float _225 = in.m_69.y;
    float _227 = _217 * 8.0;
    float _229 = trunc(_221);
    int _231 = int(_229);
    float _233 = rint(_227);
    float _235 = _233 * 0.125;
    float _237 = precise::clamp(_235, 0.0, 1.0);
    int _239 = _215 + (-1);
    float _241 = float(_239);
    float _243 = _237 * _241;
    float _245 = trunc(_243);
    int _247 = int(_245);
    float _249 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _251 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _249;
    float _253 = 1.0 / _251;
    int _255 = _247 + 1;
    int _257 = min(_239, _255);
    int _259 = _247;
    int _261 = 0;
    int _263 = _113(_259, _261, (*spvDescriptorSet0.support_buffer));
    int _265 = _231;
    int _267 = 0;
    int _269 = _113(_265, _267, (*spvDescriptorSet0.support_buffer));
    float3 _273 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_263, _269)), 0).xyz;
    float _275 = _273.x;
    float _277 = _273.y;
    float _279 = _273.z;
    int _281 = _257;
    int _283 = 0;
    int _285 = _113(_281, _283, (*spvDescriptorSet0.support_buffer));
    int _287 = _231;
    int _289 = 0;
    int _291 = _113(_287, _289, (*spvDescriptorSet0.support_buffer));
    float3 _293 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_285, _291)), 0).xyz;
    float _295 = _293.x;
    float _297 = _293.y;
    float _299 = _293.z;
    float _301 = in.m_67.z;
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _305 = _303 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _309 = _207 + _307;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _313 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _311;
    int _315 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _317 = _315 != 0;
    float _319 = 1.0 / _305;
    int _321 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _323 = _321 != 0;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _327 = _325 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _329 = in.m_69.x;
    int _331 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _333 = _331 != 0;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _337 = _207 + _335;
    bool _339 = _223 > 0.5;
    float _341 = 1.0 / _313;
    float _343 = -_225;
    float _345 = _343 + 1.0;
    int _347 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _349 = _347 != 0;
    int _351 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _353 = _351 != 0;
    int _355 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _357 = _355 != 0;
    float _359 = _309 * _253;
    float _361 = _225;
    float _363 = _207;
    if (_317)
    {
        float _365 = _339 ? _345 : _225;
        _361 = _365;
    }
    float _367 = _361;
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _371 = _207 + _369;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _375 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _373;
    float _377 = 1.0 / _327;
    bool _379 = _301 > 0.5;
    bool _381 = _379 && _323;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _385 = _207 + _383;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _389 = _207 + _387;
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _393 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _391;
    float _395 = _371 * _341;
    float _397 = _385 * _319;
    float _399 = 1.0 / _375;
    float _401 = _301 * 2.0;
    float _403 = _217 + _301;
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _407 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _405;
    float _409 = fma(_393, _359, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _411 = _403 + (-1.0);
    float _413 = floor(_401);
    float _415 = _217 * 2.0;
    float _417 = fma(_411, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _419 = _389 * _377;
    float _421 = _219 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _423 = fma(_407, _359, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _427 = _425 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _429 = floor(_415);
    float _431 = _337 * _399;
    float _433 = _399;
    float _435 = _401;
    if (_323)
    {
        _433 = _329;
    }
    float _437 = _433;
    float _439 = fma(_421, _367, -0.5);
    float _441 = _437;
    if (!_323)
    {
        _435 = _329;
    }
    float _443 = _435;
    float _445 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _447 = _445 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _449 = _443;
    if (_381)
    {
        float _451 = -_437;
        float _453 = _451 + 1.0;
        _441 = _453;
    }
    float _455 = _441;
    bool _457 = _413 >= 0.0;
    bool _459 = isnan(_413);
    bool _461 = _457 || _459;
    bool _463 = isnan(0.0);
    bool _465 = _461 || _463;
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _469 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _467;
    float _471 = fma(_427, _397, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _475 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _473;
    if (_323)
    {
        _449 = _455;
    }
    float _477 = _449;
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _481 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _479;
    int _483 = _465 ? 0 : 1;
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _487 = _485 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    bool _489 = _429 > 0.0;
    float _491 = fma(_481, _359, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _493 = _429 >= 0.0;
    bool _495 = isnan(_429);
    bool _497 = _493 || _495;
    bool _499 = isnan(0.0);
    bool _501 = _497 || _499;
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _505 = _503 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _507 = (*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _509 = _477;
    if (!_333)
    {
        float _511 = in.m_67.y;
        _507 = _511;
    }
    float _513 = _507;
    float _515 = fma(_447, _397, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _517 = fma(_505, _397, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _519 = fma(_475, _395, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _521 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _523 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _521;
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _527 = _525 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _529 = fma(_469, _395, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _531 = fma(_487, _419, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _533 = fma(_523, _395, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _535 = fma(_527, _419, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    bool _537 = _207 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _539 = isnan(_207);
    bool _541 = _537 || _539;
    bool _543 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _545 = _541 || _543;
    float _547 = float(_545);
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _551 = _549 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    bool _553 = _207 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _555 = isnan(_207);
    bool _557 = _553 || _555;
    bool _559 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _561 = _557 || _559;
    float _563 = float(_561);
    float _565 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _567 = _207 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _569 = isnan(_207);
    bool _571 = _567 || _569;
    bool _573 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _575 = _571 || _573;
    float _577 = float(_575);
    float _579 = fma(_551, _419, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    bool _581 = _207 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _583 = isnan(_207);
    bool _585 = _581 || _583;
    bool _587 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _589 = _585 || _587;
    float _591 = float(_589);
    float _593 = -_563;
    float _595 = _593 + 1.0;
    bool _597 = _207 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _599 = isnan(_207);
    bool _601 = _597 || _599;
    bool _603 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _605 = _601 || _603;
    float _607 = float(_605);
    bool _609 = _207 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _611 = isnan(_207);
    bool _613 = _609 || _611;
    bool _615 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _617 = _613 || _615;
    float _619 = float(_617);
    float _621 = _577 * _595;
    float _623 = -_577;
    float _625 = _623 + 1.0;
    bool _627 = _413 > 0.0;
    float _629 = -_547;
    float _631 = _629 + 1.0;
    if (!_333)
    {
        _363 = _513;
    }
    float _633 = _363;
    float _635 = _619 * _625;
    float _637 = -_619;
    float _639 = _637 + 1.0;
    float _641 = -_607;
    float _643 = _641 + 1.0;
    float _645 = _633;
    float _647 = _513;
    if (_333)
    {
        float _649 = in.m_67.x;
        float _651 = in.m_67.y;
        _645 = _649;
        _647 = _651;
    }
    float _653 = _645;
    float _655 = _647;
    float _657 = _563 * _631;
    float _659 = _607 * _639;
    float _661 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _663 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _661;
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _667 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _665;
    float _669 = _591 * _643;
    float _671 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _673 = log2(_671);
    float _675 = fma(_663, _431, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _677 = fma(_667, _431, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _679 = _491 * _669;
    float _681 = _409 * _669;
    float _683 = _423 * _669;
    float _685 = _565 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _687 = -_591;
    float _689 = _687 + 1.0;
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _693 = fma(_685, _477, -0.5);
    float _695 = fma(_689, (*spvDescriptorSet0.vp_c9)._m0[143].x, _679);
    float _697 = fma(_689, (*spvDescriptorSet0.vp_c9)._m0[143].y, _681);
    if (!_333)
    {
        _509 = _301;
    }
    float _699 = _509;
    float _701 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _703 = fma(_653, (*spvDescriptorSet0.vp_c9)._m0[83].z, _691);
    float _705 = _653 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _707 = _653;
    float _709 = _699;
    if (!_333)
    {
        _707 = _301;
    }
    float _711 = _707;
    float _713 = _673 * _155;
    float _715 = _711;
    if (_333)
    {
        _715 = _655;
    }
    float _717 = _715;
    float _719 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    if (_333)
    {
        _709 = _655;
    }
    float _721 = _709;
    float _723 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _725 = fma(_717, (*spvDescriptorSet0.vp_c9)._m0[83].w, _701);
    float _727 = -_719;
    float _729 = fma(_705, 2.0, _727);
    float _731 = _721 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _733 = _501 ? 0 : 1;
    float _735 = exp2(_713);
    float _737 = fma(_517, _659, _695);
    float _739 = fma(_731, -2.0, _723);
    float _741 = _301 + _655;
    float _743 = _217 + _655;
    float _745 = fma(_689, (*spvDescriptorSet0.vp_c9)._m0[143].z, _683);
    float _747 = _655 * 2.0;
    int _749 = ~_483;
    int _751 = _749 + 1;
    int _753 = _751 + 1;
    float _755 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _757 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _755;
    int _759 = ~_733;
    int _761 = _759 + 1;
    int _763 = _761 + 1;
    float _765 = _741 + (-1.0);
    int _767 = _753;
    int _769 = _763;
    if (!_627)
    {
        int _771 = ~_483;
        int _773 = _771 + 1;
        _767 = _773;
    }
    int _775 = _767;
    float _777 = _743 + (-1.0);
    if (!_489)
    {
        int _779 = ~_733;
        int _781 = _779 + 1;
        _769 = _781;
    }
    int _783 = _769;
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _787 = 1.0 + _785;
    float _789 = floor(_747);
    bool _791 = !_349;
    int _793 = _791 ? 0 : 1;
    float _795 = fma(_757, _431, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _797 = fma(_765, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _799 = abs(_793);
    float _801 = -_735;
    float _803 = _801 + 1.0;
    bool _805 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _807 = isnan(1.0);
    bool _809 = _805 || _807;
    bool _811 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _813 = _809 || _811;
    float _815 = 1.0 / _787;
    float _817 = fma(_777, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _819 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _821 = isnan(0.0);
    bool _823 = _819 || _821;
    bool _825 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _827 = _823 || _825;
    float _829 = in.m_71.x;
    float _831 = in.m_71.y;
    float _833 = in.m_71.z;
    float _835 = float(_799);
    float _837 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[82].z, _703);
    float _839 = float(_775);
    float _841 = _217 + (-0.5);
    bool _843 = !_353;
    int _845 = _843 ? 0 : 1;
    float _847 = -_155;
    float _849 = fma(_847, (*spvDescriptorSet0.vp_c9)._m0[81].x, _729);
    float _851 = _827 ? _803 : 0.0;
    float _853 = _835 * _839;
    bool _855 = _789 > 0.0;
    float _857 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[81].y, _739);
    bool _859 = _789 >= 0.0;
    bool _861 = isnan(_789);
    bool _863 = _859 || _861;
    bool _865 = isnan(0.0);
    bool _867 = _863 || _865;
    float _869 = fma(_515, _659, _745);
    int _871 = abs(_845);
    float _873 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[82].w, _725);
    float _875 = _797;
    if (_813)
    {
        float _877 = _851 * _815;
        _157 = _877;
    }
    float _879 = _157;
    float _881 = _853 * (-2.0);
    float _883 = float(_871);
    float _885 = fma(_519, _635, _737);
    float _887 = float(_783);
    float _889 = -_857;
    float _891 = fma(_873, _439, _889);
    int _893 = _867 ? 0 : 1;
    float _895 = fma(_531, _621, _885);
    bool _897 = !_357;
    int _899 = _897 ? 0 : 1;
    float _901 = _883 * _887;
    float _903 = fma(_881, _829, _829);
    int _905 = ~_893;
    int _907 = _905 + 1;
    int _909 = _907 + 1;
    float _911 = fma(_817, _881, _817);
    float _913 = _901 * (-2.0);
    int _915 = abs(_899);
    float _917 = fma(_841, (*spvDescriptorSet0.vp_c9)._m0[196].x, _903);
    int _919 = _909;
    float _921 = _891;
    if (!_855)
    {
        int _923 = ~_893;
        int _925 = _923 + 1;
        _919 = _925;
    }
    int _927 = _919;
    float _929 = fma(_913, _831, _831);
    float _931 = float(_915);
    float _933 = _655 + (-0.5);
    float _935 = float(_927);
    float _937 = fma(_471, _659, _697);
    float _939 = fma(_797, _913, _797);
    float _941 = fma(_933, (*spvDescriptorSet0.vp_c9)._m0[196].y, _929);
    float _943 = fma(_911, _879, _917);
    float _945 = _931 * _935;
    float _947 = fma(_533, _635, _937);
    float _949 = _301 + (-0.5);
    float _951 = fma(_939, _879, _941);
    float _953 = _945 * (-2.0);
    float _955 = _943 * 0.15915493667125701904296875;
    float _957 = fma(_535, _621, _947);
    float _959 = _951 * 0.15915493667125701904296875;
    float _961 = fma(_953, _833, _833);
    float _963 = fma(_417, _953, _417);
    float _965 = fma(_529, _635, _869);
    float _967 = _955 * 6.283185482025146484375;
    float _969 = sin(_967);
    float _971 = fma(_949, (*spvDescriptorSet0.vp_c9)._m0[196].z, _961);
    float _973 = fma(_579, _621, _965);
    float _975 = fma(_963, _879, _971);
    float _977 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _979 = _959 * 6.283185482025146484375;
    float _981 = sin(_979);
    float _983 = _975 * 0.15915493667125701904296875;
    float _985 = in.m_73.x;
    float _987 = in.m_73.y;
    float _989 = in.m_73.z;
    float _991 = in.m_73.w;
    float _993 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _995 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _997 = fma(_837, _693, _849);
    float _999 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1001 = _955 * 6.283185482025146484375;
    float _1003 = cos(_1001);
    float _1005 = _993 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1007 = _977 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1009 = _995 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1011 = fma(_675, _657, _895);
    float _1013 = fma(_795, _657, _973);
    float _1015 = fma(_677, _657, _957);
    float _1017 = _997 + 0.5;
    float _1019 = _959 * 6.283185482025146484375;
    float _1021 = cos(_1019);
    float _1023 = _969 * _981;
    float _1025 = fma(_547, (*spvDescriptorSet0.vp_c9)._m0[148].z, _1013);
    out.m_75.x = _1005;
    out.m_75.y = _1007;
    out.m_75.z = _1009;
    out.m_75.w = _999;
    float _1027 = fma(_547, (*spvDescriptorSet0.vp_c9)._m0[148].x, _1011);
    float _1029 = fma(_547, (*spvDescriptorSet0.vp_c9)._m0[148].y, _1015);
    float _1031 = _891 + 0.5;
    float _1033 = _983 * 6.283185482025146484375;
    float _1035 = cos(_1033);
    out.m_77.z = _1017;
    out.m_77.w = _1031;
    float _1037 = _983 * 6.283185482025146484375;
    float _1039 = sin(_1037);
    float _1041 = _1003 * _1021;
    float _1043 = _1003 * _981;
    float _1045 = _1003 * _1035;
    float _1047 = _981 * _1035;
    float _1049 = _1021 * _1035;
    float _1051 = _969 * _1035;
    float _1053 = _1045 * _987;
    float _1055 = fma(_1039, _1041, _1023);
    float _1057 = fma(_1039, _1023, _1041);
    float _1059 = _969 * _1021;
    float _1061 = in.m_79.x;
    float _1063 = in.m_79.y;
    float _1065 = in.m_79.z;
    float _1067 = -_987;
    float _1069 = _1039 * _1067;
    float _1071 = fma(_1055, _985, _1053);
    float _1073 = -_1059;
    float _1075 = fma(_1039, _1043, _1073);
    float _1077 = -_1043;
    float _1079 = fma(_1039, _1059, _1077);
    float _1081 = floor(_243);
    float _1083 = fma(_1049, _985, _1069);
    float _1085 = fma(_1075, _989, _1071);
    float _1087 = _1051 * _987;
    float _1089 = in.m_60.x;
    float _1091 = in.m_60.y;
    float _1093 = in.m_60.z;
    float _1095 = fma(_1047, _989, _1083);
    float _1097 = _1085 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1099 = fma(_1079, _985, _1087);
    float _1101 = _1085 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1103 = _1085 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1105 = fma(_1095, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1097);
    float _1107 = fma(_1057, _989, _1099);
    float _1109 = fma(_1095, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1101);
    float _1111 = fma(_1095, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1103);
    float _1113 = fma(_1107, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1105);
    float _1115 = fma(_1107, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1109);
    float _1117 = -_1081;
    float _1119 = _243 + _1117;
    float _1121 = -_275;
    float _1123 = _1121 + _295;
    float _1125 = _1027 * _1061;
    float _1127 = -_277;
    float _1129 = _1127 + _297;
    float _1131 = _1029 * _1063;
    float _1133 = -_279;
    float _1135 = _1133 + _299;
    float _1137 = fma(_1119, _1129, _277);
    float _1139 = fma(_1119, _1123, _275);
    float _1141 = fma(_1107, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1111);
    float _1143 = in.m_81.x;
    float _1145 = in.m_81.y;
    float _1147 = in.m_81.z;
    float _1149 = fma(_1119, _1135, _279);
    bool _1151 = _1137 != 0.0;
    bool _1153 = isnan(_1137);
    bool _1155 = _1151 || _1153;
    bool _1157 = isnan(0.0);
    bool _1159 = _1155 || _1157;
    float _1161 = _1091 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    out.m_83.x = 1.0;
    out.m_83.y = 1.0;
    out.m_83.z = 1.0;
    float _1163 = _1025 * _1065;
    bool _1165 = _1139 == 0.0;
    bool _1167 = !_1159;
    bool _1169 = _1165 && _1167;
    float _1171 = fma(_1089, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1161);
    out.m_85.x = _1113;
    out.m_85.y = _1115;
    out.m_85.z = _1141;
    bool _1173 = _1149 == 0.0;
    bool _1175 = _1173 && _1169;
    float _1177 = _1091 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1179 = _1091 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1181 = _1131 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1183 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1137);
    float _1185 = fma(_1089, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1177);
    float _1187 = fma(_1089, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1179);
    float _1189 = fma(_1093, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1171);
    float _1191 = _1183 * _1181;
    float _1193 = _1125 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1195 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1139);
    float _1197 = _1163 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1199 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1149);
    float _1201 = _1045 * _1191;
    float _1203 = _1195 * _1193;
    float _1205 = fma(_1093, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1185);
    float _1207 = fma(_1093, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1187);
    float _1209 = -_1191;
    float _1211 = _1039 * _1209;
    float _1213 = _1051 * _1191;
    float _1215 = _1199 * _1197;
    float _1217 = fma(_1055, _1203, _1201);
    float _1219 = _1211;
    float _1221 = _1081;
    float _1223 = _1217;
    float _1225 = _1149;
    float _1227 = _1111;
    if (_1175)
    {
        _921 = _1143;
    }
    float _1229 = _921;
    float _1231 = fma(_1049, _1203, _1211);
    float _1233 = fma(_1079, _1203, _1213);
    float _1235 = fma(_1075, _1215, _1217);
    float _1237 = _1229;
    float _1239 = _1235;
    if (_1175)
    {
        _1219 = _1229;
    }
    float _1241 = _1219;
    float _1243 = _1205 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1245 = _1241;
    if (!_1175)
    {
        _1237 = _1143;
    }
    float _1247 = _1237;
    float _1249 = fma(_1047, _1215, _1231);
    float _1251 = _1235 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1253 = _1235 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1255 = fma(_1057, _1215, _1233);
    float _1257 = _1207 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1259 = fma(_1249, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1251);
    float _1261 = fma(_1249, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1253);
    float _1263 = _1251;
    if (_1175)
    {
        _1221 = _1145;
    }
    float _1265 = _1221;
    float _1267 = _1265;
    if (!_1175)
    {
        float _1269 = fma(_1139, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1247);
        _1245 = _1269;
    }
    float _1271 = _1245;
    float _1273 = fma(_1255, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1259);
    float _1275 = fma(_1255, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1261);
    if (_1175)
    {
        _875 = _1147;
    }
    float _1277 = _875;
    float _1279 = _989 * _1247;
    float _1281 = _1243 + _1273;
    float _1283 = _1257 + _1275;
    float _1285 = _1277;
    float _1287 = _1281;
    float _1289 = _1283;
    if (_1175)
    {
        _1263 = _1265;
    }
    float _1291 = _1263;
    float _1293 = _1291;
    if (!_1175)
    {
        _1267 = _1145;
    }
    float _1295 = _1267;
    float _1297 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1299 = _1281 + _1297;
    if (_1175)
    {
        _1223 = _1277;
    }
    float _1301 = _1223;
    float _1303 = _1301;
    if (!_1175)
    {
        _1285 = _1147;
    }
    float _1305 = _1285;
    float _1307 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1309 = _1283 + _1307;
    if (!_1175)
    {
        float _1311 = fma(_1137, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1295);
        _1293 = _1311;
    }
    float _1313 = _1293;
    float _1315 = _1299 * _1299;
    float _1317 = _985 * _1295;
    float _1319 = _1309 * _1309;
    float _1321 = _987 * _1305;
    float _1323 = _1315;
    float _1325 = _1319;
    if (!_1175)
    {
        float _1327 = fma(_1149, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1305);
        _1303 = _1327;
    }
    float _1329 = _1303;
    float _1331 = -_1317;
    float _1333 = fma(_987, _1247, _1331);
    float _1335 = _1315 + _1319;
    float _1337 = -_1321;
    float _1339 = fma(_989, _1295, _1337);
    float _1341 = -_1279;
    float _1343 = fma(_985, _1305, _1341);
    float _1345 = _1333 * _991;
    float _1347 = sqrt(_1335);
    float _1349 = _1339 * _991;
    float _1351 = _1343 * _991;
    float _1353 = _1045 * _1313;
    float _1355 = _1051 * _1313;
    float _1357 = -_1313;
    float _1359 = _1039 * _1357;
    float _1361 = -_1351;
    float _1363 = _1039 * _1361;
    float _1365 = _1045 * _1351;
    float _1367 = _1051 * _1351;
    float _1369 = _1235 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1371 = fma(_1079, _1271, _1355);
    float _1373 = fma(_1049, _1271, _1359);
    float _1375 = fma(_1079, _1349, _1367);
    float _1377 = fma(_1249, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1369);
    float _1379 = fma(_1055, _1271, _1353);
    float _1381 = fma(_1049, _1349, _1363);
    bool _1383 = _1347 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1385 = fma(_1255, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1377);
    float _1387 = _1189 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1389 = fma(_1055, _1349, _1365);
    float _1391 = fma(_1057, _1329, _1371);
    float _1393 = fma(_1057, _1345, _1375);
    float _1395 = _1387 + _1385;
    float _1397 = fma(_1047, _1329, _1373);
    float _1399 = fma(_1075, _1329, _1379);
    float _1401 = fma(_1047, _1345, _1381);
    float _1403 = fma(_1075, _1345, _1389);
    if (!_1383)
    {
        _1225 = _1395;
    }
    float _1405 = _1225;
    bool _1407 = !_1383;
    float _1409 = _1405;
    if (!_1407)
    {
        float _1411 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1413 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1415 = _1347 + _1413;
        float _1417 = rsqrt(_1335);
        float _1419 = _1415 * _1411;
        float _1421 = _1395 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1423 = _1419 * 0.15915493667125701904296875;
        float _1425 = _1423 * 6.283185482025146484375;
        float _1427 = sin(_1425);
        float _1429 = _1423 * 6.283185482025146484375;
        float _1431 = cos(_1429);
        float _1433 = fma(_1427, _1421, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1435 = _1417 * _1433;
        float _1437 = fma(_1299, _1435, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1439 = _1431 + (-1.0);
        float _1441 = fma(_1309, _1435, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1443 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1445 = _1437 + _1443;
        float _1447 = _1439 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1449 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1451 = _1441 + _1449;
        float _1453 = _1445 * _1445;
        float _1455 = fma(_1395, _1431, _1447);
        float _1457 = _1451 * _1451;
        _1409 = _1455;
        _1323 = _1453;
        _1325 = _1457;
        _1287 = _1437;
        _1289 = _1441;
    }
    float _1459 = _1409;
    float _1461 = _1323;
    float _1463 = _1325;
    float _1465 = _1287;
    float _1467 = _1289;
    float _1469 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1471 = _1459 + _1469;
    float _1473 = _1403 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1475 = _1403 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1477 = _1403 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1479 = fma(_1471, _1471, _1461);
    float _1481 = fma(_1401, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1473);
    float _1483 = fma(_1401, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1475);
    float _1485 = fma(_1401, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1477);
    float _1487 = _1479 + _1463;
    float _1489 = _1399 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1491 = _1399 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1493 = _1399 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1495 = fma(_1397, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1489);
    float _1497 = sqrt(_1487);
    float _1499 = fma(_1397, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1491);
    float _1501 = fma(_1397, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1493);
    float _1503 = fma(_1393, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1481);
    float _1505 = fma(_1391, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1495);
    float _1507 = fma(_1391, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1499);
    float _1509 = fma(_1393, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1483);
    float _1511 = fma(_1393, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1485);
    float _1513 = fma(_1391, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1501);
    out.m_87.x = _1503;
    out.m_87.y = _1509;
    out.m_87.z = _1511;
    out.m_89.x = _1505;
    out.m_89.y = _1507;
    out.m_89.z = _1513;
    bool _1515 = _1497 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1517 = isnan(_1497);
    bool _1519 = _1515 || _1517;
    bool _1521 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1523 = _1519 || _1521;
    if (!_1523)
    {
        _1239 = 1.0;
    }
    float _1525 = _1239;
    bool _1527 = !_1523;
    float _1529 = _1525;
    if (!_1527)
    {
        bool _1531 = _1497 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1533 = isnan(_1497);
        bool _1535 = _1531 || _1533;
        bool _1537 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1539 = _1535 || _1537;
        if (!_1539)
        {
            float _1541 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1543 = _1497 + _1541;
            float _1545 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1547 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1545;
            float _1549 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1551 = _1549 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1553 = 1.0 / _1547;
            float _1555 = _1543 * _1553;
            float _1557 = fma(_1555, _1551, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1529 = _1557;
            _1559 = true;
        }
        else
        {
            bool _1561 = _1497 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1563 = isnan(_1497);
            bool _1565 = _1561 || _1563;
            bool _1567 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1569 = _1565 || _1567;
            if (!_1569)
            {
                float _1571 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1573 = _1497 + _1571;
                float _1575 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1577 = _1575 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1579 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1581 = _1579 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1583 = 1.0 / _1577;
                float _1585 = _1573 * _1583;
                float _1587 = fma(_1585, _1581, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1529 = _1587;
                _1559 = true;
            }
            else
            {
                _1529 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1559 = false;
    float _1589 = _1529;
    float _1591 = fma(_1243, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1593 = fma(_1257, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1595 = floor(_1591);
    float _1597 = floor(_1593);
    float _1599 = -_1595;
    float _1601 = _1591 + _1599;
    float _1603 = -_1597;
    float _1605 = _1593 + _1603;
    float2 _5427 = float2(_1601, _1605);
    float _1607 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5427, float2(0.0), isnan(_5427)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5427, float2(0.0), isnan(_5427)), level(0.0)).x;
    float _1609 = _1387 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1611 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1613 = _1459 + _1611;
    float _1615 = fma(_1243, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1609);
    float _1617 = fma(_1613, _1589, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1619 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1615);
    float _1621 = _1387 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1623 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1625 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1627 = _1623 || _1625;
    bool _1629 = isnan(0.5);
    bool _1631 = _1627 || _1629;
    float _1633 = _1619 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1635 = fma(_1243, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1621);
    float _1637 = 1.0 / _1633;
    float _1639 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1635);
    float _1641 = _1639 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1643 = _1641 + _1633;
    float _1645 = _1643 * _1637;
    float _1647 = _1645 * 0.5;
    float _1649 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1651 = fma(_1647, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1649);
    float _1653 = 1.0 / _1651;
    float _1655 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _1657 = _1387 + _1655;
    float _1659 = _1657 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1661 = fma(_1243, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1659);
    float _1663 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1665 = _1653 * _1663;
    float _1667 = _1657 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1669 = fma(_1257, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1661);
    bool _1671 = _1665 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1673 = fma(_1243, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1667);
    bool _1675 = _1665 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1677 = _1669 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _1679 = !_1671;
    int _1681 = _1679 ? 0 : 1;
    float _1683 = fma(_1257, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1673);
    float _1685 = trunc(_1677);
    int _1687 = int(_1685);
    float _1689 = _1683 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    int _1691 = 2;
    float _1693 = _1613;
    float _1695 = _1589;
    float _1697 = _1617;
    if (!_1671)
    {
        _1691 = 1;
    }
    int _1699 = _1691;
    int _1701 = _1699;
    if (!_1675)
    {
        _1701 = _1681;
    }
    int _1703 = _1701;
    float _1705 = trunc(_1689);
    int _1707 = int(_1705);
    int _1709 = _1703 << 6;
    int _1711 = _1709 + 48;
    uint _1714 = uint(int(uint(_1711) >> uint(2)));
    uint _1716 = uint(int(uint(int(_1714)) >> uint(2)));
    int _1718 = int(_1714) & 3;
    float _1720 = (*spvDescriptorSet0.vp_c15)._m0[int(_1716)][_1718];
    int _1722 = int(_1714) + 1;
    uint _1724 = uint(int(uint(_1722) >> uint(2)));
    int _1726 = _1722 & 3;
    float _1728 = (*spvDescriptorSet0.vp_c15)._m0[int(_1724)][_1726];
    int _1730 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1732 = _1687 + _1730;
    int _1734 = _1732 + 1;
    bool _1736 = _1734 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1738 = _1709 + 56;
    uint _1740 = uint(int(uint(_1738) >> uint(2)));
    uint _1742 = uint(int(uint(int(_1740)) >> uint(2)));
    int _1744 = int(_1740) & 3;
    float _1746 = (*spvDescriptorSet0.vp_c15)._m0[int(_1742)][_1744];
    int _1748 = int(_1740) + 1;
    uint _1750 = uint(int(uint(_1748) >> uint(2)));
    int _1752 = _1748 & 3;
    float _1754 = (*spvDescriptorSet0.vp_c15)._m0[int(_1750)][_1752];
    int _1756 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1758 = _1707 + _1756;
    int _1760 = _1758 + 1;
    float _1762 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1764 = _1465 + _1762;
    int _1766 = _1734 | _1760;
    float _1768 = fma(_1764, _1589, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    int _1770 = _1709 + 64;
    uint _1772 = uint(int(uint(_1770) >> uint(2)));
    uint _1774 = uint(int(uint(int(_1772)) >> uint(2)));
    int _1776 = int(_1772) & 3;
    float _1778 = (*spvDescriptorSet0.vp_c15)._m0[int(_1774)][_1776];
    int _1780 = int(_1772) + 1;
    uint _1782 = uint(int(uint(_1780) >> uint(2)));
    int _1784 = _1780 & 3;
    float _1786 = (*spvDescriptorSet0.vp_c15)._m0[int(_1782)][_1784];
    bool _1788 = _1766 < 0;
    bool _1790 = _1788 || _1736;
    float _1792 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1794 = _1467 + _1792;
    float _1796 = _1764;
    int _1798 = _1734;
    float _1800 = as_type<float>(_1760);
    if (_1631)
    {
        _1693 = _1768;
    }
    float _1802 = _1693;
    bool _1804 = _1760 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1806 = _1804 || _1790;
    float _1808 = fma(_1794, _1589, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1810 = _1802;
    if (_1631)
    {
        _1695 = _1617;
    }
    float _1812 = _1695;
    int _1814 = _1709 + 72;
    uint _1816 = uint(int(uint(_1814) >> uint(2)));
    uint _1818 = uint(int(uint(int(_1816)) >> uint(2)));
    int _1820 = int(_1816) & 3;
    float _1822 = (*spvDescriptorSet0.vp_c15)._m0[int(_1818)][_1820];
    int _1824 = int(_1816) + 1;
    uint _1826 = uint(int(uint(_1824) >> uint(2)));
    int _1828 = _1824 & 3;
    float _1830 = (*spvDescriptorSet0.vp_c15)._m0[int(_1826)][_1828];
    float _1832 = _1812;
    if (_1631)
    {
        _1796 = _1808;
    }
    float _1834 = _1796;
    int _1836 = _1709 + 96;
    uint _1838 = uint(int(uint(_1836) >> uint(2)));
    uint _1840 = uint(int(uint(int(_1838)) >> uint(2)));
    int _1842 = int(_1838) & 3;
    float _1844 = (*spvDescriptorSet0.vp_c15)._m0[int(_1840)][_1842];
    int _1846 = int(_1838) + 1;
    uint _1848 = uint(int(uint(_1846) >> uint(2)));
    int _1850 = _1846 & 3;
    float _1852 = (*spvDescriptorSet0.vp_c15)._m0[int(_1848)][_1850];
    int _1854 = _1709 + 104;
    uint _1856 = uint(int(uint(_1854) >> uint(2)));
    uint _1858 = uint(int(uint(int(_1856)) >> uint(2)));
    int _1860 = int(_1856) & 3;
    float _1862 = (*spvDescriptorSet0.vp_c15)._m0[int(_1858)][_1860];
    int _1864 = int(_1856) + 1;
    uint _1866 = uint(int(uint(_1864) >> uint(2)));
    int _1868 = _1864 & 3;
    float _1870 = (*spvDescriptorSet0.vp_c15)._m0[int(_1866)][_1868];
    float _1872 = _1834;
    int _1874 = as_type<int>(_1852);
    if (!_1631)
    {
        float _1876 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1878 = _1387 + _1876;
        float _1880 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1882 = _1243 + _1880;
        float _1884 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1886 = _1878 * _1878;
        float _1888 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1890 = _1257 + _1888;
        float _1892 = fma(_1882, _1882, _1886);
        float _1894 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1896 = fma(_1890, _1890, _1892);
        float _1898 = sqrt(_1896);
        float _1900 = _1884 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1902 = -_1257;
        float _1904 = _1902 + _1808;
        float _1906 = precise::min(_1898, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1908 = _1906 * _1894;
        float _1910 = -_1387;
        float _1912 = _1910 + _1617;
        float _1914 = -_1243;
        float _1916 = _1914 + _1768;
        float _1918 = _1900 * _1908;
        float _1920 = fma(_1912, _1918, _1387);
        float _1922 = fma(_1916, _1918, _1243);
        float _1924 = fma(_1904, _1918, _1257);
        _1832 = _1920;
        _1810 = _1922;
        _1872 = _1924;
    }
    float _1926 = _1832;
    float _1928 = _1810;
    float _1930 = _1872;
    float _1932 = _1657 * _1852;
    float _1934 = _1926 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1936 = _1657 * _1786;
    if (!_1806)
    {
        int _1938 = _1760 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1940 = _1938 + _1734;
        _1798 = _1940;
    }
    int _1942 = _1798;
    float _1944 = fma(_1243, _1844, _1932);
    float _1946 = fma(_1928, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1934);
    float _1948 = _1657 * _1728;
    if (!_1806)
    {
        float _1950 = floor(_1677);
        _1800 = _1950;
    }
    float _1952 = _1800;
    float _1954 = fma(_1257, _1862, _1944);
    float _1956 = fma(_1930, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1946);
    float _1958 = fma(_1243, _1720, _1948);
    float _1960 = fma(_1243, _1778, _1936);
    float _1962 = _1954 + _1870;
    float _1964 = _1956 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    int _1966 = _1709 + 80;
    uint _1968 = uint(int(uint(_1966) >> uint(2)));
    uint _1970 = uint(int(uint(int(_1968)) >> uint(2)));
    int _1972 = int(_1968) & 3;
    float _1974 = (*spvDescriptorSet0.vp_c15)._m0[int(_1970)][_1972];
    int _1976 = int(_1968) + 1;
    uint _1978 = uint(int(uint(_1976) >> uint(2)));
    int _1980 = _1976 & 3;
    float _1982 = (*spvDescriptorSet0.vp_c15)._m0[int(_1978)][_1980];
    int _1984 = as_type<int>(_1956);
    if (!_1806)
    {
        int _1986 = _1942 << 2;
        _1874 = _1986;
    }
    int _1988 = _1874;
    float _1990 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1992 = _1964 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1994 = 1.0 / _1962;
    int _1996 = _1988;
    float _1998 = _1990;
    if (!_1806)
    {
        uint _2000 = uint(int(uint(_1942) >> uint(2)));
        _1984 = int(_2000);
    }
    int _2002 = _1984;
    float _2004 = fma(_1257, _1746, _1958);
    if (!_1806)
    {
        int _2006 = 12 & _1988;
        _1996 = _2006;
    }
    int _2008 = _1996;
    int _2010 = _1709 + 88;
    uint _2012 = uint(int(uint(_2010) >> uint(2)));
    uint _2014 = uint(int(uint(int(_2012)) >> uint(2)));
    int _2016 = int(_2012) & 3;
    float _2018 = (*spvDescriptorSet0.vp_c15)._m0[int(_2014)][_2016];
    int _2020 = int(_2012) + 1;
    uint _2022 = uint(int(uint(_2020) >> uint(2)));
    int _2024 = _2020 & 3;
    float _2026 = (*spvDescriptorSet0.vp_c15)._m0[int(_2022)][_2024];
    float _2028 = -_1992;
    float _2030 = fma(_2028, _1990, 1.0);
    float _2032 = fma(_1257, _1822, _1960);
    if (!_1806)
    {
        int _2034 = _2002 << 4;
        int _2036 = _2034 + _2008;
        _1998 = as_type<float>(_2036);
    }
    float _2038 = _1998;
    float _2040 = _1926 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2042 = _2004 + _1754;
    float _2044 = _1926 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2046 = _1926 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2048 = fma(_1928, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2040);
    float _2050 = _2038;
    if (!_1806)
    {
        int _2052 = as_type<int>(_2038) + 400;
        uint _2054 = uint(int(uint(_2052) >> uint(2)));
        uint _2056 = uint(int(uint(int(_2054)) >> uint(2)));
        int _2058 = int(_2054) & 3;
        float _2060 = (*spvDescriptorSet0.vp_c15)._m0[int(_2056)][_2058];
        _2050 = _2060;
    }
    float _2062 = _2050;
    float _2064 = fma(_1928, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2044);
    float _2066 = _2032 + _1830;
    float _2068 = _2042 * _1994;
    float _2070 = fma(_1930, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2048);
    float _2072 = fma(_1930, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2064);
    float _2074 = fma(_1928, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2046);
    float _2076 = _2066 * _1994;
    float _2078 = _2070 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2080 = _2072 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    bool _2082 = _2068 >= 0.0;
    float _2084 = fma(_1930, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2074);
    float _2086 = _2078 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2088 = log2(_2030);
    bool _2090 = _2068 <= 1.0;
    bool _2092 = _2090 && _2082;
    float _2094 = _2078 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2096 = fma(_2080, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2086);
    if (!_1806)
    {
        float _2098 = -_1952;
        float _2100 = _1677 + _2098;
        _1227 = _2100;
    }
    float _2102 = _1227;
    bool _2104 = _2076 >= 0.0;
    bool _2106 = _2104 && _2092;
    float _2108 = fma(_2080, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2094);
    float _2110 = fma(_1964, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2096);
    float _2112 = as_type<float>(_1709);
    if (!_1806)
    {
        float _2114 = floor(_1689);
        _2112 = _2114;
    }
    float _2116 = _2112;
    float _2118 = _2084 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    bool _2120 = _2076 <= 1.0;
    bool _2122 = _2120 && _2106;
    float _2124 = fma(_1964, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2108);
    float _2126 = fma(_2118, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2110);
    float _2128 = _2078 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2130 = _2088 * 0.693147182464599609375;
    float _2132 = 1.0 / _2126;
    float _2134 = _1657 * _1982;
    float _2136 = fma(_2080, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2128);
    float _2138 = fma(_1243, _1974, _2134);
    float _2140 = fma(_1964, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2136);
    float _2142 = _1982;
    if (_2122)
    {
        float _2144 = float(_1703);
        _2142 = _2144;
    }
    float _2146 = _2142;
    float _2148 = _2146;
    if (!_1806)
    {
        float _2150 = -_2116;
        float _2152 = _1689 + _2150;
        _1697 = _2152;
    }
    float _2154 = _1697;
    float _2156 = fma(_1257, _2018, _2138);
    float _2158 = fma(_2118, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2140);
    float _2160 = fma(_2118, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2124);
    float _2162 = _2134;
    if (_2122)
    {
        float _2164 = rint(_2146);
        float _2166 = precise::max(_2164, 0.0);
        uint _2168 = uint(_2166);
        uint _2170 = clamp(_2168, 0u, 65535u);
        _2162 = as_type<float>(_2170);
    }
    float _2172 = _2162;
    float _2174 = _2156 + _2026;
    float _2176 = _2158 * _2132;
    float _2178 = _2160 * _2132;
    float _2180 = _2130 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2182 = _2174 * _1994;
    float _2184 = _2130;
    float _2186 = _2180;
    if (!_1806)
    {
        float _2188 = rint(_2062);
        float _2190 = precise::max(_2188, 0.0);
        uint _2192 = uint(_2190);
        uint _2194 = clamp(_2192, 0u, 65535u);
        _2184 = as_type<float>(_2194);
    }
    float _2196 = _2184;
    float _2198 = fma(_2176, 0.5, 0.5);
    float _2200 = fma(_2178, -0.5, 0.5);
    float _2202 = _2172;
    float _2204 = _2198;
    if (_2122)
    {
        float3 _6452 = float3(_2068, _2076, float(as_type<int>(_2172)));
        float3 _6456 = select(_6452, float3(0.0), isnan(_6452));
        float _2206 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6456.xy, uint(rint(_6456.z)), _2182, level(0.0));
        _2202 = _2206;
    }
    float _2208 = _2202;
    float3 _6466 = float3(_2198, _2200, _2180);
    float _2210 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6466, float3(0.0), isnan(_6466)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6466, float3(0.0), isnan(_6466)), level(0.0)).x;
    float3 _6475 = float3(_2198, _2200, _2180);
    float4 _2213 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6475, float3(0.0), isnan(_6475)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6475, float3(0.0), isnan(_6475)), level(0.0)).xyzw;
    float _2215 = _2213.x;
    float _2217 = _2213.y;
    float _2219 = _2213.z;
    float _2221 = _2213.w;
    float _2223 = _2154;
    if (!_1806)
    {
        float3 _6498 = float3(_2102, _2154, float(as_type<int>(_2196)));
        float3 _6500 = select(_6498, float3(0.0), isnan(_6498));
        float _2225 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6500.xy, uint(rint(_6500.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6500.xy, uint(rint(_6500.z)), level(0.0)).x;
        _2223 = _2225;
    }
    float _2227 = _2223;
    if (_1806)
    {
        _2148 = 1.0;
    }
    float _2229 = _2148;
    float _2231 = _2229;
    if (!_1806)
    {
        int _2233 = _1942 << 4;
        int _2235 = _2233 + 2048;
        uint _2237 = uint(int(uint(_2235) >> uint(2)));
        uint _2239 = uint(int(uint(int(_2237)) >> uint(2)));
        int _2241 = int(_2237) & 3;
        float _2243 = (*spvDescriptorSet0.vp_c15)._m0[int(_2239)][_2241];
        int _2245 = int(_2237) + 1;
        uint _2247 = uint(int(uint(_2245) >> uint(2)));
        int _2249 = _2245 & 3;
        float _2251 = (*spvDescriptorSet0.vp_c15)._m0[int(_2247)][_2249];
        int _2253 = _2235 + 8;
        uint _2255 = uint(int(uint(_2253) >> uint(2)));
        uint _2257 = uint(int(uint(int(_2255)) >> uint(2)));
        int _2259 = int(_2255) & 3;
        float _2261 = (*spvDescriptorSet0.vp_c15)._m0[int(_2257)][_2259];
        int _2263 = int(_2255) + 1;
        uint _2265 = uint(int(uint(_2263) >> uint(2)));
        int _2267 = _2263 & 3;
        float _2269 = (*spvDescriptorSet0.vp_c15)._m0[int(_2265)][_2267];
        float _2271 = _1657 * _2251;
        float _2273 = fma(_1243, _2243, _2271);
        float _2275 = fma(_1257, _2261, _2273);
        float _2277 = _2275 + _2269;
        float _2279 = precise::clamp(_2277, 0.0, 1.0);
        float _2281 = -_2279;
        float _2283 = _2281 + _2227;
        float _2285 = fma(_2283, 500.0, 1.5);
        float _2287 = exp2(_2285);
        float _2289 = 0.0 + _2287;
        float _2291 = precise::clamp(_2289, 0.0, 1.0);
        _2204 = _2243;
        _2231 = _2291;
    }
    float _2293 = _2204;
    float _2295 = _2231;
    float _2297 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2299 = _1926 + _2297;
    float _2301 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2303 = _1928 + _2301;
    float _2305 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2307 = _1930 + _2305;
    float _2309 = _2299 * _2299;
    float _2311 = fma(_2303, _2303, _2309);
    float _2313 = fma(_2307, _2307, _2311);
    float _2315 = rsqrt(_2313);
    float _2317 = _2315 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2319 = _2303 * _2317;
    float _2321 = _2307 * _2317;
    float _2323 = _2319 * _2319;
    float _2325 = _2321 * _2321;
    float _2327 = _2323 + _2325;
    float _2329 = sqrt(_2327);
    bool _2331 = _2329 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2333 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2335 = _2329 + _2333;
    float _2337 = _2307;
    float _2339 = _2327;
    float _2341 = _2335;
    float _2343 = _2293;
    float _2345 = _2317;
    if (_2331)
    {
        float _2347 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2337 = _2347;
    }
    float _2349 = _2337;
    if (_2331)
    {
        float _2351 = rsqrt(_2327);
        _2339 = _2351;
    }
    float _2353 = _2339;
    if (_2331)
    {
        float _2355 = _2335 * _2349;
        _2341 = _2355;
    }
    float _2357 = _2341;
    if (_2331)
    {
        float _2359 = _2357 * 0.15915493667125701904296875;
        _2343 = _2359;
    }
    float _2361 = _2343;
    float _2363 = _2315;
    float _2365 = _2361;
    if (_2331)
    {
        float _2367 = _2361 * 6.283185482025146484375;
        float _2369 = sin(_2367);
        _2363 = _2369;
    }
    float _2371 = _2363;
    float _2373 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2375 = precise::max(0.0, _2373);
    float _2377 = _2311;
    float _2379 = _2375;
    float _2381 = _2373;
    if (_2331)
    {
        float _2383 = _2361 * 6.283185482025146484375;
        float _2385 = cos(_2383);
        _2377 = _2385;
    }
    float _2387 = _2377;
    float _2389 = -_2317;
    float _2391 = -_2375;
    float _2393 = fma(_2299, _2389, _2391);
    float _2395 = _2393;
    if (!_2331)
    {
        _2379 = _2321;
    }
    float _2397 = _2379;
    float _2399 = _2397;
    if (_2331)
    {
        float _2401 = _2393 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2381 = _2401;
    }
    float _2403 = _2381;
    float _2405 = _2403;
    if (!_2331)
    {
        _2365 = _2323;
    }
    float _2407 = _2365;
    float _2409 = _2371;
    float _2411 = _2407;
    if (_2331)
    {
        float _2413 = fma(_2371, _2403, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2409 = _2413;
    }
    float _2415 = _2409;
    float _2417 = _2415;
    float _2419 = _2387;
    if (_2331)
    {
        float _2421 = _2387 + (-1.0);
        _2405 = _2421;
    }
    float _2423 = _2405;
    if (_2331)
    {
        float _2425 = _2353 * _2415;
        _2186 = _2425;
    }
    float _2427 = _2186;
    if (!_2331)
    {
        _2417 = _2319;
    }
    float _2429 = _2417;
    float _2431 = _2429;
    if (_2331)
    {
        float _2433 = _2423 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2345 = _2433;
    }
    float _2435 = _2345;
    if (_2331)
    {
        float _2437 = _2319 * _2427;
        _2431 = _2437;
    }
    float _2439 = _2431;
    if (_2331)
    {
        float _2441 = _2321 * _2427;
        _2399 = _2441;
    }
    float _2443 = _2399;
    float _2445 = sqrt(_2313);
    if (_2331)
    {
        float _2447 = fma(_2393, _2387, _2435);
        _2395 = _2447;
    }
    float _2449 = _2395;
    if (_2331)
    {
        float _2451 = _2439 * _2439;
        _2411 = _2451;
    }
    float _2453 = _2411;
    if (!_2331)
    {
        _2419 = _2325;
    }
    float _2455 = _2419;
    float _2457 = _2455;
    if (_2331)
    {
        float _2459 = _2443 * _2443;
        _2457 = _2459;
    }
    float _2461 = _2457;
    float _2463 = fma(_2449, _2449, _2453);
    float _2465 = _2463 + _2461;
    float _2467 = rsqrt(_2465);
    float _2469 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2471 = fma(_2445, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2469);
    float _2473 = precise::clamp(_2471, 0.0, 1.0);
    float _2475 = -_2473;
    float _2477 = _2475 + 1.0;
    float _2479 = _2467 * _2449;
    float _2481 = _2467 * _2439;
    float _2483 = abs(_2477);
    float _2485 = log2(_2483);
    float _2487 = _2467 * _2443;
    float _2489 = _2481 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2491 = -_2489;
    float _2493 = fma(_2479, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2491);
    float _2495 = -_2487;
    float _2497 = fma(_2495, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2493);
    float _2499 = fma(_2497, -0.5, 0.5);
    float _2501 = _2485 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2503 = fma(_2497, 0.5, 0.5);
    float _2505 = sqrt(_2499);
    float _2507 = fma(_2503, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2509 = fma(_2503, _2507, -0.212114393711090087890625);
    float _2511 = _2479 + 1.0;
    float _2513 = exp2(_2501);
    float _2515 = fma(_2503, _2509, 1.570728778839111328125);
    float _2517 = _2505 * 0.636619746685028076171875;
    float _2519 = -_2515;
    float _2521 = fma(_2517, _2519, 1.0);
    float _2523 = -_2479;
    float _2525 = fma(_2513, _2511, _2523);
    float _2527 = fma(_2525, 0.5, 0.5);
    float2 _6968 = float2(_2521, _2527);
    float3 _2529 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6968, float2(0.0), isnan(_6968)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6968, float2(0.0), isnan(_6968)), level(0.0)).xyz;
    float _2531 = _2529.x;
    float _2533 = _2529.y;
    float _2535 = _2529.z;
    float _2537 = abs(_1665);
    float _2539 = log2(_2537);
    float _2541 = -_1607;
    float _2543 = _2541 + 1.0;
    bool _2545 = _1665 <= 8000.0;
    bool _2547 = isnan(_1665);
    bool _2549 = _2545 || _2547;
    bool _2551 = isnan(8000.0);
    bool _2553 = _2549 || _2551;
    float _2555 = float(_2553);
    float _2557 = _2539 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2559 = _2078 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2561 = fma(_2080, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2559);
    float _2563 = exp2(_2557);
    float _2565 = fma(_1964, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2561);
    float _2567 = _2485 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2569 = fma(_2118, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2565);
    float _2571 = fma(_2563, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2573 = precise::clamp(_2571, 0.0, 1.0);
    float _2575 = exp2(_2567);
    float _2577 = fma(_2573, -2.0, 3.0);
    float _2579 = _2573 * _2573;
    float _2581 = _2579 * _2577;
    float _2583 = -_2581;
    float _2585 = _2583 + 1.0;
    float _2587 = fma(_2585, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2581);
    float _2589 = _2569 + _2126;
    float _2591 = -_2575;
    float _2593 = _2591 + 1.0;
    float _2595 = _2555 * _2587;
    float _2597 = _2555;
    float _2599 = _2569;
    if (!_2122)
    {
        _2597 = 1.0;
    }
    float _2601 = _2597;
    float _2603 = _2589 * 0.5;
    float _2605 = _2601;
    if (_2122)
    {
        bool _2607 = _2208 >= _2182;
        bool _2609 = isnan(_2208);
        bool _2611 = _2607 || _2609;
        bool _2613 = isnan(_2182);
        bool _2615 = _2611 || _2613;
        float _2617 = float(_2615);
        _2605 = _2617;
    }
    float _2619 = _2605;
    float _2621 = _2595 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2623 = _2593 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _2158;
    out.gl_Position.y = _2160;
    out.gl_Position.z = _2569;
    out.gl_Position.w = _2126;
    bool _2625 = _2445 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2627 = isnan(_2445);
    bool _2629 = _2625 || _2627;
    bool _2631 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2633 = _2629 || _2631;
    float _2635 = _2543 * _2621;
    float _2637 = precise::clamp(_2635, 0.0, 1.0);
    float _2639 = _2619 * _2295;
    float _2641 = _2623 * _2210;
    out.m_91.z = _2603;
    out.m_91.w = _2126;
    float _2643 = -_2637;
    float _2645 = fma(_2643, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2647 = -_2639;
    float _2649 = fma(_2647, _2645, 1.0);
    float _2651 = precise::clamp(_2649, 0.0, 1.0);
    float _2653 = _2221 * _2641;
    float _2655 = -_2623;
    float _2657 = _2655 + 1.0;
    float _2659 = _2651 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2661 = _2657;
    float _2663 = _2651;
    float _2665 = _2623;
    float _2667 = _2653;
    if (!_2633)
    {
        _2599 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2669 = _2599;
    float _2671 = _2221 * _2657;
    float _2673 = _2669;
    float _2675 = _2669;
    if (!_2633)
    {
        _2661 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2677 = _2661;
    out.m_93.x = _2659;
    float _2679 = _2677;
    float _2681 = _2677;
    if (!_2633)
    {
        _2663 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2683 = _2663;
    float _2685 = _2683;
    float _2687 = _2683;
    if (!_2633)
    {
        _2665 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2689 = _2665;
    float _2691 = _2535 * _2641;
    float _2693 = fma(_2531, _2653, _2215);
    float _2695 = fma(_2533, _2653, _2217);
    float _2697 = _2691;
    float _2699 = _2689;
    float _2701 = _2689;
    if (!_2633)
    {
        _2667 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2703 = _2667;
    float _2705 = fma(_2221, _2691, _2219);
    float _2707 = _2703;
    float _2709 = _2703;
    if (!_2633)
    {
        _2697 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2711 = _2697;
    out.m_95.x = _2693;
    out.m_95.y = _2695;
    out.m_95.z = _2705;
    out.m_95.w = _2671;
    bool _2713 = !_2633;
    float _2715 = _2711;
    float _2717 = _2711;
    if (!_2713)
    {
        bool _2719 = _2445 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2721 = isnan(_2445);
        bool _2723 = _2719 || _2721;
        bool _2725 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2727 = _2723 || _2725;
        if (!_2727)
        {
            float _2729 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2731 = _2445 + _2729;
            float _2733 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2735 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2733;
            float _2737 = 1.0 / _2735;
            float _2739 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2741 = _2739 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2743 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2745 = _2743 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2747 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2749 = _2747 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2751 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2753 = _2751 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2755 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2757 = _2755 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2759 = _2731 * _2737;
            float _2761 = precise::clamp(_2759, 0.0, 1.0);
            float _2763 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2765 = _2763 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2767 = fma(_2761, _2741, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2769 = fma(_2761, _2765, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2771 = fma(_2761, _2745, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2773 = fma(_2761, _2749, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2775 = fma(_2761, _2753, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2777 = fma(_2761, _2757, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2717 = _2767;
            _2687 = _2775;
            _2709 = _2769;
            _2681 = _2773;
            _2675 = _2771;
            _2701 = _2777;
            _2779 = true;
        }
        else
        {
            bool _2781 = _2445 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2783 = isnan(_2445);
            bool _2785 = _2781 || _2783;
            bool _2787 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2789 = _2785 || _2787;
            if (!_2789)
            {
                _2707 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2791 = _2707;
            _2709 = _2791;
            if (!_2789)
            {
                _2715 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2793 = _2715;
            _2717 = _2793;
            if (!_2789)
            {
                _2673 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2795 = _2673;
            _2675 = _2795;
            if (!_2789)
            {
                _2679 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2797 = _2679;
            _2681 = _2797;
            if (!_2789)
            {
                _2685 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2799 = _2685;
            _2687 = _2799;
            if (!_2789)
            {
                _2699 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2801 = _2699;
            bool _2803 = !_2789;
            _2701 = _2801;
            if (!_2803)
            {
                bool _2805 = _2445 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2807 = isnan(_2445);
                bool _2809 = _2805 || _2807;
                bool _2811 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2813 = _2809 || _2811;
                if (!_2813)
                {
                    float _2815 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2817 = _2445 + _2815;
                    float _2819 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2821 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2819;
                    float _2823 = 1.0 / _2821;
                    float _2825 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2827 = _2825 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2829 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2831 = _2829 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2833 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2835 = _2833 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2837 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2839 = _2837 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2841 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2843 = _2841 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2845 = _2817 * _2823;
                    float _2847 = precise::clamp(_2845, 0.0, 1.0);
                    float _2849 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2851 = _2849 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2853 = fma(_2847, _2827, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2855 = fma(_2847, _2851, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2857 = fma(_2847, _2831, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2859 = fma(_2847, _2835, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2861 = fma(_2847, _2839, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2863 = fma(_2847, _2843, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2717 = _2853;
                    _2687 = _2861;
                    _2709 = _2855;
                    _2681 = _2859;
                    _2675 = _2857;
                    _2701 = _2863;
                    _2779 = true;
                }
                else
                {
                    _2717 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2687 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2709 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2681 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2675 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2701 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2779 = false;
    float _2865 = _2717;
    float _2867 = _2687;
    float _2869 = _2709;
    float _2871 = _2681;
    float _2873 = _2675;
    float _2875 = _2701;
    float _2877 = fma(_1507, -0.5, 0.5);
    float _2879 = precise::clamp(_2877, 0.0, 1.0);
    float _2881 = -_2865;
    float _2883 = _2881 + _2867;
    float _2885 = -_2869;
    float _2887 = _2885 + _2871;
    float _2889 = -_2873;
    float _2891 = _2889 + _2875;
    bool _2893 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2895 = fma(_2879, _2883, _2865);
    float _2897 = fma(_2879, _2887, _2869);
    float _2899 = fma(_2879, _2891, _2873);
    float _2901 = _2895 * 0.586610972881317138671875;
    out.m_63.x = 1.0;
    float _2903 = fma(_2897, 0.298911988735198974609375, _2901);
    float _2905 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2907 = fma(_2899, 0.114477999508380889892578125, _2903);
    out.m_93.w = _2905;
    float _2909 = -_2907;
    float _2911 = _2897 + _2909;
    float _2913 = -_2907;
    float _2915 = _2895 + _2913;
    float _2917 = -_2907;
    float _2919 = _2899 + _2917;
    out.m_97.x = 0.0;
    float _2921 = fma(_2911, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2907);
    float _2923 = fma(_2915, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2907);
    float _2925 = fma(_2919, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2907);
    out.m_99.x = _2921;
    out.m_99.y = _2923;
    out.m_99.z = _2925;
    if (!_2893)
    {
        return out;
    }
    float _2927 = -_1926;
    float _2929 = _2927 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2931 = -_1928;
    float _2933 = _2931 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2935 = -_1930;
    float _2937 = _2935 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2939 = _2929 * _2929;
    float _2941 = fma(_2933, _2933, _2939);
    float _2943 = fma(_2937, _2937, _2941);
    float _2945 = sqrt(_2943);
    float _2947 = rsqrt(_2943);
    float _2949 = -_2945;
    float _2951 = _2949 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2953 = _2951 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2955 = precise::clamp(_2953, 0.0, 1.0);
    float _2957 = _2933 * _2947;
    float _2959 = _2929 * _2947;
    float _2961 = abs(_2955);
    float _2963 = log2(_2961);
    float _2965 = _2937 * _2947;
    float _2967 = _2957 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2969 = _1507 * _2959;
    float _2971 = -_2959;
    float _2973 = -_2967;
    float _2975 = fma(_2971, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2973);
    float _2977 = fma(_1505, _2957, _2969);
    float _2979 = -_2965;
    float _2981 = fma(_2979, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2975);
    float _2983 = fma(_1513, _2965, _2977);
    float _2985 = precise::clamp(_2983, 0.0, 1.0);
    float _2987 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2989 = _2981 + _2987;
    float _2991 = _2963 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2993 = _2989 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2995 = precise::clamp(_2993, 0.0, 1.0);
    float _2997 = exp2(_2991);
    float _2999 = _2997 * _2995;
    float _3001 = _2985 * _2999;
    float _3003 = _3001 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3005 = _3001 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3007 = _3001 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_97.x = _3003;
    out.m_97.y = _3005;
    out.m_97.z = _3007;
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
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2779 = false;
    bool _1559 = false;
    bool _199 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _117 = in.m_60.w;
    float _119 = trunc(_117);
    int _121 = int(_119);
    bool _125 = _121 >= 1;
    float _127 = 0.0;
    if (!_125)
    {
        _127 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _129 = _127;
    float _131 = _129;
    if (!_125)
    {
        out.m_63.x = 0.0;
    }
    int _133 = 0;
    if (!_125)
    {
        float _135 = _129 * 5.0;
        _133 = as_type<int>(_135);
    }
    int _137 = _133;
    int _139 = _137;
    if (!_125)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3064 = as_type<float>(_137);
        out.gl_Position.z = _3064;
    }
    if (!_125)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _141 = in.m_65.w;
    bool _143 = _141 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _145 = isnan(_141);
    bool _147 = _143 || _145;
    bool _149 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _151 = _147 || _149;
    float _153 = -_141;
    float _155 = _153 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _157 = _155;
    if (_151)
    {
        float _159 = float(_121);
        _131 = _159;
    }
    float _161 = _131;
    bool _163 = _155 >= _161;
    bool _165 = !_151;
    bool _167 = _163 || _165;
    float _169 = _161;
    if (_167)
    {
        _169 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _171 = _169;
    if (_167)
    {
        out.m_63.x = 0.0;
    }
    if (_167)
    {
        float _173 = _171 * 5.0;
        _139 = as_type<int>(_173);
    }
    int _175 = _139;
    if (_167)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3134 = as_type<float>(_175);
        out.gl_Position.z = _3134;
    }
    if (_167)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _177 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _179 = !_177;
    float _197;
    if (!_179)
    {
        float _181 = in.m_67.x;
        float _183 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _185 = _181 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _187 = fma(_185, (*spvDescriptorSet0.vp_c9)._m0[12].x, _155);
        float _189 = _187 * _183;
        float _191 = floor(_189);
        float _193 = -_191;
        float _195 = _189 + _193;
        _197 = _195;
        _199 = true;
    }
    else
    {
        float _201 = float(_121);
        float _203 = 1.0 / _201;
        float _205 = _155 * _203;
        _197 = _205;
    }
    _199 = false;
    float _207 = _197;
    int _209 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _211 = _209;
    int _213 = 0;
    int _215 = _112(_211, _213, (*spvDescriptorSet0.support_buffer));
    float _217 = in.m_67.x;
    float _219 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _221 = in.m_69.z;
    float _223 = in.m_67.w;
    float _225 = in.m_69.y;
    float _227 = _217 * 8.0;
    float _229 = trunc(_221);
    int _231 = int(_229);
    float _233 = rint(_227);
    float _235 = _233 * 0.125;
    float _237 = precise::clamp(_235, 0.0, 1.0);
    int _239 = _215 + (-1);
    float _241 = float(_239);
    float _243 = _237 * _241;
    float _245 = trunc(_243);
    int _247 = int(_245);
    float _249 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _251 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _249;
    float _253 = 1.0 / _251;
    int _255 = _247 + 1;
    int _257 = min(_239, _255);
    int _259 = _247;
    int _261 = 0;
    int _263 = _113(_259, _261, (*spvDescriptorSet0.support_buffer));
    int _265 = _231;
    int _267 = 0;
    int _269 = _113(_265, _267, (*spvDescriptorSet0.support_buffer));
    float3 _273 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_263, _269)), 0).xyz;
    float _275 = _273.x;
    float _277 = _273.y;
    float _279 = _273.z;
    int _281 = _257;
    int _283 = 0;
    int _285 = _113(_281, _283, (*spvDescriptorSet0.support_buffer));
    int _287 = _231;
    int _289 = 0;
    int _291 = _113(_287, _289, (*spvDescriptorSet0.support_buffer));
    float3 _293 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_285, _291)), 0).xyz;
    float _295 = _293.x;
    float _297 = _293.y;
    float _299 = _293.z;
    float _301 = in.m_67.z;
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _305 = _303 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _309 = _207 + _307;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _313 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _311;
    int _315 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _317 = _315 != 0;
    float _319 = 1.0 / _305;
    int _321 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _323 = _321 != 0;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _327 = _325 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _329 = in.m_69.x;
    int _331 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _333 = _331 != 0;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _337 = _207 + _335;
    bool _339 = _223 > 0.5;
    float _341 = 1.0 / _313;
    float _343 = -_225;
    float _345 = _343 + 1.0;
    int _347 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _349 = _347 != 0;
    int _351 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _353 = _351 != 0;
    int _355 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _357 = _355 != 0;
    float _359 = _309 * _253;
    float _361 = _225;
    float _363 = _207;
    if (_317)
    {
        float _365 = _339 ? _345 : _225;
        _361 = _365;
    }
    float _367 = _361;
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _371 = _207 + _369;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _375 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _373;
    float _377 = 1.0 / _327;
    bool _379 = _301 > 0.5;
    bool _381 = _379 && _323;
    float _383 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _385 = _207 + _383;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _389 = _207 + _387;
    float _391 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _393 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _391;
    float _395 = _371 * _341;
    float _397 = _385 * _319;
    float _399 = 1.0 / _375;
    float _401 = _301 * 2.0;
    float _403 = _217 + _301;
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _407 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _405;
    float _409 = fma(_393, _359, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _411 = _403 + (-1.0);
    float _413 = floor(_401);
    float _415 = _217 * 2.0;
    float _417 = fma(_411, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _419 = _389 * _377;
    float _421 = _219 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _423 = fma(_407, _359, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _427 = _425 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _429 = floor(_415);
    float _431 = _337 * _399;
    float _433 = _399;
    float _435 = _401;
    if (_323)
    {
        _433 = _329;
    }
    float _437 = _433;
    float _439 = fma(_421, _367, -0.5);
    float _441 = _437;
    if (!_323)
    {
        _435 = _329;
    }
    float _443 = _435;
    float _445 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _447 = _445 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _449 = _443;
    if (_381)
    {
        float _451 = -_437;
        float _453 = _451 + 1.0;
        _441 = _453;
    }
    float _455 = _441;
    bool _457 = _413 >= 0.0;
    bool _459 = isnan(_413);
    bool _461 = _457 || _459;
    bool _463 = isnan(0.0);
    bool _465 = _461 || _463;
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _469 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _467;
    float _471 = fma(_427, _397, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _475 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _473;
    if (_323)
    {
        _449 = _455;
    }
    float _477 = _449;
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _481 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _479;
    int _483 = _465 ? 0 : 1;
    float _485 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _487 = _485 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    bool _489 = _429 > 0.0;
    float _491 = fma(_481, _359, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _493 = _429 >= 0.0;
    bool _495 = isnan(_429);
    bool _497 = _493 || _495;
    bool _499 = isnan(0.0);
    bool _501 = _497 || _499;
    float _503 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _505 = _503 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _507 = (*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _509 = _477;
    if (!_333)
    {
        float _511 = in.m_67.y;
        _507 = _511;
    }
    float _513 = _507;
    float _515 = fma(_447, _397, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _517 = fma(_505, _397, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _519 = fma(_475, _395, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _521 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _523 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _521;
    float _525 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _527 = _525 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _529 = fma(_469, _395, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _531 = fma(_487, _419, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _533 = fma(_523, _395, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _535 = fma(_527, _419, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    bool _537 = _207 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _539 = isnan(_207);
    bool _541 = _537 || _539;
    bool _543 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _545 = _541 || _543;
    float _547 = float(_545);
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _551 = _549 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    bool _553 = _207 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _555 = isnan(_207);
    bool _557 = _553 || _555;
    bool _559 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _561 = _557 || _559;
    float _563 = float(_561);
    float _565 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _567 = _207 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _569 = isnan(_207);
    bool _571 = _567 || _569;
    bool _573 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _575 = _571 || _573;
    float _577 = float(_575);
    float _579 = fma(_551, _419, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    bool _581 = _207 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _583 = isnan(_207);
    bool _585 = _581 || _583;
    bool _587 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _589 = _585 || _587;
    float _591 = float(_589);
    float _593 = -_563;
    float _595 = _593 + 1.0;
    bool _597 = _207 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _599 = isnan(_207);
    bool _601 = _597 || _599;
    bool _603 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _605 = _601 || _603;
    float _607 = float(_605);
    bool _609 = _207 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _611 = isnan(_207);
    bool _613 = _609 || _611;
    bool _615 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _617 = _613 || _615;
    float _619 = float(_617);
    float _621 = _577 * _595;
    float _623 = -_577;
    float _625 = _623 + 1.0;
    bool _627 = _413 > 0.0;
    float _629 = -_547;
    float _631 = _629 + 1.0;
    if (!_333)
    {
        _363 = _513;
    }
    float _633 = _363;
    float _635 = _619 * _625;
    float _637 = -_619;
    float _639 = _637 + 1.0;
    float _641 = -_607;
    float _643 = _641 + 1.0;
    float _645 = _633;
    float _647 = _513;
    if (_333)
    {
        float _649 = in.m_67.x;
        float _651 = in.m_67.y;
        _645 = _649;
        _647 = _651;
    }
    float _653 = _645;
    float _655 = _647;
    float _657 = _563 * _631;
    float _659 = _607 * _639;
    float _661 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _663 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _661;
    float _665 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _667 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _665;
    float _669 = _591 * _643;
    float _671 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _673 = log2(_671);
    float _675 = fma(_663, _431, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _677 = fma(_667, _431, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _679 = _491 * _669;
    float _681 = _409 * _669;
    float _683 = _423 * _669;
    float _685 = _565 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _687 = -_591;
    float _689 = _687 + 1.0;
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _693 = fma(_685, _477, -0.5);
    float _695 = fma(_689, (*spvDescriptorSet0.vp_c9)._m0[143].x, _679);
    float _697 = fma(_689, (*spvDescriptorSet0.vp_c9)._m0[143].y, _681);
    if (!_333)
    {
        _509 = _301;
    }
    float _699 = _509;
    float _701 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _703 = fma(_653, (*spvDescriptorSet0.vp_c9)._m0[83].z, _691);
    float _705 = _653 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _707 = _653;
    float _709 = _699;
    if (!_333)
    {
        _707 = _301;
    }
    float _711 = _707;
    float _713 = _673 * _155;
    float _715 = _711;
    if (_333)
    {
        _715 = _655;
    }
    float _717 = _715;
    float _719 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    if (_333)
    {
        _709 = _655;
    }
    float _721 = _709;
    float _723 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _725 = fma(_717, (*spvDescriptorSet0.vp_c9)._m0[83].w, _701);
    float _727 = -_719;
    float _729 = fma(_705, 2.0, _727);
    float _731 = _721 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _733 = _501 ? 0 : 1;
    float _735 = exp2(_713);
    float _737 = fma(_517, _659, _695);
    float _739 = fma(_731, -2.0, _723);
    float _741 = _301 + _655;
    float _743 = _217 + _655;
    float _745 = fma(_689, (*spvDescriptorSet0.vp_c9)._m0[143].z, _683);
    float _747 = _655 * 2.0;
    int _749 = ~_483;
    int _751 = _749 + 1;
    int _753 = _751 + 1;
    float _755 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _757 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _755;
    int _759 = ~_733;
    int _761 = _759 + 1;
    int _763 = _761 + 1;
    float _765 = _741 + (-1.0);
    int _767 = _753;
    int _769 = _763;
    if (!_627)
    {
        int _771 = ~_483;
        int _773 = _771 + 1;
        _767 = _773;
    }
    int _775 = _767;
    float _777 = _743 + (-1.0);
    if (!_489)
    {
        int _779 = ~_733;
        int _781 = _779 + 1;
        _769 = _781;
    }
    int _783 = _769;
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _787 = 1.0 + _785;
    float _789 = floor(_747);
    bool _791 = !_349;
    int _793 = _791 ? 0 : 1;
    float _795 = fma(_757, _431, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _797 = fma(_765, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _799 = abs(_793);
    float _801 = -_735;
    float _803 = _801 + 1.0;
    bool _805 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _807 = isnan(1.0);
    bool _809 = _805 || _807;
    bool _811 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _813 = _809 || _811;
    float _815 = 1.0 / _787;
    float _817 = fma(_777, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _819 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _821 = isnan(0.0);
    bool _823 = _819 || _821;
    bool _825 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _827 = _823 || _825;
    float _829 = in.m_71.x;
    float _831 = in.m_71.y;
    float _833 = in.m_71.z;
    float _835 = float(_799);
    float _837 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[82].z, _703);
    float _839 = float(_775);
    float _841 = _217 + (-0.5);
    bool _843 = !_353;
    int _845 = _843 ? 0 : 1;
    float _847 = -_155;
    float _849 = fma(_847, (*spvDescriptorSet0.vp_c9)._m0[81].x, _729);
    float _851 = _827 ? _803 : 0.0;
    float _853 = _835 * _839;
    bool _855 = _789 > 0.0;
    float _857 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[81].y, _739);
    bool _859 = _789 >= 0.0;
    bool _861 = isnan(_789);
    bool _863 = _859 || _861;
    bool _865 = isnan(0.0);
    bool _867 = _863 || _865;
    float _869 = fma(_515, _659, _745);
    int _871 = abs(_845);
    float _873 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[82].w, _725);
    float _875 = _797;
    if (_813)
    {
        float _877 = _851 * _815;
        _157 = _877;
    }
    float _879 = _157;
    float _881 = _853 * (-2.0);
    float _883 = float(_871);
    float _885 = fma(_519, _635, _737);
    float _887 = float(_783);
    float _889 = -_857;
    float _891 = fma(_873, _439, _889);
    int _893 = _867 ? 0 : 1;
    float _895 = fma(_531, _621, _885);
    bool _897 = !_357;
    int _899 = _897 ? 0 : 1;
    float _901 = _883 * _887;
    float _903 = fma(_881, _829, _829);
    int _905 = ~_893;
    int _907 = _905 + 1;
    int _909 = _907 + 1;
    float _911 = fma(_817, _881, _817);
    float _913 = _901 * (-2.0);
    int _915 = abs(_899);
    float _917 = fma(_841, (*spvDescriptorSet0.vp_c9)._m0[196].x, _903);
    int _919 = _909;
    float _921 = _891;
    if (!_855)
    {
        int _923 = ~_893;
        int _925 = _923 + 1;
        _919 = _925;
    }
    int _927 = _919;
    float _929 = fma(_913, _831, _831);
    float _931 = float(_915);
    float _933 = _655 + (-0.5);
    float _935 = float(_927);
    float _937 = fma(_471, _659, _697);
    float _939 = fma(_797, _913, _797);
    float _941 = fma(_933, (*spvDescriptorSet0.vp_c9)._m0[196].y, _929);
    float _943 = fma(_911, _879, _917);
    float _945 = _931 * _935;
    float _947 = fma(_533, _635, _937);
    float _949 = _301 + (-0.5);
    float _951 = fma(_939, _879, _941);
    float _953 = _945 * (-2.0);
    float _955 = _943 * 0.15915493667125701904296875;
    float _957 = fma(_535, _621, _947);
    float _959 = _951 * 0.15915493667125701904296875;
    float _961 = fma(_953, _833, _833);
    float _963 = fma(_417, _953, _417);
    float _965 = fma(_529, _635, _869);
    float _967 = _955 * 6.283185482025146484375;
    float _969 = sin(_967);
    float _971 = fma(_949, (*spvDescriptorSet0.vp_c9)._m0[196].z, _961);
    float _973 = fma(_579, _621, _965);
    float _975 = fma(_963, _879, _971);
    float _977 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _979 = _959 * 6.283185482025146484375;
    float _981 = sin(_979);
    float _983 = _975 * 0.15915493667125701904296875;
    float _985 = in.m_73.x;
    float _987 = in.m_73.y;
    float _989 = in.m_73.z;
    float _991 = in.m_73.w;
    float _993 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _995 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _997 = fma(_837, _693, _849);
    float _999 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1001 = _955 * 6.283185482025146484375;
    float _1003 = cos(_1001);
    float _1005 = _993 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1007 = _977 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1009 = _995 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1011 = fma(_675, _657, _895);
    float _1013 = fma(_795, _657, _973);
    float _1015 = fma(_677, _657, _957);
    float _1017 = _997 + 0.5;
    float _1019 = _959 * 6.283185482025146484375;
    float _1021 = cos(_1019);
    float _1023 = _969 * _981;
    float _1025 = fma(_547, (*spvDescriptorSet0.vp_c9)._m0[148].z, _1013);
    out.m_75.x = _1005;
    out.m_75.y = _1007;
    out.m_75.z = _1009;
    out.m_75.w = _999;
    float _1027 = fma(_547, (*spvDescriptorSet0.vp_c9)._m0[148].x, _1011);
    float _1029 = fma(_547, (*spvDescriptorSet0.vp_c9)._m0[148].y, _1015);
    float _1031 = _891 + 0.5;
    float _1033 = _983 * 6.283185482025146484375;
    float _1035 = cos(_1033);
    out.m_77.z = _1017;
    out.m_77.w = _1031;
    float _1037 = _983 * 6.283185482025146484375;
    float _1039 = sin(_1037);
    float _1041 = _1003 * _1021;
    float _1043 = _1003 * _981;
    float _1045 = _1003 * _1035;
    float _1047 = _981 * _1035;
    float _1049 = _1021 * _1035;
    float _1051 = _969 * _1035;
    float _1053 = _1045 * _987;
    float _1055 = fma(_1039, _1041, _1023);
    float _1057 = fma(_1039, _1023, _1041);
    float _1059 = _969 * _1021;
    float _1061 = in.m_79.x;
    float _1063 = in.m_79.y;
    float _1065 = in.m_79.z;
    float _1067 = -_987;
    float _1069 = _1039 * _1067;
    float _1071 = fma(_1055, _985, _1053);
    float _1073 = -_1059;
    float _1075 = fma(_1039, _1043, _1073);
    float _1077 = -_1043;
    float _1079 = fma(_1039, _1059, _1077);
    float _1081 = floor(_243);
    float _1083 = fma(_1049, _985, _1069);
    float _1085 = fma(_1075, _989, _1071);
    float _1087 = _1051 * _987;
    float _1089 = in.m_60.x;
    float _1091 = in.m_60.y;
    float _1093 = in.m_60.z;
    float _1095 = fma(_1047, _989, _1083);
    float _1097 = _1085 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1099 = fma(_1079, _985, _1087);
    float _1101 = _1085 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1103 = _1085 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1105 = fma(_1095, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1097);
    float _1107 = fma(_1057, _989, _1099);
    float _1109 = fma(_1095, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1101);
    float _1111 = fma(_1095, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1103);
    float _1113 = fma(_1107, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1105);
    float _1115 = fma(_1107, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1109);
    float _1117 = -_1081;
    float _1119 = _243 + _1117;
    float _1121 = -_275;
    float _1123 = _1121 + _295;
    float _1125 = _1027 * _1061;
    float _1127 = -_277;
    float _1129 = _1127 + _297;
    float _1131 = _1029 * _1063;
    float _1133 = -_279;
    float _1135 = _1133 + _299;
    float _1137 = fma(_1119, _1129, _277);
    float _1139 = fma(_1119, _1123, _275);
    float _1141 = fma(_1107, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1111);
    float _1143 = in.m_81.x;
    float _1145 = in.m_81.y;
    float _1147 = in.m_81.z;
    float _1149 = fma(_1119, _1135, _279);
    bool _1151 = _1137 != 0.0;
    bool _1153 = isnan(_1137);
    bool _1155 = _1151 || _1153;
    bool _1157 = isnan(0.0);
    bool _1159 = _1155 || _1157;
    float _1161 = _1091 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    out.m_83.x = 1.0;
    out.m_83.y = 1.0;
    out.m_83.z = 1.0;
    float _1163 = _1025 * _1065;
    bool _1165 = _1139 == 0.0;
    bool _1167 = !_1159;
    bool _1169 = _1165 && _1167;
    float _1171 = fma(_1089, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1161);
    out.m_85.x = _1113;
    out.m_85.y = _1115;
    out.m_85.z = _1141;
    bool _1173 = _1149 == 0.0;
    bool _1175 = _1173 && _1169;
    float _1177 = _1091 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1179 = _1091 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1181 = _1131 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1183 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1137);
    float _1185 = fma(_1089, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1177);
    float _1187 = fma(_1089, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1179);
    float _1189 = fma(_1093, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1171);
    float _1191 = _1183 * _1181;
    float _1193 = _1125 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1195 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1139);
    float _1197 = _1163 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1199 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1149);
    float _1201 = _1045 * _1191;
    float _1203 = _1195 * _1193;
    float _1205 = fma(_1093, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1185);
    float _1207 = fma(_1093, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1187);
    float _1209 = -_1191;
    float _1211 = _1039 * _1209;
    float _1213 = _1051 * _1191;
    float _1215 = _1199 * _1197;
    float _1217 = fma(_1055, _1203, _1201);
    float _1219 = _1211;
    float _1221 = _1081;
    float _1223 = _1217;
    float _1225 = _1149;
    float _1227 = _1111;
    if (_1175)
    {
        _921 = _1143;
    }
    float _1229 = _921;
    float _1231 = fma(_1049, _1203, _1211);
    float _1233 = fma(_1079, _1203, _1213);
    float _1235 = fma(_1075, _1215, _1217);
    float _1237 = _1229;
    float _1239 = _1235;
    if (_1175)
    {
        _1219 = _1229;
    }
    float _1241 = _1219;
    float _1243 = _1205 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1245 = _1241;
    if (!_1175)
    {
        _1237 = _1143;
    }
    float _1247 = _1237;
    float _1249 = fma(_1047, _1215, _1231);
    float _1251 = _1235 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1253 = _1235 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1255 = fma(_1057, _1215, _1233);
    float _1257 = _1207 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1259 = fma(_1249, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1251);
    float _1261 = fma(_1249, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1253);
    float _1263 = _1251;
    if (_1175)
    {
        _1221 = _1145;
    }
    float _1265 = _1221;
    float _1267 = _1265;
    if (!_1175)
    {
        float _1269 = fma(_1139, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1247);
        _1245 = _1269;
    }
    float _1271 = _1245;
    float _1273 = fma(_1255, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1259);
    float _1275 = fma(_1255, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1261);
    if (_1175)
    {
        _875 = _1147;
    }
    float _1277 = _875;
    float _1279 = _989 * _1247;
    float _1281 = _1243 + _1273;
    float _1283 = _1257 + _1275;
    float _1285 = _1277;
    float _1287 = _1281;
    float _1289 = _1283;
    if (_1175)
    {
        _1263 = _1265;
    }
    float _1291 = _1263;
    float _1293 = _1291;
    if (!_1175)
    {
        _1267 = _1145;
    }
    float _1295 = _1267;
    float _1297 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1299 = _1281 + _1297;
    if (_1175)
    {
        _1223 = _1277;
    }
    float _1301 = _1223;
    float _1303 = _1301;
    if (!_1175)
    {
        _1285 = _1147;
    }
    float _1305 = _1285;
    float _1307 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1309 = _1283 + _1307;
    if (!_1175)
    {
        float _1311 = fma(_1137, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1295);
        _1293 = _1311;
    }
    float _1313 = _1293;
    float _1315 = _1299 * _1299;
    float _1317 = _985 * _1295;
    float _1319 = _1309 * _1309;
    float _1321 = _987 * _1305;
    float _1323 = _1315;
    float _1325 = _1319;
    if (!_1175)
    {
        float _1327 = fma(_1149, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1305);
        _1303 = _1327;
    }
    float _1329 = _1303;
    float _1331 = -_1317;
    float _1333 = fma(_987, _1247, _1331);
    float _1335 = _1315 + _1319;
    float _1337 = -_1321;
    float _1339 = fma(_989, _1295, _1337);
    float _1341 = -_1279;
    float _1343 = fma(_985, _1305, _1341);
    float _1345 = _1333 * _991;
    float _1347 = sqrt(_1335);
    float _1349 = _1339 * _991;
    float _1351 = _1343 * _991;
    float _1353 = _1045 * _1313;
    float _1355 = _1051 * _1313;
    float _1357 = -_1313;
    float _1359 = _1039 * _1357;
    float _1361 = -_1351;
    float _1363 = _1039 * _1361;
    float _1365 = _1045 * _1351;
    float _1367 = _1051 * _1351;
    float _1369 = _1235 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1371 = fma(_1079, _1271, _1355);
    float _1373 = fma(_1049, _1271, _1359);
    float _1375 = fma(_1079, _1349, _1367);
    float _1377 = fma(_1249, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1369);
    float _1379 = fma(_1055, _1271, _1353);
    float _1381 = fma(_1049, _1349, _1363);
    bool _1383 = _1347 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1385 = fma(_1255, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1377);
    float _1387 = _1189 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1389 = fma(_1055, _1349, _1365);
    float _1391 = fma(_1057, _1329, _1371);
    float _1393 = fma(_1057, _1345, _1375);
    float _1395 = _1387 + _1385;
    float _1397 = fma(_1047, _1329, _1373);
    float _1399 = fma(_1075, _1329, _1379);
    float _1401 = fma(_1047, _1345, _1381);
    float _1403 = fma(_1075, _1345, _1389);
    if (!_1383)
    {
        _1225 = _1395;
    }
    float _1405 = _1225;
    bool _1407 = !_1383;
    float _1409 = _1405;
    if (!_1407)
    {
        float _1411 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1413 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1415 = _1347 + _1413;
        float _1417 = rsqrt(_1335);
        float _1419 = _1415 * _1411;
        float _1421 = _1395 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1423 = _1419 * 0.15915493667125701904296875;
        float _1425 = _1423 * 6.283185482025146484375;
        float _1427 = sin(_1425);
        float _1429 = _1423 * 6.283185482025146484375;
        float _1431 = cos(_1429);
        float _1433 = fma(_1427, _1421, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1435 = _1417 * _1433;
        float _1437 = fma(_1299, _1435, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1439 = _1431 + (-1.0);
        float _1441 = fma(_1309, _1435, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1443 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1445 = _1437 + _1443;
        float _1447 = _1439 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1449 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1451 = _1441 + _1449;
        float _1453 = _1445 * _1445;
        float _1455 = fma(_1395, _1431, _1447);
        float _1457 = _1451 * _1451;
        _1409 = _1455;
        _1323 = _1453;
        _1325 = _1457;
        _1287 = _1437;
        _1289 = _1441;
    }
    float _1459 = _1409;
    float _1461 = _1323;
    float _1463 = _1325;
    float _1465 = _1287;
    float _1467 = _1289;
    float _1469 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1471 = _1459 + _1469;
    float _1473 = _1403 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1475 = _1403 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1477 = _1403 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1479 = fma(_1471, _1471, _1461);
    float _1481 = fma(_1401, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1473);
    float _1483 = fma(_1401, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1475);
    float _1485 = fma(_1401, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1477);
    float _1487 = _1479 + _1463;
    float _1489 = _1399 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1491 = _1399 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1493 = _1399 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1495 = fma(_1397, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1489);
    float _1497 = sqrt(_1487);
    float _1499 = fma(_1397, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1491);
    float _1501 = fma(_1397, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1493);
    float _1503 = fma(_1393, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1481);
    float _1505 = fma(_1391, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1495);
    float _1507 = fma(_1391, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1499);
    float _1509 = fma(_1393, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1483);
    float _1511 = fma(_1393, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1485);
    float _1513 = fma(_1391, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1501);
    out.m_87.x = _1503;
    out.m_87.y = _1509;
    out.m_87.z = _1511;
    out.m_89.x = _1505;
    out.m_89.y = _1507;
    out.m_89.z = _1513;
    bool _1515 = _1497 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1517 = isnan(_1497);
    bool _1519 = _1515 || _1517;
    bool _1521 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1523 = _1519 || _1521;
    if (!_1523)
    {
        _1239 = 1.0;
    }
    float _1525 = _1239;
    bool _1527 = !_1523;
    float _1529 = _1525;
    if (!_1527)
    {
        bool _1531 = _1497 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1533 = isnan(_1497);
        bool _1535 = _1531 || _1533;
        bool _1537 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1539 = _1535 || _1537;
        if (!_1539)
        {
            float _1541 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1543 = _1497 + _1541;
            float _1545 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1547 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1545;
            float _1549 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1551 = _1549 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1553 = 1.0 / _1547;
            float _1555 = _1543 * _1553;
            float _1557 = fma(_1555, _1551, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1529 = _1557;
            _1559 = true;
        }
        else
        {
            bool _1561 = _1497 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1563 = isnan(_1497);
            bool _1565 = _1561 || _1563;
            bool _1567 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1569 = _1565 || _1567;
            if (!_1569)
            {
                float _1571 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1573 = _1497 + _1571;
                float _1575 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1577 = _1575 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1579 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1581 = _1579 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1583 = 1.0 / _1577;
                float _1585 = _1573 * _1583;
                float _1587 = fma(_1585, _1581, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1529 = _1587;
                _1559 = true;
            }
            else
            {
                _1529 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1559 = false;
    float _1589 = _1529;
    float _1591 = fma(_1243, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1593 = fma(_1257, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1595 = floor(_1591);
    float _1597 = floor(_1593);
    float _1599 = -_1595;
    float _1601 = _1591 + _1599;
    float _1603 = -_1597;
    float _1605 = _1593 + _1603;
    float2 _5427 = float2(_1601, _1605);
    float _1607 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5427, float2(0.0), isnan(_5427)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5427, float2(0.0), isnan(_5427)), level(0.0)).x;
    float _1609 = _1387 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1611 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1613 = _1459 + _1611;
    float _1615 = fma(_1243, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1609);
    float _1617 = fma(_1613, _1589, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1619 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1615);
    float _1621 = _1387 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1623 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1625 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1627 = _1623 || _1625;
    bool _1629 = isnan(0.5);
    bool _1631 = _1627 || _1629;
    float _1633 = _1619 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1635 = fma(_1243, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1621);
    float _1637 = 1.0 / _1633;
    float _1639 = fma(_1257, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1635);
    float _1641 = _1639 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1643 = _1641 + _1633;
    float _1645 = _1643 * _1637;
    float _1647 = _1645 * 0.5;
    float _1649 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1651 = fma(_1647, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1649);
    float _1653 = 1.0 / _1651;
    float _1655 = (*spvDescriptorSet0.vp_c13)._m0[1].y + 1.0;
    float _1657 = _1387 + _1655;
    float _1659 = _1657 * (*spvDescriptorSet0.vp_c15)._m0[126].y;
    float _1661 = fma(_1243, (*spvDescriptorSet0.vp_c15)._m0[126].x, _1659);
    float _1663 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1665 = _1653 * _1663;
    float _1667 = _1657 * (*spvDescriptorSet0.vp_c15)._m0[127].y;
    float _1669 = fma(_1257, (*spvDescriptorSet0.vp_c15)._m0[126].z, _1661);
    bool _1671 = _1665 > (*spvDescriptorSet0.vp_c15)._m0[15].y;
    float _1673 = fma(_1243, (*spvDescriptorSet0.vp_c15)._m0[127].x, _1667);
    bool _1675 = _1665 > (*spvDescriptorSet0.vp_c15)._m0[15].x;
    float _1677 = _1669 + (*spvDescriptorSet0.vp_c15)._m0[126].w;
    bool _1679 = !_1671;
    int _1681 = _1679 ? 0 : 1;
    float _1683 = fma(_1257, (*spvDescriptorSet0.vp_c15)._m0[127].z, _1673);
    float _1685 = trunc(_1677);
    int _1687 = int(_1685);
    float _1689 = _1683 + (*spvDescriptorSet0.vp_c15)._m0[127].w;
    int _1691 = 2;
    float _1693 = _1613;
    float _1695 = _1589;
    float _1697 = _1617;
    if (!_1671)
    {
        _1691 = 1;
    }
    int _1699 = _1691;
    int _1701 = _1699;
    if (!_1675)
    {
        _1701 = _1681;
    }
    int _1703 = _1701;
    float _1705 = trunc(_1689);
    int _1707 = int(_1705);
    int _1709 = _1703 << 6;
    int _1711 = _1709 + 48;
    uint _1714 = uint(int(uint(_1711) >> uint(2)));
    uint _1716 = uint(int(uint(int(_1714)) >> uint(2)));
    int _1718 = int(_1714) & 3;
    float _1720 = (*spvDescriptorSet0.vp_c15)._m0[int(_1716)][_1718];
    int _1722 = int(_1714) + 1;
    uint _1724 = uint(int(uint(_1722) >> uint(2)));
    int _1726 = _1722 & 3;
    float _1728 = (*spvDescriptorSet0.vp_c15)._m0[int(_1724)][_1726];
    int _1730 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].y);
    int _1732 = _1687 + _1730;
    int _1734 = _1732 + 1;
    bool _1736 = _1734 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    int _1738 = _1709 + 56;
    uint _1740 = uint(int(uint(_1738) >> uint(2)));
    uint _1742 = uint(int(uint(int(_1740)) >> uint(2)));
    int _1744 = int(_1740) & 3;
    float _1746 = (*spvDescriptorSet0.vp_c15)._m0[int(_1742)][_1744];
    int _1748 = int(_1740) + 1;
    uint _1750 = uint(int(uint(_1748) >> uint(2)));
    int _1752 = _1748 & 3;
    float _1754 = (*spvDescriptorSet0.vp_c15)._m0[int(_1750)][_1752];
    int _1756 = ~as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].z);
    int _1758 = _1707 + _1756;
    int _1760 = _1758 + 1;
    float _1762 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1764 = _1465 + _1762;
    int _1766 = _1734 | _1760;
    float _1768 = fma(_1764, _1589, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    int _1770 = _1709 + 64;
    uint _1772 = uint(int(uint(_1770) >> uint(2)));
    uint _1774 = uint(int(uint(int(_1772)) >> uint(2)));
    int _1776 = int(_1772) & 3;
    float _1778 = (*spvDescriptorSet0.vp_c15)._m0[int(_1774)][_1776];
    int _1780 = int(_1772) + 1;
    uint _1782 = uint(int(uint(_1780) >> uint(2)));
    int _1784 = _1780 & 3;
    float _1786 = (*spvDescriptorSet0.vp_c15)._m0[int(_1782)][_1784];
    bool _1788 = _1766 < 0;
    bool _1790 = _1788 || _1736;
    float _1792 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1794 = _1467 + _1792;
    float _1796 = _1764;
    int _1798 = _1734;
    float _1800 = as_type<float>(_1760);
    if (_1631)
    {
        _1693 = _1768;
    }
    float _1802 = _1693;
    bool _1804 = _1760 >= as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
    bool _1806 = _1804 || _1790;
    float _1808 = fma(_1794, _1589, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1810 = _1802;
    if (_1631)
    {
        _1695 = _1617;
    }
    float _1812 = _1695;
    int _1814 = _1709 + 72;
    uint _1816 = uint(int(uint(_1814) >> uint(2)));
    uint _1818 = uint(int(uint(int(_1816)) >> uint(2)));
    int _1820 = int(_1816) & 3;
    float _1822 = (*spvDescriptorSet0.vp_c15)._m0[int(_1818)][_1820];
    int _1824 = int(_1816) + 1;
    uint _1826 = uint(int(uint(_1824) >> uint(2)));
    int _1828 = _1824 & 3;
    float _1830 = (*spvDescriptorSet0.vp_c15)._m0[int(_1826)][_1828];
    float _1832 = _1812;
    if (_1631)
    {
        _1796 = _1808;
    }
    float _1834 = _1796;
    int _1836 = _1709 + 96;
    uint _1838 = uint(int(uint(_1836) >> uint(2)));
    uint _1840 = uint(int(uint(int(_1838)) >> uint(2)));
    int _1842 = int(_1838) & 3;
    float _1844 = (*spvDescriptorSet0.vp_c15)._m0[int(_1840)][_1842];
    int _1846 = int(_1838) + 1;
    uint _1848 = uint(int(uint(_1846) >> uint(2)));
    int _1850 = _1846 & 3;
    float _1852 = (*spvDescriptorSet0.vp_c15)._m0[int(_1848)][_1850];
    int _1854 = _1709 + 104;
    uint _1856 = uint(int(uint(_1854) >> uint(2)));
    uint _1858 = uint(int(uint(int(_1856)) >> uint(2)));
    int _1860 = int(_1856) & 3;
    float _1862 = (*spvDescriptorSet0.vp_c15)._m0[int(_1858)][_1860];
    int _1864 = int(_1856) + 1;
    uint _1866 = uint(int(uint(_1864) >> uint(2)));
    int _1868 = _1864 & 3;
    float _1870 = (*spvDescriptorSet0.vp_c15)._m0[int(_1866)][_1868];
    float _1872 = _1834;
    int _1874 = as_type<int>(_1852);
    if (!_1631)
    {
        float _1876 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1878 = _1387 + _1876;
        float _1880 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1882 = _1243 + _1880;
        float _1884 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1886 = _1878 * _1878;
        float _1888 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1890 = _1257 + _1888;
        float _1892 = fma(_1882, _1882, _1886);
        float _1894 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1896 = fma(_1890, _1890, _1892);
        float _1898 = sqrt(_1896);
        float _1900 = _1884 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1902 = -_1257;
        float _1904 = _1902 + _1808;
        float _1906 = precise::min(_1898, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1908 = _1906 * _1894;
        float _1910 = -_1387;
        float _1912 = _1910 + _1617;
        float _1914 = -_1243;
        float _1916 = _1914 + _1768;
        float _1918 = _1900 * _1908;
        float _1920 = fma(_1912, _1918, _1387);
        float _1922 = fma(_1916, _1918, _1243);
        float _1924 = fma(_1904, _1918, _1257);
        _1832 = _1920;
        _1810 = _1922;
        _1872 = _1924;
    }
    float _1926 = _1832;
    float _1928 = _1810;
    float _1930 = _1872;
    float _1932 = _1657 * _1852;
    float _1934 = _1926 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1936 = _1657 * _1786;
    if (!_1806)
    {
        int _1938 = _1760 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[125].x);
        int _1940 = _1938 + _1734;
        _1798 = _1940;
    }
    int _1942 = _1798;
    float _1944 = fma(_1243, _1844, _1932);
    float _1946 = fma(_1928, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1934);
    float _1948 = _1657 * _1728;
    if (!_1806)
    {
        float _1950 = floor(_1677);
        _1800 = _1950;
    }
    float _1952 = _1800;
    float _1954 = fma(_1257, _1862, _1944);
    float _1956 = fma(_1930, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1946);
    float _1958 = fma(_1243, _1720, _1948);
    float _1960 = fma(_1243, _1778, _1936);
    float _1962 = _1954 + _1870;
    float _1964 = _1956 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    int _1966 = _1709 + 80;
    uint _1968 = uint(int(uint(_1966) >> uint(2)));
    uint _1970 = uint(int(uint(int(_1968)) >> uint(2)));
    int _1972 = int(_1968) & 3;
    float _1974 = (*spvDescriptorSet0.vp_c15)._m0[int(_1970)][_1972];
    int _1976 = int(_1968) + 1;
    uint _1978 = uint(int(uint(_1976) >> uint(2)));
    int _1980 = _1976 & 3;
    float _1982 = (*spvDescriptorSet0.vp_c15)._m0[int(_1978)][_1980];
    int _1984 = as_type<int>(_1956);
    if (!_1806)
    {
        int _1986 = _1942 << 2;
        _1874 = _1986;
    }
    int _1988 = _1874;
    float _1990 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1992 = _1964 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1994 = 1.0 / _1962;
    int _1996 = _1988;
    float _1998 = _1990;
    if (!_1806)
    {
        uint _2000 = uint(int(uint(_1942) >> uint(2)));
        _1984 = int(_2000);
    }
    int _2002 = _1984;
    float _2004 = fma(_1257, _1746, _1958);
    if (!_1806)
    {
        int _2006 = 12 & _1988;
        _1996 = _2006;
    }
    int _2008 = _1996;
    int _2010 = _1709 + 88;
    uint _2012 = uint(int(uint(_2010) >> uint(2)));
    uint _2014 = uint(int(uint(int(_2012)) >> uint(2)));
    int _2016 = int(_2012) & 3;
    float _2018 = (*spvDescriptorSet0.vp_c15)._m0[int(_2014)][_2016];
    int _2020 = int(_2012) + 1;
    uint _2022 = uint(int(uint(_2020) >> uint(2)));
    int _2024 = _2020 & 3;
    float _2026 = (*spvDescriptorSet0.vp_c15)._m0[int(_2022)][_2024];
    float _2028 = -_1992;
    float _2030 = fma(_2028, _1990, 1.0);
    float _2032 = fma(_1257, _1822, _1960);
    if (!_1806)
    {
        int _2034 = _2002 << 4;
        int _2036 = _2034 + _2008;
        _1998 = as_type<float>(_2036);
    }
    float _2038 = _1998;
    float _2040 = _1926 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2042 = _2004 + _1754;
    float _2044 = _1926 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2046 = _1926 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2048 = fma(_1928, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2040);
    float _2050 = _2038;
    if (!_1806)
    {
        int _2052 = as_type<int>(_2038) + 400;
        uint _2054 = uint(int(uint(_2052) >> uint(2)));
        uint _2056 = uint(int(uint(int(_2054)) >> uint(2)));
        int _2058 = int(_2054) & 3;
        float _2060 = (*spvDescriptorSet0.vp_c15)._m0[int(_2056)][_2058];
        _2050 = _2060;
    }
    float _2062 = _2050;
    float _2064 = fma(_1928, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2044);
    float _2066 = _2032 + _1830;
    float _2068 = _2042 * _1994;
    float _2070 = fma(_1930, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2048);
    float _2072 = fma(_1930, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2064);
    float _2074 = fma(_1928, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2046);
    float _2076 = _2066 * _1994;
    float _2078 = _2070 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2080 = _2072 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    bool _2082 = _2068 >= 0.0;
    float _2084 = fma(_1930, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2074);
    float _2086 = _2078 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2088 = log2(_2030);
    bool _2090 = _2068 <= 1.0;
    bool _2092 = _2090 && _2082;
    float _2094 = _2078 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2096 = fma(_2080, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2086);
    if (!_1806)
    {
        float _2098 = -_1952;
        float _2100 = _1677 + _2098;
        _1227 = _2100;
    }
    float _2102 = _1227;
    bool _2104 = _2076 >= 0.0;
    bool _2106 = _2104 && _2092;
    float _2108 = fma(_2080, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2094);
    float _2110 = fma(_1964, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2096);
    float _2112 = as_type<float>(_1709);
    if (!_1806)
    {
        float _2114 = floor(_1689);
        _2112 = _2114;
    }
    float _2116 = _2112;
    float _2118 = _2084 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    bool _2120 = _2076 <= 1.0;
    bool _2122 = _2120 && _2106;
    float _2124 = fma(_1964, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2108);
    float _2126 = fma(_2118, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2110);
    float _2128 = _2078 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2130 = _2088 * 0.693147182464599609375;
    float _2132 = 1.0 / _2126;
    float _2134 = _1657 * _1982;
    float _2136 = fma(_2080, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2128);
    float _2138 = fma(_1243, _1974, _2134);
    float _2140 = fma(_1964, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2136);
    float _2142 = _1982;
    if (_2122)
    {
        float _2144 = float(_1703);
        _2142 = _2144;
    }
    float _2146 = _2142;
    float _2148 = _2146;
    if (!_1806)
    {
        float _2150 = -_2116;
        float _2152 = _1689 + _2150;
        _1697 = _2152;
    }
    float _2154 = _1697;
    float _2156 = fma(_1257, _2018, _2138);
    float _2158 = fma(_2118, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2140);
    float _2160 = fma(_2118, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2124);
    float _2162 = _2134;
    if (_2122)
    {
        float _2164 = rint(_2146);
        float _2166 = precise::max(_2164, 0.0);
        uint _2168 = uint(_2166);
        uint _2170 = clamp(_2168, 0u, 65535u);
        _2162 = as_type<float>(_2170);
    }
    float _2172 = _2162;
    float _2174 = _2156 + _2026;
    float _2176 = _2158 * _2132;
    float _2178 = _2160 * _2132;
    float _2180 = _2130 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2182 = _2174 * _1994;
    float _2184 = _2130;
    float _2186 = _2180;
    if (!_1806)
    {
        float _2188 = rint(_2062);
        float _2190 = precise::max(_2188, 0.0);
        uint _2192 = uint(_2190);
        uint _2194 = clamp(_2192, 0u, 65535u);
        _2184 = as_type<float>(_2194);
    }
    float _2196 = _2184;
    float _2198 = fma(_2176, 0.5, 0.5);
    float _2200 = fma(_2178, -0.5, 0.5);
    float _2202 = _2172;
    float _2204 = _2198;
    if (_2122)
    {
        float3 _6452 = float3(_2068, _2076, float(as_type<int>(_2172)));
        float3 _6456 = select(_6452, float3(0.0), isnan(_6452));
        float _2206 = spvDepthCast(spvDescriptorSet0.vp_t_tcb_16).sample_compare(spvDescriptorSet0.vp_t_tcb_16Smplr, _6456.xy, uint(rint(_6456.z)), _2182, level(0.0));
        _2202 = _2206;
    }
    float _2208 = _2202;
    float3 _6466 = float3(_2198, _2200, _2180);
    float _2210 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6466, float3(0.0), isnan(_6466)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6466, float3(0.0), isnan(_6466)), level(0.0)).x;
    float3 _6475 = float3(_2198, _2200, _2180);
    float4 _2213 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6475, float3(0.0), isnan(_6475)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6475, float3(0.0), isnan(_6475)), level(0.0)).xyzw;
    float _2215 = _2213.x;
    float _2217 = _2213.y;
    float _2219 = _2213.z;
    float _2221 = _2213.w;
    float _2223 = _2154;
    if (!_1806)
    {
        float3 _6498 = float3(_2102, _2154, float(as_type<int>(_2196)));
        float3 _6500 = select(_6498, float3(0.0), isnan(_6498));
        float _2225 = dm_bs(spvDescriptorSet0.vp_t_tcb_14.sample(spvDescriptorSet0.vp_t_tcb_14Smplr, _6500.xy, uint(rint(_6500.z)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_14, spvDescriptorSet0.vp_t_tcb_14Smplr_w, _6500.xy, uint(rint(_6500.z)), level(0.0)).x;
        _2223 = _2225;
    }
    float _2227 = _2223;
    if (_1806)
    {
        _2148 = 1.0;
    }
    float _2229 = _2148;
    float _2231 = _2229;
    if (!_1806)
    {
        int _2233 = _1942 << 4;
        int _2235 = _2233 + 2048;
        uint _2237 = uint(int(uint(_2235) >> uint(2)));
        uint _2239 = uint(int(uint(int(_2237)) >> uint(2)));
        int _2241 = int(_2237) & 3;
        float _2243 = (*spvDescriptorSet0.vp_c15)._m0[int(_2239)][_2241];
        int _2245 = int(_2237) + 1;
        uint _2247 = uint(int(uint(_2245) >> uint(2)));
        int _2249 = _2245 & 3;
        float _2251 = (*spvDescriptorSet0.vp_c15)._m0[int(_2247)][_2249];
        int _2253 = _2235 + 8;
        uint _2255 = uint(int(uint(_2253) >> uint(2)));
        uint _2257 = uint(int(uint(int(_2255)) >> uint(2)));
        int _2259 = int(_2255) & 3;
        float _2261 = (*spvDescriptorSet0.vp_c15)._m0[int(_2257)][_2259];
        int _2263 = int(_2255) + 1;
        uint _2265 = uint(int(uint(_2263) >> uint(2)));
        int _2267 = _2263 & 3;
        float _2269 = (*spvDescriptorSet0.vp_c15)._m0[int(_2265)][_2267];
        float _2271 = _1657 * _2251;
        float _2273 = fma(_1243, _2243, _2271);
        float _2275 = fma(_1257, _2261, _2273);
        float _2277 = _2275 + _2269;
        float _2279 = precise::clamp(_2277, 0.0, 1.0);
        float _2281 = -_2279;
        float _2283 = _2281 + _2227;
        float _2285 = fma(_2283, 500.0, 1.5);
        float _2287 = exp2(_2285);
        float _2289 = 0.0 + _2287;
        float _2291 = precise::clamp(_2289, 0.0, 1.0);
        _2204 = _2243;
        _2231 = _2291;
    }
    float _2293 = _2204;
    float _2295 = _2231;
    float _2297 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2299 = _1926 + _2297;
    float _2301 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2303 = _1928 + _2301;
    float _2305 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2307 = _1930 + _2305;
    float _2309 = _2299 * _2299;
    float _2311 = fma(_2303, _2303, _2309);
    float _2313 = fma(_2307, _2307, _2311);
    float _2315 = rsqrt(_2313);
    float _2317 = _2315 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2319 = _2303 * _2317;
    float _2321 = _2307 * _2317;
    float _2323 = _2319 * _2319;
    float _2325 = _2321 * _2321;
    float _2327 = _2323 + _2325;
    float _2329 = sqrt(_2327);
    bool _2331 = _2329 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2333 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2335 = _2329 + _2333;
    float _2337 = _2307;
    float _2339 = _2327;
    float _2341 = _2335;
    float _2343 = _2293;
    float _2345 = _2317;
    if (_2331)
    {
        float _2347 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2337 = _2347;
    }
    float _2349 = _2337;
    if (_2331)
    {
        float _2351 = rsqrt(_2327);
        _2339 = _2351;
    }
    float _2353 = _2339;
    if (_2331)
    {
        float _2355 = _2335 * _2349;
        _2341 = _2355;
    }
    float _2357 = _2341;
    if (_2331)
    {
        float _2359 = _2357 * 0.15915493667125701904296875;
        _2343 = _2359;
    }
    float _2361 = _2343;
    float _2363 = _2315;
    float _2365 = _2361;
    if (_2331)
    {
        float _2367 = _2361 * 6.283185482025146484375;
        float _2369 = sin(_2367);
        _2363 = _2369;
    }
    float _2371 = _2363;
    float _2373 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2375 = precise::max(0.0, _2373);
    float _2377 = _2311;
    float _2379 = _2375;
    float _2381 = _2373;
    if (_2331)
    {
        float _2383 = _2361 * 6.283185482025146484375;
        float _2385 = cos(_2383);
        _2377 = _2385;
    }
    float _2387 = _2377;
    float _2389 = -_2317;
    float _2391 = -_2375;
    float _2393 = fma(_2299, _2389, _2391);
    float _2395 = _2393;
    if (!_2331)
    {
        _2379 = _2321;
    }
    float _2397 = _2379;
    float _2399 = _2397;
    if (_2331)
    {
        float _2401 = _2393 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2381 = _2401;
    }
    float _2403 = _2381;
    float _2405 = _2403;
    if (!_2331)
    {
        _2365 = _2323;
    }
    float _2407 = _2365;
    float _2409 = _2371;
    float _2411 = _2407;
    if (_2331)
    {
        float _2413 = fma(_2371, _2403, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2409 = _2413;
    }
    float _2415 = _2409;
    float _2417 = _2415;
    float _2419 = _2387;
    if (_2331)
    {
        float _2421 = _2387 + (-1.0);
        _2405 = _2421;
    }
    float _2423 = _2405;
    if (_2331)
    {
        float _2425 = _2353 * _2415;
        _2186 = _2425;
    }
    float _2427 = _2186;
    if (!_2331)
    {
        _2417 = _2319;
    }
    float _2429 = _2417;
    float _2431 = _2429;
    if (_2331)
    {
        float _2433 = _2423 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2345 = _2433;
    }
    float _2435 = _2345;
    if (_2331)
    {
        float _2437 = _2319 * _2427;
        _2431 = _2437;
    }
    float _2439 = _2431;
    if (_2331)
    {
        float _2441 = _2321 * _2427;
        _2399 = _2441;
    }
    float _2443 = _2399;
    float _2445 = sqrt(_2313);
    if (_2331)
    {
        float _2447 = fma(_2393, _2387, _2435);
        _2395 = _2447;
    }
    float _2449 = _2395;
    if (_2331)
    {
        float _2451 = _2439 * _2439;
        _2411 = _2451;
    }
    float _2453 = _2411;
    if (!_2331)
    {
        _2419 = _2325;
    }
    float _2455 = _2419;
    float _2457 = _2455;
    if (_2331)
    {
        float _2459 = _2443 * _2443;
        _2457 = _2459;
    }
    float _2461 = _2457;
    float _2463 = fma(_2449, _2449, _2453);
    float _2465 = _2463 + _2461;
    float _2467 = rsqrt(_2465);
    float _2469 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2471 = fma(_2445, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2469);
    float _2473 = precise::clamp(_2471, 0.0, 1.0);
    float _2475 = -_2473;
    float _2477 = _2475 + 1.0;
    float _2479 = _2467 * _2449;
    float _2481 = _2467 * _2439;
    float _2483 = abs(_2477);
    float _2485 = log2(_2483);
    float _2487 = _2467 * _2443;
    float _2489 = _2481 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2491 = -_2489;
    float _2493 = fma(_2479, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2491);
    float _2495 = -_2487;
    float _2497 = fma(_2495, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2493);
    float _2499 = fma(_2497, -0.5, 0.5);
    float _2501 = _2485 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2503 = fma(_2497, 0.5, 0.5);
    float _2505 = sqrt(_2499);
    float _2507 = fma(_2503, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2509 = fma(_2503, _2507, -0.212114393711090087890625);
    float _2511 = _2479 + 1.0;
    float _2513 = exp2(_2501);
    float _2515 = fma(_2503, _2509, 1.570728778839111328125);
    float _2517 = _2505 * 0.636619746685028076171875;
    float _2519 = -_2515;
    float _2521 = fma(_2517, _2519, 1.0);
    float _2523 = -_2479;
    float _2525 = fma(_2513, _2511, _2523);
    float _2527 = fma(_2525, 0.5, 0.5);
    float2 _6968 = float2(_2521, _2527);
    float3 _2529 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6968, float2(0.0), isnan(_6968)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6968, float2(0.0), isnan(_6968)), level(0.0)).xyz;
    float _2531 = _2529.x;
    float _2533 = _2529.y;
    float _2535 = _2529.z;
    float _2537 = abs(_1665);
    float _2539 = log2(_2537);
    float _2541 = -_1607;
    float _2543 = _2541 + 1.0;
    bool _2545 = _1665 <= 8000.0;
    bool _2547 = isnan(_1665);
    bool _2549 = _2545 || _2547;
    bool _2551 = isnan(8000.0);
    bool _2553 = _2549 || _2551;
    float _2555 = float(_2553);
    float _2557 = _2539 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2559 = _2078 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2561 = fma(_2080, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2559);
    float _2563 = exp2(_2557);
    float _2565 = fma(_1964, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2561);
    float _2567 = _2485 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2569 = fma(_2118, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2565);
    float _2571 = fma(_2563, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2573 = precise::clamp(_2571, 0.0, 1.0);
    float _2575 = exp2(_2567);
    float _2577 = fma(_2573, -2.0, 3.0);
    float _2579 = _2573 * _2573;
    float _2581 = _2579 * _2577;
    float _2583 = -_2581;
    float _2585 = _2583 + 1.0;
    float _2587 = fma(_2585, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2581);
    float _2589 = _2569 + _2126;
    float _2591 = -_2575;
    float _2593 = _2591 + 1.0;
    float _2595 = _2555 * _2587;
    float _2597 = _2555;
    float _2599 = _2569;
    if (!_2122)
    {
        _2597 = 1.0;
    }
    float _2601 = _2597;
    float _2603 = _2589 * 0.5;
    float _2605 = _2601;
    if (_2122)
    {
        bool _2607 = _2208 >= _2182;
        bool _2609 = isnan(_2208);
        bool _2611 = _2607 || _2609;
        bool _2613 = isnan(_2182);
        bool _2615 = _2611 || _2613;
        float _2617 = float(_2615);
        _2605 = _2617;
    }
    float _2619 = _2605;
    float _2621 = _2595 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2623 = _2593 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _2158;
    out.gl_Position.y = _2160;
    out.gl_Position.z = _2569;
    out.gl_Position.w = _2126;
    bool _2625 = _2445 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2627 = isnan(_2445);
    bool _2629 = _2625 || _2627;
    bool _2631 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2633 = _2629 || _2631;
    float _2635 = _2543 * _2621;
    float _2637 = precise::clamp(_2635, 0.0, 1.0);
    float _2639 = _2619 * _2295;
    float _2641 = _2623 * _2210;
    out.m_91.z = _2603;
    out.m_91.w = _2126;
    float _2643 = -_2637;
    float _2645 = fma(_2643, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2647 = -_2639;
    float _2649 = fma(_2647, _2645, 1.0);
    float _2651 = precise::clamp(_2649, 0.0, 1.0);
    float _2653 = _2221 * _2641;
    float _2655 = -_2623;
    float _2657 = _2655 + 1.0;
    float _2659 = _2651 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2661 = _2657;
    float _2663 = _2651;
    float _2665 = _2623;
    float _2667 = _2653;
    if (!_2633)
    {
        _2599 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2669 = _2599;
    float _2671 = _2221 * _2657;
    float _2673 = _2669;
    float _2675 = _2669;
    if (!_2633)
    {
        _2661 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2677 = _2661;
    out.m_93.x = _2659;
    float _2679 = _2677;
    float _2681 = _2677;
    if (!_2633)
    {
        _2663 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2683 = _2663;
    float _2685 = _2683;
    float _2687 = _2683;
    if (!_2633)
    {
        _2665 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2689 = _2665;
    float _2691 = _2535 * _2641;
    float _2693 = fma(_2531, _2653, _2215);
    float _2695 = fma(_2533, _2653, _2217);
    float _2697 = _2691;
    float _2699 = _2689;
    float _2701 = _2689;
    if (!_2633)
    {
        _2667 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2703 = _2667;
    float _2705 = fma(_2221, _2691, _2219);
    float _2707 = _2703;
    float _2709 = _2703;
    if (!_2633)
    {
        _2697 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2711 = _2697;
    out.m_95.x = _2693;
    out.m_95.y = _2695;
    out.m_95.z = _2705;
    out.m_95.w = _2671;
    bool _2713 = !_2633;
    float _2715 = _2711;
    float _2717 = _2711;
    if (!_2713)
    {
        bool _2719 = _2445 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2721 = isnan(_2445);
        bool _2723 = _2719 || _2721;
        bool _2725 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2727 = _2723 || _2725;
        if (!_2727)
        {
            float _2729 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2731 = _2445 + _2729;
            float _2733 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2735 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2733;
            float _2737 = 1.0 / _2735;
            float _2739 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2741 = _2739 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2743 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2745 = _2743 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2747 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2749 = _2747 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2751 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2753 = _2751 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2755 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2757 = _2755 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2759 = _2731 * _2737;
            float _2761 = precise::clamp(_2759, 0.0, 1.0);
            float _2763 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2765 = _2763 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2767 = fma(_2761, _2741, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2769 = fma(_2761, _2765, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2771 = fma(_2761, _2745, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2773 = fma(_2761, _2749, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2775 = fma(_2761, _2753, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2777 = fma(_2761, _2757, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2717 = _2767;
            _2687 = _2775;
            _2709 = _2769;
            _2681 = _2773;
            _2675 = _2771;
            _2701 = _2777;
            _2779 = true;
        }
        else
        {
            bool _2781 = _2445 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2783 = isnan(_2445);
            bool _2785 = _2781 || _2783;
            bool _2787 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2789 = _2785 || _2787;
            if (!_2789)
            {
                _2707 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2791 = _2707;
            _2709 = _2791;
            if (!_2789)
            {
                _2715 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2793 = _2715;
            _2717 = _2793;
            if (!_2789)
            {
                _2673 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2795 = _2673;
            _2675 = _2795;
            if (!_2789)
            {
                _2679 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2797 = _2679;
            _2681 = _2797;
            if (!_2789)
            {
                _2685 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2799 = _2685;
            _2687 = _2799;
            if (!_2789)
            {
                _2699 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2801 = _2699;
            bool _2803 = !_2789;
            _2701 = _2801;
            if (!_2803)
            {
                bool _2805 = _2445 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2807 = isnan(_2445);
                bool _2809 = _2805 || _2807;
                bool _2811 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2813 = _2809 || _2811;
                if (!_2813)
                {
                    float _2815 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2817 = _2445 + _2815;
                    float _2819 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2821 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2819;
                    float _2823 = 1.0 / _2821;
                    float _2825 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2827 = _2825 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2829 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2831 = _2829 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2833 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2835 = _2833 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2837 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2839 = _2837 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2841 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2843 = _2841 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2845 = _2817 * _2823;
                    float _2847 = precise::clamp(_2845, 0.0, 1.0);
                    float _2849 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2851 = _2849 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2853 = fma(_2847, _2827, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2855 = fma(_2847, _2851, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2857 = fma(_2847, _2831, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2859 = fma(_2847, _2835, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2861 = fma(_2847, _2839, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2863 = fma(_2847, _2843, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2717 = _2853;
                    _2687 = _2861;
                    _2709 = _2855;
                    _2681 = _2859;
                    _2675 = _2857;
                    _2701 = _2863;
                    _2779 = true;
                }
                else
                {
                    _2717 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2687 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2709 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2681 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2675 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2701 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2779 = false;
    float _2865 = _2717;
    float _2867 = _2687;
    float _2869 = _2709;
    float _2871 = _2681;
    float _2873 = _2675;
    float _2875 = _2701;
    float _2877 = fma(_1507, -0.5, 0.5);
    float _2879 = precise::clamp(_2877, 0.0, 1.0);
    float _2881 = -_2865;
    float _2883 = _2881 + _2867;
    float _2885 = -_2869;
    float _2887 = _2885 + _2871;
    float _2889 = -_2873;
    float _2891 = _2889 + _2875;
    bool _2893 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2895 = fma(_2879, _2883, _2865);
    float _2897 = fma(_2879, _2887, _2869);
    float _2899 = fma(_2879, _2891, _2873);
    float _2901 = _2895 * 0.586610972881317138671875;
    out.m_63.x = 1.0;
    float _2903 = fma(_2897, 0.298911988735198974609375, _2901);
    float _2905 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2907 = fma(_2899, 0.114477999508380889892578125, _2903);
    out.m_93.w = _2905;
    float _2909 = -_2907;
    float _2911 = _2897 + _2909;
    float _2913 = -_2907;
    float _2915 = _2895 + _2913;
    float _2917 = -_2907;
    float _2919 = _2899 + _2917;
    out.m_97.x = 0.0;
    float _2921 = fma(_2911, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2907);
    float _2923 = fma(_2915, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2907);
    float _2925 = fma(_2919, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2907);
    out.m_99.x = _2921;
    out.m_99.y = _2923;
    out.m_99.z = _2925;
    if (!_2893)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2927 = -_1926;
    float _2929 = _2927 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2931 = -_1928;
    float _2933 = _2931 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2935 = -_1930;
    float _2937 = _2935 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2939 = _2929 * _2929;
    float _2941 = fma(_2933, _2933, _2939);
    float _2943 = fma(_2937, _2937, _2941);
    float _2945 = sqrt(_2943);
    float _2947 = rsqrt(_2943);
    float _2949 = -_2945;
    float _2951 = _2949 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2953 = _2951 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2955 = precise::clamp(_2953, 0.0, 1.0);
    float _2957 = _2933 * _2947;
    float _2959 = _2929 * _2947;
    float _2961 = abs(_2955);
    float _2963 = log2(_2961);
    float _2965 = _2937 * _2947;
    float _2967 = _2957 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2969 = _1507 * _2959;
    float _2971 = -_2959;
    float _2973 = -_2967;
    float _2975 = fma(_2971, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2973);
    float _2977 = fma(_1505, _2957, _2969);
    float _2979 = -_2965;
    float _2981 = fma(_2979, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2975);
    float _2983 = fma(_1513, _2965, _2977);
    float _2985 = precise::clamp(_2983, 0.0, 1.0);
    float _2987 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2989 = _2981 + _2987;
    float _2991 = _2963 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2993 = _2989 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2995 = precise::clamp(_2993, 0.0, 1.0);
    float _2997 = exp2(_2991);
    float _2999 = _2997 * _2995;
    float _3001 = _2985 * _2999;
    float _3003 = _3001 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3005 = _3001 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3007 = _3001 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_97.x = _3003;
    out.m_97.y = _3005;
    out.m_97.z = _3007;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

