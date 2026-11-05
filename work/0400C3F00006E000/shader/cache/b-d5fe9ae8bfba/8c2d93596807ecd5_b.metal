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
    constant _16* fp_c9 [[id(0)]];
    constant _16* fp_c15 [[id(1)]];
    constant _16* fp_c8 [[id(2)]];
    texture2d_array<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    sampler fp_t_tcb_8Smplr_w [[id(7)]];
    sampler fp_t_tcb_ASmplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_49 [[color(0)]];
};

struct main0_in
{
    float4 m_42 [[user(locn0)]];
    float4 m_44 [[user(locn1)]];
    float4 m_51 [[user(locn2)]];
    float4 m_46 [[user(locn3)]];
    float4 m_40 [[user(locn4)]];
    float4 m_38 [[user(locn5), flat]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _58 = gl_FragCoord.w;
    float _60 = in.m_38.x;
    float _62 = in.m_40.x;
    float _64 = gl_FragCoord.w;
    float _66 = _62 * _64;
    float _68 = in.m_40.y;
    float _70 = gl_FragCoord.w;
    float _72 = _68 * _70;
    float _74 = 1.0 / _58;
    float _76 = rint(_60);
    float _78 = precise::max(_76, 0.0);
    uint _81 = uint(_78);
    uint _83 = clamp(_81, 0u, 65535u);
    float _85 = _74 * _66;
    float _87 = _74 * _72;
    float3 _372 = float3(_85, _87, float(int(_83)));
    float3 _376 = select(_372, float3(0.0), isnan(_372));
    float4 _90 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _376.xy, uint(rint(_376.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _376.xy, uint(rint(_376.z))).xyzw;
    float _92 = _90.x;
    float _94 = _90.y;
    float _96 = _90.z;
    float _98 = _90.w;
    float _100 = in.m_42.w;
    float _102 = gl_FragCoord.w;
    float _104 = _100 * _102;
    float _106 = in.m_44.w;
    float _108 = gl_FragCoord.w;
    float _110 = _106 * _108;
    float _112 = in.m_46.x;
    float _114 = gl_FragCoord.w;
    float _116 = _112 * _114;
    float _118 = _74 * _104;
    float _120 = _74 * _110;
    float _122 = in.m_40.z;
    float _124 = gl_FragCoord.w;
    float _126 = _122 * _124;
    float _128 = _74 * _126;
    float _130 = -_118;
    float _132 = _98 + _130;
    float _134 = _120 * _132;
    float _136 = _74 * _116;
    float _138 = 0.0 + _134;
    float _140 = precise::clamp(_138, 0.0, 1.0);
    float _142 = _140 * _136;
    bool _146 = _142 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _148 = isnan(_142);
    bool _150 = _146 || _148;
    bool _152 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _154 = _150 || _152;
    float _156 = in.m_40.w;
    float _158 = gl_FragCoord.w;
    float _160 = _156 * _158;
    if (!_154)
    {
        discard_fragment();
    }
    float _162 = _74 * _160;
    float2 _478 = float2(_128, _162);
    float3 _166 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_478, float2(0.0), isnan(_478))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_478, float2(0.0), isnan(_478))).xyz;
    float _168 = _166.x;
    float _170 = _166.y;
    float _172 = _166.z;
    float _174 = in.m_42.x;
    float _176 = gl_FragCoord.w;
    float _178 = _174 * _176;
    float _180 = in.m_42.y;
    float _182 = gl_FragCoord.w;
    float _184 = _180 * _182;
    float _186 = in.m_44.x;
    float _188 = gl_FragCoord.w;
    float _190 = _186 * _188;
    float _192 = in.m_44.y;
    float _194 = gl_FragCoord.w;
    float _196 = _192 * _194;
    float _198 = in.m_42.z;
    float _200 = gl_FragCoord.w;
    float _202 = _198 * _200;
    float _204 = in.m_44.z;
    float _206 = gl_FragCoord.w;
    float _208 = _204 * _206;
    float _210 = _74 * _178;
    float _212 = _74 * _190;
    float _214 = _74 * _196;
    float _216 = -_212;
    float _218 = _210 + _216;
    float _220 = _92 * _168;
    float _222 = _94 * _170;
    float _224 = _74 * _184;
    float _226 = _74 * _202;
    float _228 = _74 * _208;
    float _230 = _96 * _172;
    float _232 = -_214;
    float _234 = _224 + _232;
    float _236 = fma(_220, _218, _212);
    float _238 = -_228;
    float _240 = _226 + _238;
    float _242 = fma(_222, _234, _214);
    float _244 = fma(_230, _240, _228);
    if (!_154)
    {
        out.m_49.x = _236;
        out.m_49.y = _242;
        out.m_49.z = _244;
        out.m_49.w = _134;
        return out;
    }
    float _246 = _242 * 0.715200006961822509765625;
    float _248 = 0.0 + _142;
    float _250 = precise::clamp(_248, 0.0, 1.0);
    float _252 = fma(_236, 0.2125999927520751953125, _246);
    bool _254 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _256 = fma(_244, 0.072200000286102294921875, _252);
    float _258 = 1.0 / _256;
    float _260 = _258 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _262 = precise::clamp(_260, 0.0, 1.0);
    float _264 = fma(_262, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _266 = _236 * _264;
    float _268 = _242 * _264;
    float _270 = _244 * _264;
    float _272 = _264;
    if (!_254)
    {
        _272 = _250;
    }
    float _274 = _272;
    bool _276 = !_254;
    float _278 = _274;
    if (!_276)
    {
        float _280 = in.m_51.w;
        float _282 = gl_FragCoord.w;
        float _284 = _280 * _282;
        float _286 = in.m_51.z;
        float _288 = gl_FragCoord.w;
        float _290 = _286 * _288;
        float _292 = _74 * _284;
        float _294 = _74 * _290;
        float _296 = 1.0 / _292;
        float _298 = _294 * _296;
        float _300 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _302 = fma(_298, (*spvDescriptorSet0.fp_c8)._m0[30].w, _300);
        float _304 = 1.0 / _302;
        float _306 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _308 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _310 = fma(_304, _306, _308);
        float _312 = _310 * 8.0;
        float _314 = precise::clamp(_312, 0.0, 1.0);
        float _316 = _250 * _314;
        _278 = _316;
    }
    float _318 = _278;
    float _320 = 0.0 + _318;
    float _322 = precise::clamp(_320, 0.0, 1.0);
    out.m_49.x = _266;
    out.m_49.y = _268;
    out.m_49.z = _270;
    out.m_49.w = _322;
    return out;
}

