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
    float2 _451 = float2(_85, _87);
    float4 _94 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_451, float2(0.0), isnan(_451))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_451, float2(0.0), isnan(_451))).xyzw;
    float _96 = _94.x;
    float _98 = _94.y;
    float _100 = _94.z;
    float _102 = _94.w;
    float2 _470 = float2(_89, _91);
    float4 _104 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_470, float2(0.0), isnan(_470))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_470, float2(0.0), isnan(_470))).xyzw;
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
    float _142 = _83 * _130;
    float _144 = in.m_37.x;
    float _146 = gl_FragCoord.w;
    float _148 = _144 * _146;
    float _150 = in.m_37.y;
    float _152 = gl_FragCoord.w;
    float _154 = _150 * _152;
    float _156 = in.m_41.y;
    float _158 = gl_FragCoord.w;
    float _160 = _156 * _158;
    float _162 = in.m_41.x;
    float _164 = gl_FragCoord.w;
    float _166 = _162 * _164;
    float _168 = in.m_37.z;
    float _170 = gl_FragCoord.w;
    float _172 = _168 * _170;
    float _174 = in.m_41.z;
    float _176 = gl_FragCoord.w;
    float _178 = _174 * _176;
    float _180 = in.m_39.x;
    float _182 = gl_FragCoord.w;
    float _184 = _180 * _182;
    float _186 = _83 * _184;
    float _188 = _102 * _112;
    float _190 = -_138;
    float _192 = fma(_188, _140, _190);
    float _194 = _142 * _192;
    float _196 = _83 * _136;
    float _198 = 0.0 + _194;
    float _200 = precise::clamp(_198, 0.0, 1.0);
    float _202 = _200 * _196;
    bool _206 = _202 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _208 = isnan(_202);
    bool _210 = _206 || _208;
    bool _212 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _214 = _210 || _212;
    float _216 = in.m_39.y;
    float _218 = gl_FragCoord.w;
    float _220 = _216 * _218;
    float _222 = in.m_39.z;
    float _224 = gl_FragCoord.w;
    float _226 = _222 * _224;
    if (!_214)
    {
        discard_fragment();
    }
    float _228 = _98 * _98;
    float _230 = _108 * _108;
    float _232 = _96 * _96;
    float _234 = _106 * _106;
    float _236 = _83 * _148;
    float _238 = _228 * _230;
    float _240 = _83 * _154;
    float _242 = _232 * _234;
    float _244 = _110 * _110;
    float _246 = _83 * _160;
    float _248 = _83 * _166;
    float _250 = _100 * _100;
    float _252 = _83 * _172;
    float _254 = _83 * _178;
    float _256 = -_246;
    float _258 = _240 + _256;
    float _260 = _250 * _244;
    float _262 = -_248;
    float _264 = _236 + _262;
    float _266 = -_254;
    float _268 = _252 + _266;
    float _270 = fma(_238, _258, _246);
    float _272 = _83 * _220;
    float _274 = fma(_242, _264, _248);
    float _276 = fma(_260, _268, _254);
    float _278 = _83 * _226;
    float _280 = _270 * _272;
    float _282 = _274 * _186;
    float _284 = _276 * _278;
    if (!_214)
    {
        out.m_46.x = _282;
        out.m_46.y = _280;
        out.m_46.z = _284;
        out.m_46.w = _194;
        return out;
    }
    float _286 = _280 * 0.715200006961822509765625;
    float _288 = in.m_48.w;
    float _290 = gl_FragCoord.w;
    float _292 = _288 * _290;
    float _294 = in.m_48.z;
    float _296 = gl_FragCoord.w;
    float _298 = _294 * _296;
    float _300 = in.m_48.x;
    float _302 = gl_FragCoord.w;
    float _304 = _300 * _302;
    float _306 = fma(_282, 0.2125999927520751953125, _286);
    float _308 = in.m_48.y;
    float _310 = gl_FragCoord.w;
    float _312 = _308 * _310;
    float _314 = fma(_284, 0.072200000286102294921875, _306);
    bool _316 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _318 = 1.0 / _314;
    float _320 = _318 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _322 = precise::clamp(_320, 0.0, 1.0);
    float _324 = _83 * _292;
    float _326 = fma(_322, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _328 = _83 * _298;
    float _330 = _326 * _324;
    float _332 = 0.0 + _202;
    float _334 = precise::clamp(_332, 0.0, 1.0);
    float _336 = _83 * _304;
    float _338 = _83 * _312;
    float _340 = fma(_284, _330, _328);
    float _342 = fma(_282, _330, _336);
    float _344 = fma(_280, _330, _338);
    float _346 = _328;
    if (!_316)
    {
        _346 = _334;
    }
    float _348 = _346;
    bool _350 = !_316;
    float _352 = _348;
    if (!_350)
    {
        float _354 = in.m_50.w;
        float _356 = gl_FragCoord.w;
        float _358 = _354 * _356;
        float _360 = in.m_50.z;
        float _362 = gl_FragCoord.w;
        float _364 = _360 * _362;
        float _366 = _83 * _358;
        float _368 = _83 * _364;
        float _370 = 1.0 / _366;
        float _372 = _368 * _370;
        float _374 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _376 = fma(_372, (*spvDescriptorSet0.fp_c8)._m0[30].w, _374);
        float _378 = 1.0 / _376;
        float _380 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _382 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _384 = fma(_378, _380, _382);
        float _386 = _384 * 8.0;
        float _388 = precise::clamp(_386, 0.0, 1.0);
        float _390 = _334 * _388;
        _352 = _390;
    }
    float _392 = _352;
    float _394 = 0.0 + _392;
    float _396 = precise::clamp(_394, 0.0, 1.0);
    out.m_46.x = _342;
    out.m_46.y = _344;
    out.m_46.z = _340;
    out.m_46.w = _396;
    return out;
}

