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
    constant _16* fp_c3 [[id(0)]];
    constant _16* fp_c4 [[id(1)]];
    texture2d<float> fp_t_tcb_A [[id(2)]];
    sampler fp_t_tcb_ASmplr [[id(3)]];
    texture2d<float> fp_t_tcb_C [[id(4)]];
    sampler fp_t_tcb_CSmplr [[id(5)]];
    texture2d<float> fp_t_tcb_E [[id(6)]];
    sampler fp_t_tcb_ESmplr [[id(7)]];
    texture2d<float> fp_t_tcb_8 [[id(8)]];
    sampler fp_t_tcb_8Smplr [[id(9)]];
    sampler fp_t_tcb_ASmplr_w [[id(10)]];
    sampler fp_t_tcb_CSmplr_w [[id(11)]];
    sampler fp_t_tcb_ESmplr_w [[id(12)]];
    constant dm_border_t* dm_border [[id(13)]];
};

struct main0_out
{
    float4 m_47 [[color(0)]];
    float4 m_49 [[color(1)]];
};

struct main0_in
{
    float4 m_44 [[user(locn0), center_no_perspective]];
    float4 m_42 [[user(locn1), center_no_perspective]];
    float4 m_40 [[user(locn2), center_no_perspective]];
    float4 m_38 [[user(locn3), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _56 = in.m_38.x;
    float _58 = in.m_38.y;
    float2 _324 = float2(_56, _58);
    float _60 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_324, float2(0.0), isnan(_324))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_324, float2(0.0), isnan(_324))).x;
    float2 _335 = float2(_56, _58);
    float4 _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_335, float2(0.0), isnan(_335))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_335, float2(0.0), isnan(_335))).xyzw;
    float _65 = _63.x;
    float _67 = _63.y;
    float _69 = _63.z;
    float _71 = _63.w;
    float _73 = in.m_40.w;
    float _75 = in.m_40.x;
    float _77 = in.m_40.z;
    float _79 = in.m_40.y;
    float _81 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[10].y, (*spvDescriptorSet0.fp_c3)._m0[10].x);
    float _83 = -_81;
    float _85 = fma(_83, _73, (*spvDescriptorSet0.fp_c4)._m0[11].w);
    float _87 = -_81;
    float _89 = fma(_87, _75, (*spvDescriptorSet0.fp_c4)._m0[8].w);
    float _91 = -_81;
    float _93 = fma(_91, _77, (*spvDescriptorSet0.fp_c4)._m0[10].w);
    float _95 = -_81;
    float _97 = fma(_95, _79, (*spvDescriptorSet0.fp_c4)._m0[9].w);
    float _99 = 1.0 / _85;
    float _101 = _93 * _99;
    float _103 = _89 * _99;
    float _105 = _97 * _99;
    float2 _412 = float2(_71, 0.0);
    float2 _109 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_412, float2(0.0), isnan(_412))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_412, float2(0.0), isnan(_412))).xy;
    float _111 = _109.x;
    float _113 = _109.y;
    float2 _424 = float2(_103, _105);
    float _115 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_424, float2(0.0), isnan(_424)), _101);
    float _117 = in.m_42.y;
    float _119 = in.m_42.x;
    float _121 = in.m_42.z;
    float _123 = in.m_44.z;
    float _125 = fma(_67, 2.0, -1.0);
    float _127 = fma(_65, 2.0, -1.0);
    float _129 = fma(_69, 2.0, -1.0);
    float _131 = _117 * _117;
    float _133 = fma(_119, _119, _131);
    float _135 = (*spvDescriptorSet0.fp_c4)._m0[15].y * (*spvDescriptorSet0.fp_c4)._m0[15].y;
    float _137 = _133 + 1.0;
    float _139 = fma((*spvDescriptorSet0.fp_c4)._m0[15].x, (*spvDescriptorSet0.fp_c4)._m0[15].x, _135);
    float _141 = -_81;
    float _143 = fma(_141, _123, (*spvDescriptorSet0.fp_c4)._m0[6].w);
    float _145 = fma((*spvDescriptorSet0.fp_c4)._m0[15].z, (*spvDescriptorSet0.fp_c4)._m0[15].z, _139);
    float _147 = rsqrt(_137);
    float _149 = fma(_143, -0.5, 0.5);
    float _151 = rsqrt(_145);
    float _153 = _117 * _147;
    float _155 = _119 * _147;
    float _157 = _147 * _121;
    float _159 = _151 * (*spvDescriptorSet0.fp_c4)._m0[15].y;
    float _161 = _151 * (*spvDescriptorSet0.fp_c4)._m0[15].x;
    float _163 = _151 * (*spvDescriptorSet0.fp_c4)._m0[15].z;
    float _165 = -_153;
    float _167 = _159 + _165;
    float _169 = -_155;
    float _171 = _161 + _169;
    float _173 = -_157;
    float _175 = _163 + _173;
    float _177 = _127 * _161;
    float _179 = _167 * _167;
    float _181 = _125 * _167;
    float _183 = -_167;
    float _185 = _153 * _183;
    float _187 = -_153;
    float _189 = _125 * _187;
    float _191 = fma(_171, _171, _179);
    bool _195 = _149 <= 1.0;
    bool _197 = isnan(_149);
    bool _199 = _195 || _197;
    bool _201 = isnan(1.0);
    bool _203 = _199 || _201;
    float _205 = float(_203);
    float _207 = -_127;
    float _209 = -_181;
    float _211 = fma(_207, _171, _209);
    float _213 = -_155;
    float _215 = fma(_213, _171, _185);
    float _217 = fma(_175, _175, _191);
    float _219 = -_189;
    float _221 = fma(_127, _155, _219);
    float _223 = _149 * _205;
    float _225 = precise::clamp(_223, 0.0, 1.0);
    float _227 = -_129;
    float _229 = fma(_227, _175, _211);
    float _231 = -_157;
    float _233 = fma(_231, _175, _215);
    float _235 = -_159;
    float _237 = -_177;
    float _239 = fma(_125, _235, _237);
    float _241 = rsqrt(_217);
    float _243 = fma(_129, _157, _221);
    float _245 = _125 * (*spvDescriptorSet0.fp_c4)._m0[15].y;
    float _247 = -_163;
    float _249 = fma(_129, _247, _239);
    float _251 = fma(_127, (*spvDescriptorSet0.fp_c4)._m0[15].x, _245);
    float _253 = abs(_225);
    float _255 = log2(_253);
    float _257 = precise::min(_243, _249);
    float _259 = fma(_129, (*spvDescriptorSet0.fp_c4)._m0[15].z, _251);
    float _261 = _241 * _229;
    float _263 = precise::clamp(_261, 0.0, 1.0);
    float _265 = 1.0 / _233;
    float _267 = _263 * _257;
    float _269 = _267 * 2.0;
    float _271 = _255 * (*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _273 = abs(_263);
    float _275 = log2(_273);
    float _277 = exp2(_271);
    float _279 = _269 * _265;
    float _281 = precise::clamp(_279, 0.0, 1.0);
    float _283 = _111 * _275;
    float _285 = _277 * _115;
    float _287 = exp2(_283);
    float _289 = _285 * _287;
    float _291 = -_151;
    float _293 = fma(_291, _259, 0.0);
    float _295 = precise::clamp(_293, 0.0, 1.0);
    float _297 = _281 * _289;
    float _299 = _285 * _295;
    float _301 = _113 * _297;
    float _303 = _299 * (*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _305 = _299 * (*spvDescriptorSet0.fp_c4)._m0[12].y;
    float _307 = _299 * (*spvDescriptorSet0.fp_c4)._m0[12].z;
    float _309 = _301 * (*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _311 = _301 * (*spvDescriptorSet0.fp_c4)._m0[13].y;
    float _313 = _301 * (*spvDescriptorSet0.fp_c4)._m0[13].z;
    out.m_47.x = _303;
    out.m_47.y = _305;
    out.m_47.z = _307;
    out.m_49.x = _309;
    out.m_49.y = _311;
    out.m_49.z = _313;
    return out;
}

