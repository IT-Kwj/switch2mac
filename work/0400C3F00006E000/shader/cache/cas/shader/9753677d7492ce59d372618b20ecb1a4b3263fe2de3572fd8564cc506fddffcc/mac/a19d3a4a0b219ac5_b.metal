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
    sampler fp_t_tcb_8Smplr_w [[id(5)]];
    constant dm_border_t* dm_border [[id(6)]];
};

struct main0_out
{
    float4 m_48 [[color(0)]];
};

struct main0_in
{
    float4 m_41 [[user(locn0)]];
    float4 m_45 [[user(locn1)]];
    float4 m_35 [[user(locn2)]];
    float4 m_50 [[user(locn3)]];
    float4 m_43 [[user(locn4)]];
    float4 m_39 [[user(locn5)]];
    float4 m_33 [[user(locn6)]];
    float4 m_37 [[user(locn7)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _57 = gl_FragCoord.w;
    float _59 = in.m_33.x;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = in.m_33.y;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = 1.0 / _57;
    float _73 = _71 * _63;
    float _75 = _71 * _69;
    float2 _432 = float2(_73, _75);
    float4 _78 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_432, float2(0.0), isnan(_432))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_432, float2(0.0), isnan(_432))).xyzw;
    float _80 = _78.x;
    float _82 = _78.y;
    float _84 = _78.z;
    float _86 = _78.w;
    float _88 = in.m_35.y;
    float _90 = gl_FragCoord.w;
    float _92 = _88 * _90;
    float _94 = in.m_35.x;
    float _96 = gl_FragCoord.w;
    float _98 = _94 * _96;
    float _100 = in.m_35.z;
    float _102 = gl_FragCoord.w;
    float _104 = _100 * _102;
    float _106 = in.m_37.y;
    float _108 = gl_FragCoord.w;
    float _110 = _106 * _108;
    float _112 = in.m_37.x;
    float _114 = gl_FragCoord.w;
    float _116 = _112 * _114;
    float _118 = in.m_37.z;
    float _120 = gl_FragCoord.w;
    float _122 = _118 * _120;
    float _124 = in.m_39.w;
    float _126 = gl_FragCoord.w;
    float _128 = _124 * _126;
    float _130 = _71 * _92;
    float _132 = _71 * _98;
    float _134 = _71 * _104;
    float _136 = _130 * _130;
    float _138 = fma(_132, _132, _136);
    float _140 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _142 = _140 + (*spvDescriptorSet0.fp_c9)._m0[139].w;
    float _144 = fma(_134, _134, _138);
    float _146 = _71 * _110;
    float _148 = in.m_41.w;
    float _150 = gl_FragCoord.w;
    float _152 = _148 * _150;
    float _154 = rsqrt(_144);
    float _156 = 1.0 / _142;
    float _158 = in.m_43.x;
    float _160 = gl_FragCoord.w;
    float _162 = _158 * _160;
    float _164 = _130 * _154;
    float _166 = _132 * _154;
    float _168 = _134 * _154;
    float _170 = _146 * _164;
    float _172 = _71 * _116;
    float _174 = fma(_172, _166, _170);
    float _176 = _71 * _122;
    float _178 = fma(_176, _168, _174);
    float _180 = abs(_178);
    float _182 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _184 = _180 + _182;
    float _186 = _184 * _156;
    float _188 = precise::clamp(_186, 0.0, 1.0);
    float _190 = _71 * _162;
    float _192 = fma(_188, -2.0, 3.0);
    float _194 = _188 * _188;
    float _196 = _71 * _128;
    float _198 = _192 * _194;
    float _200 = in.m_45.x;
    float _202 = gl_FragCoord.w;
    float _204 = _200 * _202;
    float _206 = in.m_41.y;
    float _208 = gl_FragCoord.w;
    float _210 = _206 * _208;
    float _212 = in.m_45.y;
    float _214 = gl_FragCoord.w;
    float _216 = _212 * _214;
    float _218 = in.m_45.z;
    float _220 = gl_FragCoord.w;
    float _222 = _218 * _220;
    float _224 = in.m_39.x;
    float _226 = gl_FragCoord.w;
    float _228 = _224 * _226;
    float _230 = in.m_39.y;
    float _232 = gl_FragCoord.w;
    float _234 = _230 * _232;
    float _236 = in.m_39.z;
    float _238 = gl_FragCoord.w;
    float _240 = _236 * _238;
    float _242 = _71 * _204;
    float _244 = _71 * _216;
    float _246 = _86 * _196;
    float _248 = _71 * _152;
    float _250 = _248 * _246;
    float _252 = 0.0 + _250;
    float _254 = precise::clamp(_252, 0.0, 1.0);
    float _256 = _254 * _198;
    float _258 = _256 * _190;
    bool _262 = _258 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _264 = isnan(_258);
    bool _266 = _262 || _264;
    bool _268 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _270 = _266 || _268;
    float _272 = in.m_41.x;
    float _274 = gl_FragCoord.w;
    float _276 = _272 * _274;
    float _278 = in.m_41.z;
    float _280 = gl_FragCoord.w;
    float _282 = _278 * _280;
    if (!_270)
    {
        discard_fragment();
    }
    float _284 = _71 * _276;
    float _286 = _71 * _210;
    float _288 = _71 * _282;
    float _290 = _71 * _222;
    float _292 = -_242;
    float _294 = _284 + _292;
    float _296 = -_244;
    float _298 = _286 + _296;
    float _300 = -_290;
    float _302 = _288 + _300;
    float _304 = fma(_80, _294, _242);
    float _306 = fma(_82, _298, _244);
    float _308 = _71 * _228;
    float _310 = fma(_84, _302, _290);
    float _312 = _71 * _234;
    float _314 = _71 * _240;
    float _316 = _304 * _308;
    float _318 = _306 * _312;
    float _320 = _310 * _314;
    if (!_270)
    {
        out.m_48.x = _316;
        out.m_48.y = _318;
        out.m_48.z = _320;
        out.m_48.w = _250;
        return out;
    }
    float _322 = _318 * 0.715200006961822509765625;
    float _324 = 0.0 + _258;
    float _326 = precise::clamp(_324, 0.0, 1.0);
    float _328 = fma(_316, 0.2125999927520751953125, _322);
    bool _330 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _332 = fma(_320, 0.072200000286102294921875, _328);
    float _334 = 1.0 / _332;
    float _336 = _334 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _338 = precise::clamp(_336, 0.0, 1.0);
    float _340 = fma(_338, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _342 = _316 * _340;
    float _344 = _318 * _340;
    float _346 = _320 * _340;
    float _348 = _340;
    if (!_330)
    {
        _348 = _326;
    }
    float _350 = _348;
    bool _352 = !_330;
    float _354 = _350;
    if (!_352)
    {
        float _356 = in.m_50.w;
        float _358 = gl_FragCoord.w;
        float _360 = _356 * _358;
        float _362 = in.m_50.z;
        float _364 = gl_FragCoord.w;
        float _366 = _362 * _364;
        float _368 = _71 * _360;
        float _370 = _71 * _366;
        float _372 = 1.0 / _368;
        float _374 = _370 * _372;
        float _376 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _378 = fma(_374, (*spvDescriptorSet0.fp_c8)._m0[30].w, _376);
        float _380 = 1.0 / _378;
        float _382 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _384 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _386 = fma(_380, _382, _384);
        float _388 = _386 * 8.0;
        float _390 = precise::clamp(_388, 0.0, 1.0);
        float _392 = _326 * _390;
        _354 = _392;
    }
    float _394 = _354;
    float _396 = 0.0 + _394;
    float _398 = precise::clamp(_396, 0.0, 1.0);
    out.m_48.x = _342;
    out.m_48.y = _344;
    out.m_48.z = _346;
    out.m_48.w = _398;
    return out;
}

