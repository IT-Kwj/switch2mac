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
    texture2d<float> fp_t_tcb_10 [[id(3)]];
    sampler fp_t_tcb_10Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_A [[id(7)]];
    sampler fp_t_tcb_ASmplr [[id(8)]];
    texture2d<float> fp_t_tcb_C [[id(9)]];
    sampler fp_t_tcb_CSmplr [[id(10)]];
    sampler fp_t_tcb_10Smplr_w [[id(11)]];
    sampler fp_t_tcb_8Smplr_w [[id(12)]];
    sampler fp_t_tcb_ASmplr_w [[id(13)]];
    sampler fp_t_tcb_CSmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_52 [[color(0)]];
};

struct main0_in
{
    float4 m_45 [[user(locn0)]];
    float4 m_49 [[user(locn1)]];
    float4 m_39 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_43 [[user(locn4)]];
    float4 m_41 [[user(locn5)]];
    float4 m_54 [[user(locn7)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _61 = gl_FragCoord.w;
    float _63 = in.m_39.w;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_39.x;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_39.y;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_41.y;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = in.m_43.x;
    float _89 = gl_FragCoord.w;
    float _91 = _87 * _89;
    float _93 = in.m_43.y;
    float _95 = gl_FragCoord.w;
    float _97 = _93 * _95;
    float _99 = in.m_43.z;
    float _101 = gl_FragCoord.w;
    float _103 = _99 * _101;
    float _105 = in.m_43.w;
    float _107 = gl_FragCoord.w;
    float _109 = _105 * _107;
    float _111 = in.m_41.x;
    float _113 = gl_FragCoord.w;
    float _115 = _111 * _113;
    float _117 = 1.0 / _61;
    float _119 = _117 * _67;
    float _121 = _117 * _73;
    float _123 = _117 * _79;
    float _125 = _117 * _85;
    float _127 = _117 * _91;
    float _129 = _117 * _97;
    float _131 = 1.0 / _119;
    float _133 = _117 * _103;
    float _135 = _117 * _109;
    float _137 = _117 * _115;
    float _139 = _121 * _131;
    float _141 = _123 * _131;
    float2 _529 = float2(_139, _141);
    float _143 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_529, float2(0.0), isnan(_529))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_529, float2(0.0), isnan(_529))).x;
    float2 _540 = float2(_127, _129);
    float4 _146 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_540, float2(0.0), isnan(_540))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_540, float2(0.0), isnan(_540))).xyzw;
    float _148 = _146.x;
    float _150 = _146.y;
    float _152 = _146.z;
    float _154 = _146.w;
    float2 _556 = float2(_133, _135);
    float4 _156 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_556, float2(0.0), isnan(_556))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_556, float2(0.0), isnan(_556))).xyzw;
    float _158 = _156.x;
    float _160 = _156.y;
    float _162 = _156.z;
    float _164 = _156.w;
    float2 _572 = float2(_137, _125);
    float _166 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_572, float2(0.0), isnan(_572))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_572, float2(0.0), isnan(_572))).w;
    float _168 = in.m_39.z;
    float _170 = gl_FragCoord.w;
    float _172 = _168 * _170;
    float _174 = in.m_45.w;
    float _176 = gl_FragCoord.w;
    float _178 = _174 * _176;
    float _180 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _182 = _117 * _172;
    float _184 = in.m_47.x;
    float _186 = gl_FragCoord.w;
    float _188 = _184 * _186;
    float _190 = _182 * _131;
    float _192 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _194 = fma(_190, (*spvDescriptorSet0.fp_c8)._m0[30].w, _192);
    float _196 = 1.0 / _194;
    float _198 = in.m_45.z;
    float _200 = gl_FragCoord.w;
    float _202 = _198 * _200;
    float _204 = in.m_49.z;
    float _206 = gl_FragCoord.w;
    float _208 = _204 * _206;
    float _210 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _212 = fma(_143, (*spvDescriptorSet0.fp_c8)._m0[30].w, _210);
    float _214 = 1.0 / _212;
    float _216 = _154 * _164;
    float _218 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _220 = _196 * _218;
    float _222 = _117 * _188;
    float _224 = _216 * _166;
    float _226 = _117 * _178;
    float _228 = _224 * _226;
    float _230 = 0.0 + _228;
    float _232 = precise::clamp(_230, 0.0, 1.0);
    float _234 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _236 = -_220;
    float _238 = fma(_214, _234, _236);
    float _240 = _238 * _180;
    float _242 = precise::clamp(_240, 0.0, 1.0);
    float _244 = _232 * _242;
    float _246 = _244 * _222;
    bool _250 = _246 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _252 = isnan(_246);
    bool _254 = _250 || _252;
    bool _256 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _258 = _254 || _256;
    float _260 = in.m_45.x;
    float _262 = gl_FragCoord.w;
    float _264 = _260 * _262;
    float _266 = in.m_49.x;
    float _268 = gl_FragCoord.w;
    float _270 = _266 * _268;
    float _272 = in.m_45.y;
    float _274 = gl_FragCoord.w;
    float _276 = _272 * _274;
    float _278 = in.m_49.y;
    float _280 = gl_FragCoord.w;
    float _282 = _278 * _280;
    float _284 = _220;
    if (!_258)
    {
        discard_fragment();
    }
    float _286 = _148 * _148;
    float _288 = _158 * _158;
    float _290 = _150 * _150;
    float _292 = _160 * _160;
    float _294 = _152 * _152;
    float _296 = _286 * _288;
    float _298 = _162 * _162;
    float _300 = _290 * _292;
    float _302 = _117 * _202;
    float _304 = _117 * _208;
    float _306 = -_304;
    float _308 = _302 + _306;
    float _310 = _117 * _264;
    float _312 = _117 * _270;
    float _314 = _117 * _276;
    float _316 = _117 * _282;
    float _318 = _294 * _298;
    float _320 = -_312;
    float _322 = _310 + _320;
    float _324 = -_316;
    float _326 = _314 + _324;
    float _328 = fma(_318, _308, _304);
    float _330 = fma(_296, _322, _312);
    float _332 = fma(_300, _326, _316);
    if (!_258)
    {
        out.m_52.x = _330;
        out.m_52.y = _332;
        out.m_52.z = _328;
        out.m_52.w = _228;
        return out;
    }
    float _334 = _332 * 0.715200006961822509765625;
    float _336 = in.m_54.w;
    float _338 = gl_FragCoord.w;
    float _340 = _336 * _338;
    float _342 = in.m_54.x;
    float _344 = gl_FragCoord.w;
    float _346 = _342 * _344;
    float _348 = in.m_54.y;
    float _350 = gl_FragCoord.w;
    float _352 = _348 * _350;
    float _354 = fma(_330, 0.2125999927520751953125, _334);
    float _356 = in.m_54.z;
    float _358 = gl_FragCoord.w;
    float _360 = _356 * _358;
    float _362 = fma(_328, 0.072200000286102294921875, _354);
    bool _364 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _366 = 1.0 / _362;
    float _368 = (*spvDescriptorSet0.fp_c15)._m0[661].y;
    if (_364)
    {
        float _370 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _372 = _220 + _370;
        _284 = _372;
    }
    float _374 = _284;
    float _376 = _366 * (*spvDescriptorSet0.fp_c15)._m0[661].z;
    float _378 = precise::clamp(_376, 0.0, 1.0);
    float _380 = fma(_378, (*spvDescriptorSet0.fp_c15)._m0[661].y, (*spvDescriptorSet0.fp_c15)._m0[661].x);
    float _382 = _117 * _340;
    if (_364)
    {
        float _384 = _374 * 8.0;
        float _386 = precise::clamp(_384, 0.0, 1.0);
        _368 = _386;
    }
    float _388 = _368;
    float _390 = _117 * _346;
    float _392 = _117 * _352;
    float _394 = _380 * _382;
    float _396 = 0.0 + _246;
    float _398 = precise::clamp(_396, 0.0, 1.0);
    float _400 = _117 * _360;
    float _402 = fma(_330, _394, _390);
    float _404 = _398;
    if (_364)
    {
        float _406 = _398 * _388;
        _404 = _406;
    }
    float _408 = _404;
    float _410 = fma(_332, _394, _392);
    float _412 = fma(_328, _394, _400);
    float _414 = 0.0 + _408;
    float _416 = precise::clamp(_414, 0.0, 1.0);
    out.m_52.x = _402;
    out.m_52.y = _410;
    out.m_52.z = _412;
    out.m_52.w = _416;
    return out;
}

