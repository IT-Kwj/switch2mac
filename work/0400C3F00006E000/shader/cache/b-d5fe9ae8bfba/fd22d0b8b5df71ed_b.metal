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
    sampler fp_t_tcb_10Smplr_w [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_46 [[color(0)]];
};

struct main0_in
{
    float4 m_39 [[user(locn0)]];
    float4 m_41 [[user(locn1)]];
    float4 m_35 [[user(locn2)]];
    float4 m_43 [[user(locn3)]];
    float4 m_37 [[user(locn4)]];
    float4 m_48 [[user(locn6)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _55 = gl_FragCoord.w;
    float _57 = in.m_35.w;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = in.m_35.x;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_35.y;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_37.x;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_37.y;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = 1.0 / _55;
    float _89 = _87 * _61;
    float _91 = _87 * _67;
    float _93 = _87 * _73;
    float _95 = _87 * _79;
    float _97 = 1.0 / _89;
    float _99 = _87 * _85;
    float _101 = _91 * _97;
    float _103 = _93 * _97;
    float2 _426 = float2(_101, _103);
    float _105 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_426, float2(0.0), isnan(_426))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_426, float2(0.0), isnan(_426))).x;
    float2 _437 = float2(_95, _99);
    float4 _108 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_437, float2(0.0), isnan(_437))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_437, float2(0.0), isnan(_437))).xyzw;
    float _110 = _108.x;
    float _112 = _108.y;
    float _114 = _108.z;
    float _116 = _108.w;
    float _118 = in.m_35.z;
    float _120 = gl_FragCoord.w;
    float _122 = _118 * _120;
    float _124 = in.m_39.w;
    float _126 = gl_FragCoord.w;
    float _128 = _124 * _126;
    float _130 = in.m_41.w;
    float _132 = gl_FragCoord.w;
    float _134 = _130 * _132;
    float _136 = in.m_43.x;
    float _138 = gl_FragCoord.w;
    float _140 = _136 * _138;
    float _142 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _144 = _87 * _122;
    float _146 = _144 * _97;
    float _148 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _150 = fma(_146, (*spvDescriptorSet0.fp_c8)._m0[30].w, _148);
    float _152 = _87 * _128;
    float _154 = 1.0 / _150;
    float _156 = in.m_41.x;
    float _158 = gl_FragCoord.w;
    float _160 = _156 * _158;
    float _162 = in.m_41.y;
    float _164 = gl_FragCoord.w;
    float _166 = _162 * _164;
    float _168 = in.m_41.z;
    float _170 = gl_FragCoord.w;
    float _172 = _168 * _170;
    float _174 = _87 * _160;
    float _176 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _178 = fma(_105, (*spvDescriptorSet0.fp_c8)._m0[30].w, _176);
    float _180 = _116 * _152;
    float _182 = _87 * _134;
    float _184 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _186 = _154 * _184;
    float _188 = 1.0 / _178;
    float _190 = _182 * _180;
    float _192 = 0.0 + _190;
    float _194 = precise::clamp(_192, 0.0, 1.0);
    float _196 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _198 = -_186;
    float _200 = fma(_188, _196, _198);
    float _202 = _200 * _142;
    float _204 = precise::clamp(_202, 0.0, 1.0);
    float _206 = _87 * _140;
    float _208 = _194 * _204;
    float _210 = _208 * _206;
    bool _214 = _210 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _216 = isnan(_210);
    bool _218 = _214 || _216;
    bool _220 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _222 = _218 || _220;
    float _224 = in.m_39.x;
    float _226 = gl_FragCoord.w;
    float _228 = _224 * _226;
    float _230 = in.m_39.y;
    float _232 = gl_FragCoord.w;
    float _234 = _230 * _232;
    float _236 = in.m_39.z;
    float _238 = gl_FragCoord.w;
    float _240 = _236 * _238;
    float _242 = _186;
    if (!_222)
    {
        discard_fragment();
    }
    float _244 = _87 * _166;
    float _246 = _87 * _228;
    float _248 = _87 * _234;
    float _250 = _87 * _240;
    float _252 = _87 * _172;
    float _254 = -_174;
    float _256 = _246 + _254;
    float _258 = -_244;
    float _260 = _248 + _258;
    float _262 = -_252;
    float _264 = _250 + _262;
    float _266 = fma(_110, _256, _174);
    float _268 = fma(_112, _260, _244);
    float _270 = fma(_114, _264, _252);
    float _272 = _244;
    if (!_222)
    {
        out.m_46.x = _266;
        out.m_46.y = _268;
        out.m_46.z = _270;
        out.m_46.w = _190;
        return out;
    }
    float _274 = _268 * 0.715200006961822509765625;
    float _276 = in.m_48.w;
    float _278 = gl_FragCoord.w;
    float _280 = _276 * _278;
    float _282 = in.m_48.x;
    float _284 = gl_FragCoord.w;
    float _286 = _282 * _284;
    float _288 = in.m_48.y;
    float _290 = gl_FragCoord.w;
    float _292 = _288 * _290;
    float _294 = fma(_266, 0.2125999927520751953125, _274);
    float _296 = in.m_48.z;
    float _298 = gl_FragCoord.w;
    float _300 = _296 * _298;
    float _302 = fma(_270, 0.072200000286102294921875, _294);
    bool _304 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _306 = 1.0 / _302;
    if (_304)
    {
        float _308 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _310 = _186 + _308;
        _242 = _310;
    }
    float _312 = _242;
    if (_304)
    {
        float _314 = _312 * 8.0;
        float _316 = precise::clamp(_314, 0.0, 1.0);
        _272 = _316;
    }
    float _318 = _272;
    float _320 = _306 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _322 = precise::clamp(_320, 0.0, 1.0);
    float _324 = fma(_322, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _326 = _87 * _280;
    float _328 = _87 * _286;
    float _330 = _87 * _292;
    float _332 = _324 * _326;
    float _334 = 0.0 + _210;
    float _336 = precise::clamp(_334, 0.0, 1.0);
    float _338 = _87 * _300;
    float _340 = fma(_266, _332, _328);
    float _342 = _336;
    if (_304)
    {
        float _344 = _336 * _318;
        _342 = _344;
    }
    float _346 = _342;
    float _348 = fma(_268, _332, _330);
    float _350 = fma(_270, _332, _338);
    float _352 = 0.0 + _346;
    float _354 = precise::clamp(_352, 0.0, 1.0);
    out.m_46.x = _340;
    out.m_46.y = _348;
    out.m_46.z = _350;
    out.m_46.w = _354;
    return out;
}

