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
    constant _16* fp_c13 [[id(1)]];
    constant _16* fp_c8 [[id(2)]];
    constant _16* fp_c15 [[id(3)]];
    texture2d<float> fp_t_tcb_8 [[id(4)]];
    sampler fp_t_tcb_8Smplr [[id(5)]];
    texture2d<float> fp_t_tcb_10 [[id(6)]];
    sampler fp_t_tcb_10Smplr [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    sampler fp_t_tcb_10Smplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_50 [[color(0)]];
};

struct main0_in
{
    float4 m_41 [[user(locn0)]];
    float4 m_43 [[user(locn1)]];
    float4 m_47 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_58 [[user(locn4)]];
    float4 m_39 [[user(locn6)]];
    float4 m_56 [[user(locn7), flat]];
    float4 m_37 [[user(locn8)]];
    float4 m_52 [[user(locn9)]];
    float4 m_54 [[user(locn10), flat]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _65 = gl_FragCoord.w;
    float _67 = in.m_37.x;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = in.m_37.y;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = 1.0 / _65;
    float _81 = _79 * _71;
    float _83 = _79 * _77;
    float2 _488 = float2(_81, _83);
    float4 _86 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_488, float2(0.0), isnan(_488))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_488, float2(0.0), isnan(_488))).xyzw;
    float _88 = _86.x;
    float _90 = _86.y;
    float _92 = _86.z;
    float _94 = _86.w;
    float _96 = in.m_39.w;
    float _98 = gl_FragCoord.w;
    float _100 = _96 * _98;
    float _102 = in.m_41.w;
    float _104 = gl_FragCoord.w;
    float _106 = _102 * _104;
    float _108 = in.m_43.w;
    float _110 = gl_FragCoord.w;
    float _112 = _108 * _110;
    float _114 = in.m_45.x;
    float _116 = gl_FragCoord.w;
    float _118 = _114 * _116;
    float _120 = _79 * _100;
    float _122 = _94 * _120;
    float _124 = _79 * _106;
    float _126 = _79 * _112;
    float _128 = _124 * _122;
    float _130 = _126 * _128;
    float _132 = _79 * _118;
    float _134 = 0.0 + _130;
    float _136 = precise::clamp(_134, 0.0, 1.0);
    float _138 = _136 * _132;
    bool _142 = _138 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _144 = isnan(_138);
    bool _146 = _142 || _144;
    bool _148 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _150 = _146 || _148;
    float _152 = in.m_47.w;
    float _154 = gl_FragCoord.w;
    float _156 = _152 * _154;
    if (!_150)
    {
        discard_fragment();
    }
    float _158 = in.m_47.x;
    float _160 = gl_FragCoord.w;
    float _162 = _158 * _160;
    float _164 = in.m_47.y;
    float _166 = gl_FragCoord.w;
    float _168 = _164 * _166;
    float _170 = _79 * _156;
    float _172 = 1.0 / _170;
    float _174 = _79 * _162;
    float _176 = _79 * _168;
    float _178 = _174 * _172;
    float _180 = _176 * _172;
    float2 _624 = float2(_178, _180);
    float _182 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_624, float2(0.0), isnan(_624))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_624, float2(0.0), isnan(_624))).x;
    float _184 = in.m_41.y;
    float _186 = gl_FragCoord.w;
    float _188 = _184 * _186;
    float _190 = in.m_41.x;
    float _192 = gl_FragCoord.w;
    float _194 = _190 * _192;
    float _196 = in.m_41.z;
    float _198 = gl_FragCoord.w;
    float _200 = _196 * _198;
    float _202 = in.m_43.z;
    float _204 = gl_FragCoord.w;
    float _206 = _202 * _204;
    float _208 = in.m_43.x;
    float _210 = gl_FragCoord.w;
    float _212 = _208 * _210;
    float _214 = in.m_43.y;
    float _216 = gl_FragCoord.w;
    float _218 = _214 * _216;
    float _220 = in.m_39.x;
    float _222 = gl_FragCoord.w;
    float _224 = _220 * _222;
    float _226 = in.m_39.y;
    float _228 = gl_FragCoord.w;
    float _230 = _226 * _228;
    float _232 = in.m_39.z;
    float _234 = gl_FragCoord.w;
    float _236 = _232 * _234;
    float _238 = _92 * _92;
    float _240 = _88 * _88;
    float _242 = _90 * _90;
    float _244 = _79 * _188;
    float _246 = _79 * _194;
    float _248 = _79 * _200;
    float _250 = _79 * _206;
    float _252 = _79 * _212;
    float _254 = _79 * _218;
    float _256 = -_250;
    float _258 = _248 + _256;
    float _260 = -_252;
    float _262 = _246 + _260;
    float _264 = -_254;
    float _266 = _244 + _264;
    float _268 = fma(_238, _258, _250);
    float _270 = fma(_240, _262, _252);
    float _272 = fma(_242, _266, _254);
    float _274 = _79 * _224;
    float _276 = _79 * _230;
    float _278 = _79 * _236;
    float _280 = _270 * _274;
    float _282 = _272 * _276;
    float _284 = _268 * _278;
    if (!_150)
    {
        out.m_50.x = _280;
        out.m_50.y = _282;
        out.m_50.z = _284;
        out.m_50.w = _130;
        return out;
    }
    float _286 = in.m_52.y;
    float _288 = gl_FragCoord.w;
    float _290 = _286 * _288;
    float _292 = in.m_52.x;
    float _294 = gl_FragCoord.w;
    float _296 = _292 * _294;
    float _298 = in.m_54.y;
    float _300 = in.m_54.x;
    float _302 = in.m_52.z;
    float _304 = gl_FragCoord.w;
    float _306 = _302 * _304;
    float _308 = in.m_47.z;
    float _310 = gl_FragCoord.w;
    float _312 = _308 * _310;
    float _314 = in.m_54.z;
    float _316 = in.m_56.x;
    float _318 = _79 * _290;
    float _320 = _79 * _296;
    float _322 = -_298;
    float _324 = _318 + _322;
    float _326 = -_300;
    float _328 = _320 + _326;
    float _330 = _79 * _306;
    float _332 = _316 * (*spvDescriptorSet0.fp_c13)._m0[2].y;
    float _334 = _324 * _324;
    float _336 = _79 * _312;
    float _338 = -_314;
    float _340 = _330 + _338;
    float _342 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _344 = fma(_182, (*spvDescriptorSet0.fp_c8)._m0[30].w, _342);
    float _346 = fma(_328, _328, _334);
    float _348 = _336 * _172;
    float _350 = in.m_58.w;
    float _352 = gl_FragCoord.w;
    float _354 = _350 * _352;
    float _356 = fma(_340, _340, _346);
    float _358 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _360 = fma(_348, (*spvDescriptorSet0.fp_c8)._m0[30].w, _358);
    float _362 = 1.0 / _344;
    float _364 = -_356;
    float _366 = fma(_332, _332, _364);
    float _368 = precise::max(0.0, _366);
    float _370 = 1.0 / _360;
    float _372 = sqrt(_368);
    float _374 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _376 = _370 * _374;
    float _378 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _380 = -_376;
    float _382 = fma(_362, _378, _380);
    float _384 = _79 * _354;
    float _386 = _372 + _382;
    float _388 = -_384;
    float _390 = _386 + _388;
    float _392 = _390 * (*spvDescriptorSet0.fp_c13)._m0[2].z;
    float _394 = _282 * 0.715200006961822509765625;
    float _396 = _392 * (-1.44269502162933349609375);
    float _398 = fma(_280, 0.2125999927520751953125, _394);
    float _400 = fma(_284, 0.072200000286102294921875, _398);
    float _402 = exp2(_396);
    bool _404 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _406 = 1.0 / _400;
    float _408 = -_402;
    float _410 = _408 + 1.0;
    float _412 = precise::clamp(_410, 0.0, 1.0);
    float _414 = _376;
    float _416 = _412;
    if (_404)
    {
        float _418 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _420 = _376 + _418;
        _414 = _420;
    }
    float _422 = _414;
    float _424 = _138 * _412;
    float _426 = precise::clamp(_424, 0.0, 1.0);
    float _428 = _426;
    if (_404)
    {
        float _430 = _422 * 8.0;
        float _432 = precise::clamp(_430, 0.0, 1.0);
        _416 = _432;
    }
    float _434 = _416;
    float _436 = _406 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _438 = precise::clamp(_436, 0.0, 1.0);
    if (_404)
    {
        float _440 = _426 * _434;
        _428 = _440;
    }
    float _442 = _428;
    float _444 = fma(_438, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _446 = 0.0 + _442;
    float _448 = precise::clamp(_446, 0.0, 1.0);
    float _450 = _280 * _444;
    float _452 = _282 * _444;
    float _454 = _284 * _444;
    out.m_50.x = _450;
    out.m_50.y = _452;
    out.m_50.z = _454;
    out.m_50.w = _448;
    return out;
}

