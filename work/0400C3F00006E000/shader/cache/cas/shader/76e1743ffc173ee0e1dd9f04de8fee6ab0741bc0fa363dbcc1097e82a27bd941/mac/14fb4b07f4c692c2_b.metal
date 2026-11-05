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
    float _77 = in.m_39.y;
    float _79 = (*spvDescriptorSet0.fp_c8)._m0[28].z * (*spvDescriptorSet0.fp_c8)._m0[1].x;
    float _81 = in.m_39.x;
    float _83 = in.m_37.z;
    float _85 = gl_FragCoord.w;
    float _87 = _83 * _85;
    float _89 = (*spvDescriptorSet0.fp_c8)._m0[1].z * (*spvDescriptorSet0.fp_c8)._m0[28].y;
    float _91 = (*spvDescriptorSet0.fp_c8)._m0[1].y * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _93 = -_79;
    float _95 = fma((*spvDescriptorSet0.fp_c8)._m0[1].z, (*spvDescriptorSet0.fp_c8)._m0[28].x, _93);
    float _97 = in.m_39.z;
    float _99 = -_89;
    float _101 = fma((*spvDescriptorSet0.fp_c8)._m0[1].y, (*spvDescriptorSet0.fp_c8)._m0[28].z, _99);
    float _103 = fma((*spvDescriptorSet0.fp_c8)._m0[1].x, (*spvDescriptorSet0.fp_c8)._m0[1].x, _91);
    float _105 = (*spvDescriptorSet0.fp_c8)._m0[1].y * (*spvDescriptorSet0.fp_c8)._m0[28].x;
    float _107 = _95 * _95;
    float _109 = in.m_41.x;
    float _111 = gl_FragCoord.w;
    float _113 = _109 * _111;
    float _115 = fma((*spvDescriptorSet0.fp_c8)._m0[1].z, (*spvDescriptorSet0.fp_c8)._m0[1].z, _103);
    float _117 = -_105;
    float _119 = fma((*spvDescriptorSet0.fp_c8)._m0[1].x, (*spvDescriptorSet0.fp_c8)._m0[28].y, _117);
    float _121 = fma(_101, _101, _107);
    float _123 = in.m_41.y;
    float _125 = gl_FragCoord.w;
    float _127 = _123 * _125;
    float _129 = fma(_119, _119, _121);
    float _131 = rsqrt(_115);
    float _133 = 1.0 / _63;
    float _135 = rsqrt(_129);
    float _137 = _133 * _69;
    float _139 = _133 * _75;
    float _141 = _131 * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _143 = -_77;
    float _145 = _137 + _143;
    float _147 = -_81;
    float _149 = _139 + _147;
    float _151 = _133 * _87;
    float _153 = _131 * (*spvDescriptorSet0.fp_c8)._m0[1].x;
    float _155 = _145 * 0.001000000047497451305389404296875;
    float _157 = _95 * _135;
    float _159 = -_97;
    float _161 = _151 + _159;
    float _163 = _149 * 0.001000000047497451305389404296875;
    float _165 = _155 * _141;
    float _167 = _157 * _155;
    float _169 = _101 * _135;
    float _171 = _161 * 0.001000000047497451305389404296875;
    float _173 = fma(_163, _153, _165);
    float _175 = _131 * (*spvDescriptorSet0.fp_c8)._m0[1].z;
    float _177 = _119 * _135;
    float _179 = fma(_169, _163, _167);
    float _181 = _133 * _113;
    float _183 = _133 * _127;
    float _185 = fma(_171, _175, _173);
    float _187 = fma(_177, _171, _179);
    float2 _697;
    _697.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_181, _183));
    _697.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_181, _183));
    float _189 = _697.x;
    float _191 = _189 * 256.0;
    int _194 = int(_191);
    float2 _708;
    _708.x = spvDescriptorSet0.fp_t_tcb_A.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_ASmplr, float2(_187, _185));
    _708.y = spvDescriptorSet0.fp_t_tcb_A.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_ASmplr, float2(_187, _185));
    float _196 = _708.x;
    float _198 = _196 * 256.0;
    int _200 = int(_198);
    float _202 = float(uint(_194));
    float _204 = float(uint(_200));
    float _206 = _202 * 0.00390625;
    float _208 = _204 * 0.00390625;
    float _210 = precise::min(_206, 2.0);
    float _212 = precise::min(_208, 2.0);
    float2 _733 = float2(_181, _183);
    float _214 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_733, float2(0.0), isnan(_733)), level(_210)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_733, float2(0.0), isnan(_733)), level(_210)).w;
    float2 _745 = float2(_187, _185);
    float _216 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_745, float2(0.0), isnan(_745)), level(_212)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_745, float2(0.0), isnan(_745)), level(_212)).w;
    float _218 = in.m_43.w;
    float _220 = gl_FragCoord.w;
    float _222 = _218 * _220;
    float _224 = in.m_45.w;
    float _226 = gl_FragCoord.w;
    float _228 = _224 * _226;
    float _230 = in.m_45.y;
    float _232 = gl_FragCoord.w;
    float _234 = _230 * _232;
    float _236 = in.m_47.x;
    float _238 = gl_FragCoord.w;
    float _240 = _236 * _238;
    float _242 = _133 * _222;
    float _244 = _242 + 0.100000001490116119384765625;
    float _246 = _133 * _234;
    float _248 = in.m_49.y;
    float _250 = gl_FragCoord.w;
    float _252 = _248 * _250;
    float _254 = _214 + _216;
    float _256 = precise::max(_242, _254);
    float _258 = precise::min(_244, _256);
    float _260 = -_242;
    float _262 = _260 + _258;
    float _264 = _133 * _228;
    float _266 = _262 * 10.0;
    float _268 = _266 * _264;
    float _270 = _133 * _240;
    float _272 = _246 + _268;
    float _274 = 0.0 + _272;
    float _276 = precise::clamp(_274, 0.0, 1.0);
    float _278 = _276 * _270;
    bool _282 = _278 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _284 = isnan(_278);
    bool _286 = _282 || _284;
    bool _288 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _290 = _286 || _288;
    float _292 = in.m_49.x;
    float _294 = gl_FragCoord.w;
    float _296 = _292 * _294;
    if (!_290)
    {
        discard_fragment();
    }
    float _298 = _133 * _296;
    float _300 = _133 * _252;
    float2 _867 = float2(_298, _300);
    float3 _304 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_867, float2(0.0), isnan(_867))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_867, float2(0.0), isnan(_867))).xyz;
    float _306 = _304.x;
    float _308 = _304.y;
    float _310 = _304.z;
    float _312 = in.m_51.x;
    float _314 = gl_FragCoord.w;
    float _316 = _312 * _314;
    float _318 = in.m_51.y;
    float _320 = gl_FragCoord.w;
    float _322 = _318 * _320;
    float _324 = in.m_43.x;
    float _326 = gl_FragCoord.w;
    float _328 = _324 * _326;
    float _330 = in.m_43.y;
    float _332 = gl_FragCoord.w;
    float _334 = _330 * _332;
    float _336 = in.m_51.z;
    float _338 = gl_FragCoord.w;
    float _340 = _336 * _338;
    float _342 = in.m_43.z;
    float _344 = gl_FragCoord.w;
    float _346 = _342 * _344;
    float _348 = in.m_51.w;
    float _350 = gl_FragCoord.w;
    float _352 = _348 * _350;
    float _354 = _133 * _316;
    float _356 = _133 * _322;
    float _358 = _133 * _328;
    float _360 = _133 * _334;
    float _362 = _133 * _340;
    float _364 = _133 * _346;
    float _366 = -_354;
    float _368 = _366 + _358;
    float _370 = -_356;
    float _372 = _370 + _360;
    float _374 = _133 * _352;
    float _376 = -_362;
    float _378 = _376 + _364;
    float _380 = fma(_268, _368, _354);
    float _382 = fma(_268, _372, _356);
    float _384 = -_246;
    float _386 = _384 + 1.0;
    float _388 = fma(_268, _378, _362);
    float _390 = _374 * _246;
    float _392 = _306 * _306;
    float _394 = _308 * _308;
    float _396 = _310 * _310;
    float _398 = _392 * _390;
    float _400 = _394 * _390;
    float _402 = _396 * _390;
    float _404 = fma(_380, _386, _398);
    float _406 = fma(_382, _386, _400);
    float _408 = fma(_388, _386, _402);
    if (!_290)
    {
        out.m_54.x = _404;
        out.m_54.y = _406;
        out.m_54.z = _408;
        out.m_54.w = _272;
        return out;
    }
    float _410 = _406 * 0.715200006961822509765625;
    float _412 = 0.0 + _278;
    float _414 = precise::clamp(_412, 0.0, 1.0);
    float _416 = fma(_404, 0.2125999927520751953125, _410);
    bool _418 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _420 = fma(_408, 0.072200000286102294921875, _416);
    float _422 = 1.0 / _420;
    float _424 = _422 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _426 = precise::clamp(_424, 0.0, 1.0);
    float _428 = fma(_426, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _430 = _404 * _428;
    float _432 = _406 * _428;
    float _434 = _408 * _428;
    float _436 = _428;
    if (!_418)
    {
        _436 = _414;
    }
    float _438 = _436;
    bool _440 = !_418;
    float _442 = _438;
    if (!_440)
    {
        float _444 = in.m_56.w;
        float _446 = gl_FragCoord.w;
        float _448 = _444 * _446;
        float _450 = in.m_56.z;
        float _452 = gl_FragCoord.w;
        float _454 = _450 * _452;
        float _456 = _133 * _448;
        float _458 = _133 * _454;
        float _460 = 1.0 / _456;
        float _462 = _458 * _460;
        float _464 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _466 = fma(_462, (*spvDescriptorSet0.fp_c8)._m0[30].w, _464);
        float _468 = 1.0 / _466;
        float _470 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _472 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _474 = fma(_468, _470, _472);
        float _476 = _474 * 8.0;
        float _478 = precise::clamp(_476, 0.0, 1.0);
        float _480 = _414 * _478;
        _442 = _480;
    }
    float _482 = _442;
    float _484 = 0.0 + _482;
    float _486 = precise::clamp(_484, 0.0, 1.0);
    out.m_54.x = _430;
    out.m_54.y = _432;
    out.m_54.z = _434;
    out.m_54.w = _486;
    return out;
}

