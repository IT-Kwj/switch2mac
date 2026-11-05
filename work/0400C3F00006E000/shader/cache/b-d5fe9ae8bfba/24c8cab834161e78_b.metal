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
    constant _16* fp_c8 [[id(0)]];
    constant _16* fp_c9 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
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
    float4 m_54 [[color(0)]];
};

struct main0_in
{
    float4 m_43 [[user(locn0)]];
    float4 m_51 [[user(locn1)]];
    float4 m_47 [[user(locn2)]];
    float4 m_41 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_39 [[user(locn5), flat]];
    float4 m_56 [[user(locn6)]];
    float4 m_49 [[user(locn7)]];
    float4 m_37 [[user(locn9)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _63 = gl_FragCoord.w;
    float _65 = in.m_37.y;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_37.x;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = (*spvDescriptorSet0.fp_c8)._m0[28].z * (*spvDescriptorSet0.fp_c8)._m0[1].x;
    float _79 = in.m_39.y;
    float _81 = (*spvDescriptorSet0.fp_c8)._m0[1].y * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _83 = (*spvDescriptorSet0.fp_c8)._m0[1].z * (*spvDescriptorSet0.fp_c8)._m0[28].y;
    float _85 = -_77;
    float _87 = fma((*spvDescriptorSet0.fp_c8)._m0[1].z, (*spvDescriptorSet0.fp_c8)._m0[28].x, _85);
    float _89 = in.m_39.x;
    float _91 = in.m_37.z;
    float _93 = gl_FragCoord.w;
    float _95 = _91 * _93;
    float _97 = fma((*spvDescriptorSet0.fp_c8)._m0[1].x, (*spvDescriptorSet0.fp_c8)._m0[1].x, _81);
    float _99 = -_83;
    float _101 = fma((*spvDescriptorSet0.fp_c8)._m0[1].y, (*spvDescriptorSet0.fp_c8)._m0[28].z, _99);
    float _103 = (*spvDescriptorSet0.fp_c8)._m0[1].y * (*spvDescriptorSet0.fp_c8)._m0[28].x;
    float _105 = _87 * _87;
    float _107 = in.m_39.z;
    float _109 = fma((*spvDescriptorSet0.fp_c8)._m0[1].z, (*spvDescriptorSet0.fp_c8)._m0[1].z, _97);
    float _111 = -_103;
    float _113 = fma((*spvDescriptorSet0.fp_c8)._m0[1].x, (*spvDescriptorSet0.fp_c8)._m0[28].y, _111);
    float _115 = fma(_101, _101, _105);
    float _117 = in.m_41.x;
    float _119 = gl_FragCoord.w;
    float _121 = _117 * _119;
    float _123 = in.m_41.y;
    float _125 = gl_FragCoord.w;
    float _127 = _123 * _125;
    float _129 = fma(_113, _113, _115);
    float _131 = rsqrt(_109);
    float _133 = 1.0 / _63;
    float _135 = rsqrt(_129);
    float _137 = _131 * (*spvDescriptorSet0.fp_c8)._m0[1].x;
    float _139 = _133 * _69;
    float _141 = _133 * _75;
    float _143 = -_79;
    float _145 = _139 + _143;
    float _147 = -_89;
    float _149 = _141 + _147;
    float _151 = _133 * _95;
    float _153 = _145 * 0.001000000047497451305389404296875;
    float _155 = _131 * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _157 = _87 * _135;
    float _159 = _149 * 0.001000000047497451305389404296875;
    float _161 = -_107;
    float _163 = _151 + _161;
    float _165 = _153 * _155;
    float _167 = _157 * _153;
    float _169 = _101 * _135;
    float _171 = _113 * _135;
    float _173 = fma(_159, _137, _165);
    float _175 = _163 * 0.001000000047497451305389404296875;
    float _177 = _131 * (*spvDescriptorSet0.fp_c8)._m0[1].z;
    float _179 = fma(_169, _159, _167);
    float _181 = _133 * _121;
    float _183 = _133 * _127;
    float _185 = fma(_175, _177, _173);
    float _187 = fma(_171, _175, _179);
    float2 _715;
    _715.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_181, _183));
    _715.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_181, _183));
    float _189 = _715.x;
    float _191 = _189 * 256.0;
    int _194 = int(_191);
    float2 _726;
    _726.x = spvDescriptorSet0.fp_t_tcb_A.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_ASmplr, float2(_187, _185));
    _726.y = spvDescriptorSet0.fp_t_tcb_A.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_ASmplr, float2(_187, _185));
    float _196 = _726.x;
    float _198 = _196 * 256.0;
    int _200 = int(_198);
    float _202 = float(uint(_194));
    float _204 = float(uint(_200));
    float _206 = _202 * 0.00390625;
    float _208 = _204 * 0.00390625;
    float _210 = precise::min(_206, 2.0);
    float _212 = precise::min(_208, 2.0);
    float2 _751 = float2(_181, _183);
    float _214 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_751, float2(0.0), isnan(_751)), level(_210)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_751, float2(0.0), isnan(_751)), level(_210)).w;
    float2 _763 = float2(_187, _185);
    float _216 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_763, float2(0.0), isnan(_763)), level(_212)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_763, float2(0.0), isnan(_763)), level(_212)).w;
    float _218 = in.m_43.w;
    float _220 = gl_FragCoord.w;
    float _222 = _218 * _220;
    float _224 = in.m_45.w;
    float _226 = gl_FragCoord.w;
    float _228 = _224 * _226;
    float _230 = -(*spvDescriptorSet0.fp_c8)._m0[29].y;
    float _232 = _139 + _230;
    float _234 = in.m_45.y;
    float _236 = gl_FragCoord.w;
    float _238 = _234 * _236;
    float _240 = (*spvDescriptorSet0.fp_c9)._m0[191].y + 2000.0;
    float _242 = precise::max(_232, (*spvDescriptorSet0.fp_c9)._m0[191].y);
    float _244 = precise::min(_240, _242);
    float _246 = in.m_47.x;
    float _248 = gl_FragCoord.w;
    float _250 = _246 * _248;
    float _252 = _133 * _222;
    float _254 = _214 + _216;
    float _256 = _252 + 0.100000001490116119384765625;
    float _258 = precise::max(_252, _254);
    float _260 = precise::min(_256, _258);
    float _262 = _133 * _238;
    float _264 = -_252;
    float _266 = _264 + _260;
    float _268 = _133 * _228;
    float _270 = _266 * 10.0;
    float _272 = _270 * _268;
    float _274 = -(*spvDescriptorSet0.fp_c9)._m0[191].y;
    float _276 = _244 + _274;
    float _278 = _262 + _272;
    float _280 = _276 * 0.0005000000237487256526947021484375;
    float _282 = _278 * _280;
    float _284 = _133 * _250;
    float _286 = 0.0 + _282;
    float _288 = precise::clamp(_286, 0.0, 1.0);
    float _290 = _288 * _284;
    bool _294 = _290 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _296 = isnan(_290);
    bool _298 = _294 || _296;
    bool _300 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _302 = _298 || _300;
    float _304 = in.m_49.x;
    float _306 = gl_FragCoord.w;
    float _308 = _304 * _306;
    float _310 = in.m_49.y;
    float _312 = gl_FragCoord.w;
    float _314 = _310 * _312;
    if (!_302)
    {
        discard_fragment();
    }
    float _316 = _133 * _308;
    float _318 = _133 * _314;
    float2 _916 = float2(_316, _318);
    float3 _322 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_916, float2(0.0), isnan(_916))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_916, float2(0.0), isnan(_916))).xyz;
    float _324 = _322.x;
    float _326 = _322.y;
    float _328 = _322.z;
    float _330 = in.m_51.x;
    float _332 = gl_FragCoord.w;
    float _334 = _330 * _332;
    float _336 = in.m_43.x;
    float _338 = gl_FragCoord.w;
    float _340 = _336 * _338;
    float _342 = in.m_51.y;
    float _344 = gl_FragCoord.w;
    float _346 = _342 * _344;
    float _348 = in.m_51.z;
    float _350 = gl_FragCoord.w;
    float _352 = _348 * _350;
    float _354 = in.m_43.y;
    float _356 = gl_FragCoord.w;
    float _358 = _354 * _356;
    float _360 = in.m_43.z;
    float _362 = gl_FragCoord.w;
    float _364 = _360 * _362;
    float _366 = in.m_51.w;
    float _368 = gl_FragCoord.w;
    float _370 = _366 * _368;
    float _372 = _133 * _334;
    float _374 = _133 * _340;
    float _376 = _133 * _346;
    float _378 = _133 * _352;
    float _380 = _133 * _358;
    float _382 = _133 * _364;
    float _384 = -_372;
    float _386 = _384 + _374;
    float _388 = _133 * _370;
    float _390 = -_376;
    float _392 = _390 + _380;
    float _394 = -_378;
    float _396 = _394 + _382;
    float _398 = fma(_272, _386, _372);
    float _400 = _388 * _262;
    float _402 = fma(_272, _392, _376);
    float _404 = fma(_272, _396, _378);
    float _406 = -_262;
    float _408 = _406 + 1.0;
    float _410 = _324 * _324;
    float _412 = _326 * _326;
    float _414 = _328 * _328;
    float _416 = _410 * _400;
    float _418 = _412 * _400;
    float _420 = _414 * _400;
    float _422 = fma(_398, _408, _416);
    float _424 = fma(_402, _408, _418);
    float _426 = fma(_404, _408, _420);
    if (!_302)
    {
        out.m_54.x = _422;
        out.m_54.y = _424;
        out.m_54.z = _426;
        out.m_54.w = _282;
        return out;
    }
    float _428 = _424 * 0.715200006961822509765625;
    float _430 = 0.0 + _290;
    float _432 = precise::clamp(_430, 0.0, 1.0);
    float _434 = fma(_422, 0.2125999927520751953125, _428);
    bool _436 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _438 = fma(_426, 0.072200000286102294921875, _434);
    float _440 = 1.0 / _438;
    float _442 = _440 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _444 = precise::clamp(_442, 0.0, 1.0);
    float _446 = fma(_444, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _448 = _422 * _446;
    float _450 = _424 * _446;
    float _452 = _426 * _446;
    float _454 = _446;
    if (!_436)
    {
        _454 = _432;
    }
    float _456 = _454;
    bool _458 = !_436;
    float _460 = _456;
    if (!_458)
    {
        float _462 = in.m_56.w;
        float _464 = gl_FragCoord.w;
        float _466 = _462 * _464;
        float _468 = in.m_56.z;
        float _470 = gl_FragCoord.w;
        float _472 = _468 * _470;
        float _474 = _133 * _466;
        float _476 = _133 * _472;
        float _478 = 1.0 / _474;
        float _480 = _476 * _478;
        float _482 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _484 = fma(_480, (*spvDescriptorSet0.fp_c8)._m0[30].w, _482);
        float _486 = 1.0 / _484;
        float _488 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _490 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _492 = fma(_486, _488, _490);
        float _494 = _492 * 8.0;
        float _496 = precise::clamp(_494, 0.0, 1.0);
        float _498 = _432 * _496;
        _460 = _498;
    }
    float _500 = _460;
    float _502 = 0.0 + _500;
    float _504 = precise::clamp(_502, 0.0, 1.0);
    out.m_54.x = _448;
    out.m_54.y = _450;
    out.m_54.z = _452;
    out.m_54.w = _504;
    return out;
}

