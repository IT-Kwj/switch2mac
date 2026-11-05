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
    constant _16* fp_c8 [[id(1)]];
    constant _16* fp_c10 [[id(2)]];
    constant _16* fp_c15 [[id(3)]];
    texture2d<float> fp_t_tcb_8 [[id(4)]];
    sampler fp_t_tcb_8Smplr [[id(5)]];
    texture2d_array<float> fp_t_tcb_A [[id(6)]];
    sampler fp_t_tcb_ASmplr [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    sampler fp_t_tcb_ASmplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_63 [[color(0)]];
};

struct main0_in
{
    float4 m_44 [[user(locn0)]];
    float4 m_46 [[user(locn1)]];
    float4 m_60 [[user(locn2), flat]];
    float4 m_67 [[user(locn3)]];
    float4 m_48 [[user(locn4)]];
    float4 m_42 [[user(locn5)]];
    float4 m_58 [[user(locn6)]];
    float4 m_40 [[user(locn7), flat]];
    float4 m_50 [[user(locn8)]];
    float4 m_52 [[user(locn9)]];
    float4 m_65 [[user(locn10)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], bool gl_FrontFacing [[front_facing]])
{
    main0_out out = {};
    float _74 = gl_FragCoord.w;
    float _76 = in.m_40.y;
    float _78 = in.m_42.x;
    float _80 = gl_FragCoord.w;
    float _82 = _78 * _80;
    float _84 = in.m_42.y;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = in.m_42.w;
    float _92 = gl_FragCoord.w;
    float _94 = _90 * _92;
    float _96 = in.m_42.z;
    float _98 = gl_FragCoord.w;
    float _100 = _96 * _98;
    float _102 = 1.0 / _74;
    float _104 = rint(_76);
    float _106 = precise::max(_104, 0.0);
    uint _109 = uint(_106);
    uint _111 = clamp(_109, 0u, 65535u);
    float _113 = _102 * _82;
    float _115 = _102 * _88;
    float _117 = _102 * _94;
    float _119 = _102 * _100;
    float2 _583 = float2(_113, _115);
    float _121 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_583, float2(0.0), isnan(_583))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_583, float2(0.0), isnan(_583))).w;
    float3 _597 = float3(_119, _117, float(int(_111)));
    float3 _601 = select(_597, float3(0.0), isnan(_597));
    float _123 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _601.xy, uint(rint(_601.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _601.xy, uint(rint(_601.z))).w;
    float _125 = in.m_44.w;
    float _127 = gl_FragCoord.w;
    float _129 = _125 * _127;
    float _131 = in.m_46.w;
    float _133 = gl_FragCoord.w;
    float _135 = _131 * _133;
    float _137 = in.m_48.x;
    float _139 = gl_FragCoord.w;
    float _141 = _137 * _139;
    float _143 = _102 * _129;
    float _145 = _102 * _135;
    float _147 = _102 * _141;
    float _149 = in.m_50.y;
    float _151 = gl_FragCoord.w;
    float _153 = _149 * _151;
    float _155 = in.m_50.x;
    float _157 = gl_FragCoord.w;
    float _159 = _155 * _157;
    float _161 = in.m_50.z;
    float _163 = gl_FragCoord.w;
    float _165 = _161 * _163;
    float _167 = _102 * _153;
    float _169 = -_143;
    float _171 = fma(_169, _121, 1.0);
    float _173 = _171 * _123;
    float _175 = _173 * _145;
    float _177 = 0.0 + _175;
    float _179 = precise::clamp(_177, 0.0, 1.0);
    float _181 = _179 * _147;
    bool _184 = _181 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _186 = isnan(_181);
    bool _188 = _184 || _186;
    bool _190 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _192 = _188 || _190;
    float _194 = in.m_52.y;
    float _196 = gl_FragCoord.w;
    float _198 = _194 * _196;
    float _200 = in.m_52.x;
    float _202 = gl_FragCoord.w;
    float _204 = _200 * _202;
    float _206 = in.m_52.z;
    float _208 = gl_FragCoord.w;
    float _210 = _206 * _208;
    if (!_192)
    {
        discard_fragment();
    }
    float _212 = _102 * _198;
    float _214 = _102 * _204;
    float _216 = -(*spvDescriptorSet0.fp_c8)._m0[29].y;
    float _218 = _212 + _216;
    float _220 = _102 * _210;
    float _222 = -(*spvDescriptorSet0.fp_c8)._m0[29].x;
    float _224 = _214 + _222;
    float _226 = _218 * _218;
    float _228 = -(*spvDescriptorSet0.fp_c8)._m0[29].z;
    float _230 = _220 + _228;
    float _232 = fma(_224, _224, _226);
    float _234 = fma(_230, _230, _232);
    float _236 = rsqrt(_234);
    float _238 = _102 * _165;
    float _240 = _224 * _236;
    float _242 = _218 * _236;
    float _244 = _230 * _236;
    float _246 = as_type<float>(gl_FrontFacing ? (-1) : 0);
    bool _248 = as_type<int>(_246) != 0;
    float _250 = _102 * _159;
    bool _252 = !_248;
    float _254 = -_167;
    float _256 = _252 ? _254 : _167;
    bool _258 = !_248;
    float _260 = -_250;
    float _262 = _258 ? _260 : _250;
    bool _264 = !_248;
    float _266 = -_238;
    float _268 = _264 ? _266 : _238;
    float _270 = _256 * _256;
    float _272 = fma(_262, _262, _270);
    float _274 = fma(_268, _268, _272);
    float _276 = rsqrt(_274);
    float _278 = _256 * _276;
    float _280 = _262 * _276;
    float _282 = _268 * _276;
    float _284 = _242 * _242;
    float _286 = _278 * _278;
    float _288 = fma(_280, _280, _286);
    float _290 = fma(_240, _240, _284);
    float _292 = fma(_282, _282, _288);
    float _294 = fma(_244, _244, _290);
    float _296 = rsqrt(_294);
    float _298 = rsqrt(_292);
    float _300 = in.m_44.z;
    float _302 = gl_FragCoord.w;
    float _304 = _300 * _302;
    float _306 = _242 * _296;
    float _308 = _240 * _296;
    float _310 = _244 * _296;
    float _312 = _278 * _298;
    float _314 = _280 * _298;
    float _316 = _282 * _298;
    float _318 = _312 * _306;
    float _320 = fma(_314, _308, _318);
    float _322 = in.m_58.y;
    float _324 = gl_FragCoord.w;
    float _326 = _322 * _324;
    float _328 = in.m_44.y;
    float _330 = gl_FragCoord.w;
    float _332 = _328 * _330;
    float _334 = fma(_316, _310, _320);
    float _336 = in.m_60.y;
    float _338 = in.m_44.x;
    float _340 = gl_FragCoord.w;
    float _342 = _338 * _340;
    float _344 = _102 * _326;
    float _346 = _344 * _336;
    float _348 = (*spvDescriptorSet0.fp_c10)._m0[2].x * 0.100000001490116119384765625;
    float _350 = fma(_346, 4.0, _348);
    float _352 = _350 * 0.15915493667125701904296875;
    float _354 = _352 * 6.283185482025146484375;
    float _356 = sin(_354);
    float _358 = fma(_356, 0.5, 0.5);
    float _360 = _102 * _342;
    float _362 = _358 * _358;
    float _364 = _358 * _362;
    float _366 = _102 * _332;
    float _368 = _102 * _304;
    float _370 = -_360;
    float _372 = _370 + 0.75;
    float _374 = _364 * 0.20000000298023223876953125;
    float _376 = -_366;
    float _378 = _376 + 0.75;
    float _380 = -_368;
    float _382 = _380 + 0.75;
    float _384 = fma(_374, _372, _360);
    float _386 = fma(_374, _378, _366);
    float _388 = fma(_374, _382, _368);
    float _390 = abs(_334);
    float _392 = fma(_390, -1.66666662693023681640625, 1.33333337306976318359375);
    float _394 = precise::clamp(_392, 0.0, 1.0);
    float _396 = fma(_394, -2.0, 3.0);
    float _398 = _394 * _394;
    float _400 = _396 * _398;
    float _402 = fma(_400, 0.25, _384);
    float _404 = fma(_400, 0.25, _386);
    float _406 = fma(_400, 0.25, _388);
    if (!_192)
    {
        out.m_63.x = _402;
        out.m_63.y = _404;
        out.m_63.z = _406;
        out.m_63.w = _175;
        return out;
    }
    float _408 = _404 * 0.715200006961822509765625;
    float _410 = in.m_65.w;
    float _412 = gl_FragCoord.w;
    float _414 = _410 * _412;
    float _416 = in.m_65.x;
    float _418 = gl_FragCoord.w;
    float _420 = _416 * _418;
    float _422 = in.m_65.y;
    float _424 = gl_FragCoord.w;
    float _426 = _422 * _424;
    float _428 = fma(_402, 0.2125999927520751953125, _408);
    float _430 = in.m_65.z;
    float _432 = gl_FragCoord.w;
    float _434 = _430 * _432;
    bool _436 = 0.5 <= (*spvDescriptorSet0.fp_c15)._m0[653].w;
    float _438 = fma(_406, 0.072200000286102294921875, _428);
    float _440 = 1.0 / _438;
    float _442 = _440 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _444 = precise::clamp(_442, 0.0, 1.0);
    float _446 = 0.0 + _181;
    float _448 = precise::clamp(_446, 0.0, 1.0);
    float _450 = _102 * _414;
    float _452 = fma(_444, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _454 = _102 * _426;
    float _456 = _102 * _434;
    float _458 = _452 * _450;
    float _460 = _102 * _420;
    float _462 = fma(_404, _458, _454);
    float _464 = fma(_402, _458, _460);
    float _466 = fma(_406, _458, _456);
    bool _468 = !_436;
    float _470 = _448;
    if (!_468)
    {
        float _472 = in.m_67.w;
        float _474 = gl_FragCoord.w;
        float _476 = _472 * _474;
        float _478 = in.m_67.z;
        float _480 = gl_FragCoord.w;
        float _482 = _478 * _480;
        float _484 = _102 * _476;
        float _486 = _102 * _482;
        float _488 = 1.0 / _484;
        float _490 = _486 * _488;
        float _492 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _494 = fma(_490, (*spvDescriptorSet0.fp_c8)._m0[30].w, _492);
        float _496 = 1.0 / _494;
        float _498 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _500 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _502 = fma(_496, _498, _500);
        float _504 = _502 * 8.0;
        float _506 = precise::clamp(_504, 0.0, 1.0);
        float _508 = _448 * _506;
        _470 = _508;
    }
    float _510 = _470;
    float _512 = 0.0 + _510;
    float _514 = precise::clamp(_512, 0.0, 1.0);
    out.m_63.x = _464;
    out.m_63.y = _462;
    out.m_63.z = _466;
    out.m_63.w = _514;
    return out;
}

