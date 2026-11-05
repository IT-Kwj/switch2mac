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
    float4 m_52 [[color(0)]];
};

struct main0_in
{
    float4 m_43 [[user(locn0)]];
    float4 m_47 [[user(locn1)]];
    float4 m_39 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_37 [[user(locn4), flat]];
    float4 m_35 [[user(locn5)]];
    float4 m_56 [[user(locn6)]];
    float4 m_49 [[user(locn7)]];
    float4 m_41 [[user(locn8)]];
    float4 m_54 [[user(locn9)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _63 = gl_FragCoord.w;
    float _65 = in.m_35.x;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_35.y;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = 1.0 / _63;
    float _79 = _77 * _69;
    float _81 = _77 * _75;
    float2 _489 = float2(_79, _81);
    float2 _85 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_489, float2(0.0), isnan(_489))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_489, float2(0.0), isnan(_489))).xy;
    float _87 = _85.x;
    float _89 = _85.y;
    float _91 = in.m_37.x;
    float _93 = in.m_35.z;
    float _95 = gl_FragCoord.w;
    float _97 = _93 * _95;
    float _99 = in.m_35.w;
    float _101 = gl_FragCoord.w;
    float _103 = _99 * _101;
    float _105 = _91 * (*spvDescriptorSet0.fp_c9)._m0[21].x;
    float _107 = _77 * _97;
    float _109 = _91 * (*spvDescriptorSet0.fp_c9)._m0[21].y;
    float _111 = _77 * _103;
    float _113 = fma(_87, 2.0, -1.0);
    float _115 = fma(_89, 2.0, -1.0);
    float _117 = fma(_105, _113, _107);
    float _119 = fma(_109, _115, _111);
    float2 _552 = float2(_117, _119);
    float4 _122 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_552, float2(0.0), isnan(_552))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_552, float2(0.0), isnan(_552))).xyzw;
    float _124 = _122.x;
    float _126 = _122.y;
    float _128 = _122.z;
    float _130 = _122.w;
    float _132 = in.m_39.y;
    float _134 = gl_FragCoord.w;
    float _136 = _132 * _134;
    float _138 = in.m_39.x;
    float _140 = gl_FragCoord.w;
    float _142 = _138 * _140;
    float _144 = in.m_39.z;
    float _146 = gl_FragCoord.w;
    float _148 = _144 * _146;
    float _150 = in.m_41.y;
    float _152 = gl_FragCoord.w;
    float _154 = _150 * _152;
    float _156 = in.m_41.x;
    float _158 = gl_FragCoord.w;
    float _160 = _156 * _158;
    float _162 = in.m_41.z;
    float _164 = gl_FragCoord.w;
    float _166 = _162 * _164;
    float _168 = in.m_43.w;
    float _170 = gl_FragCoord.w;
    float _172 = _168 * _170;
    float _174 = in.m_45.w;
    float _176 = gl_FragCoord.w;
    float _178 = _174 * _176;
    float _180 = _77 * _136;
    float _182 = _77 * _142;
    float _184 = _77 * _148;
    float _186 = _180 * _180;
    float _188 = fma(_182, _182, _186);
    float _190 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _192 = _190 + (*spvDescriptorSet0.fp_c9)._m0[139].w;
    float _194 = fma(_184, _184, _188);
    float _196 = _77 * _154;
    float _198 = in.m_47.w;
    float _200 = gl_FragCoord.w;
    float _202 = _198 * _200;
    float _204 = rsqrt(_194);
    float _206 = 1.0 / _192;
    float _208 = in.m_49.x;
    float _210 = gl_FragCoord.w;
    float _212 = _208 * _210;
    float _214 = _180 * _204;
    float _216 = _182 * _204;
    float _218 = _184 * _204;
    float _220 = _196 * _214;
    float _222 = _77 * _160;
    float _224 = fma(_222, _216, _220);
    float _226 = _77 * _166;
    float _228 = fma(_226, _218, _224);
    float _230 = abs(_228);
    float _232 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _234 = _230 + _232;
    float _236 = _234 * _206;
    float _238 = precise::clamp(_236, 0.0, 1.0);
    float _240 = _77 * _172;
    float _242 = fma(_238, -2.0, 3.0);
    float _244 = _238 * _238;
    float _246 = _77 * _178;
    float _248 = _242 * _244;
    float _250 = _77 * _212;
    float _252 = in.m_43.y;
    float _254 = gl_FragCoord.w;
    float _256 = _252 * _254;
    float _258 = in.m_47.x;
    float _260 = gl_FragCoord.w;
    float _262 = _258 * _260;
    float _264 = in.m_43.z;
    float _266 = gl_FragCoord.w;
    float _268 = _264 * _266;
    float _270 = in.m_47.z;
    float _272 = gl_FragCoord.w;
    float _274 = _270 * _272;
    float _276 = _77 * _262;
    float _278 = -_240;
    float _280 = fma(_130, _246, _278);
    float _282 = _77 * _202;
    float _284 = _282 * _280;
    float _286 = 0.0 + _284;
    float _288 = precise::clamp(_286, 0.0, 1.0);
    float _290 = _288 * _248;
    float _292 = _290 * _250;
    bool _296 = _292 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _298 = isnan(_292);
    bool _300 = _296 || _298;
    bool _302 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _304 = _300 || _302;
    float _306 = in.m_43.x;
    float _308 = gl_FragCoord.w;
    float _310 = _306 * _308;
    float _312 = in.m_47.y;
    float _314 = gl_FragCoord.w;
    float _316 = _312 * _314;
    if (!_304)
    {
        discard_fragment();
    }
    float _318 = _77 * _268;
    float _320 = _77 * _310;
    float _322 = _77 * _256;
    float _324 = _77 * _316;
    float _326 = _77 * _274;
    float _328 = -_276;
    float _330 = _320 + _328;
    float _332 = -_324;
    float _334 = _322 + _332;
    float _336 = -_326;
    float _338 = _318 + _336;
    float _340 = fma(_124, _330, _276);
    float _342 = fma(_126, _334, _324);
    float _344 = fma(_128, _338, _326);
    if (!_304)
    {
        out.m_52.x = _340;
        out.m_52.y = _342;
        out.m_52.z = _344;
        out.m_52.w = _284;
        return out;
    }
    float _346 = _342 * 0.715200006961822509765625;
    float _348 = in.m_54.w;
    float _350 = gl_FragCoord.w;
    float _352 = _348 * _350;
    float _354 = in.m_54.z;
    float _356 = gl_FragCoord.w;
    float _358 = _354 * _356;
    float _360 = in.m_54.x;
    float _362 = gl_FragCoord.w;
    float _364 = _360 * _362;
    float _366 = fma(_340, 0.2125999927520751953125, _346);
    float _368 = in.m_54.y;
    float _370 = gl_FragCoord.w;
    float _372 = _368 * _370;
    float _374 = fma(_344, 0.072200000286102294921875, _366);
    bool _376 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _378 = 1.0 / _374;
    float _380 = _378 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _382 = precise::clamp(_380, 0.0, 1.0);
    float _384 = _77 * _352;
    float _386 = fma(_382, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _388 = _77 * _358;
    float _390 = _386 * _384;
    float _392 = 0.0 + _292;
    float _394 = precise::clamp(_392, 0.0, 1.0);
    float _396 = _77 * _364;
    float _398 = _77 * _372;
    float _400 = fma(_344, _390, _388);
    float _402 = fma(_340, _390, _396);
    float _404 = fma(_342, _390, _398);
    float _406 = _388;
    if (!_376)
    {
        _406 = _394;
    }
    float _408 = _406;
    bool _410 = !_376;
    float _412 = _408;
    if (!_410)
    {
        float _414 = in.m_56.w;
        float _416 = gl_FragCoord.w;
        float _418 = _414 * _416;
        float _420 = in.m_56.z;
        float _422 = gl_FragCoord.w;
        float _424 = _420 * _422;
        float _426 = _77 * _418;
        float _428 = _77 * _424;
        float _430 = 1.0 / _426;
        float _432 = _428 * _430;
        float _434 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _436 = fma(_432, (*spvDescriptorSet0.fp_c8)._m0[30].w, _434);
        float _438 = 1.0 / _436;
        float _440 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _442 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _444 = fma(_438, _440, _442);
        float _446 = _444 * 8.0;
        float _448 = precise::clamp(_446, 0.0, 1.0);
        float _450 = _394 * _448;
        _412 = _450;
    }
    float _452 = _412;
    float _454 = 0.0 + _452;
    float _456 = precise::clamp(_454, 0.0, 1.0);
    out.m_52.x = _402;
    out.m_52.y = _404;
    out.m_52.z = _400;
    out.m_52.w = _456;
    return out;
}

