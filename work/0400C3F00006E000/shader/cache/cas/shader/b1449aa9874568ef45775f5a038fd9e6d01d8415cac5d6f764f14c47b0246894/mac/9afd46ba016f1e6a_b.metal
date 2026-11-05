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
    float4 m_50 [[color(0)]];
};

struct main0_in
{
    float4 m_43 [[user(locn0)]];
    float4 m_45 [[user(locn1)]];
    float4 m_37 [[user(locn2)]];
    float4 m_54 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 m_41 [[user(locn5)]];
    float4 m_35 [[user(locn6)]];
    float4 m_39 [[user(locn7)]];
    float4 m_52 [[user(locn8)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _61 = gl_FragCoord.w;
    float _63 = in.m_35.z;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_35.x;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_35.y;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_35.w;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = 1.0 / _61;
    float _89 = _87 * _67;
    float _91 = _87 * _73;
    float _93 = _87 * _79;
    float _95 = _87 * _85;
    float2 _521 = float2(_89, _95);
    float _97 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_521, float2(0.0), isnan(_521))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_521, float2(0.0), isnan(_521))).w;
    float2 _532 = float2(_91, _93);
    float4 _100 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_532, float2(0.0), isnan(_532))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_532, float2(0.0), isnan(_532))).xyzw;
    float _102 = _100.x;
    float _104 = _100.y;
    float _106 = _100.z;
    float _108 = _100.w;
    float _110 = in.m_37.y;
    float _112 = gl_FragCoord.w;
    float _114 = _110 * _112;
    float _116 = in.m_37.x;
    float _118 = gl_FragCoord.w;
    float _120 = _116 * _118;
    float _122 = in.m_37.z;
    float _124 = gl_FragCoord.w;
    float _126 = _122 * _124;
    float _128 = in.m_39.y;
    float _130 = gl_FragCoord.w;
    float _132 = _128 * _130;
    float _134 = in.m_39.x;
    float _136 = gl_FragCoord.w;
    float _138 = _134 * _136;
    float _140 = in.m_39.z;
    float _142 = gl_FragCoord.w;
    float _144 = _140 * _142;
    float _146 = in.m_41.w;
    float _148 = gl_FragCoord.w;
    float _150 = _146 * _148;
    float _152 = _87 * _114;
    float _154 = _87 * _120;
    float _156 = _87 * _126;
    float _158 = _87 * _132;
    float _160 = _152 * _152;
    float _162 = in.m_43.w;
    float _164 = gl_FragCoord.w;
    float _166 = _162 * _164;
    float _168 = fma(_154, _154, _160);
    float _170 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _172 = _170 + (*spvDescriptorSet0.fp_c9)._m0[139].w;
    float _174 = fma(_156, _156, _168);
    float _176 = 1.0 / _172;
    float _178 = rsqrt(_174);
    float _180 = _152 * _178;
    float _182 = _158 * _180;
    float _184 = _87 * _138;
    float _186 = _154 * _178;
    float _188 = in.m_45.w;
    float _190 = gl_FragCoord.w;
    float _192 = _188 * _190;
    float _194 = _156 * _178;
    float _196 = fma(_184, _186, _182);
    float _198 = _87 * _144;
    float _200 = in.m_47.x;
    float _202 = gl_FragCoord.w;
    float _204 = _200 * _202;
    float _206 = fma(_198, _194, _196);
    float _208 = abs(_206);
    float _210 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _212 = _208 + _210;
    float _214 = _212 * _176;
    float _216 = precise::clamp(_214, 0.0, 1.0);
    float _218 = fma(_216, -2.0, 3.0);
    float _220 = _216 * _216;
    float _222 = _87 * _166;
    float _224 = _218 * _220;
    float _226 = _87 * _204;
    float _228 = in.m_43.y;
    float _230 = gl_FragCoord.w;
    float _232 = _228 * _230;
    float _234 = in.m_45.x;
    float _236 = gl_FragCoord.w;
    float _238 = _234 * _236;
    float _240 = in.m_43.z;
    float _242 = gl_FragCoord.w;
    float _244 = _240 * _242;
    float _246 = in.m_41.x;
    float _248 = gl_FragCoord.w;
    float _250 = _246 * _248;
    float _252 = in.m_41.y;
    float _254 = gl_FragCoord.w;
    float _256 = _252 * _254;
    float _258 = in.m_41.z;
    float _260 = gl_FragCoord.w;
    float _262 = _258 * _260;
    float _264 = _87 * _238;
    float _266 = _108 * _97;
    float _268 = _87 * _150;
    float _270 = -_222;
    float _272 = fma(_266, _268, _270);
    float _274 = _87 * _192;
    float _276 = _274 * _272;
    float _278 = 0.0 + _276;
    float _280 = precise::clamp(_278, 0.0, 1.0);
    float _282 = _280 * _224;
    float _284 = _282 * _226;
    bool _288 = _284 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _290 = isnan(_284);
    bool _292 = _288 || _290;
    bool _294 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _296 = _292 || _294;
    float _298 = in.m_43.x;
    float _300 = gl_FragCoord.w;
    float _302 = _298 * _300;
    float _304 = in.m_45.y;
    float _306 = gl_FragCoord.w;
    float _308 = _304 * _306;
    float _310 = in.m_45.z;
    float _312 = gl_FragCoord.w;
    float _314 = _310 * _312;
    if (!_296)
    {
        discard_fragment();
    }
    float _316 = _87 * _244;
    float _318 = _87 * _302;
    float _320 = _87 * _232;
    float _322 = _87 * _308;
    float _324 = _87 * _314;
    float _326 = -_264;
    float _328 = _318 + _326;
    float _330 = -_322;
    float _332 = _320 + _330;
    float _334 = -_324;
    float _336 = _316 + _334;
    float _338 = fma(_102, _328, _264);
    float _340 = _87 * _256;
    float _342 = fma(_104, _332, _322);
    float _344 = fma(_106, _336, _324);
    float _346 = _87 * _250;
    float _348 = _87 * _262;
    float _350 = _342 * _340;
    float _352 = _338 * _346;
    float _354 = _344 * _348;
    if (!_296)
    {
        out.m_50.x = _352;
        out.m_50.y = _350;
        out.m_50.z = _354;
        out.m_50.w = _276;
        return out;
    }
    float _356 = _350 * 0.715200006961822509765625;
    float _358 = in.m_52.w;
    float _360 = gl_FragCoord.w;
    float _362 = _358 * _360;
    float _364 = in.m_52.z;
    float _366 = gl_FragCoord.w;
    float _368 = _364 * _366;
    float _370 = in.m_52.x;
    float _372 = gl_FragCoord.w;
    float _374 = _370 * _372;
    float _376 = fma(_352, 0.2125999927520751953125, _356);
    float _378 = in.m_52.y;
    float _380 = gl_FragCoord.w;
    float _382 = _378 * _380;
    float _384 = 0.0 + _284;
    float _386 = precise::clamp(_384, 0.0, 1.0);
    float _388 = fma(_354, 0.072200000286102294921875, _376);
    bool _390 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _392 = 1.0 / _388;
    float _394 = _392 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _396 = precise::clamp(_394, 0.0, 1.0);
    float _398 = _87 * _362;
    float _400 = fma(_396, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _402 = _87 * _368;
    float _404 = _400 * _398;
    float _406 = _87 * _374;
    float _408 = _87 * _382;
    float _410 = fma(_354, _404, _402);
    float _412 = fma(_352, _404, _406);
    float _414 = fma(_350, _404, _408);
    float _416 = _402;
    if (!_390)
    {
        _416 = _386;
    }
    float _418 = _416;
    bool _420 = !_390;
    float _422 = _418;
    if (!_420)
    {
        float _424 = in.m_54.w;
        float _426 = gl_FragCoord.w;
        float _428 = _424 * _426;
        float _430 = in.m_54.z;
        float _432 = gl_FragCoord.w;
        float _434 = _430 * _432;
        float _436 = _87 * _428;
        float _438 = _87 * _434;
        float _440 = 1.0 / _436;
        float _442 = _438 * _440;
        float _444 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _446 = fma(_442, (*spvDescriptorSet0.fp_c8)._m0[30].w, _444);
        float _448 = 1.0 / _446;
        float _450 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _452 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _454 = fma(_448, _450, _452);
        float _456 = _454 * 8.0;
        float _458 = precise::clamp(_456, 0.0, 1.0);
        float _460 = _386 * _458;
        _422 = _460;
    }
    float _462 = _422;
    float _464 = 0.0 + _462;
    float _466 = precise::clamp(_464, 0.0, 1.0);
    out.m_50.x = _412;
    out.m_50.y = _414;
    out.m_50.z = _410;
    out.m_50.w = _466;
    return out;
}

