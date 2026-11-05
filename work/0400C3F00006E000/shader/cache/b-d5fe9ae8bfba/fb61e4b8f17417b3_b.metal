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
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    sampler fp_t_tcb_ASmplr_w [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_44 [[color(0)]];
};

struct main0_in
{
    float4 m_37 [[user(locn0)]];
    float4 m_39 [[user(locn1)]];
    float4 m_46 [[user(locn2)]];
    float4 m_41 [[user(locn3)]];
    float4 m_35 [[user(locn4)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _53 = gl_FragCoord.w;
    float _55 = in.m_35.z;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = in.m_35.w;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = in.m_35.x;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = in.m_35.y;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = 1.0 / _53;
    float _81 = _79 * _59;
    float _83 = _79 * _65;
    float _85 = _79 * _71;
    float _87 = _79 * _77;
    float2 _387 = float2(_81, _83);
    float4 _90 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_387, float2(0.0), isnan(_387))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_387, float2(0.0), isnan(_387))).xyzw;
    float _92 = _90.x;
    float _94 = _90.y;
    float _96 = _90.z;
    float _98 = _90.w;
    float2 _406 = float2(_85, _87);
    float4 _100 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_406, float2(0.0), isnan(_406))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_406, float2(0.0), isnan(_406))).xyzw;
    float _102 = _100.x;
    float _104 = _100.y;
    float _106 = _100.z;
    float _108 = _100.w;
    float _110 = in.m_37.w;
    float _112 = gl_FragCoord.w;
    float _114 = _110 * _112;
    float _116 = in.m_39.w;
    float _118 = gl_FragCoord.w;
    float _120 = _116 * _118;
    float _122 = in.m_41.x;
    float _124 = gl_FragCoord.w;
    float _126 = _122 * _124;
    float _128 = _79 * _114;
    float _130 = _79 * _126;
    float _132 = in.m_37.y;
    float _134 = gl_FragCoord.w;
    float _136 = _132 * _134;
    float _138 = in.m_39.x;
    float _140 = gl_FragCoord.w;
    float _142 = _138 * _140;
    float _144 = in.m_39.y;
    float _146 = gl_FragCoord.w;
    float _148 = _144 * _146;
    float _150 = in.m_39.z;
    float _152 = gl_FragCoord.w;
    float _154 = _150 * _152;
    float _156 = _79 * _136;
    float _158 = -_98;
    float _160 = _158 + 1.0;
    float _162 = _79 * _120;
    float _164 = -_128;
    float _166 = fma(_108, _160, _164);
    float _168 = _166 * 4.0;
    float _170 = precise::clamp(_168, 0.0, 1.0);
    float _172 = _162 * _170;
    float _174 = 0.0 + _172;
    float _176 = precise::clamp(_174, 0.0, 1.0);
    float _178 = _176 * _130;
    bool _182 = _178 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _184 = isnan(_178);
    bool _186 = _182 || _184;
    bool _188 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _190 = _186 || _188;
    float _192 = in.m_37.z;
    float _194 = gl_FragCoord.w;
    float _196 = _192 * _194;
    float _198 = in.m_37.x;
    float _200 = gl_FragCoord.w;
    float _202 = _198 * _200;
    if (!_190)
    {
        discard_fragment();
    }
    float _204 = -_92;
    float _206 = _204 + 1.0;
    float _208 = -_94;
    float _210 = _208 + 1.0;
    float _212 = _102 * _102;
    float _214 = _104 * _104;
    float _216 = _106 * _106;
    float _218 = _79 * _142;
    float _220 = _212 * _206;
    float _222 = _214 * _210;
    float _224 = -_96;
    float _226 = _224 + 1.0;
    float _228 = _79 * _148;
    float _230 = _216 * _226;
    float _232 = -_228;
    float _234 = _156 + _232;
    float _236 = _79 * _196;
    float _238 = _79 * _202;
    float _240 = _79 * _154;
    float _242 = fma(_222, _234, _228);
    float _244 = -_218;
    float _246 = _238 + _244;
    float _248 = -_240;
    float _250 = _236 + _248;
    float _252 = fma(_220, _246, _218);
    float _254 = fma(_230, _250, _240);
    if (!_190)
    {
        out.m_44.x = _252;
        out.m_44.y = _242;
        out.m_44.z = _254;
        out.m_44.w = _172;
        return out;
    }
    float _256 = _242 * 0.715200006961822509765625;
    float _258 = 0.0 + _178;
    float _260 = precise::clamp(_258, 0.0, 1.0);
    float _262 = fma(_252, 0.2125999927520751953125, _256);
    bool _264 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _266 = fma(_254, 0.072200000286102294921875, _262);
    float _268 = 1.0 / _266;
    float _270 = _268 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _272 = precise::clamp(_270, 0.0, 1.0);
    float _274 = fma(_272, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _276 = _252 * _274;
    float _278 = _242 * _274;
    float _280 = _254 * _274;
    float _282 = _274;
    if (!_264)
    {
        _282 = _260;
    }
    float _284 = _282;
    bool _286 = !_264;
    float _288 = _284;
    if (!_286)
    {
        float _290 = in.m_46.w;
        float _292 = gl_FragCoord.w;
        float _294 = _290 * _292;
        float _296 = in.m_46.z;
        float _298 = gl_FragCoord.w;
        float _300 = _296 * _298;
        float _302 = _79 * _294;
        float _304 = _79 * _300;
        float _306 = 1.0 / _302;
        float _308 = _304 * _306;
        float _310 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _312 = fma(_308, (*spvDescriptorSet0.fp_c8)._m0[30].w, _310);
        float _314 = 1.0 / _312;
        float _316 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _318 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _320 = fma(_314, _316, _318);
        float _322 = _320 * 8.0;
        float _324 = precise::clamp(_322, 0.0, 1.0);
        float _326 = _260 * _324;
        _288 = _326;
    }
    float _328 = _288;
    float _330 = 0.0 + _328;
    float _332 = precise::clamp(_330, 0.0, 1.0);
    out.m_44.x = _276;
    out.m_44.y = _278;
    out.m_44.z = _280;
    out.m_44.w = _332;
    return out;
}

