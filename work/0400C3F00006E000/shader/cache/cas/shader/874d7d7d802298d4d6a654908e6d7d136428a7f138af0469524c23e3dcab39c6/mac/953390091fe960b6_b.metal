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
    float4 m_50 [[color(0)]];
};

struct main0_in
{
    float4 m_41 [[user(locn0)]];
    float4 m_45 [[user(locn1)]];
    float4 m_39 [[user(locn2)]];
    float4 m_37 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 m_43 [[user(locn5)]];
    float4 m_52 [[user(locn7)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _59 = gl_FragCoord.w;
    float _61 = in.m_37.w;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = in.m_37.y;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = in.m_37.x;
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
    float _113 = 1.0 / _105;
    float _115 = _103 * _89;
    float _117 = _103 * _95;
    float _119 = _103 * _101;
    float _121 = _107 * _113;
    float _123 = _109 * _113;
    float2 _481 = float2(_123, _121);
    float _125 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_481, float2(0.0), isnan(_481))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_481, float2(0.0), isnan(_481))).x;
    float2 _492 = float2(_111, _119);
    float _127 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_492, float2(0.0), isnan(_492))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_492, float2(0.0), isnan(_492))).w;
    float2 _500 = float2(_115, _117);
    float4 _130 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_500, float2(0.0), isnan(_500))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_500, float2(0.0), isnan(_500))).xyzw;
    float _132 = _130.x;
    float _134 = _130.y;
    float _136 = _130.z;
    float _138 = _130.w;
    float _140 = in.m_37.z;
    float _142 = gl_FragCoord.w;
    float _144 = _140 * _142;
    float _146 = in.m_41.w;
    float _148 = gl_FragCoord.w;
    float _150 = _146 * _148;
    float _152 = in.m_43.w;
    float _154 = gl_FragCoord.w;
    float _156 = _152 * _154;
    float _158 = in.m_45.w;
    float _160 = gl_FragCoord.w;
    float _162 = _158 * _160;
    float _164 = in.m_47.x;
    float _166 = gl_FragCoord.w;
    float _168 = _164 * _166;
    float _170 = _103 * _144;
    float _172 = _170 * _113;
    float _174 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _176 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _178 = fma(_172, (*spvDescriptorSet0.fp_c8)._m0[30].w, _176);
    float _180 = 1.0 / _178;
    float _182 = _103 * _150;
    float _184 = _103 * _168;
    float _186 = in.m_45.x;
    float _188 = gl_FragCoord.w;
    float _190 = _186 * _188;
    float _192 = in.m_45.y;
    float _194 = gl_FragCoord.w;
    float _196 = _192 * _194;
    float _198 = in.m_45.z;
    float _200 = gl_FragCoord.w;
    float _202 = _198 * _200;
    float _204 = _103 * _190;
    float _206 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _208 = fma(_125, (*spvDescriptorSet0.fp_c8)._m0[30].w, _206);
    float _210 = 1.0 / _208;
    float _212 = _138 + _127;
    float _214 = _103 * _156;
    float _216 = -_182;
    float _218 = fma(_212, _214, _216);
    float _220 = _103 * _162;
    float _222 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _224 = _180 * _222;
    float _226 = _220 * _218;
    float _228 = 0.0 + _226;
    float _230 = precise::clamp(_228, 0.0, 1.0);
    float _232 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _234 = -_224;
    float _236 = fma(_210, _232, _234);
    float _238 = _236 * _174;
    float _240 = precise::clamp(_238, 0.0, 1.0);
    float _242 = _230 * _240;
    float _244 = _242 * _184;
    bool _248 = _244 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _250 = isnan(_244);
    bool _252 = _248 || _250;
    bool _254 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _256 = _252 || _254;
    float _258 = in.m_41.x;
    float _260 = gl_FragCoord.w;
    float _262 = _258 * _260;
    float _264 = in.m_41.y;
    float _266 = gl_FragCoord.w;
    float _268 = _264 * _266;
    float _270 = in.m_41.z;
    float _272 = gl_FragCoord.w;
    float _274 = _270 * _272;
    float _276 = _224;
    if (!_256)
    {
        discard_fragment();
    }
    float _278 = _103 * _196;
    float _280 = _103 * _262;
    float _282 = _103 * _268;
    float _284 = _103 * _274;
    float _286 = _103 * _202;
    float _288 = -_204;
    float _290 = _280 + _288;
    float _292 = -_278;
    float _294 = _282 + _292;
    float _296 = -_286;
    float _298 = _284 + _296;
    float _300 = fma(_132, _290, _204);
    float _302 = fma(_134, _294, _278);
    float _304 = fma(_136, _298, _286);
    float _306 = _278;
    if (!_256)
    {
        out.m_50.x = _300;
        out.m_50.y = _302;
        out.m_50.z = _304;
        out.m_50.w = _226;
        return out;
    }
    float _308 = _302 * 0.715200006961822509765625;
    float _310 = in.m_52.w;
    float _312 = gl_FragCoord.w;
    float _314 = _310 * _312;
    float _316 = in.m_52.x;
    float _318 = gl_FragCoord.w;
    float _320 = _316 * _318;
    float _322 = in.m_52.y;
    float _324 = gl_FragCoord.w;
    float _326 = _322 * _324;
    float _328 = fma(_300, 0.2125999927520751953125, _308);
    float _330 = in.m_52.z;
    float _332 = gl_FragCoord.w;
    float _334 = _330 * _332;
    float _336 = fma(_304, 0.072200000286102294921875, _328);
    bool _338 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _340 = 1.0 / _336;
    if (_338)
    {
        float _342 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _344 = _224 + _342;
        _276 = _344;
    }
    float _346 = _276;
    if (_338)
    {
        float _348 = _346 * 8.0;
        float _350 = precise::clamp(_348, 0.0, 1.0);
        _306 = _350;
    }
    float _352 = _306;
    float _354 = _340 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _356 = precise::clamp(_354, 0.0, 1.0);
    float _358 = fma(_356, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _360 = _103 * _314;
    float _362 = _103 * _320;
    float _364 = _103 * _326;
    float _366 = _358 * _360;
    float _368 = 0.0 + _244;
    float _370 = precise::clamp(_368, 0.0, 1.0);
    float _372 = _103 * _334;
    float _374 = fma(_300, _366, _362);
    float _376 = _370;
    if (_338)
    {
        float _378 = _370 * _352;
        _376 = _378;
    }
    float _380 = _376;
    float _382 = fma(_302, _366, _364);
    float _384 = fma(_304, _366, _372);
    float _386 = 0.0 + _380;
    float _388 = precise::clamp(_386, 0.0, 1.0);
    out.m_50.x = _374;
    out.m_50.y = _382;
    out.m_50.z = _384;
    out.m_50.w = _388;
    return out;
}

