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
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
    constant _16* vp_c9 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture2d<float> vp_t_tcb_C [[id(6)]];
    sampler vp_t_tcb_CSmplr [[id(7)]];
    texture3d<float> vp_t_tcb_32 [[id(8)]];
    sampler vp_t_tcb_32Smplr [[id(9)]];
    texture3d<float> vp_t_tcb_30 [[id(10)]];
    sampler vp_t_tcb_30Smplr [[id(11)]];
    texture2d<float> vp_t_tcb_1C [[id(12)]];
    sampler vp_t_tcb_1CSmplr [[id(13)]];
    sampler vp_t_tcb_32Smplr_w [[id(14)]];
    sampler vp_t_tcb_30Smplr_w [[id(15)]];
    sampler vp_t_tcb_1CSmplr_w [[id(16)]];
    constant dm_border_t* dm_border [[id(17)]];
};

struct main0_out
{
    float4 m_69 [[user(locn0)]];
    float4 m_67 [[user(locn1)]];
    float4 m_47 [[user(locn2)]];
    float4 m_73 [[user(locn3)]];
    float4 m_79 [[user(locn4)]];
    float4 m_77 [[user(locn5)]];
    float4 m_83 [[user(locn6)]];
    float4 m_57 [[user(locn7)]];
    float4 m_81 [[user(locn8)]];
    float4 m_75 [[user(locn9)]];
    float4 m_85 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_61 [[attribute(1)]];
    float4 m_65 [[attribute(2)]];
    float4 m_59 [[attribute(3)]];
    float4 m_63 [[attribute(4)]];
    float4 m_44 [[attribute(5)]];
    float4 m_49 [[attribute(6)]];
    float4 m_53 [[attribute(9)]];
    float4 m_51 [[attribute(10)]];
    float4 m_55 [[attribute(11)]];
    float4 m_71 [[attribute(12)]];
};

static inline __attribute__((always_inline))
int _100(thread const int& _7841, thread const int& _7842, constant _10& support_buffer)
{
    float _7845 = as_type<float>(support_buffer._m4);
    int _7847 = _7842 + as_type<int>(_7845);
    int _7849 = 1 + _7847;
    float _7851 = support_buffer._m5[_7849].x;
    float _7853 = abs(_7851);
    bool _7855 = _7853 == 1.0;
    if (_7855)
    {
        return _7841;
    }
    float _7857 = float(_7841);
    float _7859 = _7857 / _7853;
    int _7861 = int(_7859);
    return _7861;
}

static inline __attribute__((always_inline))
int _101(thread const int& _7891, thread const int& _7892, constant _10& support_buffer)
{
    float _7895 = as_type<float>(support_buffer._m4);
    int _7897 = _7892 + as_type<int>(_7895);
    int _7899 = 1 + _7897;
    float _7901 = support_buffer._m5[_7899].x;
    bool _7903 = _7901 == 1.0;
    if (_7903)
    {
        return _7891;
    }
    float _7905 = float(_7891);
    float _7907 = _7905 * _7901;
    int _7909 = int(_7907);
    return _7909;
}

