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
    uint4 _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float4 _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* fp_c9 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    sampler fp_t_tcb_8Smplr_w [[id(5)]];
    constant dm_border_t* dm_border [[id(6)]];
};

struct main0_out
{
    float4 m_42 [[color(0)]];
};

struct main0_in
{
    float4 m_35 [[user(locn0)]];
    float4 m_39 [[user(locn1)]];
    float4 m_31 [[user(locn2)]];
    float4 m_37 [[user(locn3)]];
    float4 m_33 [[user(locn4)]];
    float4 m_44 [[user(locn6)]];
    float4 m_46 [[user(locn7)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _53 = gl_FragCoord.w;
    float _55 = in.m_31.x;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = in.m_31.y;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = 1.0 / _53;
    float _69 = _67 * _59;
    float _71 = _67 * _65;
    float2 _408 = float2(_69, _71);
    float4 _74 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_408, float2(0.0), isnan(_408))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_408, float2(0.0), isnan(_408))).xyzw;
    float _76 = _74.x;
    float _78 = _74.y;
    float _80 = _74.z;
    float _82 = _74.w;
    float _84 = in.m_33.w;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = in.m_35.w;
    float _92 = gl_FragCoord.w;
    float _94 = _90 * _92;
    float _96 = in.m_37.x;
    float _98 = gl_FragCoord.w;
    float _100 = _96 * _98;
    float _102 = _67 * _88;
    float _104 = _67 * _94;
    float _106 = _67 * _100;
    float _108 = in.m_35.y;
    float _110 = gl_FragCoord.w;
    float _112 = _108 * _110;
    float _114 = in.m_39.x;
    float _116 = gl_FragCoord.w;
    float _118 = _114 * _116;
    float _120 = in.m_39.y;
    float _122 = gl_FragCoord.w;
    float _124 = _120 * _122;
    float _126 = in.m_35.z;
    float _128 = gl_FragCoord.w;
    float _130 = _126 * _128;
    float _132 = in.m_39.z;
    float _134 = gl_FragCoord.w;
    float _136 = _132 * _134;
    float _138 = in.m_33.x;
    float _140 = gl_FragCoord.w;
    float _142 = _138 * _140;
    float _144 = in.m_33.y;
    float _146 = gl_FragCoord.w;
    float _148 = _144 * _146;
    float _150 = in.m_33.z;
    float _152 = gl_FragCoord.w;
    float _154 = _150 * _152;
    float _156 = _67 * _136;
    float _158 = _82 * _102;
    float _160 = _104 * _158;
    float _162 = 0.0 + _160;
    float _164 = precise::clamp(_162, 0.0, 1.0);
    float _166 = _164 * _106;
    bool _170 = _166 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _172 = isnan(_166);
    bool _174 = _170 || _172;
    bool _176 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _178 = _174 || _176;
    float _180 = in.m_35.x;
    float _182 = gl_FragCoord.w;
    float _184 = _180 * _182;
    if (!_178)
    {
        discard_fragment();
    }
    float _186 = _67 * _118;
    float _188 = _67 * _112;
    float _190 = _67 * _124;
    float _192 = _67 * _130;
    float _194 = _76 * _76;
    float _196 = _78 * _78;
    float _198 = -_190;
    float _200 = _188 + _198;
    float _202 = -_156;
    float _204 = _192 + _202;
    float _206 = _80 * _80;
    float _208 = fma(_196, _200, _190);
    float _210 = _67 * _142;
    float _212 = _67 * _184;
    float _214 = -_186;
    float _216 = _212 + _214;
    float _218 = fma(_194, _216, _186);
    float _220 = fma(_206, _204, _156);
    float _222 = _67 * _148;
    float _224 = _67 * _154;
    float _226 = _218 * _210;
    float _228 = _208 * _222;
    float _230 = _220 * _224;
    if (!_178)
    {
        out.m_42.x = _226;
        out.m_42.y = _228;
        out.m_42.z = _230;
        out.m_42.w = _160;
        return out;
    }
    float _232 = in.m_44.w;
    float _234 = gl_FragCoord.w;
    float _236 = _232 * _234;
    float _238 = _67 * _236;
    bool _240 = _238 != 1.0;
    bool _242 = isnan(_238);
    bool _244 = _240 || _242;
    bool _246 = isnan(1.0);
    bool _248 = _244 || _246;
    bool _250 = !_248;
    if (!_250)
    {
        float _252 = gl_FragCoord.x;
        float _254 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _256 = _252 / _254;
        float _258 = gl_FragCoord.y;
        float _260 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _262 = _258 / _260;
        float _264 = _238 * 256.0;
        float _266 = trunc(_264);
        int _269 = int(_266);
        float _271 = trunc(_256);
        int _273 = int(_271);
        float _275 = trunc(_262);
        int _277 = int(_275);
        int _279 = _273 + 2;
        int _281 = _279 >> 1;
        uint _284 = uint(int(uint(_277) >> uint(1)));
        int _286 = _281 ^ int(_284);
        int _288 = _286 << 16;
        int _290 = _288 ^ _281;
        int _292 = 983055 & _290;
        uint _294 = uint(int(uint(_269) >> uint(7)));
        int _296 = int(_294) + _269;
        int _298 = _292 << 6;
        int _300 = _298 + _292;
        int _302 = _300 & 13369548;
        uint _304 = uint(int(uint(_302) >> uint(3)));
        int _306 = _302 | int(_304);
        int _308 = _306 & 5570560;
        int _310 = _306 & 85;
        uint _312 = uint(int(uint(_308) >> uint(15)));
        int _314 = int(_312) + _310;
        bool _316 = uint(_296) > uint(_314);
        if (!_316)
        {
            discard_fragment();
        }
        if (!_316)
        {
            out.m_42.x = _226;
            out.m_42.y = _228;
            out.m_42.z = _230;
            out.m_42.w = _166;
            return out;
        }
    }
    float _318 = _228 * 0.715200006961822509765625;
    float _320 = in.m_46.w;
    float _322 = gl_FragCoord.w;
    float _324 = _320 * _322;
    float _326 = in.m_46.x;
    float _328 = gl_FragCoord.w;
    float _330 = _326 * _328;
    float _332 = in.m_46.y;
    float _334 = gl_FragCoord.w;
    float _336 = _332 * _334;
    float _338 = fma(_226, 0.2125999927520751953125, _318);
    float _340 = in.m_46.z;
    float _342 = gl_FragCoord.w;
    float _344 = _340 * _342;
    float _346 = fma(_230, 0.072200000286102294921875, _338);
    float _348 = 1.0 / _346;
    float _350 = _348 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _352 = precise::clamp(_350, 0.0, 1.0);
    float _354 = 0.0 + _166;
    float _356 = precise::clamp(_354, 0.0, 1.0);
    float _358 = _67 * _324;
    float _360 = fma(_352, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _362 = _360 * _358;
    float _364 = _67 * _330;
    float _366 = _67 * _336;
    float _368 = _67 * _344;
    float _370 = fma(_226, _362, _364);
    float _372 = fma(_228, _362, _366);
    float _374 = fma(_230, _362, _368);
    out.m_42.x = _370;
    out.m_42.y = _372;
    out.m_42.z = _374;
    out.m_42.w = _356;
    return out;
}

