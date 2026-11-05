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
    texturecube<float> fp_t_tcb_C [[id(3)]];
    sampler fp_t_tcb_CSmplr [[id(4)]];
    texturecube<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    sampler fp_t_tcb_8Smplr_w [[id(7)]];
    sampler fp_t_tcb_CSmplr_w [[id(8)]];
    sampler fp_t_tcb_ASmplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_39 [[color(0)]];
    float4 m_41 [[color(1)]];
    float4 m_43 [[color(2)]];
    float4 m_45 [[color(3)]];
    float4 m_47 [[color(4)]];
    float4 m_49 [[color(5)]];
};

struct main0_in
{
    float4 m_36 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _56 = gl_FragCoord.w;
    float _58 = in.m_36.x;
    float _60 = gl_FragCoord.w;
    float _62 = _58 * _60;
    float _64 = in.m_36.y;
    float _66 = gl_FragCoord.w;
    float _68 = _64 * _66;
    float _70 = 1.0 / _56;
    float _72 = _70 * _62;
    float _74 = _70 * _68;
    float2 _366 = float2(_72, _74);
    float3 _78 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_366, float2(0.0), isnan(_366))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_366, float2(0.0), isnan(_366))).xyz;
    float _80 = _78.x;
    float _82 = _78.y;
    float _84 = _78.z;
    float _86 = abs(_80);
    float _88 = abs(_82);
    float _90 = precise::max(_86, _88);
    float _92 = abs(_84);
    float _94 = precise::max(_92, _90);
    float _96 = 1.0 / _94;
    float _98 = _84 * _96;
    float _100 = _80 * _96;
    float _102 = _82 * _96;
    float3 _409 = float3(_100, _102, _98);
    float3 _104 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_409, float3(0.0), isnan(_409))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_409, float3(0.0), isnan(_409))).xyz;
    float _106 = _104.x;
    float _108 = _104.y;
    float _110 = _104.z;
    float3 _426 = float3(_100, _102, _98);
    float3 _112 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_426, float3(0.0), isnan(_426))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_426, float3(0.0), isnan(_426))).xyz;
    float _114 = _112.x;
    float _116 = _112.y;
    float _118 = _112.z;
    float _120 = abs(_80);
    float _122 = abs(_84);
    float _124 = precise::max(_120, _122);
    float _126 = abs(_82);
    float _128 = abs(_84);
    float _130 = precise::max(_126, _128);
    float _132 = abs(_82);
    float _134 = precise::max(_132, _124);
    float _136 = -_96;
    float _138 = _84 * _136;
    float _140 = abs(_80);
    float _142 = precise::max(_140, _130);
    float _144 = 1.0 / _134;
    float _146 = -_96;
    float _148 = _80 * _146;
    float _150 = 1.0 / _142;
    float3 _479 = float3(_148, _102, _138);
    float3 _152 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_479, float3(0.0), isnan(_479))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_479, float3(0.0), isnan(_479))).xyz;
    float _154 = _152.x;
    float _156 = _152.y;
    float _158 = _152.z;
    float3 _494 = float3(_148, _102, _138);
    float3 _160 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_494, float3(0.0), isnan(_494))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_494, float3(0.0), isnan(_494))).xyz;
    float _162 = _160.x;
    float _164 = _160.y;
    float _166 = _160.z;
    float _168 = -_144;
    float _170 = _82 * _168;
    float _172 = _82 * _144;
    float _174 = -_144;
    float _176 = _84 * _174;
    float _178 = _80 * _144;
    float _180 = -_144;
    float _182 = _80 * _180;
    float _184 = _80 * _150;
    float _186 = _82 * _150;
    float _188 = -_150;
    float _190 = _80 * _188;
    float _192 = -_150;
    float _194 = _84 * _192;
    float _196 = _84 * _150;
    float _198 = _106 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _200 = _108 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float3 _558 = float3(_176, _178, _170);
    float3 _202 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_558, float3(0.0), isnan(_558))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_558, float3(0.0), isnan(_558))).xyz;
    float _204 = _202.x;
    float _206 = _202.y;
    float _208 = _202.z;
    float3 _573 = float3(_176, _178, _170);
    float3 _210 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_573, float3(0.0), isnan(_573))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_573, float3(0.0), isnan(_573))).xyz;
    float _212 = _210.x;
    float _214 = _210.y;
    float _216 = _210.z;
    float3 _588 = float3(_176, _182, _172);
    float3 _218 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_588, float3(0.0), isnan(_588))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_588, float3(0.0), isnan(_588))).xyz;
    float _220 = _218.x;
    float _222 = _218.y;
    float _224 = _218.z;
    float3 _603 = float3(_176, _182, _172);
    float3 _226 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_603, float3(0.0), isnan(_603))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_603, float3(0.0), isnan(_603))).xyz;
    float _228 = _226.x;
    float _230 = _226.y;
    float _232 = _226.z;
    float3 _618 = float3(_194, _186, _184);
    float3 _234 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_618, float3(0.0), isnan(_618))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_618, float3(0.0), isnan(_618))).xyz;
    float _236 = _234.x;
    float _238 = _234.y;
    float _240 = _234.z;
    float3 _633 = float3(_194, _186, _184);
    float3 _242 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_633, float3(0.0), isnan(_633))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_633, float3(0.0), isnan(_633))).xyz;
    float _244 = _242.x;
    float _246 = _242.y;
    float _248 = _242.z;
    float3 _648 = float3(_196, _186, _190);
    float3 _250 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_648, float3(0.0), isnan(_648))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_648, float3(0.0), isnan(_648))).xyz;
    float _252 = _250.x;
    float _254 = _250.y;
    float _256 = _250.z;
    float _258 = fma(_114, (*spvDescriptorSet0.fp_c3)._m0[0].x, _198);
    float3 _668 = float3(_196, _186, _190);
    float3 _260 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_668, float3(0.0), isnan(_668))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_668, float3(0.0), isnan(_668))).xyz;
    float _262 = _260.x;
    float _264 = _260.y;
    float _266 = _260.z;
    float _268 = _110 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _270 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[0].x, _200);
    float _272 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[0].x, _268);
    float _274 = _154 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _276 = _156 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _278 = _158 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _280 = fma(_162, (*spvDescriptorSet0.fp_c3)._m0[0].x, _274);
    float _282 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[0].x, _276);
    float _284 = fma(_166, (*spvDescriptorSet0.fp_c3)._m0[0].x, _278);
    float _286 = _206 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _288 = _204 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _290 = _208 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _292 = _224 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _294 = fma(_214, (*spvDescriptorSet0.fp_c3)._m0[0].x, _286);
    float _296 = _220 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _298 = _238 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _300 = _240 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _302 = fma(_212, (*spvDescriptorSet0.fp_c3)._m0[0].x, _288);
    float _304 = fma(_228, (*spvDescriptorSet0.fp_c3)._m0[0].x, _296);
    float _306 = _222 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _308 = _236 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _310 = fma(_246, (*spvDescriptorSet0.fp_c3)._m0[0].x, _298);
    float _312 = fma(_216, (*spvDescriptorSet0.fp_c3)._m0[0].x, _290);
    float _314 = fma(_230, (*spvDescriptorSet0.fp_c3)._m0[0].x, _306);
    float _316 = fma(_244, (*spvDescriptorSet0.fp_c3)._m0[0].x, _308);
    float _318 = _254 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _320 = _252 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _322 = _256 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _324 = fma(_248, (*spvDescriptorSet0.fp_c3)._m0[0].x, _300);
    float _326 = fma(_264, (*spvDescriptorSet0.fp_c3)._m0[0].x, _318);
    float _328 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[0].x, _320);
    float _330 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[0].x, _322);
    float _332 = fma(_232, (*spvDescriptorSet0.fp_c3)._m0[0].x, _292);
    out.m_39.x = _258;
    out.m_39.y = _270;
    out.m_39.z = _272;
    out.m_39.w = 1.0;
    out.m_41.x = _280;
    out.m_41.y = _282;
    out.m_41.z = _284;
    out.m_41.w = 1.0;
    out.m_43.x = _302;
    out.m_43.y = _294;
    out.m_43.z = _312;
    out.m_43.w = 1.0;
    out.m_45.x = _304;
    out.m_45.y = _314;
    out.m_45.z = _332;
    out.m_45.w = 1.0;
    out.m_47.x = _316;
    out.m_47.y = _310;
    out.m_47.z = _324;
    out.m_47.w = 1.0;
    out.m_49.x = _328;
    out.m_49.y = _326;
    out.m_49.z = _330;
    out.m_49.w = 1.0;
    return out;
}

