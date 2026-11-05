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
    float4 m_53 [[color(0)]];
};

struct main0_in
{
    float4 m_44 [[user(locn0)]];
    float4 m_48 [[user(locn1)]];
    float4 m_50 [[user(locn2)]];
    float4 m_40 [[user(locn3)]];
    float4 m_46 [[user(locn4)]];
    float4 m_42 [[user(locn5), flat]];
    float4 m_57 [[user(locn6)]];
    float4 m_36 [[user(locn7), flat]];
    float4 m_55 [[user(locn9)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _64 = in.m_36.x;
    float _66 = gl_FragCoord.w;
    float _68 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[22].x;
    float _70 = in.m_40.x;
    float _72 = gl_FragCoord.w;
    float _74 = _70 * _72;
    float _76 = in.m_40.y;
    float _78 = gl_FragCoord.w;
    float _80 = _76 * _78;
    float _82 = _64 + 1.0;
    float _84 = 1.0 / _66;
    float _86 = _82 * _68;
    float _88 = floor(_86);
    float _90 = rint(_64);
    float _92 = precise::max(_90, 0.0);
    uint _95 = uint(_92);
    uint _97 = clamp(_95, 0u, 65535u);
    float _99 = _84 * _74;
    float _101 = -_88;
    float _103 = fma(_101, (*spvDescriptorSet0.fp_c9)._m0[22].x, _82);
    float _105 = _84 * _80;
    float _107 = rint(_103);
    float _109 = precise::max(_107, 0.0);
    uint _111 = uint(_109);
    uint _113 = clamp(_111, 0u, 65535u);
    float3 _565 = float3(_99, _105, float(int(_97)));
    float3 _569 = select(_565, float3(0.0), isnan(_565));
    float4 _116 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _569.xy, uint(rint(_569.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _569.xy, uint(rint(_569.z))).xyzw;
    float _118 = _116.x;
    float _120 = _116.y;
    float _122 = _116.z;
    float _124 = _116.w;
    float3 _586 = float3(_99, _105, float(int(_113)));
    float3 _588 = select(_586, float3(0.0), isnan(_586));
    float4 _126 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _588.xy, uint(rint(_588.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _588.xy, uint(rint(_588.z))).xyzw;
    float _128 = _126.x;
    float _130 = _126.y;
    float _132 = _126.z;
    float _134 = _126.w;
    float _136 = in.m_42.y;
    float _138 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[22].y;
    float _140 = in.m_44.w;
    float _142 = gl_FragCoord.w;
    float _144 = _140 * _142;
    float _146 = in.m_46.w;
    float _148 = gl_FragCoord.w;
    float _150 = _146 * _148;
    float _152 = in.m_48.w;
    float _154 = gl_FragCoord.w;
    float _156 = _152 * _154;
    float _158 = in.m_50.x;
    float _160 = gl_FragCoord.w;
    float _162 = _158 * _160;
    float _164 = _136 * _138;
    float _166 = _164 * _138;
    float _168 = floor(_166);
    float _170 = -_168;
    float _172 = fma(_170, (*spvDescriptorSet0.fp_c9)._m0[22].y, _164);
    float _174 = _84 * _156;
    float _176 = _172 + 9.9999997473787516355514526367188e-05;
    float _178 = floor(_176);
    float _180 = -_178;
    float _182 = _176 + _180;
    float _184 = _84 * _144;
    float _186 = -_124;
    float _188 = _186 + _134;
    float _190 = fma(_182, _188, _124);
    float _192 = _84 * _150;
    float _194 = -_184;
    float _196 = fma(_190, _192, _194);
    float _198 = _174 * _196;
    float _200 = _84 * _162;
    float _202 = 0.0 + _198;
    float _204 = precise::clamp(_202, 0.0, 1.0);
    float _206 = _204 * _200;
    bool _210 = _206 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _212 = isnan(_206);
    bool _214 = _210 || _212;
    bool _216 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _218 = _214 || _216;
    float _220 = in.m_40.z;
    float _222 = gl_FragCoord.w;
    float _224 = _220 * _222;
    float _226 = in.m_40.w;
    float _228 = gl_FragCoord.w;
    float _230 = _226 * _228;
    if (!_218)
    {
        discard_fragment();
    }
    float _232 = _84 * _224;
    float _234 = _84 * _230;
    float2 _739 = float2(_232, _234);
    float3 _238 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_739, float2(0.0), isnan(_739))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_739, float2(0.0), isnan(_739))).xyz;
    float _240 = _238.x;
    float _242 = _238.y;
    float _244 = _238.z;
    float _246 = in.m_44.x;
    float _248 = gl_FragCoord.w;
    float _250 = _246 * _248;
    float _252 = in.m_48.x;
    float _254 = gl_FragCoord.w;
    float _256 = _252 * _254;
    float _258 = in.m_44.y;
    float _260 = gl_FragCoord.w;
    float _262 = _258 * _260;
    float _264 = in.m_48.y;
    float _266 = gl_FragCoord.w;
    float _268 = _264 * _266;
    float _270 = in.m_44.z;
    float _272 = gl_FragCoord.w;
    float _274 = _270 * _272;
    float _276 = in.m_48.z;
    float _278 = gl_FragCoord.w;
    float _280 = _276 * _278;
    float _282 = -_120;
    float _284 = _282 + _130;
    float _286 = in.m_46.y;
    float _288 = gl_FragCoord.w;
    float _290 = _286 * _288;
    float _292 = in.m_46.x;
    float _294 = gl_FragCoord.w;
    float _296 = _292 * _294;
    float _298 = in.m_46.z;
    float _300 = gl_FragCoord.w;
    float _302 = _298 * _300;
    float _304 = fma(_182, _284, _120);
    float _306 = -_118;
    float _308 = _306 + _128;
    float _310 = -_122;
    float _312 = _310 + _132;
    float _314 = _304 * _304;
    float _316 = fma(_182, _308, _118);
    float _318 = fma(_182, _312, _122);
    float _320 = _316 * _316;
    float _322 = _318 * _318;
    float _324 = _84 * _256;
    float _326 = _84 * _262;
    float _328 = _84 * _268;
    float _330 = _84 * _274;
    float _332 = _84 * _280;
    float _334 = -_328;
    float _336 = _326 + _334;
    float _338 = _84 * _296;
    float _340 = -_332;
    float _342 = _330 + _340;
    float _344 = _84 * _302;
    float _346 = _242 * _242;
    float _348 = _240 * _240;
    float _350 = _244 * _244;
    float _352 = _314 * _346;
    float _354 = _84 * _250;
    float _356 = _320 * _348;
    float _358 = _322 * _350;
    float _360 = fma(_352, _336, _328);
    float _362 = -_324;
    float _364 = _354 + _362;
    float _366 = _84 * _290;
    float _368 = fma(_356, _364, _324);
    float _370 = fma(_358, _342, _332);
    float _372 = _360 * _366;
    float _374 = _368 * _338;
    float _376 = _370 * _344;
    if (!_218)
    {
        out.m_53.x = _374;
        out.m_53.y = _372;
        out.m_53.z = _376;
        out.m_53.w = _198;
        return out;
    }
    float _378 = _372 * 0.715200006961822509765625;
    float _380 = in.m_55.w;
    float _382 = gl_FragCoord.w;
    float _384 = _380 * _382;
    float _386 = in.m_55.z;
    float _388 = gl_FragCoord.w;
    float _390 = _386 * _388;
    float _392 = in.m_55.x;
    float _394 = gl_FragCoord.w;
    float _396 = _392 * _394;
    float _398 = fma(_374, 0.2125999927520751953125, _378);
    float _400 = in.m_55.y;
    float _402 = gl_FragCoord.w;
    float _404 = _400 * _402;
    float _406 = 0.0 + _206;
    float _408 = precise::clamp(_406, 0.0, 1.0);
    float _410 = fma(_376, 0.072200000286102294921875, _398);
    bool _412 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _414 = 1.0 / _410;
    float _416 = _414 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _418 = precise::clamp(_416, 0.0, 1.0);
    float _420 = _84 * _384;
    float _422 = fma(_418, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _424 = _84 * _390;
    float _426 = _422 * _420;
    float _428 = _84 * _396;
    float _430 = _84 * _404;
    float _432 = fma(_376, _426, _424);
    float _434 = fma(_374, _426, _428);
    float _436 = fma(_372, _426, _430);
    float _438 = _424;
    if (!_412)
    {
        _438 = _408;
    }
    float _440 = _438;
    bool _442 = !_412;
    float _444 = _440;
    if (!_442)
    {
        float _446 = in.m_57.w;
        float _448 = gl_FragCoord.w;
        float _450 = _446 * _448;
        float _452 = in.m_57.z;
        float _454 = gl_FragCoord.w;
        float _456 = _452 * _454;
        float _458 = _84 * _450;
        float _460 = _84 * _456;
        float _462 = 1.0 / _458;
        float _464 = _460 * _462;
        float _466 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _468 = fma(_464, (*spvDescriptorSet0.fp_c8)._m0[30].w, _466);
        float _470 = 1.0 / _468;
        float _472 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _474 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _476 = fma(_470, _472, _474);
        float _478 = _476 * 8.0;
        float _480 = precise::clamp(_478, 0.0, 1.0);
        float _482 = _408 * _480;
        _444 = _482;
    }
    float _484 = _444;
    float _486 = 0.0 + _484;
    float _488 = precise::clamp(_486, 0.0, 1.0);
    out.m_53.x = _434;
    out.m_53.y = _436;
    out.m_53.z = _432;
    out.m_53.w = _488;
    return out;
}

