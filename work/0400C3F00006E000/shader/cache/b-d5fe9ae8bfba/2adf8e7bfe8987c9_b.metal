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
    constant _16* fp_c15 [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_10 [[id(5)]];
    sampler fp_t_tcb_10Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_C [[id(7)]];
    sampler fp_t_tcb_CSmplr [[id(8)]];
    texture2d<float> fp_t_tcb_A [[id(9)]];
    sampler fp_t_tcb_ASmplr [[id(10)]];
    texture2d<float> fp_t_tcb_34 [[id(11)]];
    sampler fp_t_tcb_34Smplr [[id(12)]];
    sampler fp_t_tcb_8Smplr_w [[id(13)]];
    sampler fp_t_tcb_10Smplr_w [[id(14)]];
    sampler fp_t_tcb_CSmplr_w [[id(15)]];
    sampler fp_t_tcb_ASmplr_w [[id(16)]];
    sampler fp_t_tcb_34Smplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

struct main0_out
{
    float4 m_58 [[color(0)]];
};

struct main0_in
{
    float4 m_49 [[user(locn0)]];
    float4 m_51 [[user(locn1)]];
    float4 m_41 [[user(locn2)]];
    float4 m_43 [[user(locn3)]];
    float4 m_53 [[user(locn4)]];
    float4 m_47 [[user(locn5), flat]];
    float4 m_45 [[user(locn6)]];
    float4 m_55 [[user(locn7)]];
    float4 m_60 [[user(locn9)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _67 = gl_FragCoord.w;
    float _69 = in.m_41.x;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_41.y;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_43.w;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = in.m_43.x;
    float _89 = gl_FragCoord.w;
    float _91 = _87 * _89;
    float _93 = in.m_43.y;
    float _95 = gl_FragCoord.w;
    float _97 = _93 * _95;
    float _99 = in.m_45.x;
    float _101 = gl_FragCoord.w;
    float _103 = _99 * _101;
    float _105 = in.m_45.y;
    float _107 = gl_FragCoord.w;
    float _109 = _105 * _107;
    float _111 = 1.0 / _67;
    float _113 = _111 * _73;
    float _115 = _111 * _79;
    float _117 = _111 * _85;
    float _119 = _111 * _91;
    float _121 = _111 * _97;
    float _123 = _111 * _103;
    float2 _548 = float2(_113, _115);
    float2 _127 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_548, float2(0.0), isnan(_548))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_548, float2(0.0), isnan(_548))).xy;
    float _129 = _127.x;
    float _131 = _127.y;
    float _133 = _111 * _109;
    float _135 = 1.0 / _117;
    float _137 = _119 * _135;
    float _139 = _121 * _135;
    float2 _574 = float2(_137, _139);
    float _141 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_574, float2(0.0), isnan(_574))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_574, float2(0.0), isnan(_574))).x;
    float2 _582 = float2(_123, _133);
    float _143 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_582, float2(0.0), isnan(_582))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_582, float2(0.0), isnan(_582))).w;
    float _145 = in.m_47.x;
    float _147 = in.m_41.z;
    float _149 = gl_FragCoord.w;
    float _151 = _147 * _149;
    float _153 = in.m_41.w;
    float _155 = gl_FragCoord.w;
    float _157 = _153 * _155;
    float _159 = _111 * _157;
    float _161 = fma(_129, 2.0, -1.0);
    float _163 = fma(_131, 2.0, -1.0);
    float _165 = _145 * (*spvDescriptorSet0.fp_c9)._m0[21].x;
    float _167 = _145 * (*spvDescriptorSet0.fp_c9)._m0[21].y;
    float _169 = _111 * _151;
    float _171 = fma(_167, _163, _159);
    float _173 = fma(_165, _161, _169);
    float2 _638 = float2(_173, _171);
    float4 _176 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_638, float2(0.0), isnan(_638))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_638, float2(0.0), isnan(_638))).xyzw;
    float _178 = _176.x;
    float _180 = _176.y;
    float _182 = _176.z;
    float _184 = _176.w;
    float _186 = in.m_43.z;
    float _188 = gl_FragCoord.w;
    float _190 = _186 * _188;
    float _192 = in.m_49.w;
    float _194 = gl_FragCoord.w;
    float _196 = _192 * _194;
    float _198 = in.m_51.w;
    float _200 = gl_FragCoord.w;
    float _202 = _198 * _200;
    float _204 = in.m_53.x;
    float _206 = gl_FragCoord.w;
    float _208 = _204 * _206;
    float _210 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _212 = _111 * _190;
    float _214 = _212 * _135;
    float _216 = _111 * _196;
    float _218 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _220 = fma(_214, (*spvDescriptorSet0.fp_c8)._m0[30].w, _218);
    float _222 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _224 = fma(_141, (*spvDescriptorSet0.fp_c8)._m0[30].w, _222);
    float _226 = 1.0 / _224;
    float _228 = 1.0 / _220;
    float _230 = _111 * _202;
    float _232 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _234 = _228 * _232;
    float _236 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _238 = -_234;
    float _240 = fma(_226, _236, _238);
    float _242 = _240 * _210;
    float _244 = precise::clamp(_242, 0.0, 1.0);
    float _246 = _111 * _208;
    float _248 = in.m_55.y;
    float _250 = gl_FragCoord.w;
    float _252 = _248 * _250;
    float _254 = _111 * _252;
    float _256 = -_216;
    float _258 = fma(_184, _143, _256);
    float _260 = _230 * _258;
    float _262 = 0.0 + _260;
    float _264 = precise::clamp(_262, 0.0, 1.0);
    float _266 = _264 * _244;
    float _268 = _266 * _246;
    bool _272 = _268 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _274 = isnan(_268);
    bool _276 = _272 || _274;
    bool _278 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _280 = _276 || _278;
    float _282 = in.m_55.x;
    float _284 = gl_FragCoord.w;
    float _286 = _282 * _284;
    float _288 = _234;
    if (!_280)
    {
        discard_fragment();
    }
    float _290 = _111 * _286;
    float2 _802 = float2(_290, _254);
    float3 _294 = dm_bs(spvDescriptorSet0.fp_t_tcb_34.sample(spvDescriptorSet0.fp_t_tcb_34Smplr, select(_802, float2(0.0), isnan(_802))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_34, spvDescriptorSet0.fp_t_tcb_34Smplr_w, select(_802, float2(0.0), isnan(_802))).xyz;
    float _296 = _294.x;
    float _298 = _294.y;
    float _300 = _294.z;
    float _302 = in.m_49.x;
    float _304 = gl_FragCoord.w;
    float _306 = _302 * _304;
    float _308 = in.m_49.y;
    float _310 = gl_FragCoord.w;
    float _312 = _308 * _310;
    float _314 = in.m_51.x;
    float _316 = gl_FragCoord.w;
    float _318 = _314 * _316;
    float _320 = in.m_51.y;
    float _322 = gl_FragCoord.w;
    float _324 = _320 * _322;
    float _326 = in.m_49.z;
    float _328 = gl_FragCoord.w;
    float _330 = _326 * _328;
    float _332 = in.m_51.z;
    float _334 = gl_FragCoord.w;
    float _336 = _332 * _334;
    float _338 = _180 * _180;
    float _340 = _178 * _178;
    float _342 = _182 * _182;
    float _344 = _111 * _318;
    float _346 = _111 * _336;
    float _348 = _296 * _296;
    float _350 = _298 * _298;
    float _352 = _300 * _300;
    float _354 = _340 * _348;
    float _356 = _338 * _350;
    float _358 = _111 * _306;
    float _360 = _111 * _312;
    float _362 = _111 * _324;
    float _364 = _111 * _330;
    float _366 = _342 * _352;
    float _368 = -_344;
    float _370 = _358 + _368;
    float _372 = -_362;
    float _374 = _360 + _372;
    float _376 = -_346;
    float _378 = _364 + _376;
    float _380 = fma(_354, _370, _344);
    float _382 = fma(_356, _374, _362);
    float _384 = fma(_366, _378, _346);
    if (!_280)
    {
        out.m_58.x = _380;
        out.m_58.y = _382;
        out.m_58.z = _384;
        out.m_58.w = _260;
        return out;
    }
    float _386 = _382 * 0.715200006961822509765625;
    float _388 = in.m_60.w;
    float _390 = gl_FragCoord.w;
    float _392 = _388 * _390;
    float _394 = in.m_60.x;
    float _396 = gl_FragCoord.w;
    float _398 = _394 * _396;
    float _400 = in.m_60.y;
    float _402 = gl_FragCoord.w;
    float _404 = _400 * _402;
    float _406 = fma(_380, 0.2125999927520751953125, _386);
    float _408 = in.m_60.z;
    float _410 = gl_FragCoord.w;
    float _412 = _408 * _410;
    float _414 = fma(_384, 0.072200000286102294921875, _406);
    bool _416 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _418 = 1.0 / _414;
    float _420 = (*spvDescriptorSet0.fp_c15)._m0[2].y;
    if (_416)
    {
        float _422 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _424 = _234 + _422;
        _288 = _424;
    }
    float _426 = _288;
    float _428 = _418 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _430 = precise::clamp(_428, 0.0, 1.0);
    float _432 = fma(_430, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _434 = _111 * _392;
    if (_416)
    {
        float _436 = _426 * 8.0;
        float _438 = precise::clamp(_436, 0.0, 1.0);
        _420 = _438;
    }
    float _440 = _420;
    float _442 = _111 * _404;
    float _444 = _432 * _434;
    float _446 = 0.0 + _268;
    float _448 = precise::clamp(_446, 0.0, 1.0);
    float _450 = _111 * _398;
    float _452 = _111 * _412;
    float _454 = fma(_382, _444, _442);
    float _456 = _448;
    if (_416)
    {
        float _458 = _448 * _440;
        _456 = _458;
    }
    float _460 = _456;
    float _462 = fma(_380, _444, _450);
    float _464 = fma(_384, _444, _452);
    float _466 = 0.0 + _460;
    float _468 = precise::clamp(_466, 0.0, 1.0);
    out.m_58.x = _462;
    out.m_58.y = _454;
    out.m_58.z = _464;
    out.m_58.w = _468;
    return out;
}

