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
    texturecube_array<float> fp_t_tcb_C [[id(3)]];
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
    float4 m_42 [[color(0)]];
    float4 m_44 [[color(1)]];
    float4 m_46 [[color(2)]];
    float4 m_48 [[color(3)]];
    float4 m_50 [[color(4)]];
    float4 m_52 [[color(5)]];
};

struct main0_in
{
    float4 m_39 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _59 = gl_FragCoord.w;
    float _61 = in.m_39.x;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = in.m_39.y;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = 1.0 / _59;
    float _75 = _73 * _65;
    float _77 = _73 * _71;
    float2 _378 = float2(_75, _77);
    float3 _81 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_378, float2(0.0), isnan(_378))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_378, float2(0.0), isnan(_378))).xyz;
    float _83 = _81.x;
    float _85 = _81.y;
    float _87 = _81.z;
    float _89 = rint((*spvDescriptorSet0.fp_c3)._m0[3].x);
    float _91 = precise::max(_89, 0.0);
    uint _94 = uint(_91);
    uint _96 = clamp(_94, 0u, 65535u);
    float _98 = abs(_83);
    float _100 = abs(_87);
    float _102 = precise::max(_98, _100);
    float _104 = abs(_83);
    float _106 = abs(_85);
    float _108 = precise::max(_104, _106);
    float _110 = abs(_85);
    float _112 = precise::max(_110, _102);
    float _114 = abs(_87);
    float _116 = precise::max(_114, _108);
    float _118 = 1.0 / _112;
    float _120 = abs(_85);
    float _122 = abs(_87);
    float _124 = precise::max(_120, _122);
    float _126 = abs(_83);
    float _128 = precise::max(_126, _124);
    float _130 = 1.0 / _116;
    float _132 = -_118;
    float _134 = _87 * _132;
    float _136 = _83 * _118;
    float _138 = -_118;
    float _140 = _85 * _138;
    float _142 = 1.0 / _128;
    float _144 = -_118;
    float _146 = _83 * _144;
    float _148 = _85 * _118;
    float _150 = _83 * _130;
    float _152 = _85 * _130;
    float4 _482 = float4(_134, _136, _140, float(int(_96)));
    float4 _486 = select(_482, float4(0.0), isnan(_482));
    float3 _154 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, _486.xyz, uint(rint(_486.w))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, _486.xyz, uint(rint(_486.w))).xyz;
    float _156 = _154.x;
    float _158 = _154.y;
    float _160 = _154.z;
    float _162 = _87 * _130;
    float3 _502 = float3(_134, _136, _140);
    float3 _164 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_502, float3(0.0), isnan(_502))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_502, float3(0.0), isnan(_502))).xyz;
    float _166 = _164.x;
    float _168 = _164.y;
    float _170 = _164.z;
    float4 _522 = float4(_134, _146, _148, float(int(_96)));
    float4 _524 = select(_522, float4(0.0), isnan(_522));
    float3 _172 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, _524.xyz, uint(rint(_524.w))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, _524.xyz, uint(rint(_524.w))).xyz;
    float _174 = _172.x;
    float _176 = _172.y;
    float _178 = _172.z;
    float3 _537 = float3(_134, _146, _148);
    float3 _180 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_537, float3(0.0), isnan(_537))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_537, float3(0.0), isnan(_537))).xyz;
    float _182 = _180.x;
    float _184 = _180.y;
    float _186 = _180.z;
    float4 _555 = float4(_150, _152, _162, float(int(_96)));
    float4 _557 = select(_555, float4(0.0), isnan(_555));
    float3 _188 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, _557.xyz, uint(rint(_557.w))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, _557.xyz, uint(rint(_557.w))).xyz;
    float _190 = _188.x;
    float _192 = _188.y;
    float _194 = _188.z;
    float3 _570 = float3(_150, _152, _162);
    float3 _196 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_570, float3(0.0), isnan(_570))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_570, float3(0.0), isnan(_570))).xyz;
    float _198 = _196.x;
    float _200 = _196.y;
    float _202 = _196.z;
    float _204 = _85 * _142;
    float _206 = -_130;
    float _208 = _83 * _206;
    float _210 = -_130;
    float _212 = _87 * _210;
    float _214 = -_142;
    float _216 = _87 * _214;
    float _218 = _87 * _142;
    float _220 = _83 * _142;
    float _222 = _156 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _224 = _158 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _226 = -_142;
    float _228 = _83 * _226;
    float _230 = fma(_166, (*spvDescriptorSet0.fp_c3)._m0[0].x, _222);
    float _232 = _160 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _234 = fma(_168, (*spvDescriptorSet0.fp_c3)._m0[0].x, _224);
    float _236 = fma(_170, (*spvDescriptorSet0.fp_c3)._m0[0].x, _232);
    float4 _644 = float4(_208, _152, _212, float(int(_96)));
    float4 _646 = select(_644, float4(0.0), isnan(_644));
    float3 _238 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, _646.xyz, uint(rint(_646.w))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, _646.xyz, uint(rint(_646.w))).xyz;
    float _240 = _238.x;
    float _242 = _238.y;
    float _244 = _238.z;
    float3 _659 = float3(_208, _152, _212);
    float3 _246 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_659, float3(0.0), isnan(_659))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_659, float3(0.0), isnan(_659))).xyz;
    float _248 = _246.x;
    float _250 = _246.y;
    float _252 = _246.z;
    float4 _677 = float4(_216, _204, _220, float(int(_96)));
    float4 _679 = select(_677, float4(0.0), isnan(_677));
    float3 _254 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, _679.xyz, uint(rint(_679.w))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, _679.xyz, uint(rint(_679.w))).xyz;
    float _256 = _254.x;
    float _258 = _254.y;
    float _260 = _254.z;
    float3 _692 = float3(_216, _204, _220);
    float3 _262 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_692, float3(0.0), isnan(_692))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_692, float3(0.0), isnan(_692))).xyz;
    float _264 = _262.x;
    float _266 = _262.y;
    float _268 = _262.z;
    float4 _710 = float4(_218, _204, _228, float(int(_96)));
    float4 _712 = select(_710, float4(0.0), isnan(_710));
    float3 _270 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, _712.xyz, uint(rint(_712.w))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, _712.xyz, uint(rint(_712.w))).xyz;
    float _272 = _270.x;
    float _274 = _270.y;
    float _276 = _270.z;
    float3 _725 = float3(_218, _204, _228);
    float3 _278 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_725, float3(0.0), isnan(_725))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_725, float3(0.0), isnan(_725))).xyz;
    float _280 = _278.x;
    float _282 = _278.y;
    float _284 = _278.z;
    float _286 = _174 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _288 = _176 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _290 = _178 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _292 = _190 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _294 = _194 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _296 = fma(_184, (*spvDescriptorSet0.fp_c3)._m0[0].x, _288);
    float _298 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[0].x, _290);
    float _300 = _192 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _302 = fma(_198, (*spvDescriptorSet0.fp_c3)._m0[0].x, _292);
    float _304 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[0].x, _294);
    float _306 = fma(_182, (*spvDescriptorSet0.fp_c3)._m0[0].x, _286);
    float _308 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[0].x, _300);
    float _310 = _240 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _312 = fma(_248, (*spvDescriptorSet0.fp_c3)._m0[0].x, _310);
    float _314 = _242 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _316 = _244 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _318 = _256 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _320 = _258 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _322 = fma(_250, (*spvDescriptorSet0.fp_c3)._m0[0].x, _314);
    float _324 = fma(_252, (*spvDescriptorSet0.fp_c3)._m0[0].x, _316);
    float _326 = _260 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _328 = _272 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _330 = _274 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _332 = _276 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _334 = fma(_264, (*spvDescriptorSet0.fp_c3)._m0[0].x, _318);
    float _336 = fma(_268, (*spvDescriptorSet0.fp_c3)._m0[0].x, _326);
    float _338 = fma(_280, (*spvDescriptorSet0.fp_c3)._m0[0].x, _328);
    float _340 = fma(_282, (*spvDescriptorSet0.fp_c3)._m0[0].x, _330);
    float _342 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[0].x, _320);
    float _344 = fma(_284, (*spvDescriptorSet0.fp_c3)._m0[0].x, _332);
    out.m_42.x = _302;
    out.m_42.y = _308;
    out.m_42.z = _304;
    out.m_42.w = 1.0;
    out.m_44.x = _312;
    out.m_44.y = _322;
    out.m_44.z = _324;
    out.m_44.w = 1.0;
    out.m_46.x = _230;
    out.m_46.y = _234;
    out.m_46.z = _236;
    out.m_46.w = 1.0;
    out.m_48.x = _306;
    out.m_48.y = _296;
    out.m_48.z = _298;
    out.m_48.w = 1.0;
    out.m_50.x = _334;
    out.m_50.y = _342;
    out.m_50.z = _336;
    out.m_50.w = 1.0;
    out.m_52.x = _338;
    out.m_52.y = _340;
    out.m_52.z = _344;
    out.m_52.w = 1.0;
    return out;
}