static inline __attribute__((always_inline))
void _98(thread const int& _7537, thread const int& _7538, thread const int& _7539, thread const int& _7540, thread int& _7541, thread int& _7542, thread int& _7543, thread int& _7544, thread int& _7545, thread int& _7546, thread float4& gl_Position, thread float& gl_PointSize)
{
    gl_PointSize = 1.0;
    int _7549 = _7538;
    int _7551 = _7539;
    float _7553 = 0.0 + as_type<float>(_7537);
    bool _7555 = _7553 != 0.0;
    bool _7557 = isnan(_7553);
    bool _7559 = _7555 || _7557;
    bool _7561 = isnan(0.0);
    bool _7563 = _7559 || _7561;
    int _7565 = as_type<int>(_7553);
    int _7567 = _7563 ? (-1) : 0;
    if (!_7563)
    {
        float _7569 = as_type<float>(_7537) * 1.0;
        _7549 = as_type<int>(_7569);
    }
    int _7571 = _7549;
    bool _7573 = !_7563;
    int _7575 = _7571;
    int _7577 = _7571;
    if (!_7573)
    {
        bool _7579 = _7553 >= 0.0;
        bool _7581 = isnan(_7553);
        bool _7583 = _7579 || _7581;
        bool _7585 = isnan(0.0);
        bool _7587 = _7583 || _7585;
        _7567 = _7587 ? (-1) : 0;
        if (!_7587)
        {
            _7575 = 2147483647;
        }
        int _7589 = _7575;
        bool _7591 = !_7587;
        int _7593 = _7589;
        _7577 = _7589;
        if (!_7591)
        {
            float _7595 = abs(as_type<float>(_7537));
            float _7597 = 0.0 + _7595;
            bool _7599 = _7597 > as_type<float>(0x7f800000u /* inf */);
            bool _7601 = isnan(_7597);
            bool _7603 = _7599 || _7601;
            bool _7605 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _7607 = _7603 || _7605;
            _7565 = as_type<int>(_7597);
            _7567 = _7607 ? (-1) : 0;
            if (_7607)
            {
                float _7609 = as_type<float>(_7537) + 1.0;
                _7593 = as_type<int>(_7609);
            }
            int _7611 = _7593;
            int _7613 = _7611;
            _7577 = _7611;
            if (!_7607)
            {
                bool _7615 = _7597 != as_type<float>(0x7f800000u /* inf */);
                bool _7617 = isnan(_7597);
                bool _7619 = _7615 || _7617;
                bool _7621 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _7623 = _7619 || _7621;
                _7567 = _7623 ? (-1) : 0;
                if (!_7623)
                {
                    _7613 = _7537;
                }
                int _7625 = _7613;
                bool _7627 = !_7623;
                _7577 = _7625;
                if (!_7627)
                {
                    float _7629 = as_type<float>(_7537) * 18446744073709551616.0;
                    float _7631 = rsqrt(_7629);
                    float _7633 = _7629 * _7631;
                    float _7635 = _7631 * 0.5;
                    float _7637 = -_7633;
                    float _7639 = 0.0 + _7637;
                    float _7641 = fma(_7635, _7639, 0.5);
                    float _7643 = fma(_7633, _7641, _7633);
                    float _7645 = -_7643;
                    float _7647 = 0.0 + _7645;
                    float _7649 = fma(_7643, _7647, _7629);
                    float _7651 = fma(_7635, _7649, _7643);
                    float _7653 = _7651 * 2.3283064365386962890625e-10;
                    _7577 = as_type<int>(_7653);
                    _7551 = as_type<int>(_7643);
                    _7565 = as_type<int>(_7639);
                }
            }
        }
    }
    int _7655 = _7577;
    int _7657 = _7551;
    int _7659 = _7565;
    int _7661 = _7567;
    _7541 = _7540;
    _7542 = 0;
    _7543 = _7655;
    _7544 = _7657;
    _7545 = _7659;
    _7546 = _7661;
}

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1493 = false;
    bool _1303 = false;
    bool _753 = false;
    bool _523 = false;
    bool _307 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _105 = in.m_44.w;
    float _107 = trunc(_105);
    int _109 = int(_107);
    bool _113 = _109 >= 1;
    float _115 = 0.0;
    float _117 = as_type<float>(_109);
    if (!_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _119 = _115;
    if (!_113)
    {
        out.m_47.x = 0.0;
    }
    int _121 = 0;
    if (!_113)
    {
        float _123 = _119 * 5.0;
        _121 = as_type<int>(_123);
    }
    int _125 = _121;
    int _127 = _125;
    if (!_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3109 = as_type<float>(_125);
        out.gl_Position.z = _3109;
    }
    if (!_113)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _129 = in.m_49.w;
    float _131 = float(_109);
    float _133 = -_129;
    float _135 = _133 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = _129 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _139 = isnan(_129);
    bool _141 = _137 || _139;
    bool _143 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _145 = _141 || _143;
    bool _147 = _135 >= _131;
    bool _149 = !_145;
    bool _151 = _147 || _149;
    float _153 = _135;
    if (_151)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _155 = _117;
    if (_151)
    {
        out.m_47.x = 0.0;
    }
    if (_151)
    {
        float _157 = _155 * 5.0;
        _127 = as_type<int>(_157);
    }
    int _159 = _127;
    if (_151)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3173 = as_type<float>(_159);
        out.gl_Position.z = _3173;
    }
    if (_151)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _161 = in.m_51.w;
    float _163 = 1.0 / _131;
    float _165 = _135 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _167 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _169 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _171 = _167 || _169;
    bool _173 = isnan(1.0);
    bool _175 = _171 || _173;
    float _177 = in.m_49.x;
    float _179 = in.m_49.y;
    float _181 = in.m_49.z;
    float _183 = in.m_44.x;
    float _185 = in.m_44.y;
    float _187 = in.m_44.z;
    float _189 = 0.0;
    float _191 = _165;
    if (!_175)
    {
        float _193 = _165 * _165;
        float _195 = _193 * 0.5;
        _189 = _195;
    }
    float _197 = _189;
    float _199 = _197;
    if (!_175)
    {
        float _201 = _197 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _199 = _201;
    }
    float _203 = _199;
    bool _205 = !_175;
    float _207 = _203;
    if (!_205)
    {
        float _209 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _211 = log2(_209);
        float _213 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _215 = _213 + 1.0;
        float _217 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _219 = _165 * _211;
        float _221 = 1.0 / _215;
        float _223 = _217 * 0.693147182464599609375;
        float _225 = exp2(_219);
        float _227 = 1.0 / _223;
        float _229 = _225 + (-1.0);
        float _231 = -_229;
        float _233 = fma(_231, _227, _165);
        float _235 = _233 * _221;
        float _237 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _207 = _237;
    }
    float _239 = _207;
    bool _241 = !_175;
    if (!_241)
    {
        float _243 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _245 = log2(_243);
        float _247 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _249 = _247 + 1.0;
        float _251 = 1.0 / _249;
        float _253 = _165 * _245;
        float _255 = exp2(_253);
        float _257 = -_255;
        float _259 = _257 + 1.0;
        float _261 = _259 * _251;
        _191 = _261;
    }
    float _263 = _191;
    bool _265 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _267 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _269 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _271 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _273 = fma(_263, _177, _267);
    float _275 = fma(_263, _179, _269);
    float _277 = fma(_263, _181, _271);
    float _279 = _135 * _163;
    float _281 = fma(_273, _161, _183);
    float _283 = fma(_275, _161, _185);
    float _285 = fma(_277, _161, _187);
    bool _287 = !_265;
    float _305;
    if (!_287)
    {
        float _289 = in.m_53.x;
        float _291 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _293 = _289 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _295 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[11].x, _135);
        float _297 = _295 * _291;
        float _299 = floor(_297);
        float _301 = -_299;
        float _303 = _297 + _301;
        _305 = _303;
        _307 = true;
    }
    else
    {
        _305 = _279;
    }
    _307 = false;
    float _309 = _305;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _313 = _309 + _311;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _317 = _309 + _315;
    bool _319 = _309 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _321 = isnan(_309);
    bool _323 = _319 || _321;
    bool _325 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _327 = _323 || _325;
    float _329 = float(_327);
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _333 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _331;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _337 = _309 + _335;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _341 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _339;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _345 = _343 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _347 = 1.0 / _333;
    bool _349 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _351 = 1.0 / _345;
    float _353 = 1.0 / _341;
    float _355 = _313 * _347;
    bool _357 = _309 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _359 = isnan(_309);
    bool _361 = _357 || _359;
    bool _363 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _365 = _361 || _363;
    float _367 = float(_365);
    float _369 = -_329;
    float _371 = _369 + 1.0;
    float _373 = _367 * _371;
    float _375 = _317 * _351;
    bool _377 = _309 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _379 = isnan(_309);
    bool _381 = _377 || _379;
    bool _383 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _385 = _381 || _383;
    float _387 = float(_385);
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _391 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _389;
    bool _393 = _309 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _395 = isnan(_309);
    bool _397 = _393 || _395;
    bool _399 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _401 = _397 || _399;
    float _403 = float(_401);
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _407 = _405 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _409 = -_367;
    float _411 = _409 + 1.0;
    float _413 = -_387;
    float _415 = _413 + 1.0;
    float _417 = _337 * _353;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _421 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _419;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _425 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _423;
    float _427 = _403 * _415;
    float _429 = fma(_391, _417, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _431 = fma(_421, _417, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _433 = fma(_425, _417, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _435 = _387 * _411;
    float _437 = _429 * _427;
    float _439 = _431 * _427;
    float _441 = _433 * _427;
    float _443 = -_403;
    float _445 = _443 + 1.0;
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _449 = _447 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _453 = _451 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _455 = fma(_445, (*spvDescriptorSet0.vp_c9)._m0[107].x, _441);
    float _457 = fma(_445, (*spvDescriptorSet0.vp_c9)._m0[107].y, _439);
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _461 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _459;
    float _463 = fma(_453, _375, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _465 = fma(_445, (*spvDescriptorSet0.vp_c9)._m0[107].z, _437);
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _469 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _467;
    float _471 = fma(_407, _375, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _473 = fma(_449, _375, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _477 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _475;
    float _479 = fma(_469, _355, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _481 = fma(_463, _435, _457);
    float _483 = fma(_471, _435, _455);
    float _485 = fma(_461, _355, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _487 = fma(_477, _355, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _489 = fma(_473, _435, _465);
    float _491 = fma(_479, _373, _481);
    float _493 = fma(_485, _373, _483);
    float _495 = fma(_487, _373, _489);
    float _497 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[110].y, _491);
    float _499 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[110].x, _493);
    float _501 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[110].z, _495);
    bool _503 = !_349;
    float _521;
    if (!_503)
    {
        float _505 = in.m_53.x;
        float _507 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _509 = _505 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _511 = fma(_509, (*spvDescriptorSet0.vp_c9)._m0[11].y, _135);
        float _513 = _511 * _507;
        float _515 = floor(_513);
        float _517 = -_515;
        float _519 = _513 + _517;
        _521 = _519;
        _523 = true;
    }
    else
    {
        _521 = _279;
    }
    _523 = false;
    float _525 = _521;
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _529 = _525 + _527;
    float _531 = _499 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _533 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _535 = _533 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _537 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _539 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _537;
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _543 = _541 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _545 = _525 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _547 = isnan(_525);
    bool _549 = _545 || _547;
    bool _551 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _553 = _549 || _551;
    float _555 = float(_553);
    float _557 = 1.0 / _535;
    float _559 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _561 = _559 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _563 = _525 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _565 = isnan(_525);
    bool _567 = _563 || _565;
    bool _569 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _571 = _567 || _569;
    float _573 = float(_571);
    float _575 = _497 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _577 = _501 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _579 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _581 = 1.0 / _543;
    float _583 = _539 * _557;
    bool _585 = _525 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _587 = isnan(_525);
    bool _589 = _585 || _587;
    bool _591 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _593 = _589 || _591;
    float _595 = float(_593);
    float _597 = 1.0 / _561;
    float _599 = -_555;
    float _601 = _599 + 1.0;
    float _603 = fma(_583, _529, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _605 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _607 = _605 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _609 = -_595;
    float _611 = _609 + 1.0;
    bool _613 = _525 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _615 = isnan(_525);
    bool _617 = _613 || _615;
    bool _619 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _621 = _617 || _619;
    float _623 = float(_621);
    float _625 = _595 * _601;
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _629 = _627 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _631 = 1.0 / _607;
    float _633 = _573 * _611;
    float _635 = -_623;
    float _637 = _635 + 1.0;
    float _639 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _641 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _639;
    float _643 = _629 * _581;
    float _645 = _603 * _633;
    float _647 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _649 = _525 + _647;
    float _651 = -_573;
    float _653 = _651 + 1.0;
    float _655 = _555 * _637;
    float _657 = _641 * _597;
    bool _659 = _525 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _661 = isnan(_525);
    bool _663 = _659 || _661;
    bool _665 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _667 = _663 || _665;
    float _669 = float(_667);
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _673 = _671 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _677 = _525 + _675;
    float _679 = fma(_643, _649, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _681 = fma(_653, (*spvDescriptorSet0.vp_c9)._m0[115].x, _645);
    float _683 = -_669;
    float _685 = _683 + 1.0;
    float _687 = _673 * _631;
    float _689 = fma(_657, _677, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _693 = _525 + _691;
    float _695 = fma(_679, _625, _681);
    float _697 = _623 * _685;
    float _699 = fma(_687, _693, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _701 = fma(_689, _655, _695);
    float _703 = _531 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _705 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _707 = fma(_699, _697, _701);
    float _709 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _711 = _575 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _713 = fma(_669, (*spvDescriptorSet0.vp_c9)._m0[119].x, _707);
    float _715 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _717 = _577 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _719 = _709 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _721 = _713 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _723 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _725 = _715 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _727 = _723 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _729 = !_579;
    float _731 = _705;
    float _733 = _727;
    float _751;
    if (!_729)
    {
        float _735 = in.m_53.x;
        float _737 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _739 = _735 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _741 = fma(_739, (*spvDescriptorSet0.vp_c9)._m0[14].x, _135);
        float _743 = _741 * _737;
        float _745 = floor(_743);
        float _747 = -_745;
        float _749 = _743 + _747;
        _751 = _749;
        _753 = true;
    }
    else
    {
        _751 = _279;
    }
    _753 = false;
    float _755 = _751;
    int _757 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _759 = _757;
    int _761 = 0;
    int _763 = _100(_759, _761, (*spvDescriptorSet0.support_buffer));
    float _765 = in.m_55.z;
    float _767 = 0.0 + _279;
    float _769 = precise::clamp(_767, 0.0, 1.0);
    float _771 = trunc(_765);
    int _773 = int(_771);
    int _775 = _763 + (-1);
    float _777 = float(_775);
    float _779 = _769 * _777;
    float _781 = trunc(_779);
    int _783 = int(_781);
    int _785 = _783;
    int _787 = 0;
    int _789 = _101(_785, _787, (*spvDescriptorSet0.support_buffer));
    int _791 = _773;
    int _793 = 0;
    int _795 = _101(_791, _793, (*spvDescriptorSet0.support_buffer));
    float4 _798 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_789, _795)), 0).xyzw;
    float _800 = _798.x;
    float _802 = _798.y;
    float _804 = _798.z;
    float _806 = _798.w;
    float _808 = in.m_53.x;
    float _810 = in.m_53.y;
    float _812 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _814 = _812 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _816 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _818 = _816 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _820 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _822 = 1.0 / _814;
    float _824 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _826 = _824 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    int _828 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _830 = _828 != 0;
    int _832 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _834 = _832 != 0;
    float _836 = 1.0 / _818;
    float _838 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _840 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _838;
    float _842 = _808 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _844 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _846 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _848 = _846 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _850 = 1.0 / _826;
    float _852 = -_820;
    float _854 = fma(_842, 2.0, _852);
    float _856 = fma(_808, (*spvDescriptorSet0.vp_c9)._m0[78].z, _844);
    float _858 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _860 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _858;
    float _862 = _840 * _822;
    float _864 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _866 = _810 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _868 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _870 = _868 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _872 = _848 * _836;
    bool _874 = _755 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _876 = isnan(_755);
    bool _878 = _874 || _876;
    bool _880 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _882 = _878 || _880;
    float _884 = float(_882);
    float _886 = fma(_866, -2.0, _864);
    float _888 = 1.0 / _870;
    bool _890 = _755 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _892 = isnan(_755);
    bool _894 = _890 || _892;
    bool _896 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _898 = _894 || _896;
    float _900 = float(_898);
    float _902 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _904 = _902 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _906 = _860 * _850;
    float _908 = -_884;
    float _910 = _908 + 1.0;
    float _912 = -_900;
    float _914 = _912 + 1.0;
    bool _916 = _755 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _918 = isnan(_755);
    bool _920 = _916 || _918;
    bool _922 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _924 = _920 || _922;
    float _926 = float(_924);
    float _928 = 0.0;
    if (_830)
    {
        float _930 = in.m_53.x;
        _928 = _930;
    }
    float _932 = _928;
    float _934 = _884 * _914;
    bool _936 = _755 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _938 = isnan(_755);
    bool _940 = _936 || _938;
    bool _942 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _944 = _940 || _942;
    float _946 = float(_944);
    float _948 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _950 = _948 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _952 = _755 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _954 = isnan(_755);
    bool _956 = _952 || _954;
    bool _958 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _960 = _956 || _958;
    float _962 = float(_960);
    float _964 = _926 * _910;
    float _966 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _968 = _966 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _970 = _904 * _888;
    float _972 = -_946;
    float _974 = _972 + 1.0;
    bool _976 = _755 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _978 = isnan(_755);
    bool _980 = _976 || _978;
    bool _982 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _984 = _980 || _982;
    float _986 = float(_984);
    float _988 = -_962;
    float _990 = _988 + 1.0;
    float _992 = 1.0 / _950;
    float _994 = -_926;
    float _996 = _994 + 1.0;
    float _998 = _986 * _990;
    float _1000 = -_986;
    float _1002 = _1000 + 1.0;
    float _1004 = _946 * _996;
    float _1006 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1008 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1006;
    float _1010 = 1.0 / _968;
    float _1012 = _962 * _974;
    float _1014 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1016 = _755 + _1014;
    bool _1018 = _755 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1020 = isnan(_755);
    bool _1022 = _1018 || _1020;
    bool _1024 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1026 = _1022 || _1024;
    float _1028 = float(_1026);
    float _1030 = -_135;
    float _1032 = fma(_1030, (*spvDescriptorSet0.vp_c9)._m0[76].x, _854);
    bool _1034 = _932 > 0.5;
    bool _1036 = _1034 && _830;
    float _1038 = fma(_862, _1016, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _1040 = _810 > 0.5;
    bool _1042 = _1040 && _834;
    float _1044 = _1028 * _1002;
    float _1046 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1048 = _1046 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1050 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1052 = _1050 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1054 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1056 = _755 + _1054;
    float _1058 = _1038 * _1044;
    float _1060 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1062 = _755 + _1060;
    float _1064 = in.m_55.x;
    float _1066 = fma(_872, _1056, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1068 = _1008 * _992;
    float _1070 = fma(_906, _1062, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1072 = -_1028;
    float _1074 = _1072 + 1.0;
    float _1076 = in.m_55.y;
    float _1078 = 1.0 / _1052;
    float _1080 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1082 = _755 + _1080;
    float _1084 = fma(_1074, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1058);
    float _1086 = _1048 * _1010;
    float _1088 = fma(_970, _1082, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1090 = fma(_1066, _998, _1084);
    float _1092 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1094 = _755 + _1092;
    float _1096 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1098 = _755 + _1096;
    float _1100 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1102 = fma(_1070, _1012, _1090);
    float _1104 = fma(_1068, _1094, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1106 = fma(_1086, _1098, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1108 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1110 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1108;
    float _1112 = fma(_1088, _1004, _1102);
    bool _1114 = _755 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1116 = isnan(_755);
    bool _1118 = _1114 || _1116;
    bool _1120 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1122 = _1118 || _1120;
    float _1124 = float(_1122);
    float _1126 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1128 = _755 + _1126;
    float _1130 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1132 = _1098;
    float _1134 = _1064;
    if (_830)
    {
        _1132 = _1064;
    }
    float _1136 = _1132;
    float _1138 = fma(_1104, _964, _1112);
    float _1140 = _1110 * _1078;
    float _1142 = -_1124;
    float _1144 = _1142 + 1.0;
    float _1146 = _1076;
    float _1148 = _1136;
    if (_1042)
    {
        float _1150 = -_1076;
        float _1152 = _1150 + 1.0;
        _1146 = _1152;
    }
    float _1154 = _1146;
    if (_1036)
    {
        float _1156 = -_1136;
        float _1158 = _1156 + 1.0;
        _1148 = _1158;
    }
    float _1160 = _1148;
    float _1162 = fma(_1140, _1128, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1164 = fma(_1106, _934, _1138);
    float _1166 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1168 = _900 * _1144;
    if (_830)
    {
        _1134 = _1160;
    }
    float _1170 = _1134;
    float _1172 = _1100 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1174 = fma(_810, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1166);
    float _1176 = fma(_1162, _1168, _1164);
    float _1178 = _1130 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1180 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[77].z, _856);
    float _1182 = fma(_1172, _1154, -0.5);
    float _1184 = fma(_1124, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1176);
    float _1186 = fma(_1178, _1170, -0.5);
    float _1188 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1174);
    float _1190 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[76].y, _886);
    float _1192 = fma(_1180, _1186, _1032);
    int _1194 = _783 + 1;
    float _1196 = -_1190;
    float _1198 = fma(_1188, _1182, _1196);
    out.m_57.x = _1184;
    float _1200 = _1192 + 0.5;
    int _1202 = min(_775, _1194);
    float _1204 = _1198 + 0.5;
    float _1206 = in.m_51.x;
    float _1208 = in.m_51.y;
    float _1210 = in.m_51.z;
    float _1212 = _1210 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _1214 = _1208 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1216 = _1206 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    uint _1219 = as_type<uint>(half2(float2(_806, 0.0)));
    uint _1221 = extract_bits(_1219, 0u, 8u);
    int _1223 = int(_1221) & 255;
    uint _1225 = extract_bits(_1219, 8u, 8u);
    int _1227 = int(_1225) & 255;
    int _1229 = _1227 << 8;
    int _1231 = _1223 | _1229;
    bool _1233 = _1231 >= 32768;
    int _1235 = _1231 + (-1024);
    int _1237 = _1235;
    if (_1233)
    {
        int _1239 = ~_1231;
        int _1241 = _1239 + 33792;
        int _1243 = _1241 + 1;
        _1237 = _1243;
    }
    int _1245 = _1237;
    int _1247 = _1245 + 30719;
    float _1249 = float(_1247);
    float _1251 = fma(_1249, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1253 = abs(_1251);
    float _1255 = -_1253;
    float _1257 = _1255 + 1.0;
    bool _1259 = _1251 < 0.0;
    float _1261 = float(_1259);
    float _1263 = abs(_1251);
    float _1265 = fma(_1263, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _1267 = as_type<int>(_1257) + (-218103808);
    float _1269 = abs(_1251);
    float _1271 = fma(_1269, _1265, -0.212114393711090087890625);
    bool _1273 = uint(_1267) >= 1920991232u;
    float _1275 = abs(_1251);
    float _1277 = fma(_1275, _1271, 1.570728778839111328125);
    bool _1279 = !_1273;
    float _1301;
    if (!_1279)
    {
        int _1281 = as_type<int>(_1257);
        int _1283 = as_type<int>(_1206);
        int _1285 = as_type<int>(_1208);
        int _1287 = 6256;
        int _1289;
        int _1291;
        int _1293;
        int _1295;
        int _1297;
        int _1299;
        _98(_1281, _1283, _1285, _1287, _1289, _1291, _1293, _1295, _1297, _1299, out.gl_Position, out.gl_PointSize);
        _1301 = as_type<float>(_1293);
        _1303 = true;
    }
    else
    {
        float _1305 = rsqrt(_1257);
        float _1307 = _1257 * _1305;
        float _1309 = _1305 * 0.5;
        float _1311 = -_1307;
        float _1313 = 0.0 + _1311;
        float _1315 = fma(_1309, _1313, 0.5);
        float _1317 = fma(_1307, _1315, _1307);
        float _1319 = -_1317;
        float _1321 = 0.0 + _1319;
        float _1323 = fma(_1317, _1321, _1257);
        float _1325 = fma(_1309, _1323, _1317);
        _1301 = _1325;
    }
    _1303 = false;
    float _1327 = _1301;
    int _1329 = _1202;
    int _1331 = 0;
    int _1333 = _101(_1329, _1331, (*spvDescriptorSet0.support_buffer));
    int _1335 = _773;
    int _1337 = 0;
    int _1339 = _101(_1335, _1337, (*spvDescriptorSet0.support_buffer));
    float4 _1341 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1333, _1339)), 0).xyzw;
    float _1343 = _1341.x;
    float _1345 = _1341.y;
    float _1347 = _1341.z;
    float _1349 = _1341.w;
    float _1351 = _1277 * _1327;
    float _1353 = _1261 * 2.0;
    float _1355 = _1249 * 3.883221149444580078125;
    float _1357 = floor(_779);
    float _1359 = -_1353;
    float _1361 = fma(_1351, _1359, _1351);
    float _1363 = _1355 * 0.15915493667125701904296875;
    float _1365 = fma(_1261, 3.1415927410125732421875, _1361);
    float _1367 = _1363 * 6.283185482025146484375;
    float _1369 = cos(_1367);
    float _1371 = _1365 * 0.15915493667125701904296875;
    float _1373 = _1371 * 6.283185482025146484375;
    float _1375 = sin(_1373);
    float _1377 = -_1357;
    float _1379 = _779 + _1377;
    float _1381 = _1363 * 6.283185482025146484375;
    float _1383 = sin(_1381);
    float _1385 = _1375 * _1369;
    float _1387 = _1375 * _1383;
    uint _1389 = as_type<uint>(half2(float2(_1349, 0.0)));
    float _1391 = -_800;
    float _1393 = _1391 + _1343;
    uint _1395 = extract_bits(_1389, 0u, 8u);
    int _1397 = int(_1395) & 255;
    uint _1399 = extract_bits(_1389, 8u, 8u);
    int _1401 = int(_1399) & 255;
    int _1403 = _1401 << 8;
    int _1405 = _1397 | _1403;
    float _1407 = fma(_1379, _1393, _800);
    bool _1409 = _1405 >= 32768;
    int _1411 = _1405 + (-1024);
    int _1413 = _1411;
    float _1415 = _1385;
    if (_1409)
    {
        int _1417 = ~_1405;
        int _1419 = _1417 + 33792;
        int _1421 = _1419 + 1;
        _1413 = _1421;
    }
    int _1423 = _1413;
    int _1425 = _1423 + 30719;
    float _1427 = float(_1425);
    float _1429 = -_802;
    float _1431 = _1429 + _1345;
    float _1433 = fma(_1427, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1435 = fma(_1379, _1431, _802);
    float _1437 = abs(_1433);
    float _1439 = -_1437;
    float _1441 = _1439 + 1.0;
    float _1443 = abs(_1433);
    float _1445 = fma(_1443, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _1447 = _1433 < 0.0;
    float _1449 = float(_1447);
    int _1451 = as_type<int>(_1441) + (-218103808);
    float _1453 = abs(_1433);
    float _1455 = fma(_1453, _1445, -0.212114393711090087890625);
    bool _1457 = uint(_1451) >= 1920991232u;
    float _1459 = -_804;
    float _1461 = _1459 + _1347;
    float _1463 = abs(_1433);
    float _1465 = fma(_1463, _1455, 1.570728778839111328125);
    float _1467 = fma(_1379, _1461, _804);
    bool _1469 = !_1457;
    float _1491;
    if (!_1469)
    {
        int _1471 = as_type<int>(_1441);
        int _1473 = as_type<int>(_1393);
        int _1475 = as_type<int>(_1345);
        int _1477 = 7168;
        int _1479;
        int _1481;
        int _1483;
        int _1485;
        int _1487;
        int _1489;
        _98(_1471, _1473, _1475, _1477, _1479, _1481, _1483, _1485, _1487, _1489, out.gl_Position, out.gl_PointSize);
        _1491 = as_type<float>(_1483);
        _1493 = true;
    }
    else
    {
        float _1495 = rsqrt(_1441);
        float _1497 = _1441 * _1495;
        float _1499 = _1495 * 0.5;
        float _1501 = -_1497;
        float _1503 = 0.0 + _1501;
        float _1505 = fma(_1499, _1503, 0.5);
        float _1507 = fma(_1497, _1505, _1497);
        float _1509 = -_1507;
        float _1511 = 0.0 + _1509;
        float _1513 = fma(_1507, _1511, _1441);
        float _1515 = fma(_1499, _1513, _1507);
        _1491 = _1515;
    }
    _1493 = false;
    float _1517 = _1491;
    float _1519 = in.m_53.x;
    float _1521 = in.m_53.y;
    float _1523 = in.m_53.z;
    float _1525 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1527 = log2(_1525);
    float _1529 = in.m_59.x;
    float _1531 = in.m_59.y;
    float _1533 = in.m_59.z;
    float _1535 = in.m_61.x;
    float _1537 = in.m_61.y;
    float _1539 = in.m_61.z;
    float _1541 = _1527 * _135;
    float _1543 = exp2(_1541);
    float _1545 = _1523 * 2.0;
    float _1547 = _1519 * 2.0;
    float _1549 = _283 * _1531;
    float _1551 = floor(_1545);
    float _1553 = fma(_281, _1529, _1549);
    float _1555 = _1521 * 2.0;
    float _1557 = _283 * _1537;
    float _1559 = fma(_281, _1535, _1557);
    float _1561 = floor(_1547);
    int _1563 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1565 = _1563 != 0;
    int _1567 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1569 = _1567 != 0;
    int _1571 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1573 = _1571 != 0;
    float _1575 = _1523 + _1519;
    float _1577 = _1521 + _1519;
    float _1579 = fma(_285, _1539, _1559);
    float _1581 = -_1543;
    float _1583 = _1581 + 1.0;
    float _1585 = _1575 + (-1.0);
    float _1587 = _1577 + (-1.0);
    float _1589 = floor(_1555);
    bool _1591 = _1551 > 0.0;
    float _1593 = fma(_1585, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _1595 = _1551 >= 0.0;
    bool _1597 = isnan(_1551);
    bool _1599 = _1595 || _1597;
    bool _1601 = isnan(0.0);
    bool _1603 = _1599 || _1601;
    float _1605 = fma(_285, _1533, _1553);
    float _1607 = fma(_1587, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1609 = _1603 ? 0 : 1;
    float _1611 = _1579 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _1613 = _1561 > 0.0;
    float _1615 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1617 = 1.0 + _1615;
    int _1619 = ~_1609;
    int _1621 = _1619 + 1;
    int _1623 = _1621 + 1;
    float _1625 = _1605 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1627 = _1561 >= 0.0;
    bool _1629 = isnan(_1561);
    bool _1631 = _1627 || _1629;
    bool _1633 = isnan(0.0);
    bool _1635 = _1631 || _1633;
    float _1637 = 1.0 / _1617;
    int _1639 = _1623;
    if (!_1591)
    {
        int _1641 = ~_1609;
        int _1643 = _1641 + 1;
        _1639 = _1643;
    }
    int _1645 = _1639;
    float _1647 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1649 = _1611 + _1647;
    float _1651 = in.m_63.x;
    float _1653 = in.m_63.y;
    float _1655 = in.m_63.z;
    float _1657 = _1519 + (-0.5);
    bool _1659 = _1589 > 0.0;
    float _1661 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1663 = (*spvDescriptorSet0.vp_c8)._m0[29].x + _1661;
    bool _1665 = _1589 >= 0.0;
    bool _1667 = isnan(_1589);
    bool _1669 = _1665 || _1667;
    bool _1671 = isnan(0.0);
    bool _1673 = _1669 || _1671;
    float _1675 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1677 = (*spvDescriptorSet0.vp_c8)._m0[29].z + _1675;
    bool _1679 = !_1565;
    int _1681 = _1679 ? 0 : 1;
    bool _1683 = !_1573;
    int _1685 = _1683 ? 0 : 1;
    bool _1687 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1689 = isnan(1.0);
    bool _1691 = _1687 || _1689;
    bool _1693 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1695 = _1691 || _1693;
    int _1697 = abs(_1681);
    float _1699 = -_1625;
    float _1701 = _1699 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    bool _1703 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1705 = isnan(0.0);
    bool _1707 = _1703 || _1705;
    bool _1709 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1711 = _1707 || _1709;
    float _1713 = abs(_1663);
    float _1715 = abs(_1677);
    float _1717 = precise::max(_1713, _1715);
    float _1719 = float(_1697);
    float _1721 = float(_1645);
    float _1723 = _1711 ? _1583 : 0.0;
    int _1725 = _1673 ? 0 : 1;
    float _1727 = _1719 * _1721;
    bool _1729 = _1717 >= 16.0;
    float _1731 = _1663;
    float _1733 = _1649;
    float _1735 = _1701;
    float _1737 = _1677;
    if (_1695)
    {
        float _1739 = _1723 * _1637;
        _153 = _1739;
    }
    float _1741 = _153;
    float _1743 = abs(_1649);
    float _1745 = abs(_1701);
    float _1747 = precise::max(_1743, _1745);
    float _1749 = _1727 * (-2.0);
    int _1751 = ~_1725;
    int _1753 = _1751 + 1;
    int _1755 = _1753 + 1;
    bool _1757 = !_1569;
    int _1759 = _1757 ? 0 : 1;
    int _1761 = _1755;
    if (!_1659)
    {
        int _1763 = ~_1725;
        int _1765 = _1763 + 1;
        _1761 = _1765;
    }
    int _1767 = _1761;
    float _1769 = fma(_1749, _1651, _1651);
    int _1771 = abs(_1685);
    float _1773 = fma(_1607, _1749, _1607);
    bool _1775 = _1747 >= 16.0;
    float _1777 = fma(_1657, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1769);
    int _1779 = abs(_1759);
    bool _1781 = _1775;
    int _1783 = as_type<int>(_1653);
    if (_1729)
    {
        float _1785 = _1663 * 0.0625;
        _1731 = _1785;
    }
    float _1787 = _1731;
    float _1789 = float(_1771);
    float _1791 = float(_1767);
    int _1793 = _1635 ? 0 : 1;
    float _1795 = _1789 * _1791;
    float _1797 = fma(_1773, _1741, _1777);
    if (_1775)
    {
        float _1799 = _1649 * 0.0625;
        _1733 = _1799;
    }
    float _1801 = _1733;
    float _1803 = _1523 + (-0.5);
    float _1805 = _1795 * (-2.0);
    int _1807 = ~_1793;
    int _1809 = _1807 + 1;
    int _1811 = _1809 + 1;
    int _1813 = _1811;
    if (_1775)
    {
        float _1815 = _1701 * 0.0625;
        _1735 = _1815;
    }
    float _1817 = _1735;
    if (!_1613)
    {
        int _1819 = ~_1793;
        int _1821 = _1819 + 1;
        _1813 = _1821;
    }
    int _1823 = _1813;
    float _1825 = fma(_1805, _1655, _1655);
    float _1827 = abs(_1801);
    bool _1829 = _1827 != 0.0;
    bool _1831 = isnan(_1827);
    bool _1833 = _1829 || _1831;
    bool _1835 = isnan(0.0);
    bool _1837 = _1833 || _1835;
    float _1839 = fma(_1593, _1805, _1593);
    float _1841 = float(_1779);
    float _1843 = fma(_1803, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1825);
    float _1845 = float(_1823);
    float _1847 = _1523 + _1521;
    float _1849 = abs(_1817);
    bool _1851 = _1849 == 0.0;
    bool _1853 = !_1837;
    bool _1855 = _1851 && _1853;
    float _1857 = fma(_1839, _1741, _1843);
    float _1859 = abs(_1817);
    bool _1861 = _1859 == 0.0;
    float _1863 = _1841 * _1845;
    float _1865 = _1847 + (-1.0);
    float _1867 = _1857 * 0.15915493667125701904296875;
    float _1869 = _1863 * (-2.0);
    float _1871 = _1521 + (-0.5);
    float _1873 = _1867 * 6.283185482025146484375;
    float _1875 = sin(_1873);
    float _1877 = _1797 * 0.15915493667125701904296875;
    float _1879 = fma(_1865, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1881 = fma(_1869, _1653, _1653);
    bool _1883 = _1837;
    float _1885 = _1867;
    if (_1855)
    {
        bool _1887 = as_type<int>(_1817) >= 0;
        _1781 = _1887;
    }
    bool _1889 = _1781;
    float _1891 = fma(_1879, _1869, _1879);
    float _1893 = fma(_1871, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1881);
    int _1895 = as_type<int>(_1893);
    int _1897 = _1889 ? (-1) : 0;
    if (_1855)
    {
        int _1899 = _1889 ? 0 : 1078530011;
        _1783 = _1899;
    }
    int _1901 = _1783;
    float _1903 = _1877 * 6.283185482025146484375;
    float _1905 = sin(_1903);
    float _1907 = _1877 * 6.283185482025146484375;
    float _1909 = cos(_1907);
    float _1911 = fma(_1891, _1741, _1893);
    if (_1855)
    {
        int _1913 = int(0x80000000) & as_type<int>(_1801);
        int _1915 = _1901 | _1913;
        _1895 = _1915;
    }
    int _1917 = _1895;
    bool _1919 = !_1837;
    bool _1921 = _1919 && _1861;
    int _1923 = _1917;
    float _1925 = as_type<float>(_1917);
    if (!_1921)
    {
        float _1927 = abs(_1801);
        bool _1929 = _1927 != as_type<float>(0x7f800000u /* inf */);
        bool _1931 = isnan(_1927);
        bool _1933 = _1929 || _1931;
        bool _1935 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1937 = _1933 || _1935;
        float _1939 = abs(_1817);
        bool _1941 = _1939 == as_type<float>(0x7f800000u /* inf */);
        float _1943 = abs(_1817);
        bool _1945 = _1943 == as_type<float>(0x7f800000u /* inf */);
        bool _1947 = !_1937;
        bool _1949 = _1945 && _1947;
        _1883 = _1937;
        if (_1949)
        {
            bool _1951 = as_type<int>(_1817) >= 0;
            _1897 = _1951 ? (-1) : 0;
        }
        int _1953 = _1897;
        if (_1949)
        {
            _1923 = 1075235812;
        }
        int _1955 = _1923;
        int _1957 = _1955;
        if (_1949)
        {
            int _1959 = ~_1953;
            int _1961 = (_1959 != 0) ? _1955 : 1061752795;
            _1957 = _1961;
        }
        int _1963 = _1957;
        float _1965 = as_type<float>(_1963);
        if (_1949)
        {
            int _1967 = int(0x80000000) & as_type<int>(_1801);
            int _1969 = _1963 | _1967;
            _1965 = as_type<float>(_1969);
        }
        float _1971 = _1965;
        bool _1973 = !_1937;
        bool _1975 = _1973 && _1941;
        _1925 = _1971;
        if (!_1975)
        {
            float _1977 = abs(_1801);
            float _1979 = abs(_1817);
            float _1981 = precise::max(_1977, _1979);
            float _1983 = abs(_1801);
            float _1985 = abs(_1817);
            float _1987 = precise::min(_1983, _1985);
            float _1989 = 1.0 / _1981;
            float _1991 = abs(_1801);
            float _1993 = abs(_1817);
            bool _1995 = _1991 > _1993;
            bool _1997 = as_type<int>(_1817) >= 0;
            float _1999 = _1987 * _1989;
            float _2001 = abs(_1801);
            float _2003 = abs(_1817);
            float _2005 = _2001 + _2003;
            float _2007 = _1999 * _1999;
            bool _2009 = _2005 > as_type<float>(0x7f800000u /* inf */);
            bool _2011 = isnan(_2005);
            bool _2013 = _2009 || _2011;
            bool _2015 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _2017 = _2013 || _2015;
            float _2019 = _2007 + 11.33538818359375;
            float _2021 = fma(_2007, _2019, 28.84246826171875);
            float _2023 = fma(_2007, _2021, 19.6966705322265625);
            float _2025 = fma(_2007, -0.82336294651031494140625, -5.674867153167724609375);
            float _2027 = fma(_2007, _2025, -6.565555095672607421875);
            float _2029 = 1.0 / _2023;
            float _2031 = _2007 * _2027;
            float _2033 = _1999 * _2031;
            float _2035 = fma(_2033, _2029, _1999);
            int _2037 = as_type<int>(_1801) & int(0x80000000);
            float _2039 = _2035;
            _1925 = _2005;
            _1883 = _2017;
            if (_1995)
            {
                float _2041 = -_2035;
                float _2043 = _2041 + 1.57079637050628662109375;
                _2039 = _2043;
            }
            float _2045 = _2039;
            int _2047 = as_type<int>(_2045);
            if (!_1997)
            {
                float _2049 = -_2045;
                float _2051 = _2049 + 3.1415927410125732421875;
                _2047 = as_type<int>(_2051);
            }
            int _2053 = _2047;
            if (!_2017)
            {
                int _2055 = _2037 | _2053;
                _1925 = as_type<float>(_2055);
            }
        }
    }
    float _2057 = _1925;
    bool _2059 = _1883;
    bool _2061 = _2059;
    if (_1729)
    {
        float _2063 = _1677 * 0.0625;
        _1737 = _2063;
    }
    float _2065 = _1737;
    float _2067 = abs(_1787);
    bool _2069 = _2067 != 0.0;
    bool _2071 = isnan(_2067);
    bool _2073 = _2069 || _2071;
    bool _2075 = isnan(0.0);
    bool _2077 = _2073 || _2075;
    float _2079 = -_2057;
    float _2081 = _1911 + _2079;
    float _2083 = _1867 * 6.283185482025146484375;
    float _2085 = cos(_2083);
    float _2087 = _1216 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2089 = abs(_2065);
    bool _2091 = _2089 == 0.0;
    bool _2093 = !_2077;
    bool _2095 = _2091 && _2093;
    float _2097 = _2081 * 0.15915493667125701904296875;
    float _2099 = abs(_2065);
    bool _2101 = _2099 == 0.0;
    float _2103 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1407);
    float _2105 = _1214 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2107 = _2097 * 6.283185482025146484375;
    float _2109 = sin(_2107);
    float _2111 = _1212 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2113 = _2103 * _2087;
    float _2115 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1435);
    float _2117 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1467);
    float _2119 = _2115 * _2105;
    float _2121 = _2097 * 6.283185482025146484375;
    float _2123 = cos(_2121);
    int _2125 = as_type<int>(_2087);
    if (_2095)
    {
        bool _2127 = as_type<int>(_2065) >= 0;
        _2061 = _2127;
    }
    bool _2129 = _2061;
    float _2131 = _2117 * _2111;
    float _2133 = _1905 * _2085;
    int _2135 = _2129 ? (-1) : 0;
    if (_2095)
    {
        int _2137 = _2129 ? 0 : 1078530011;
        _2125 = _2137;
    }
    int _2139 = _2125;
    int _2141 = _2139;
    if (_2095)
    {
        int _2143 = int(0x80000000) & as_type<int>(_1787);
        int _2145 = _2139 | _2143;
        _1885 = as_type<float>(_2145);
    }
    float _2147 = _1885;
    bool _2149 = !_2077;
    bool _2151 = _2149 && _2101;
    float _2153 = _2147;
    float _2155 = _2147;
    if (!_2151)
    {
        float _2157 = abs(_1787);
        bool _2159 = _2157 != as_type<float>(0x7f800000u /* inf */);
        bool _2161 = isnan(_2157);
        bool _2163 = _2159 || _2161;
        bool _2165 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _2167 = _2163 || _2165;
        float _2169 = abs(_2065);
        bool _2171 = _2169 == as_type<float>(0x7f800000u /* inf */);
        float _2173 = abs(_2065);
        bool _2175 = _2173 == as_type<float>(0x7f800000u /* inf */);
        bool _2177 = !_2167;
        bool _2179 = _2175 && _2177;
        if (_2179)
        {
            bool _2181 = as_type<int>(_2065) >= 0;
            _2135 = _2181 ? (-1) : 0;
        }
        int _2183 = _2135;
        if (_2179)
        {
            _2141 = 1075235812;
        }
        int _2185 = _2141;
        int _2187 = _2185;
        if (_2179)
        {
            int _2189 = ~_2183;
            int _2191 = (_2189 != 0) ? _2185 : 1061752795;
            _2187 = _2191;
        }
        int _2193 = _2187;
        if (_2179)
        {
            int _2195 = int(0x80000000) & as_type<int>(_1787);
            int _2197 = _2193 | _2195;
            _2153 = as_type<float>(_2197);
        }
        float _2199 = _2153;
        bool _2201 = !_2167;
        bool _2203 = _2201 && _2171;
        _2155 = _2199;
        if (!_2203)
        {
            float _2205 = abs(_1787);
            float _2207 = abs(_2065);
            float _2209 = precise::max(_2205, _2207);
            float _2211 = abs(_1787);
            float _2213 = abs(_2065);
            float _2215 = precise::min(_2211, _2213);
            float _2217 = 1.0 / _2209;
            float _2219 = abs(_1787);
            float _2221 = abs(_2065);
            bool _2223 = _2219 > _2221;
            bool _2225 = as_type<int>(_2065) >= 0;
            float _2227 = _2215 * _2217;
            float _2229 = _2227 * _2227;
            float _2231 = _2229 + 11.33538818359375;
            float _2233 = fma(_2229, _2231, 28.84246826171875);
            float _2235 = fma(_2229, _2233, 19.6966705322265625);
            float _2237 = fma(_2229, -0.82336294651031494140625, -5.674867153167724609375);
            float _2239 = fma(_2229, _2237, -6.565555095672607421875);
            float _2241 = 1.0 / _2235;
            float _2243 = _2229 * _2239;
            float _2245 = abs(_1787);
            float _2247 = abs(_2065);
            float _2249 = _2245 + _2247;
            float _2251 = _2227 * _2243;
            bool _2253 = _2249 > as_type<float>(0x7f800000u /* inf */);
            bool _2255 = isnan(_2249);
            bool _2257 = _2253 || _2255;
            bool _2259 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _2261 = _2257 || _2259;
            float _2263 = fma(_2251, _2241, _2227);
            int _2265 = as_type<int>(_1787) & int(0x80000000);
            float _2267 = _2263;
            _2155 = _2249;
            if (_2223)
            {
                float _2269 = -_2263;
                float _2271 = _2269 + 1.57079637050628662109375;
                _2267 = _2271;
            }
            float _2273 = _2267;
            int _2275 = as_type<int>(_2273);
            if (!_2225)
            {
                float _2277 = -_2273;
                float _2279 = _2277 + 3.1415927410125732421875;
                _2275 = as_type<int>(_2279);
            }
            int _2281 = _2275;
            if (!_2261)
            {
                int _2283 = _2265 | _2281;
                _2155 = as_type<float>(_2283);
            }
        }
    }
    float _2285 = _2155;
    float _2287 = _2285 * (-0.15915493667125701904296875);
    float _2289 = -_2119;
    float _2291 = _1875 * _2289;
    float _2293 = _1905 * _2123;
    float _2295 = _1909 * _2109;
    float _2297 = _2123 * _2085;
    float _2299 = _1905 * _2109;
    float _2301 = _1909 * _2123;
    float _2303 = _2109 * _2085;
    float _2305 = _2133 * _2119;
    float _2307 = _2287 * 6.283185482025146484375;
    float _2309 = sin(_2307);
    float _2311 = -_2295;
    float _2313 = fma(_1875, _2293, _2311);
    float _2315 = fma(_2297, _2113, _2291);
    float _2317 = fma(_1875, _2299, _2301);
    float _2319 = _1909 * _2085;
    float _2321 = fma(_2313, _2113, _2305);
    float _2323 = fma(_2303, _2131, _2315);
    float _2325 = fma(_1875, _2301, _2299);
    float _2327 = _2287 * 6.283185482025146484375;
    float _2329 = cos(_2327);
    float _2331 = fma(_2317, _2131, _2321);
    float _2333 = _1611 + _2323;
    float _2335 = -_2293;
    float _2337 = fma(_1875, _2295, _2335);
    float _2339 = _1625 + _2331;
    float _2341 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _2343 = _2333 + _2341;
    float _2345 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _2347 = _2339 + _2345;
    float _2349 = _2309 * _2343;
    float _2351 = _2329 * _2343;
    float _2353 = -_2349;
    float _2355 = fma(_2329, _2347, _2353);
    float _2357 = in.m_65.x;
    float _2359 = in.m_65.y;
    float _2361 = in.m_65.z;
    float _2363 = fma(_2309, _2347, _2351);
    float _2365 = _2355 + (*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _2367 = _2363 + (*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _2369 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2371 = _2365 + _2369;
    float _2373 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2375 = _2367 + _2373;
    float _2377 = _2371 * _2371;
    float _2379 = fma(_2375, _2375, _2377);
    float _2381 = sqrt(_2379);
    float _2383 = _283 * _2359;
    float _2385 = fma(_281, _2357, _2383);
    float _2387 = _2319 * _2119;
    float _2389 = fma(_285, _2361, _2385);
    float _2391 = fma(_2325, _2113, _2387);
    bool _2393 = _2381 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2395 = _2389 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2397 = fma(_2337, _2131, _2391);
    float _2399 = _2395 + _2397;
    float _2401 = _2397;
    float _2403 = _2361;
    float _2405 = _2391;
    float _2407 = _2381;
    if (!_2393)
    {
        _2401 = _2367;
    }
    float _2409 = _2401;
    float _2411 = _2409;
    if (!_2393)
    {
        _2403 = _2365;
    }
    float _2413 = _2403;
    float _2415 = _2413;
    if (!_2393)
    {
        _2405 = _2399;
    }
    float _2417 = _2405;
    bool _2419 = !_2393;
    float _2421 = _2417;
    if (!_2419)
    {
        float _2423 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2425 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2427 = _2381 + _2425;
        float _2429 = _2399 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2431 = rsqrt(_2379);
        float _2433 = _2427 * _2423;
        float _2435 = _2433 * 0.15915493667125701904296875;
        float _2437 = _2435 * 6.283185482025146484375;
        float _2439 = cos(_2437);
        float _2441 = _2435 * 6.283185482025146484375;
        float _2443 = sin(_2441);
        float _2445 = _2439 + (-1.0);
        float _2447 = _2445 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2449 = fma(_2443, _2429, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2451 = fma(_2399, _2439, _2447);
        float _2453 = _2431 * _2449;
        float _2455 = fma(_2375, _2453, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2457 = fma(_2371, _2453, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2421 = _2451;
        _2411 = _2455;
        _2415 = _2457;
        _2407 = _2427;
    }
    float _2459 = _2421;
    float _2461 = _2411;
    float _2463 = _2415;
    float _2465 = _2407;
    float _2467 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2469 = _2459 + _2467;
    float _2471 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2473 = _2461 + _2471;
    float _2475 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2477 = _2463 + _2475;
    float _2479 = _2469 * _2469;
    float _2481 = fma(_2473, _2473, _2479);
    float _2483 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2485 = fma(_2477, _2477, _2481);
    float _2487 = precise::max(0.0, _2483);
    float _2489 = rsqrt(_2485);
    float _2491 = sqrt(_2485);
    float _2493 = _2489 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2495 = _2473 * _2493;
    float _2497 = _2477 * _2493;
    float _2499 = -_2493;
    float _2501 = -_2487;
    float _2503 = fma(_2469, _2499, _2501);
    float _2505 = _2495 * _2495;
    float _2507 = _2497 * _2497;
    float _2509 = _2505 + _2507;
    float _2511 = sqrt(_2509);
    bool _2513 = _2511 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2515 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2517 = _2511 + _2515;
    float _2519 = _2119;
    float _2521 = _2487;
    float _2523 = _2509;
    float _2525 = _2517;
    float _2527 = _2465;
    float _2529 = _2493;
    float _2531 = _2495;
    float _2533 = _2497;
    float _2535 = _2505;
    float _2537 = _2507;
    float _2539 = _2503;
    if (_2513)
    {
        float _2541 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2519 = _2541;
    }
    float _2543 = _2519;
    if (_2513)
    {
        float _2545 = _2503 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2521 = _2545;
    }
    float _2547 = _2521;
    float _2549 = _2547;
    if (_2513)
    {
        float _2551 = rsqrt(_2509);
        _2523 = _2551;
    }
    float _2553 = _2523;
    if (_2513)
    {
        float _2555 = _2517 * _2543;
        _2525 = _2555;
    }
    float _2557 = _2525;
    if (_2513)
    {
        float _2559 = _2557 * 0.15915493667125701904296875;
        _2527 = _2559;
    }
    float _2561 = _2527;
    float _2563 = _2543;
    if (_2513)
    {
        float _2565 = _2561 * 6.283185482025146484375;
        float _2567 = sin(_2565);
        _2563 = _2567;
    }
    float _2569 = _2563;
    float _2571 = _2557;
    if (_2513)
    {
        float _2573 = _2561 * 6.283185482025146484375;
        float _2575 = cos(_2573);
        _2571 = _2575;
    }
    float _2577 = _2571;
    float _2579 = _2569;
    if (_2513)
    {
        float _2581 = fma(_2569, _2547, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2579 = _2581;
    }
    float _2583 = _2579;
    float _2585 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2587 = _2583;
    if (_2513)
    {
        float _2589 = _2553 * _2583;
        _2529 = _2589;
    }
    float _2591 = _2529;
    if (_2513)
    {
        float _2593 = _2577 + (-1.0);
        _2549 = _2593;
    }
    float _2595 = _2549;
    if (_2513)
    {
        float _2597 = _2495 * _2591;
        _2531 = _2597;
    }
    float _2599 = _2531;
    if (_2513)
    {
        float _2601 = _2497 * _2591;
        _2533 = _2601;
    }
    float _2603 = _2533;
    if (_2513)
    {
        float _2605 = _2595 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2587 = _2605;
    }
    float _2607 = _2587;
    if (_2513)
    {
        float _2609 = _2599 * _2599;
        _2535 = _2609;
    }
    float _2611 = _2535;
    if (_2513)
    {
        float _2613 = _2603 * _2603;
        _2537 = _2613;
    }
    float _2615 = _2537;
    if (_2513)
    {
        float _2617 = fma(_2503, _2577, _2607);
        _2539 = _2617;
    }
    float _2619 = _2539;
    float _2621 = fma(_2619, _2619, _2611);
    float _2623 = _2459 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2625 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2627 = fma(_2491, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2625);
    float _2629 = precise::clamp(_2627, 0.0, 1.0);
    float _2631 = _2459 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2633 = _2621 + _2615;
    float _2635 = fma(_2461, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2623);
    float _2637 = -_2629;
    float _2639 = _2637 + 1.0;
    float _2641 = fma(_2461, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2631);
    float _2643 = _2459 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2645 = fma(_2463, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2635);
    float _2647 = rsqrt(_2633);
    float _2649 = _2459 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2651 = fma(_2463, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2641);
    float _2653 = _2645 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2655 = fma(_2461, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2643);
    float _2657 = fma(_2461, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2649);
    float _2659 = _2651 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2661 = _2653 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2663 = abs(_2639);
    float _2665 = log2(_2663);
    float _2667 = fma(_2463, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2657);
    float _2669 = fma(_2463, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2655);
    float _2671 = -_2661;
    float _2673 = fma(_2671, _2585, 1.0);
    float _2675 = _2659 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2677 = _2667 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2679 = _2669 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2681 = _2647 * _2619;
    float _2683 = _2647 * _2599;
    float _2685 = fma(_2677, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2675);
    float _2687 = _2647 * _2603;
    float _2689 = log2(_2673);
    float _2691 = _2683 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2693 = fma(_2653, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2685);
    float _2695 = _2665 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2697 = -_2691;
    float _2699 = fma(_2681, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2697);
    float _2701 = fma(_2679, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2693);
    float _2703 = _2659 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2705 = exp2(_2695);
    float _2707 = -_2687;
    float _2709 = fma(_2707, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2699);
    float _2711 = _2659 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2713 = fma(_2677, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2703);
    float _2715 = fma(_2709, -0.5, 0.5);
    float _2717 = fma(_2709, 0.5, 0.5);
    float _2719 = fma(_2677, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2711);
    float _2721 = 1.0 / _2701;
    float _2723 = _2681 + 1.0;
    float _2725 = fma(_2653, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2713);
    float _2727 = fma(_2653, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2719);
    float _2729 = fma(_2717, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2731 = _2689 * 0.693147182464599609375;
    float _2733 = fma(_2679, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2727);
    float _2735 = sqrt(_2715);
    float _2737 = -_2681;
    float _2739 = fma(_2705, _2723, _2737);
    float _2741 = fma(_2679, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2725);
    float _2743 = fma(_2717, _2729, -0.212114393711090087890625);
    float _2745 = _2731 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2747 = fma(_2739, 0.5, 0.5);
    float _2749 = fma(_2717, _2743, 1.570728778839111328125);
    float _2751 = _2733 * _2721;
    float _2753 = _2741 * _2721;
    float _2755 = fma(_2751, 0.5, 0.5);
    float _2757 = fma(_2753, -0.5, 0.5);
    float _2759 = _2735 * 0.636619746685028076171875;
    float3 _6997 = float3(_2755, _2757, _2745);
    float _2761 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6997, float3(0.0), isnan(_6997)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6997, float3(0.0), isnan(_6997)), level(0.0)).x;
    float _2763 = -_2749;
    float _2765 = fma(_2759, _2763, 1.0);
    float3 _7013 = float3(_2755, _2757, _2745);
    float4 _2767 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7013, float3(0.0), isnan(_7013)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7013, float3(0.0), isnan(_7013)), level(0.0)).xyzw;
    float _2769 = _2767.x;
    float _2771 = _2767.y;
    float _2773 = _2767.z;
    float _2775 = _2767.w;
    float2 _7029 = float2(_2765, _2747);
    float3 _2779 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7029, float2(0.0), isnan(_7029)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7029, float2(0.0), isnan(_7029)), level(0.0)).xyz;
    float _2781 = _2779.x;
    float _2783 = _2779.y;
    float _2785 = _2779.z;
    float _2787 = _2395 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2789 = _1465 * _1517;
    float _2791 = _1427 * 3.883221149444580078125;
    float _2793 = _2395 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2795 = fma(_1611, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2787);
    float _2797 = _1449 * 2.0;
    float _2799 = _2791 * 0.15915493667125701904296875;
    bool _2801 = _1435 != 0.0;
    bool _2803 = isnan(_1435);
    bool _2805 = _2801 || _2803;
    bool _2807 = isnan(0.0);
    bool _2809 = _2805 || _2807;
    float _2811 = fma(_1625, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2795);
    float _2813 = -_2797;
    float _2815 = fma(_2789, _2813, _2789);
    float _2817 = fma(_1611, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2793);
    float _2819 = _2799 * 6.283185482025146484375;
    float _2821 = cos(_2819);
    float _2823 = _2811 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2825 = fma(_1449, 3.1415927410125732421875, _2815);
    float _2827 = fma(_1625, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2817);
    bool _2829 = _1407 == 0.0;
    bool _2831 = !_2809;
    bool _2833 = _2829 && _2831;
    float _2835 = _2825 * 0.15915493667125701904296875;
    bool _2837 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2839 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2841 = _2837 || _2839;
    bool _2843 = isnan(0.5);
    bool _2845 = _2841 || _2843;
    float _2847 = 1.0 / _2823;
    float _2849 = _2827 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2851 = -_1251;
    float _2853 = _2851 + _1433;
    bool _2855 = _1467 == 0.0;
    bool _2857 = _2855 && _2833;
    float _2859 = _2665 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2861 = _2849 + _2823;
    float _2863 = fma(_1379, _2853, _1251);
    out.m_67.x = _725;
    out.m_67.y = _719;
    out.m_67.z = _727;
    out.m_67.w = _705;
    float _2865 = _2835 * 6.283185482025146484375;
    float _2867 = sin(_2865);
    float _2869 = _2659 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_69.x = _703;
    out.m_69.y = _711;
    out.m_69.z = _717;
    out.m_69.w = _721;
    float _2871 = _2849;
    if (!_2845)
    {
        _2871 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _2873 = _2871;
    float _2875 = fma(_2677, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2869);
    float _2877 = in.m_71.w;
    float _2879 = _2799 * 6.283185482025146484375;
    float _2881 = sin(_2879);
    float _2883 = _2861 * _2847;
    float _2885 = _2883 * 0.5;
    out.m_73.x = _1200;
    out.m_73.y = _1204;
    float _2887 = _2885;
    if (!_2845)
    {
        float _2889 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2891 = fma(_2885, _2873, _2889);
        _2887 = _2891;
    }
    float _2893 = _2887;
    if (_2845)
    {
        _731 = 1.0;
    }
    float _2895 = _731;
    out.m_75.x = _2461;
    out.m_75.y = _2459;
    out.m_75.z = _2463;
    float _2897 = -_1385;
    float _2899 = fma(_2867, _2821, _2897);
    float _2901 = exp2(_2859);
    out.m_77.x = _1611;
    float _2903 = fma(_1379, _2899, _1385);
    float _2905 = _2903;
    float _2907 = _2895;
    if (!_2845)
    {
        _1415 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2909 = _1415;
    float _2911 = _2701 * 0.5;
    out.m_77.z = _1625;
    float _2913 = -_1387;
    float _2915 = fma(_2867, _2881, _2913);
    float _2917 = _2821;
    if (!_2845)
    {
        float _2919 = 1.0 / _2893;
        _2917 = _2919;
    }
    float _2921 = _2917;
    if (!_2845)
    {
        float _2923 = -_2909;
        float _2925 = _2923 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _733 = _2925;
    }
    float _2927 = _733;
    if (!_2857)
    {
        float _2929 = fma(_1407, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2903);
        _2905 = _2929;
    }
    float _2931 = _2905;
    float _2933 = fma(_1379, _2915, _1387);
    out.m_79.w = _2877;
    float _2935 = _2933;
    float _2937 = _2863;
    if (!_2857)
    {
        float _2939 = fma(_1467, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2933);
        _2935 = _2939;
    }
    float _2941 = _2935;
    float _2943 = _703;
    if (!_2845)
    {
        float _2945 = 1.0 / _2927;
        _2943 = _2945;
    }
    float _2947 = _2943;
    if (!_2857)
    {
        float _2949 = fma(_1435, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2863);
        _2937 = _2949;
    }
    float _2951 = _2937;
    float _2953 = -_2901;
    float _2955 = _2953 + 1.0;
    float _2957 = -_2951;
    float _2959 = _1875 * _2957;
    float _2961 = _2319 * _2951;
    float _2963 = _2133 * _2951;
    float _2965 = _2921;
    if (!_2845)
    {
        float _2967 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2969 = -_2909;
        float _2971 = fma(_2921, _2967, _2969);
        _2965 = _2971;
    }
    float _2973 = _2965;
    float _2975 = fma(_2297, _2931, _2959);
    float _2977 = _2955 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2979 = fma(_2313, _2931, _2963);
    float _2981 = fma(_2325, _2931, _2961);
    float _2983 = fma(_2303, _2941, _2975);
    float _2985 = fma(_2653, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2875);
    float _2987 = fma(_2317, _2941, _2979);
    if (!_2845)
    {
        float _2989 = _2973 * _2947;
        float _2991 = precise::clamp(_2989, 0.0, 1.0);
        _2907 = _2991;
    }
    float _2993 = _2907;
    float _2995 = _2983 * _2309;
    float _2997 = _2983 * _2329;
    float _2999 = fma(_2337, _2941, _2981);
    float _3001 = fma(_2679, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2985);
    float _3003 = -_2995;
    float _3005 = fma(_2987, _2329, _3003);
    float _3007 = fma(_2987, _2309, _2997);
    bool _3009 = _2993 > 0.0;
    bool _3011 = isnan(_2993);
    bool _3013 = _3009 || _3011;
    bool _3015 = isnan(0.0);
    bool _3017 = _3013 || _3015;
    float _3019 = _2993 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3021 = _3001 + _2701;
    float _3023 = _2733 + _2701;
    out.m_81.x = _3007;
    out.m_81.y = _2999;
    out.m_81.z = _3005;
    float _3025 = fma(_2741, -0.5, _2911);
    float _3027 = _3021 * 0.5;
    float _3029 = _3023 * 0.5;
    out.gl_Position.x = _2733;
    out.gl_Position.y = _2741;
    out.gl_Position.z = _3001;
    out.gl_Position.w = _2701;
    out.m_83.x = _3029;
    out.m_83.y = _3025;
    out.m_83.z = _3027;
    out.m_83.w = _2701;
    float _3031 = -_2977;
    float _3033 = _3031 + 1.0;
    float _3035 = _3019 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_47.x = _3035;
    float _3037 = _2977 * _2761;
    float _3039 = _2775 * _3037;
    float _3041 = _2775 * _3033;
    float _3043 = _2785 * _3037;
    float _3045 = fma(_2781, _3039, _2769);
    float _3047 = fma(_2783, _3039, _2771);
    float _3049 = fma(_2775, _3043, _2773);
    out.m_85.x = _3045;
    out.m_85.y = _3047;
    out.m_85.z = _3049;
    out.m_85.w = _3041;
    if (_3017)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _3051 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3051;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1493 = false;
    bool _1303 = false;
    bool _753 = false;
    bool _523 = false;
    bool _307 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _105 = in.m_44.w;
    float _107 = trunc(_105);
    int _109 = int(_107);
    bool _113 = _109 >= 1;
    float _115 = 0.0;
    float _117 = as_type<float>(_109);
    if (!_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _119 = _115;
    if (!_113)
    {
        out.m_47.x = 0.0;
    }
    int _121 = 0;
    if (!_113)
    {
        float _123 = _119 * 5.0;
        _121 = as_type<int>(_123);
    }
    int _125 = _121;
    int _127 = _125;
    if (!_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3109 = as_type<float>(_125);
        out.gl_Position.z = _3109;
    }
    if (!_113)
    {
        return out;
    }
    float _129 = in.m_49.w;
    float _131 = float(_109);
    float _133 = -_129;
    float _135 = _133 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = _129 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _139 = isnan(_129);
    bool _141 = _137 || _139;
    bool _143 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _145 = _141 || _143;
    bool _147 = _135 >= _131;
    bool _149 = !_145;
    bool _151 = _147 || _149;
    float _153 = _135;
    if (_151)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _155 = _117;
    if (_151)
    {
        out.m_47.x = 0.0;
    }
    if (_151)
    {
        float _157 = _155 * 5.0;
        _127 = as_type<int>(_157);
    }
    int _159 = _127;
    if (_151)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3173 = as_type<float>(_159);
        out.gl_Position.z = _3173;
    }
    if (_151)
    {
        return out;
    }
    float _161 = in.m_51.w;
    float _163 = 1.0 / _131;
    float _165 = _135 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _167 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _169 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _171 = _167 || _169;
    bool _173 = isnan(1.0);
    bool _175 = _171 || _173;
    float _177 = in.m_49.x;
    float _179 = in.m_49.y;
    float _181 = in.m_49.z;
    float _183 = in.m_44.x;
    float _185 = in.m_44.y;
    float _187 = in.m_44.z;
    float _189 = 0.0;
    float _191 = _165;
    if (!_175)
    {
        float _193 = _165 * _165;
        float _195 = _193 * 0.5;
        _189 = _195;
    }
    float _197 = _189;
    float _199 = _197;
    if (!_175)
    {
        float _201 = _197 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _199 = _201;
    }
    float _203 = _199;
    bool _205 = !_175;
    float _207 = _203;
    if (!_205)
    {
        float _209 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _211 = log2(_209);
        float _213 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _215 = _213 + 1.0;
        float _217 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _219 = _165 * _211;
        float _221 = 1.0 / _215;
        float _223 = _217 * 0.693147182464599609375;
        float _225 = exp2(_219);
        float _227 = 1.0 / _223;
        float _229 = _225 + (-1.0);
        float _231 = -_229;
        float _233 = fma(_231, _227, _165);
        float _235 = _233 * _221;
        float _237 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _207 = _237;
    }
    float _239 = _207;
    bool _241 = !_175;
    if (!_241)
    {
        float _243 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _245 = log2(_243);
        float _247 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _249 = _247 + 1.0;
        float _251 = 1.0 / _249;
        float _253 = _165 * _245;
        float _255 = exp2(_253);
        float _257 = -_255;
        float _259 = _257 + 1.0;
        float _261 = _259 * _251;
        _191 = _261;
    }
    float _263 = _191;
    bool _265 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _267 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _269 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _271 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _273 = fma(_263, _177, _267);
    float _275 = fma(_263, _179, _269);
    float _277 = fma(_263, _181, _271);
    float _279 = _135 * _163;
    float _281 = fma(_273, _161, _183);
    float _283 = fma(_275, _161, _185);
    float _285 = fma(_277, _161, _187);
    bool _287 = !_265;
    float _305;
    if (!_287)
    {
        float _289 = in.m_53.x;
        float _291 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _293 = _289 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _295 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[11].x, _135);
        float _297 = _295 * _291;
        float _299 = floor(_297);
        float _301 = -_299;
        float _303 = _297 + _301;
        _305 = _303;
        _307 = true;
    }
    else
    {
        _305 = _279;
    }
    _307 = false;
    float _309 = _305;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _313 = _309 + _311;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _317 = _309 + _315;
    bool _319 = _309 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _321 = isnan(_309);
    bool _323 = _319 || _321;
    bool _325 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _327 = _323 || _325;
    float _329 = float(_327);
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _333 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _331;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _337 = _309 + _335;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _341 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _339;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _345 = _343 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _347 = 1.0 / _333;
    bool _349 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _351 = 1.0 / _345;
    float _353 = 1.0 / _341;
    float _355 = _313 * _347;
    bool _357 = _309 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _359 = isnan(_309);
    bool _361 = _357 || _359;
    bool _363 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _365 = _361 || _363;
    float _367 = float(_365);
    float _369 = -_329;
    float _371 = _369 + 1.0;
    float _373 = _367 * _371;
    float _375 = _317 * _351;
    bool _377 = _309 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _379 = isnan(_309);
    bool _381 = _377 || _379;
    bool _383 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _385 = _381 || _383;
    float _387 = float(_385);
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _391 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _389;
    bool _393 = _309 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _395 = isnan(_309);
    bool _397 = _393 || _395;
    bool _399 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _401 = _397 || _399;
    float _403 = float(_401);
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _407 = _405 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _409 = -_367;
    float _411 = _409 + 1.0;
    float _413 = -_387;
    float _415 = _413 + 1.0;
    float _417 = _337 * _353;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _421 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _419;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _425 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _423;
    float _427 = _403 * _415;
    float _429 = fma(_391, _417, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _431 = fma(_421, _417, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _433 = fma(_425, _417, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _435 = _387 * _411;
    float _437 = _429 * _427;
    float _439 = _431 * _427;
    float _441 = _433 * _427;
    float _443 = -_403;
    float _445 = _443 + 1.0;
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _449 = _447 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _453 = _451 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _455 = fma(_445, (*spvDescriptorSet0.vp_c9)._m0[107].x, _441);
    float _457 = fma(_445, (*spvDescriptorSet0.vp_c9)._m0[107].y, _439);
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _461 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _459;
    float _463 = fma(_453, _375, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _465 = fma(_445, (*spvDescriptorSet0.vp_c9)._m0[107].z, _437);
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _469 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _467;
    float _471 = fma(_407, _375, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _473 = fma(_449, _375, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _477 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _475;
    float _479 = fma(_469, _355, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _481 = fma(_463, _435, _457);
    float _483 = fma(_471, _435, _455);
    float _485 = fma(_461, _355, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _487 = fma(_477, _355, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _489 = fma(_473, _435, _465);
    float _491 = fma(_479, _373, _481);
    float _493 = fma(_485, _373, _483);
    float _495 = fma(_487, _373, _489);
    float _497 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[110].y, _491);
    float _499 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[110].x, _493);
    float _501 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[110].z, _495);
    bool _503 = !_349;
    float _521;
    if (!_503)
    {
        float _505 = in.m_53.x;
        float _507 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _509 = _505 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _511 = fma(_509, (*spvDescriptorSet0.vp_c9)._m0[11].y, _135);
        float _513 = _511 * _507;
        float _515 = floor(_513);
        float _517 = -_515;
        float _519 = _513 + _517;
        _521 = _519;
        _523 = true;
    }
    else
    {
        _521 = _279;
    }
    _523 = false;
    float _525 = _521;
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _529 = _525 + _527;
    float _531 = _499 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _533 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _535 = _533 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _537 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _539 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _537;
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _543 = _541 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _545 = _525 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _547 = isnan(_525);
    bool _549 = _545 || _547;
    bool _551 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _553 = _549 || _551;
    float _555 = float(_553);
    float _557 = 1.0 / _535;
    float _559 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _561 = _559 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _563 = _525 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _565 = isnan(_525);
    bool _567 = _563 || _565;
    bool _569 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _571 = _567 || _569;
    float _573 = float(_571);
    float _575 = _497 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _577 = _501 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _579 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _581 = 1.0 / _543;
    float _583 = _539 * _557;
    bool _585 = _525 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _587 = isnan(_525);
    bool _589 = _585 || _587;
    bool _591 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _593 = _589 || _591;
    float _595 = float(_593);
    float _597 = 1.0 / _561;
    float _599 = -_555;
    float _601 = _599 + 1.0;
    float _603 = fma(_583, _529, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _605 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _607 = _605 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _609 = -_595;
    float _611 = _609 + 1.0;
    bool _613 = _525 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _615 = isnan(_525);
    bool _617 = _613 || _615;
    bool _619 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _621 = _617 || _619;
    float _623 = float(_621);
    float _625 = _595 * _601;
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _629 = _627 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _631 = 1.0 / _607;
    float _633 = _573 * _611;
    float _635 = -_623;
    float _637 = _635 + 1.0;
    float _639 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _641 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _639;
    float _643 = _629 * _581;
    float _645 = _603 * _633;
    float _647 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _649 = _525 + _647;
    float _651 = -_573;
    float _653 = _651 + 1.0;
    float _655 = _555 * _637;
    float _657 = _641 * _597;
    bool _659 = _525 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _661 = isnan(_525);
    bool _663 = _659 || _661;
    bool _665 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _667 = _663 || _665;
    float _669 = float(_667);
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _673 = _671 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _677 = _525 + _675;
    float _679 = fma(_643, _649, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _681 = fma(_653, (*spvDescriptorSet0.vp_c9)._m0[115].x, _645);
    float _683 = -_669;
    float _685 = _683 + 1.0;
    float _687 = _673 * _631;
    float _689 = fma(_657, _677, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _693 = _525 + _691;
    float _695 = fma(_679, _625, _681);
    float _697 = _623 * _685;
    float _699 = fma(_687, _693, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _701 = fma(_689, _655, _695);
    float _703 = _531 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _705 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _707 = fma(_699, _697, _701);
    float _709 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _711 = _575 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _713 = fma(_669, (*spvDescriptorSet0.vp_c9)._m0[119].x, _707);
    float _715 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _717 = _577 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _719 = _709 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _721 = _713 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _723 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _725 = _715 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _727 = _723 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _729 = !_579;
    float _731 = _705;
    float _733 = _727;
    float _751;
    if (!_729)
    {
        float _735 = in.m_53.x;
        float _737 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _739 = _735 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _741 = fma(_739, (*spvDescriptorSet0.vp_c9)._m0[14].x, _135);
        float _743 = _741 * _737;
        float _745 = floor(_743);
        float _747 = -_745;
        float _749 = _743 + _747;
        _751 = _749;
        _753 = true;
    }
    else
    {
        _751 = _279;
    }
    _753 = false;
    float _755 = _751;
    int _757 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _759 = _757;
    int _761 = 0;
    int _763 = _100(_759, _761, (*spvDescriptorSet0.support_buffer));
    float _765 = in.m_55.z;
    float _767 = 0.0 + _279;
    float _769 = precise::clamp(_767, 0.0, 1.0);
    float _771 = trunc(_765);
    int _773 = int(_771);
    int _775 = _763 + (-1);
    float _777 = float(_775);
    float _779 = _769 * _777;
    float _781 = trunc(_779);
    int _783 = int(_781);
    int _785 = _783;
    int _787 = 0;
    int _789 = _101(_785, _787, (*spvDescriptorSet0.support_buffer));
    int _791 = _773;
    int _793 = 0;
    int _795 = _101(_791, _793, (*spvDescriptorSet0.support_buffer));
    float4 _798 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_789, _795)), 0).xyzw;
    float _800 = _798.x;
    float _802 = _798.y;
    float _804 = _798.z;
    float _806 = _798.w;
    float _808 = in.m_53.x;
    float _810 = in.m_53.y;
    float _812 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _814 = _812 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _816 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _818 = _816 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _820 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _822 = 1.0 / _814;
    float _824 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _826 = _824 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    int _828 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _830 = _828 != 0;
    int _832 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _834 = _832 != 0;
    float _836 = 1.0 / _818;
    float _838 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _840 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _838;
    float _842 = _808 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _844 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _846 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _848 = _846 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _850 = 1.0 / _826;
    float _852 = -_820;
    float _854 = fma(_842, 2.0, _852);
    float _856 = fma(_808, (*spvDescriptorSet0.vp_c9)._m0[78].z, _844);
    float _858 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _860 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _858;
    float _862 = _840 * _822;
    float _864 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _866 = _810 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _868 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _870 = _868 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _872 = _848 * _836;
    bool _874 = _755 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _876 = isnan(_755);
    bool _878 = _874 || _876;
    bool _880 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _882 = _878 || _880;
    float _884 = float(_882);
    float _886 = fma(_866, -2.0, _864);
    float _888 = 1.0 / _870;
    bool _890 = _755 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _892 = isnan(_755);
    bool _894 = _890 || _892;
    bool _896 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _898 = _894 || _896;
    float _900 = float(_898);
    float _902 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _904 = _902 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _906 = _860 * _850;
    float _908 = -_884;
    float _910 = _908 + 1.0;
    float _912 = -_900;
    float _914 = _912 + 1.0;
    bool _916 = _755 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _918 = isnan(_755);
    bool _920 = _916 || _918;
    bool _922 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _924 = _920 || _922;
    float _926 = float(_924);
    float _928 = 0.0;
    if (_830)
    {
        float _930 = in.m_53.x;
        _928 = _930;
    }
    float _932 = _928;
    float _934 = _884 * _914;
    bool _936 = _755 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _938 = isnan(_755);
    bool _940 = _936 || _938;
    bool _942 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _944 = _940 || _942;
    float _946 = float(_944);
    float _948 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _950 = _948 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _952 = _755 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _954 = isnan(_755);
    bool _956 = _952 || _954;
    bool _958 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _960 = _956 || _958;
    float _962 = float(_960);
    float _964 = _926 * _910;
    float _966 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _968 = _966 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _970 = _904 * _888;
    float _972 = -_946;
    float _974 = _972 + 1.0;
    bool _976 = _755 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _978 = isnan(_755);
    bool _980 = _976 || _978;
    bool _982 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _984 = _980 || _982;
    float _986 = float(_984);
    float _988 = -_962;
    float _990 = _988 + 1.0;
    float _992 = 1.0 / _950;
    float _994 = -_926;
    float _996 = _994 + 1.0;
    float _998 = _986 * _990;
    float _1000 = -_986;
    float _1002 = _1000 + 1.0;
    float _1004 = _946 * _996;
    float _1006 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1008 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1006;
    float _1010 = 1.0 / _968;
    float _1012 = _962 * _974;
    float _1014 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1016 = _755 + _1014;
    bool _1018 = _755 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1020 = isnan(_755);
    bool _1022 = _1018 || _1020;
    bool _1024 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1026 = _1022 || _1024;
    float _1028 = float(_1026);
    float _1030 = -_135;
    float _1032 = fma(_1030, (*spvDescriptorSet0.vp_c9)._m0[76].x, _854);
    bool _1034 = _932 > 0.5;
    bool _1036 = _1034 && _830;
    float _1038 = fma(_862, _1016, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _1040 = _810 > 0.5;
    bool _1042 = _1040 && _834;
    float _1044 = _1028 * _1002;
    float _1046 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1048 = _1046 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1050 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1052 = _1050 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1054 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1056 = _755 + _1054;
    float _1058 = _1038 * _1044;
    float _1060 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1062 = _755 + _1060;
    float _1064 = in.m_55.x;
    float _1066 = fma(_872, _1056, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1068 = _1008 * _992;
    float _1070 = fma(_906, _1062, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1072 = -_1028;
    float _1074 = _1072 + 1.0;
    float _1076 = in.m_55.y;
    float _1078 = 1.0 / _1052;
    float _1080 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1082 = _755 + _1080;
    float _1084 = fma(_1074, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1058);
    float _1086 = _1048 * _1010;
    float _1088 = fma(_970, _1082, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1090 = fma(_1066, _998, _1084);
    float _1092 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1094 = _755 + _1092;
    float _1096 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1098 = _755 + _1096;
    float _1100 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1102 = fma(_1070, _1012, _1090);
    float _1104 = fma(_1068, _1094, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1106 = fma(_1086, _1098, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1108 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1110 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1108;
    float _1112 = fma(_1088, _1004, _1102);
    bool _1114 = _755 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1116 = isnan(_755);
    bool _1118 = _1114 || _1116;
    bool _1120 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1122 = _1118 || _1120;
    float _1124 = float(_1122);
    float _1126 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1128 = _755 + _1126;
    float _1130 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1132 = _1098;
    float _1134 = _1064;
    if (_830)
    {
        _1132 = _1064;
    }
    float _1136 = _1132;
    float _1138 = fma(_1104, _964, _1112);
    float _1140 = _1110 * _1078;
    float _1142 = -_1124;
    float _1144 = _1142 + 1.0;
    float _1146 = _1076;
    float _1148 = _1136;
    if (_1042)
    {
        float _1150 = -_1076;
        float _1152 = _1150 + 1.0;
        _1146 = _1152;
    }
    float _1154 = _1146;
    if (_1036)
    {
        float _1156 = -_1136;
        float _1158 = _1156 + 1.0;
        _1148 = _1158;
    }
    float _1160 = _1148;
    float _1162 = fma(_1140, _1128, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1164 = fma(_1106, _934, _1138);
    float _1166 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1168 = _900 * _1144;
    if (_830)
    {
        _1134 = _1160;
    }
    float _1170 = _1134;
    float _1172 = _1100 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1174 = fma(_810, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1166);
    float _1176 = fma(_1162, _1168, _1164);
    float _1178 = _1130 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1180 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[77].z, _856);
    float _1182 = fma(_1172, _1154, -0.5);
    float _1184 = fma(_1124, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1176);
    float _1186 = fma(_1178, _1170, -0.5);
    float _1188 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1174);
    float _1190 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[76].y, _886);
    float _1192 = fma(_1180, _1186, _1032);
    int _1194 = _783 + 1;
    float _1196 = -_1190;
    float _1198 = fma(_1188, _1182, _1196);
    out.m_57.x = _1184;
    float _1200 = _1192 + 0.5;
    int _1202 = min(_775, _1194);
    float _1204 = _1198 + 0.5;
    float _1206 = in.m_51.x;
    float _1208 = in.m_51.y;
    float _1210 = in.m_51.z;
    float _1212 = _1210 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _1214 = _1208 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1216 = _1206 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    uint _1219 = as_type<uint>(half2(float2(_806, 0.0)));
    uint _1221 = extract_bits(_1219, 0u, 8u);
    int _1223 = int(_1221) & 255;
    uint _1225 = extract_bits(_1219, 8u, 8u);
    int _1227 = int(_1225) & 255;
    int _1229 = _1227 << 8;
    int _1231 = _1223 | _1229;
    bool _1233 = _1231 >= 32768;
    int _1235 = _1231 + (-1024);
    int _1237 = _1235;
    if (_1233)
    {
        int _1239 = ~_1231;
        int _1241 = _1239 + 33792;
        int _1243 = _1241 + 1;
        _1237 = _1243;
    }
    int _1245 = _1237;
    int _1247 = _1245 + 30719;
    float _1249 = float(_1247);
    float _1251 = fma(_1249, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1253 = abs(_1251);
    float _1255 = -_1253;
    float _1257 = _1255 + 1.0;
    bool _1259 = _1251 < 0.0;
    float _1261 = float(_1259);
    float _1263 = abs(_1251);
    float _1265 = fma(_1263, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _1267 = as_type<int>(_1257) + (-218103808);
    float _1269 = abs(_1251);
    float _1271 = fma(_1269, _1265, -0.212114393711090087890625);
    bool _1273 = uint(_1267) >= 1920991232u;
    float _1275 = abs(_1251);
    float _1277 = fma(_1275, _1271, 1.570728778839111328125);
    bool _1279 = !_1273;
    float _1301;
    if (!_1279)
    {
        int _1281 = as_type<int>(_1257);
        int _1283 = as_type<int>(_1206);
        int _1285 = as_type<int>(_1208);
        int _1287 = 6256;
        int _1289;
        int _1291;
        int _1293;
        int _1295;
        int _1297;
        int _1299;
        _98(_1281, _1283, _1285, _1287, _1289, _1291, _1293, _1295, _1297, _1299, out.gl_Position, out.gl_PointSize);
        _1301 = as_type<float>(_1293);
        _1303 = true;
    }
    else
    {
        float _1305 = rsqrt(_1257);
        float _1307 = _1257 * _1305;
        float _1309 = _1305 * 0.5;
        float _1311 = -_1307;
        float _1313 = 0.0 + _1311;
        float _1315 = fma(_1309, _1313, 0.5);
        float _1317 = fma(_1307, _1315, _1307);
        float _1319 = -_1317;
        float _1321 = 0.0 + _1319;
        float _1323 = fma(_1317, _1321, _1257);
        float _1325 = fma(_1309, _1323, _1317);
        _1301 = _1325;
    }
    _1303 = false;
    float _1327 = _1301;
    int _1329 = _1202;
    int _1331 = 0;
    int _1333 = _101(_1329, _1331, (*spvDescriptorSet0.support_buffer));
    int _1335 = _773;
    int _1337 = 0;
    int _1339 = _101(_1335, _1337, (*spvDescriptorSet0.support_buffer));
    float4 _1341 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1333, _1339)), 0).xyzw;
    float _1343 = _1341.x;
    float _1345 = _1341.y;
    float _1347 = _1341.z;
    float _1349 = _1341.w;
    float _1351 = _1277 * _1327;
    float _1353 = _1261 * 2.0;
    float _1355 = _1249 * 3.883221149444580078125;
    float _1357 = floor(_779);
    float _1359 = -_1353;
    float _1361 = fma(_1351, _1359, _1351);
    float _1363 = _1355 * 0.15915493667125701904296875;
    float _1365 = fma(_1261, 3.1415927410125732421875, _1361);
    float _1367 = _1363 * 6.283185482025146484375;
    float _1369 = cos(_1367);
    float _1371 = _1365 * 0.15915493667125701904296875;
    float _1373 = _1371 * 6.283185482025146484375;
    float _1375 = sin(_1373);
    float _1377 = -_1357;
    float _1379 = _779 + _1377;
    float _1381 = _1363 * 6.283185482025146484375;
    float _1383 = sin(_1381);
    float _1385 = _1375 * _1369;
    float _1387 = _1375 * _1383;
    uint _1389 = as_type<uint>(half2(float2(_1349, 0.0)));
    float _1391 = -_800;
    float _1393 = _1391 + _1343;
    uint _1395 = extract_bits(_1389, 0u, 8u);
    int _1397 = int(_1395) & 255;
    uint _1399 = extract_bits(_1389, 8u, 8u);
    int _1401 = int(_1399) & 255;
    int _1403 = _1401 << 8;
    int _1405 = _1397 | _1403;
    float _1407 = fma(_1379, _1393, _800);
    bool _1409 = _1405 >= 32768;
    int _1411 = _1405 + (-1024);
    int _1413 = _1411;
    float _1415 = _1385;
    if (_1409)
    {
        int _1417 = ~_1405;
        int _1419 = _1417 + 33792;
        int _1421 = _1419 + 1;
        _1413 = _1421;
    }
    int _1423 = _1413;
    int _1425 = _1423 + 30719;
    float _1427 = float(_1425);
    float _1429 = -_802;
    float _1431 = _1429 + _1345;
    float _1433 = fma(_1427, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1435 = fma(_1379, _1431, _802);
    float _1437 = abs(_1433);
    float _1439 = -_1437;
    float _1441 = _1439 + 1.0;
    float _1443 = abs(_1433);
    float _1445 = fma(_1443, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _1447 = _1433 < 0.0;
    float _1449 = float(_1447);
    int _1451 = as_type<int>(_1441) + (-218103808);
    float _1453 = abs(_1433);
    float _1455 = fma(_1453, _1445, -0.212114393711090087890625);
    bool _1457 = uint(_1451) >= 1920991232u;
    float _1459 = -_804;
    float _1461 = _1459 + _1347;
    float _1463 = abs(_1433);
    float _1465 = fma(_1463, _1455, 1.570728778839111328125);
    float _1467 = fma(_1379, _1461, _804);
    bool _1469 = !_1457;
    float _1491;
    if (!_1469)
    {
        int _1471 = as_type<int>(_1441);
        int _1473 = as_type<int>(_1393);
        int _1475 = as_type<int>(_1345);
        int _1477 = 7168;
        int _1479;
        int _1481;
        int _1483;
        int _1485;
        int _1487;
        int _1489;
        _98(_1471, _1473, _1475, _1477, _1479, _1481, _1483, _1485, _1487, _1489, out.gl_Position, out.gl_PointSize);
        _1491 = as_type<float>(_1483);
        _1493 = true;
    }
    else
    {
        float _1495 = rsqrt(_1441);
        float _1497 = _1441 * _1495;
        float _1499 = _1495 * 0.5;
        float _1501 = -_1497;
        float _1503 = 0.0 + _1501;
        float _1505 = fma(_1499, _1503, 0.5);
        float _1507 = fma(_1497, _1505, _1497);
        float _1509 = -_1507;
        float _1511 = 0.0 + _1509;
        float _1513 = fma(_1507, _1511, _1441);
        float _1515 = fma(_1499, _1513, _1507);
        _1491 = _1515;
    }
    _1493 = false;
    float _1517 = _1491;
    float _1519 = in.m_53.x;
    float _1521 = in.m_53.y;
    float _1523 = in.m_53.z;
    float _1525 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1527 = log2(_1525);
    float _1529 = in.m_59.x;
    float _1531 = in.m_59.y;
    float _1533 = in.m_59.z;
    float _1535 = in.m_61.x;
    float _1537 = in.m_61.y;
    float _1539 = in.m_61.z;
    float _1541 = _1527 * _135;
    float _1543 = exp2(_1541);
    float _1545 = _1523 * 2.0;
    float _1547 = _1519 * 2.0;
    float _1549 = _283 * _1531;
    float _1551 = floor(_1545);
    float _1553 = fma(_281, _1529, _1549);
    float _1555 = _1521 * 2.0;
    float _1557 = _283 * _1537;
    float _1559 = fma(_281, _1535, _1557);
    float _1561 = floor(_1547);
    int _1563 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1565 = _1563 != 0;
    int _1567 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1569 = _1567 != 0;
    int _1571 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1573 = _1571 != 0;
    float _1575 = _1523 + _1519;
    float _1577 = _1521 + _1519;
    float _1579 = fma(_285, _1539, _1559);
    float _1581 = -_1543;
    float _1583 = _1581 + 1.0;
    float _1585 = _1575 + (-1.0);
    float _1587 = _1577 + (-1.0);
    float _1589 = floor(_1555);
    bool _1591 = _1551 > 0.0;
    float _1593 = fma(_1585, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _1595 = _1551 >= 0.0;
    bool _1597 = isnan(_1551);
    bool _1599 = _1595 || _1597;
    bool _1601 = isnan(0.0);
    bool _1603 = _1599 || _1601;
    float _1605 = fma(_285, _1533, _1553);
    float _1607 = fma(_1587, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1609 = _1603 ? 0 : 1;
    float _1611 = _1579 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _1613 = _1561 > 0.0;
    float _1615 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1617 = 1.0 + _1615;
    int _1619 = ~_1609;
    int _1621 = _1619 + 1;
    int _1623 = _1621 + 1;
    float _1625 = _1605 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1627 = _1561 >= 0.0;
    bool _1629 = isnan(_1561);
    bool _1631 = _1627 || _1629;
    bool _1633 = isnan(0.0);
    bool _1635 = _1631 || _1633;
    float _1637 = 1.0 / _1617;
    int _1639 = _1623;
    if (!_1591)
    {
        int _1641 = ~_1609;
        int _1643 = _1641 + 1;
        _1639 = _1643;
    }
    int _1645 = _1639;
    float _1647 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1649 = _1611 + _1647;
    float _1651 = in.m_63.x;
    float _1653 = in.m_63.y;
    float _1655 = in.m_63.z;
    float _1657 = _1519 + (-0.5);
    bool _1659 = _1589 > 0.0;
    float _1661 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1663 = (*spvDescriptorSet0.vp_c8)._m0[29].x + _1661;
    bool _1665 = _1589 >= 0.0;
    bool _1667 = isnan(_1589);
    bool _1669 = _1665 || _1667;
    bool _1671 = isnan(0.0);
    bool _1673 = _1669 || _1671;
    float _1675 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1677 = (*spvDescriptorSet0.vp_c8)._m0[29].z + _1675;
    bool _1679 = !_1565;
    int _1681 = _1679 ? 0 : 1;
    bool _1683 = !_1573;
    int _1685 = _1683 ? 0 : 1;
    bool _1687 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1689 = isnan(1.0);
    bool _1691 = _1687 || _1689;
    bool _1693 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1695 = _1691 || _1693;
    int _1697 = abs(_1681);
    float _1699 = -_1625;
    float _1701 = _1699 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    bool _1703 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1705 = isnan(0.0);
    bool _1707 = _1703 || _1705;
    bool _1709 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1711 = _1707 || _1709;
    float _1713 = abs(_1663);
    float _1715 = abs(_1677);
    float _1717 = precise::max(_1713, _1715);
    float _1719 = float(_1697);
    float _1721 = float(_1645);
    float _1723 = _1711 ? _1583 : 0.0;
    int _1725 = _1673 ? 0 : 1;
    float _1727 = _1719 * _1721;
    bool _1729 = _1717 >= 16.0;
    float _1731 = _1663;
    float _1733 = _1649;
    float _1735 = _1701;
    float _1737 = _1677;
    if (_1695)
    {
        float _1739 = _1723 * _1637;
        _153 = _1739;
    }
    float _1741 = _153;
    float _1743 = abs(_1649);
    float _1745 = abs(_1701);
    float _1747 = precise::max(_1743, _1745);
    float _1749 = _1727 * (-2.0);
    int _1751 = ~_1725;
    int _1753 = _1751 + 1;
    int _1755 = _1753 + 1;
    bool _1757 = !_1569;
    int _1759 = _1757 ? 0 : 1;
    int _1761 = _1755;
    if (!_1659)
    {
        int _1763 = ~_1725;
        int _1765 = _1763 + 1;
        _1761 = _1765;
    }
    int _1767 = _1761;
    float _1769 = fma(_1749, _1651, _1651);
    int _1771 = abs(_1685);
    float _1773 = fma(_1607, _1749, _1607);
    bool _1775 = _1747 >= 16.0;
    float _1777 = fma(_1657, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1769);
    int _1779 = abs(_1759);
    bool _1781 = _1775;
    int _1783 = as_type<int>(_1653);
    if (_1729)
    {
        float _1785 = _1663 * 0.0625;
        _1731 = _1785;
    }
    float _1787 = _1731;
    float _1789 = float(_1771);
    float _1791 = float(_1767);
    int _1793 = _1635 ? 0 : 1;
    float _1795 = _1789 * _1791;
    float _1797 = fma(_1773, _1741, _1777);
    if (_1775)
    {
        float _1799 = _1649 * 0.0625;
        _1733 = _1799;
    }
    float _1801 = _1733;
    float _1803 = _1523 + (-0.5);
    float _1805 = _1795 * (-2.0);
    int _1807 = ~_1793;
    int _1809 = _1807 + 1;
    int _1811 = _1809 + 1;
    int _1813 = _1811;
    if (_1775)
    {
        float _1815 = _1701 * 0.0625;
        _1735 = _1815;
    }
    float _1817 = _1735;
    if (!_1613)
    {
        int _1819 = ~_1793;
        int _1821 = _1819 + 1;
        _1813 = _1821;
    }
    int _1823 = _1813;
    float _1825 = fma(_1805, _1655, _1655);
    float _1827 = abs(_1801);
    bool _1829 = _1827 != 0.0;
    bool _1831 = isnan(_1827);
    bool _1833 = _1829 || _1831;
    bool _1835 = isnan(0.0);
    bool _1837 = _1833 || _1835;
    float _1839 = fma(_1593, _1805, _1593);
    float _1841 = float(_1779);
    float _1843 = fma(_1803, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1825);
    float _1845 = float(_1823);
    float _1847 = _1523 + _1521;
    float _1849 = abs(_1817);
    bool _1851 = _1849 == 0.0;
    bool _1853 = !_1837;
    bool _1855 = _1851 && _1853;
    float _1857 = fma(_1839, _1741, _1843);
    float _1859 = abs(_1817);
    bool _1861 = _1859 == 0.0;
    float _1863 = _1841 * _1845;
    float _1865 = _1847 + (-1.0);
    float _1867 = _1857 * 0.15915493667125701904296875;
    float _1869 = _1863 * (-2.0);
    float _1871 = _1521 + (-0.5);
    float _1873 = _1867 * 6.283185482025146484375;
    float _1875 = sin(_1873);
    float _1877 = _1797 * 0.15915493667125701904296875;
    float _1879 = fma(_1865, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1881 = fma(_1869, _1653, _1653);
    bool _1883 = _1837;
    float _1885 = _1867;
    if (_1855)
    {
        bool _1887 = as_type<int>(_1817) >= 0;
        _1781 = _1887;
    }
    bool _1889 = _1781;
    float _1891 = fma(_1879, _1869, _1879);
    float _1893 = fma(_1871, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1881);
    int _1895 = as_type<int>(_1893);
    int _1897 = _1889 ? (-1) : 0;
    if (_1855)
    {
        int _1899 = _1889 ? 0 : 1078530011;
        _1783 = _1899;
    }
    int _1901 = _1783;
    float _1903 = _1877 * 6.283185482025146484375;
    float _1905 = sin(_1903);
    float _1907 = _1877 * 6.283185482025146484375;
    float _1909 = cos(_1907);
    float _1911 = fma(_1891, _1741, _1893);
    if (_1855)
    {
        int _1913 = int(0x80000000) & as_type<int>(_1801);
        int _1915 = _1901 | _1913;
        _1895 = _1915;
    }
    int _1917 = _1895;
    bool _1919 = !_1837;
    bool _1921 = _1919 && _1861;
    int _1923 = _1917;
    float _1925 = as_type<float>(_1917);
    if (!_1921)
    {
        float _1927 = abs(_1801);
        bool _1929 = _1927 != as_type<float>(0x7f800000u /* inf */);
        bool _1931 = isnan(_1927);
        bool _1933 = _1929 || _1931;
        bool _1935 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1937 = _1933 || _1935;
        float _1939 = abs(_1817);
        bool _1941 = _1939 == as_type<float>(0x7f800000u /* inf */);
        float _1943 = abs(_1817);
        bool _1945 = _1943 == as_type<float>(0x7f800000u /* inf */);
        bool _1947 = !_1937;
        bool _1949 = _1945 && _1947;
        _1883 = _1937;
        if (_1949)
        {
            bool _1951 = as_type<int>(_1817) >= 0;
            _1897 = _1951 ? (-1) : 0;
        }
        int _1953 = _1897;
        if (_1949)
        {
            _1923 = 1075235812;
        }
        int _1955 = _1923;
        int _1957 = _1955;
        if (_1949)
        {
            int _1959 = ~_1953;
            int _1961 = (_1959 != 0) ? _1955 : 1061752795;
            _1957 = _1961;
        }
        int _1963 = _1957;
        float _1965 = as_type<float>(_1963);
        if (_1949)
        {
            int _1967 = int(0x80000000) & as_type<int>(_1801);
            int _1969 = _1963 | _1967;
            _1965 = as_type<float>(_1969);
        }
        float _1971 = _1965;
        bool _1973 = !_1937;
        bool _1975 = _1973 && _1941;
        _1925 = _1971;
        if (!_1975)
        {
            float _1977 = abs(_1801);
            float _1979 = abs(_1817);
            float _1981 = precise::max(_1977, _1979);
            float _1983 = abs(_1801);
            float _1985 = abs(_1817);
            float _1987 = precise::min(_1983, _1985);
            float _1989 = 1.0 / _1981;
            float _1991 = abs(_1801);
            float _1993 = abs(_1817);
            bool _1995 = _1991 > _1993;
            bool _1997 = as_type<int>(_1817) >= 0;
            float _1999 = _1987 * _1989;
            float _2001 = abs(_1801);
            float _2003 = abs(_1817);
            float _2005 = _2001 + _2003;
            float _2007 = _1999 * _1999;
            bool _2009 = _2005 > as_type<float>(0x7f800000u /* inf */);
            bool _2011 = isnan(_2005);
            bool _2013 = _2009 || _2011;
            bool _2015 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _2017 = _2013 || _2015;
            float _2019 = _2007 + 11.33538818359375;
            float _2021 = fma(_2007, _2019, 28.84246826171875);
            float _2023 = fma(_2007, _2021, 19.6966705322265625);
            float _2025 = fma(_2007, -0.82336294651031494140625, -5.674867153167724609375);
            float _2027 = fma(_2007, _2025, -6.565555095672607421875);
            float _2029 = 1.0 / _2023;
            float _2031 = _2007 * _2027;
            float _2033 = _1999 * _2031;
            float _2035 = fma(_2033, _2029, _1999);
            int _2037 = as_type<int>(_1801) & int(0x80000000);
            float _2039 = _2035;
            _1925 = _2005;
            _1883 = _2017;
            if (_1995)
            {
                float _2041 = -_2035;
                float _2043 = _2041 + 1.57079637050628662109375;
                _2039 = _2043;
            }
            float _2045 = _2039;
            int _2047 = as_type<int>(_2045);
            if (!_1997)
            {
                float _2049 = -_2045;
                float _2051 = _2049 + 3.1415927410125732421875;
                _2047 = as_type<int>(_2051);
            }
            int _2053 = _2047;
            if (!_2017)
            {
                int _2055 = _2037 | _2053;
                _1925 = as_type<float>(_2055);
            }
        }
    }
    float _2057 = _1925;
    bool _2059 = _1883;
    bool _2061 = _2059;
    if (_1729)
    {
        float _2063 = _1677 * 0.0625;
        _1737 = _2063;
    }
    float _2065 = _1737;
    float _2067 = abs(_1787);
    bool _2069 = _2067 != 0.0;
    bool _2071 = isnan(_2067);
    bool _2073 = _2069 || _2071;
    bool _2075 = isnan(0.0);
    bool _2077 = _2073 || _2075;
    float _2079 = -_2057;
    float _2081 = _1911 + _2079;
    float _2083 = _1867 * 6.283185482025146484375;
    float _2085 = cos(_2083);
    float _2087 = _1216 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2089 = abs(_2065);
    bool _2091 = _2089 == 0.0;
    bool _2093 = !_2077;
    bool _2095 = _2091 && _2093;
    float _2097 = _2081 * 0.15915493667125701904296875;
    float _2099 = abs(_2065);
    bool _2101 = _2099 == 0.0;
    float _2103 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1407);
    float _2105 = _1214 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2107 = _2097 * 6.283185482025146484375;
    float _2109 = sin(_2107);
    float _2111 = _1212 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2113 = _2103 * _2087;
    float _2115 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1435);
    float _2117 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1467);
    float _2119 = _2115 * _2105;
    float _2121 = _2097 * 6.283185482025146484375;
    float _2123 = cos(_2121);
    int _2125 = as_type<int>(_2087);
    if (_2095)
    {
        bool _2127 = as_type<int>(_2065) >= 0;
        _2061 = _2127;
    }
    bool _2129 = _2061;
    float _2131 = _2117 * _2111;
    float _2133 = _1905 * _2085;
    int _2135 = _2129 ? (-1) : 0;
    if (_2095)
    {
        int _2137 = _2129 ? 0 : 1078530011;
        _2125 = _2137;
    }
    int _2139 = _2125;
    int _2141 = _2139;
    if (_2095)
    {
        int _2143 = int(0x80000000) & as_type<int>(_1787);
        int _2145 = _2139 | _2143;
        _1885 = as_type<float>(_2145);
    }
    float _2147 = _1885;
    bool _2149 = !_2077;
    bool _2151 = _2149 && _2101;
    float _2153 = _2147;
    float _2155 = _2147;
    if (!_2151)
    {
        float _2157 = abs(_1787);
        bool _2159 = _2157 != as_type<float>(0x7f800000u /* inf */);
        bool _2161 = isnan(_2157);
        bool _2163 = _2159 || _2161;
        bool _2165 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _2167 = _2163 || _2165;
        float _2169 = abs(_2065);
        bool _2171 = _2169 == as_type<float>(0x7f800000u /* inf */);
        float _2173 = abs(_2065);
        bool _2175 = _2173 == as_type<float>(0x7f800000u /* inf */);
        bool _2177 = !_2167;
        bool _2179 = _2175 && _2177;
        if (_2179)
        {
            bool _2181 = as_type<int>(_2065) >= 0;
            _2135 = _2181 ? (-1) : 0;
        }
        int _2183 = _2135;
        if (_2179)
        {
            _2141 = 1075235812;
        }
        int _2185 = _2141;
        int _2187 = _2185;
        if (_2179)
        {
            int _2189 = ~_2183;
            int _2191 = (_2189 != 0) ? _2185 : 1061752795;
            _2187 = _2191;
        }
        int _2193 = _2187;
        if (_2179)
        {
            int _2195 = int(0x80000000) & as_type<int>(_1787);
            int _2197 = _2193 | _2195;
            _2153 = as_type<float>(_2197);
        }
        float _2199 = _2153;
        bool _2201 = !_2167;
        bool _2203 = _2201 && _2171;
        _2155 = _2199;
        if (!_2203)
        {
            float _2205 = abs(_1787);
            float _2207 = abs(_2065);
            float _2209 = precise::max(_2205, _2207);
            float _2211 = abs(_1787);
            float _2213 = abs(_2065);
            float _2215 = precise::min(_2211, _2213);
            float _2217 = 1.0 / _2209;
            float _2219 = abs(_1787);
            float _2221 = abs(_2065);
            bool _2223 = _2219 > _2221;
            bool _2225 = as_type<int>(_2065) >= 0;
            float _2227 = _2215 * _2217;
            float _2229 = _2227 * _2227;
            float _2231 = _2229 + 11.33538818359375;
            float _2233 = fma(_2229, _2231, 28.84246826171875);
            float _2235 = fma(_2229, _2233, 19.6966705322265625);
            float _2237 = fma(_2229, -0.82336294651031494140625, -5.674867153167724609375);
            float _2239 = fma(_2229, _2237, -6.565555095672607421875);
            float _2241 = 1.0 / _2235;
            float _2243 = _2229 * _2239;
            float _2245 = abs(_1787);
            float _2247 = abs(_2065);
            float _2249 = _2245 + _2247;
            float _2251 = _2227 * _2243;
            bool _2253 = _2249 > as_type<float>(0x7f800000u /* inf */);
            bool _2255 = isnan(_2249);
            bool _2257 = _2253 || _2255;
            bool _2259 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _2261 = _2257 || _2259;
            float _2263 = fma(_2251, _2241, _2227);
            int _2265 = as_type<int>(_1787) & int(0x80000000);
            float _2267 = _2263;
            _2155 = _2249;
            if (_2223)
            {
                float _2269 = -_2263;
                float _2271 = _2269 + 1.57079637050628662109375;
                _2267 = _2271;
            }
            float _2273 = _2267;
            int _2275 = as_type<int>(_2273);
            if (!_2225)
            {
                float _2277 = -_2273;
                float _2279 = _2277 + 3.1415927410125732421875;
                _2275 = as_type<int>(_2279);
            }
            int _2281 = _2275;
            if (!_2261)
            {
                int _2283 = _2265 | _2281;
                _2155 = as_type<float>(_2283);
            }
        }
    }
    float _2285 = _2155;
    float _2287 = _2285 * (-0.15915493667125701904296875);
    float _2289 = -_2119;
    float _2291 = _1875 * _2289;
    float _2293 = _1905 * _2123;
    float _2295 = _1909 * _2109;
    float _2297 = _2123 * _2085;
    float _2299 = _1905 * _2109;
    float _2301 = _1909 * _2123;
    float _2303 = _2109 * _2085;
    float _2305 = _2133 * _2119;
    float _2307 = _2287 * 6.283185482025146484375;
    float _2309 = sin(_2307);
    float _2311 = -_2295;
    float _2313 = fma(_1875, _2293, _2311);
    float _2315 = fma(_2297, _2113, _2291);
    float _2317 = fma(_1875, _2299, _2301);
    float _2319 = _1909 * _2085;
    float _2321 = fma(_2313, _2113, _2305);
    float _2323 = fma(_2303, _2131, _2315);
    float _2325 = fma(_1875, _2301, _2299);
    float _2327 = _2287 * 6.283185482025146484375;
    float _2329 = cos(_2327);
    float _2331 = fma(_2317, _2131, _2321);
    float _2333 = _1611 + _2323;
    float _2335 = -_2293;
    float _2337 = fma(_1875, _2295, _2335);
    float _2339 = _1625 + _2331;
    float _2341 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _2343 = _2333 + _2341;
    float _2345 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _2347 = _2339 + _2345;
    float _2349 = _2309 * _2343;
    float _2351 = _2329 * _2343;
    float _2353 = -_2349;
    float _2355 = fma(_2329, _2347, _2353);
    float _2357 = in.m_65.x;
    float _2359 = in.m_65.y;
    float _2361 = in.m_65.z;
    float _2363 = fma(_2309, _2347, _2351);
    float _2365 = _2355 + (*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _2367 = _2363 + (*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _2369 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2371 = _2365 + _2369;
    float _2373 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2375 = _2367 + _2373;
    float _2377 = _2371 * _2371;
    float _2379 = fma(_2375, _2375, _2377);
    float _2381 = sqrt(_2379);
    float _2383 = _283 * _2359;
    float _2385 = fma(_281, _2357, _2383);
    float _2387 = _2319 * _2119;
    float _2389 = fma(_285, _2361, _2385);
    float _2391 = fma(_2325, _2113, _2387);
    bool _2393 = _2381 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2395 = _2389 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2397 = fma(_2337, _2131, _2391);
    float _2399 = _2395 + _2397;
    float _2401 = _2397;
    float _2403 = _2361;
    float _2405 = _2391;
    float _2407 = _2381;
    if (!_2393)
    {
        _2401 = _2367;
    }
    float _2409 = _2401;
    float _2411 = _2409;
    if (!_2393)
    {
        _2403 = _2365;
    }
    float _2413 = _2403;
    float _2415 = _2413;
    if (!_2393)
    {
        _2405 = _2399;
    }
    float _2417 = _2405;
    bool _2419 = !_2393;
    float _2421 = _2417;
    if (!_2419)
    {
        float _2423 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2425 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2427 = _2381 + _2425;
        float _2429 = _2399 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2431 = rsqrt(_2379);
        float _2433 = _2427 * _2423;
        float _2435 = _2433 * 0.15915493667125701904296875;
        float _2437 = _2435 * 6.283185482025146484375;
        float _2439 = cos(_2437);
        float _2441 = _2435 * 6.283185482025146484375;
        float _2443 = sin(_2441);
        float _2445 = _2439 + (-1.0);
        float _2447 = _2445 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2449 = fma(_2443, _2429, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2451 = fma(_2399, _2439, _2447);
        float _2453 = _2431 * _2449;
        float _2455 = fma(_2375, _2453, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2457 = fma(_2371, _2453, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2421 = _2451;
        _2411 = _2455;
        _2415 = _2457;
        _2407 = _2427;
    }
    float _2459 = _2421;
    float _2461 = _2411;
    float _2463 = _2415;
    float _2465 = _2407;
    float _2467 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2469 = _2459 + _2467;
    float _2471 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2473 = _2461 + _2471;
    float _2475 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2477 = _2463 + _2475;
    float _2479 = _2469 * _2469;
    float _2481 = fma(_2473, _2473, _2479);
    float _2483 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2485 = fma(_2477, _2477, _2481);
    float _2487 = precise::max(0.0, _2483);
    float _2489 = rsqrt(_2485);
    float _2491 = sqrt(_2485);
    float _2493 = _2489 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2495 = _2473 * _2493;
    float _2497 = _2477 * _2493;
    float _2499 = -_2493;
    float _2501 = -_2487;
    float _2503 = fma(_2469, _2499, _2501);
    float _2505 = _2495 * _2495;
    float _2507 = _2497 * _2497;
    float _2509 = _2505 + _2507;
    float _2511 = sqrt(_2509);
    bool _2513 = _2511 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2515 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2517 = _2511 + _2515;
    float _2519 = _2119;
    float _2521 = _2487;
    float _2523 = _2509;
    float _2525 = _2517;
    float _2527 = _2465;
    float _2529 = _2493;
    float _2531 = _2495;
    float _2533 = _2497;
    float _2535 = _2505;
    float _2537 = _2507;
    float _2539 = _2503;
    if (_2513)
    {
        float _2541 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2519 = _2541;
    }
    float _2543 = _2519;
    if (_2513)
    {
        float _2545 = _2503 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2521 = _2545;
    }
    float _2547 = _2521;
    float _2549 = _2547;
    if (_2513)
    {
        float _2551 = rsqrt(_2509);
        _2523 = _2551;
    }
    float _2553 = _2523;
    if (_2513)
    {
        float _2555 = _2517 * _2543;
        _2525 = _2555;
    }
    float _2557 = _2525;
    if (_2513)
    {
        float _2559 = _2557 * 0.15915493667125701904296875;
        _2527 = _2559;
    }
    float _2561 = _2527;
    float _2563 = _2543;
    if (_2513)
    {
        float _2565 = _2561 * 6.283185482025146484375;
        float _2567 = sin(_2565);
        _2563 = _2567;
    }
    float _2569 = _2563;
    float _2571 = _2557;
    if (_2513)
    {
        float _2573 = _2561 * 6.283185482025146484375;
        float _2575 = cos(_2573);
        _2571 = _2575;
    }
    float _2577 = _2571;
    float _2579 = _2569;
    if (_2513)
    {
        float _2581 = fma(_2569, _2547, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2579 = _2581;
    }
    float _2583 = _2579;
    float _2585 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2587 = _2583;
    if (_2513)
    {
        float _2589 = _2553 * _2583;
        _2529 = _2589;
    }
    float _2591 = _2529;
    if (_2513)
    {
        float _2593 = _2577 + (-1.0);
        _2549 = _2593;
    }
    float _2595 = _2549;
    if (_2513)
    {
        float _2597 = _2495 * _2591;
        _2531 = _2597;
    }
    float _2599 = _2531;
    if (_2513)
    {
        float _2601 = _2497 * _2591;
        _2533 = _2601;
    }
    float _2603 = _2533;
    if (_2513)
    {
        float _2605 = _2595 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2587 = _2605;
    }
    float _2607 = _2587;
    if (_2513)
    {
        float _2609 = _2599 * _2599;
        _2535 = _2609;
    }
    float _2611 = _2535;
    if (_2513)
    {
        float _2613 = _2603 * _2603;
        _2537 = _2613;
    }
    float _2615 = _2537;
    if (_2513)
    {
        float _2617 = fma(_2503, _2577, _2607);
        _2539 = _2617;
    }
    float _2619 = _2539;
    float _2621 = fma(_2619, _2619, _2611);
    float _2623 = _2459 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2625 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2627 = fma(_2491, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2625);
    float _2629 = precise::clamp(_2627, 0.0, 1.0);
    float _2631 = _2459 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2633 = _2621 + _2615;
    float _2635 = fma(_2461, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2623);
    float _2637 = -_2629;
    float _2639 = _2637 + 1.0;
    float _2641 = fma(_2461, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2631);
    float _2643 = _2459 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2645 = fma(_2463, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2635);
    float _2647 = rsqrt(_2633);
    float _2649 = _2459 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2651 = fma(_2463, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2641);
    float _2653 = _2645 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2655 = fma(_2461, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2643);
    float _2657 = fma(_2461, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2649);
    float _2659 = _2651 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2661 = _2653 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2663 = abs(_2639);
    float _2665 = log2(_2663);
    float _2667 = fma(_2463, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2657);
    float _2669 = fma(_2463, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2655);
    float _2671 = -_2661;
    float _2673 = fma(_2671, _2585, 1.0);
    float _2675 = _2659 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2677 = _2667 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2679 = _2669 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2681 = _2647 * _2619;
    float _2683 = _2647 * _2599;
    float _2685 = fma(_2677, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2675);
    float _2687 = _2647 * _2603;
    float _2689 = log2(_2673);
    float _2691 = _2683 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2693 = fma(_2653, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2685);
    float _2695 = _2665 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2697 = -_2691;
    float _2699 = fma(_2681, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2697);
    float _2701 = fma(_2679, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2693);
    float _2703 = _2659 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2705 = exp2(_2695);
    float _2707 = -_2687;
    float _2709 = fma(_2707, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2699);
    float _2711 = _2659 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2713 = fma(_2677, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2703);
    float _2715 = fma(_2709, -0.5, 0.5);
    float _2717 = fma(_2709, 0.5, 0.5);
    float _2719 = fma(_2677, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2711);
    float _2721 = 1.0 / _2701;
    float _2723 = _2681 + 1.0;
    float _2725 = fma(_2653, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2713);
    float _2727 = fma(_2653, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2719);
    float _2729 = fma(_2717, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2731 = _2689 * 0.693147182464599609375;
    float _2733 = fma(_2679, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2727);
    float _2735 = sqrt(_2715);
    float _2737 = -_2681;
    float _2739 = fma(_2705, _2723, _2737);
    float _2741 = fma(_2679, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2725);
    float _2743 = fma(_2717, _2729, -0.212114393711090087890625);
    float _2745 = _2731 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2747 = fma(_2739, 0.5, 0.5);
    float _2749 = fma(_2717, _2743, 1.570728778839111328125);
    float _2751 = _2733 * _2721;
    float _2753 = _2741 * _2721;
    float _2755 = fma(_2751, 0.5, 0.5);
    float _2757 = fma(_2753, -0.5, 0.5);
    float _2759 = _2735 * 0.636619746685028076171875;
    float3 _6997 = float3(_2755, _2757, _2745);
    float _2761 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6997, float3(0.0), isnan(_6997)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6997, float3(0.0), isnan(_6997)), level(0.0)).x;
    float _2763 = -_2749;
    float _2765 = fma(_2759, _2763, 1.0);
    float3 _7013 = float3(_2755, _2757, _2745);
    float4 _2767 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7013, float3(0.0), isnan(_7013)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7013, float3(0.0), isnan(_7013)), level(0.0)).xyzw;
    float _2769 = _2767.x;
    float _2771 = _2767.y;
    float _2773 = _2767.z;
    float _2775 = _2767.w;
    float2 _7029 = float2(_2765, _2747);
    float3 _2779 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7029, float2(0.0), isnan(_7029)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7029, float2(0.0), isnan(_7029)), level(0.0)).xyz;
    float _2781 = _2779.x;
    float _2783 = _2779.y;
    float _2785 = _2779.z;
    float _2787 = _2395 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2789 = _1465 * _1517;
    float _2791 = _1427 * 3.883221149444580078125;
    float _2793 = _2395 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2795 = fma(_1611, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2787);
    float _2797 = _1449 * 2.0;
    float _2799 = _2791 * 0.15915493667125701904296875;
    bool _2801 = _1435 != 0.0;
    bool _2803 = isnan(_1435);
    bool _2805 = _2801 || _2803;
    bool _2807 = isnan(0.0);
    bool _2809 = _2805 || _2807;
    float _2811 = fma(_1625, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2795);
    float _2813 = -_2797;
    float _2815 = fma(_2789, _2813, _2789);
    float _2817 = fma(_1611, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2793);
    float _2819 = _2799 * 6.283185482025146484375;
    float _2821 = cos(_2819);
    float _2823 = _2811 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2825 = fma(_1449, 3.1415927410125732421875, _2815);
    float _2827 = fma(_1625, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2817);
    bool _2829 = _1407 == 0.0;
    bool _2831 = !_2809;
    bool _2833 = _2829 && _2831;
    float _2835 = _2825 * 0.15915493667125701904296875;
    bool _2837 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2839 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2841 = _2837 || _2839;
    bool _2843 = isnan(0.5);
    bool _2845 = _2841 || _2843;
    float _2847 = 1.0 / _2823;
    float _2849 = _2827 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2851 = -_1251;
    float _2853 = _2851 + _1433;
    bool _2855 = _1467 == 0.0;
    bool _2857 = _2855 && _2833;
    float _2859 = _2665 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2861 = _2849 + _2823;
    float _2863 = fma(_1379, _2853, _1251);
    out.m_67.x = _725;
    out.m_67.y = _719;
    out.m_67.z = _727;
    out.m_67.w = _705;
    float _2865 = _2835 * 6.283185482025146484375;
    float _2867 = sin(_2865);
    float _2869 = _2659 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_69.x = _703;
    out.m_69.y = _711;
    out.m_69.z = _717;
    out.m_69.w = _721;
    float _2871 = _2849;
    if (!_2845)
    {
        _2871 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _2873 = _2871;
    float _2875 = fma(_2677, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2869);
    float _2877 = in.m_71.w;
    float _2879 = _2799 * 6.283185482025146484375;
    float _2881 = sin(_2879);
    float _2883 = _2861 * _2847;
    float _2885 = _2883 * 0.5;
    out.m_73.x = _1200;
    out.m_73.y = _1204;
    float _2887 = _2885;
    if (!_2845)
    {
        float _2889 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2891 = fma(_2885, _2873, _2889);
        _2887 = _2891;
    }
    float _2893 = _2887;
    if (_2845)
    {
        _731 = 1.0;
    }
    float _2895 = _731;
    out.m_75.x = _2461;
    out.m_75.y = _2459;
    out.m_75.z = _2463;
    float _2897 = -_1385;
    float _2899 = fma(_2867, _2821, _2897);
    float _2901 = exp2(_2859);
    out.m_77.x = _1611;
    float _2903 = fma(_1379, _2899, _1385);
    float _2905 = _2903;
    float _2907 = _2895;
    if (!_2845)
    {
        _1415 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2909 = _1415;
    float _2911 = _2701 * 0.5;
    out.m_77.z = _1625;
    float _2913 = -_1387;
    float _2915 = fma(_2867, _2881, _2913);
    float _2917 = _2821;
    if (!_2845)
    {
        float _2919 = 1.0 / _2893;
        _2917 = _2919;
    }
    float _2921 = _2917;
    if (!_2845)
    {
        float _2923 = -_2909;
        float _2925 = _2923 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _733 = _2925;
    }
    float _2927 = _733;
    if (!_2857)
    {
        float _2929 = fma(_1407, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2903);
        _2905 = _2929;
    }
    float _2931 = _2905;
    float _2933 = fma(_1379, _2915, _1387);
    out.m_79.w = _2877;
    float _2935 = _2933;
    float _2937 = _2863;
    if (!_2857)
    {
        float _2939 = fma(_1467, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2933);
        _2935 = _2939;
    }
    float _2941 = _2935;
    float _2943 = _703;
    if (!_2845)
    {
        float _2945 = 1.0 / _2927;
        _2943 = _2945;
    }
    float _2947 = _2943;
    if (!_2857)
    {
        float _2949 = fma(_1435, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2863);
        _2937 = _2949;
    }
    float _2951 = _2937;
    float _2953 = -_2901;
    float _2955 = _2953 + 1.0;
    float _2957 = -_2951;
    float _2959 = _1875 * _2957;
    float _2961 = _2319 * _2951;
    float _2963 = _2133 * _2951;
    float _2965 = _2921;
    if (!_2845)
    {
        float _2967 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2969 = -_2909;
        float _2971 = fma(_2921, _2967, _2969);
        _2965 = _2971;
    }
    float _2973 = _2965;
    float _2975 = fma(_2297, _2931, _2959);
    float _2977 = _2955 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2979 = fma(_2313, _2931, _2963);
    float _2981 = fma(_2325, _2931, _2961);
    float _2983 = fma(_2303, _2941, _2975);
    float _2985 = fma(_2653, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2875);
    float _2987 = fma(_2317, _2941, _2979);
    if (!_2845)
    {
        float _2989 = _2973 * _2947;
        float _2991 = precise::clamp(_2989, 0.0, 1.0);
        _2907 = _2991;
    }
    float _2993 = _2907;
    float _2995 = _2983 * _2309;
    float _2997 = _2983 * _2329;
    float _2999 = fma(_2337, _2941, _2981);
    float _3001 = fma(_2679, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2985);
    float _3003 = -_2995;
    float _3005 = fma(_2987, _2329, _3003);
    float _3007 = fma(_2987, _2309, _2997);
    bool _3009 = _2993 > 0.0;
    bool _3011 = isnan(_2993);
    bool _3013 = _3009 || _3011;
    bool _3015 = isnan(0.0);
    bool _3017 = _3013 || _3015;
    float _3019 = _2993 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3021 = _3001 + _2701;
    float _3023 = _2733 + _2701;
    out.m_81.x = _3007;
    out.m_81.y = _2999;
    out.m_81.z = _3005;
    float _3025 = fma(_2741, -0.5, _2911);
    float _3027 = _3021 * 0.5;
    float _3029 = _3023 * 0.5;
    out.gl_Position.x = _2733;
    out.gl_Position.y = _2741;
    out.gl_Position.z = _3001;
    out.gl_Position.w = _2701;
    out.m_83.x = _3029;
    out.m_83.y = _3025;
    out.m_83.z = _3027;
    out.m_83.w = _2701;
    float _3031 = -_2977;
    float _3033 = _3031 + 1.0;
    float _3035 = _3019 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_47.x = _3035;
    float _3037 = _2977 * _2761;
    float _3039 = _2775 * _3037;
    float _3041 = _2775 * _3033;
    float _3043 = _2785 * _3037;
    float _3045 = fma(_2781, _3039, _2769);
    float _3047 = fma(_2783, _3039, _2771);
    float _3049 = fma(_2775, _3043, _2773);
    out.m_85.x = _3045;
    out.m_85.y = _3047;
    out.m_85.z = _3049;
    out.m_85.w = _3041;
    if (_3017)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _3051 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3051;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint dm_vid [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1493 = false;
    bool _1303 = false;
    bool _753 = false;
    bool _523 = false;
    bool _307 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _105 = in.m_44.w;
    float _107 = trunc(_105);
    int _109 = int(_107);
    bool _113 = _109 >= 1;
    float _115 = 0.0;
    float _117 = as_type<float>(_109);
    if (!_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _119 = _115;
    if (!_113)
    {
        out.m_47.x = 0.0;
    }
    int _121 = 0;
    if (!_113)
    {
        float _123 = _119 * 5.0;
        _121 = as_type<int>(_123);
    }
    int _125 = _121;
    int _127 = _125;
    if (!_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3109 = as_type<float>(_125);
        out.gl_Position.z = _3109;
    }
    if (!_113)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _129 = in.m_49.w;
    float _131 = float(_109);
    float _133 = -_129;
    float _135 = _133 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = _129 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _139 = isnan(_129);
    bool _141 = _137 || _139;
    bool _143 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _145 = _141 || _143;
    bool _147 = _135 >= _131;
    bool _149 = !_145;
    bool _151 = _147 || _149;
    float _153 = _135;
    if (_151)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _155 = _117;
    if (_151)
    {
        out.m_47.x = 0.0;
    }
    if (_151)
    {
        float _157 = _155 * 5.0;
        _127 = as_type<int>(_157);
    }
    int _159 = _127;
    if (_151)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3173 = as_type<float>(_159);
        out.gl_Position.z = _3173;
    }
    if (_151)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _161 = in.m_51.w;
    float _163 = 1.0 / _131;
    float _165 = _135 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _167 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _169 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _171 = _167 || _169;
    bool _173 = isnan(1.0);
    bool _175 = _171 || _173;
    float _177 = in.m_49.x;
    float _179 = in.m_49.y;
    float _181 = in.m_49.z;
    float _183 = in.m_44.x;
    float _185 = in.m_44.y;
    float _187 = in.m_44.z;
    float _189 = 0.0;
    float _191 = _165;
    if (!_175)
    {
        float _193 = _165 * _165;
        float _195 = _193 * 0.5;
        _189 = _195;
    }
    float _197 = _189;
    float _199 = _197;
    if (!_175)
    {
        float _201 = _197 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _199 = _201;
    }
    float _203 = _199;
    bool _205 = !_175;
    float _207 = _203;
    if (!_205)
    {
        float _209 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _211 = log2(_209);
        float _213 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _215 = _213 + 1.0;
        float _217 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _219 = _165 * _211;
        float _221 = 1.0 / _215;
        float _223 = _217 * 0.693147182464599609375;
        float _225 = exp2(_219);
        float _227 = 1.0 / _223;
        float _229 = _225 + (-1.0);
        float _231 = -_229;
        float _233 = fma(_231, _227, _165);
        float _235 = _233 * _221;
        float _237 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _207 = _237;
    }
    float _239 = _207;
    bool _241 = !_175;
    if (!_241)
    {
        float _243 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _245 = log2(_243);
        float _247 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _249 = _247 + 1.0;
        float _251 = 1.0 / _249;
        float _253 = _165 * _245;
        float _255 = exp2(_253);
        float _257 = -_255;
        float _259 = _257 + 1.0;
        float _261 = _259 * _251;
        _191 = _261;
    }
    float _263 = _191;
    bool _265 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _267 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _269 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _271 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _273 = fma(_263, _177, _267);
    float _275 = fma(_263, _179, _269);
    float _277 = fma(_263, _181, _271);
    float _279 = _135 * _163;
    float _281 = fma(_273, _161, _183);
    float _283 = fma(_275, _161, _185);
    float _285 = fma(_277, _161, _187);
    bool _287 = !_265;
    float _305;
    if (!_287)
    {
        float _289 = in.m_53.x;
        float _291 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _293 = _289 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _295 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[11].x, _135);
        float _297 = _295 * _291;
        float _299 = floor(_297);
        float _301 = -_299;
        float _303 = _297 + _301;
        _305 = _303;
        _307 = true;
    }
    else
    {
        _305 = _279;
    }
    _307 = false;
    float _309 = _305;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _313 = _309 + _311;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _317 = _309 + _315;
    bool _319 = _309 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _321 = isnan(_309);
    bool _323 = _319 || _321;
    bool _325 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _327 = _323 || _325;
    float _329 = float(_327);
    float _331 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _333 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _331;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _337 = _309 + _335;
    float _339 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _341 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _339;
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _345 = _343 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _347 = 1.0 / _333;
    bool _349 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _351 = 1.0 / _345;
    float _353 = 1.0 / _341;
    float _355 = _313 * _347;
    bool _357 = _309 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _359 = isnan(_309);
    bool _361 = _357 || _359;
    bool _363 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _365 = _361 || _363;
    float _367 = float(_365);
    float _369 = -_329;
    float _371 = _369 + 1.0;
    float _373 = _367 * _371;
    float _375 = _317 * _351;
    bool _377 = _309 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _379 = isnan(_309);
    bool _381 = _377 || _379;
    bool _383 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _385 = _381 || _383;
    float _387 = float(_385);
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _391 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _389;
    bool _393 = _309 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _395 = isnan(_309);
    bool _397 = _393 || _395;
    bool _399 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _401 = _397 || _399;
    float _403 = float(_401);
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _407 = _405 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _409 = -_367;
    float _411 = _409 + 1.0;
    float _413 = -_387;
    float _415 = _413 + 1.0;
    float _417 = _337 * _353;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _421 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _419;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _425 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _423;
    float _427 = _403 * _415;
    float _429 = fma(_391, _417, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _431 = fma(_421, _417, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _433 = fma(_425, _417, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _435 = _387 * _411;
    float _437 = _429 * _427;
    float _439 = _431 * _427;
    float _441 = _433 * _427;
    float _443 = -_403;
    float _445 = _443 + 1.0;
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _449 = _447 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _453 = _451 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _455 = fma(_445, (*spvDescriptorSet0.vp_c9)._m0[107].x, _441);
    float _457 = fma(_445, (*spvDescriptorSet0.vp_c9)._m0[107].y, _439);
    float _459 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _461 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _459;
    float _463 = fma(_453, _375, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _465 = fma(_445, (*spvDescriptorSet0.vp_c9)._m0[107].z, _437);
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _469 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _467;
    float _471 = fma(_407, _375, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _473 = fma(_449, _375, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _477 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _475;
    float _479 = fma(_469, _355, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _481 = fma(_463, _435, _457);
    float _483 = fma(_471, _435, _455);
    float _485 = fma(_461, _355, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _487 = fma(_477, _355, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _489 = fma(_473, _435, _465);
    float _491 = fma(_479, _373, _481);
    float _493 = fma(_485, _373, _483);
    float _495 = fma(_487, _373, _489);
    float _497 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[110].y, _491);
    float _499 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[110].x, _493);
    float _501 = fma(_329, (*spvDescriptorSet0.vp_c9)._m0[110].z, _495);
    bool _503 = !_349;
    float _521;
    if (!_503)
    {
        float _505 = in.m_53.x;
        float _507 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _509 = _505 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _511 = fma(_509, (*spvDescriptorSet0.vp_c9)._m0[11].y, _135);
        float _513 = _511 * _507;
        float _515 = floor(_513);
        float _517 = -_515;
        float _519 = _513 + _517;
        _521 = _519;
        _523 = true;
    }
    else
    {
        _521 = _279;
    }
    _523 = false;
    float _525 = _521;
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _529 = _525 + _527;
    float _531 = _499 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _533 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _535 = _533 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _537 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _539 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _537;
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _543 = _541 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _545 = _525 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _547 = isnan(_525);
    bool _549 = _545 || _547;
    bool _551 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _553 = _549 || _551;
    float _555 = float(_553);
    float _557 = 1.0 / _535;
    float _559 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _561 = _559 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _563 = _525 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _565 = isnan(_525);
    bool _567 = _563 || _565;
    bool _569 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _571 = _567 || _569;
    float _573 = float(_571);
    float _575 = _497 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _577 = _501 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _579 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _581 = 1.0 / _543;
    float _583 = _539 * _557;
    bool _585 = _525 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _587 = isnan(_525);
    bool _589 = _585 || _587;
    bool _591 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _593 = _589 || _591;
    float _595 = float(_593);
    float _597 = 1.0 / _561;
    float _599 = -_555;
    float _601 = _599 + 1.0;
    float _603 = fma(_583, _529, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _605 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _607 = _605 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _609 = -_595;
    float _611 = _609 + 1.0;
    bool _613 = _525 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _615 = isnan(_525);
    bool _617 = _613 || _615;
    bool _619 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _621 = _617 || _619;
    float _623 = float(_621);
    float _625 = _595 * _601;
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _629 = _627 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _631 = 1.0 / _607;
    float _633 = _573 * _611;
    float _635 = -_623;
    float _637 = _635 + 1.0;
    float _639 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _641 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _639;
    float _643 = _629 * _581;
    float _645 = _603 * _633;
    float _647 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _649 = _525 + _647;
    float _651 = -_573;
    float _653 = _651 + 1.0;
    float _655 = _555 * _637;
    float _657 = _641 * _597;
    bool _659 = _525 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _661 = isnan(_525);
    bool _663 = _659 || _661;
    bool _665 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _667 = _663 || _665;
    float _669 = float(_667);
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _673 = _671 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _677 = _525 + _675;
    float _679 = fma(_643, _649, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _681 = fma(_653, (*spvDescriptorSet0.vp_c9)._m0[115].x, _645);
    float _683 = -_669;
    float _685 = _683 + 1.0;
    float _687 = _673 * _631;
    float _689 = fma(_657, _677, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _693 = _525 + _691;
    float _695 = fma(_679, _625, _681);
    float _697 = _623 * _685;
    float _699 = fma(_687, _693, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _701 = fma(_689, _655, _695);
    float _703 = _531 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _705 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _707 = fma(_699, _697, _701);
    float _709 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _711 = _575 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _713 = fma(_669, (*spvDescriptorSet0.vp_c9)._m0[119].x, _707);
    float _715 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _717 = _577 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _719 = _709 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _721 = _713 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _723 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _725 = _715 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _727 = _723 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _729 = !_579;
    float _731 = _705;
    float _733 = _727;
    float _751;
    if (!_729)
    {
        float _735 = in.m_53.x;
        float _737 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _739 = _735 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _741 = fma(_739, (*spvDescriptorSet0.vp_c9)._m0[14].x, _135);
        float _743 = _741 * _737;
        float _745 = floor(_743);
        float _747 = -_745;
        float _749 = _743 + _747;
        _751 = _749;
        _753 = true;
    }
    else
    {
        _751 = _279;
    }
    _753 = false;
    float _755 = _751;
    int _757 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _759 = _757;
    int _761 = 0;
    int _763 = _100(_759, _761, (*spvDescriptorSet0.support_buffer));
    float _765 = in.m_55.z;
    float _767 = 0.0 + _279;
    float _769 = precise::clamp(_767, 0.0, 1.0);
    float _771 = trunc(_765);
    int _773 = int(_771);
    int _775 = _763 + (-1);
    float _777 = float(_775);
    float _779 = _769 * _777;
    float _781 = trunc(_779);
    int _783 = int(_781);
    int _785 = _783;
    int _787 = 0;
    int _789 = _101(_785, _787, (*spvDescriptorSet0.support_buffer));
    int _791 = _773;
    int _793 = 0;
    int _795 = _101(_791, _793, (*spvDescriptorSet0.support_buffer));
    float4 _798 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_789, _795)), 0).xyzw;
    float _800 = _798.x;
    float _802 = _798.y;
    float _804 = _798.z;
    float _806 = _798.w;
    float _808 = in.m_53.x;
    float _810 = in.m_53.y;
    float _812 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _814 = _812 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _816 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _818 = _816 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _820 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _822 = 1.0 / _814;
    float _824 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _826 = _824 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    int _828 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _830 = _828 != 0;
    int _832 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _834 = _832 != 0;
    float _836 = 1.0 / _818;
    float _838 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _840 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _838;
    float _842 = _808 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _844 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _846 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _848 = _846 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _850 = 1.0 / _826;
    float _852 = -_820;
    float _854 = fma(_842, 2.0, _852);
    float _856 = fma(_808, (*spvDescriptorSet0.vp_c9)._m0[78].z, _844);
    float _858 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _860 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _858;
    float _862 = _840 * _822;
    float _864 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _866 = _810 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _868 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _870 = _868 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _872 = _848 * _836;
    bool _874 = _755 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _876 = isnan(_755);
    bool _878 = _874 || _876;
    bool _880 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _882 = _878 || _880;
    float _884 = float(_882);
    float _886 = fma(_866, -2.0, _864);
    float _888 = 1.0 / _870;
    bool _890 = _755 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _892 = isnan(_755);
    bool _894 = _890 || _892;
    bool _896 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _898 = _894 || _896;
    float _900 = float(_898);
    float _902 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _904 = _902 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _906 = _860 * _850;
    float _908 = -_884;
    float _910 = _908 + 1.0;
    float _912 = -_900;
    float _914 = _912 + 1.0;
    bool _916 = _755 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _918 = isnan(_755);
    bool _920 = _916 || _918;
    bool _922 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _924 = _920 || _922;
    float _926 = float(_924);
    float _928 = 0.0;
    if (_830)
    {
        float _930 = in.m_53.x;
        _928 = _930;
    }
    float _932 = _928;
    float _934 = _884 * _914;
    bool _936 = _755 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _938 = isnan(_755);
    bool _940 = _936 || _938;
    bool _942 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _944 = _940 || _942;
    float _946 = float(_944);
    float _948 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _950 = _948 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _952 = _755 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _954 = isnan(_755);
    bool _956 = _952 || _954;
    bool _958 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _960 = _956 || _958;
    float _962 = float(_960);
    float _964 = _926 * _910;
    float _966 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _968 = _966 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _970 = _904 * _888;
    float _972 = -_946;
    float _974 = _972 + 1.0;
    bool _976 = _755 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _978 = isnan(_755);
    bool _980 = _976 || _978;
    bool _982 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _984 = _980 || _982;
    float _986 = float(_984);
    float _988 = -_962;
    float _990 = _988 + 1.0;
    float _992 = 1.0 / _950;
    float _994 = -_926;
    float _996 = _994 + 1.0;
    float _998 = _986 * _990;
    float _1000 = -_986;
    float _1002 = _1000 + 1.0;
    float _1004 = _946 * _996;
    float _1006 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1008 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1006;
    float _1010 = 1.0 / _968;
    float _1012 = _962 * _974;
    float _1014 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1016 = _755 + _1014;
    bool _1018 = _755 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1020 = isnan(_755);
    bool _1022 = _1018 || _1020;
    bool _1024 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1026 = _1022 || _1024;
    float _1028 = float(_1026);
    float _1030 = -_135;
    float _1032 = fma(_1030, (*spvDescriptorSet0.vp_c9)._m0[76].x, _854);
    bool _1034 = _932 > 0.5;
    bool _1036 = _1034 && _830;
    float _1038 = fma(_862, _1016, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _1040 = _810 > 0.5;
    bool _1042 = _1040 && _834;
    float _1044 = _1028 * _1002;
    float _1046 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1048 = _1046 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1050 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1052 = _1050 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1054 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1056 = _755 + _1054;
    float _1058 = _1038 * _1044;
    float _1060 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1062 = _755 + _1060;
    float _1064 = in.m_55.x;
    float _1066 = fma(_872, _1056, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1068 = _1008 * _992;
    float _1070 = fma(_906, _1062, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1072 = -_1028;
    float _1074 = _1072 + 1.0;
    float _1076 = in.m_55.y;
    float _1078 = 1.0 / _1052;
    float _1080 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1082 = _755 + _1080;
    float _1084 = fma(_1074, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1058);
    float _1086 = _1048 * _1010;
    float _1088 = fma(_970, _1082, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1090 = fma(_1066, _998, _1084);
    float _1092 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1094 = _755 + _1092;
    float _1096 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1098 = _755 + _1096;
    float _1100 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1102 = fma(_1070, _1012, _1090);
    float _1104 = fma(_1068, _1094, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1106 = fma(_1086, _1098, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1108 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1110 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1108;
    float _1112 = fma(_1088, _1004, _1102);
    bool _1114 = _755 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1116 = isnan(_755);
    bool _1118 = _1114 || _1116;
    bool _1120 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1122 = _1118 || _1120;
    float _1124 = float(_1122);
    float _1126 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1128 = _755 + _1126;
    float _1130 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1132 = _1098;
    float _1134 = _1064;
    if (_830)
    {
        _1132 = _1064;
    }
    float _1136 = _1132;
    float _1138 = fma(_1104, _964, _1112);
    float _1140 = _1110 * _1078;
    float _1142 = -_1124;
    float _1144 = _1142 + 1.0;
    float _1146 = _1076;
    float _1148 = _1136;
    if (_1042)
    {
        float _1150 = -_1076;
        float _1152 = _1150 + 1.0;
        _1146 = _1152;
    }
    float _1154 = _1146;
    if (_1036)
    {
        float _1156 = -_1136;
        float _1158 = _1156 + 1.0;
        _1148 = _1158;
    }
    float _1160 = _1148;
    float _1162 = fma(_1140, _1128, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1164 = fma(_1106, _934, _1138);
    float _1166 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1168 = _900 * _1144;
    if (_830)
    {
        _1134 = _1160;
    }
    float _1170 = _1134;
    float _1172 = _1100 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1174 = fma(_810, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1166);
    float _1176 = fma(_1162, _1168, _1164);
    float _1178 = _1130 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1180 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[77].z, _856);
    float _1182 = fma(_1172, _1154, -0.5);
    float _1184 = fma(_1124, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1176);
    float _1186 = fma(_1178, _1170, -0.5);
    float _1188 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1174);
    float _1190 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[76].y, _886);
    float _1192 = fma(_1180, _1186, _1032);
    int _1194 = _783 + 1;
    float _1196 = -_1190;
    float _1198 = fma(_1188, _1182, _1196);
    out.m_57.x = _1184;
    float _1200 = _1192 + 0.5;
    int _1202 = min(_775, _1194);
    float _1204 = _1198 + 0.5;
    float _1206 = in.m_51.x;
    float _1208 = in.m_51.y;
    float _1210 = in.m_51.z;
    float _1212 = _1210 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _1214 = _1208 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1216 = _1206 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    uint _1219 = as_type<uint>(half2(float2(_806, 0.0)));
    uint _1221 = extract_bits(_1219, 0u, 8u);
    int _1223 = int(_1221) & 255;
    uint _1225 = extract_bits(_1219, 8u, 8u);
    int _1227 = int(_1225) & 255;
    int _1229 = _1227 << 8;
    int _1231 = _1223 | _1229;
    bool _1233 = _1231 >= 32768;
    int _1235 = _1231 + (-1024);
    int _1237 = _1235;
    if (_1233)
    {
        int _1239 = ~_1231;
        int _1241 = _1239 + 33792;
        int _1243 = _1241 + 1;
        _1237 = _1243;
    }
    int _1245 = _1237;
    int _1247 = _1245 + 30719;
    float _1249 = float(_1247);
    float _1251 = fma(_1249, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1253 = abs(_1251);
    float _1255 = -_1253;
    float _1257 = _1255 + 1.0;
    bool _1259 = _1251 < 0.0;
    float _1261 = float(_1259);
    float _1263 = abs(_1251);
    float _1265 = fma(_1263, -0.0187292993068695068359375, 0.074261002242565155029296875);
    int _1267 = as_type<int>(_1257) + (-218103808);
    float _1269 = abs(_1251);
    float _1271 = fma(_1269, _1265, -0.212114393711090087890625);
    bool _1273 = uint(_1267) >= 1920991232u;
    float _1275 = abs(_1251);
    float _1277 = fma(_1275, _1271, 1.570728778839111328125);
    bool _1279 = !_1273;
    float _1301;
    if (!_1279)
    {
        int _1281 = as_type<int>(_1257);
        int _1283 = as_type<int>(_1206);
        int _1285 = as_type<int>(_1208);
        int _1287 = 6256;
        int _1289;
        int _1291;
        int _1293;
        int _1295;
        int _1297;
        int _1299;
        _98(_1281, _1283, _1285, _1287, _1289, _1291, _1293, _1295, _1297, _1299, out.gl_Position, out.gl_PointSize);
        _1301 = as_type<float>(_1293);
        _1303 = true;
    }
    else
    {
        float _1305 = rsqrt(_1257);
        float _1307 = _1257 * _1305;
        float _1309 = _1305 * 0.5;
        float _1311 = -_1307;
        float _1313 = 0.0 + _1311;
        float _1315 = fma(_1309, _1313, 0.5);
        float _1317 = fma(_1307, _1315, _1307);
        float _1319 = -_1317;
        float _1321 = 0.0 + _1319;
        float _1323 = fma(_1317, _1321, _1257);
        float _1325 = fma(_1309, _1323, _1317);
        _1301 = _1325;
    }
    _1303 = false;
    float _1327 = _1301;
    int _1329 = _1202;
    int _1331 = 0;
    int _1333 = _101(_1329, _1331, (*spvDescriptorSet0.support_buffer));
    int _1335 = _773;
    int _1337 = 0;
    int _1339 = _101(_1335, _1337, (*spvDescriptorSet0.support_buffer));
    float4 _1341 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1333, _1339)), 0).xyzw;
    float _1343 = _1341.x;
    float _1345 = _1341.y;
    float _1347 = _1341.z;
    float _1349 = _1341.w;
    float _1351 = _1277 * _1327;
    float _1353 = _1261 * 2.0;
    float _1355 = _1249 * 3.883221149444580078125;
    float _1357 = floor(_779);
    float _1359 = -_1353;
    float _1361 = fma(_1351, _1359, _1351);
    float _1363 = _1355 * 0.15915493667125701904296875;
    float _1365 = fma(_1261, 3.1415927410125732421875, _1361);
    float _1367 = _1363 * 6.283185482025146484375;
    float _1369 = cos(_1367);
    float _1371 = _1365 * 0.15915493667125701904296875;
    float _1373 = _1371 * 6.283185482025146484375;
    float _1375 = sin(_1373);
    float _1377 = -_1357;
    float _1379 = _779 + _1377;
    float _1381 = _1363 * 6.283185482025146484375;
    float _1383 = sin(_1381);
    float _1385 = _1375 * _1369;
    float _1387 = _1375 * _1383;
    uint _1389 = as_type<uint>(half2(float2(_1349, 0.0)));
    float _1391 = -_800;
    float _1393 = _1391 + _1343;
    uint _1395 = extract_bits(_1389, 0u, 8u);
    int _1397 = int(_1395) & 255;
    uint _1399 = extract_bits(_1389, 8u, 8u);
    int _1401 = int(_1399) & 255;
    int _1403 = _1401 << 8;
    int _1405 = _1397 | _1403;
    float _1407 = fma(_1379, _1393, _800);
    bool _1409 = _1405 >= 32768;
    int _1411 = _1405 + (-1024);
    int _1413 = _1411;
    float _1415 = _1385;
    if (_1409)
    {
        int _1417 = ~_1405;
        int _1419 = _1417 + 33792;
        int _1421 = _1419 + 1;
        _1413 = _1421;
    }
    int _1423 = _1413;
    int _1425 = _1423 + 30719;
    float _1427 = float(_1425);
    float _1429 = -_802;
    float _1431 = _1429 + _1345;
    float _1433 = fma(_1427, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1435 = fma(_1379, _1431, _802);
    float _1437 = abs(_1433);
    float _1439 = -_1437;
    float _1441 = _1439 + 1.0;
    float _1443 = abs(_1433);
    float _1445 = fma(_1443, -0.0187292993068695068359375, 0.074261002242565155029296875);
    bool _1447 = _1433 < 0.0;
    float _1449 = float(_1447);
    int _1451 = as_type<int>(_1441) + (-218103808);
    float _1453 = abs(_1433);
    float _1455 = fma(_1453, _1445, -0.212114393711090087890625);
    bool _1457 = uint(_1451) >= 1920991232u;
    float _1459 = -_804;
    float _1461 = _1459 + _1347;
    float _1463 = abs(_1433);
    float _1465 = fma(_1463, _1455, 1.570728778839111328125);
    float _1467 = fma(_1379, _1461, _804);
    bool _1469 = !_1457;
    float _1491;
    if (!_1469)
    {
        int _1471 = as_type<int>(_1441);
        int _1473 = as_type<int>(_1393);
        int _1475 = as_type<int>(_1345);
        int _1477 = 7168;
        int _1479;
        int _1481;
        int _1483;
        int _1485;
        int _1487;
        int _1489;
        _98(_1471, _1473, _1475, _1477, _1479, _1481, _1483, _1485, _1487, _1489, out.gl_Position, out.gl_PointSize);
        _1491 = as_type<float>(_1483);
        _1493 = true;
    }
    else
    {
        float _1495 = rsqrt(_1441);
        float _1497 = _1441 * _1495;
        float _1499 = _1495 * 0.5;
        float _1501 = -_1497;
        float _1503 = 0.0 + _1501;
        float _1505 = fma(_1499, _1503, 0.5);
        float _1507 = fma(_1497, _1505, _1497);
        float _1509 = -_1507;
        float _1511 = 0.0 + _1509;
        float _1513 = fma(_1507, _1511, _1441);
        float _1515 = fma(_1499, _1513, _1507);
        _1491 = _1515;
    }
    _1493 = false;
    float _1517 = _1491;
    float _1519 = in.m_53.x;
    float _1521 = in.m_53.y;
    float _1523 = in.m_53.z;
    float _1525 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1527 = log2(_1525);
    float _1529 = in.m_59.x;
    float _1531 = in.m_59.y;
    float _1533 = in.m_59.z;
    float _1535 = in.m_61.x;
    float _1537 = in.m_61.y;
    float _1539 = in.m_61.z;
    float _1541 = _1527 * _135;
    float _1543 = exp2(_1541);
    float _1545 = _1523 * 2.0;
    float _1547 = _1519 * 2.0;
    float _1549 = _283 * _1531;
    float _1551 = floor(_1545);
    float _1553 = fma(_281, _1529, _1549);
    float _1555 = _1521 * 2.0;
    float _1557 = _283 * _1537;
    float _1559 = fma(_281, _1535, _1557);
    float _1561 = floor(_1547);
    int _1563 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1565 = _1563 != 0;
    int _1567 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1569 = _1567 != 0;
    int _1571 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1573 = _1571 != 0;
    float _1575 = _1523 + _1519;
    float _1577 = _1521 + _1519;
    float _1579 = fma(_285, _1539, _1559);
    float _1581 = -_1543;
    float _1583 = _1581 + 1.0;
    float _1585 = _1575 + (-1.0);
    float _1587 = _1577 + (-1.0);
    float _1589 = floor(_1555);
    bool _1591 = _1551 > 0.0;
    float _1593 = fma(_1585, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _1595 = _1551 >= 0.0;
    bool _1597 = isnan(_1551);
    bool _1599 = _1595 || _1597;
    bool _1601 = isnan(0.0);
    bool _1603 = _1599 || _1601;
    float _1605 = fma(_285, _1533, _1553);
    float _1607 = fma(_1587, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _1609 = _1603 ? 0 : 1;
    float _1611 = _1579 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _1613 = _1561 > 0.0;
    float _1615 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1617 = 1.0 + _1615;
    int _1619 = ~_1609;
    int _1621 = _1619 + 1;
    int _1623 = _1621 + 1;
    float _1625 = _1605 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1627 = _1561 >= 0.0;
    bool _1629 = isnan(_1561);
    bool _1631 = _1627 || _1629;
    bool _1633 = isnan(0.0);
    bool _1635 = _1631 || _1633;
    float _1637 = 1.0 / _1617;
    int _1639 = _1623;
    if (!_1591)
    {
        int _1641 = ~_1609;
        int _1643 = _1641 + 1;
        _1639 = _1643;
    }
    int _1645 = _1639;
    float _1647 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1649 = _1611 + _1647;
    float _1651 = in.m_63.x;
    float _1653 = in.m_63.y;
    float _1655 = in.m_63.z;
    float _1657 = _1519 + (-0.5);
    bool _1659 = _1589 > 0.0;
    float _1661 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1663 = (*spvDescriptorSet0.vp_c8)._m0[29].x + _1661;
    bool _1665 = _1589 >= 0.0;
    bool _1667 = isnan(_1589);
    bool _1669 = _1665 || _1667;
    bool _1671 = isnan(0.0);
    bool _1673 = _1669 || _1671;
    float _1675 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1677 = (*spvDescriptorSet0.vp_c8)._m0[29].z + _1675;
    bool _1679 = !_1565;
    int _1681 = _1679 ? 0 : 1;
    bool _1683 = !_1573;
    int _1685 = _1683 ? 0 : 1;
    bool _1687 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1689 = isnan(1.0);
    bool _1691 = _1687 || _1689;
    bool _1693 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1695 = _1691 || _1693;
    int _1697 = abs(_1681);
    float _1699 = -_1625;
    float _1701 = _1699 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    bool _1703 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1705 = isnan(0.0);
    bool _1707 = _1703 || _1705;
    bool _1709 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1711 = _1707 || _1709;
    float _1713 = abs(_1663);
    float _1715 = abs(_1677);
    float _1717 = precise::max(_1713, _1715);
    float _1719 = float(_1697);
    float _1721 = float(_1645);
    float _1723 = _1711 ? _1583 : 0.0;
    int _1725 = _1673 ? 0 : 1;
    float _1727 = _1719 * _1721;
    bool _1729 = _1717 >= 16.0;
    float _1731 = _1663;
    float _1733 = _1649;
    float _1735 = _1701;
    float _1737 = _1677;
    if (_1695)
    {
        float _1739 = _1723 * _1637;
        _153 = _1739;
    }
    float _1741 = _153;
    float _1743 = abs(_1649);
    float _1745 = abs(_1701);
    float _1747 = precise::max(_1743, _1745);
    float _1749 = _1727 * (-2.0);
    int _1751 = ~_1725;
    int _1753 = _1751 + 1;
    int _1755 = _1753 + 1;
    bool _1757 = !_1569;
    int _1759 = _1757 ? 0 : 1;
    int _1761 = _1755;
    if (!_1659)
    {
        int _1763 = ~_1725;
        int _1765 = _1763 + 1;
        _1761 = _1765;
    }
    int _1767 = _1761;
    float _1769 = fma(_1749, _1651, _1651);
    int _1771 = abs(_1685);
    float _1773 = fma(_1607, _1749, _1607);
    bool _1775 = _1747 >= 16.0;
    float _1777 = fma(_1657, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1769);
    int _1779 = abs(_1759);
    bool _1781 = _1775;
    int _1783 = as_type<int>(_1653);
    if (_1729)
    {
        float _1785 = _1663 * 0.0625;
        _1731 = _1785;
    }
    float _1787 = _1731;
    float _1789 = float(_1771);
    float _1791 = float(_1767);
    int _1793 = _1635 ? 0 : 1;
    float _1795 = _1789 * _1791;
    float _1797 = fma(_1773, _1741, _1777);
    if (_1775)
    {
        float _1799 = _1649 * 0.0625;
        _1733 = _1799;
    }
    float _1801 = _1733;
    float _1803 = _1523 + (-0.5);
    float _1805 = _1795 * (-2.0);
    int _1807 = ~_1793;
    int _1809 = _1807 + 1;
    int _1811 = _1809 + 1;
    int _1813 = _1811;
    if (_1775)
    {
        float _1815 = _1701 * 0.0625;
        _1735 = _1815;
    }
    float _1817 = _1735;
    if (!_1613)
    {
        int _1819 = ~_1793;
        int _1821 = _1819 + 1;
        _1813 = _1821;
    }
    int _1823 = _1813;
    float _1825 = fma(_1805, _1655, _1655);
    float _1827 = abs(_1801);
    bool _1829 = _1827 != 0.0;
    bool _1831 = isnan(_1827);
    bool _1833 = _1829 || _1831;
    bool _1835 = isnan(0.0);
    bool _1837 = _1833 || _1835;
    float _1839 = fma(_1593, _1805, _1593);
    float _1841 = float(_1779);
    float _1843 = fma(_1803, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1825);
    float _1845 = float(_1823);
    float _1847 = _1523 + _1521;
    float _1849 = abs(_1817);
    bool _1851 = _1849 == 0.0;
    bool _1853 = !_1837;
    bool _1855 = _1851 && _1853;
    float _1857 = fma(_1839, _1741, _1843);
    float _1859 = abs(_1817);
    bool _1861 = _1859 == 0.0;
    float _1863 = _1841 * _1845;
    float _1865 = _1847 + (-1.0);
    float _1867 = _1857 * 0.15915493667125701904296875;
    float _1869 = _1863 * (-2.0);
    float _1871 = _1521 + (-0.5);
    float _1873 = _1867 * 6.283185482025146484375;
    float _1875 = sin(_1873);
    float _1877 = _1797 * 0.15915493667125701904296875;
    float _1879 = fma(_1865, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1881 = fma(_1869, _1653, _1653);
    bool _1883 = _1837;
    float _1885 = _1867;
    if (_1855)
    {
        bool _1887 = as_type<int>(_1817) >= 0;
        _1781 = _1887;
    }
    bool _1889 = _1781;
    float _1891 = fma(_1879, _1869, _1879);
    float _1893 = fma(_1871, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1881);
    int _1895 = as_type<int>(_1893);
    int _1897 = _1889 ? (-1) : 0;
    if (_1855)
    {
        int _1899 = _1889 ? 0 : 1078530011;
        _1783 = _1899;
    }
    int _1901 = _1783;
    float _1903 = _1877 * 6.283185482025146484375;
    float _1905 = sin(_1903);
    float _1907 = _1877 * 6.283185482025146484375;
    float _1909 = cos(_1907);
    float _1911 = fma(_1891, _1741, _1893);
    if (_1855)
    {
        int _1913 = int(0x80000000) & as_type<int>(_1801);
        int _1915 = _1901 | _1913;
        _1895 = _1915;
    }
    int _1917 = _1895;
    bool _1919 = !_1837;
    bool _1921 = _1919 && _1861;
    int _1923 = _1917;
    float _1925 = as_type<float>(_1917);
    if (!_1921)
    {
        float _1927 = abs(_1801);
        bool _1929 = _1927 != as_type<float>(0x7f800000u /* inf */);
        bool _1931 = isnan(_1927);
        bool _1933 = _1929 || _1931;
        bool _1935 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1937 = _1933 || _1935;
        float _1939 = abs(_1817);
        bool _1941 = _1939 == as_type<float>(0x7f800000u /* inf */);
        float _1943 = abs(_1817);
        bool _1945 = _1943 == as_type<float>(0x7f800000u /* inf */);
        bool _1947 = !_1937;
        bool _1949 = _1945 && _1947;
        _1883 = _1937;
        if (_1949)
        {
            bool _1951 = as_type<int>(_1817) >= 0;
            _1897 = _1951 ? (-1) : 0;
        }
        int _1953 = _1897;
        if (_1949)
        {
            _1923 = 1075235812;
        }
        int _1955 = _1923;
        int _1957 = _1955;
        if (_1949)
        {
            int _1959 = ~_1953;
            int _1961 = (_1959 != 0) ? _1955 : 1061752795;
            _1957 = _1961;
        }
        int _1963 = _1957;
        float _1965 = as_type<float>(_1963);
        if (_1949)
        {
            int _1967 = int(0x80000000) & as_type<int>(_1801);
            int _1969 = _1963 | _1967;
            _1965 = as_type<float>(_1969);
        }
        float _1971 = _1965;
        bool _1973 = !_1937;
        bool _1975 = _1973 && _1941;
        _1925 = _1971;
        if (!_1975)
        {
            float _1977 = abs(_1801);
            float _1979 = abs(_1817);
            float _1981 = precise::max(_1977, _1979);
            float _1983 = abs(_1801);
            float _1985 = abs(_1817);
            float _1987 = precise::min(_1983, _1985);
            float _1989 = 1.0 / _1981;
            float _1991 = abs(_1801);
            float _1993 = abs(_1817);
            bool _1995 = _1991 > _1993;
            bool _1997 = as_type<int>(_1817) >= 0;
            float _1999 = _1987 * _1989;
            float _2001 = abs(_1801);
            float _2003 = abs(_1817);
            float _2005 = _2001 + _2003;
            float _2007 = _1999 * _1999;
            bool _2009 = _2005 > as_type<float>(0x7f800000u /* inf */);
            bool _2011 = isnan(_2005);
            bool _2013 = _2009 || _2011;
            bool _2015 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _2017 = _2013 || _2015;
            float _2019 = _2007 + 11.33538818359375;
            float _2021 = fma(_2007, _2019, 28.84246826171875);
            float _2023 = fma(_2007, _2021, 19.6966705322265625);
            float _2025 = fma(_2007, -0.82336294651031494140625, -5.674867153167724609375);
            float _2027 = fma(_2007, _2025, -6.565555095672607421875);
            float _2029 = 1.0 / _2023;
            float _2031 = _2007 * _2027;
            float _2033 = _1999 * _2031;
            float _2035 = fma(_2033, _2029, _1999);
            int _2037 = as_type<int>(_1801) & int(0x80000000);
            float _2039 = _2035;
            _1925 = _2005;
            _1883 = _2017;
            if (_1995)
            {
                float _2041 = -_2035;
                float _2043 = _2041 + 1.57079637050628662109375;
                _2039 = _2043;
            }
            float _2045 = _2039;
            int _2047 = as_type<int>(_2045);
            if (!_1997)
            {
                float _2049 = -_2045;
                float _2051 = _2049 + 3.1415927410125732421875;
                _2047 = as_type<int>(_2051);
            }
            int _2053 = _2047;
            if (!_2017)
            {
                int _2055 = _2037 | _2053;
                _1925 = as_type<float>(_2055);
            }
        }
    }
    float _2057 = _1925;
    bool _2059 = _1883;
    bool _2061 = _2059;
    if (_1729)
    {
        float _2063 = _1677 * 0.0625;
        _1737 = _2063;
    }
    float _2065 = _1737;
    float _2067 = abs(_1787);
    bool _2069 = _2067 != 0.0;
    bool _2071 = isnan(_2067);
    bool _2073 = _2069 || _2071;
    bool _2075 = isnan(0.0);
    bool _2077 = _2073 || _2075;
    float _2079 = -_2057;
    float _2081 = _1911 + _2079;
    float _2083 = _1867 * 6.283185482025146484375;
    float _2085 = cos(_2083);
    float _2087 = _1216 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2089 = abs(_2065);
    bool _2091 = _2089 == 0.0;
    bool _2093 = !_2077;
    bool _2095 = _2091 && _2093;
    float _2097 = _2081 * 0.15915493667125701904296875;
    float _2099 = abs(_2065);
    bool _2101 = _2099 == 0.0;
    float _2103 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1407);
    float _2105 = _1214 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2107 = _2097 * 6.283185482025146484375;
    float _2109 = sin(_2107);
    float _2111 = _1212 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2113 = _2103 * _2087;
    float _2115 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1435);
    float _2117 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1467);
    float _2119 = _2115 * _2105;
    float _2121 = _2097 * 6.283185482025146484375;
    float _2123 = cos(_2121);
    int _2125 = as_type<int>(_2087);
    if (_2095)
    {
        bool _2127 = as_type<int>(_2065) >= 0;
        _2061 = _2127;
    }
    bool _2129 = _2061;
    float _2131 = _2117 * _2111;
    float _2133 = _1905 * _2085;
    int _2135 = _2129 ? (-1) : 0;
    if (_2095)
    {
        int _2137 = _2129 ? 0 : 1078530011;
        _2125 = _2137;
    }
    int _2139 = _2125;
    int _2141 = _2139;
    if (_2095)
    {
        int _2143 = int(0x80000000) & as_type<int>(_1787);
        int _2145 = _2139 | _2143;
        _1885 = as_type<float>(_2145);
    }
    float _2147 = _1885;
    bool _2149 = !_2077;
    bool _2151 = _2149 && _2101;
    float _2153 = _2147;
    float _2155 = _2147;
    if (!_2151)
    {
        float _2157 = abs(_1787);
        bool _2159 = _2157 != as_type<float>(0x7f800000u /* inf */);
        bool _2161 = isnan(_2157);
        bool _2163 = _2159 || _2161;
        bool _2165 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _2167 = _2163 || _2165;
        float _2169 = abs(_2065);
        bool _2171 = _2169 == as_type<float>(0x7f800000u /* inf */);
        float _2173 = abs(_2065);
        bool _2175 = _2173 == as_type<float>(0x7f800000u /* inf */);
        bool _2177 = !_2167;
        bool _2179 = _2175 && _2177;
        if (_2179)
        {
            bool _2181 = as_type<int>(_2065) >= 0;
            _2135 = _2181 ? (-1) : 0;
        }
        int _2183 = _2135;
        if (_2179)
        {
            _2141 = 1075235812;
        }
        int _2185 = _2141;
        int _2187 = _2185;
        if (_2179)
        {
            int _2189 = ~_2183;
            int _2191 = (_2189 != 0) ? _2185 : 1061752795;
            _2187 = _2191;
        }
        int _2193 = _2187;
        if (_2179)
        {
            int _2195 = int(0x80000000) & as_type<int>(_1787);
            int _2197 = _2193 | _2195;
            _2153 = as_type<float>(_2197);
        }
        float _2199 = _2153;
        bool _2201 = !_2167;
        bool _2203 = _2201 && _2171;
        _2155 = _2199;
        if (!_2203)
        {
            float _2205 = abs(_1787);
            float _2207 = abs(_2065);
            float _2209 = precise::max(_2205, _2207);
            float _2211 = abs(_1787);
            float _2213 = abs(_2065);
            float _2215 = precise::min(_2211, _2213);
            float _2217 = 1.0 / _2209;
            float _2219 = abs(_1787);
            float _2221 = abs(_2065);
            bool _2223 = _2219 > _2221;
            bool _2225 = as_type<int>(_2065) >= 0;
            float _2227 = _2215 * _2217;
            float _2229 = _2227 * _2227;
            float _2231 = _2229 + 11.33538818359375;
            float _2233 = fma(_2229, _2231, 28.84246826171875);
            float _2235 = fma(_2229, _2233, 19.6966705322265625);
            float _2237 = fma(_2229, -0.82336294651031494140625, -5.674867153167724609375);
            float _2239 = fma(_2229, _2237, -6.565555095672607421875);
            float _2241 = 1.0 / _2235;
            float _2243 = _2229 * _2239;
            float _2245 = abs(_1787);
            float _2247 = abs(_2065);
            float _2249 = _2245 + _2247;
            float _2251 = _2227 * _2243;
            bool _2253 = _2249 > as_type<float>(0x7f800000u /* inf */);
            bool _2255 = isnan(_2249);
            bool _2257 = _2253 || _2255;
            bool _2259 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _2261 = _2257 || _2259;
            float _2263 = fma(_2251, _2241, _2227);
            int _2265 = as_type<int>(_1787) & int(0x80000000);
            float _2267 = _2263;
            _2155 = _2249;
            if (_2223)
            {
                float _2269 = -_2263;
                float _2271 = _2269 + 1.57079637050628662109375;
                _2267 = _2271;
            }
            float _2273 = _2267;
            int _2275 = as_type<int>(_2273);
            if (!_2225)
            {
                float _2277 = -_2273;
                float _2279 = _2277 + 3.1415927410125732421875;
                _2275 = as_type<int>(_2279);
            }
            int _2281 = _2275;
            if (!_2261)
            {
                int _2283 = _2265 | _2281;
                _2155 = as_type<float>(_2283);
            }
        }
    }
    float _2285 = _2155;
    float _2287 = _2285 * (-0.15915493667125701904296875);
    float _2289 = -_2119;
    float _2291 = _1875 * _2289;
    float _2293 = _1905 * _2123;
    float _2295 = _1909 * _2109;
    float _2297 = _2123 * _2085;
    float _2299 = _1905 * _2109;
    float _2301 = _1909 * _2123;
    float _2303 = _2109 * _2085;
    float _2305 = _2133 * _2119;
    float _2307 = _2287 * 6.283185482025146484375;
    float _2309 = sin(_2307);
    float _2311 = -_2295;
    float _2313 = fma(_1875, _2293, _2311);
    float _2315 = fma(_2297, _2113, _2291);
    float _2317 = fma(_1875, _2299, _2301);
    float _2319 = _1909 * _2085;
    float _2321 = fma(_2313, _2113, _2305);
    float _2323 = fma(_2303, _2131, _2315);
    float _2325 = fma(_1875, _2301, _2299);
    float _2327 = _2287 * 6.283185482025146484375;
    float _2329 = cos(_2327);
    float _2331 = fma(_2317, _2131, _2321);
    float _2333 = _1611 + _2323;
    float _2335 = -_2293;
    float _2337 = fma(_1875, _2295, _2335);
    float _2339 = _1625 + _2331;
    float _2341 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _2343 = _2333 + _2341;
    float _2345 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _2347 = _2339 + _2345;
    float _2349 = _2309 * _2343;
    float _2351 = _2329 * _2343;
    float _2353 = -_2349;
    float _2355 = fma(_2329, _2347, _2353);
    float _2357 = in.m_65.x;
    float _2359 = in.m_65.y;
    float _2361 = in.m_65.z;
    float _2363 = fma(_2309, _2347, _2351);
    float _2365 = _2355 + (*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _2367 = _2363 + (*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _2369 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2371 = _2365 + _2369;
    float _2373 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2375 = _2367 + _2373;
    float _2377 = _2371 * _2371;
    float _2379 = fma(_2375, _2375, _2377);
    float _2381 = sqrt(_2379);
    float _2383 = _283 * _2359;
    float _2385 = fma(_281, _2357, _2383);
    float _2387 = _2319 * _2119;
    float _2389 = fma(_285, _2361, _2385);
    float _2391 = fma(_2325, _2113, _2387);
    bool _2393 = _2381 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2395 = _2389 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2397 = fma(_2337, _2131, _2391);
    float _2399 = _2395 + _2397;
    float _2401 = _2397;
    float _2403 = _2361;
    float _2405 = _2391;
    float _2407 = _2381;
    if (!_2393)
    {
        _2401 = _2367;
    }
    float _2409 = _2401;
    float _2411 = _2409;
    if (!_2393)
    {
        _2403 = _2365;
    }
    float _2413 = _2403;
    float _2415 = _2413;
    if (!_2393)
    {
        _2405 = _2399;
    }
    float _2417 = _2405;
    bool _2419 = !_2393;
    float _2421 = _2417;
    if (!_2419)
    {
        float _2423 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2425 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2427 = _2381 + _2425;
        float _2429 = _2399 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2431 = rsqrt(_2379);
        float _2433 = _2427 * _2423;
        float _2435 = _2433 * 0.15915493667125701904296875;
        float _2437 = _2435 * 6.283185482025146484375;
        float _2439 = cos(_2437);
        float _2441 = _2435 * 6.283185482025146484375;
        float _2443 = sin(_2441);
        float _2445 = _2439 + (-1.0);
        float _2447 = _2445 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2449 = fma(_2443, _2429, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2451 = fma(_2399, _2439, _2447);
        float _2453 = _2431 * _2449;
        float _2455 = fma(_2375, _2453, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2457 = fma(_2371, _2453, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2421 = _2451;
        _2411 = _2455;
        _2415 = _2457;
        _2407 = _2427;
    }
    float _2459 = _2421;
    float _2461 = _2411;
    float _2463 = _2415;
    float _2465 = _2407;
    float _2467 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2469 = _2459 + _2467;
    float _2471 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2473 = _2461 + _2471;
    float _2475 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2477 = _2463 + _2475;
    float _2479 = _2469 * _2469;
    float _2481 = fma(_2473, _2473, _2479);
    float _2483 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2485 = fma(_2477, _2477, _2481);
    float _2487 = precise::max(0.0, _2483);
    float _2489 = rsqrt(_2485);
    float _2491 = sqrt(_2485);
    float _2493 = _2489 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2495 = _2473 * _2493;
    float _2497 = _2477 * _2493;
    float _2499 = -_2493;
    float _2501 = -_2487;
    float _2503 = fma(_2469, _2499, _2501);
    float _2505 = _2495 * _2495;
    float _2507 = _2497 * _2497;
    float _2509 = _2505 + _2507;
    float _2511 = sqrt(_2509);
    bool _2513 = _2511 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2515 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2517 = _2511 + _2515;
    float _2519 = _2119;
    float _2521 = _2487;
    float _2523 = _2509;
    float _2525 = _2517;
    float _2527 = _2465;
    float _2529 = _2493;
    float _2531 = _2495;
    float _2533 = _2497;
    float _2535 = _2505;
    float _2537 = _2507;
    float _2539 = _2503;
    if (_2513)
    {
        float _2541 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2519 = _2541;
    }
    float _2543 = _2519;
    if (_2513)
    {
        float _2545 = _2503 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2521 = _2545;
    }
    float _2547 = _2521;
    float _2549 = _2547;
    if (_2513)
    {
        float _2551 = rsqrt(_2509);
        _2523 = _2551;
    }
    float _2553 = _2523;
    if (_2513)
    {
        float _2555 = _2517 * _2543;
        _2525 = _2555;
    }
    float _2557 = _2525;
    if (_2513)
    {
        float _2559 = _2557 * 0.15915493667125701904296875;
        _2527 = _2559;
    }
    float _2561 = _2527;
    float _2563 = _2543;
    if (_2513)
    {
        float _2565 = _2561 * 6.283185482025146484375;
        float _2567 = sin(_2565);
        _2563 = _2567;
    }
    float _2569 = _2563;
    float _2571 = _2557;
    if (_2513)
    {
        float _2573 = _2561 * 6.283185482025146484375;
        float _2575 = cos(_2573);
        _2571 = _2575;
    }
    float _2577 = _2571;
    float _2579 = _2569;
    if (_2513)
    {
        float _2581 = fma(_2569, _2547, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2579 = _2581;
    }
    float _2583 = _2579;
    float _2585 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2587 = _2583;
    if (_2513)
    {
        float _2589 = _2553 * _2583;
        _2529 = _2589;
    }
    float _2591 = _2529;
    if (_2513)
    {
        float _2593 = _2577 + (-1.0);
        _2549 = _2593;
    }
    float _2595 = _2549;
    if (_2513)
    {
        float _2597 = _2495 * _2591;
        _2531 = _2597;
    }
    float _2599 = _2531;
    if (_2513)
    {
        float _2601 = _2497 * _2591;
        _2533 = _2601;
    }
    float _2603 = _2533;
    if (_2513)
    {
        float _2605 = _2595 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2587 = _2605;
    }
    float _2607 = _2587;
    if (_2513)
    {
        float _2609 = _2599 * _2599;
        _2535 = _2609;
    }
    float _2611 = _2535;
    if (_2513)
    {
        float _2613 = _2603 * _2603;
        _2537 = _2613;
    }
    float _2615 = _2537;
    if (_2513)
    {
        float _2617 = fma(_2503, _2577, _2607);
        _2539 = _2617;
    }
    float _2619 = _2539;
    float _2621 = fma(_2619, _2619, _2611);
    float _2623 = _2459 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2625 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2627 = fma(_2491, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2625);
    float _2629 = precise::clamp(_2627, 0.0, 1.0);
    float _2631 = _2459 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2633 = _2621 + _2615;
    float _2635 = fma(_2461, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2623);
    float _2637 = -_2629;
    float _2639 = _2637 + 1.0;
    float _2641 = fma(_2461, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2631);
    float _2643 = _2459 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2645 = fma(_2463, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2635);
    float _2647 = rsqrt(_2633);
    float _2649 = _2459 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2651 = fma(_2463, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2641);
    float _2653 = _2645 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2655 = fma(_2461, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2643);
    float _2657 = fma(_2461, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2649);
    float _2659 = _2651 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2661 = _2653 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2663 = abs(_2639);
    float _2665 = log2(_2663);
    float _2667 = fma(_2463, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2657);
    float _2669 = fma(_2463, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2655);
    float _2671 = -_2661;
    float _2673 = fma(_2671, _2585, 1.0);
    float _2675 = _2659 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2677 = _2667 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2679 = _2669 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2681 = _2647 * _2619;
    float _2683 = _2647 * _2599;
    float _2685 = fma(_2677, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2675);
    float _2687 = _2647 * _2603;
    float _2689 = log2(_2673);
    float _2691 = _2683 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2693 = fma(_2653, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2685);
    float _2695 = _2665 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2697 = -_2691;
    float _2699 = fma(_2681, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2697);
    float _2701 = fma(_2679, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2693);
    float _2703 = _2659 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2705 = exp2(_2695);
    float _2707 = -_2687;
    float _2709 = fma(_2707, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2699);
    float _2711 = _2659 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2713 = fma(_2677, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2703);
    float _2715 = fma(_2709, -0.5, 0.5);
    float _2717 = fma(_2709, 0.5, 0.5);
    float _2719 = fma(_2677, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2711);
    float _2721 = 1.0 / _2701;
    float _2723 = _2681 + 1.0;
    float _2725 = fma(_2653, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2713);
    float _2727 = fma(_2653, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2719);
    float _2729 = fma(_2717, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2731 = _2689 * 0.693147182464599609375;
    float _2733 = fma(_2679, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2727);
    float _2735 = sqrt(_2715);
    float _2737 = -_2681;
    float _2739 = fma(_2705, _2723, _2737);
    float _2741 = fma(_2679, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2725);
    float _2743 = fma(_2717, _2729, -0.212114393711090087890625);
    float _2745 = _2731 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2747 = fma(_2739, 0.5, 0.5);
    float _2749 = fma(_2717, _2743, 1.570728778839111328125);
    float _2751 = _2733 * _2721;
    float _2753 = _2741 * _2721;
    float _2755 = fma(_2751, 0.5, 0.5);
    float _2757 = fma(_2753, -0.5, 0.5);
    float _2759 = _2735 * 0.636619746685028076171875;
    float3 _6997 = float3(_2755, _2757, _2745);
    float _2761 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6997, float3(0.0), isnan(_6997)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6997, float3(0.0), isnan(_6997)), level(0.0)).x;
    float _2763 = -_2749;
    float _2765 = fma(_2759, _2763, 1.0);
    float3 _7013 = float3(_2755, _2757, _2745);
    float4 _2767 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7013, float3(0.0), isnan(_7013)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7013, float3(0.0), isnan(_7013)), level(0.0)).xyzw;
    float _2769 = _2767.x;
    float _2771 = _2767.y;
    float _2773 = _2767.z;
    float _2775 = _2767.w;
    float2 _7029 = float2(_2765, _2747);
    float3 _2779 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7029, float2(0.0), isnan(_7029)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7029, float2(0.0), isnan(_7029)), level(0.0)).xyz;
    float _2781 = _2779.x;
    float _2783 = _2779.y;
    float _2785 = _2779.z;
    float _2787 = _2395 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2789 = _1465 * _1517;
    float _2791 = _1427 * 3.883221149444580078125;
    float _2793 = _2395 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2795 = fma(_1611, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2787);
    float _2797 = _1449 * 2.0;
    float _2799 = _2791 * 0.15915493667125701904296875;
    bool _2801 = _1435 != 0.0;
    bool _2803 = isnan(_1435);
    bool _2805 = _2801 || _2803;
    bool _2807 = isnan(0.0);
    bool _2809 = _2805 || _2807;
    float _2811 = fma(_1625, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2795);
    float _2813 = -_2797;
    float _2815 = fma(_2789, _2813, _2789);
    float _2817 = fma(_1611, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2793);
    float _2819 = _2799 * 6.283185482025146484375;
    float _2821 = cos(_2819);
    float _2823 = _2811 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2825 = fma(_1449, 3.1415927410125732421875, _2815);
    float _2827 = fma(_1625, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2817);
    bool _2829 = _1407 == 0.0;
    bool _2831 = !_2809;
    bool _2833 = _2829 && _2831;
    float _2835 = _2825 * 0.15915493667125701904296875;
    bool _2837 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2839 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2841 = _2837 || _2839;
    bool _2843 = isnan(0.5);
    bool _2845 = _2841 || _2843;
    float _2847 = 1.0 / _2823;
    float _2849 = _2827 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2851 = -_1251;
    float _2853 = _2851 + _1433;
    bool _2855 = _1467 == 0.0;
    bool _2857 = _2855 && _2833;
    float _2859 = _2665 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2861 = _2849 + _2823;
    float _2863 = fma(_1379, _2853, _1251);
    out.m_67.x = _725;
    out.m_67.y = _719;
    out.m_67.z = _727;
    out.m_67.w = _705;
    float _2865 = _2835 * 6.283185482025146484375;
    float _2867 = sin(_2865);
    float _2869 = _2659 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_69.x = _703;
    out.m_69.y = _711;
    out.m_69.z = _717;
    out.m_69.w = _721;
    float _2871 = _2849;
    if (!_2845)
    {
        _2871 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _2873 = _2871;
    float _2875 = fma(_2677, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2869);
    float _2877 = in.m_71.w;
    float _2879 = _2799 * 6.283185482025146484375;
    float _2881 = sin(_2879);
    float _2883 = _2861 * _2847;
    float _2885 = _2883 * 0.5;
    out.m_73.x = _1200;
    out.m_73.y = _1204;
    float _2887 = _2885;
    if (!_2845)
    {
        float _2889 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2891 = fma(_2885, _2873, _2889);
        _2887 = _2891;
    }
    float _2893 = _2887;
    if (_2845)
    {
        _731 = 1.0;
    }
    float _2895 = _731;
    out.m_75.x = _2461;
    out.m_75.y = _2459;
    out.m_75.z = _2463;
    float _2897 = -_1385;
    float _2899 = fma(_2867, _2821, _2897);
    float _2901 = exp2(_2859);
    out.m_77.x = _1611;
    float _2903 = fma(_1379, _2899, _1385);
    float _2905 = _2903;
    float _2907 = _2895;
    if (!_2845)
    {
        _1415 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2909 = _1415;
    float _2911 = _2701 * 0.5;
    out.m_77.z = _1625;
    float _2913 = -_1387;
    float _2915 = fma(_2867, _2881, _2913);
    float _2917 = _2821;
    if (!_2845)
    {
        float _2919 = 1.0 / _2893;
        _2917 = _2919;
    }
    float _2921 = _2917;
    if (!_2845)
    {
        float _2923 = -_2909;
        float _2925 = _2923 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _733 = _2925;
    }
    float _2927 = _733;
    if (!_2857)
    {
        float _2929 = fma(_1407, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2903);
        _2905 = _2929;
    }
    float _2931 = _2905;
    float _2933 = fma(_1379, _2915, _1387);
    out.m_79.w = _2877;
    float _2935 = _2933;
    float _2937 = _2863;
    if (!_2857)
    {
        float _2939 = fma(_1467, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2933);
        _2935 = _2939;
    }
    float _2941 = _2935;
    float _2943 = _703;
    if (!_2845)
    {
        float _2945 = 1.0 / _2927;
        _2943 = _2945;
    }
    float _2947 = _2943;
    if (!_2857)
    {
        float _2949 = fma(_1435, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2863);
        _2937 = _2949;
    }
    float _2951 = _2937;
    float _2953 = -_2901;
    float _2955 = _2953 + 1.0;
    float _2957 = -_2951;
    float _2959 = _1875 * _2957;
    float _2961 = _2319 * _2951;
    float _2963 = _2133 * _2951;
    float _2965 = _2921;
    if (!_2845)
    {
        float _2967 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2969 = -_2909;
        float _2971 = fma(_2921, _2967, _2969);
        _2965 = _2971;
    }
    float _2973 = _2965;
    float _2975 = fma(_2297, _2931, _2959);
    float _2977 = _2955 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2979 = fma(_2313, _2931, _2963);
    float _2981 = fma(_2325, _2931, _2961);
    float _2983 = fma(_2303, _2941, _2975);
    float _2985 = fma(_2653, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2875);
    float _2987 = fma(_2317, _2941, _2979);
    if (!_2845)
    {
        float _2989 = _2973 * _2947;
        float _2991 = precise::clamp(_2989, 0.0, 1.0);
        _2907 = _2991;
    }
    float _2993 = _2907;
    float _2995 = _2983 * _2309;
    float _2997 = _2983 * _2329;
    float _2999 = fma(_2337, _2941, _2981);
    float _3001 = fma(_2679, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2985);
    float _3003 = -_2995;
    float _3005 = fma(_2987, _2329, _3003);
    float _3007 = fma(_2987, _2309, _2997);
    bool _3009 = _2993 > 0.0;
    bool _3011 = isnan(_2993);
    bool _3013 = _3009 || _3011;
    bool _3015 = isnan(0.0);
    bool _3017 = _3013 || _3015;
    float _3019 = _2993 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3021 = _3001 + _2701;
    float _3023 = _2733 + _2701;
    out.m_81.x = _3007;
    out.m_81.y = _2999;
    out.m_81.z = _3005;
    float _3025 = fma(_2741, -0.5, _2911);
    float _3027 = _3021 * 0.5;
    float _3029 = _3023 * 0.5;
    out.gl_Position.x = _2733;
    out.gl_Position.y = _2741;
    out.gl_Position.z = _3001;
    out.gl_Position.w = _2701;
    out.m_83.x = _3029;
    out.m_83.y = _3025;
    out.m_83.z = _3027;
    out.m_83.w = _2701;
    float _3031 = -_2977;
    float _3033 = _3031 + 1.0;
    float _3035 = _3019 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_47.x = _3035;
    float _3037 = _2977 * _2761;
    float _3039 = _2775 * _3037;
    float _3041 = _2775 * _3033;
    float _3043 = _2785 * _3037;
    float _3045 = fma(_2781, _3039, _2769);
    float _3047 = fma(_2783, _3039, _2771);
    float _3049 = fma(_2775, _3043, _2773);
    out.m_85.x = _3045;
    out.m_85.y = _3047;
    out.m_85.z = _3049;
    out.m_85.w = _3041;
    if (_3017)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _3051 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3051;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

