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
    texture2d<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
    texture2d_array<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    sampler fp_t_tcb_8Smplr_w [[id(5)]];
    sampler fp_t_tcb_ASmplr_w [[id(6)]];
    constant dm_border_t* dm_border [[id(7)]];
};

struct main0_out
{
    float4 m_49 [[color(0)]];
};

struct main0_in
{
    float4 m_38 [[user(locn0)]];
    float4 m_34 [[user(locn1), center_no_perspective]];
    float4 m_46 [[user(locn2)]];
    float4 m_44 [[user(locn3)]];
    float4 m_32 [[user(locn4), center_no_perspective]];
    float4 m_42 [[user(locn5)]];
    float4 m_40 [[user(locn6)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _56 = in.m_32.x;
    float _58 = in.m_32.y;
    float2 _297 = float2(_56, _58);
    float _60 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_297, float2(0.0), isnan(_297))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_297, float2(0.0), isnan(_297))).x;
    float _62 = in.m_34.y;
    float _64 = in.m_34.x;
    float _66 = gl_FragCoord.w;
    float _68 = in.m_38.x;
    float _70 = gl_FragCoord.w;
    float _72 = _68 * _70;
    float _74 = in.m_40.x;
    float _76 = gl_FragCoord.w;
    float _78 = _74 * _76;
    float _80 = in.m_42.y;
    float _82 = gl_FragCoord.w;
    float _84 = _80 * _82;
    float _86 = _62 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _88 = _62 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _90 = _62 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _92 = _62 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _94 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[4].x, _86);
    float _96 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[5].x, _88);
    float _98 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[6].x, _90);
    float _100 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[7].x, _92);
    float _102 = fma(_60, 2.0, -1.0);
    float _104 = in.m_42.x;
    float _106 = gl_FragCoord.w;
    float _108 = _104 * _106;
    float _110 = 1.0 / _66;
    float _112 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[7].z, _100);
    float _114 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[5].z, _96);
    float _116 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[4].z, _94);
    float _118 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[6].z, _98);
    float _120 = _112 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _122 = _114 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
    float _124 = _116 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _126 = _118 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _128 = 1.0 / _120;
    float _130 = _110 * _72;
    float _132 = _110 * _84;
    float _134 = _122 * _128;
    float _136 = _124 * _128;
    float _138 = _126 * _128;
    float _140 = _134 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _142 = _134 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _144 = _110 * _108;
    float _146 = fma(_136, (*spvDescriptorSet0.fp_c3)._m0[10].x, _140);
    float _148 = fma(_136, (*spvDescriptorSet0.fp_c3)._m0[8].x, _142);
    float _150 = rint(_130);
    float _152 = precise::max(_150, 0.0);
    uint _155 = uint(_152);
    uint _157 = clamp(_155, 0u, 65535u);
    float _159 = fma(_138, (*spvDescriptorSet0.fp_c3)._m0[10].z, _146);
    float _161 = fma(_138, (*spvDescriptorSet0.fp_c3)._m0[8].z, _148);
    float _163 = _159 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
    float _165 = _161 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _167 = -_132;
    float _169 = _163 + _167;
    float _171 = _110 * _78;
    float _173 = -_144;
    float _175 = _165 + _173;
    float _177 = fma(_169, _171, 0.5);
    float _179 = fma(_175, _171, 0.5);
    float3 _521 = float3(_179, _177, float(int(_157)));
    float3 _525 = select(_521, float3(0.0), isnan(_521));
    float _181 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _525.xy, uint(rint(_525.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _525.xy, uint(rint(_525.z))).x;
    float _183 = in.m_44.x;
    float _185 = gl_FragCoord.w;
    float _187 = _183 * _185;
    float _189 = in.m_46.x;
    float _191 = gl_FragCoord.w;
    float _193 = _189 * _191;
    float _195 = _134 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _197 = fma(_136, (*spvDescriptorSet0.fp_c3)._m0[9].x, _195);
    float _199 = fma(_138, (*spvDescriptorSet0.fp_c3)._m0[9].z, _197);
    float _201 = _199 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
    float _203 = _110 * _187;
    float _205 = _110 * _193;
    float _207 = fma(_201, _203, _205);
    float _209 = precise::clamp(_207, 0.0, 1.0);
    bool _213 = _179 >= 0.0;
    bool _215 = isnan(_179);
    bool _217 = _213 || _215;
    bool _219 = isnan(0.0);
    bool _221 = _217 || _219;
    float _223 = float(_221);
    bool _225 = _179 <= 1.0;
    bool _227 = isnan(_179);
    bool _229 = _225 || _227;
    bool _231 = isnan(1.0);
    bool _233 = _229 || _231;
    float _235 = float(_233);
    float _237 = -_181;
    float _239 = _237 + 1.0;
    float _241 = _239 * _223;
    bool _243 = _177 >= 0.0;
    bool _245 = isnan(_177);
    bool _247 = _243 || _245;
    bool _249 = isnan(0.0);
    bool _251 = _247 || _249;
    float _253 = float(_251);
    bool _255 = _177 <= 1.0;
    bool _257 = isnan(_177);
    bool _259 = _255 || _257;
    bool _261 = isnan(1.0);
    bool _263 = _259 || _261;
    float _265 = float(_263);
    float _267 = _241 * _235;
    float _269 = _267 * _253;
    float _271 = -_269;
    float _273 = fma(_271, _265, 1.0);
    float _275 = -_209;
    float _277 = _275 + _273;
    float _279 = fma(_277, 50.0, 0.5);
    float _281 = exp2(_279);
    float _283 = 0.0 + _281;
    float _285 = precise::clamp(_283, 0.0, 1.0);
    out.m_49.x = _285;
    out.m_49.y = _285;
    out.m_49.z = _285;
    out.m_49.w = _285;
    return out;
}

