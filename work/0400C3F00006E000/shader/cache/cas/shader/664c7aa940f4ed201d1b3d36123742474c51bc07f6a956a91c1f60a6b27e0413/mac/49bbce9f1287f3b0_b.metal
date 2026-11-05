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
    texture2d_array<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    sampler fp_t_tcb_ASmplr_w [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_51 [[color(0)]];
};

struct main0_in
{
    float4 m_46 [[user(locn0)]];
    float4 m_48 [[user(locn1)]];
    float4 m_40 [[user(locn2)]];
    float4 m_55 [[user(locn3)]];
    float4 m_44 [[user(locn4)]];
    float4 m_42 [[user(locn5), flat]];
    float4 m_36 [[user(locn6), flat]];
    float4 m_53 [[user(locn8)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _62 = in.m_36.y;
    float _64 = gl_FragCoord.w;
    float _66 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[31].x;
    float _68 = in.m_40.z;
    float _70 = gl_FragCoord.w;
    float _72 = _68 * _70;
    float _74 = in.m_40.w;
    float _76 = gl_FragCoord.w;
    float _78 = _74 * _76;
    float _80 = in.m_40.x;
    float _82 = gl_FragCoord.w;
    float _84 = _80 * _82;
    float _86 = in.m_40.y;
    float _88 = gl_FragCoord.w;
    float _90 = _86 * _88;
    float _92 = _62 + 1.0;
    float _94 = 1.0 / _64;
    float _96 = _92 * _66;
    float _98 = rint(_62);
    float _100 = precise::max(_98, 0.0);
    uint _103 = uint(_100);
    uint _105 = clamp(_103, 0u, 65535u);
    float _107 = floor(_96);
    float _109 = _94 * _72;
    float _111 = _94 * _84;
    float _113 = _94 * _90;
    float _115 = -_107;
    float _117 = fma(_115, (*spvDescriptorSet0.fp_c9)._m0[31].x, _92);
    float _119 = _94 * _78;
    float _121 = rint(_117);
    float _123 = precise::max(_121, 0.0);
    uint _125 = uint(_123);
    uint _127 = clamp(_125, 0u, 65535u);
    float3 _547 = float3(_109, _119, float(int(_105)));
    float3 _551 = select(_547, float3(0.0), isnan(_547));
    float4 _130 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _551.xy, uint(rint(_551.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _551.xy, uint(rint(_551.z))).xyzw;
    float _132 = _130.x;
    float _134 = _130.y;
    float _136 = _130.z;
    float _138 = _130.w;
    float3 _568 = float3(_109, _119, float(int(_127)));
    float3 _570 = select(_568, float3(0.0), isnan(_568));
    float4 _140 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _570.xy, uint(rint(_570.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _570.xy, uint(rint(_570.z))).xyzw;
    float _142 = _140.x;
    float _144 = _140.y;
    float _146 = _140.z;
    float _148 = _140.w;
    float2 _585 = float2(_111, _113);
    float4 _150 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_585, float2(0.0), isnan(_585))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_585, float2(0.0), isnan(_585))).xyzw;
    float _152 = _150.x;
    float _154 = _150.y;
    float _156 = _150.z;
    float _158 = _150.w;
    float _160 = in.m_42.y;
    float _162 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[31].y;
    float _164 = in.m_44.x;
    float _166 = gl_FragCoord.w;
    float _168 = _164 * _166;
    float _170 = _160 * _162;
    float _172 = _170 * _162;
    float _174 = in.m_46.w;
    float _176 = gl_FragCoord.w;
    float _178 = _174 * _176;
    float _180 = floor(_172);
    float _182 = -_180;
    float _184 = fma(_182, (*spvDescriptorSet0.fp_c9)._m0[31].y, _170);
    float _186 = in.m_48.w;
    float _188 = gl_FragCoord.w;
    float _190 = _186 * _188;
    float _192 = _184 + 9.9999997473787516355514526367188e-05;
    float _194 = floor(_192);
    float _196 = _94 * _178;
    float _198 = -_194;
    float _200 = _192 + _198;
    float _202 = _94 * _190;
    float _204 = in.m_48.y;
    float _206 = gl_FragCoord.w;
    float _208 = _204 * _206;
    float _210 = in.m_48.z;
    float _212 = gl_FragCoord.w;
    float _214 = _210 * _212;
    float _216 = -_138;
    float _218 = _216 + _148;
    float _220 = fma(_200, _218, _138);
    float _222 = -_196;
    float _224 = fma(_158, _220, _222);
    float _226 = _202 * _224;
    float _228 = _94 * _168;
    float _230 = 0.0 + _226;
    float _232 = precise::clamp(_230, 0.0, 1.0);
    float _234 = _232 * _228;
    bool _238 = _234 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _240 = isnan(_234);
    bool _242 = _238 || _240;
    bool _244 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _246 = _242 || _244;
    float _248 = in.m_46.x;
    float _250 = gl_FragCoord.w;
    float _252 = _248 * _250;
    float _254 = in.m_48.x;
    float _256 = gl_FragCoord.w;
    float _258 = _254 * _256;
    float _260 = in.m_46.y;
    float _262 = gl_FragCoord.w;
    float _264 = _260 * _262;
    float _266 = in.m_46.z;
    float _268 = gl_FragCoord.w;
    float _270 = _266 * _268;
    if (!_246)
    {
        discard_fragment();
    }
    float _272 = -_134;
    float _274 = _272 + _144;
    float _276 = -_132;
    float _278 = _276 + _142;
    float _280 = -_136;
    float _282 = _280 + _146;
    float _284 = _154 * _154;
    float _286 = fma(_200, _274, _134);
    float _288 = fma(_200, _278, _132);
    float _290 = fma(_200, _282, _136);
    float _292 = _156 * _156;
    float _294 = _286 * _286;
    float _296 = _288 * _288;
    float _298 = _290 * _290;
    float _300 = _152 * _152;
    float _302 = _284 * _294;
    float _304 = _94 * _208;
    float _306 = _292 * _298;
    float _308 = _94 * _252;
    float _310 = _94 * _258;
    float _312 = _94 * _264;
    float _314 = _94 * _270;
    float _316 = _94 * _214;
    float _318 = _300 * _296;
    float _320 = -_310;
    float _322 = _308 + _320;
    float _324 = -_304;
    float _326 = _312 + _324;
    float _328 = -_316;
    float _330 = _314 + _328;
    float _332 = fma(_318, _322, _310);
    float _334 = fma(_302, _326, _304);
    float _336 = fma(_306, _330, _316);
    if (!_246)
    {
        out.m_51.x = _332;
        out.m_51.y = _334;
        out.m_51.z = _336;
        out.m_51.w = _226;
        return out;
    }
    float _338 = _334 * 0.715200006961822509765625;
    float _340 = in.m_53.w;
    float _342 = gl_FragCoord.w;
    float _344 = _340 * _342;
    float _346 = in.m_53.z;
    float _348 = gl_FragCoord.w;
    float _350 = _346 * _348;
    float _352 = in.m_53.x;
    float _354 = gl_FragCoord.w;
    float _356 = _352 * _354;
    float _358 = fma(_332, 0.2125999927520751953125, _338);
    float _360 = in.m_53.y;
    float _362 = gl_FragCoord.w;
    float _364 = _360 * _362;
    float _366 = fma(_336, 0.072200000286102294921875, _358);
    bool _368 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _370 = 1.0 / _366;
    float _372 = _370 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _374 = precise::clamp(_372, 0.0, 1.0);
    float _376 = _94 * _344;
    float _378 = fma(_374, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _380 = _94 * _350;
    float _382 = _378 * _376;
    float _384 = 0.0 + _234;
    float _386 = precise::clamp(_384, 0.0, 1.0);
    float _388 = _94 * _356;
    float _390 = _94 * _364;
    float _392 = fma(_336, _382, _380);
    float _394 = fma(_332, _382, _388);
    float _396 = fma(_334, _382, _390);
    float _398 = _380;
    if (!_368)
    {
        _398 = _386;
    }
    float _400 = _398;
    bool _402 = !_368;
    float _404 = _400;
    if (!_402)
    {
        float _406 = in.m_55.w;
        float _408 = gl_FragCoord.w;
        float _410 = _406 * _408;
        float _412 = in.m_55.z;
        float _414 = gl_FragCoord.w;
        float _416 = _412 * _414;
        float _418 = _94 * _410;
        float _420 = _94 * _416;
        float _422 = 1.0 / _418;
        float _424 = _420 * _422;
        float _426 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _428 = fma(_424, (*spvDescriptorSet0.fp_c8)._m0[30].w, _426);
        float _430 = 1.0 / _428;
        float _432 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _434 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _436 = fma(_430, _432, _434);
        float _438 = _436 * 8.0;
        float _440 = precise::clamp(_438, 0.0, 1.0);
        float _442 = _386 * _440;
        _404 = _442;
    }
    float _444 = _404;
    float _446 = 0.0 + _444;
    float _448 = precise::clamp(_446, 0.0, 1.0);
    out.m_51.x = _394;
    out.m_51.y = _396;
    out.m_51.z = _392;
    out.m_51.w = _448;
    return out;
}

