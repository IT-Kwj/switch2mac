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
    float _54 = in.m_38.x;
    float _56 = in.m_38.y;
    float2 _322 = float2(_54, _56);
    float _58 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_322, float2(0.0), isnan(_322))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_322, float2(0.0), isnan(_322))).x;
    float2 _333 = float2(_54, _56);
    float4 _61 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_333, float2(0.0), isnan(_333))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_333, float2(0.0), isnan(_333))).xyzw;
    float _63 = _61.x;
    float _65 = _61.y;
    float _67 = _61.z;
    float _69 = _61.w;
    float _71 = in.m_40.w;
    float _73 = in.m_40.x;
    float _75 = in.m_40.z;
    float _77 = in.m_40.y;
    float _79 = fma(_58, (*spvDescriptorSet0.fp_c3)._m0[10].y, (*spvDescriptorSet0.fp_c3)._m0[10].x);
    float _81 = -_79;
    float _83 = fma(_81, _71, (*spvDescriptorSet0.fp_c4)._m0[11].w);
    float _85 = -_79;
    float _87 = fma(_85, _73, (*spvDescriptorSet0.fp_c4)._m0[8].w);
    float _89 = -_79;
    float _91 = fma(_89, _75, (*spvDescriptorSet0.fp_c4)._m0[10].w);
    float _93 = -_79;
    float _95 = fma(_93, _77, (*spvDescriptorSet0.fp_c4)._m0[9].w);
    float _97 = 1.0 / _83;
    float _99 = _91 * _97;
    float _101 = _87 * _97;
    float _103 = _95 * _97;
    float2 _410 = float2(_69, 0.0);
    float2 _107 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_410, float2(0.0), isnan(_410))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_410, float2(0.0), isnan(_410))).xy;
    float _109 = _107.x;
    float _111 = _107.y;
    float2 _422 = float2(_101, _103);
    float _113 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_422, float2(0.0), isnan(_422)), _99);
    float _115 = in.m_42.y;
    float _117 = in.m_42.x;
    float _119 = in.m_42.z;
    float _121 = in.m_44.z;
    float _123 = fma(_65, 2.0, -1.0);
    float _125 = fma(_63, 2.0, -1.0);
    float _127 = fma(_67, 2.0, -1.0);
    float _129 = _115 * _115;
    float _131 = fma(_117, _117, _129);
    float _133 = (*spvDescriptorSet0.fp_c4)._m0[15].y * (*spvDescriptorSet0.fp_c4)._m0[15].y;
    float _135 = _131 + 1.0;
    float _137 = fma((*spvDescriptorSet0.fp_c4)._m0[15].x, (*spvDescriptorSet0.fp_c4)._m0[15].x, _133);
    float _139 = -_79;
    float _141 = fma(_139, _121, (*spvDescriptorSet0.fp_c4)._m0[6].w);
    float _143 = fma((*spvDescriptorSet0.fp_c4)._m0[15].z, (*spvDescriptorSet0.fp_c4)._m0[15].z, _137);
    float _145 = rsqrt(_135);
    float _147 = fma(_141, -0.5, 0.5);
    float _149 = rsqrt(_143);
    float _151 = _115 * _145;
    float _153 = _117 * _145;
    float _155 = _145 * _119;
    float _157 = _149 * (*spvDescriptorSet0.fp_c4)._m0[15].y;
    float _159 = _149 * (*spvDescriptorSet0.fp_c4)._m0[15].x;
    float _161 = _149 * (*spvDescriptorSet0.fp_c4)._m0[15].z;
    float _163 = -_151;
    float _165 = _157 + _163;
    float _167 = -_153;
    float _169 = _159 + _167;
    float _171 = -_155;
    float _173 = _161 + _171;
    float _175 = _125 * _159;
    float _177 = _165 * _165;
    float _179 = _123 * _165;
    float _181 = -_165;
    float _183 = _151 * _181;
    float _185 = -_151;
    float _187 = _123 * _185;
    float _189 = fma(_169, _169, _177);
    bool _193 = _147 <= 1.0;
    bool _195 = isnan(_147);
    bool _197 = _193 || _195;
    bool _199 = isnan(1.0);
    bool _201 = _197 || _199;
    float _203 = float(_201);
    float _205 = -_125;
    float _207 = -_179;
    float _209 = fma(_205, _169, _207);
    float _211 = -_153;
    float _213 = fma(_211, _169, _183);
    float _215 = fma(_173, _173, _189);
    float _217 = -_187;
    float _219 = fma(_125, _153, _217);
    float _221 = _147 * _203;
    float _223 = precise::clamp(_221, 0.0, 1.0);
    float _225 = -_127;
    float _227 = fma(_225, _173, _209);
    float _229 = -_155;
    float _231 = fma(_229, _173, _213);
    float _233 = -_157;
    float _235 = -_175;
    float _237 = fma(_123, _233, _235);
    float _239 = rsqrt(_215);
    float _241 = fma(_127, _155, _219);
    float _243 = _123 * (*spvDescriptorSet0.fp_c4)._m0[15].y;
    float _245 = -_161;
    float _247 = fma(_127, _245, _237);
    float _249 = fma(_125, (*spvDescriptorSet0.fp_c4)._m0[15].x, _243);
    float _251 = abs(_223);
    float _253 = log2(_251);
    float _255 = precise::min(_241, _247);
    float _257 = fma(_127, (*spvDescriptorSet0.fp_c4)._m0[15].z, _249);
    float _259 = _239 * _227;
    float _261 = precise::clamp(_259, 0.0, 1.0);
    float _263 = 1.0 / _231;
    float _265 = _261 * _255;
    float _267 = _265 * 2.0;
    float _269 = _253 * (*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _271 = abs(_261);
    float _273 = log2(_271);
    float _275 = exp2(_269);
    float _277 = _267 * _263;
    float _279 = precise::clamp(_277, 0.0, 1.0);
    float _281 = _109 * _273;
    float _283 = _275 * _113;
    float _285 = exp2(_281);
    float _287 = _283 * (*spvDescriptorSet0.fp_c3)._m0[12].x;
    float _289 = _287 * _285;
    float _291 = -_149;
    float _293 = fma(_291, _257, 0.0);
    float _295 = precise::clamp(_293, 0.0, 1.0);
    float _297 = _279 * _289;
    float _299 = _287 * _295;
    float _301 = _111 * _297;
    float _303 = _299 * (*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _305 = _299 * (*spvDescriptorSet0.fp_c4)._m0[12].y;
    float _307 = _299 * (*spvDescriptorSet0.fp_c4)._m0[12].z;
    float _309 = _301 * (*spvDescriptorSet0.fp_c3)._m0[12].x;
    float _311 = _309 * (*spvDescriptorSet0.fp_c4)._m0[13].x;
    out.m_47.x = _303;
    out.m_47.y = _305;
    out.m_47.z = _307;
    out.m_47.w = _311;
    return out;
}

