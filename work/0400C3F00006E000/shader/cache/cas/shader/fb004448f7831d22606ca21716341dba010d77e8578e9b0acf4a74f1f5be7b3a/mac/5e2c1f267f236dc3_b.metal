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
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_C [[id(5)]];
    sampler fp_t_tcb_CSmplr [[id(6)]];
    texture2d<float> fp_t_tcb_A [[id(7)]];
    sampler fp_t_tcb_ASmplr [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    sampler fp_t_tcb_CSmplr_w [[id(10)]];
    sampler fp_t_tcb_ASmplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_48 [[color(0)]];
};

struct main0_in
{
    float4 m_45 [[user(locn0)]];
    float4 m_43 [[user(locn1)]];
    float4 m_37 [[user(locn2)]];
    float4 m_52 [[user(locn3)]];
    float4 m_41 [[user(locn4)]];
    float4 m_39 [[user(locn5)]];
    float4 m_50 [[user(locn7)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _59 = gl_FragCoord.w;
    float _61 = in.m_37.x;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = in.m_37.y;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = 1.0 / _59;
    float _75 = _73 * _65;
    float _77 = _73 * _71;
    float2 _389 = float2(_75, _77);
    float2 _81 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_389, float2(0.0), isnan(_389))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_389, float2(0.0), isnan(_389))).xy;
    float _83 = _81.x;
    float _85 = _81.y;
    float _87 = in.m_37.z;
    float _89 = gl_FragCoord.w;
    float _91 = _87 * _89;
    float _93 = in.m_37.w;
    float _95 = gl_FragCoord.w;
    float _97 = _93 * _95;
    float _99 = _73 * _97;
    float _101 = fma(_83, 2.0, -1.0);
    float _103 = fma(_85, 2.0, -1.0);
    float _105 = _73 * _91;
    float _107 = fma(_103, (*spvDescriptorSet0.fp_c9)._m0[194].w, _99);
    float _109 = fma(_101, (*spvDescriptorSet0.fp_c9)._m0[194].w, _105);
    float2 _444 = float2(_75, _77);
    float _111 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_444, float2(0.0), isnan(_444))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_444, float2(0.0), isnan(_444))).w;
    float2 _452 = float2(_109, _107);
    float4 _114 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_452, float2(0.0), isnan(_452))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_452, float2(0.0), isnan(_452))).xyzw;
    float _116 = _114.x;
    float _118 = _114.y;
    float _120 = _114.z;
    float _122 = _114.w;
    float _124 = in.m_39.w;
    float _126 = gl_FragCoord.w;
    float _128 = _124 * _126;
    float _130 = in.m_41.x;
    float _132 = gl_FragCoord.w;
    float _134 = _130 * _132;
    float _136 = _73 * _128;
    float _138 = in.m_43.y;
    float _140 = gl_FragCoord.w;
    float _142 = _138 * _140;
    float _144 = in.m_45.y;
    float _146 = gl_FragCoord.w;
    float _148 = _144 * _146;
    float _150 = in.m_45.z;
    float _152 = gl_FragCoord.w;
    float _154 = _150 * _152;
    float _156 = _73 * _142;
    float _158 = -_111;
    float _160 = _158 + 1.0;
    float _162 = _136 + (-1.0);
    float _164 = -_160;
    float _166 = fma(_164, _160, _122);
    float _168 = _73 * _134;
    float _170 = _166 + _162;
    float _172 = precise::clamp(_170, 0.0, 1.0);
    float _174 = _172 * _168;
    bool _178 = _174 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _180 = isnan(_174);
    bool _182 = _178 || _180;
    bool _184 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _186 = _182 || _184;
    float _188 = in.m_43.z;
    float _190 = gl_FragCoord.w;
    float _192 = _188 * _190;
    float _194 = in.m_43.x;
    float _196 = gl_FragCoord.w;
    float _198 = _194 * _196;
    float _200 = in.m_45.x;
    float _202 = gl_FragCoord.w;
    float _204 = _200 * _202;
    if (!_186)
    {
        discard_fragment();
    }
    float _206 = _116 * _116;
    float _208 = _118 * _118;
    float _210 = _120 * _120;
    float _212 = -_206;
    float _214 = _212 + 1.0;
    float _216 = -_210;
    float _218 = _216 + 1.0;
    float _220 = _73 * _192;
    float _222 = _73 * _198;
    float _224 = -_208;
    float _226 = _224 + 1.0;
    float _228 = _220 * _218;
    float _230 = _222 * _214;
    float _232 = _156 * _226;
    float _234 = _73 * _204;
    float _236 = _73 * _148;
    float _238 = _73 * _154;
    float _240 = fma(_206, _234, _230);
    float _242 = fma(_208, _236, _232);
    float _244 = fma(_210, _238, _228);
    if (!_186)
    {
        out.m_48.x = _240;
        out.m_48.y = _242;
        out.m_48.z = _244;
        out.m_48.w = _172;
        return out;
    }
    float _246 = _242 * 0.715200006961822509765625;
    float _248 = in.m_50.w;
    float _250 = gl_FragCoord.w;
    float _252 = _248 * _250;
    float _254 = in.m_50.z;
    float _256 = gl_FragCoord.w;
    float _258 = _254 * _256;
    float _260 = in.m_50.x;
    float _262 = gl_FragCoord.w;
    float _264 = _260 * _262;
    float _266 = fma(_240, 0.2125999927520751953125, _246);
    float _268 = in.m_50.y;
    float _270 = gl_FragCoord.w;
    float _272 = _268 * _270;
    float _274 = 0.0 + _174;
    float _276 = precise::clamp(_274, 0.0, 1.0);
    float _278 = fma(_244, 0.072200000286102294921875, _266);
    bool _280 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _282 = 1.0 / _278;
    float _284 = _282 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _286 = precise::clamp(_284, 0.0, 1.0);
    float _288 = fma(_286, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _290 = _73 * _252;
    float _292 = _73 * _258;
    float _294 = _288 * _290;
    float _296 = _73 * _264;
    float _298 = _73 * _272;
    float _300 = fma(_244, _294, _292);
    float _302 = fma(_240, _294, _296);
    float _304 = fma(_242, _294, _298);
    float _306 = _292;
    if (!_280)
    {
        _306 = _276;
    }
    float _308 = _306;
    bool _310 = !_280;
    float _312 = _308;
    if (!_310)
    {
        float _314 = in.m_52.w;
        float _316 = gl_FragCoord.w;
        float _318 = _314 * _316;
        float _320 = in.m_52.z;
        float _322 = gl_FragCoord.w;
        float _324 = _320 * _322;
        float _326 = _73 * _318;
        float _328 = _73 * _324;
        float _330 = 1.0 / _326;
        float _332 = _328 * _330;
        float _334 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _336 = fma(_332, (*spvDescriptorSet0.fp_c8)._m0[30].w, _334);
        float _338 = 1.0 / _336;
        float _340 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _342 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _344 = fma(_338, _340, _342);
        float _346 = _344 * 8.0;
        float _348 = precise::clamp(_346, 0.0, 1.0);
        float _350 = _276 * _348;
        _312 = _350;
    }
    float _352 = _312;
    float _354 = 0.0 + _352;
    float _356 = precise::clamp(_354, 0.0, 1.0);
    out.m_48.x = _302;
    out.m_48.y = _304;
    out.m_48.z = _300;
    out.m_48.w = _356;
    return out;
}

