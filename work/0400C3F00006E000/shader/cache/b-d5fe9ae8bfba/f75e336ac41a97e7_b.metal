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
    texture2d<float> fp_t_tcb_A [[id(7)]];
    sampler fp_t_tcb_ASmplr [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    sampler fp_t_tcb_10Smplr_w [[id(10)]];
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
    float4 m_37 [[user(locn2)]];
    float4 m_39 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_41 [[user(locn5), flat]];
    float4 m_52 [[user(locn7)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _59 = gl_FragCoord.w;
    float _61 = in.m_37.y;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = in.m_37.x;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = 1.0 / _59;
    float _75 = _73 * _65;
    float _77 = _73 * _71;
    float2 _425 = float2(_77, _75);
    float2 _81 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_425, float2(0.0), isnan(_425))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_425, float2(0.0), isnan(_425))).xy;
    float _83 = _81.x;
    float _85 = _81.y;
    float _87 = in.m_39.w;
    float _89 = gl_FragCoord.w;
    float _91 = _87 * _89;
    float _93 = in.m_39.x;
    float _95 = gl_FragCoord.w;
    float _97 = _93 * _95;
    float _99 = in.m_39.y;
    float _101 = gl_FragCoord.w;
    float _103 = _99 * _101;
    float _105 = in.m_37.z;
    float _107 = gl_FragCoord.w;
    float _109 = _105 * _107;
    float _111 = in.m_41.x;
    float _113 = in.m_37.w;
    float _115 = gl_FragCoord.w;
    float _117 = _113 * _115;
    float _119 = _73 * _91;
    float _121 = _73 * _97;
    float _123 = _73 * _103;
    float _125 = 1.0 / _119;
    float _127 = _111 * (*spvDescriptorSet0.fp_c9)._m0[21].x;
    float _129 = _111 * (*spvDescriptorSet0.fp_c9)._m0[21].y;
    float _131 = _121 * _125;
    float _133 = _123 * _125;
    float _135 = fma(_83, 2.0, -1.0);
    float _137 = _73 * _109;
    float _139 = fma(_85, 2.0, -1.0);
    float _141 = _73 * _117;
    float _143 = fma(_127, _135, _137);
    float2 _522 = float2(_131, _133);
    float _145 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_522, float2(0.0), isnan(_522))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_522, float2(0.0), isnan(_522))).x;
    float _147 = fma(_129, _139, _141);
    float2 _534 = float2(_143, _147);
    float4 _150 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_534, float2(0.0), isnan(_534))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_534, float2(0.0), isnan(_534))).xyzw;
    float _152 = _150.x;
    float _154 = _150.y;
    float _156 = _150.z;
    float _158 = _150.w;
    float _160 = in.m_39.z;
    float _162 = gl_FragCoord.w;
    float _164 = _160 * _162;
    float _166 = in.m_43.w;
    float _168 = gl_FragCoord.w;
    float _170 = _166 * _168;
    float _172 = in.m_45.x;
    float _174 = gl_FragCoord.w;
    float _176 = _172 * _174;
    float _178 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _180 = _73 * _164;
    float _182 = _180 * _125;
    float _184 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _186 = fma(_182, (*spvDescriptorSet0.fp_c8)._m0[30].w, _184);
    float _188 = _73 * _170;
    float _190 = 1.0 / _186;
    float _192 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _194 = _190 * _192;
    float _196 = in.m_43.z;
    float _198 = gl_FragCoord.w;
    float _200 = _196 * _198;
    float _202 = in.m_47.z;
    float _204 = gl_FragCoord.w;
    float _206 = _202 * _204;
    float _208 = _73 * _206;
    float _210 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _212 = fma(_145, (*spvDescriptorSet0.fp_c8)._m0[30].w, _210);
    float _214 = 1.0 / _212;
    float _216 = _158 * _188;
    float _218 = 0.0 + _216;
    float _220 = precise::clamp(_218, 0.0, 1.0);
    float _222 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _224 = -_194;
    float _226 = fma(_214, _222, _224);
    float _228 = _226 * _178;
    float _230 = precise::clamp(_228, 0.0, 1.0);
    float _232 = _73 * _176;
    float _234 = _220 * _230;
    float _236 = _234 * _232;
    bool _240 = _236 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _242 = isnan(_236);
    bool _244 = _240 || _242;
    bool _246 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _248 = _244 || _246;
    float _250 = in.m_47.x;
    float _252 = gl_FragCoord.w;
    float _254 = _250 * _252;
    float _256 = in.m_43.y;
    float _258 = gl_FragCoord.w;
    float _260 = _256 * _258;
    float _262 = in.m_43.x;
    float _264 = gl_FragCoord.w;
    float _266 = _262 * _264;
    float _268 = in.m_47.y;
    float _270 = gl_FragCoord.w;
    float _272 = _268 * _270;
    if (!_248)
    {
        discard_fragment();
    }
    float _274 = _73 * _254;
    float _276 = _73 * _260;
    float _278 = _73 * _266;
    float _280 = _73 * _272;
    float _282 = _73 * _200;
    float _284 = -_274;
    float _286 = _278 + _284;
    float _288 = -_280;
    float _290 = _276 + _288;
    float _292 = -_208;
    float _294 = _282 + _292;
    float _296 = _152 * _152;
    float _298 = _154 * _154;
    float _300 = _156 * _156;
    float _302 = fma(_296, _286, _274);
    float _304 = fma(_298, _290, _280);
    float _306 = fma(_300, _294, _208);
    if (!_248)
    {
        out.m_50.x = _302;
        out.m_50.y = _304;
        out.m_50.z = _306;
        out.m_50.w = _216;
        return out;
    }
    float _308 = _304 * 0.715200006961822509765625;
    float _310 = in.m_52.w;
    float _312 = gl_FragCoord.w;
    float _314 = _310 * _312;
    float _316 = in.m_52.x;
    float _318 = gl_FragCoord.w;
    float _320 = _316 * _318;
    float _322 = in.m_52.y;
    float _324 = gl_FragCoord.w;
    float _326 = _322 * _324;
    float _328 = fma(_302, 0.2125999927520751953125, _308);
    float _330 = in.m_52.z;
    float _332 = gl_FragCoord.w;
    float _334 = _330 * _332;
    float _336 = fma(_306, 0.072200000286102294921875, _328);
    bool _338 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _340 = 1.0 / _336;
    float _342 = (*spvDescriptorSet0.fp_c15)._m0[653].w;
    if (_338)
    {
        float _344 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _346 = _194 + _344;
        _342 = _346;
    }
    float _348 = _342;
    float _350 = _340 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _352 = precise::clamp(_350, 0.0, 1.0);
    float _354 = fma(_352, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _356 = _73 * _314;
    float _358 = _73 * _326;
    float _360 = _354 * _356;
    float _362 = 0.0 + _236;
    float _364 = precise::clamp(_362, 0.0, 1.0);
    float _366 = _356;
    float _368 = _364;
    if (_338)
    {
        float _370 = _348 * 8.0;
        float _372 = precise::clamp(_370, 0.0, 1.0);
        _366 = _372;
    }
    float _374 = _366;
    float _376 = _73 * _320;
    float _378 = _73 * _334;
    float _380 = fma(_304, _360, _358);
    if (_338)
    {
        float _382 = _364 * _374;
        _368 = _382;
    }
    float _384 = _368;
    float _386 = fma(_302, _360, _376);
    float _388 = fma(_306, _360, _378);
    float _390 = 0.0 + _384;
    float _392 = precise::clamp(_390, 0.0, 1.0);
    out.m_50.x = _386;
    out.m_50.y = _380;
    out.m_50.z = _388;
    out.m_50.w = _392;
    return out;
}

