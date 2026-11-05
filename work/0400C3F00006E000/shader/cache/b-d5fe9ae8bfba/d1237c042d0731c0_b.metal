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
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    texture2d<float> fp_t_tcb_8 [[id(7)]];
    sampler fp_t_tcb_8Smplr [[id(8)]];
    sampler fp_t_tcb_10Smplr_w [[id(9)]];
    sampler fp_t_tcb_ASmplr_w [[id(10)]];
    sampler fp_t_tcb_8Smplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_52 [[color(0)]];
};

struct main0_in
{
    float4 m_47 [[user(locn0)]];
    float4 m_49 [[user(locn1)]];
    float4 m_41 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_39 [[user(locn4)]];
    float4 m_37 [[user(locn5)]];
    float4 m_43 [[user(locn6)]];
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
    float _79 = in.m_39.z;
    float _81 = gl_FragCoord.w;
    float _83 = _79 * _81;
    float _85 = in.m_39.x;
    float _87 = gl_FragCoord.w;
    float _89 = _85 * _87;
    float _91 = in.m_39.y;
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
    float _113 = _103 * _101;
    float _115 = 1.0 / _105;
    float _117 = _107 * _115;
    float _119 = _109 * _115;
    float _121 = _103 * _89;
    float _123 = _103 * _95;
    float2 _519 = float2(_117, _119);
    float _125 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_519, float2(0.0), isnan(_519))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_519, float2(0.0), isnan(_519))).x;
    float2 _530 = float2(_111, _113);
    float _127 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_530, float2(0.0), isnan(_530))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_530, float2(0.0), isnan(_530))).w;
    float2 _538 = float2(_121, _123);
    float4 _130 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_538, float2(0.0), isnan(_538))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_538, float2(0.0), isnan(_538))).xyzw;
    float _132 = _130.x;
    float _134 = _130.y;
    float _136 = _130.z;
    float _138 = _130.w;
    float _140 = in.m_41.y;
    float _142 = gl_FragCoord.w;
    float _144 = _140 * _142;
    float _146 = in.m_41.x;
    float _148 = gl_FragCoord.w;
    float _150 = _146 * _148;
    float _152 = in.m_41.z;
    float _154 = gl_FragCoord.w;
    float _156 = _152 * _154;
    float _158 = in.m_43.y;
    float _160 = gl_FragCoord.w;
    float _162 = _158 * _160;
    float _164 = in.m_43.x;
    float _166 = gl_FragCoord.w;
    float _168 = _164 * _166;
    float _170 = in.m_43.z;
    float _172 = gl_FragCoord.w;
    float _174 = _170 * _172;
    float _176 = _103 * _144;
    float _178 = _103 * _150;
    float _180 = _103 * _156;
    float _182 = _103 * _162;
    float _184 = _176 * _176;
    float _186 = in.m_37.z;
    float _188 = gl_FragCoord.w;
    float _190 = _186 * _188;
    float _192 = fma(_178, _178, _184);
    float _194 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _196 = _194 + (*spvDescriptorSet0.fp_c9)._m0[139].w;
    float _198 = fma(_180, _180, _192);
    float _200 = 1.0 / _196;
    float _202 = rsqrt(_198);
    float _204 = in.m_45.x;
    float _206 = gl_FragCoord.w;
    float _208 = _204 * _206;
    float _210 = _176 * _202;
    float _212 = _180 * _202;
    float _214 = _182 * _210;
    float _216 = _103 * _168;
    float _218 = _178 * _202;
    float _220 = fma(_216, _218, _214);
    float _222 = _103 * _174;
    float _224 = fma(_222, _212, _220);
    float _226 = _103 * _190;
    float _228 = in.m_47.w;
    float _230 = gl_FragCoord.w;
    float _232 = _228 * _230;
    float _234 = abs(_224);
    float _236 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _238 = _234 + _236;
    float _240 = _226 * _115;
    float _242 = _238 * _200;
    float _244 = precise::clamp(_242, 0.0, 1.0);
    float _246 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _248 = fma(_240, (*spvDescriptorSet0.fp_c8)._m0[30].w, _246);
    float _250 = fma(_244, -2.0, 3.0);
    float _252 = _244 * _244;
    float _254 = 1.0 / _248;
    float _256 = _250 * _252;
    float _258 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _260 = in.m_49.z;
    float _262 = gl_FragCoord.w;
    float _264 = _260 * _262;
    float _266 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _268 = fma(_125, (*spvDescriptorSet0.fp_c8)._m0[30].w, _266);
    float _270 = 1.0 / _268;
    float _272 = _138 * _127;
    float _274 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _276 = _254 * _274;
    float _278 = _103 * _232;
    float _280 = _103 * _208;
    float _282 = _272 * _278;
    float _284 = 0.0 + _282;
    float _286 = precise::clamp(_284, 0.0, 1.0);
    float _288 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _290 = -_276;
    float _292 = fma(_270, _288, _290);
    float _294 = _292 * _258;
    float _296 = precise::clamp(_294, 0.0, 1.0);
    float _298 = _286 * _296;
    float _300 = _298 * _256;
    float _302 = _300 * _280;
    bool _306 = _302 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _308 = isnan(_302);
    bool _310 = _306 || _308;
    bool _312 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _314 = _310 || _312;
    float _316 = in.m_47.x;
    float _318 = gl_FragCoord.w;
    float _320 = _316 * _318;
    float _322 = in.m_47.y;
    float _324 = gl_FragCoord.w;
    float _326 = _322 * _324;
    float _328 = in.m_47.z;
    float _330 = gl_FragCoord.w;
    float _332 = _328 * _330;
    float _334 = in.m_49.x;
    float _336 = gl_FragCoord.w;
    float _338 = _334 * _336;
    float _340 = in.m_49.y;
    float _342 = gl_FragCoord.w;
    float _344 = _340 * _342;
    float _346 = _276;
    float _348 = _136;
    if (!_314)
    {
        discard_fragment();
    }
    float _350 = _103 * _320;
    float _352 = _103 * _326;
    float _354 = _103 * _332;
    float _356 = _103 * _338;
    float _358 = _103 * _344;
    float _360 = _103 * _264;
    float _362 = -_356;
    float _364 = _350 + _362;
    float _366 = -_358;
    float _368 = _352 + _366;
    float _370 = -_360;
    float _372 = _354 + _370;
    float _374 = fma(_132, _364, _356);
    float _376 = fma(_134, _368, _358);
    float _378 = fma(_136, _372, _360);
    if (!_314)
    {
        out.m_52.x = _374;
        out.m_52.y = _376;
        out.m_52.z = _378;
        out.m_52.w = _282;
        return out;
    }
    float _380 = _376 * 0.715200006961822509765625;
    float _382 = fma(_374, 0.2125999927520751953125, _380);
    float _384 = fma(_378, 0.072200000286102294921875, _382);
    bool _386 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _388 = 1.0 / _384;
    float _390 = 0.0 + _302;
    float _392 = precise::clamp(_390, 0.0, 1.0);
    float _394 = _392;
    if (_386)
    {
        float _396 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _398 = _276 + _396;
        _346 = _398;
    }
    float _400 = _346;
    float _402 = _388 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _404 = precise::clamp(_402, 0.0, 1.0);
    if (_386)
    {
        float _406 = _400 * 8.0;
        float _408 = precise::clamp(_406, 0.0, 1.0);
        _348 = _408;
    }
    float _410 = _348;
    float _412 = fma(_404, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    if (_386)
    {
        float _414 = _392 * _410;
        _394 = _414;
    }
    float _416 = _394;
    float _418 = _374 * _412;
    float _420 = _376 * _412;
    float _422 = _378 * _412;
    float _424 = 0.0 + _416;
    float _426 = precise::clamp(_424, 0.0, 1.0);
    out.m_52.x = _418;
    out.m_52.y = _420;
    out.m_52.z = _422;
    out.m_52.w = _426;
    return out;
}

