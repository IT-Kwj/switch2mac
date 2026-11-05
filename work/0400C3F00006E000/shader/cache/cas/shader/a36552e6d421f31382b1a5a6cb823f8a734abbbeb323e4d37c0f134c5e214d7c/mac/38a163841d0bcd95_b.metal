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
    float2 _344 = float2(_56, _58);
    float _60 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_344, float2(0.0), isnan(_344))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_344, float2(0.0), isnan(_344))).x;
    float2 _355 = float2(_56, _58);
    float4 _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_355, float2(0.0), isnan(_355))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_355, float2(0.0), isnan(_355))).xyzw;
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
    float _101 = _89 * _99;
    float _103 = _97 * _99;
    float2 _429 = float2(_71, 0.0);
    float2 _107 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_429, float2(0.0), isnan(_429))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_429, float2(0.0), isnan(_429))).xy;
    float _109 = _107.x;
    float _111 = _107.y;
    float _113 = _93 * _99;
    float2 _444 = float2(_101, _103);
    float _115 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_444, float2(0.0), isnan(_444)), _113);
    float _117 = in.m_42.y;
    float _119 = in.m_42.x;
    float _121 = in.m_42.z;
    float _123 = in.m_44.w;
    float _125 = fma(_65, 2.0, -1.0);
    float _127 = fma(_69, 2.0, -1.0);
    float _129 = _117 * _117;
    float _131 = -_81;
    float _133 = -(*spvDescriptorSet0.fp_c4)._m0[14].y;
    float _135 = fma(_131, _117, _133);
    float _137 = -_81;
    float _139 = -(*spvDescriptorSet0.fp_c4)._m0[14].x;
    float _141 = fma(_137, _119, _139);
    float _143 = -_81;
    float _145 = -(*spvDescriptorSet0.fp_c4)._m0[14].z;
    float _147 = fma(_143, _121, _145);
    float _149 = fma(_119, _119, _129);
    float _151 = -_81;
    float _153 = fma(_151, _123, (*spvDescriptorSet0.fp_c4)._m0[7].w);
    float _155 = _149 + 1.0;
    float _157 = _135 * _135;
    float _159 = fma(_141, _141, _157);
    float _161 = rsqrt(_155);
    float _163 = fma(_147, _147, _159);
    float _165 = rsqrt(_163);
    float _167 = _117 * _161;
    float _169 = _119 * _161;
    float _171 = _121 * _161;
    float _173 = _135 * _165;
    float _175 = _141 * _165;
    float _177 = _147 * _165;
    float _179 = -_167;
    float _181 = _173 + _179;
    float _183 = -_169;
    float _185 = _175 + _183;
    float _187 = -_171;
    float _189 = _177 + _187;
    float _191 = _181 * _181;
    float _193 = _125 * _175;
    float _195 = fma(_185, _185, _191);
    float _197 = -_153;
    float _199 = fma(_197, (*spvDescriptorSet0.fp_c4)._m0[16].z, (*spvDescriptorSet0.fp_c4)._m0[16].x);
    float _201 = fma(_67, 2.0, -1.0);
    float _203 = fma(_189, _189, _195);
    bool _207 = _199 <= 1.0;
    bool _209 = isnan(_199);
    bool _211 = _207 || _209;
    bool _213 = isnan(1.0);
    bool _215 = _211 || _213;
    float _217 = float(_215);
    float _219 = _201 * _181;
    float _221 = -_181;
    float _223 = _167 * _221;
    float _225 = -_173;
    float _227 = -_193;
    float _229 = fma(_201, _225, _227);
    float _231 = rsqrt(_203);
    float _233 = _199 * _217;
    float _235 = precise::clamp(_233, 0.0, 1.0);
    float _237 = -_125;
    float _239 = -_219;
    float _241 = fma(_237, _185, _239);
    float _243 = -_169;
    float _245 = fma(_243, _185, _223);
    float _247 = -_167;
    float _249 = _201 * _247;
    float _251 = -_177;
    float _253 = fma(_127, _251, _229);
    float _255 = -_127;
    float _257 = fma(_255, _189, _241);
    float _259 = -_171;
    float _261 = fma(_259, _189, _245);
    float _263 = abs(_235);
    float _265 = log2(_263);
    float _267 = -_249;
    float _269 = fma(_125, _169, _267);
    float _271 = _201 * _135;
    float _273 = fma(_127, _171, _269);
    float _275 = fma(_125, _141, _271);
    float _277 = _231 * _257;
    float _279 = precise::clamp(_277, 0.0, 1.0);
    float _281 = 1.0 / _261;
    float _283 = precise::min(_273, _253);
    float _285 = fma(_127, _147, _275);
    float _287 = _279 * _283;
    float _289 = _287 * 2.0;
    float _291 = _265 * (*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _293 = abs(_279);
    float _295 = log2(_293);
    float _297 = exp2(_291);
    float _299 = _289 * _281;
    float _301 = precise::clamp(_299, 0.0, 1.0);
    float _303 = _109 * _295;
    float _305 = exp2(_303);
    float _307 = _297 * _115;
    float _309 = _307 * _305;
    float _311 = -_165;
    float _313 = fma(_311, _285, 0.0);
    float _315 = precise::clamp(_313, 0.0, 1.0);
    float _317 = _301 * _309;
    float _319 = _307 * _315;
    float _321 = _111 * _317;
    float _323 = _319 * (*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _325 = _319 * (*spvDescriptorSet0.fp_c4)._m0[12].y;
    float _327 = _319 * (*spvDescriptorSet0.fp_c4)._m0[12].z;
    float _329 = _321 * (*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _331 = _321 * (*spvDescriptorSet0.fp_c4)._m0[13].y;
    float _333 = _321 * (*spvDescriptorSet0.fp_c4)._m0[13].z;
    out.m_47.x = _323;
    out.m_47.y = _325;
    out.m_47.z = _327;
    out.m_49.x = _329;
    out.m_49.y = _331;
    out.m_49.z = _333;
    return out;
}

