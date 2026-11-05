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
    texture2d<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    texture2d<float> fp_t_tcb_A [[id(4)]];
    sampler fp_t_tcb_ASmplr [[id(5)]];
    sampler fp_t_tcb_8Smplr_w [[id(6)]];
    sampler fp_t_tcb_ASmplr_w [[id(7)]];
    constant dm_border_t* dm_border [[id(8)]];
};

struct main0_out
{
    float4 m_34 [[color(0)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
    float4 m_36 [[user(locn1)]];
};

static inline __attribute__((always_inline))
int _42(thread const int& _917, thread const int& _918, constant _10& support_buffer)
{
    int _921 = 1 + _918;
    float _923 = support_buffer._m5[_921].x;
    float _925 = abs(_923);
    bool _927 = _925 == 1.0;
    if (_927)
    {
        return _917;
    }
    float _929 = float(_917);
    float _931 = _929 / _925;
    int _933 = int(_931);
    return _933;
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
    float2 _428 = float2(_62, _64);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_428, float2(0.0), isnan(_428))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_428, float2(0.0), isnan(_428))).x;
    float _68 = -_66;
    float _70 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _72 = 1.0 / _70;
    bool _76 = _72 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    if (_76)
    {
        discard_fragment();
    }
    if (_76)
    {
        out.m_34.x = 0.0;
        out.m_34.y = 0.0;
        out.m_34.z = 0.0;
        out.m_34.w = 0.0;
        return out;
    }
    float _78 = in.m_36.z;
    float _80 = gl_FragCoord.w;
    float _82 = _78 * _80;
    float _84 = in.m_36.x;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = in.m_36.y;
    float _92 = gl_FragCoord.w;
    float _94 = _90 * _92;
    float _96 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _98 = precise::clamp(_96, 0.0, 1.0);
    float _100 = _60 * _82;
    float _102 = _60 * _88;
    float _104 = precise::max(_98, _100);
    float _106 = _60 * _94;
    bool _108 = _104 != 0.0;
    bool _110 = isnan(_104);
    bool _112 = _108 || _110;
    bool _114 = isnan(0.0);
    bool _116 = _112 || _114;
    bool _118 = !_116;
    if (!_118)
    {
        float _120 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _122 = fma(_104, _120, 1.0);
        float _124 = log2(_122);
        float _126 = _124 + (-1.0);
        float _128 = trunc(_126);
        int _130 = int(_128);
        int _132 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_130), spvDescriptorSet0.fp_t_tcb_A.get_height(_130)).x;
        int _134 = _132;
        int _136 = 1;
        int _138 = _42(_134, _136, (*spvDescriptorSet0.support_buffer));
        int _140 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_130), spvDescriptorSet0.fp_t_tcb_A.get_height(_130)).y;
        int _142 = _140;
        int _144 = 1;
        int _146 = _42(_142, _144, (*spvDescriptorSet0.support_buffer));
        float _148 = float(_138);
        float _150 = float(_146);
        float _152 = fma(_62, _148, -0.5);
        float _154 = fma(_64, _150, -0.5);
        float _156 = floor(_152);
        float _158 = floor(_154);
        float _160 = -_156;
        float _162 = _152 + _160;
        float _164 = 1.0 / _150;
        float _166 = -_162;
        float _168 = _166 + 1.0;
        float _170 = -_162;
        float _172 = _170 + 2.0;
        float _174 = -_158;
        float _176 = _154 + _174;
        float _178 = _168 * _168;
        float _180 = _158 + (-0.5);
        float _182 = _158 + 1.5;
        float _184 = -_176;
        float _186 = _184 + 1.0;
        float _188 = _168 * _178;
        float _190 = -_176;
        float _192 = _190 + 2.0;
        float _194 = _172 * _172;
        float _196 = _186 * _186;
        float _198 = 1.0 / _148;
        float _200 = _192 * _192;
        float _202 = _186 * _196;
        float _204 = _188 * 4.0;
        float _206 = _202 * 4.0;
        float _208 = -_204;
        float _210 = fma(_172, _194, _208);
        float _212 = -_188;
        float _214 = _212 + 6.0;
        float _216 = -_206;
        float _218 = fma(_192, _200, _216);
        float _220 = -_202;
        float _222 = _220 + 6.0;
        float _224 = -_210;
        float _226 = _224 + _214;
        float _228 = _188 + _210;
        float _230 = _202 + _218;
        float _232 = -_218;
        float _234 = _232 + _222;
        float _236 = _226 * 0.16666667163372039794921875;
        float _238 = _228 * 0.16666667163372039794921875;
        float _240 = _230 * 0.16666667163372039794921875;
        float _242 = _234 * 0.16666667163372039794921875;
        float _244 = _162 * _162;
        float _246 = 1.0 / _238;
        float _248 = _176 * _176;
        float _250 = _218 * 0.16666667163372039794921875;
        float _252 = _162 * _244;
        float _254 = _210 * 0.16666667163372039794921875;
        float _256 = _176 * _248;
        float _258 = _156 + (-0.5);
        float _260 = _156 + 1.5;
        float _262 = 1.0 / _240;
        float _264 = _252 * 0.16666667163372039794921875;
        float _266 = _256 * 0.16666667163372039794921875;
        float _268 = 1.0 / _236;
        float _270 = fma(_254, _246, _258);
        float _272 = 1.0 / _242;
        float _274 = fma(_250, _262, _180);
        float _276 = fma(_264, _268, _260);
        float _278 = _274 * _164;
        float _280 = fma(_266, _272, _182);
        float _282 = _270 * _198;
        float _284 = _276 * _198;
        float _286 = _280 * _164;
        float2 _737 = float2(_282, _278);
        float3 _290 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_737, float2(0.0), isnan(_737)), level(_126)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_737, float2(0.0), isnan(_737)), level(_126)).xyz;
        float _292 = _290.x;
        float _294 = _290.y;
        float _296 = _290.z;
        float2 _752 = float2(_284, _278);
        float3 _298 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_752, float2(0.0), isnan(_752)), level(_126)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_752, float2(0.0), isnan(_752)), level(_126)).xyz;
        float _300 = _298.x;
        float _302 = _298.y;
        float _304 = _298.z;
        float2 _767 = float2(_282, _286);
        float3 _306 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_767, float2(0.0), isnan(_767)), level(_126)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_767, float2(0.0), isnan(_767)), level(_126)).xyz;
        float _308 = _306.x;
        float _310 = _306.y;
        float _312 = _306.z;
        float2 _782 = float2(_284, _286);
        float3 _314 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_782, float2(0.0), isnan(_782)), level(_126)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_782, float2(0.0), isnan(_782)), level(_126)).xyz;
        float _316 = _314.x;
        float _318 = _314.y;
        float _320 = _314.z;
        float _322 = 0.0 + _124;
        float _324 = precise::clamp(_322, 0.0, 1.0);
        float _326 = fma(_106, _324, _102);
        float _328 = _324 * _106;
        float _330 = 1.0 / _326;
        float _332 = -_304;
        float _334 = _296 + _332;
        float _336 = -_300;
        float _338 = _292 + _336;
        float _340 = -_320;
        float _342 = _312 + _340;
        float _344 = fma(_238, _334, _304);
        float _346 = -_316;
        float _348 = _308 + _346;
        float _350 = -_302;
        float _352 = _294 + _350;
        float _354 = -_318;
        float _356 = _310 + _354;
        float _358 = fma(_238, _342, _320);
        float _360 = fma(_238, _338, _300);
        float _362 = fma(_238, _348, _316);
        float _364 = fma(_238, _352, _302);
        float _366 = fma(_238, _356, _318);
        float _368 = -_358;
        float _370 = _368 + _344;
        float _372 = -_362;
        float _374 = _372 + _360;
        float _376 = _330 * _328;
        float _378 = -_366;
        float _380 = _378 + _364;
        float _382 = fma(_240, _370, _358);
        float _384 = fma(_240, _374, _362);
        float _386 = fma(_240, _380, _366);
        float _388 = _382 * _328;
        float _390 = _384 * _376;
        float _392 = _386 * _376;
        float _394 = _388 * _330;
        out.m_34.x = _390;
        out.m_34.y = _392;
        out.m_34.z = _394;
        out.m_34.w = _326;
        return out;
    }
    out.m_34.x = 0.0;
    out.m_34.y = 0.0;
    out.m_34.z = 0.0;
    out.m_34.w = _102;
    return out;
}

