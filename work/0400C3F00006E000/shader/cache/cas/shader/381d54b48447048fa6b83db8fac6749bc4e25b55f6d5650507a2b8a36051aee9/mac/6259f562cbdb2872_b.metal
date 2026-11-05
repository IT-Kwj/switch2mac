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
    texture2d<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
    texture2d<float> fp_t_tcb_C [[id(3)]];
    sampler fp_t_tcb_CSmplr [[id(4)]];
    texture2d_array<float> fp_t_tcb_E [[id(5)]];
    sampler fp_t_tcb_ESmplr [[id(6)]];
    texture2d<float> fp_t_tcb_A [[id(7)]];
    sampler fp_t_tcb_ASmplr [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    sampler fp_t_tcb_CSmplr_w [[id(10)]];
    sampler fp_t_tcb_ASmplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_45 [[color(0)]];
};

struct main0_in
{
    float4 m_38 [[user(locn0), center_no_perspective]];
    float4 m_42 [[user(locn1), center_no_perspective]];
    float4 m_40 [[user(locn2), center_no_perspective]];
    float4 m_36 [[user(locn3), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _52 = in.m_36.x;
    float _54 = in.m_36.y;
    float2 _367 = float2(_52, _54);
    float3 _58 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_367, float2(0.0), isnan(_367)), int2(0), component::x).xyw;
    float _60 = _58.x;
    float _62 = _58.y;
    float _64 = _58.z;
    float2 _385 = float2(_52, _54);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_385, float2(0.0), isnan(_385))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_385, float2(0.0), isnan(_385))).x;
    float2 _393 = float2(_52, _54);
    float2 _70 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_393, float2(0.0), isnan(_393))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_393, float2(0.0), isnan(_393))).xy;
    float _72 = _70.x;
    float _74 = _70.y;
    float _76 = in.m_38.y;
    float _78 = in.m_40.y;
    float _80 = in.m_38.x;
    float _82 = in.m_42.y;
    float _84 = in.m_40.x;
    float _86 = in.m_42.x;
    float _88 = -_60;
    float _90 = fma(_88, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _92 = -_62;
    float _94 = fma(_92, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _96 = -_64;
    float _98 = fma(_96, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _100 = 1.0 / _90;
    float _102 = 1.0 / _94;
    float _104 = 1.0 / _98;
    float _106 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _108 = _100 * _106;
    float _110 = _76 * _108;
    float _112 = _80 * _108;
    float _114 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _116 = _102 * _114;
    float _118 = -_110;
    float _120 = fma(_116, _78, _118);
    float _122 = -_112;
    float _124 = fma(_116, _84, _122);
    float _126 = -_108;
    float _128 = _126 + _116;
    float _130 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _132 = _104 * _130;
    float _134 = _120 * _120;
    float _136 = -_110;
    float _138 = fma(_132, _82, _136);
    float _140 = -_112;
    float _142 = fma(_132, _86, _140);
    float _144 = fma(_124, _124, _134);
    float _146 = -_108;
    float _148 = _146 + _132;
    float _150 = _138 * _138;
    float _152 = -_66;
    float _154 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _156 = fma(_128, _128, _144);
    float _158 = fma(_142, _142, _150);
    float _160 = 1.0 / _154;
    float _162 = fma(_148, _148, _158);
    float _164 = rsqrt(_156);
    float _166 = rsqrt(_162);
    float _168 = _124 * _164;
    float _170 = _128 * _164;
    float _172 = _120 * _164;
    float _174 = _148 * _166;
    float _176 = _138 * _166;
    float _178 = _142 * _166;
    float _180 = _168 * _174;
    float _182 = _170 * _176;
    float _184 = -_180;
    float _186 = fma(_170, _178, _184);
    float _188 = _172 * _178;
    float _190 = -_182;
    float _192 = fma(_172, _174, _190);
    float _194 = _186 * _186;
    float _196 = -_188;
    float _198 = fma(_168, _176, _196);
    float _200 = fma(_192, _192, _194);
    float _202 = fma(_198, _198, _200);
    float _204 = rsqrt(_202);
    float _206 = _186 * _204;
    float _208 = _192 * _204;
    float _210 = _198 * _204;
    float _212 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _214 = _160 * _212;
    float _216 = _206 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _218 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[35].x, _216);
    float _220 = fma(_210, (*spvDescriptorSet0.fp_c3)._m0[35].z, _218);
    float _222 = abs(_220);
    float _224 = -_222;
    float _226 = _224 + 1.0;
    float _228 = precise::clamp(_226, 0.0, 1.0);
    float _230 = abs(_228);
    float _232 = log2(_230);
    float _234 = _232 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _236 = exp2(_234);
    float _238 = _236 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _240 = _206 * _238;
    float _242 = _208 * _238;
    float _244 = fma(_210, _238, _214);
    float _246 = fma(_214, _76, _240);
    float _248 = fma(_214, _80, _242);
    float _250 = _246 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _252 = fma(_248, (*spvDescriptorSet0.fp_c3)._m0[3].x, _250);
    float _254 = _246 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _256 = fma(_244, (*spvDescriptorSet0.fp_c3)._m0[3].z, _252);
    float _258 = _256 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _260 = fma(_248, (*spvDescriptorSet0.fp_c3)._m0[2].x, _254);
    float _262 = _246 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _264 = _246 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _266 = 1.0 / _258;
    float _268 = fma(_244, (*spvDescriptorSet0.fp_c3)._m0[2].z, _260);
    float _270 = fma(_248, (*spvDescriptorSet0.fp_c3)._m0[0].x, _262);
    float _272 = fma(_248, (*spvDescriptorSet0.fp_c3)._m0[1].x, _264);
    float _274 = _268 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _276 = fma(_244, (*spvDescriptorSet0.fp_c3)._m0[0].z, _270);
    float _278 = fma(_244, (*spvDescriptorSet0.fp_c3)._m0[1].z, _272);
    float _280 = _276 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _282 = _278 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _284 = _274 * _266;
    float _286 = precise::clamp(_284, 0.0, 1.0);
    float _288 = _280 * _266;
    float _290 = _282 * _266;
    float _292 = _286 * (*spvDescriptorSet0.fp_c3)._m0[47].x;
    float _294 = fma(_72, 2.0, -1.0);
    float _296 = fma(_74, 2.0, -1.0);
    float _298 = _292 * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _300 = _292 * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _302 = _296 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _304 = _294 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _306 = fma(_298, 0.5, _288);
    float _308 = fma(_298, -0.5, _288);
    float _310 = fma(_300, 0.5, _290);
    float _312 = fma(_300, -0.5, _290);
    float _314 = fma(_302, 2.0, _54);
    float _316 = fma(_304, 2.0, _52);
    float3 _803 = float3(_306, _310, float(0));
    float3 _807 = select(_803, float3(0.0), isnan(_803));
    float _318 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _807.xy, uint(rint(_807.z)), _286);
    float3 _814 = float3(_308, _310, float(0));
    float3 _816 = select(_814, float3(0.0), isnan(_814));
    float _320 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _816.xy, uint(rint(_816.z)), _286);
    float3 _823 = float3(_306, _312, float(0));
    float3 _825 = select(_823, float3(0.0), isnan(_823));
    float _322 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _825.xy, uint(rint(_825.z)), _286);
    float3 _832 = float3(_308, _312, float(0));
    float3 _834 = select(_832, float3(0.0), isnan(_832));
    float _324 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _834.xy, uint(rint(_834.z)), _286);
    float2 _840 = float2(_316, _314);
    float _326 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_840, float2(0.0), isnan(_840))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_840, float2(0.0), isnan(_840))).x;
    float _328 = -_214;
    float _330 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _332 = _328 + _330;
    float _334 = _332 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _336 = precise::clamp(_334, 0.0, 1.0);
    float _338 = fma(_236, (*spvDescriptorSet0.fp_c3)._m0[48].w, _336);
    float _340 = _318 + _320;
    float _342 = _340 + _322;
    float _344 = -_214;
    float _346 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _348 = _344 + _346;
    float _350 = _342 + _324;
    float _352 = _348 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _354 = precise::clamp(_352, 0.0, 1.0);
    float _356 = fma(_350, 0.25, _354);
    out.m_45.x = _326;
    out.m_45.y = _356;
    out.m_45.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_45.w = _338;
    return out;
}

