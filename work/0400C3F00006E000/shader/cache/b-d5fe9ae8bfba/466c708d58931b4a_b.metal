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
    float2 _342 = float2(_54, _56);
    float _58 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_342, float2(0.0), isnan(_342))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_342, float2(0.0), isnan(_342))).x;
    float2 _353 = float2(_54, _56);
    float4 _61 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_353, float2(0.0), isnan(_353))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_353, float2(0.0), isnan(_353))).xyzw;
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
    float2 _430 = float2(_69, 0.0);
    float2 _107 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_430, float2(0.0), isnan(_430))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_430, float2(0.0), isnan(_430))).xy;
    float _109 = _107.x;
    float _111 = _107.y;
    float2 _442 = float2(_101, _103);
    float _113 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_442, float2(0.0), isnan(_442)), _99);
    float _115 = in.m_42.y;
    float _117 = in.m_42.x;
    float _119 = in.m_42.z;
    float _121 = in.m_44.w;
    float _123 = _115 * _115;
    float _125 = -_79;
    float _127 = -(*spvDescriptorSet0.fp_c4)._m0[14].y;
    float _129 = fma(_125, _115, _127);
    float _131 = -_79;
    float _133 = -(*spvDescriptorSet0.fp_c4)._m0[14].x;
    float _135 = fma(_131, _117, _133);
    float _137 = -_79;
    float _139 = -(*spvDescriptorSet0.fp_c4)._m0[14].z;
    float _141 = fma(_137, _119, _139);
    float _143 = fma(_117, _117, _123);
    float _145 = _143 + 1.0;
    float _147 = _129 * _129;
    float _149 = -_79;
    float _151 = fma(_149, _121, (*spvDescriptorSet0.fp_c4)._m0[7].w);
    float _153 = fma(_135, _135, _147);
    float _155 = rsqrt(_145);
    float _157 = -_151;
    float _159 = fma(_157, (*spvDescriptorSet0.fp_c4)._m0[16].z, (*spvDescriptorSet0.fp_c4)._m0[16].x);
    float _161 = fma(_141, _141, _153);
    bool _165 = _159 <= 1.0;
    bool _167 = isnan(_159);
    bool _169 = _165 || _167;
    bool _171 = isnan(1.0);
    bool _173 = _169 || _171;
    float _175 = float(_173);
    float _177 = rsqrt(_161);
    float _179 = _159 * _175;
    float _181 = precise::clamp(_179, 0.0, 1.0);
    float _183 = _115 * _155;
    float _185 = _117 * _155;
    float _187 = _119 * _155;
    float _189 = abs(_181);
    float _191 = log2(_189);
    float _193 = _129 * _177;
    float _195 = _135 * _177;
    float _197 = _141 * _177;
    float _199 = -_183;
    float _201 = _193 + _199;
    float _203 = -_185;
    float _205 = _195 + _203;
    float _207 = -_187;
    float _209 = _197 + _207;
    float _211 = _201 * _201;
    float _213 = fma(_205, _205, _211);
    float _215 = fma(_209, _209, _213);
    float _217 = fma(_65, 2.0, -1.0);
    float _219 = fma(_63, 2.0, -1.0);
    float _221 = fma(_67, 2.0, -1.0);
    float _223 = rsqrt(_215);
    float _225 = _217 * _201;
    float _227 = _217 * _129;
    float _229 = -_219;
    float _231 = -_225;
    float _233 = fma(_229, _205, _231);
    float _235 = fma(_219, _135, _227);
    float _237 = -_221;
    float _239 = fma(_237, _209, _233);
    float _241 = fma(_221, _141, _235);
    float _243 = -_177;
    float _245 = fma(_243, _241, 0.0);
    float _247 = precise::clamp(_245, 0.0, 1.0);
    float _249 = _223 * _239;
    float _251 = precise::clamp(_249, 0.0, 1.0);
    float _253 = -_201;
    float _255 = _183 * _253;
    float _257 = _191 * (*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _259 = -_183;
    float _261 = _217 * _259;
    float _263 = abs(_251);
    float _265 = log2(_263);
    float _267 = -_185;
    float _269 = fma(_267, _205, _255);
    float _271 = -_261;
    float _273 = fma(_219, _185, _271);
    float _275 = -_187;
    float _277 = fma(_275, _209, _269);
    float _279 = _219 * _195;
    float _281 = fma(_221, _187, _273);
    float _283 = exp2(_257);
    float _285 = -_193;
    float _287 = -_279;
    float _289 = fma(_217, _285, _287);
    float _291 = -_197;
    float _293 = fma(_221, _291, _289);
    float _295 = 1.0 / _277;
    float _297 = precise::min(_281, _293);
    float _299 = _251 * _297;
    float _301 = _299 * 2.0;
    float _303 = _301 * _295;
    float _305 = precise::clamp(_303, 0.0, 1.0);
    float _307 = _109 * _265;
    float _309 = _283 * _113;
    float _311 = exp2(_307);
    float _313 = _309 * (*spvDescriptorSet0.fp_c3)._m0[12].x;
    float _315 = _313 * _247;
    float _317 = _315 * (*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _319 = _315 * (*spvDescriptorSet0.fp_c4)._m0[12].y;
    float _321 = _315 * (*spvDescriptorSet0.fp_c4)._m0[12].z;
    float _323 = _313 * _311;
    float _325 = _305 * _323;
    float _327 = _111 * _325;
    float _329 = _327 * (*spvDescriptorSet0.fp_c3)._m0[12].x;
    float _331 = _329 * (*spvDescriptorSet0.fp_c4)._m0[13].x;
    out.m_47.x = _317;
    out.m_47.y = _319;
    out.m_47.z = _321;
    out.m_47.w = _331;
    return out;
}

