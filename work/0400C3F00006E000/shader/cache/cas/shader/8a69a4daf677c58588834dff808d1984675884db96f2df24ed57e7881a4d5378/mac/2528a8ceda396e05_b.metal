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
    float4 m_41 [[user(locn0)]];
    float4 m_47 [[user(locn1)]];
    float4 m_45 [[user(locn2)]];
    float4 m_39 [[user(locn3)]];
    float4 m_43 [[user(locn4)]];
    float4 m_37 [[user(locn5), flat]];
    float4 m_52 [[user(locn6)]];
    float4 m_35 [[user(locn9)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _59 = gl_FragCoord.w;
    float _61 = in.m_35.y;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = in.m_35.x;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = (*spvDescriptorSet0.fp_c8)._m0[28].z * (*spvDescriptorSet0.fp_c8)._m0[1].x;
    float _75 = in.m_37.y;
    float _77 = (*spvDescriptorSet0.fp_c8)._m0[1].y * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _79 = (*spvDescriptorSet0.fp_c8)._m0[1].z * (*spvDescriptorSet0.fp_c8)._m0[28].y;
    float _81 = -_73;
    float _83 = fma((*spvDescriptorSet0.fp_c8)._m0[1].z, (*spvDescriptorSet0.fp_c8)._m0[28].x, _81);
    float _85 = in.m_37.x;
    float _87 = in.m_35.z;
    float _89 = gl_FragCoord.w;
    float _91 = _87 * _89;
    float _93 = fma((*spvDescriptorSet0.fp_c8)._m0[1].x, (*spvDescriptorSet0.fp_c8)._m0[1].x, _77);
    float _95 = -_79;
    float _97 = fma((*spvDescriptorSet0.fp_c8)._m0[1].y, (*spvDescriptorSet0.fp_c8)._m0[28].z, _95);
    float _99 = (*spvDescriptorSet0.fp_c8)._m0[1].y * (*spvDescriptorSet0.fp_c8)._m0[28].x;
    float _101 = _83 * _83;
    float _103 = in.m_37.z;
    float _105 = fma((*spvDescriptorSet0.fp_c8)._m0[1].z, (*spvDescriptorSet0.fp_c8)._m0[1].z, _93);
    float _107 = -_99;
    float _109 = fma((*spvDescriptorSet0.fp_c8)._m0[1].x, (*spvDescriptorSet0.fp_c8)._m0[28].y, _107);
    float _111 = fma(_97, _97, _101);
    float _113 = in.m_39.x;
    float _115 = gl_FragCoord.w;
    float _117 = _113 * _115;
    float _119 = in.m_39.y;
    float _121 = gl_FragCoord.w;
    float _123 = _119 * _121;
    float _125 = fma(_109, _109, _111);
    float _127 = rsqrt(_105);
    float _129 = 1.0 / _59;
    float _131 = rsqrt(_125);
    float _133 = _127 * (*spvDescriptorSet0.fp_c8)._m0[1].x;
    float _135 = _129 * _65;
    float _137 = _129 * _71;
    float _139 = -_75;
    float _141 = _135 + _139;
    float _143 = -_85;
    float _145 = _137 + _143;
    float _147 = _129 * _91;
    float _149 = _141 * 0.001000000047497451305389404296875;
    float _151 = _127 * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _153 = _83 * _131;
    float _155 = _145 * 0.001000000047497451305389404296875;
    float _157 = -_103;
    float _159 = _147 + _157;
    float _161 = _149 * _151;
    float _163 = _153 * _149;
    float _165 = _97 * _131;
    float _167 = _109 * _131;
    float _169 = fma(_155, _133, _161);
    float _171 = _159 * 0.001000000047497451305389404296875;
    float _173 = _127 * (*spvDescriptorSet0.fp_c8)._m0[1].z;
    float _175 = fma(_165, _155, _163);
    float _177 = _129 * _117;
    float _179 = _129 * _123;
    float _181 = fma(_171, _173, _169);
    float _183 = fma(_167, _171, _175);
    float2 _673;
    _673.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_177, _179));
    _673.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_177, _179));
    float _185 = _673.x;
    float _187 = _185 * 256.0;
    int _190 = int(_187);
    float2 _684;
    _684.x = spvDescriptorSet0.fp_t_tcb_A.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_ASmplr, float2(_183, _181));
    _684.y = spvDescriptorSet0.fp_t_tcb_A.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_ASmplr, float2(_183, _181));
    float _192 = _684.x;
    float _194 = _192 * 256.0;
    int _196 = int(_194);
    float _198 = float(uint(_190));
    float _200 = float(uint(_196));
    float _202 = _198 * 0.00390625;
    float _204 = _200 * 0.00390625;
    float _206 = precise::min(_202, 2.0);
    float _208 = precise::min(_204, 2.0);
    float2 _709 = float2(_177, _179);
    float _210 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_709, float2(0.0), isnan(_709)), level(_206)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_709, float2(0.0), isnan(_709)), level(_206)).w;
    float2 _721 = float2(_183, _181);
    float _212 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_721, float2(0.0), isnan(_721)), level(_208)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_721, float2(0.0), isnan(_721)), level(_208)).w;
    float _214 = in.m_41.w;
    float _216 = gl_FragCoord.w;
    float _218 = _214 * _216;
    float _220 = in.m_43.w;
    float _222 = gl_FragCoord.w;
    float _224 = _220 * _222;
    float _226 = -(*spvDescriptorSet0.fp_c8)._m0[29].y;
    float _228 = _135 + _226;
    float _230 = in.m_43.y;
    float _232 = gl_FragCoord.w;
    float _234 = _230 * _232;
    float _236 = (*spvDescriptorSet0.fp_c9)._m0[191].y + 2000.0;
    float _238 = precise::max(_228, (*spvDescriptorSet0.fp_c9)._m0[191].y);
    float _240 = precise::min(_236, _238);
    float _242 = in.m_45.x;
    float _244 = gl_FragCoord.w;
    float _246 = _242 * _244;
    float _248 = _129 * _218;
    float _250 = in.m_41.x;
    float _252 = gl_FragCoord.w;
    float _254 = _250 * _252;
    float _256 = in.m_47.z;
    float _258 = gl_FragCoord.w;
    float _260 = _256 * _258;
    float _262 = in.m_41.z;
    float _264 = gl_FragCoord.w;
    float _266 = _262 * _264;
    float _268 = _129 * _254;
    float _270 = _210 + _212;
    float _272 = _248 + 0.100000001490116119384765625;
    float _274 = precise::max(_248, _270);
    float _276 = _129 * _234;
    float _278 = precise::min(_272, _274);
    float _280 = -_248;
    float _282 = _280 + _278;
    float _284 = _129 * _224;
    float _286 = _282 * 10.0;
    float _288 = _286 * _284;
    float _290 = -(*spvDescriptorSet0.fp_c9)._m0[191].y;
    float _292 = _240 + _290;
    float _294 = _276 + _288;
    float _296 = _292 * 0.0005000000237487256526947021484375;
    float _298 = _294 * _296;
    float _300 = _129 * _246;
    float _302 = 0.0 + _298;
    float _304 = precise::clamp(_302, 0.0, 1.0);
    float _306 = _304 * _300;
    bool _310 = _306 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _312 = isnan(_306);
    bool _314 = _310 || _312;
    bool _316 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _318 = _314 || _316;
    float _320 = in.m_47.x;
    float _322 = gl_FragCoord.w;
    float _324 = _320 * _322;
    float _326 = in.m_47.y;
    float _328 = gl_FragCoord.w;
    float _330 = _326 * _328;
    float _332 = in.m_41.y;
    float _334 = gl_FragCoord.w;
    float _336 = _332 * _334;
    float _338 = in.m_47.w;
    float _340 = gl_FragCoord.w;
    float _342 = _338 * _340;
    if (!_318)
    {
        discard_fragment();
    }
    float _344 = _129 * _260;
    float _346 = _129 * _324;
    float _348 = _129 * _330;
    float _350 = _129 * _336;
    float _352 = _129 * _342;
    float _354 = -_346;
    float _356 = _354 + _268;
    float _358 = _129 * _266;
    float _360 = -_348;
    float _362 = _360 + _350;
    float _364 = _352 * _276;
    float _366 = fma(_288, _356, _346);
    float _368 = -_344;
    float _370 = _368 + _358;
    float _372 = -_276;
    float _374 = _372 + 1.0;
    float _376 = fma(_288, _362, _348);
    float _378 = fma(_288, _370, _344);
    float _380 = fma(_366, _374, _364);
    float _382 = fma(_376, _374, _364);
    float _384 = fma(_378, _374, _364);
    if (!_318)
    {
        out.m_50.x = _380;
        out.m_50.y = _382;
        out.m_50.z = _384;
        out.m_50.w = _298;
        return out;
    }
    float _386 = _382 * 0.715200006961822509765625;
    float _388 = 0.0 + _306;
    float _390 = precise::clamp(_388, 0.0, 1.0);
    float _392 = fma(_380, 0.2125999927520751953125, _386);
    bool _394 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _396 = fma(_384, 0.072200000286102294921875, _392);
    float _398 = 1.0 / _396;
    float _400 = _398 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _402 = precise::clamp(_400, 0.0, 1.0);
    float _404 = fma(_402, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _406 = _380 * _404;
    float _408 = _382 * _404;
    float _410 = _384 * _404;
    float _412 = _404;
    if (!_394)
    {
        _412 = _390;
    }
    float _414 = _412;
    bool _416 = !_394;
    float _418 = _414;
    if (!_416)
    {
        float _420 = in.m_52.w;
        float _422 = gl_FragCoord.w;
        float _424 = _420 * _422;
        float _426 = in.m_52.z;
        float _428 = gl_FragCoord.w;
        float _430 = _426 * _428;
        float _432 = _129 * _424;
        float _434 = _129 * _430;
        float _436 = 1.0 / _432;
        float _438 = _434 * _436;
        float _440 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _442 = fma(_438, (*spvDescriptorSet0.fp_c8)._m0[30].w, _440);
        float _444 = 1.0 / _442;
        float _446 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _448 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _450 = fma(_444, _446, _448);
        float _452 = _450 * 8.0;
        float _454 = precise::clamp(_452, 0.0, 1.0);
        float _456 = _390 * _454;
        _418 = _456;
    }
    float _458 = _418;
    float _460 = 0.0 + _458;
    float _462 = precise::clamp(_460, 0.0, 1.0);
    out.m_50.x = _406;
    out.m_50.y = _408;
    out.m_50.z = _410;
    out.m_50.w = _462;
    return out;
}

