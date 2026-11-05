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
    texture2d<float> fp_t_tcb_C [[id(7)]];
    sampler fp_t_tcb_CSmplr [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    sampler fp_t_tcb_ASmplr_w [[id(10)]];
    sampler fp_t_tcb_CSmplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_56 [[color(0)]];
};

struct main0_in
{
    float4 m_53 [[user(locn0)]];
    float4 m_51 [[user(locn1)]];
    float4 m_45 [[user(locn2)]];
    float4 m_37 [[user(locn3), flat]];
    float4 m_41 [[user(locn4)]];
    float4 m_60 [[user(locn5)]];
    float4 m_47 [[user(locn6)]];
    float4 m_35 [[user(locn7), flat]];
    float4 m_43 [[user(locn8)]];
    float4 m_49 [[user(locn9)]];
    float4 m_58 [[user(locn11)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _67 = in.m_35.z;
    float _69 = in.m_37.y;
    float _71 = gl_FragCoord.w;
    float _73 = in.m_41.y;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = in.m_41.x;
    float _81 = gl_FragCoord.w;
    float _83 = _79 * _81;
    float _85 = _67 * 6.283185482025146484375;
    float _87 = 1.0 / _71;
    float _89 = fma(_69, 0.02999999932944774627685546875, _85);
    float _91 = _89 * 0.15915493667125701904296875;
    float _93 = _91 * 6.283185482025146484375;
    float _95 = sin(_93);
    float _97 = _87 * _77;
    float _99 = _87 * _83;
    float _101 = _99 + 0.5;
    float _103 = fma(_95, -0.0500000007450580596923828125, _97);
    float _105 = _103 + 0.5;
    float2 _537 = float2(_99, _103);
    float _107 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_537, float2(0.0), isnan(_537))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_537, float2(0.0), isnan(_537))).w;
    float2 _548 = float2(_101, _105);
    float _109 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_548, float2(0.0), isnan(_548))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_548, float2(0.0), isnan(_548))).w;
    float _111 = in.m_43.y;
    float _113 = gl_FragCoord.w;
    float _115 = _111 * _113;
    float _117 = in.m_41.z;
    float _119 = gl_FragCoord.w;
    float _121 = _117 * _119;
    float _123 = in.m_41.w;
    float _125 = gl_FragCoord.w;
    float _127 = _123 * _125;
    float _129 = fma(_95, 0.125, 0.875);
    float _131 = _129 * 0.800000011920928955078125;
    float _133 = _87 * _115;
    float _135 = _87 * _127;
    float _137 = -_133;
    float _139 = _137 + 1.0;
    float _141 = _139 * _139;
    float _143 = _107 * _141;
    float _145 = -_109;
    float _147 = _145 + _107;
    float _149 = _87 * _121;
    float _151 = _129 * 0.3499999940395355224609375;
    float _153 = fma(_131, _143, _135);
    float _155 = fma(_151, _147, _149);
    float2 _619 = float2(_155, _153);
    float4 _158 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_619, float2(0.0), isnan(_619))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_619, float2(0.0), isnan(_619))).xyzw;
    float _160 = _158.x;
    float _162 = _158.y;
    float _164 = _158.z;
    float _166 = _158.w;
    float _168 = in.m_45.w;
    float _170 = gl_FragCoord.w;
    float _172 = _168 * _170;
    float _174 = in.m_47.x;
    float _176 = gl_FragCoord.w;
    float _178 = _174 * _176;
    float _180 = _87 * _172;
    float _182 = _87 * _178;
    float _184 = in.m_49.y;
    float _186 = gl_FragCoord.w;
    float _188 = _184 * _186;
    float _190 = _87 * _188;
    float _192 = _166 * _180;
    float _194 = 0.0 + _192;
    float _196 = precise::clamp(_194, 0.0, 1.0);
    float _198 = _196 * _182;
    bool _202 = _198 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _204 = isnan(_198);
    bool _206 = _202 || _204;
    bool _208 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _210 = _206 || _208;
    float _212 = in.m_49.x;
    float _214 = gl_FragCoord.w;
    float _216 = _212 * _214;
    if (!_210)
    {
        discard_fragment();
    }
    float _218 = _87 * _216;
    float2 _706 = float2(_218, _190);
    float3 _222 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_706, float2(0.0), isnan(_706))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_706, float2(0.0), isnan(_706))).xyz;
    float _224 = _222.x;
    float _226 = _222.y;
    float _228 = _222.z;
    float _230 = in.m_51.x;
    float _232 = gl_FragCoord.w;
    float _234 = _230 * _232;
    float _236 = in.m_53.x;
    float _238 = gl_FragCoord.w;
    float _240 = _236 * _238;
    float _242 = in.m_51.y;
    float _244 = gl_FragCoord.w;
    float _246 = _242 * _244;
    float _248 = in.m_53.y;
    float _250 = gl_FragCoord.w;
    float _252 = _248 * _250;
    float _254 = in.m_51.z;
    float _256 = gl_FragCoord.w;
    float _258 = _254 * _256;
    float _260 = in.m_53.z;
    float _262 = gl_FragCoord.w;
    float _264 = _260 * _262;
    float _266 = _160 * _160;
    float _268 = _162 * _162;
    float _270 = _164 * _164;
    float _272 = _266 * _180;
    float _274 = _268 * _180;
    float _276 = _270 * _180;
    float _278 = _139 * 2.0;
    float _280 = _87 * _234;
    float _282 = _87 * _240;
    float _284 = _87 * _246;
    float _286 = _87 * _252;
    float _288 = -_280;
    float _290 = _288 + _282;
    float _292 = -_284;
    float _294 = _292 + _286;
    float _296 = _87 * _258;
    float _298 = fma(_272, _290, _280);
    float _300 = fma(_274, _294, _284);
    float _302 = precise::max(_276, 0.5);
    float _304 = _87 * _264;
    float _306 = precise::max(_272, 0.5);
    float _308 = fma(_133, -2.0, 1.0);
    float _310 = precise::clamp(_308, 0.0, 1.0);
    float _312 = precise::max(_274, 0.5);
    float _314 = -_296;
    float _316 = _314 + _304;
    float _318 = precise::min(_302, 1.0);
    float _320 = fma(_310, -2.0, 3.0);
    float _322 = precise::min(_306, 1.0);
    float _324 = _310 * _310;
    float _326 = precise::min(_312, 1.0);
    float _328 = fma(_318, 2.0, -1.0);
    float _330 = fma(_276, _316, _296);
    float _332 = fma(_322, 2.0, -1.0);
    float _334 = fma(_326, 2.0, -1.0);
    float _336 = fma(_320, _324, _328);
    float _338 = fma(_320, _324, _332);
    float _340 = fma(_320, _324, _334);
    float _342 = _228 * _228;
    float _344 = _224 * _224;
    float _346 = _226 * _226;
    float _348 = fma(_342, _278, _336);
    float _350 = fma(_344, _278, _338);
    float _352 = fma(_346, _278, _340);
    float _354 = fma(_133, -0.25, 1.0);
    float _356 = _330 + _348;
    float _358 = _298 + _350;
    float _360 = _300 + _352;
    float _362 = _356 * _354;
    if (!_210)
    {
        out.m_56.x = _358;
        out.m_56.y = _360;
        out.m_56.z = _362;
        out.m_56.w = _192;
        return out;
    }
    float _364 = _360 * 0.715200006961822509765625;
    float _366 = in.m_58.w;
    float _368 = gl_FragCoord.w;
    float _370 = _366 * _368;
    float _372 = in.m_58.z;
    float _374 = gl_FragCoord.w;
    float _376 = _372 * _374;
    float _378 = in.m_58.x;
    float _380 = gl_FragCoord.w;
    float _382 = _378 * _380;
    float _384 = fma(_358, 0.2125999927520751953125, _364);
    float _386 = in.m_58.y;
    float _388 = gl_FragCoord.w;
    float _390 = _386 * _388;
    float _392 = fma(_362, 0.072200000286102294921875, _384);
    bool _394 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _396 = 1.0 / _392;
    float _398 = _396 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _400 = precise::clamp(_398, 0.0, 1.0);
    float _402 = fma(_400, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _404 = _87 * _370;
    float _406 = 0.0 + _198;
    float _408 = precise::clamp(_406, 0.0, 1.0);
    float _410 = _87 * _376;
    float _412 = _87 * _390;
    float _414 = _402 * _404;
    float _416 = _87 * _382;
    float _418 = fma(_362, _414, _410);
    float _420 = fma(_358, _414, _416);
    float _422 = fma(_360, _414, _412);
    float _424 = _410;
    if (!_394)
    {
        _424 = _408;
    }
    float _426 = _424;
    bool _428 = !_394;
    float _430 = _426;
    if (!_428)
    {
        float _432 = in.m_60.w;
        float _434 = gl_FragCoord.w;
        float _436 = _432 * _434;
        float _438 = in.m_60.z;
        float _440 = gl_FragCoord.w;
        float _442 = _438 * _440;
        float _444 = _87 * _436;
        float _446 = _87 * _442;
        float _448 = 1.0 / _444;
        float _450 = _446 * _448;
        float _452 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _454 = fma(_450, (*spvDescriptorSet0.fp_c8)._m0[30].w, _452);
        float _456 = 1.0 / _454;
        float _458 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _460 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _462 = fma(_456, _458, _460);
        float _464 = _462 * 8.0;
        float _466 = precise::clamp(_464, 0.0, 1.0);
        float _468 = _408 * _466;
        _430 = _468;
    }
    float _470 = _430;
    float _472 = 0.0 + _470;
    float _474 = precise::clamp(_472, 0.0, 1.0);
    out.m_56.x = _420;
    out.m_56.y = _422;
    out.m_56.z = _418;
    out.m_56.w = _474;
    return out;
}

