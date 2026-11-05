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
    texturecube_array<float> fp_t_tcb_A [[id(5)]];
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
    float _89 = rint((*spvDescriptorSet0.fp_c3)._m0[2].x);
    float _91 = precise::max(_89, 0.0);
    uint _94 = uint(_91);
    uint _96 = clamp(_94, 0u, 65535u);
    float _98 = abs(_83);
    float _100 = abs(_85);
    float _102 = precise::max(_98, _100);
    float _104 = abs(_87);
    float _106 = precise::max(_104, _102);
    float _108 = 1.0 / _106;
    float _110 = _83 * _108;
    float _112 = _85 * _108;
    float _114 = _87 * _108;
    float3 _434 = float3(_110, _112, _114);
    float3 _116 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_434, float3(0.0), isnan(_434))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_434, float3(0.0), isnan(_434))).xyz;
    float _118 = _116.x;
    float _120 = _116.y;
    float _122 = _116.z;
    float4 _454 = float4(_110, _112, _114, float(int(_96)));
    float4 _458 = select(_454, float4(0.0), isnan(_454));
    float3 _124 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _458.xyz, uint(rint(_458.w))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _458.xyz, uint(rint(_458.w))).xyz;
    float _126 = _124.x;
    float _128 = _124.y;
    float _130 = _124.z;
    float _132 = abs(_83);
    float _134 = abs(_87);
    float _136 = precise::max(_132, _134);
    float _138 = -_108;
    float _140 = _87 * _138;
    float _142 = abs(_85);
    float _144 = abs(_87);
    float _146 = precise::max(_142, _144);
    float _148 = abs(_85);
    float _150 = precise::max(_148, _136);
    float _152 = abs(_83);
    float _154 = precise::max(_152, _146);
    float _156 = -_108;
    float _158 = _83 * _156;
    float _160 = 1.0 / _150;
    float _162 = 1.0 / _154;
    float _164 = -_160;
    float _166 = _87 * _164;
    float _168 = _83 * _160;
    float _170 = -_160;
    float _172 = _85 * _170;
    float _174 = -_160;
    float _176 = _83 * _174;
    float _178 = _85 * _160;
    float _180 = _85 * _162;
    float _182 = _83 * _162;
    float _184 = -_162;
    float _186 = _83 * _184;
    float _188 = -_162;
    float _190 = _87 * _188;
    float _192 = _87 * _162;
    float _194 = _118 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _196 = _120 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _198 = fma(_126, (*spvDescriptorSet0.fp_c3)._m0[0].x, _194);
    float4 _565 = float4(_158, _112, _140, float(int(_96)));
    float4 _567 = select(_565, float4(0.0), isnan(_565));
    float3 _200 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _567.xyz, uint(rint(_567.w))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _567.xyz, uint(rint(_567.w))).xyz;
    float _202 = _200.x;
    float _204 = _200.y;
    float _206 = _200.z;
    float3 _580 = float3(_158, _112, _140);
    float3 _208 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_580, float3(0.0), isnan(_580))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_580, float3(0.0), isnan(_580))).xyz;
    float _210 = _208.x;
    float _212 = _208.y;
    float _214 = _208.z;
    float4 _598 = float4(_166, _168, _172, float(int(_96)));
    float4 _600 = select(_598, float4(0.0), isnan(_598));
    float3 _216 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _600.xyz, uint(rint(_600.w))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _600.xyz, uint(rint(_600.w))).xyz;
    float _218 = _216.x;
    float _220 = _216.y;
    float _222 = _216.z;
    float3 _613 = float3(_166, _168, _172);
    float3 _224 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_613, float3(0.0), isnan(_613))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_613, float3(0.0), isnan(_613))).xyz;
    float _226 = _224.x;
    float _228 = _224.y;
    float _230 = _224.z;
    float4 _631 = float4(_166, _176, _178, float(int(_96)));
    float4 _633 = select(_631, float4(0.0), isnan(_631));
    float3 _232 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _633.xyz, uint(rint(_633.w))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _633.xyz, uint(rint(_633.w))).xyz;
    float _234 = _232.x;
    float _236 = _232.y;
    float _238 = _232.z;
    float3 _646 = float3(_166, _176, _178);
    float3 _240 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_646, float3(0.0), isnan(_646))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_646, float3(0.0), isnan(_646))).xyz;
    float _242 = _240.x;
    float _244 = _240.y;
    float _246 = _240.z;
    float4 _664 = float4(_190, _180, _182, float(int(_96)));
    float4 _666 = select(_664, float4(0.0), isnan(_664));
    float3 _248 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _666.xyz, uint(rint(_666.w))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _666.xyz, uint(rint(_666.w))).xyz;
    float _250 = _248.x;
    float _252 = _248.y;
    float _254 = _248.z;
    float3 _679 = float3(_190, _180, _182);
    float3 _256 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_679, float3(0.0), isnan(_679))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_679, float3(0.0), isnan(_679))).xyz;
    float _258 = _256.x;
    float _260 = _256.y;
    float _262 = _256.z;
    float4 _697 = float4(_192, _180, _186, float(int(_96)));
    float4 _699 = select(_697, float4(0.0), isnan(_697));
    float3 _264 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _699.xyz, uint(rint(_699.w))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _699.xyz, uint(rint(_699.w))).xyz;
    float _266 = _264.x;
    float _268 = _264.y;
    float _270 = _264.z;
    float3 _712 = float3(_192, _180, _186);
    float3 _272 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_712, float3(0.0), isnan(_712))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_712, float3(0.0), isnan(_712))).xyz;
    float _274 = _272.x;
    float _276 = _272.y;
    float _278 = _272.z;
    float _280 = _122 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _282 = fma(_128, (*spvDescriptorSet0.fp_c3)._m0[0].x, _196);
    float _284 = fma(_130, (*spvDescriptorSet0.fp_c3)._m0[0].x, _280);
    float _286 = _210 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _288 = _212 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _290 = _214 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _292 = _230 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _294 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[0].x, _286);
    float _296 = _226 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _298 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[0].x, _288);
    float _300 = fma(_206, (*spvDescriptorSet0.fp_c3)._m0[0].x, _290);
    float _302 = _228 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _304 = fma(_218, (*spvDescriptorSet0.fp_c3)._m0[0].x, _296);
    float _306 = _242 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _308 = fma(_222, (*spvDescriptorSet0.fp_c3)._m0[0].x, _292);
    float _310 = _246 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _312 = _260 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _314 = fma(_234, (*spvDescriptorSet0.fp_c3)._m0[0].x, _306);
    float _316 = _244 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _318 = _258 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _320 = _262 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _322 = _278 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _324 = fma(_236, (*spvDescriptorSet0.fp_c3)._m0[0].x, _316);
    float _326 = fma(_250, (*spvDescriptorSet0.fp_c3)._m0[0].x, _318);
    float _328 = _274 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _330 = _276 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _332 = fma(_220, (*spvDescriptorSet0.fp_c3)._m0[0].x, _302);
    float _334 = fma(_238, (*spvDescriptorSet0.fp_c3)._m0[0].x, _310);
    float _336 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[0].x, _328);
    float _338 = fma(_268, (*spvDescriptorSet0.fp_c3)._m0[0].x, _330);
    float _340 = fma(_252, (*spvDescriptorSet0.fp_c3)._m0[0].x, _312);
    float _342 = fma(_254, (*spvDescriptorSet0.fp_c3)._m0[0].x, _320);
    float _344 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[0].x, _322);
    out.m_42.x = _198;
    out.m_42.y = _282;
    out.m_42.z = _284;
    out.m_42.w = 1.0;
    out.m_44.x = _294;
    out.m_44.y = _298;
    out.m_44.z = _300;
    out.m_44.w = 1.0;
    out.m_46.x = _304;
    out.m_46.y = _332;
    out.m_46.z = _308;
    out.m_46.w = 1.0;
    out.m_48.x = _314;
    out.m_48.y = _324;
    out.m_48.z = _334;
    out.m_48.w = 1.0;
    out.m_50.x = _326;
    out.m_50.y = _340;
    out.m_50.z = _342;
    out.m_50.w = 1.0;
    out.m_52.x = _336;
    out.m_52.y = _338;
    out.m_52.z = _344;
    out.m_52.w = 1.0;
    return out;
}

