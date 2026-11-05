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
    float4 m_53 [[user(locn2)]];
    float4 m_46 [[user(locn3)]];
    float4 m_40 [[user(locn4)]];
    float4 m_38 [[user(locn5), flat]];
    float4 m_51 [[user(locn7)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _60 = gl_FragCoord.w;
    float _62 = in.m_38.x;
    float _64 = in.m_40.x;
    float _66 = gl_FragCoord.w;
    float _68 = _64 * _66;
    float _70 = in.m_40.y;
    float _72 = gl_FragCoord.w;
    float _74 = _70 * _72;
    float _76 = 1.0 / _60;
    float _78 = rint(_62);
    float _80 = precise::max(_78, 0.0);
    uint _83 = uint(_80);
    uint _85 = clamp(_83, 0u, 65535u);
    float _87 = _76 * _68;
    float _89 = _76 * _74;
    float3 _408 = float3(_87, _89, float(int(_85)));
    float3 _412 = select(_408, float3(0.0), isnan(_408));
    float4 _92 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _412.xy, uint(rint(_412.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _412.xy, uint(rint(_412.z))).xyzw;
    float _94 = _92.x;
    float _96 = _92.y;
    float _98 = _92.z;
    float _100 = _92.w;
    float _102 = in.m_42.w;
    float _104 = gl_FragCoord.w;
    float _106 = _102 * _104;
    float _108 = in.m_44.w;
    float _110 = gl_FragCoord.w;
    float _112 = _108 * _110;
    float _114 = in.m_46.x;
    float _116 = gl_FragCoord.w;
    float _118 = _114 * _116;
    float _120 = _76 * _106;
    float _122 = _76 * _112;
    float _124 = in.m_40.z;
    float _126 = gl_FragCoord.w;
    float _128 = _124 * _126;
    float _130 = _76 * _128;
    float _132 = -_120;
    float _134 = _100 + _132;
    float _136 = _122 * _134;
    float _138 = _76 * _118;
    float _140 = 0.0 + _136;
    float _142 = precise::clamp(_140, 0.0, 1.0);
    float _144 = _142 * _138;
    bool _148 = _144 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _150 = isnan(_144);
    bool _152 = _148 || _150;
    bool _154 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _156 = _152 || _154;
    float _158 = in.m_40.w;
    float _160 = gl_FragCoord.w;
    float _162 = _158 * _160;
    if (!_156)
    {
        discard_fragment();
    }
    float _164 = _76 * _162;
    float2 _514 = float2(_130, _164);
    float3 _168 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_514, float2(0.0), isnan(_514))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_514, float2(0.0), isnan(_514))).xyz;
    float _170 = _168.x;
    float _172 = _168.y;
    float _174 = _168.z;
    float _176 = in.m_42.x;
    float _178 = gl_FragCoord.w;
    float _180 = _176 * _178;
    float _182 = in.m_42.y;
    float _184 = gl_FragCoord.w;
    float _186 = _182 * _184;
    float _188 = in.m_44.x;
    float _190 = gl_FragCoord.w;
    float _192 = _188 * _190;
    float _194 = in.m_44.y;
    float _196 = gl_FragCoord.w;
    float _198 = _194 * _196;
    float _200 = in.m_42.z;
    float _202 = gl_FragCoord.w;
    float _204 = _200 * _202;
    float _206 = in.m_44.z;
    float _208 = gl_FragCoord.w;
    float _210 = _206 * _208;
    float _212 = _76 * _180;
    float _214 = _76 * _192;
    float _216 = _76 * _198;
    float _218 = -_214;
    float _220 = _212 + _218;
    float _222 = _94 * _170;
    float _224 = _96 * _172;
    float _226 = _76 * _186;
    float _228 = _76 * _204;
    float _230 = _76 * _210;
    float _232 = _98 * _174;
    float _234 = -_216;
    float _236 = _226 + _234;
    float _238 = fma(_222, _220, _214);
    float _240 = -_230;
    float _242 = _228 + _240;
    float _244 = fma(_224, _236, _216);
    float _246 = fma(_232, _242, _230);
    if (!_156)
    {
        out.m_49.x = _238;
        out.m_49.y = _244;
        out.m_49.z = _246;
        out.m_49.w = _136;
        return out;
    }
    float _248 = _244 * 0.715200006961822509765625;
    float _250 = in.m_51.w;
    float _252 = gl_FragCoord.w;
    float _254 = _250 * _252;
    float _256 = in.m_51.z;
    float _258 = gl_FragCoord.w;
    float _260 = _256 * _258;
    float _262 = in.m_51.x;
    float _264 = gl_FragCoord.w;
    float _266 = _262 * _264;
    float _268 = fma(_238, 0.2125999927520751953125, _248);
    float _270 = in.m_51.y;
    float _272 = gl_FragCoord.w;
    float _274 = _270 * _272;
    float _276 = 0.0 + _144;
    float _278 = precise::clamp(_276, 0.0, 1.0);
    float _280 = fma(_246, 0.072200000286102294921875, _268);
    bool _282 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _284 = 1.0 / _280;
    float _286 = _284 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _288 = precise::clamp(_286, 0.0, 1.0);
    float _290 = _76 * _254;
    float _292 = fma(_288, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _294 = _76 * _260;
    float _296 = _292 * _290;
    float _298 = _76 * _266;
    float _300 = _76 * _274;
    float _302 = fma(_246, _296, _294);
    float _304 = fma(_238, _296, _298);
    float _306 = fma(_244, _296, _300);
    float _308 = _294;
    if (!_282)
    {
        _308 = _278;
    }
    float _310 = _308;
    bool _312 = !_282;
    float _314 = _310;
    if (!_312)
    {
        float _316 = in.m_53.w;
        float _318 = gl_FragCoord.w;
        float _320 = _316 * _318;
        float _322 = in.m_53.z;
        float _324 = gl_FragCoord.w;
        float _326 = _322 * _324;
        float _328 = _76 * _320;
        float _330 = _76 * _326;
        float _332 = 1.0 / _328;
        float _334 = _330 * _332;
        float _336 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _338 = fma(_334, (*spvDescriptorSet0.fp_c8)._m0[30].w, _336);
        float _340 = 1.0 / _338;
        float _342 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _344 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _346 = fma(_340, _342, _344);
        float _348 = _346 * 8.0;
        float _350 = precise::clamp(_348, 0.0, 1.0);
        float _352 = _278 * _350;
        _314 = _352;
    }
    float _354 = _314;
    float _356 = 0.0 + _354;
    float _358 = precise::clamp(_356, 0.0, 1.0);
    out.m_49.x = _304;
    out.m_49.y = _306;
    out.m_49.z = _302;
    out.m_49.w = _358;
    return out;
}

