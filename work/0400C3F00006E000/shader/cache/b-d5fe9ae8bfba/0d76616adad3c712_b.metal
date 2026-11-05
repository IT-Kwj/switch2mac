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
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    sampler fp_t_tcb_8Smplr_w [[id(7)]];
    sampler fp_t_tcb_ASmplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_46 [[color(0)]];
};

struct main0_in
{
    float4 m_37 [[user(locn0)]];
    float4 m_41 [[user(locn1)]];
    float4 m_35 [[user(locn2)]];
    float4 m_50 [[user(locn3)]];
    float4 m_43 [[user(locn4)]];
    float4 m_39 [[user(locn5)]];
    float4 m_48 [[user(locn7)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _57 = gl_FragCoord.w;
    float _59 = in.m_35.x;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = in.m_35.y;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_35.z;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = in.m_35.w;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = 1.0 / _57;
    float _85 = _83 * _63;
    float _87 = _83 * _69;
    float _89 = _83 * _75;
    float _91 = _83 * _81;
    float2 _443 = float2(_85, _87);
    float4 _94 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_443, float2(0.0), isnan(_443))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_443, float2(0.0), isnan(_443))).xyzw;
    float _96 = _94.x;
    float _98 = _94.y;
    float _100 = _94.z;
    float _102 = _94.w;
    float2 _462 = float2(_89, _91);
    float4 _104 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_462, float2(0.0), isnan(_462))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_462, float2(0.0), isnan(_462))).xyzw;
    float _106 = _104.x;
    float _108 = _104.y;
    float _110 = _104.z;
    float _112 = _104.w;
    float _114 = in.m_37.w;
    float _116 = gl_FragCoord.w;
    float _118 = _114 * _116;
    float _120 = in.m_39.w;
    float _122 = gl_FragCoord.w;
    float _124 = _120 * _122;
    float _126 = in.m_41.w;
    float _128 = gl_FragCoord.w;
    float _130 = _126 * _128;
    float _132 = in.m_43.x;
    float _134 = gl_FragCoord.w;
    float _136 = _132 * _134;
    float _138 = _83 * _118;
    float _140 = _83 * _124;
    float _142 = in.m_41.y;
    float _144 = gl_FragCoord.w;
    float _146 = _142 * _144;
    float _148 = in.m_37.z;
    float _150 = gl_FragCoord.w;
    float _152 = _148 * _150;
    float _154 = in.m_41.z;
    float _156 = gl_FragCoord.w;
    float _158 = _154 * _156;
    float _160 = in.m_39.x;
    float _162 = gl_FragCoord.w;
    float _164 = _160 * _162;
    float _166 = in.m_39.y;
    float _168 = gl_FragCoord.w;
    float _170 = _166 * _168;
    float _172 = in.m_39.z;
    float _174 = gl_FragCoord.w;
    float _176 = _172 * _174;
    float _178 = _102 * _112;
    float _180 = -_138;
    float _182 = fma(_178, _140, _180);
    float _184 = _83 * _130;
    float _186 = _182 * 4.0;
    float _188 = precise::clamp(_186, 0.0, 1.0);
    float _190 = _184 * _188;
    float _192 = _83 * _136;
    float _194 = 0.0 + _190;
    float _196 = precise::clamp(_194, 0.0, 1.0);
    float _198 = _196 * _192;
    bool _202 = _198 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _204 = isnan(_198);
    bool _206 = _202 || _204;
    bool _208 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _210 = _206 || _208;
    float _212 = in.m_37.x;
    float _214 = gl_FragCoord.w;
    float _216 = _212 * _214;
    float _218 = in.m_37.y;
    float _220 = gl_FragCoord.w;
    float _222 = _218 * _220;
    float _224 = in.m_41.x;
    float _226 = gl_FragCoord.w;
    float _228 = _224 * _226;
    if (!_210)
    {
        discard_fragment();
    }
    float _230 = _96 * _106;
    float _232 = _98 * _108;
    float _234 = _83 * _146;
    float _236 = _100 * _110;
    float _238 = _83 * _170;
    float _240 = _83 * _216;
    float _242 = _83 * _222;
    float _244 = _83 * _152;
    float _246 = _83 * _158;
    float _248 = _83 * _228;
    float _250 = -_234;
    float _252 = _242 + _250;
    float _254 = -_246;
    float _256 = _244 + _254;
    float _258 = -_248;
    float _260 = _240 + _258;
    float _262 = fma(_232, _252, _234);
    float _264 = _83 * _176;
    float _266 = fma(_236, _256, _246);
    float _268 = fma(_230, _260, _248);
    float _270 = _83 * _164;
    float _272 = _262 * _238;
    float _274 = _266 * _264;
    float _276 = _268 * _270;
    if (!_210)
    {
        out.m_46.x = _276;
        out.m_46.y = _272;
        out.m_46.z = _274;
        out.m_46.w = _190;
        return out;
    }
    float _278 = _272 * 0.715200006961822509765625;
    float _280 = in.m_48.w;
    float _282 = gl_FragCoord.w;
    float _284 = _280 * _282;
    float _286 = in.m_48.z;
    float _288 = gl_FragCoord.w;
    float _290 = _286 * _288;
    float _292 = in.m_48.x;
    float _294 = gl_FragCoord.w;
    float _296 = _292 * _294;
    float _298 = fma(_276, 0.2125999927520751953125, _278);
    float _300 = in.m_48.y;
    float _302 = gl_FragCoord.w;
    float _304 = _300 * _302;
    float _306 = fma(_274, 0.072200000286102294921875, _298);
    bool _308 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _310 = 1.0 / _306;
    float _312 = _310 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _314 = precise::clamp(_312, 0.0, 1.0);
    float _316 = _83 * _284;
    float _318 = fma(_314, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _320 = _83 * _290;
    float _322 = _318 * _316;
    float _324 = 0.0 + _198;
    float _326 = precise::clamp(_324, 0.0, 1.0);
    float _328 = _83 * _296;
    float _330 = _83 * _304;
    float _332 = fma(_274, _322, _320);
    float _334 = fma(_276, _322, _328);
    float _336 = fma(_272, _322, _330);
    float _338 = _320;
    if (!_308)
    {
        _338 = _326;
    }
    float _340 = _338;
    bool _342 = !_308;
    float _344 = _340;
    if (!_342)
    {
        float _346 = in.m_50.w;
        float _348 = gl_FragCoord.w;
        float _350 = _346 * _348;
        float _352 = in.m_50.z;
        float _354 = gl_FragCoord.w;
        float _356 = _352 * _354;
        float _358 = _83 * _350;
        float _360 = _83 * _356;
        float _362 = 1.0 / _358;
        float _364 = _360 * _362;
        float _366 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _368 = fma(_364, (*spvDescriptorSet0.fp_c8)._m0[30].w, _366);
        float _370 = 1.0 / _368;
        float _372 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _374 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _376 = fma(_370, _372, _374);
        float _378 = _376 * 8.0;
        float _380 = precise::clamp(_378, 0.0, 1.0);
        float _382 = _326 * _380;
        _344 = _382;
    }
    float _384 = _344;
    float _386 = 0.0 + _384;
    float _388 = precise::clamp(_386, 0.0, 1.0);
    out.m_46.x = _334;
    out.m_46.y = _336;
    out.m_46.z = _332;
    out.m_46.w = _388;
    return out;
}

