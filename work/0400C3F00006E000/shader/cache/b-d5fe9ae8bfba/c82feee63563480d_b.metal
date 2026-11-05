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
    texture2d<float> fp_t_tcb_C [[id(5)]];
    sampler fp_t_tcb_CSmplr [[id(6)]];
    texture2d<float> fp_t_tcb_8 [[id(7)]];
    sampler fp_t_tcb_8Smplr [[id(8)]];
    sampler fp_t_tcb_ASmplr_w [[id(9)]];
    sampler fp_t_tcb_CSmplr_w [[id(10)]];
    sampler fp_t_tcb_8Smplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_50 [[color(0)]];
};

struct main0_in
{
    float4 m_47 [[user(locn0)]];
    float4 m_45 [[user(locn1)]];
    float4 m_54 [[user(locn2)]];
    float4 m_43 [[user(locn3)]];
    float4 m_37 [[user(locn4)]];
    float4 m_41 [[user(locn5)]];
    float4 m_39 [[user(locn6)]];
    float4 m_52 [[user(locn8)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _61 = gl_FragCoord.w;
    float _63 = in.m_37.z;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_37.w;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_39.x;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_39.y;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = 1.0 / _61;
    float _89 = _87 * _67;
    float _91 = _87 * _73;
    float _93 = _87 * _79;
    float _95 = _87 * _85;
    float2 _458 = float2(_89, _91);
    float _97 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_458, float2(0.0), isnan(_458))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_458, float2(0.0), isnan(_458))).w;
    float2 _469 = float2(_93, _95);
    float2 _101 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_469, float2(0.0), isnan(_469))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_469, float2(0.0), isnan(_469))).xy;
    float _103 = _101.x;
    float _105 = _101.y;
    float _107 = in.m_41.y;
    float _109 = gl_FragCoord.w;
    float _111 = _107 * _109;
    float _113 = in.m_37.y;
    float _115 = gl_FragCoord.w;
    float _117 = _113 * _115;
    float _119 = in.m_41.x;
    float _121 = gl_FragCoord.w;
    float _123 = _119 * _121;
    float _125 = in.m_37.x;
    float _127 = gl_FragCoord.w;
    float _129 = _125 * _127;
    float _131 = _87 * _111;
    float _133 = _87 * _117;
    float _135 = _87 * _123;
    float _137 = _131 + (-0.0599999986588954925537109375);
    float _139 = _135 * 0.949999988079071044921875;
    float _141 = fma(_97, 0.300000011920928955078125, _133);
    float _143 = fma(_97, 0.25, _137);
    float _145 = _87 * _129;
    float _147 = _103 * _103;
    float _149 = _105 * _105;
    float _151 = fma(_147, 0.119999997317790985107421875, _145);
    float _153 = fma(_149, 0.119999997317790985107421875, _141);
    float2 _549 = float2(_139, _143);
    float _155 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_549, float2(0.0), isnan(_549))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_549, float2(0.0), isnan(_549))).w;
    float2 _557 = float2(_151, _153);
    float4 _158 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_557, float2(0.0), isnan(_557))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_557, float2(0.0), isnan(_557))).xyzw;
    float _160 = _158.x;
    float _162 = _158.y;
    float _164 = _158.z;
    float _166 = _158.w;
    float _168 = in.m_43.x;
    float _170 = gl_FragCoord.w;
    float _172 = _168 * _170;
    float _174 = -_131;
    float _176 = _174 + 1.0;
    bool _180 = _176 >= 0.5;
    bool _182 = isnan(_176);
    bool _184 = _180 || _182;
    bool _186 = isnan(0.5);
    bool _188 = _184 || _186;
    float _190 = float(_188);
    float _192 = in.m_45.x;
    float _194 = gl_FragCoord.w;
    float _196 = _192 * _194;
    float _198 = _87 * _172;
    float _200 = in.m_47.x;
    float _202 = gl_FragCoord.w;
    float _204 = _200 * _202;
    float _206 = in.m_47.y;
    float _208 = gl_FragCoord.w;
    float _210 = _206 * _208;
    float _212 = in.m_47.z;
    float _214 = gl_FragCoord.w;
    float _216 = _212 * _214;
    float _218 = _87 * _196;
    float _220 = _155 + _190;
    float _222 = precise::clamp(_220, 0.0, 1.0);
    float _224 = _166 * _222;
    float _226 = 0.0 + _224;
    float _228 = precise::clamp(_226, 0.0, 1.0);
    float _230 = _228 * _198;
    bool _232 = _230 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _234 = isnan(_230);
    bool _236 = _232 || _234;
    bool _238 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _240 = _236 || _238;
    float _242 = in.m_45.z;
    float _244 = gl_FragCoord.w;
    float _246 = _242 * _244;
    float _248 = in.m_45.y;
    float _250 = gl_FragCoord.w;
    float _252 = _248 * _250;
    if (!_240)
    {
        discard_fragment();
    }
    float _254 = _160 * _160;
    float _256 = _162 * _162;
    float _258 = _164 * _164;
    float _260 = -_254;
    float _262 = _260 + 1.0;
    float _264 = -_256;
    float _266 = _264 + 1.0;
    float _268 = _218 * _262;
    float _270 = _87 * _204;
    float _272 = fma(_254, _270, _268);
    float _274 = _87 * _246;
    float _276 = _87 * _252;
    float _278 = -_258;
    float _280 = _278 + 1.0;
    float _282 = _276 * _266;
    float _284 = _274 * _280;
    float _286 = _87 * _210;
    float _288 = _87 * _216;
    float _290 = fma(_256, _286, _282);
    float _292 = fma(_258, _288, _284);
    if (!_240)
    {
        out.m_50.x = _272;
        out.m_50.y = _290;
        out.m_50.z = _292;
        out.m_50.w = _224;
        return out;
    }
    float _294 = _290 * 0.715200006961822509765625;
    float _296 = in.m_52.w;
    float _298 = gl_FragCoord.w;
    float _300 = _296 * _298;
    float _302 = in.m_52.z;
    float _304 = gl_FragCoord.w;
    float _306 = _302 * _304;
    float _308 = in.m_52.x;
    float _310 = gl_FragCoord.w;
    float _312 = _308 * _310;
    float _314 = fma(_272, 0.2125999927520751953125, _294);
    float _316 = in.m_52.y;
    float _318 = gl_FragCoord.w;
    float _320 = _316 * _318;
    float _322 = fma(_292, 0.072200000286102294921875, _314);
    bool _324 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _326 = 1.0 / _322;
    float _328 = _326 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _330 = precise::clamp(_328, 0.0, 1.0);
    float _332 = fma(_330, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _334 = _87 * _300;
    float _336 = 0.0 + _230;
    float _338 = precise::clamp(_336, 0.0, 1.0);
    float _340 = _87 * _306;
    float _342 = _87 * _320;
    float _344 = _332 * _334;
    float _346 = _87 * _312;
    float _348 = fma(_292, _344, _340);
    float _350 = fma(_272, _344, _346);
    float _352 = fma(_290, _344, _342);
    float _354 = _340;
    if (!_324)
    {
        _354 = _338;
    }
    float _356 = _354;
    bool _358 = !_324;
    float _360 = _356;
    if (!_358)
    {
        float _362 = in.m_54.w;
        float _364 = gl_FragCoord.w;
        float _366 = _362 * _364;
        float _368 = in.m_54.z;
        float _370 = gl_FragCoord.w;
        float _372 = _368 * _370;
        float _374 = _87 * _366;
        float _376 = _87 * _372;
        float _378 = 1.0 / _374;
        float _380 = _376 * _378;
        float _382 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _384 = fma(_380, (*spvDescriptorSet0.fp_c8)._m0[30].w, _382);
        float _386 = 1.0 / _384;
        float _388 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _390 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _392 = fma(_386, _388, _390);
        float _394 = _392 * 8.0;
        float _396 = precise::clamp(_394, 0.0, 1.0);
        float _398 = _338 * _396;
        _360 = _398;
    }
    float _400 = _360;
    float _402 = 0.0 + _400;
    float _404 = precise::clamp(_402, 0.0, 1.0);
    out.m_50.x = _350;
    out.m_50.y = _352;
    out.m_50.z = _348;
    out.m_50.w = _404;
    return out;
}

