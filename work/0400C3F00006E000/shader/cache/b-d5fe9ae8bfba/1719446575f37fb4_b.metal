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
    float4 m_50 [[color(0)]];
};

struct main0_in
{
    float4 m_43 [[user(locn0)]];
    float4 m_45 [[user(locn1)]];
    float4 m_37 [[user(locn2)]];
    float4 m_52 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 m_41 [[user(locn5)]];
    float4 m_35 [[user(locn6)]];
    float4 m_39 [[user(locn7)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _59 = gl_FragCoord.w;
    float _61 = in.m_35.x;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = in.m_35.y;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = in.m_35.z;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = in.m_35.w;
    float _81 = gl_FragCoord.w;
    float _83 = _79 * _81;
    float _85 = 1.0 / _59;
    float _87 = _85 * _65;
    float _89 = _85 * _71;
    float _91 = _85 * _77;
    float _93 = _85 * _83;
    float2 _473 = float2(_87, _89);
    float _95 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_473, float2(0.0), isnan(_473))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_473, float2(0.0), isnan(_473))).w;
    float2 _484 = float2(_91, _93);
    float4 _98 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_484, float2(0.0), isnan(_484))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_484, float2(0.0), isnan(_484))).xyzw;
    float _100 = _98.x;
    float _102 = _98.y;
    float _104 = _98.z;
    float _106 = _98.w;
    float _108 = in.m_37.y;
    float _110 = gl_FragCoord.w;
    float _112 = _108 * _110;
    float _114 = in.m_37.x;
    float _116 = gl_FragCoord.w;
    float _118 = _114 * _116;
    float _120 = in.m_37.z;
    float _122 = gl_FragCoord.w;
    float _124 = _120 * _122;
    float _126 = in.m_39.y;
    float _128 = gl_FragCoord.w;
    float _130 = _126 * _128;
    float _132 = in.m_39.x;
    float _134 = gl_FragCoord.w;
    float _136 = _132 * _134;
    float _138 = in.m_39.z;
    float _140 = gl_FragCoord.w;
    float _142 = _138 * _140;
    float _144 = _85 * _112;
    float _146 = _85 * _118;
    float _148 = _85 * _124;
    float _150 = _85 * _130;
    float _152 = _144 * _144;
    float _154 = in.m_41.w;
    float _156 = gl_FragCoord.w;
    float _158 = _154 * _156;
    float _160 = fma(_146, _146, _152);
    float _162 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _164 = _162 + (*spvDescriptorSet0.fp_c9)._m0[139].w;
    float _166 = fma(_148, _148, _160);
    float _168 = 1.0 / _164;
    float _170 = rsqrt(_166);
    float _172 = _144 * _170;
    float _174 = _148 * _170;
    float _176 = in.m_43.w;
    float _178 = gl_FragCoord.w;
    float _180 = _176 * _178;
    float _182 = _150 * _172;
    float _184 = _85 * _136;
    float _186 = _146 * _170;
    float _188 = in.m_45.w;
    float _190 = gl_FragCoord.w;
    float _192 = _188 * _190;
    float _194 = fma(_184, _186, _182);
    float _196 = _85 * _142;
    float _198 = in.m_47.x;
    float _200 = gl_FragCoord.w;
    float _202 = _198 * _200;
    float _204 = fma(_196, _174, _194);
    float _206 = abs(_204);
    float _208 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _210 = _206 + _208;
    float _212 = _210 * _168;
    float _214 = precise::clamp(_212, 0.0, 1.0);
    float _216 = fma(_214, -2.0, 3.0);
    float _218 = _214 * _214;
    float _220 = _85 * _158;
    float _222 = _216 * _218;
    float _224 = _85 * _202;
    float _226 = in.m_45.y;
    float _228 = gl_FragCoord.w;
    float _230 = _226 * _228;
    float _232 = in.m_45.x;
    float _234 = gl_FragCoord.w;
    float _236 = _232 * _234;
    float _238 = in.m_45.z;
    float _240 = gl_FragCoord.w;
    float _242 = _238 * _240;
    float _244 = in.m_41.x;
    float _246 = gl_FragCoord.w;
    float _248 = _244 * _246;
    float _250 = in.m_41.y;
    float _252 = gl_FragCoord.w;
    float _254 = _250 * _252;
    float _256 = in.m_41.z;
    float _258 = gl_FragCoord.w;
    float _260 = _256 * _258;
    float _262 = _85 * _236;
    float _264 = _95 * _106;
    float _266 = _85 * _192;
    float _268 = _264 * _220;
    float _270 = _85 * _180;
    float _272 = _270 * _268;
    float _274 = _266 * _272;
    float _276 = 0.0 + _274;
    float _278 = precise::clamp(_276, 0.0, 1.0);
    float _280 = _278 * _222;
    float _282 = _280 * _224;
    bool _286 = _282 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _288 = isnan(_282);
    bool _290 = _286 || _288;
    bool _292 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _294 = _290 || _292;
    float _296 = in.m_43.y;
    float _298 = gl_FragCoord.w;
    float _300 = _296 * _298;
    float _302 = in.m_43.z;
    float _304 = gl_FragCoord.w;
    float _306 = _302 * _304;
    float _308 = in.m_43.x;
    float _310 = gl_FragCoord.w;
    float _312 = _308 * _310;
    if (!_294)
    {
        discard_fragment();
    }
    float _314 = _85 * _230;
    float _316 = _85 * _300;
    float _318 = _85 * _306;
    float _320 = _85 * _312;
    float _322 = _85 * _242;
    float _324 = fma(_102, _316, _314);
    float _326 = _85 * _248;
    float _328 = fma(_100, _320, _262);
    float _330 = fma(_104, _318, _322);
    float _332 = _85 * _254;
    float _334 = _85 * _260;
    float _336 = _328 * _326;
    float _338 = _324 * _332;
    float _340 = _330 * _334;
    if (!_294)
    {
        out.m_50.x = _336;
        out.m_50.y = _338;
        out.m_50.z = _340;
        out.m_50.w = _274;
        return out;
    }
    float _342 = _338 * 0.715200006961822509765625;
    float _344 = 0.0 + _282;
    float _346 = precise::clamp(_344, 0.0, 1.0);
    float _348 = fma(_336, 0.2125999927520751953125, _342);
    bool _350 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _352 = fma(_340, 0.072200000286102294921875, _348);
    float _354 = 1.0 / _352;
    float _356 = _354 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _358 = precise::clamp(_356, 0.0, 1.0);
    float _360 = fma(_358, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _362 = _336 * _360;
    float _364 = _338 * _360;
    float _366 = _340 * _360;
    float _368 = _360;
    if (!_350)
    {
        _368 = _346;
    }
    float _370 = _368;
    bool _372 = !_350;
    float _374 = _370;
    if (!_372)
    {
        float _376 = in.m_52.w;
        float _378 = gl_FragCoord.w;
        float _380 = _376 * _378;
        float _382 = in.m_52.z;
        float _384 = gl_FragCoord.w;
        float _386 = _382 * _384;
        float _388 = _85 * _380;
        float _390 = _85 * _386;
        float _392 = 1.0 / _388;
        float _394 = _390 * _392;
        float _396 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _398 = fma(_394, (*spvDescriptorSet0.fp_c8)._m0[30].w, _396);
        float _400 = 1.0 / _398;
        float _402 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _404 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _406 = fma(_400, _402, _404);
        float _408 = _406 * 8.0;
        float _410 = precise::clamp(_408, 0.0, 1.0);
        float _412 = _346 * _410;
        _374 = _412;
    }
    float _414 = _374;
    float _416 = 0.0 + _414;
    float _418 = precise::clamp(_416, 0.0, 1.0);
    out.m_50.x = _362;
    out.m_50.y = _364;
    out.m_50.z = _366;
    out.m_50.w = _418;
    return out;
}

