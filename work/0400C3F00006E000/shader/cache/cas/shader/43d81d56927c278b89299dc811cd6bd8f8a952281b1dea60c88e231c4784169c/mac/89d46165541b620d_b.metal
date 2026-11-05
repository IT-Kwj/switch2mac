#pragma clang diagnostic ignored "-Wmissing-prototypes"

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
    constant _16* fp_c3 [[id(1)]];
    texture2d<float> fp_t_tcb_C [[id(2)]];
    sampler fp_t_tcb_CSmplr [[id(3)]];
    texture2d<float> fp_t_tcb_A [[id(4)]];
    sampler fp_t_tcb_ASmplr [[id(5)]];
    sampler fp_t_tcb_CSmplr_w [[id(6)]];
    sampler fp_t_tcb_ASmplr_w [[id(7)]];
    constant dm_border_t* dm_border [[id(8)]];
};

struct main0_out
{
    float4 m_36 [[color(0)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
    float4 m_33 [[user(locn1)]];
};

static inline __attribute__((always_inline))
int _42(thread const int& _870, thread const int& _871, constant _10& support_buffer)
{
    int _874 = 1 + _871;
    float _876 = support_buffer._m5[_874].x;
    float _878 = abs(_876);
    bool _880 = _878 == 1.0;
    if (_880)
    {
        return _870;
    }
    float _882 = float(_870);
    float _884 = _882 / _878;
    int _886 = int(_884);
    return _886;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _46 = gl_FragCoord.w;
    float _48 = in.m_31.x;
    float _50 = gl_FragCoord.w;
    float _52 = _48 * _50;
    float _54 = in.m_31.y;
    float _56 = gl_FragCoord.w;
    float _58 = _54 * _56;
    float _60 = 1.0 / _46;
    float _62 = _60 * _52;
    float _64 = _60 * _58;
    float2 _416 = float2(_62, _64);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_416, float2(0.0), isnan(_416))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_416, float2(0.0), isnan(_416))).x;
    float _68 = in.m_33.z;
    float _70 = gl_FragCoord.w;
    float _72 = _68 * _70;
    float _74 = in.m_33.x;
    float _76 = gl_FragCoord.w;
    float _78 = _74 * _76;
    float _80 = in.m_33.y;
    float _82 = gl_FragCoord.w;
    float _84 = _80 * _82;
    float _86 = _60 * _72;
    float _88 = _60 * _78;
    float _90 = _60 * _84;
    float _92 = precise::max(_66, _86);
    bool _96 = _92 != 0.0;
    bool _98 = isnan(_92);
    bool _100 = _96 || _98;
    bool _102 = isnan(0.0);
    bool _104 = _100 || _102;
    bool _106 = !_104;
    if (!_106)
    {
        float _108 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _110 = fma(_92, _108, 1.0);
        float _112 = log2(_110);
        float _114 = _112 + (-1.0);
        float _116 = trunc(_114);
        int _118 = int(_116);
        int _120 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_118), spvDescriptorSet0.fp_t_tcb_A.get_height(_118)).x;
        int _122 = _120;
        int _124 = 1;
        int _126 = _42(_122, _124, (*spvDescriptorSet0.support_buffer));
        int _128 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_118), spvDescriptorSet0.fp_t_tcb_A.get_height(_118)).y;
        int _130 = _128;
        int _132 = 1;
        int _134 = _42(_130, _132, (*spvDescriptorSet0.support_buffer));
        float _136 = float(_126);
        float _138 = float(_134);
        float _140 = fma(_62, _136, -0.5);
        float _142 = fma(_64, _138, -0.5);
        float _144 = floor(_140);
        float _146 = floor(_142);
        float _148 = -_144;
        float _150 = _140 + _148;
        float _152 = 1.0 / _138;
        float _154 = -_150;
        float _156 = _154 + 1.0;
        float _158 = -_150;
        float _160 = _158 + 2.0;
        float _162 = -_146;
        float _164 = _142 + _162;
        float _166 = _156 * _156;
        float _168 = _146 + (-0.5);
        float _170 = _146 + 1.5;
        float _172 = -_164;
        float _174 = _172 + 1.0;
        float _176 = _156 * _166;
        float _178 = -_164;
        float _180 = _178 + 2.0;
        float _182 = _160 * _160;
        float _184 = _174 * _174;
        float _186 = 1.0 / _136;
        float _188 = _180 * _180;
        float _190 = _174 * _184;
        float _192 = _176 * 4.0;
        float _194 = _190 * 4.0;
        float _196 = -_192;
        float _198 = fma(_160, _182, _196);
        float _200 = -_176;
        float _202 = _200 + 6.0;
        float _204 = -_194;
        float _206 = fma(_180, _188, _204);
        float _208 = -_190;
        float _210 = _208 + 6.0;
        float _212 = -_198;
        float _214 = _212 + _202;
        float _216 = _176 + _198;
        float _218 = _190 + _206;
        float _220 = -_206;
        float _222 = _220 + _210;
        float _224 = _214 * 0.16666667163372039794921875;
        float _226 = _216 * 0.16666667163372039794921875;
        float _228 = _218 * 0.16666667163372039794921875;
        float _230 = _222 * 0.16666667163372039794921875;
        float _232 = _150 * _150;
        float _234 = 1.0 / _226;
        float _236 = _164 * _164;
        float _238 = _206 * 0.16666667163372039794921875;
        float _240 = _150 * _232;
        float _242 = _198 * 0.16666667163372039794921875;
        float _244 = _164 * _236;
        float _246 = _144 + (-0.5);
        float _248 = _144 + 1.5;
        float _250 = 1.0 / _228;
        float _252 = _240 * 0.16666667163372039794921875;
        float _254 = _244 * 0.16666667163372039794921875;
        float _256 = 1.0 / _224;
        float _258 = fma(_242, _234, _246);
        float _260 = 1.0 / _230;
        float _262 = fma(_238, _250, _168);
        float _264 = fma(_252, _256, _248);
        float _266 = _262 * _152;
        float _268 = fma(_254, _260, _170);
        float _270 = _258 * _186;
        float _272 = _264 * _186;
        float _274 = _268 * _152;
        float2 _689 = float2(_270, _266);
        float3 _278 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_689, float2(0.0), isnan(_689)), level(_114)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_689, float2(0.0), isnan(_689)), level(_114)).xyz;
        float _280 = _278.x;
        float _282 = _278.y;
        float _284 = _278.z;
        float2 _704 = float2(_272, _266);
        float3 _286 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_704, float2(0.0), isnan(_704)), level(_114)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_704, float2(0.0), isnan(_704)), level(_114)).xyz;
        float _288 = _286.x;
        float _290 = _286.y;
        float _292 = _286.z;
        float2 _719 = float2(_270, _274);
        float3 _294 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_719, float2(0.0), isnan(_719)), level(_114)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_719, float2(0.0), isnan(_719)), level(_114)).xyz;
        float _296 = _294.x;
        float _298 = _294.y;
        float _300 = _294.z;
        float2 _734 = float2(_272, _274);
        float3 _302 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_734, float2(0.0), isnan(_734)), level(_114)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_734, float2(0.0), isnan(_734)), level(_114)).xyz;
        float _304 = _302.x;
        float _306 = _302.y;
        float _308 = _302.z;
        float _310 = 0.0 + _112;
        float _312 = precise::clamp(_310, 0.0, 1.0);
        float _314 = fma(_90, _312, _88);
        float _316 = _312 * _90;
        float _318 = 1.0 / _314;
        float _320 = -_292;
        float _322 = _284 + _320;
        float _324 = -_288;
        float _326 = _280 + _324;
        float _328 = -_308;
        float _330 = _300 + _328;
        float _332 = fma(_226, _322, _292);
        float _334 = -_304;
        float _336 = _296 + _334;
        float _338 = -_290;
        float _340 = _282 + _338;
        float _342 = -_306;
        float _344 = _298 + _342;
        float _346 = fma(_226, _330, _308);
        float _348 = fma(_226, _326, _288);
        float _350 = fma(_226, _336, _304);
        float _352 = fma(_226, _340, _290);
        float _354 = fma(_226, _344, _306);
        float _356 = -_346;
        float _358 = _356 + _332;
        float _360 = -_350;
        float _362 = _360 + _348;
        float _364 = _318 * _316;
        float _366 = -_354;
        float _368 = _366 + _352;
        float _370 = fma(_228, _358, _346);
        float _372 = fma(_228, _362, _350);
        float _374 = fma(_228, _368, _354);
        float _376 = _370 * _316;
        float _378 = _372 * _364;
        float _380 = _374 * _364;
        float _382 = _376 * _318;
        out.m_36.x = _378;
        out.m_36.y = _380;
        out.m_36.z = _382;
        out.m_36.w = _314;
        return out;
    }
    out.m_36.x = 0.0;
    out.m_36.y = 0.0;
    out.m_36.z = 0.0;
    out.m_36.w = _88;
    return out;
}

