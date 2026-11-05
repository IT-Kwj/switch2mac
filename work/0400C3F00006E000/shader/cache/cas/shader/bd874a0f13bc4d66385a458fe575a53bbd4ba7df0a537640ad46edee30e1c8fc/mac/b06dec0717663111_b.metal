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
    sampler fp_t_tcb_10Smplr_w [[id(9)]];
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
    sampler fp_t_tcb_ASmplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_50 [[color(0)]];
};

struct main0_in
{
    float4 m_43 [[user(locn0)]];
    float4 m_47 [[user(locn1)]];
    float4 m_39 [[user(locn2)]];
    float4 m_37 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_41 [[user(locn5)]];
    float4 m_52 [[user(locn7)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _59 = gl_FragCoord.w;
    float _61 = in.m_37.w;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = in.m_37.x;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = in.m_37.y;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = in.m_39.x;
    float _81 = gl_FragCoord.w;
    float _83 = _79 * _81;
    float _85 = in.m_39.y;
    float _87 = gl_FragCoord.w;
    float _89 = _85 * _87;
    float _91 = in.m_39.z;
    float _93 = gl_FragCoord.w;
    float _95 = _91 * _93;
    float _97 = in.m_39.w;
    float _99 = gl_FragCoord.w;
    float _101 = _97 * _99;
    float _103 = 1.0 / _59;
    float _105 = _103 * _65;
    float _107 = _103 * _71;
    float _109 = _103 * _77;
    float _111 = _103 * _83;
    float _113 = 1.0 / _105;
    float _115 = _103 * _89;
    float _117 = _103 * _95;
    float _119 = _103 * _101;
    float _121 = _107 * _113;
    float _123 = _109 * _113;
    float2 _515 = float2(_121, _123);
    float _125 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_515, float2(0.0), isnan(_515))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_515, float2(0.0), isnan(_515))).x;
    float2 _526 = float2(_111, _115);
    float4 _128 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_526, float2(0.0), isnan(_526))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_526, float2(0.0), isnan(_526))).xyzw;
    float _130 = _128.x;
    float _132 = _128.y;
    float _134 = _128.z;
    float _136 = _128.w;
    float2 _542 = float2(_117, _119);
    float4 _138 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_542, float2(0.0), isnan(_542))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_542, float2(0.0), isnan(_542))).xyzw;
    float _140 = _138.x;
    float _142 = _138.y;
    float _144 = _138.z;
    float _146 = _138.w;
    float _148 = in.m_37.z;
    float _150 = gl_FragCoord.w;
    float _152 = _148 * _150;
    float _154 = in.m_41.w;
    float _156 = gl_FragCoord.w;
    float _158 = _154 * _156;
    float _160 = in.m_43.w;
    float _162 = gl_FragCoord.w;
    float _164 = _160 * _162;
    float _166 = in.m_45.x;
    float _168 = gl_FragCoord.w;
    float _170 = _166 * _168;
    float _172 = _103 * _152;
    float _174 = _172 * _113;
    float _176 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _178 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _180 = fma(_174, (*spvDescriptorSet0.fp_c8)._m0[30].w, _178);
    float _182 = 1.0 / _180;
    float _184 = in.m_41.x;
    float _186 = gl_FragCoord.w;
    float _188 = _184 * _186;
    float _190 = in.m_41.y;
    float _192 = gl_FragCoord.w;
    float _194 = _190 * _192;
    float _196 = in.m_41.z;
    float _198 = gl_FragCoord.w;
    float _200 = _196 * _198;
    float _202 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _204 = fma(_125, (*spvDescriptorSet0.fp_c8)._m0[30].w, _202);
    float _206 = _103 * _158;
    float _208 = 1.0 / _204;
    float _210 = _136 * _146;
    float _212 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _214 = _182 * _212;
    float _216 = _103 * _170;
    float _218 = _210 * _206;
    float _220 = _103 * _164;
    float _222 = _220 * _218;
    float _224 = 0.0 + _222;
    float _226 = precise::clamp(_224, 0.0, 1.0);
    float _228 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _230 = -_214;
    float _232 = fma(_208, _228, _230);
    float _234 = _232 * _176;
    float _236 = precise::clamp(_234, 0.0, 1.0);
    float _238 = _226 * _236;
    float _240 = _238 * _216;
    bool _244 = _240 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _246 = isnan(_240);
    bool _248 = _244 || _246;
    bool _250 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _252 = _248 || _250;
    float _254 = in.m_47.x;
    float _256 = gl_FragCoord.w;
    float _258 = _254 * _256;
    float _260 = in.m_43.y;
    float _262 = gl_FragCoord.w;
    float _264 = _260 * _262;
    float _266 = in.m_43.x;
    float _268 = gl_FragCoord.w;
    float _270 = _266 * _268;
    float _272 = in.m_47.y;
    float _274 = gl_FragCoord.w;
    float _276 = _272 * _274;
    float _278 = in.m_43.z;
    float _280 = gl_FragCoord.w;
    float _282 = _278 * _280;
    float _284 = in.m_47.z;
    float _286 = gl_FragCoord.w;
    float _288 = _284 * _286;
    float _290 = _214;
    if (!_252)
    {
        discard_fragment();
    }
    float _292 = _132 * _142;
    float _294 = _130 * _140;
    float _296 = _134 * _144;
    float _298 = _103 * _258;
    float _300 = _103 * _264;
    float _302 = _103 * _270;
    float _304 = _103 * _276;
    float _306 = _103 * _282;
    float _308 = _103 * _288;
    float _310 = -_298;
    float _312 = _302 + _310;
    float _314 = -_304;
    float _316 = _300 + _314;
    float _318 = -_308;
    float _320 = _306 + _318;
    float _322 = fma(_294, _312, _298);
    float _324 = fma(_292, _316, _304);
    float _326 = _103 * _188;
    float _328 = fma(_296, _320, _308);
    float _330 = _103 * _194;
    float _332 = _103 * _200;
    float _334 = _322 * _326;
    float _336 = _324 * _330;
    float _338 = _328 * _332;
    if (!_252)
    {
        out.m_50.x = _334;
        out.m_50.y = _336;
        out.m_50.z = _338;
        out.m_50.w = _222;
        return out;
    }
    float _340 = _336 * 0.715200006961822509765625;
    float _342 = in.m_52.w;
    float _344 = gl_FragCoord.w;
    float _346 = _342 * _344;
    float _348 = in.m_52.x;
    float _350 = gl_FragCoord.w;
    float _352 = _348 * _350;
    float _354 = in.m_52.y;
    float _356 = gl_FragCoord.w;
    float _358 = _354 * _356;
    float _360 = fma(_334, 0.2125999927520751953125, _340);
    float _362 = in.m_52.z;
    float _364 = gl_FragCoord.w;
    float _366 = _362 * _364;
    float _368 = fma(_338, 0.072200000286102294921875, _360);
    bool _370 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _372 = 1.0 / _368;
    float _374 = (*spvDescriptorSet0.fp_c15)._m0[2].y;
    if (_370)
    {
        float _376 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _378 = _214 + _376;
        _290 = _378;
    }
    float _380 = _290;
    float _382 = _372 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _384 = precise::clamp(_382, 0.0, 1.0);
    float _386 = fma(_384, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _388 = _103 * _346;
    if (_370)
    {
        float _390 = _380 * 8.0;
        float _392 = precise::clamp(_390, 0.0, 1.0);
        _374 = _392;
    }
    float _394 = _374;
    float _396 = _103 * _352;
    float _398 = _103 * _358;
    float _400 = _386 * _388;
    float _402 = 0.0 + _240;
    float _404 = precise::clamp(_402, 0.0, 1.0);
    float _406 = _103 * _366;
    float _408 = fma(_334, _400, _396);
    float _410 = _404;
    if (_370)
    {
        float _412 = _404 * _394;
        _410 = _412;
    }
    float _414 = _410;
    float _416 = fma(_336, _400, _398);
    float _418 = fma(_338, _400, _406);
    float _420 = 0.0 + _414;
    float _422 = precise::clamp(_420, 0.0, 1.0);
    out.m_50.x = _408;
    out.m_50.y = _416;
    out.m_50.z = _418;
    out.m_50.w = _422;
    return out;
}

